Return-Path: <linux-gpio+bounces-25688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AECB45DCD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 18:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7199B63E8E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 16:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4261F61C;
	Fri,  5 Sep 2025 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SugGAY0i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA45537F8
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089120; cv=none; b=SOesbTVcwO6wu4Kl1F5JtUVely0TXwUSrsAB7KuhH4/DYK0tE/zLDkjmcJPHRb/1DaLwdU9JkoHtGeRwj7yFc+nzrl226eLTE8x7mXw319814URw0Au330Q/kXMal+O8P2W1YexEprsn3bkNcTgB2b5QFyy6FXU8UQ+74pVEk+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089120; c=relaxed/simple;
	bh=9QBRrvW6PmncpOdYH8hcxPkHEAlQQ3fdIYF1QbiuVhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmKrnRMlc1TPy5VXOw4Gy+n0/hW8sWutAEJRXkZ7yZZN+nVNEHgMNVnQXit2d27N3Hb/gYEhK7qc8CKGmY4deonz4QMKJquBWlUbce97dHN5TkPmBmI9rskZFN4j14U0Gy0w/LakkEcjDngjlD3mSda1mzt5ukQ4mWCCCx7GeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SugGAY0i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757089117; x=1788625117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QBRrvW6PmncpOdYH8hcxPkHEAlQQ3fdIYF1QbiuVhQ=;
  b=SugGAY0iQalBJ8dW5Xx4cTxDi2S46CzMtPw3P3meez1px6PcbwUVsj4K
   +W0qkHr0AgBF7wsAAyZHmlSPcX3XV4GRgkpLgeJtZFgFnPB0VAP8SQ0Xf
   f8oYxtbnyA/Wdi8ZPFIdxk1xZ6EblIbEDQXyT3rBaHUEMmPe98okiaQRD
   QntCrRazV+yAmdLEfkFOy8JfHh6Hu8yGHkLSXwsceVHnDi1seC9Exiqzf
   9ATXHgbnLGcPllp6V4r2ms2xInUYpQlhAK00vP9DCeKpQhAO0HIm1Qqmq
   YPnHghBeiV/OWZAZ4sAHdN00w08c4lbfY1JLvyGZ/dzhByHxwFBB+tdce
   w==;
X-CSE-ConnectionGUID: TqIdRqBsQEWFa7o29wPNKA==
X-CSE-MsgGUID: nVigWdJ/QxyLJGF8IE6kSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58476033"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="58476033"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 09:18:37 -0700
X-CSE-ConnectionGUID: /y+nDpffRvqxaNk+iDb81Q==
X-CSE-MsgGUID: 8EL30heDT/OTrWdBIy18bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172549633"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2025 09:18:36 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuZ8z-0000c5-2F;
	Fri, 05 Sep 2025 16:18:33 +0000
Date: Sat, 6 Sep 2025 00:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 20/28] drivers/gpio/gpio-brcmstb.c:509:27: warning:
 variable 'gc' set but not used
Message-ID: <202509060000.Rs09YhdM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   46880c17e85d6822b8c45c226dc932dae157cc07
commit: 967e3cee02c1f72c158066cb1b1ec5192aca82b5 [20/28] gpio: brcmstb: use new generic GPIO chip API
config: arm-randconfig-004-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060000.Rs09YhdM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060000.Rs09YhdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060000.Rs09YhdM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-brcmstb.c: In function 'brcmstb_gpio_quiesce':
>> drivers/gpio/gpio-brcmstb.c:509:27: warning: variable 'gc' set but not used [-Wunused-but-set-variable]
     509 |         struct gpio_chip *gc;
         |                           ^~


vim +/gc +509 drivers/gpio/gpio-brcmstb.c

4714221b0c62e6 Doug Berger         2017-10-24  504  
4714221b0c62e6 Doug Berger         2017-10-24  505  static void brcmstb_gpio_quiesce(struct device *dev, bool save)
4714221b0c62e6 Doug Berger         2017-10-24  506  {
4714221b0c62e6 Doug Berger         2017-10-24  507  	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
4714221b0c62e6 Doug Berger         2017-10-24  508  	struct brcmstb_gpio_bank *bank;
4714221b0c62e6 Doug Berger         2017-10-24 @509  	struct gpio_chip *gc;
4714221b0c62e6 Doug Berger         2017-10-24  510  	u32 imask;
4714221b0c62e6 Doug Berger         2017-10-24  511  
4714221b0c62e6 Doug Berger         2017-10-24  512  	/* disable non-wake interrupt */
4714221b0c62e6 Doug Berger         2017-10-24  513  	if (priv->parent_irq >= 0)
4714221b0c62e6 Doug Berger         2017-10-24  514  		disable_irq(priv->parent_irq);
4714221b0c62e6 Doug Berger         2017-10-24  515  
4714221b0c62e6 Doug Berger         2017-10-24  516  	list_for_each_entry(bank, &priv->bank_list, node) {
967e3cee02c1f7 Bartosz Golaszewski 2025-09-05  517  		gc = &bank->chip.gc;
4714221b0c62e6 Doug Berger         2017-10-24  518  
4714221b0c62e6 Doug Berger         2017-10-24  519  		if (save)
4714221b0c62e6 Doug Berger         2017-10-24  520  			brcmstb_gpio_bank_save(priv, bank);
4714221b0c62e6 Doug Berger         2017-10-24  521  
4714221b0c62e6 Doug Berger         2017-10-24  522  		/* Unmask GPIOs which have been flagged as wake-up sources */
4714221b0c62e6 Doug Berger         2017-10-24  523  		if (priv->parent_wake_irq)
4714221b0c62e6 Doug Berger         2017-10-24  524  			imask = bank->wake_active;
4714221b0c62e6 Doug Berger         2017-10-24  525  		else
4714221b0c62e6 Doug Berger         2017-10-24  526  			imask = 0;
967e3cee02c1f7 Bartosz Golaszewski 2025-09-05  527  		gpio_generic_write_reg(&bank->chip,
967e3cee02c1f7 Bartosz Golaszewski 2025-09-05  528  				       priv->reg_base + GIO_MASK(bank->id),
4714221b0c62e6 Doug Berger         2017-10-24  529  				       imask);
4714221b0c62e6 Doug Berger         2017-10-24  530  	}
4714221b0c62e6 Doug Berger         2017-10-24  531  }
4714221b0c62e6 Doug Berger         2017-10-24  532  

:::::: The code at line 509 was first introduced by commit
:::::: 4714221b0c62e6dc3f7ac31d1f50478f16259e71 gpio: brcmstb: implement suspend/resume/shutdown

:::::: TO: Doug Berger <opendmb@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

