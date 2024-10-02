Return-Path: <linux-gpio+bounces-10665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9944398CB06
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 03:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612922860D8
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 01:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59A61FBA;
	Wed,  2 Oct 2024 01:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/eV6aX6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1192F23BB
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727834386; cv=none; b=KoP6YRSLOss1qflungM0Dm2S2LW8jvma3t1NtWZdI2ux1w4S9RfQ9uy1qBM68oq3mis47eCVbEraKmEdRsH+6OkyrJFlOMAE+vQ3LLY0uw9mIxtr8kP4raMB3bhBNnkirZYM8ruhTVUfe8NTHZLcav2Er63Tlfgk7cfYnhjWPSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727834386; c=relaxed/simple;
	bh=FTx+NIaVs91s/Wu1KCPg25XmsDqE/Kg6XhF1GaJdgDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPWUwg5gDlgDXq6C0hUjUvZj+CJBN/NICufZDp/JXCfXc/xYKNlQbHxL48kccxDEwFsGkZce35XfNMNtu5TI0doxk6C6d2uQVQMfxDAk25wvX0M3vN1T/X1iba/9ryT4pVO21USAcK/DxXOlEXJQVTqSTQ1ITMWa140FcfG/d28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/eV6aX6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727834384; x=1759370384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTx+NIaVs91s/Wu1KCPg25XmsDqE/Kg6XhF1GaJdgDg=;
  b=V/eV6aX6e6MTZ73l1eNremYIYAMcKjAouivT6NaGTCeo0AV9f0KPUdEN
   V7A109NHtg6QSuwVB1LbKAjeHdDsmltIm4+6e0AIHjM8uTt0/OBDLzr49
   0tPnX7vuePzhI/Zcva3TaN4sNJgbf0gBLj7lVqf4B/AlE/7fdGHA4BtyD
   w7X1lEWtNtw0gsP+mpxVySml00QzuDmiS9dDC6oifOQ4/PGRT0tT04IrJ
   ZKua7BIiNnjRlypB4CakQTyFnvisOgojE/I7AsUvLMP67+aN+6ovPlJ4L
   jXpxD9NNefhHYD2RGK77o9dcEEeXeeg/7TMoFteUwNkTKem4XYjTQVEjn
   Q==;
X-CSE-ConnectionGUID: RCmWNQ4nSeGULCdOkiCVyg==
X-CSE-MsgGUID: hGg3KbBsTJayNYX4S0dNtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30784650"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="30784650"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 18:59:43 -0700
X-CSE-ConnectionGUID: AKokru84Rl6tr2xGYHTjNQ==
X-CSE-MsgGUID: DkdpCe7vRBqdrI3NQf6+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78276254"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2024 18:59:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svoeR-000RQN-24;
	Wed, 02 Oct 2024 01:59:39 +0000
Date: Wed, 2 Oct 2024 09:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 8/20]
 drivers/pinctrl/freescale/pinctrl-imx1.c:17:9: warning: "PC" redefined
Message-ID: <202410020940.wGISlWfV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Esben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   d1c7bf9cb31a8e3868c5eaf3ec05b79aba4d2e33
commit: a55222b7a1327fabad71e1e61661077ab66bb98d [8/20] pinctrl: freescale: enable use with COMPILE_TEST
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410020940.wGISlWfV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020940.wGISlWfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020940.wGISlWfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx1.c:17:9: warning: "PC" redefined
      17 | #define PC      2
         |         ^~
   In file included from arch/loongarch/include/asm/processor.h:17,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from drivers/pinctrl/freescale/pinctrl-imx1.c:8:
   arch/loongarch/include/uapi/asm/ptrace.h:25:9: note: this is the location of the previous definition
      25 | #define PC              (GPR_END + 2)
         |         ^~
--
>> drivers/pinctrl/freescale/pinctrl-imx27.c:21:9: warning: "PC" redefined
      21 | #define PC 2
         |         ^~
   In file included from arch/loongarch/include/asm/processor.h:17,
                    from arch/loongarch/include/asm/thread_info.h:15,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pinctrl/freescale/pinctrl-imx27.c:13:
   arch/loongarch/include/uapi/asm/ptrace.h:25:9: note: this is the location of the previous definition
      25 | #define PC              (GPR_END + 2)
         |         ^~


vim +/PC +17 drivers/pinctrl/freescale/pinctrl-imx1.c

4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  13  
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  14  #define PAD_ID(port, pin)	((port) * 32 + (pin))
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  15  #define PA	0
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  16  #define PB	1
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03 @17  #define PC	2
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  18  #define PD	3
4877e51ed791ac drivers/pinctrl/pinctrl-imx1.c Alexander Shiyan 2014-06-03  19  

:::::: The code at line 17 was first introduced by commit
:::::: 4877e51ed791ac0098471d547f9f8f84c147e1c6 pinctrl: Add i.MX1 pincontrol driver

:::::: TO: Alexander Shiyan <shc_work@mail.ru>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

