Return-Path: <linux-gpio+bounces-12180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B73779B2102
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 23:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485C92813CE
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 22:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4230B17E900;
	Sun, 27 Oct 2024 22:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/YKO3E0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D544384;
	Sun, 27 Oct 2024 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730067720; cv=none; b=UhasZe0YMCYUaztbF93v8IPTqQUV2CvEj1ttlzEdFvkWnXn92XUWWGXZzgK+Q9diFcFmvakEaYJeM/UK6SuedBIw/++9bR+TygkZmRkmXTmNiaY77O2/lFQ8Tu9x8/7614OWNArdX3J8GL/JH2uq907nykI9EYu+CBiHsIv41VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730067720; c=relaxed/simple;
	bh=sxgyCZvsGdDbokMrGqYRMsBz5Z+jS3XC8LLxod9zO7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvWzcfBUBD5mI5ioZ4CfZqT5j3zA+iHe1D19eR3qHg2N5/96XdvaErFF+j0c46rT29ZmlYdj9bZl3CHv4ao1+sxbclCRkXbMhZFHp4bFr6vbZHHwQNBfEW51WZFgZMyXAhgBzHCFbPl8eZRFDoucksZYfxRdzb33G2hihkjxZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/YKO3E0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730067718; x=1761603718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sxgyCZvsGdDbokMrGqYRMsBz5Z+jS3XC8LLxod9zO7U=;
  b=T/YKO3E06TwR6BszNTEF+iLAz/hgEeK7qJeZ0U8SJkPTdfraf31WBQ6e
   D+Z0hEA/6d/R1F+WIhQYgKgcI2JN97DHCVpkGnshLhmaCARm2pgSlmofY
   QewlnLfk2boAKHbBbKlHpfTXeVJ/iFb3fSGe7ooPw6ttJG1RjhPyPt90g
   AzGpokdKnsMEq8VECV1kLpZcyifPEudFkBgg4/H0gbjZp//HSRPCfV6yu
   0jxgetWg1y9An4jyP8S62p0dipNih3q3zsRTY4IR2WWNLv79K5GEltNwu
   MdII0MlX3F2WYQmt2ECMaTwxMsTHHMV4We0uTEpgbjmmtokBAb9dhpUS2
   Q==;
X-CSE-ConnectionGUID: keN3MUK3RNSEP4unCZMoeg==
X-CSE-MsgGUID: cA6lzW5bQlaQJBzLX8/g/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29621079"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29621079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 15:21:58 -0700
X-CSE-ConnectionGUID: aqQQUgt+R6SMkbyDbnFpUQ==
X-CSE-MsgGUID: eIXFp/HrQA+Fdeb+6Gj0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="104760119"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 15:21:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Bdw-000b1v-2R;
	Sun, 27 Oct 2024 22:21:52 +0000
Date: Mon, 28 Oct 2024 06:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: sysfs: use cleanup guards for the
 sysfs_lock mutex
Message-ID: <202410280514.EkyQpKfw-lkp@intel.com>
References: <20241026-gpio-notify-sysfs-v3-2-ad8f127d12f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026-gpio-notify-sysfs-v3-2-ad8f127d12f5@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on a39230ecf6b3057f5897bc4744a790070cfbe7a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-sysfs-use-cleanup-guards-for-gpiod_data-mutex/20241026-210033
base:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
patch link:    https://lore.kernel.org/r/20241026-gpio-notify-sysfs-v3-2-ad8f127d12f5%40linaro.org
patch subject: [PATCH v3 2/5] gpio: sysfs: use cleanup guards for the sysfs_lock mutex
config: i386-buildonly-randconfig-004-20241028 (https://download.01.org/0day-ci/archive/20241028/202410280514.EkyQpKfw-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280514.EkyQpKfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280514.EkyQpKfw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-sysfs.c:588:3: error: cannot jump from this goto statement to its label
     588 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:591:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
     591 |         struct gpiod_data *data __free(kfree) = kzalloc(sizeof(*data),
         |                            ^
   drivers/gpio/gpiolib-sysfs.c:582:3: error: cannot jump from this goto statement to its label
     582 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:591:21: note: jump bypasses initialization of variable with __attribute__((cleanup))
     591 |         struct gpiod_data *data __free(kfree) = kzalloc(sizeof(*data),
         |                            ^
   2 errors generated.


vim +588 drivers/gpio/gpiolib-sysfs.c

   534	
   535	/**
   536	 * gpiod_export - export a GPIO through sysfs
   537	 * @desc: GPIO to make available, already requested
   538	 * @direction_may_change: true if userspace may change GPIO direction
   539	 * Context: arch_initcall or later
   540	 *
   541	 * When drivers want to make a GPIO accessible to userspace after they
   542	 * have requested it -- perhaps while debugging, or as part of their
   543	 * public interface -- they may use this routine.  If the GPIO can
   544	 * change direction (some can't) and the caller allows it, userspace
   545	 * will see "direction" sysfs attribute which may be used to change
   546	 * the gpio's direction.  A "value" attribute will always be provided.
   547	 *
   548	 * Returns:
   549	 * 0 on success, or negative errno on failure.
   550	 */
   551	int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
   552	{
   553		struct gpio_device *gdev;
   554		struct device *dev;
   555		int status;
   556	
   557		/* can't export until sysfs is available ... */
   558		if (!class_is_registered(&gpio_class)) {
   559			pr_debug("%s: called too early!\n", __func__);
   560			return -ENOENT;
   561		}
   562	
   563		if (!desc) {
   564			pr_debug("%s: invalid gpio descriptor\n", __func__);
   565			return -EINVAL;
   566		}
   567	
   568		CLASS(gpio_chip_guard, guard)(desc);
   569		if (!guard.gc)
   570			return -ENODEV;
   571	
   572		if (test_and_set_bit(FLAG_EXPORT, &desc->flags))
   573			return -EPERM;
   574	
   575		gdev = desc->gdev;
   576	
   577		guard(mutex)(&sysfs_lock);
   578	
   579		/* check if chip is being removed */
   580		if (!gdev->mockdev) {
   581			status = -ENODEV;
   582			goto err_clear_bit;
   583		}
   584	
   585		if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
   586			gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
   587			status = -EPERM;
 > 588			goto err_clear_bit;
   589		}
   590	
   591		struct gpiod_data *data __free(kfree) = kzalloc(sizeof(*data),
   592								GFP_KERNEL);
   593		if (!data) {
   594			status = -ENOMEM;
   595			goto err_clear_bit;
   596		}
   597	
   598		data->desc = desc;
   599		mutex_init(&data->mutex);
   600		if (guard.gc->direction_input && guard.gc->direction_output)
   601			data->direction_can_change = direction_may_change;
   602		else
   603			data->direction_can_change = false;
   604	
   605		dev = device_create_with_groups(&gpio_class, &gdev->dev,
   606						MKDEV(0, 0), data, gpio_groups,
   607						"gpio%u", desc_to_gpio(desc));
   608		if (IS_ERR(dev)) {
   609			status = PTR_ERR(dev);
   610			goto err_clear_bit;
   611		}
   612	
   613		data = NULL;
   614		return 0;
   615	
   616	err_clear_bit:
   617		clear_bit(FLAG_EXPORT, &desc->flags);
   618		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
   619		return status;
   620	}
   621	EXPORT_SYMBOL_GPL(gpiod_export);
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

