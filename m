Return-Path: <linux-gpio+bounces-1333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4480FB6E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 00:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411981C20DD0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 23:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B4E64CEC;
	Tue, 12 Dec 2023 23:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZQ/3bB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB5AAA
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 15:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702423994; x=1733959994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+QfxIB/YVJFaRXJQyfINWQX0eIPBWDdN6JfMDJ70VU=;
  b=eZQ/3bB2iy5JtDI+hRnEOJWpKSfGzp9deWN9pxj4bTBaTCBXjrRQIlcg
   1sp2h1jVrLTce3BSg2skeGNSrxfaOML8lMJkLYNIZHDOtDAA9qjUXDvv2
   3ukOvQS7GxAwu1CvPTdtqb3uC2+GqiHEpNuYJrEdDgi8feNEADMcPpRqn
   jLZFnpdwXdK2AL4leL02ia1jwWSclh5CQN7bUCAToYe6aD/qPCenOX7S8
   GI2+AD3mtn6GNrpX7aZLGzwGR1xJT6tiGRWJdbazR4rCFjQAZrIfhstvt
   7uHhYDZB1NmVVhn60do5yE+OAiTLHFqj0IlA/1iMlG5B2d7pCbmLXO/pR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="385300650"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="385300650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 15:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897106141"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897106141"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 15:33:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDCFS-000JrM-0u;
	Tue, 12 Dec 2023 23:33:10 +0000
Date: Wed, 13 Dec 2023 07:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-descriptors-sound-misc 5/5]
 sound/soc/tegra/tegra20_ac97.c:46:33: warning: passing argument 1 of
 'gpiod_set_value' makes pointer from integer without a cast
Message-ID: <202312130748.S0Z3yEtT-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231213/202312130748.S0Z3yEtT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130748.S0Z3yEtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130748.S0Z3yEtT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/tegra/tegra20_ac97.c: In function 'tegra20_ac97_codec_reset':
>> sound/soc/tegra/tegra20_ac97.c:46:33: warning: passing argument 1 of 'gpiod_set_value' makes pointer from integer without a cast [-Wint-conversion]
      46 |         gpiod_set_value(workdata->reset_gpio, 1);
         |                         ~~~~~~~~^~~~~~~~~~~~
         |                                 |
         |                                 int
   In file included from sound/soc/tegra/tegra20_ac97.c:15:
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'int'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/tegra/tegra20_ac97.c:49:33: warning: passing argument 1 of 'gpiod_set_value' makes pointer from integer without a cast [-Wint-conversion]
      49 |         gpiod_set_value(workdata->reset_gpio, 0);
         |                         ~~~~~~~~^~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'int'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/tegra/tegra20_ac97.c: In function 'tegra20_ac97_codec_warm_reset':
>> sound/soc/tegra/tegra20_ac97.c:72:40: warning: passing argument 1 of 'gpiod_direction_output' makes pointer from integer without a cast [-Wint-conversion]
      72 |         gpiod_direction_output(workdata->sync_gpio, 1);
         |                                ~~~~~~~~^~~~~~~~~~~
         |                                        |
         |                                        int
   include/linux/gpio/consumer.h:111:46: note: expected 'struct gpio_desc *' but argument is of type 'int'
     111 | int gpiod_direction_output(struct gpio_desc *desc, int value);
         |                            ~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/tegra/tegra20_ac97.c:74:33: warning: passing argument 1 of 'gpiod_set_value' makes pointer from integer without a cast [-Wint-conversion]
      74 |         gpiod_set_value(workdata->sync_gpio, 0);
         |                         ~~~~~~~~^~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/gpio/consumer.h:122:40: note: expected 'struct gpio_desc *' but argument is of type 'int'
     122 | void gpiod_set_value(struct gpio_desc *desc, int value);
         |                      ~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/tegra/tegra20_ac97.c: In function 'tegra20_ac97_platform_probe':
>> sound/soc/tegra/tegra20_ac97.c:345:26: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
     345 |         ac97->reset_gpio = devm_gpiod_get(&pdev->dev,
         |                          ^
>> sound/soc/tegra/tegra20_ac97.c:348:24: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     348 |         if (IS_ERR(ac97->reset_gpio)) {
         |                    ~~~~^~~~~~~~~~~~
         |                        |
         |                        int
   In file included from include/linux/clk.h:12,
                    from sound/soc/tegra/tegra20_ac97.c:12:
   include/linux/err.h:59:60: note: expected 'const void *' but argument is of type 'int'
      59 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
>> sound/soc/tegra/tegra20_ac97.c:349:35: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
     349 |                 ret = PTR_ERR(ac97->reset_gpio);
         |                               ~~~~^~~~~~~~~~~~
         |                                   |
         |                                   int
   include/linux/err.h:49:61: note: expected 'const void *' but argument is of type 'int'
      49 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> sound/soc/tegra/tegra20_ac97.c:353:37: warning: passing argument 1 of 'gpiod_set_consumer_name' makes pointer from integer without a cast [-Wint-conversion]
     353 |         gpiod_set_consumer_name(ac97->reset_gpio, "codec-reset");
         |                                 ~~~~^~~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/gpio/consumer.h:168:47: note: expected 'struct gpio_desc *' but argument is of type 'int'
     168 | int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
         |                             ~~~~~~~~~~~~~~~~~~^~~~
   sound/soc/tegra/tegra20_ac97.c:355:25: warning: assignment to 'int' from 'struct gpio_desc *' makes integer from pointer without a cast [-Wint-conversion]
     355 |         ac97->sync_gpio = devm_gpiod_get(&pdev->dev,
         |                         ^
   sound/soc/tegra/tegra20_ac97.c:358:24: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
     358 |         if (IS_ERR(ac97->sync_gpio)) {
         |                    ~~~~^~~~~~~~~~~
         |                        |
         |                        int
   include/linux/err.h:59:60: note: expected 'const void *' but argument is of type 'int'
      59 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
   sound/soc/tegra/tegra20_ac97.c:359:35: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
     359 |                 ret = PTR_ERR(ac97->sync_gpio);
         |                               ~~~~^~~~~~~~~~~
         |                                   |
         |                                   int
   include/linux/err.h:49:61: note: expected 'const void *' but argument is of type 'int'
      49 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
   sound/soc/tegra/tegra20_ac97.c:363:37: warning: passing argument 1 of 'gpiod_set_consumer_name' makes pointer from integer without a cast [-Wint-conversion]
     363 |         gpiod_set_consumer_name(ac97->sync_gpio, "codec-sync");
         |                                 ~~~~^~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/gpio/consumer.h:168:47: note: expected 'struct gpio_desc *' but argument is of type 'int'
     168 | int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
         |                             ~~~~~~~~~~~~~~~~~~^~~~


vim +/gpiod_set_value +46 sound/soc/tegra/tegra20_ac97.c

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
    62	static void tegra20_ac97_codec_warm_reset(struct snd_ac97 *ac97)
    63	{
    64		u32 readback;
    65		unsigned long timeout;
    66	
    67		/*
    68		 * although sync line is driven by the DAC pad group warm reset using
    69		 * the controller cmd is not working, have to toggle sync line
    70		 * manually.
    71		 */
  > 72		gpiod_direction_output(workdata->sync_gpio, 1);
    73		udelay(2);
    74		gpiod_set_value(workdata->sync_gpio, 0);
    75		udelay(2);
    76	
    77		timeout = jiffies + msecs_to_jiffies(100);
    78	
    79		do {
    80			regmap_read(workdata->regmap, TEGRA20_AC97_STATUS1, &readback);
    81			if (readback & TEGRA20_AC97_STATUS1_CODEC1_RDY)
    82				break;
    83			usleep_range(1000, 2000);
    84		} while (!time_after(jiffies, timeout));
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

