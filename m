Return-Path: <linux-gpio+bounces-10867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD929914AD
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 07:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0CE41F24E2D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 05:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6859A4595B;
	Sat,  5 Oct 2024 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGoZI6SV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770D4085D
	for <linux-gpio@vger.kernel.org>; Sat,  5 Oct 2024 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728106920; cv=none; b=GJBoi7rDOUN9YF/F4TywOD7mkHszbv2dAKybkppp13BmrdMqd/YmGKtuQWr18qlkZNPasnpkktFUxssn0qsmuibsm0r2iMVwrR2QewG0PNnBhaMISRnv3JGTKPn7uxUbvFG2UU3Cdj2UTuSu6GT0g52L8JXLgsPrvZ1l8QF2FPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728106920; c=relaxed/simple;
	bh=1iSXnX9wZz1IICn+RflohnYQTH5v8rvAESMzwCsmGVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0qDT1khincMrOJdqhWabOWuSw+ginncarMamWn00LYNCfkrG8qVCSRz9xA2Shl3XSpOxK+FEMg8GsZrwnpiI5Ze+0oYqqvUr09FM11Aqv4tLCgIxfZ1AivaYwP3WGkr5t4yybEDOEb2MsV/QMewa6FUxolzE8YrQNqHL0Fx7Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGoZI6SV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728106919; x=1759642919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1iSXnX9wZz1IICn+RflohnYQTH5v8rvAESMzwCsmGVk=;
  b=VGoZI6SVX0qSSyZjzNa8FInZSZIOimx+DEmdqfW1LLLEh8K3b3WAI504
   Wx294Rb/RGzjDNKjlGHOm3ua4GnfXL0H7HvlfRt1E2hBRqwLjcUubPrYf
   o4Rz1uU8BZzY3Uon2lmbRj4+91zh/7sNgufnMZ34+zmNqdsFHEXDVXnCh
   Zkz5dz3dZecfRsUtzx1wns4h+SK0NkizIcW8G40tLBDfKPG6lQq/oXWG8
   JtblkBf0Za4FpG3iiQ4PqqZaE2fjZRp3uRyB6xylAwsrMJN1fyn/n32Nr
   42jagC8o3ZUIGsqkN10ZavY+Ko6/aPw+SFHo6A03FqonL7fw4bXEQs5XD
   A==;
X-CSE-ConnectionGUID: yeHic2NBQ72okF0vMmvY+A==
X-CSE-MsgGUID: p67K35xTTFOJ+foeHt765w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37986873"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37986873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 22:41:58 -0700
X-CSE-ConnectionGUID: /qV8NzDXSRGmaCuyUsGIOw==
X-CSE-MsgGUID: K+Xifs7hRHK8PEQ8rvFamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79875371"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 22:41:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxYA-0002by-1R;
	Sat, 05 Oct 2024 05:41:54 +0000
Date: Sat, 5 Oct 2024 13:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next 5/5]
 drivers/pinctrl/pinctrl-aw9523.c:988:8: error: use of undeclared label
 'err_disable_vregs'
Message-ID: <202410051344.Js99f2o2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
head:   8498e6b2b8524b52f94ab22d65b50cd4508673c7
commit: 8498e6b2b8524b52f94ab22d65b50cd4508673c7 [5/5] Merge branch 'devel' into for-next
config: i386-buildonly-randconfig-002-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051344.Js99f2o2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051344.Js99f2o2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051344.Js99f2o2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-aw9523.c:988:8: error: use of undeclared label 'err_disable_vregs'
     988 |                 goto err_disable_vregs;
         |                      ^
   1 error generated.


vim +/err_disable_vregs +988 drivers/pinctrl/pinctrl-aw9523.c

576623d706613f AngeloGioacchino Del Regno 2024-03-01   951  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   952  static int aw9523_probe(struct i2c_client *client)
576623d706613f AngeloGioacchino Del Regno 2024-03-01   953  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01   954  	struct device *dev = &client->dev;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   955  	struct pinctrl_desc *pdesc;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   956  	struct aw9523 *awi;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   957  	int ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   958  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   959  	awi = devm_kzalloc(dev, sizeof(*awi), GFP_KERNEL);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   960  	if (!awi)
576623d706613f AngeloGioacchino Del Regno 2024-03-01   961  		return -ENOMEM;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   962  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   963  	i2c_set_clientdata(client, awi);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   964  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   965  	awi->dev = dev;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   966  	awi->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   967  	if (IS_ERR(awi->reset_gpio))
576623d706613f AngeloGioacchino Del Regno 2024-03-01   968  		return PTR_ERR(awi->reset_gpio);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   969  	gpiod_set_consumer_name(awi->reset_gpio, "aw9523 reset");
576623d706613f AngeloGioacchino Del Regno 2024-03-01   970  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   971  	awi->regmap = devm_regmap_init_i2c(client, &aw9523_regmap);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   972  	if (IS_ERR(awi->regmap))
576623d706613f AngeloGioacchino Del Regno 2024-03-01   973  		return PTR_ERR(awi->regmap);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   974  
38e2d33f134055 Rosen Penev                2024-10-01   975  	awi->vio_vreg = devm_regulator_get_enable_optional(dev, "vio");
38e2d33f134055 Rosen Penev                2024-10-01   976  	if (awi->vio_vreg && awi->vio_vreg != -ENODEV)
38e2d33f134055 Rosen Penev                2024-10-01   977  		return awi->vio_vreg;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   978  
7b2a96de50d04a Rosen Penev                2024-10-03   979  	ret = devm_mutex_init(dev, &awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   980  	if (ret)
576623d706613f AngeloGioacchino Del Regno 2024-03-01   981  		return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   982  
4aad0ad20f4ea8 Andy Shevchenko            2024-03-29   983  	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
576623d706613f AngeloGioacchino Del Regno 2024-03-01   984  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   985  	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
393c554093c0c4 Rosen Penev                2024-10-01   986  	if (!pdesc) {
393c554093c0c4 Rosen Penev                2024-10-01   987  		ret = -ENOMEM;
393c554093c0c4 Rosen Penev                2024-10-01  @988  		goto err_disable_vregs;
393c554093c0c4 Rosen Penev                2024-10-01   989  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01   990  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   991  	ret = aw9523_hw_init(awi);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   992  	if (ret)
7b2a96de50d04a Rosen Penev                2024-10-03   993  		return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   994  
576623d706613f AngeloGioacchino Del Regno 2024-03-01   995  	pdesc->name = dev_name(dev);
576623d706613f AngeloGioacchino Del Regno 2024-03-01   996  	pdesc->owner = THIS_MODULE;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   997  	pdesc->pctlops = &aw9523_pinctrl_ops;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   998  	pdesc->pmxops  = &aw9523_pinmux_ops;
576623d706613f AngeloGioacchino Del Regno 2024-03-01   999  	pdesc->confops = &aw9523_pinconf_ops;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1000  	pdesc->pins = aw9523_pins;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1001  	pdesc->npins = ARRAY_SIZE(aw9523_pins);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1002  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1003  	ret = aw9523_init_gpiochip(awi, pdesc->npins);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1004  	if (ret)
7b2a96de50d04a Rosen Penev                2024-10-03  1005  		return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1006  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1007  	if (client->irq) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1008  		ret = aw9523_init_irq(awi, client->irq);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1009  		if (ret)
7b2a96de50d04a Rosen Penev                2024-10-03  1010  			return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1011  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1012  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1013  	awi->pctl = devm_pinctrl_register(dev, pdesc, awi);
7b2a96de50d04a Rosen Penev                2024-10-03  1014  	if (IS_ERR(awi->pctl))
7b2a96de50d04a Rosen Penev                2024-10-03  1015  		return dev_err_probe(dev, PTR_ERR(awi->pctl),
7b2a96de50d04a Rosen Penev                2024-10-03  1016  				     "Cannot register pinctrl");
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1017  
7b2a96de50d04a Rosen Penev                2024-10-03  1018  	return devm_gpiochip_add_data(dev, &awi->gpio, awi);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1019  }
576623d706613f AngeloGioacchino Del Regno 2024-03-01  1020  

:::::: The code at line 988 was first introduced by commit
:::::: 393c554093c0c4cbc8e2f178d36df169016384da pinctrl: aw9523: add missing mutex_destroy

:::::: TO: Rosen Penev <rosenp@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

