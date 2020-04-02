#ifndef _VK_TEXTURELOADER_DDS_H_
#define _VK_TEXTURELOADER_DDS_H_ 1

#include <stddef.h>
#include <stdint.h>

#include "../TextureLoader_DDS.h"

#include <vulkan/vulkan.h>

struct TextureLoader_SpecificHeader
{
    bool isCubeCompatible;
    VkImageType imageType;
    VkFormat format;
    VkExtent3D extent;
    uint32_t mipLevels;
    uint32_t arrayLayers;
};

struct TextureLoader_SpecificHeader TextureLoader_ToSpecificHeader(struct TextureLoader_NeutralHeader const *neutral_texture_header);

size_t TextureLoader_GetCopyableFootprints(struct TextureLoader_SpecificHeader const *vk_texture_header,
                                           VkDeviceSize optimalBufferCopyOffsetAlignment, VkDeviceSize optimalBufferCopyRowPitchAlignment,
                                           size_t NumSubresources, struct TextureLoader_MemcpyDest *pDest, VkBufferImageCopy *pRegions);

#endif