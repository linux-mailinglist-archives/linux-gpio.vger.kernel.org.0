Return-Path: <linux-gpio+bounces-10868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 424769914B6
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 08:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B5981F2343E
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 06:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAE03B7A8;
	Sat,  5 Oct 2024 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGewV0h4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656F29CA
	for <linux-gpio@vger.kernel.org>; Sat,  5 Oct 2024 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728108181; cv=none; b=VnSET7C56mjz/7Mew5QkjTZUdZuwjw2b58VWSYg4vRVXUxE5i/52nt4K4uaQq+ahkbUsk+fP19AGOcKHmjgf1ib8l28xdDubQWff87vIiN8ClcHB3BCw3weH6u7p3XtBaqhhCjtGLHE/87B0S+mtO6pvLiIbzRfqUNE8G/bFoP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728108181; c=relaxed/simple;
	bh=15g1/je+mb4ei6wwANETPUeBKPqGZAuCTFNSuxsgpBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GOLdO8CPboZ0Z0O8JWuMUMaR46zCdtLkMVChR00MNJRJ5nYLGzmB7TlkgVyWeprDhc4TvsVcfjVlfn4EnTmxtK1XwoFZ29PeC5+TiJepEHKhmnFRpUOZc2ucRT/zwoNzAL65pb+1BIhfyj7D7KGT44ISDtvwjw4hl4LeD2UkbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGewV0h4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728108179; x=1759644179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15g1/je+mb4ei6wwANETPUeBKPqGZAuCTFNSuxsgpBQ=;
  b=QGewV0h4ilpVbAPfZUKn4jVsmXvmTB+d8TRIasoZXl5eHGmfal0nbnMl
   zUk+eR9zUZCu42vyEtJTFJZdF9Q5c77LaQ5OdCQJTHG7r5Bv1waw/0nW0
   M6LxEWWZRkxmgH+9i7oArYgxJiwZ3PP4WYu58f888jcbb2FnvlrOnBHh8
   zl0n4uFhdY/paLJNlEnHfag1Pw05HHcKtZP41ahCgsLAQwEmhXD7zat7E
   GLGa0dB88Yi4jqicJ361ZtBjsON1UAAtsJZzylJ37W7jkV3C5vz9jKji+
   wJuU4rv+OTf+ZSMCMuB0S4miSeEX9bJxcQ/wU2AnSLrjFcD2ArcGQb40Y
   g==;
X-CSE-ConnectionGUID: 9BXzJjWBRQCum9WNP55tLQ==
X-CSE-MsgGUID: CxsuqB03SGKYTMcnZHZPBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38696825"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="38696825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:02:58 -0700
X-CSE-ConnectionGUID: z9Hn16AcRKmWgQob5cirJA==
X-CSE-MsgGUID: o9eh4BQlSYiXtAFFcr64yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74600028"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Oct 2024 23:02:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swxsV-0002d8-0c;
	Sat, 05 Oct 2024 06:02:55 +0000
Date: Sat, 5 Oct 2024 14:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next 5/5]
 drivers/pinctrl/pinctrl-aw9523.c:988:17: error: label 'err_disable_vregs'
 used but not defined
Message-ID: <202410051342.W9kssugb-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051342.W9kssugb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051342.W9kssugb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051342.W9kssugb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-aw9523.c: In function 'aw9523_probe':
>> drivers/pinctrl/pinctrl-aw9523.c:988:17: error: label 'err_disable_vregs' used but not defined
     988 |                 goto err_disable_vregs;
         |                 ^~~~


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

