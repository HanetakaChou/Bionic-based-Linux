/**************************************************************************
 *
 * Copyright 2014, 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Ported from drawElements Utility Library (Google, Inc.)
 * Port done by: Ian Elliott <ianelliott@google.com>
 **************************************************************************/

#include <assert.h>
#include <time.h>
#include <vulkan/vk_platform.h>

#include <time.h>

uint64_t getTimeInNanoseconds(void) {
  struct timespec currTime;
  clock_gettime(CLOCK_MONOTONIC, &currTime);
  return (uint64_t)currTime.tv_sec * 1000000 +
         ((uint64_t)currTime.tv_nsec / 1000);
}