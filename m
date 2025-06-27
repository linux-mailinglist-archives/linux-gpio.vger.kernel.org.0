Return-Path: <linux-gpio+bounces-22339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0040AEB6AF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 13:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AE9563FBA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 11:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A57C2BCF54;
	Fri, 27 Jun 2025 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZDxp/RN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E529E0E0;
	Fri, 27 Jun 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024520; cv=none; b=K4VNGjzZiApRR8phqU5JUVFm/CnSvUnQUJsiTlpmyAh2GvlUMRB0iI1TxlxGVS5VDKT8HeKtSWgf0cOVlMeM847ZEwi/Ycd+l1q7T/hdCsiPqGhYqFvJYBjZC0wQmLCdRsOA2e6mOc6wEcYOpLzexkxq3oFDLooAVq6m5DoLJfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024520; c=relaxed/simple;
	bh=nZOaxhDoY088s77SVWl/RPAG6Ac4V85NnmsvRFym91c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv4dgPQnEpObd+6kvM/0IdI/HjU2wd0IvWvqUaWG5M1BHOBvQsUUlyb8GcOVpu9/Sxcjd63MutsqkHVX/Wl6zALiP9BrafUDUz0CxROQXqpkSpY+v/4WEQawEdt+sEVHRYPEYRjTzF/gUhJxq1QAjEZTiD37fItnDBRvLwmMETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZDxp/RN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751024517; x=1782560517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZOaxhDoY088s77SVWl/RPAG6Ac4V85NnmsvRFym91c=;
  b=QZDxp/RNQH3I28LgXGbHMbg4JzxLZM3OwkgpklFB00VOpyaMGYrO+oHm
   qX+2Ew2wZILmAs9FzTtOVlVIKJoEJiZ/ykadatM68Ul8b/sbp3GxCjS7N
   eVpCEM6JQcBInwITPhyt/I5uXkTJJXOUVuL++ldbpL+euYNGdTYRhd4Lr
   n+PcGsi3przlMd5dS3I8z2lRYNlEXfa9JCnsFlY7SLKesPbLE3DsDMt8s
   omuSiuao231u6BvtV4i1IwYGk00bi/0uzDeiznHbS+L3scpp40Pily9XK
   RnXzia/lNjI5Eh90mUZVsjp1+Ttgf7u4XYrzOJVcBiHz9CvNuq591nem9
   A==;
X-CSE-ConnectionGUID: PvYF3Hx2Q9+mRk0VDbLSiA==
X-CSE-MsgGUID: CaMP3tCPTTeO3NZ3W74zKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64690901"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64690901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:41:56 -0700
X-CSE-ConnectionGUID: H3g5RGKmS6yosg3y/uOPDQ==
X-CSE-MsgGUID: 9Hjg6KM7QLOiPI/I3F05LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183822281"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 04:41:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7So-000W8M-38;
	Fri, 27 Jun 2025 11:41:50 +0000
Date: Fri, 27 Jun 2025 19:40:57 +0800
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
Subject: Re: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of
 the GPIO sysfs interface
Message-ID: <202506271940.T2QaCrba-lkp@intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-8-d592793f8964@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb908f3699fb137e28017a8fdf506c35762b3eb6]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-sysfs-add-a-parallel-class-device-for-each-GPIO-chip-using-device-IDs/20250623-170412
base:   cb908f3699fb137e28017a8fdf506c35762b3eb6
patch link:    https://lore.kernel.org/r/20250623-gpio-sysfs-chip-export-v2-8-d592793f8964%40linaro.org
patch subject: [PATCH v2 8/9] gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs interface
config: s390-randconfig-002-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271940.T2QaCrba-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271940.T2QaCrba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271940.T2QaCrba-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-sysfs.c:818:3: error: cannot jump from this goto statement to its label
     818 |                 goto err_free_name;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:820:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     820 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:811:3: error: cannot jump from this goto statement to its label
     811 |                 goto err_put_dirent;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:820:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     820 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:802:3: error: cannot jump from this goto statement to its label
     802 |                 goto err_put_dirent;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:820:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     820 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:747:3: error: cannot jump from this goto statement to its label
     747 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:820:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     820 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
   drivers/gpio/gpiolib-sysfs.c:741:3: error: cannot jump from this goto statement to its label
     741 |                 goto err_clear_bit;
         |                 ^
   drivers/gpio/gpiolib-sysfs.c:820:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
     820 |         char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
         |               ^
>> drivers/gpio/gpiolib-sysfs.c:962:6: warning: unused variable 'err' [-Wunused-variable]
     962 |         int err;
         |             ^~~
   1 warning and 5 errors generated.


vim +/err +962 drivers/gpio/gpiolib-sysfs.c

65fbd24108991d Bartosz Golaszewski 2025-06-23  798  
574194e59098d9 Bartosz Golaszewski 2025-06-23  799  	gdev_data = gdev_get_data(gdev);
574194e59098d9 Bartosz Golaszewski 2025-06-23  800  	if (!gdev_data) {
574194e59098d9 Bartosz Golaszewski 2025-06-23  801  		status = -ENODEV;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  802  		goto err_put_dirent;
574194e59098d9 Bartosz Golaszewski 2025-06-23  803  	}
574194e59098d9 Bartosz Golaszewski 2025-06-23  804  
574194e59098d9 Bartosz Golaszewski 2025-06-23  805  	list_add(&desc_data->list, &gdev_data->exported_lines);
574194e59098d9 Bartosz Golaszewski 2025-06-23  806  
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  807  	desc_data->attr_group.name = kasprintf(GFP_KERNEL, "gpio%u",
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  808  					       gpio_chip_hwgpio(desc));
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  809  	if (!desc_data->attr_group.name) {
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  810  		status = -ENOMEM;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  811  		goto err_put_dirent;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  812  	}
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  813  
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  814  	desc_data->parent = &gdev_data->cdev_id->kobj;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  815  	status = sysfs_create_groups(desc_data->parent,
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  816  				     desc_data->attr_groups);
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  817  	if (status)
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  818  		goto err_free_name;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  819  
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23 @820  	char *path __free(kfree) = kasprintf(GFP_KERNEL, "gpio%u/value",
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  821  					     gpio_chip_hwgpio(desc));
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  822  	if (!path) {
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  823  		status = -ENOMEM;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  824  		goto err_remove_groups;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  825  	}
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  826  
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  827  	desc_data->value_chip_node = kernfs_walk_and_get(desc_data->parent->sd,
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  828  							 path);
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  829  	if (!desc_data->value_chip_node) {
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  830  		status = -ENODEV;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  831  		goto err_remove_groups;
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  832  	}
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  833  
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  834  	return 0;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  835  
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  836  err_remove_groups:
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  837  	sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  838  err_free_name:
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  839  	kfree(desc_data->attr_group.name);
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  840  err_put_dirent:
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  841  #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  842  	sysfs_put(desc_data->value_class_node);
65fbd24108991d Bartosz Golaszewski 2025-06-23  843  err_unregister_device:
574194e59098d9 Bartosz Golaszewski 2025-06-23  844  	device_unregister(desc_data->dev);
c43960fbcc514b Johan Hovold        2015-05-04  845  err_free_data:
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  846  #endif /* CONFIG_GPIO_SYSFS_LEGACY */
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  847  	kfree(desc_data);
f4af1671c28854 Bartosz Golaszewski 2024-10-31  848  err_clear_bit:
35b545332b809a Bartosz Golaszewski 2024-01-12  849  	clear_bit(FLAG_EXPORT, &desc->flags);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  850  	gpiod_dbg(desc, "%s: status %d\n", __func__, status);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  851  	return status;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  852  }
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  853  EXPORT_SYMBOL_GPL(gpiod_export);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  854  
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  855  #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
c43960fbcc514b Johan Hovold        2015-05-04  856  static int match_export(struct device *dev, const void *desc)
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  857  {
c43960fbcc514b Johan Hovold        2015-05-04  858  	struct gpiod_data *data = dev_get_drvdata(dev);
c43960fbcc514b Johan Hovold        2015-05-04  859  
c43960fbcc514b Johan Hovold        2015-05-04  860  	return data->desc == desc;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  861  }
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  862  #endif /* CONFIG_GPIO_SYSFS_LEGACY */
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  863  
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  864  /**
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  865   * gpiod_export_link - create a sysfs link to an exported GPIO node
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  866   * @dev: device under which to create symlink
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  867   * @name: name of the symlink
2d9d05192e7d1a Thierry Reding      2017-07-24  868   * @desc: GPIO to create symlink to, already exported
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  869   *
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  870   * Set up a symlink from /sys/.../dev/name to /sys/class/gpio/gpioN
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  871   * node. Caller is responsible for unlinking.
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  872   *
94bd9ce16063a2 Andy Shevchenko     2024-08-28  873   * Returns:
94bd9ce16063a2 Andy Shevchenko     2024-08-28  874   * 0 on success, or negative errno on failure.
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  875   */
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  876  int gpiod_export_link(struct device *dev, const char *name,
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  877  		      struct gpio_desc *desc)
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  878  {
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  879  #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
56d30ec14c1330 Johan Hovold        2015-05-04  880  	struct device *cdev;
56d30ec14c1330 Johan Hovold        2015-05-04  881  	int ret;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  882  
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  883  	if (!desc) {
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  884  		pr_warn("%s: invalid GPIO\n", __func__);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  885  		return -EINVAL;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  886  	}
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  887  
56d30ec14c1330 Johan Hovold        2015-05-04  888  	cdev = class_find_device(&gpio_class, NULL, desc, match_export);
56d30ec14c1330 Johan Hovold        2015-05-04  889  	if (!cdev)
56d30ec14c1330 Johan Hovold        2015-05-04  890  		return -ENODEV;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  891  
56d30ec14c1330 Johan Hovold        2015-05-04  892  	ret = sysfs_create_link(&dev->kobj, &cdev->kobj, name);
56d30ec14c1330 Johan Hovold        2015-05-04  893  	put_device(cdev);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  894  
56d30ec14c1330 Johan Hovold        2015-05-04  895  	return ret;
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  896  #else
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  897  	return -EOPNOTSUPP;
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  898  #endif /* CONFIG_GPIO_SYSFS_LEGACY */
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  899  }
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  900  EXPORT_SYMBOL_GPL(gpiod_export_link);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  901  
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  902  /**
31963eb039b7d5 Amitesh Singh       2016-09-08  903   * gpiod_unexport - reverse effect of gpiod_export()
2d9d05192e7d1a Thierry Reding      2017-07-24  904   * @desc: GPIO to make unavailable
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  905   *
31963eb039b7d5 Amitesh Singh       2016-09-08  906   * This is implicit on gpiod_free().
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  907   */
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  908  void gpiod_unexport(struct gpio_desc *desc)
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  909  {
574194e59098d9 Bartosz Golaszewski 2025-06-23  910  	struct gpiod_data *desc_data = NULL;
574194e59098d9 Bartosz Golaszewski 2025-06-23  911  	struct gpiodev_data *gdev_data;
574194e59098d9 Bartosz Golaszewski 2025-06-23  912  	struct gpio_device *gdev;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  913  
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  914  	if (!desc) {
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  915  		pr_warn("%s: invalid GPIO\n", __func__);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  916  		return;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  917  	}
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  918  
f4af1671c28854 Bartosz Golaszewski 2024-10-31  919  	scoped_guard(mutex, &sysfs_lock) {
72eba6f66a0017 Johan Hovold        2015-05-04  920  		if (!test_bit(FLAG_EXPORT, &desc->flags))
f4af1671c28854 Bartosz Golaszewski 2024-10-31  921  			return;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  922  
574194e59098d9 Bartosz Golaszewski 2025-06-23  923  		gdev = gpiod_to_gpio_device(desc);
574194e59098d9 Bartosz Golaszewski 2025-06-23  924  		gdev_data = gdev_get_data(gdev);
574194e59098d9 Bartosz Golaszewski 2025-06-23  925  		if (!gdev_data)
574194e59098d9 Bartosz Golaszewski 2025-06-23  926  			return;
574194e59098d9 Bartosz Golaszewski 2025-06-23  927  
574194e59098d9 Bartosz Golaszewski 2025-06-23  928  		list_for_each_entry(desc_data, &gdev_data->exported_lines, list)
574194e59098d9 Bartosz Golaszewski 2025-06-23  929  			if (desc == desc_data->desc)
574194e59098d9 Bartosz Golaszewski 2025-06-23  930  				break;
574194e59098d9 Bartosz Golaszewski 2025-06-23  931  
574194e59098d9 Bartosz Golaszewski 2025-06-23  932  		if (!desc_data)
f4af1671c28854 Bartosz Golaszewski 2024-10-31  933  			return;
72eba6f66a0017 Johan Hovold        2015-05-04  934  
574194e59098d9 Bartosz Golaszewski 2025-06-23  935  		list_del(&desc_data->list);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  936  		clear_bit(FLAG_EXPORT, &desc->flags);
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  937  #if IS_ENABLED(CONFIG_GPIO_SYSFS_LEGACY)
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  938  		sysfs_put(desc_data->value_class_node);
574194e59098d9 Bartosz Golaszewski 2025-06-23  939  		device_unregister(desc_data->dev);
d6fe296d76af3f Bartosz Golaszewski 2025-06-23  940  #endif /* CONFIG_GPIO_SYSFS_LEGACY */
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  941  		sysfs_remove_groups(desc_data->parent, desc_data->attr_groups);
d65a6b43cccca4 Bartosz Golaszewski 2025-06-23  942  		kernfs_put(desc_data->value_chip_node);
72eba6f66a0017 Johan Hovold        2015-05-04  943  
54d9acd7540995 Johan Hovold        2015-05-04  944  		/*
f4af1671c28854 Bartosz Golaszewski 2024-10-31  945  		 * Release irq after deregistration to prevent race with
f4af1671c28854 Bartosz Golaszewski 2024-10-31  946  		 * edge_store.
54d9acd7540995 Johan Hovold        2015-05-04  947  		 */
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  948  		if (desc_data->irq_flags)
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  949  			gpio_sysfs_free_irq(desc_data);
f4af1671c28854 Bartosz Golaszewski 2024-10-31  950  	}
72eba6f66a0017 Johan Hovold        2015-05-04  951  
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  952  	mutex_destroy(&desc_data->mutex);
d54627a4c4f9a8 Bartosz Golaszewski 2025-06-23  953  	kfree(desc_data);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  954  }
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  955  EXPORT_SYMBOL_GPL(gpiod_unexport);
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  956  
afbc4f312b5e6e Linus Walleij       2016-02-09  957  int gpiochip_sysfs_register(struct gpio_device *gdev)
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  958  {
fd19792851db77 Bartosz Golaszewski 2025-06-10  959  	struct gpiodev_data *data;
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  960  	struct gpio_chip *chip;
513246a34b8dc5 Bartosz Golaszewski 2023-12-21  961  	struct device *parent;
e6bb78570f7d53 Antonio Quartulli   2025-06-23 @962  	int err;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  963  
426577bd8846d6 Johan Hovold        2015-05-04  964  	/*
426577bd8846d6 Johan Hovold        2015-05-04  965  	 * Many systems add gpio chips for SOC support very early,
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  966  	 * before driver model support is available.  In those cases we
426577bd8846d6 Johan Hovold        2015-05-04  967  	 * register later, in gpiolib_sysfs_init() ... here we just
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  968  	 * verify that _some_ field of gpio_class got initialized.
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  969  	 */
6f14c02220c791 Greg Kroah-Hartman  2023-03-31  970  	if (!class_is_registered(&gpio_class))
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  971  		return 0;
0eb4c6c2671ca0 Alexandre Courbot   2014-07-01  972  
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  973  	guard(srcu)(&gdev->srcu);
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  974  
d82b9e0887e69d Bartosz Golaszewski 2024-02-14  975  	chip = srcu_dereference(gdev->chip, &gdev->srcu);
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  976  	if (!chip)
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  977  		return -ENODEV;
d83cee3d2bb131 Bartosz Golaszewski 2024-01-23  978  
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  979  	/*
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  980  	 * For sysfs backward compatibility we need to preserve this
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  981  	 * preferred parenting to the gpio_chip parent field, if set.
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  982  	 */
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  983  	if (chip->parent)
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  984  		parent = chip->parent;
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  985  	else
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  986  		parent = &gdev->dev;
d27c17285eb7eb Bamvor Jian Zhang   2016-02-24  987  
fd19792851db77 Bartosz Golaszewski 2025-06-10  988  	data = kmalloc(sizeof(*data), GFP_KERNEL);
fd19792851db77 Bartosz Golaszewski 2025-06-10  989  	if (!data)
fd19792851db77 Bartosz Golaszewski 2025-06-10  990  		return -ENOMEM;
fd19792851db77 Bartosz Golaszewski 2025-06-10  991  
fd19792851db77 Bartosz Golaszewski 2025-06-10  992  	data->gdev = gdev;
574194e59098d9 Bartosz Golaszewski 2025-06-23  993  	INIT_LIST_HEAD(&data->exported_lines);
3ff74be5c1a72d Johan Hovold        2015-05-04  994  
f4af1671c28854 Bartosz Golaszewski 2024-10-31  995  	guard(mutex)(&sysfs_lock);
fd19792851db77 Bartosz Golaszewski 2025-06-10  996  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

