Return-Path: <linux-gpio+bounces-1343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBDC810B1A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 08:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9D91F21683
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 07:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8267217751;
	Wed, 13 Dec 2023 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THR9wNEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11CE120
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 23:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702451518; x=1733987518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wv2VcEiu8/TZx7vPxNTFFPQFsqN1ltE7M9wiYMdAhw=;
  b=THR9wNEr13dJPhHBORSB0+NjfV0a88gakv5fCjSSPf63bnj+qTbtKeIX
   jv2qcZc2hkMkfebwMIUjP9BkNJ4IazHlpxnLWUoqt41WqVd9RFiJsdVtU
   LMKYoT98HkPsOdPUfhw4U9pTAx1o3X3l4M9DkPGqn/z/ZiQi2K5WNNix/
   c2vIafQtpJsvrPZAiU3xI2OaSESvLpLCUhsxqrSsgp8DxPc8LZZ0qe09C
   2XK6IXEFbFujw5Lu1A4QKQ2BloNXp7IZoxBf2tHSo9mSEKgC3/7qOf7GT
   NsYytkLyTmnLQBPO+tcq+dZ74TPWyXUd5W7UrPX7P3RSq1R1az46nH1t3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8309963"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="8309963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 23:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947078302"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="947078302"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 23:11:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDJPM-000KBj-0Y;
	Wed, 13 Dec 2023 07:11:52 +0000
Date: Wed, 13 Dec 2023 15:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-descriptors-sound-misc 5/5]
 sound/soc/tegra/tegra20_ac97.c:46:18: warning: incompatible integer to
 pointer conversion passing 'int' to parameter of type 'struct gpio_desc *'
Message-ID: <202312131517.ksxVggg2-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231213/202312131517.ksxVggg2-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131517.ksxVggg2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131517.ksxVggg2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/tegra/tegra20_ac97.c:46:18: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->reset_gpio, 1);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
   sound/soc/tegra/tegra20_ac97.c:49:18: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->reset_gpio, 0);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
   sound/soc/tegra/tegra20_ac97.c:72:25: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_direction_output(workdata->sync_gpio, 1);
                                  ^~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:111:46: note: passing argument to parameter 'desc' here
   int gpiod_direction_output(struct gpio_desc *desc, int value);
                                                ^
   sound/soc/tegra/tegra20_ac97.c:74:18: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_value(workdata->sync_gpio, 0);
                           ^~~~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:122:40: note: passing argument to parameter 'desc' here
   void gpiod_set_value(struct gpio_desc *desc, int value);
                                          ^
>> sound/soc/tegra/tegra20_ac97.c:345:19: warning: incompatible pointer to integer conversion assigning to 'int' from 'struct gpio_desc *' [-Wint-conversion]
           ac97->reset_gpio = devm_gpiod_get(&pdev->dev,
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/tegra/tegra20_ac97.c:348:13: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           if (IS_ERR(ac97->reset_gpio)) {
                      ^~~~~~~~~~~~~~~~
   include/linux/err.h:59:60: note: passing argument to parameter 'ptr' here
   static inline bool __must_check IS_ERR(__force const void *ptr)
                                                              ^
   sound/soc/tegra/tegra20_ac97.c:349:17: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                   ret = PTR_ERR(ac97->reset_gpio);
                                 ^~~~~~~~~~~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   sound/soc/tegra/tegra20_ac97.c:353:26: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_consumer_name(ac97->reset_gpio, "codec-reset");
                                   ^~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:168:47: note: passing argument to parameter 'desc' here
   int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
                                                 ^
   sound/soc/tegra/tegra20_ac97.c:355:18: warning: incompatible pointer to integer conversion assigning to 'int' from 'struct gpio_desc *' [-Wint-conversion]
           ac97->sync_gpio = devm_gpiod_get(&pdev->dev,
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/tegra/tegra20_ac97.c:358:13: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
           if (IS_ERR(ac97->sync_gpio)) {
                      ^~~~~~~~~~~~~~~
   include/linux/err.h:59:60: note: passing argument to parameter 'ptr' here
   static inline bool __must_check IS_ERR(__force const void *ptr)
                                                              ^
   sound/soc/tegra/tegra20_ac97.c:359:17: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
                   ret = PTR_ERR(ac97->sync_gpio);
                                 ^~~~~~~~~~~~~~~
   include/linux/err.h:49:61: note: passing argument to parameter 'ptr' here
   static inline long __must_check PTR_ERR(__force const void *ptr)
                                                               ^
   sound/soc/tegra/tegra20_ac97.c:363:26: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct gpio_desc *' [-Wint-conversion]
           gpiod_set_consumer_name(ac97->sync_gpio, "codec-sync");
                                   ^~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:168:47: note: passing argument to parameter 'desc' here
   int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
                                                 ^
   12 warnings generated.


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

