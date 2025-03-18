Return-Path: <linux-gpio+bounces-17717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345EA66AEB
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBF50174597
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 06:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBFD1DF27E;
	Tue, 18 Mar 2025 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO3QwWRG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2A38FA6;
	Tue, 18 Mar 2025 06:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742280919; cv=none; b=pt8wyP9DHmrXEc1QwpAdrkFoGHP9dIq78lJKt298GpzyGKlmY1IrMBrn1qjqxuDeIZfzmnPzYufuPbVu3D9bqRxpxIGTDg9mtZC5xjGYuUZDYNdqFApN5mRiaGIqUfne+rZZZKwIQYRcXpV3P7kjTFZFIQF/y5qDFBqfqy8GiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742280919; c=relaxed/simple;
	bh=0N/j82ZouFu/LGP3EwteUdy7Yb0BtynVqCMQCIvaUjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Azu+r31ogpCGKpmh14Yj8VhiAmtmeqbsBZTZz3vG3GWfVTpRN7tkOyvYSnPjxobMnCh+giYbjP3YOO4TOS3lsNj387wdGwByWzKIJQS7rwIItIQRfGh8Or7RBwMqvK32IX4mh0hCbuStoYUxjy8FAWs2zAW346cPTb8Bit2VbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO3QwWRG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742280918; x=1773816918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0N/j82ZouFu/LGP3EwteUdy7Yb0BtynVqCMQCIvaUjw=;
  b=QO3QwWRGJHr9wmw86LeMPxR9HDslmwjfgGbHPInGqmyZKSGzTS8QqX2g
   4ZifTYvjuYQfMx6Dsv2Xc9I+uCME4PjqUWcA6RjhY/7XqeazM+2CGNSY1
   oHDvC9NUO3KVQyN7chAL4ylMAJIbgo/J7oHeVBl+OorhH7L6O6jFz9CG2
   /q/hBQKlnoVH1pd5Bwfr7LyniIrTF7M0j2DnoQjUM+0y8kYrvdvQWGbIi
   zSHI2vGl0xER2ZZFjRcdGRGXnTbR42QsV6DASpf9zJRPwkYAmzuCxG4Cr
   FIxeK1SKKntHBk8Hd4ukJJH9VTHWMt68YWc8sv5sQkLS048qvYharmGi1
   g==;
X-CSE-ConnectionGUID: ZmvKQXwpRRCFwaHCecbMDw==
X-CSE-MsgGUID: wufjkNAcT/i0qbBsXmxWFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54397122"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54397122"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 23:55:17 -0700
X-CSE-ConnectionGUID: Jfd9W0seTz+Cr2JlePATaw==
X-CSE-MsgGUID: D0s5+JOISD6A+CP51OMi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="121996757"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Mar 2025 23:55:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuQqx-000DUW-1E;
	Tue, 18 Mar 2025 06:55:08 +0000
Date: Tue, 18 Mar 2025 14:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Patrick Williams <patrick@stwcx.xyz>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for level-triggered interrupts
Message-ID: <202503181425.OndgH7Dh-lkp@intel.com>
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
config: arm-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181425.OndgH7Dh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181425.OndgH7Dh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181425.OndgH7Dh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-pca953x.c: In function 'pca953x_irq_pending':
>> drivers/gpio/gpio-pca953x.c:887:13: warning: the comparison will always evaluate as 'true' for the address of 'irq_trig_level_high' will never be NULL [-Waddress]
     887 |         if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
         |             ^
   In file included from include/linux/atomic.h:5,
                    from drivers/gpio/gpio-pca953x.c:11:
   drivers/gpio/gpio-pca953x.c:218:24: note: 'irq_trig_level_high' declared here
     218 |         DECLARE_BITMAP(irq_trig_level_high, MAX_LINE);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~
>> drivers/gpio/gpio-pca953x.c:887:43: warning: the comparison will always evaluate as 'true' for the address of 'irq_trig_level_low' will never be NULL [-Waddress]
     887 |         if (!chip->irq_trig_level_high && !chip->irq_trig_level_low) {
         |                                           ^
   drivers/gpio/gpio-pca953x.c:219:24: note: 'irq_trig_level_low' declared here
     219 |         DECLARE_BITMAP(irq_trig_level_low, MAX_LINE);
         |                        ^~~~~~~~~~~~~~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~


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

