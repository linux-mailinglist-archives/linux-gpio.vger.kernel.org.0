Return-Path: <linux-gpio+bounces-1344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70876810B6D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 08:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC5C2825AC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 07:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4453219443;
	Wed, 13 Dec 2023 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo3hVKaO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB64BD
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 23:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702452313; x=1733988313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vd1NwQkeVeTY+UCmslYDaNtM9lYRymadpH08NVeShlg=;
  b=Bo3hVKaOSvr5sNGLLVe3cKCA3xiAGeIdG+pYMEEvE3X8hgwGSpig2JNE
   Dco7afhk15CqzhCIo4N1zUZvNk6xQLvr9tEtaNIMqKJ2TMpaX4r0xnCcX
   c9mFCDUvFhHRZApwnHog1mmRTQOAcNoACIfoW3RfCnoawnU/z3ggdtMEB
   pMgdf65XNQAywdo0sDFLLWQbvmJh06Xz+u1LPImngkcQ+JxWxUJ1fCrZn
   RwJT3pXw/dqhCicgKtX4QYOeYQFUVq/4mIZVhCbvcFbTCJsCuMzKrClKl
   aLqzM7Qlms0hVfLHBhjtNbn+Klr1SUgCmtp5/yVQIUnbom8pV/yOIP7KU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392099248"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="392099248"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 23:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="844212176"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="844212176"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Dec 2023 23:25:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDJcC-000KCM-0j;
	Wed, 13 Dec 2023 07:25:08 +0000
Date: Wed, 13 Dec 2023 15:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-descriptors-sound-misc 5/5]
 sound/soc/tegra/tegra20_ac97.c:46:18: error: incompatible integer to pointer
 conversion passing 'int' to parameter of type 'struct gpio_desc *'
Message-ID: <202312131540.fKLvGlTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/gpio-descriptors-sound-misc
head:   cbde31b95f12d0b3059938194b704f40cdd55540
commit: cbde31b95f12d0b3059938194b704f40cdd55540 [5/5] ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231213/202312131540.fKLvGlTn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131540.fKLvGlTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131540.fKLvGlTn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/tegra/tegra20_ac97.c:46:18: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->reset_gpio, 1);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
   sound/soc/tegra/tegra20_ac97.c:49:18: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->reset_gpio, 0);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
   sound/soc/tegra/tegra20_ac97.c:72:25: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_direction_output(workdata->sync_gpio, 1);
                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:111:46: note: passing argument to parameter 'desc' here
   int gpiod_direction_output(struct gpio_desc *desc, int value);
                                                ^
   sound/soc/tegra/tegra20_ac97.c:74:18: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->sync_gpio, 0);
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
>> sound/soc/tegra/tegra20_ac97.c:345:19: error: incompatible pointer to integer conversion assigning to 'int' from 'struct gpio_desc *' [-Wint-conversion]
           ac97->reset_gpio = devm_gpiod_get(&pdev->dev,
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/tegra/tegra20_ac97.c:348:13: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           if (IS_ERR(ac97->reset_gpio)) {
                      ^~~~~~~~~~~~~~~~
   include/linux/err.h:59:60: note: passing argument to parameter 'ptr' here
   static inline bool __must_check IS_ERR(__force const void *ptr)
                                                              ^
   sound/soc/tegra/tegra20_ac97.c:349:17: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                   ret = PTR_ERR(ac97->reset_gpio);
                                 ^~~~~~~~~~~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   sound/soc/tegra/tegra20_ac97.c:353:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_consumer_name(ac97->reset_gpio, "codec-reset");
                                   ^~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:168:47: note: passing argument to parameter 'desc' here
   int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
                                                 ^
   sound/soc/tegra/tegra20_ac97.c:355:18: error: incompatible pointer to integer conversion assigning to 'int' from 'struct gpio_desc *' [-Wint-conversion]
           ac97->sync_gpio = devm_gpiod_get(&pdev->dev,
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra20_ac97.c:358:13: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           if (IS_ERR(ac97->sync_gpio)) {
                      ^~~~~~~~~~~~~~~
   include/linux/err.h:59:60: note: passing argument to parameter 'ptr' here
   static inline bool __must_check IS_ERR(__force const void *ptr)
                                                              ^
   sound/soc/tegra/tegra20_ac97.c:359:17: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                   ret = PTR_ERR(ac97->sync_gpio);
                                 ^~~~~~~~~~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   sound/soc/tegra/tegra20_ac97.c:363:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_consumer_name(ac97->sync_gpio, "codec-sync");
                                   ^~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:168:47: note: passing argument to parameter 'desc' here
   int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
                                                 ^
   12 errors generated.


vim +46 sound/soc/tegra/tegra20_ac97.c

    35	
    36	static void tegra20_ac97_codec_reset(struct snd_ac97 *ac97)
    37	{
    38		u32 readback;
    39		unsigned long timeout;
    40	
    41		/*
    42		 * The reset line is not driven by DAC pad group, have to toggle GPIO.
    43		 * The RESET line is active low but this is abstracted by the GPIO
    44		 * library.
    45		 */
  > 46		gpiod_set_value(workdata->reset_gpio, 1);
    47		udelay(2);
    48	
    49		gpiod_set_value(workdata->reset_gpio, 0);
    50		udelay(2);
    51	
    52		timeout = jiffies + msecs_to_jiffies(100);
    53	
    54		do {
    55			regmap_read(workdata->regmap, TEGRA20_AC97_STATUS1, &readback);
    56			if (readback & TEGRA20_AC97_STATUS1_CODEC1_RDY)
    57				break;
    58			usleep_range(1000, 2000);
    59		} while (!time_after(jiffies, timeout));
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

