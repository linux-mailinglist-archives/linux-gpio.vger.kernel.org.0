Return-Path: <linux-gpio+bounces-12478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7219B9D49
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 06:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 946771F254FE
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 05:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B037A155CB0;
	Sat,  2 Nov 2024 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5aC+BKP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFDE12C54B;
	Sat,  2 Nov 2024 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730524405; cv=none; b=Xp41T23ltT1neFotAo5grOd1V6wDA9pV+FiTqZaiXiutV7mRLGh6cQ0sQmAaqYvKoPZryiHEVDeJ6KtovGE3Q4Y9ic3jpRmIgRC8HF9LohlWwV2OA1TFLckVd3lyPXORz865XcjNScE59r3Mpq8gL/xgUBZfPGMVWirP6puyszo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730524405; c=relaxed/simple;
	bh=FEFai70Fx9mMmLhSeKDCsd4bTxFJ8xCKQnszuhWGniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA6/z4Sc9cGZn3kbfg4iZjIYvL6vJMur5bLZCs1fE8PlG4XSgcFMwMsciUhCUGepg3YiJT1ZqnwDL1fh3ZWGgxNJLGkbP99DOnhkTTlDmJjFquv4SY6deVloZQYg6I2JkqWGoisjcUzrdrRtJbtsc6u81fqAV6ryn1bMs5fDJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5aC+BKP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730524404; x=1762060404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEFai70Fx9mMmLhSeKDCsd4bTxFJ8xCKQnszuhWGniQ=;
  b=m5aC+BKPTCKm3wXuF42efvgH9HOYmitFkt5aZwN7a45GMQ054hzyzpdj
   IaZYoqGJNBP4zbmXECpAYCVaCbzgQipXzBMDq9auzuiH6uehy03x6Trrf
   E/FmT//PMUYS61fzhO4hFedqDHJgMCTogfVFqyxSYmvHo4rW1w2/PnU9f
   e9PqWGMfXeN3FDO/j/hgwBUa18wAnm/FJXvsn+ezxVbCOIDk1Qb4QshjO
   ZzFGuwY8xbLpLWlZ6T49LUy8JP3nudxwjv/+omG08KBgyfL6C2HzYKEe8
   OSwRgZWUXiGgcc70RMNcjf53dpPZNkrQ7aU0EhcU9sugNeToaspvL0nQa
   Q==;
X-CSE-ConnectionGUID: fm4WvVaNSKu8O38k19YxxQ==
X-CSE-MsgGUID: PHtp+UpAT22J1bG7p+APeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34219243"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="34219243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:13:23 -0700
X-CSE-ConnectionGUID: c4cyCoIuS5exgFm4KRL7+g==
X-CSE-MsgGUID: 0uMPw09mQ06+BoV3QLPuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="83269259"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Nov 2024 22:13:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76Rm-000iS5-18;
	Sat, 02 Nov 2024 05:13:14 +0000
Date: Sat, 2 Nov 2024 13:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <202411021558.f39S3DSV-lkp@intel.com>
References: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master lee-mfd/for-mfd-fixes v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411021558.f39S3DSV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021558.f39S3DSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021558.f39S3DSV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mfd/nxp-siul2.c:11:
   In file included from include/linux/mfd/nxp-siul2.h:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mfd/nxp-siul2.c:11:
   In file included from include/linux/mfd/nxp-siul2.h:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mfd/nxp-siul2.c:11:
   In file included from include/linux/mfd/nxp-siul2.h:11:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mfd/nxp-siul2.c:312:5: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     312 |                                 ret);
         |                                 ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/mfd/nxp-siul2.c:283:12: note: initialize the variable 'ret' to silence this warning
     283 |         int i, ret;
         |                   ^
         |                    = 0
>> drivers/mfd/nxp-siul2.c:367:12: warning: stack frame size (1296) exceeds limit (1024) in 'nxp_siul2_probe' [-Wframe-larger-than]
     367 | static int nxp_siul2_probe(struct platform_device *pdev)
         |            ^
   8 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/ret +312 drivers/mfd/nxp-siul2.c

   266	
   267	static int nxp_siul2_init_regmap(struct platform_device *pdev,
   268					 void __iomem *base, int siul)
   269	{
   270		struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
   271			[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
   272			[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
   273			[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
   274			[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
   275			[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
   276			[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
   277		};
   278		const struct nxp_siul2_reg_range_info *tmp_range;
   279		struct regmap_config *tmp_conf;
   280		struct nxp_siul2_info *info;
   281		struct nxp_siul2_mfd *priv;
   282		void __iomem *reg_start;
   283		int i, ret;
   284	
   285		priv = platform_get_drvdata(pdev);
   286		info = &priv->siul2[siul];
   287	
   288		for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
   289			if (!s32g2_reg_ranges[siul][i].valid)
   290				continue;
   291	
   292			tmp_range = &s32g2_reg_ranges[siul][i];
   293			tmp_conf = &regmap_configs[i];
   294			tmp_conf->name = tmp_range->reg_name;
   295			tmp_conf->max_register =
   296				tmp_range->reg_end_offset - tmp_range->reg_start_offset;
   297	
   298			if (tmp_conf->cache_type != REGCACHE_NONE)
   299				tmp_conf->num_reg_defaults_raw =
   300					tmp_conf->max_register / tmp_conf->reg_stride;
   301	
   302			if (tmp_range->reg_access) {
   303				tmp_conf->wr_table = tmp_range->reg_access;
   304				tmp_conf->rd_table = tmp_range->reg_access;
   305			}
   306	
   307			reg_start = base + tmp_range->reg_start_offset;
   308			info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
   309								 tmp_conf);
   310			if (IS_ERR(info->regmaps[i])) {
   311				dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
 > 312					ret);
   313				return PTR_ERR(info->regmaps[i]);
   314			}
   315		}
   316	
   317		return 0;
   318	}
   319	
   320	static int nxp_siul2_parse_dtb(struct platform_device *pdev)
   321	{
   322		struct device_node *np = pdev->dev.of_node;
   323		struct of_phandle_args pinspec;
   324		struct nxp_siul2_mfd *priv;
   325		void __iomem *base;
   326		char reg_name[16];
   327		int i, ret;
   328	
   329		priv = platform_get_drvdata(pdev);
   330	
   331		for (i = 0; i < priv->num_siul2; i++) {
   332			ret = snprintf(reg_name, ARRAY_SIZE(reg_name), "siul2%d", i);
   333			if (ret < 0 || ret >= ARRAY_SIZE(reg_name))
   334				return ret;
   335	
   336			base = devm_platform_ioremap_resource_byname(pdev, reg_name);
   337			if (IS_ERR(base)) {
   338				dev_err(&pdev->dev, "Failed to get MEM resource: %s\n",
   339					reg_name);
   340				return PTR_ERR(base);
   341			}
   342	
   343			ret = nxp_siul2_init_regmap(pdev, base, i);
   344			if (ret)
   345				return ret;
   346	
   347			ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
   348							       i, &pinspec);
   349			if (ret)
   350				return ret;
   351	
   352			of_node_put(pinspec.np);
   353	
   354			if (pinspec.args_count != 3) {
   355				dev_err(&pdev->dev, "Invalid pinspec count: %d\n",
   356					pinspec.args_count);
   357				return -EINVAL;
   358			}
   359	
   360			priv->siul2[i].gpio_base = pinspec.args[1];
   361			priv->siul2[i].gpio_num = pinspec.args[2];
   362		}
   363	
   364		return 0;
   365	}
   366	
 > 367	static int nxp_siul2_probe(struct platform_device *pdev)
   368	{
   369		struct nxp_siul2_mfd *priv;
   370		int ret;
   371	
   372		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   373		if (!priv)
   374			return -ENOMEM;
   375	
   376		priv->num_siul2 = S32G_NUM_SIUL2;
   377		priv->siul2 = devm_kcalloc(&pdev->dev, priv->num_siul2,
   378					   sizeof(*priv->siul2), GFP_KERNEL);
   379		if (!priv->siul2)
   380			return -ENOMEM;
   381	
   382		platform_set_drvdata(pdev, priv);
   383		ret = nxp_siul2_parse_dtb(pdev);
   384		if (ret)
   385			return ret;
   386	
   387		return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
   388					    nxp_siul2_devs, ARRAY_SIZE(nxp_siul2_devs),
   389					    NULL, 0, NULL);
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

