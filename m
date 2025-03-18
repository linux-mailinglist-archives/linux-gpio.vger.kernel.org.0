Return-Path: <linux-gpio+bounces-17715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F5A668B2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 05:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B9B07A3BF9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 04:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DF11AB6D8;
	Tue, 18 Mar 2025 04:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzrei66P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244371A8F98;
	Tue, 18 Mar 2025 04:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742273552; cv=none; b=AlNeySM6Eek/0UXS4i5s8ZB/JX5LUrA/4JejGgvRClGE5i4D2ehTnI3zNslzqGqCHnNiU6isULrNW+2VO1QKhZ9Dv7pving9xH+8o5Ys28hdN3y0q9N7pMrn2gF9uDBhmtyv3sGGQ7S7CMhjBLWsaAmva/Tc+LRfwcclS4ySxkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742273552; c=relaxed/simple;
	bh=jwmw579aSYTFXHfMays7upzplpwnyKbHOToaZXX9ttw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU8gVBjAvnHDkTTt0gEIN8hwkAiWp8ZqWPiSHUy1bEni2OJ7G+3w1FqmJLtbzQj68hlnFSKJ14kUaexxHdI+79CwAfPwG2qNWpfHzlwAXGuD4EIg3cjTETmHpo9rOPJ5HyMPPadkCyj7/sOdbFCLNzBinYYXgJsGjFqO6zbHjO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzrei66P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742273549; x=1773809549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jwmw579aSYTFXHfMays7upzplpwnyKbHOToaZXX9ttw=;
  b=lzrei66PjmG5TguPJa69RhUnKFJfMVljKZLjIae3O4m7g3Bv+DXRCNDb
   MV+eiQeeXHMlK8vh6rPLBEKDzgpVqvh14IvhDADSNjQcl/mS3BhFZkQcn
   6Z0s225nAmz8HxEeDtuHb1Pik1OVIQC2+F2YU5zrUfafLKIG9ky86YmXz
   ShrzvRD7u26AUHuv4z1c9nrNlSd7g6WadxNK1bhzVSNE4g1LRq6ens20R
   t096qbiCs2y00on5upf6BHp4sn91vSjzn+0JKZ7U9j5hRmCinoTmMF33m
   2jYvRTvqjFGTXCgDjdba1cE3WSikRyKZhRBkFmO55z5h2yzU4qjHN/33w
   Q==;
X-CSE-ConnectionGUID: chAaBZlWTr65FcTTEmIDIg==
X-CSE-MsgGUID: L1YAHPyEQC+Ejx07RjYVTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43564794"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43564794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 21:52:28 -0700
X-CSE-ConnectionGUID: ncnToWrBQJm/Ljj+am+XsA==
X-CSE-MsgGUID: Vp4MccrXQnie2/DSFVBfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122648535"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2025 21:52:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuOwB-000DPY-1y;
	Tue, 18 Mar 2025 04:52:23 +0000
Date: Tue, 18 Mar 2025 12:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Patrick Williams <patrick@stwcx.xyz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for level-triggered interrupts
Message-ID: <202503181231.ZqKVm0Z8-lkp@intel.com>
References: <20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425@gmail.com>

Hi Potin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Potin-Lai/gpio-pca953x-Add-support-for-level-triggered-interrupts/20250318-004441
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250318-gpio-pca953x-level-triggered-irq-v1-1-0c4943d92425%40gmail.com
patch subject: [PATCH] gpio: pca953x: Add support for level-triggered interrupts
config: x86_64-buildonly-randconfig-002-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181231.ZqKVm0Z8-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181231.ZqKVm0Z8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181231.ZqKVm0Z8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-pca953x.c:887:43: warning: address of array 'chip->irq_trig_level_low' will always evaluate to 'true' [-Wpointer-bool-conversion]
     887 |         if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
         |                                           ~~~~~~~^~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-pca953x.c:887:13: warning: address of array 'chip->irq_trig_level_high' will always evaluate to 'true' [-Wpointer-bool-conversion]
     887 |         if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
         |             ~~~~~~~^~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +887 drivers/gpio/gpio-pca953x.c

   841	
   842	static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pending)
   843	{
   844		struct gpio_chip *gc = &chip->gpio_chip;
   845		DECLARE_BITMAP(reg_direction, MAX_LINE);
   846		DECLARE_BITMAP(old_stat, MAX_LINE);
   847		DECLARE_BITMAP(cur_stat, MAX_LINE);
   848		DECLARE_BITMAP(new_stat, MAX_LINE);
   849		DECLARE_BITMAP(trigger, MAX_LINE);
   850		DECLARE_BITMAP(edges, MAX_LINE);
   851		int ret;
   852	
   853		if (chip->driver_data & PCA_PCAL) {
   854			/* Read the current interrupt status from the device */
   855			ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
   856			if (ret)
   857				return false;
   858	
   859			/* Check latched inputs and clear interrupt status */
   860			ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
   861			if (ret)
   862				return false;
   863	
   864			/* Apply filter for rising/falling edge selection */
   865			bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise, cur_stat, gc->ngpio);
   866	
   867			bitmap_and(pending, new_stat, trigger, gc->ngpio);
   868	
   869			return !bitmap_empty(pending, gc->ngpio);
   870		}
   871	
   872		ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
   873		if (ret)
   874			return false;
   875	
   876		/* Remove output pins from the equation */
   877		pca953x_read_regs(chip, chip->regs->direction, reg_direction);
   878	
   879		bitmap_copy(old_stat, chip->irq_stat, gc->ngpio);
   880	
   881		bitmap_and(new_stat, cur_stat, reg_direction, gc->ngpio);
   882		bitmap_xor(cur_stat, new_stat, old_stat, gc->ngpio);
   883		bitmap_and(trigger, cur_stat, chip->irq_mask, gc->ngpio);
   884	
   885		bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
   886	
 > 887		if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
   888			if (bitmap_empty(trigger, gc->ngpio))
   889				return false;
   890		}
   891	
   892		bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
   893		bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
   894		bitmap_or(edges, old_stat, cur_stat, gc->ngpio);
   895		bitmap_and(pending, edges, trigger, gc->ngpio);
   896	
   897		bitmap_and(cur_stat, new_stat, chip->irq_trig_level_high, gc->ngpio);
   898		bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
   899		bitmap_or(pending, pending, cur_stat, gc->ngpio);
   900	
   901		bitmap_complement(cur_stat, new_stat, gc->ngpio);
   902		bitmap_and(cur_stat, cur_stat, reg_direction, gc->ngpio);
   903		bitmap_and(old_stat, cur_stat, chip->irq_trig_level_low, gc->ngpio);
   904		bitmap_and(old_stat, old_stat, chip->irq_mask, gc->ngpio);
   905		bitmap_or(pending, pending, old_stat, gc->ngpio);
   906	
   907		return !bitmap_empty(pending, gc->ngpio);
   908	}
   909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

