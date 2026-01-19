Return-Path: <linux-gpio+bounces-30743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE4D3B3AA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 18:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A456302AAEA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54224303CAE;
	Mon, 19 Jan 2026 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoGL3PvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9228A2D12ED
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841464; cv=none; b=QaqgUrz7+jdwkgfJjm+9W4f2pYCtazc0ZM8IiDnmzxIAX2CSakydz3cl8mIR0EcfMj95K4AS8ge0TudhKsScyRlaJnBXTlH05OhOXBL6ONUm5Whu1nJ63rBAvIFFWVpAHK3hFdk3Me5fq51LThjGuBxgYwEtah+air6b87RdYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841464; c=relaxed/simple;
	bh=veAkvtfjO28QDuLu+vXSMveaeVuBDeoPyLaNrgJBN2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JjRFbqyRCdGrESw5U90Neuz4shoXPqywEZ2Gyqhoo3EZtb3oFxknIBlWxL2DB8oXK1kfcXS/gzbNXfhXlUk7Pj3EbdyUoK5MmAsiaob8vXoBowuxcyDXH1zTyxSPtmrITPKkM3lddDBLZhT+uBr5nKTgtXdJGzTlsZiSAeA/STA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoGL3PvA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768841463; x=1800377463;
  h=date:from:to:cc:subject:message-id;
  bh=veAkvtfjO28QDuLu+vXSMveaeVuBDeoPyLaNrgJBN2k=;
  b=NoGL3PvAxdSH6s7bw/AkXWZGta26MYYTM5VtvbI2xcPjE7MfaM8wkE/C
   rdCBLJPqlK781aVXaqg5EnYbGFnqq1EOhCSB1iWYa/x4Vkd8QdwJl9Pju
   C22uIcaI7AO+LnU+zsN8UoTyIVIFn9PU4gzdKRnDmWW/vKn17IP7YByD9
   jVVVJU90Yjcp+6/Z7DLSh+TPpOs27YUOxijbaKORwgYKA3OCyWrZmc+JF
   fKeS57mhAR+K48lOra5zFZ5rVfqgFAjbBFho27rX6L2yamHCpplvqIdT+
   StAep8rFZ5ZIyYJI5qv9YoJjyR10/ag3UBC+/5Zst8ZoEefniqdfR3uRc
   A==;
X-CSE-ConnectionGUID: l7+TWVLtS4u+5oJSTJexdA==
X-CSE-MsgGUID: Cz5ugU0MTUGlTRKjzMpcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57609704"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="57609704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:51:00 -0800
X-CSE-ConnectionGUID: /kaAi1FSSrW8870CrLxSHw==
X-CSE-MsgGUID: uLU5FtQvQamflgrvddvw6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236584884"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 08:50:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsSt-00000000O4b-24nR;
	Mon, 19 Jan 2026 16:50:55 +0000
Date: Tue, 20 Jan 2026 00:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [brgl:gpio/for-current 1/2]
 drivers/gpio/gpiolib-cdev.c:2800:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202601200022.ZFwz8K6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   c7843298bf973d4bc7f4346140661e117186decc
commit: be037ec1785d76351037103ce6baddd3299606ee [1/2] gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260120/202601200022.ZFwz8K6u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200022.ZFwz8K6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200022.ZFwz8K6u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-cdev.c:2800:3: error: cannot jump from this goto statement to its label
    2800 |                 goto err_free_workqueue;
         |                 ^
   drivers/gpio/gpiolib-cdev.c:2802:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2802 |         guard(srcu)(&gdev->srcu);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:30:1: note: expanded from here
      30 | __UNIQUE_ID_guard_354
         | ^
   1 error generated.


vim +2800 drivers/gpio/gpiolib-cdev.c

  2783	
  2784	int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
  2785	{
  2786		struct gpio_chip *gc;
  2787		int ret;
  2788	
  2789		cdev_init(&gdev->chrdev, &gpio_fileops);
  2790		gdev->chrdev.owner = THIS_MODULE;
  2791		gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
  2792	
  2793		gdev->line_state_wq = alloc_ordered_workqueue("%s", WQ_HIGHPRI,
  2794							      dev_name(&gdev->dev));
  2795		if (!gdev->line_state_wq)
  2796			return -ENOMEM;
  2797	
  2798		ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
  2799		if (ret)
> 2800			goto err_free_workqueue;
  2801	
  2802		guard(srcu)(&gdev->srcu);
  2803		gc = srcu_dereference(gdev->chip, &gdev->srcu);
  2804		if (!gc) {
  2805			ret = -ENODEV;
  2806			goto err_free_cdev;
  2807		}
  2808	
  2809		gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
  2810	
  2811		return 0;
  2812	
  2813	err_free_cdev:
  2814		cdev_device_del(&gdev->chrdev, &gdev->dev);
  2815	err_free_workqueue:
  2816		destroy_workqueue(gdev->line_state_wq);
  2817		return ret;
  2818	}
  2819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

