Return-Path: <linux-gpio+bounces-4077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6C486F224
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 20:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AE09B20E94
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 19:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD603FE54;
	Sat,  2 Mar 2024 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgAFshXf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483A3FB2C
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709409122; cv=none; b=LZu/HlolM6GyC2RhegEch2RwWc/FrX0QKlrjhz//nJz/WZSmTu7RBlsKzdNdCtOpCVdpY9UnJ59dsg6v/dPKUcDC+7weX9uUx2Qq5QtXbFMjWH10feyR28v8i9eQPlO1UGttrc0g4vMd29Opk5Fu/tUKwOKiBf3s4MITpuOMaYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709409122; c=relaxed/simple;
	bh=ahDtg+kKR0S0D516Cn+GCzeWrgeB2zLtP2svBWTxSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAQU7HOuctx1XQ1nf0CyE+tHWFY5ygGKbL/NHrMrVjbVckuoDi/o+xJ83/A6YVABm5//r+mGN8HjaqUtccDwaHuVGUQn4bAqXW5EA/3t3AFHBaf9D98fNQt/BROdmrFLell5PePuxe1X4kqXPLn13lo2wgtp+J9bm9IVJtNkJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgAFshXf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709409120; x=1740945120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahDtg+kKR0S0D516Cn+GCzeWrgeB2zLtP2svBWTxSrc=;
  b=PgAFshXf7aBxbSgR0AsKwISCK+uee7DB2s4BODSDuL6ZkVJFc0djf8AB
   5NvdckRLhk5K4u4A3YbcOHnJtMqyrVo6uL0yckByIr9zAhZgXYjcVsLsh
   xQAWFBWNvk2VQaXDMxBkQlLL+DCEMf0LxJ+g74UjkK8hrYzl8KUZa97WC
   TT9uL8R7TSIRz0gPb+uX2ISrgR8aAUezsdBO/dcOlYjZsOSc+Z9WTAW4h
   C72pgRe07qY2axt2HxQU6m6B3b7i8O/0vA0IgecA5+dsWo+SVoR3VYE31
   Ou2J11HWOI31yNV2xnDnTTq0YV+G/zsxpUTQliJ5suhi/6YAFGa9J7pHl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14583717"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14583717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 11:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8488011"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2024 11:51:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgVOl-0000G4-1H;
	Sat, 02 Mar 2024 19:51:55 +0000
Date: Sun, 3 Mar 2024 03:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 27/27]
 drivers/pinctrl/nomadik/pinctrl-nomadik.c:1193:22: error: incompatible
 pointer types initializing 'struct device_node *' with an expression of type
 'struct fwnode_handle *'
Message-ID: <202403030335.VHvC2QUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   528904342169c582c128c4f83fbc4a7c9611fb0a
commit: 528904342169c582c128c4f83fbc4a7c9611fb0a [27/27] gpio: nomadik: Finish conversion to use firmware node APIs
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240303/202403030335.VHvC2QUS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030335.VHvC2QUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030335.VHvC2QUS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1193:22: error: incompatible pointer types initializing 'struct device_node *' with an expression of type 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
           struct device_node *fwnode = dev_fwnode(&pdev->dev);
                               ^        ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1222:39: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'const struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
                   gpio_fwnode = fwnode_find_reference(fwnode, "nomadik-gpio-chips", i);
                                                       ^~~~~~
   include/linux/property.h:144:73: note: passing argument to parameter 'fwnode' here
   struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
                                                                           ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:38: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'const struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
           prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);
                                               ^~~~~~
   include/linux/property.h:144:73: note: passing argument to parameter 'fwnode' here
   struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
                                                                           ^
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:14: error: incompatible pointer types assigning to 'struct device_node *' from 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
           prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1238:34: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
                   npct->prcm_base = fwnode_iomap(prcm_fwnode, 0);
                                                  ^~~~~~~~~~~
   include/linux/property.h:452:50: note: passing argument to parameter 'fwnode' here
   void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
                                                    ^
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:1239:21: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
                   fwnode_handle_put(prcm_fwnode);
                                     ^~~~~~~~~~~
   include/linux/property.h:190:46: note: passing argument to parameter 'fwnode' here
   void fwnode_handle_put(struct fwnode_handle *fwnode);
                                                ^
   6 errors generated.


vim +1193 drivers/pinctrl/nomadik/pinctrl-nomadik.c

  1190	
  1191	static int nmk_pinctrl_probe(struct platform_device *pdev)
  1192	{
> 1193		struct device_node *fwnode = dev_fwnode(&pdev->dev);
  1194		struct device_node *prcm_fwnode;
  1195		struct nmk_pinctrl *npct;
  1196		uintptr_t version = 0;
  1197		int i;
  1198	
  1199		npct = devm_kzalloc(&pdev->dev, sizeof(*npct), GFP_KERNEL);
  1200		if (!npct)
  1201			return -ENOMEM;
  1202	
  1203		version = (uintptr_t)device_get_match_data(&pdev->dev);
  1204	
  1205		/* Poke in other ASIC variants here */
  1206		if (version == PINCTRL_NMK_STN8815)
  1207			nmk_pinctrl_stn8815_init(&npct->soc);
  1208		if (version == PINCTRL_NMK_DB8500)
  1209			nmk_pinctrl_db8500_init(&npct->soc);
  1210	
  1211		/*
  1212		 * Since we depend on the GPIO chips to provide clock and register base
  1213		 * for the pin control operations, make sure that we have these
  1214		 * populated before we continue. Follow the phandles to instantiate
  1215		 * them. The GPIO portion of the actual hardware may be probed before
  1216		 * or after this point: it shouldn't matter as the APIs are orthogonal.
  1217		 */
  1218		for (i = 0; i < NMK_MAX_BANKS; i++) {
  1219			struct fwnode_handle *gpio_fwnode;
  1220			struct nmk_gpio_chip *nmk_chip;
  1221	
> 1222			gpio_fwnode = fwnode_find_reference(fwnode, "nomadik-gpio-chips", i);
  1223			if (IS_ERR(gpio_fwnode))
  1224				continue;
  1225	
  1226			dev_info(&pdev->dev, "populate NMK GPIO %d \"%pfwP\"\n", i, gpio_fwnode);
  1227			nmk_chip = nmk_gpio_populate_chip(gpio_fwnode, pdev);
  1228			if (IS_ERR(nmk_chip))
  1229				dev_err(&pdev->dev,
  1230					"could not populate nmk chip struct - continue anyway\n");
  1231			fwnode_handle_put(gpio_fwnode);
  1232			/* We are NOT compatible with mobileye,eyeq5-gpio. */
  1233			BUG_ON(nmk_chip->is_mobileye_soc);
  1234		}
  1235	
> 1236		prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);
  1237		if (!IS_ERR(prcm_fwnode)) {
> 1238			npct->prcm_base = fwnode_iomap(prcm_fwnode, 0);
  1239			fwnode_handle_put(prcm_fwnode);
  1240		}
  1241		if (!npct->prcm_base) {
  1242			if (version == PINCTRL_NMK_STN8815) {
  1243				dev_info(&pdev->dev,
  1244					 "No PRCM base, assuming no ALT-Cx control is available\n");
  1245			} else {
  1246				dev_err(&pdev->dev, "missing PRCM base address\n");
  1247				return -EINVAL;
  1248			}
  1249		}
  1250	
  1251		nmk_pinctrl_desc.pins = npct->soc->pins;
  1252		nmk_pinctrl_desc.npins = npct->soc->npins;
  1253		npct->dev = &pdev->dev;
  1254	
  1255		npct->pctl = devm_pinctrl_register(&pdev->dev, &nmk_pinctrl_desc, npct);
  1256		if (IS_ERR(npct->pctl)) {
  1257			dev_err(&pdev->dev, "could not register Nomadik pinctrl driver\n");
  1258			return PTR_ERR(npct->pctl);
  1259		}
  1260	
  1261		platform_set_drvdata(pdev, npct);
  1262		dev_info(&pdev->dev, "initialized Nomadik pin control driver\n");
  1263	
  1264		return 0;
  1265	}
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

