#include <cstdint>
#include <cstddef>
#include "dng_area_task.h"
#include "dng_rect.h"
#include "dng_point.h"

extern "C" {
    /*
     * The blob looks for this 4-argument symbol.
     * We define it here to satisfy the linker.
     */
    void _ZN13dng_area_task15ProcessOnThreadEjRK8dng_rectRK9dng_pointP17dng_abort_sniffer(
        dng_area_task* instance,
        uint32_t threadIndex,
        const dng_rect &area,
        const dng_point &tileSize,
        dng_abort_sniffer *sniffer) 
    {
        // Forward to the real 5-argument method in libdng_sdk.so
        // Pass nullptr for 'progress' as the blob doesn't provide it.
        instance->ProcessOnThread(threadIndex, area, tileSize, sniffer, nullptr);
    }
}
