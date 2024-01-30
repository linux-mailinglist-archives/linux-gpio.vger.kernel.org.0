Return-Path: <linux-gpio+bounces-2765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69284305C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 23:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C23471C215B0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 22:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31107EEEE;
	Tue, 30 Jan 2024 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuP5bkKk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B67866A
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706654682; cv=none; b=MFLEsXmtibV8L4gf+aXGbv6NGEzsUc1CQYavwKLCWqSaRsRf+3N5cwirG8HFfCgYlNwE/iYz48o2ojq9D4V7i52out0CfmTvUw7bK5Gph3jtXHH24ceqZgx2jTbsUeJlBd7Zf1RTWP0cS/UPm+QhkhC78CreeM1vsJXUG3wSHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706654682; c=relaxed/simple;
	bh=/2unXQqBFF1/Mxk1m/rwStwzOUMpSAKjbpvyFW4CWd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmDCmRYJ9BPHBOgQv5jkoTgv1vygNl8ZQ53guOHHUzKOAzTZEhf9FkRyTQkhqko9vGQsD2ExwtlU5GF4zyXZXKrJ9d2zIUy6c5E55EjMjxGHX96K8nv1TllQbeoKBT10aDPFCcJpgG4rlEduHJXu045+YlfItLuQXsqLLPQQZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuP5bkKk; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706654680; x=1738190680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2unXQqBFF1/Mxk1m/rwStwzOUMpSAKjbpvyFW4CWd4=;
  b=LuP5bkKkiT2GsKSq5T9wsA0yk5f9l0QfQlejkc9ok5ChYdnhLUJs140T
   x9CPPDmVr7xaoN1jnk+Q3AmYBX5FNrhbCIvezqF4PeYxCRDyZeHDVggnN
   RPQB+dMB75OPy3zUdR7CV85QoqV2X4FSQ0lJ/GG82imYBf10keiLEX8s1
   BAQqrAa7dEqFADV0R3z/TVHXthcH0jFWMsRXqM6qdm5eDcAKU4r02sBi8
   zMEyR5hthMvyPlmrFJ8B/AAyMuvf6yfEBuQq3eVyOzlt6vG/vVOCVkqJE
   YDa3y7+A+b25P135RVacsIh99rasmD9Jxshm1I+BEAg0HMvB2Iqi50fYK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403045600"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="403045600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 14:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3872821"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 14:44:39 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUwqK-0000t2-1f;
	Tue, 30 Jan 2024 22:44:36 +0000
Date: Wed, 31 Jan 2024 06:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless 2/7]
 drivers/net/wireless/ath/ath9k/hw.c:2731:9: error: unknown type name
 'gpio_desc'; use 'struct' keyword to refer to the type
Message-ID: <202401310616.wpvZVBlf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   99b6016595e9254167434ef82f4c2ed88d986452
commit: 0dd7ce9e2be9a81dc04549e8e604931c19547531 [2/7] wifi: ath9k: Obtain system GPIOS from descriptors
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310616.wpvZVBlf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310616.wpvZVBlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310616.wpvZVBlf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath9k/hw.c: In function 'ath9k_hw_gpio_cfg_soc':
>> drivers/net/wireless/ath/ath9k/hw.c:2731:9: error: unknown type name 'gpio_desc'; use 'struct' keyword to refer to the type
    2731 |         gpio_desc *gpiod;
         |         ^~~~~~~~~
         |         struct 
>> drivers/net/wireless/ath/ath9k/hw.c:2734:15: error: 'struct ath_hw' has no member named 'gpiods'
    2734 |         if (ah->gpiods[gpio])
         |               ^~
>> drivers/net/wireless/ath/ath9k/hw.c:2738:15: error: assignment to 'int *' from incompatible pointer type 'struct gpio_desc *' [-Werror=incompatible-pointer-types]
    2738 |         gpiod = devm_gpiod_get_index(ah->dev, NULL, gpio, flags);
         |               ^
>> drivers/net/wireless/ath/ath9k/hw.c:2747:33: error: passing argument 1 of 'gpiod_set_consumer_name' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2747 |         gpiod_set_consumer_name(gpiod, label);
         |                                 ^~~~~
         |                                 |
         |                                 int *
   In file included from drivers/net/wireless/ath/ath9k/hw.c:23:
   include/linux/gpio/consumer.h:168:47: note: expected 'struct gpio_desc *' but argument is of type 'int *'
     168 | int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name);
         |                             ~~~~~~~~~~~~~~~~~~^~~~
   drivers/net/wireless/ath/ath9k/hw.c:2748:11: error: 'struct ath_hw' has no member named 'gpiods'
    2748 |         ah->gpiods[gpio] = gpiod;
         |           ^~
   drivers/net/wireless/ath/ath9k/hw.c: In function 'ath9k_hw_gpio_get':
   drivers/net/wireless/ath/ath9k/hw.c:2836:22: error: 'struct ath_hw' has no member named 'gpiods'
    2836 |         } else if (ah->gpiods[gpio]) {
         |                      ^~
   drivers/net/wireless/ath/ath9k/hw.c:2837:41: error: 'struct ath_hw' has no member named 'gpiods'
    2837 |                 val = gpiod_get_value(ah->gpiods[gpio]);
         |                                         ^~
   drivers/net/wireless/ath/ath9k/hw.c: In function 'ath9k_hw_set_gpio':
   drivers/net/wireless/ath/ath9k/hw.c:2860:22: error: 'struct ath_hw' has no member named 'gpiods'
    2860 |         } else if (ah->gpiods[gpio]) {
         |                      ^~
   drivers/net/wireless/ath/ath9k/hw.c:2861:35: error: 'struct ath_hw' has no member named 'gpiods'
    2861 |                 gpiod_set_value(ah->gpiods[gpio], val);
         |                                   ^~
   cc1: some warnings being treated as errors


vim +2731 drivers/net/wireless/ath/ath9k/hw.c

  2724	
  2725	/* BSP should set the corresponding MUX register correctly.
  2726	 */
  2727	static void ath9k_hw_gpio_cfg_soc(struct ath_hw *ah, u32 gpio, bool out,
  2728					  const char *label)
  2729	{
  2730		enum gpiod_flags flags = out ? GPIOD_OUT_LOW : GPIOD_IN;
> 2731		gpio_desc *gpiod;
  2732		int err;
  2733	
> 2734		if (ah->gpiods[gpio])
  2735			return;
  2736	
  2737		/* Obtains a system specific GPIO descriptor from another GPIO controller */
> 2738		gpiod = devm_gpiod_get_index(ah->dev, NULL, gpio, flags);
  2739	
  2740		if (IS_ERR(gpiod)) {
  2741			err = PTR_ERR(gpiod);
  2742			ath_err(ath9k_hw_common(ah), "request GPIO%d failed:%d\n",
  2743				gpio, err);
  2744			return;
  2745		}
  2746	
> 2747		gpiod_set_consumer_name(gpiod, label);
  2748		ah->gpiods[gpio] = gpiod;
  2749	}
  2750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

