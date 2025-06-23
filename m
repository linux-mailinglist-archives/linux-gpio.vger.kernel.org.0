Return-Path: <linux-gpio+bounces-22031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679AAE5529
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 00:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BBE1BC3C82
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 22:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16AB225785;
	Mon, 23 Jun 2025 22:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMZzeHkF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B390421FF2B;
	Mon, 23 Jun 2025 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716504; cv=none; b=ajk9GwgaCOka31vGyfI0tEe9pRSahlHM+Ug8ynjqrM/Svgd3QylejOUaBfg3g4yHZHHJmcFOaIuoV4XsE0Uv6vQWynn69JqdOqXw1FNtCAto239Wi9oAEl0WgNO2PiZTg6M+hxCMiUZJgKg60Eg8kpRs6aBXYtvT+d7h1nqsHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716504; c=relaxed/simple;
	bh=4ubACdoLtmTWspA2/xYT1/XL3PMWzVKt/9CdDgzP9aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHJDk1xN85I0+ZvOecsdLce5CW/Q1q1JLIoBhMnlftOgZ/ZNlihhBXJsrmTyAPTR0ZTdqhx4jRI8a7FtTRehyKPGNIqA4D21p9RIo7Yz6Ca8AOloroOlvDKZN9pr3cYK7DJCss0E80JlVUT5Mmn5tVIXRvBp/sYtW7kkJEtvVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMZzeHkF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750716503; x=1782252503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ubACdoLtmTWspA2/xYT1/XL3PMWzVKt/9CdDgzP9aU=;
  b=SMZzeHkFBlwuWE3OzrpLvjXFUhrMZc4Ib3AmXJDB9Tjy6vbNQBDR67Br
   yoU+5mfamdMQD1DgmvUt9/GBQ5UamL1yh0ZDjzYRumEhoYcaLffi1Hh3U
   4W8pabUXlzslN40keWCDSbwqKI7gIammzIZyZRm11DM3E1FHtsA4Nn5w+
   7VCWFpX/QfgWUaeGcHC5M2JZ5Qqsrn7T2x2ZSWaI8a359QE6UsRcBY/IZ
   8aHVJvUKKmYJ9FDdLapyj7/a4WXT9EM0pNUpVP3VVplRgvrzwQGgX8/EU
   ZJBsYhbguEMCjnG14Bd0TfAupQ2IN0HjycDeUBC+7vDwGBOjauEOcNAYF
   A==;
X-CSE-ConnectionGUID: OakrEHm3QYen6zNY/ZqgZA==
X-CSE-MsgGUID: YIBc2Y+xRlmBdHJWldSJFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56744829"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="56744829"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:08:22 -0700
X-CSE-ConnectionGUID: DqMHNaMSQMa9rG6dqUY0cg==
X-CSE-MsgGUID: 3rLef4w7T2CHBV7sorbZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151138052"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2025 15:08:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTpKq-000QsA-0E;
	Mon, 23 Jun 2025 22:08:16 +0000
Date: Tue, 24 Jun 2025 06:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] gpio: sysfs: export the GPIO directory locally in
 the gpiochip<id> directory
Message-ID: <202506240548.l2wS2XW6-lkp@intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-7-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-7-d592793f8964@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on cb908f3699fb137e28017a8fdf506c35762b3eb6]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-sysfs-add-a-parallel-class-device-for-each-GPIO-chip-using-device-IDs/20250623-170412
base:   cb908f3699fb137e28017a8fdf506c35762b3eb6
patch link:    https://lore.kernel.org/r/20250623-gpio-sysfs-chip-export-v2-7-d592793f8964%40linaro.org
patch subject: [PATCH v2 7/9] gpio: sysfs: export the GPIO directory locally in the gpiochip<id> directory
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240548.l2wS2XW6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240548.l2wS2XW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240548.l2wS2XW6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-sysfs.c:802:3: error: cannot jump from this goto statement to its label
     802 |                 goto err_free_name;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:795:3: error: cannot jump from this goto statement to its label
     795 |                 goto err_put_dirent;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:786:3: error: cannot jump from this goto statement to its label
     786 |                 goto err_put_dirent;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:780:3: error: cannot jump from this goto statement to its label
     780 |                 goto err_unregister_device;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:773:3: error: cannot jump from this goto statement to its label
     773 |                 goto err_free_data;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:733:3: error: cannot jump from this goto statement to its label
     733 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:727:3: error: cannot jump from this goto statement to its label
     727 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:804:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     804 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   7 errors generated.


vim +802 drivers/gpio/gpiolib-sysfs.c

   677	
   678	/**
   679	 * gpiod_export - export a GPIO through sysfs
   680	 * @desc: GPIO to make available, already requested
   681	 * @direction_may_change: true if userspace may change GPIO direction
   682	 * Context: arch_initcall or later
   683	 *
   684	 * When drivers want to make a GPIO accessible to userspace after they
   685	 * have requested it -- perhaps while debugging, or as part of their
   686	 * public interface -- they may use this routine.  If the GPIO can
   687	 * change direction (some can't) and the caller allows it, userspace
   688	 * will see "direction" sysfs attribute which may be used to change
   689	 * the gpio's direction.  A "value" attribute will always be provided.
   690	 *
   691	 * Returns:
   692	 * 0 on success, or negative errno on failure.
   693	 */
   694	int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
   695	{
   696		struct gpiodev_data *gdev_data;
   697		struct gpiod_data *desc_data;
   698		struct gpio_device *gdev;
   699		struct attribute **attrs;
   700		int status;
   701	
   702		/* can't export until sysfs is available ... */
   703		if (!class_is_registered(&gpio_class)) {
   704			pr_debug("%s: called too early!\n", __func__);
   705			return -ENOENT;
   706		}
   707	
   708		if (!desc) {
   709			pr_debug("%s: invalid gpio descriptor\n", __func__);
   710			return -EINVAL;
   711		}
   712	
   713		CLASS(gpio_chip_guard, guard)(desc);
   714		if (!guard.gc)
   715			return -ENODEV;
   716	
   717		if (test_and_set_bit(FLAG_EXPORT, &desc->flags))
   718			return -EPERM;
   719	
   720		gdev = desc->gdev;
   721	
   722		guard(mutex)(&sysfs_lock);
   723	
   724		if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
   725			gpiod_dbg(desc, "%s: unavailable (not requested)\n", __func__);
   726			status = -EPERM;
   727			goto err_clear_bit;
   728		}
   729	
   730		desc_data = kzalloc(sizeof(*desc_data), GFP_KERNEL);
   731		if (!desc_data) {
   732			status = -ENOMEM;
   733			goto err_clear_bit;
   734		}
   735	
   736		desc_data->desc = desc;
   737		mutex_init(&desc_data->mutex);
   738		if (guard.gc->direction_input && guard.gc->direction_output)
   739			desc_data->direction_can_change = direction_may_change;
   740		else
   741			desc_data->direction_can_change = false;
   742	
   743		gpiod_attr_init(&desc_data->dir_attr, "direction",
   744				direction_show, direction_store);
   745		gpiod_attr_init(&desc_data->val_attr, "value", value_show, value_store);
   746		gpiod_attr_init(&desc_data->edge_attr, "edge", edge_show, edge_store);
   747		gpiod_attr_init(&desc_data->active_low_attr, "active_low",
   748					active_low_show, active_low_store);
   749	
   750		attrs = desc_data->attrs;
   751		desc_data->attr_group.is_visible = gpio_is_visible;
   752		attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
   753		attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &desc_data->val_attr.attr;
   754		attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &desc_data->edge_attr.attr;
   755		attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
   756					&desc_data->active_low_attr.attr;
   757	
   758		desc_data->attr_group.attrs = desc_data->attrs;
   759		desc_data->attr_groups[0] = &desc_data->attr_group;
   760	
   761		/*
   762		 * Note: we need to continue passing desc_data here as there's still
   763		 * at least one known user of gpiod_export_link() in the tree. This
   764		 * function still uses class_find_device() internally.
   765		 */
   766		desc_data->dev = device_create_with_groups(&gpio_class, &gdev->dev,
   767							   MKDEV(0, 0), desc_data,
   768							   desc_data->attr_groups,
   769							   "gpio%u",
   770							   desc_to_gpio(desc));
   771		if (IS_ERR(desc_data->dev)) {
   772			status = PTR_ERR(desc_data->dev);
   773			goto err_free_data;
   774		}
   775	
   776		desc_data->value_class_node = sysfs_get_dirent(desc_data->dev->kobj.sd,
   777							       "value");
   778		if (!desc_data->value_class_node) {
   779			status = -ENODEV;
   780			goto err_unregister_device;
   781		}
   782	
   783		gdev_data = gdev_get_data(gdev);
   784		if (!gdev_data) {
   785			status = -ENODEV;
   786			goto err_put_dirent;
   787		}
   788	
   789		list_add(&desc_data->list, &gdev_data->exported_lines);
   790	
   791		desc_data->attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
   792						       gpio_chip_hwgpio(desc));
   793		if (!desc_data->attr_group.name) {
   794			status = -ENOMEM;
   795			goto err_put_dirent;
   796		}
   797	
   798		desc_data->parent = &gdev_data->cdev_id->kobj;
   799		status = sysfs_create_groups(desc_data->parent,
   800					     desc_data->attr_groups);
   801		if (status)
 > 802			goto err_free_name;
   803	
   804		char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
   805						     gpio_chip_hwgpio(desc));
   806		if (!path) {
   807			status = -ENOMEM;
   808			goto err_remove_groups;
   809		}
   810	
   811		desc_data->value_chip_node = kernfs_walk_and_get(desc_data->parent->sd,
   812								 path);
   813		if (!desc_data->value_chip_node) {
   814			status = -ENODEV;
   815			goto err_remove_groups;
   816		}
   817	
   818		return 0;
   819	
   820	err_remove_groups:
   821		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
   822	err_free_name:
   823		kfree(desc_data->attr_group.name);
   824	err_put_dirent:
   825		sysfs_put(desc_data->value_class_node);
   826	err_unregister_device:
   827		device_unregister(desc_data->dev);
   828	err_free_data:
   829		kfree(desc_data);
   830	err_clear_bit:
   831		clear_bit(FLAG_EXPORT, &desc->flags);
   832		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
   833		return status;
   834	}
   835	EXPORT_SYMBOL_GPL(gpiod_export);
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

