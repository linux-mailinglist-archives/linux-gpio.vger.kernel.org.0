Return-Path: <linux-gpio+bounces-23610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D8B0CE95
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 02:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B01C5438AD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 00:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2958010F2;
	Tue, 22 Jul 2025 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/SRwLQ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F421A2D
	for <linux-gpio@vger.kernel.org>; Tue, 22 Jul 2025 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142859; cv=none; b=WsWbUWwMYCNu+XgoJ+Cfnq3O1KXRffBtIvgJ/yqfHPxGmTDPrfL6hNp8Gt1nNQpdyQzy1Fr3Cb5sdZ15K/kMrWWeDR/K/u6x48keOugLLmkbN/0shrkjq2e1/5XC769LG5/XC+VmN7x1egqzwlb4LMBGAqeII7LOcRehDdLelfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142859; c=relaxed/simple;
	bh=r5JTRxD1YVK+h8+f13Ea98yoby+ZTTYZME4YT5f4g+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YnDZIqlsTDCGzbjcUoGB3Nr/9Dbm7vblu+cdqTkcKvzy88KhOmt02Ryfats6GOytAB/IdqMgaPay0ebdhBo75gVJOFc3BUJbB3Cc1KTLLxyy9sQL0kP/mLp5E6/7rfa6H4Yc1CHk8zZZRLS47jYUEtDn3B6LZqzXrR86/Ii2EwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/SRwLQ3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753142858; x=1784678858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r5JTRxD1YVK+h8+f13Ea98yoby+ZTTYZME4YT5f4g+I=;
  b=J/SRwLQ33EMG9V3xUX5LhSNVj/YWu0by+etzWhSOQJoLTqAbJLLwCspp
   TW7rWiVy20GSEM+rTucGsA1dy4vpTCtQIIa9B1MkyvcqwwpLa1qywPWjL
   jZYXUMUzSSVZigdFN/Q4Ywpcp7qQC3s27Eke8jPyoW9LO1P3ySgeAkACW
   IQ21AwT3u9XrOaFHVrbvhf/ZKu/qtK17Gdxm49Kw4V5An1hzJv2XJk8n7
   Yl77HRqBHQ8Ivo2dlUmvbO/TFSLLUVEKmnoMkaZpt34CdHy8FkDSPPdtj
   oawZWsb8ahbllpO2rptrpgnvWQlXiN5qemgtbrdqPunGF6tIA8XbTkf2S
   Q==;
X-CSE-ConnectionGUID: c6DWSH6WRdaMVkCWYc3xSQ==
X-CSE-MsgGUID: 35w8mG6dTQ6dxfk1CTRDUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66721014"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="66721014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 17:07:38 -0700
X-CSE-ConnectionGUID: JmMHtf1ZRM6Kxh6KSbnaIQ==
X-CSE-MsgGUID: f6T5QTbWSx2MWYIIzE7SoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159026289"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2025 17:07:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue0Xe-000HGl-3A;
	Tue, 22 Jul 2025 00:07:34 +0000
Date: Tue, 22 Jul 2025 08:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 4/4] arch/arm/common/sa1111.c:619:26: error:
 incompatible function pointer types assigning to 'int (*)(struct gpio_chip
 *, unsigned long *, unsigned long *)' from 'void (struct gpio_chip *,
 unsigned long *, unsigned long *)'
Message-ID: <202507220807.48h0ne5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   c52c31b44884586b6486590691c444ac990f1f56
commit: c52c31b44884586b6486590691c444ac990f1f56 [4/4] treewide: rename GPIO set callbacks back to their original names
config: arm-jornada720_defconfig (https://download.01.org/0day-ci/archive/20250722/202507220807.48h0ne5W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220807.48h0ne5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220807.48h0ne5W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/common/sa1111.c:619:26: error: incompatible function pointer types assigning to 'int (*)(struct gpio_chip *, unsigned long *, unsigned long *)' from 'void (struct gpio_chip *, unsigned long *, unsigned long *)' [-Wincompatible-function-pointer-types]
     619 |         sachip->gc.set_multiple = sa1111_gpio_set_multiple;
         |                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +619 arch/arm/common/sa1111.c

17cf50116e10af Russell King        2016-08-31  608  
17cf50116e10af Russell King        2016-08-31  609  static int sa1111_setup_gpios(struct sa1111 *sachip)
17cf50116e10af Russell King        2016-08-31  610  {
17cf50116e10af Russell King        2016-08-31  611  	sachip->gc.label = "sa1111";
17cf50116e10af Russell King        2016-08-31  612  	sachip->gc.parent = sachip->dev;
17cf50116e10af Russell King        2016-08-31  613  	sachip->gc.owner = THIS_MODULE;
17cf50116e10af Russell King        2016-08-31  614  	sachip->gc.get_direction = sa1111_gpio_get_direction;
17cf50116e10af Russell King        2016-08-31  615  	sachip->gc.direction_input = sa1111_gpio_direction_input;
17cf50116e10af Russell King        2016-08-31  616  	sachip->gc.direction_output = sa1111_gpio_direction_output;
17cf50116e10af Russell King        2016-08-31  617  	sachip->gc.get = sa1111_gpio_get;
c52c31b4488458 Bartosz Golaszewski 2025-07-17  618  	sachip->gc.set = sa1111_gpio_set;
17cf50116e10af Russell King        2016-08-31 @619  	sachip->gc.set_multiple = sa1111_gpio_set_multiple;
17cf50116e10af Russell King        2016-08-31  620  	sachip->gc.to_irq = sa1111_gpio_to_irq;
17cf50116e10af Russell King        2016-08-31  621  	sachip->gc.base = -1;
17cf50116e10af Russell King        2016-08-31  622  	sachip->gc.ngpio = 18;
17cf50116e10af Russell King        2016-08-31  623  
17cf50116e10af Russell King        2016-08-31  624  	return devm_gpiochip_add_data(sachip->dev, &sachip->gc, sachip);
17cf50116e10af Russell King        2016-08-31  625  }
17cf50116e10af Russell King        2016-08-31  626  

:::::: The code at line 619 was first introduced by commit
:::::: 17cf50116e10affaadfee9af2253c841f7ac0623 ARM: sa1111: implement a gpio_chip for SA1111 GPIOs

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

