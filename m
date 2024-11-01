Return-Path: <linux-gpio+bounces-12469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE69B965E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 18:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F8BC1C2113E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 17:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644731CACF2;
	Fri,  1 Nov 2024 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAHIHOH+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50C19F436;
	Fri,  1 Nov 2024 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481547; cv=none; b=fcLkpr44t5w3iphsDz1ANVj24D0aIrUDx/rqvbrbjb34HIwV48OZr/LJ2t+noHG3ja2QnpX5v/7g3gicW5j2xf6lkbevWx2zyCUHLp8BVh1TMgBzHfy1pJPlYCVi9qUu4pSph8GpqgGcWnnRHPFj7uP9P69YggLTaIpZB3Z7Gpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481547; c=relaxed/simple;
	bh=lxq998gJqdX9fpNp1aT7xjSU+QrdgsX0MPC9PiPtROo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ1s1T7WGzNNV3hzpCeg87aMuUIJAUvxnvVWpLcLweu/L4HpxoS1c6JJl0yYOACKvW0inSzldKD0pkC5KKTUyCfsB8gm3b+IUOK5jHri85M3TV4o3/ylwZ3fMlx662Q8xoqaEE0KVM6PY7vHscMeioeNNaFBGIMzZTNrNpzs1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAHIHOH+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730481544; x=1762017544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lxq998gJqdX9fpNp1aT7xjSU+QrdgsX0MPC9PiPtROo=;
  b=OAHIHOH+ksPwLqalkHhPyB2Aans8ro7VIiG/0Wr81+J4v7YwDYYly+Hw
   yXSXHySb4hCK/sB/ZX10mviQg5uvVFqE2Vqdw2xV7KWoJoT3Q5xcBorWD
   xl81173vgi6M+hTMZWsLU3Trj8yMRYzHK9lkiizTTLBDFl4XFBquYGM6z
   vo3SzPxI8itAoziyGHUnkeo+Zm2c9dHPwyCFGt7ehjNl5VIhpzVp2WuYY
   sGGr20djtu0m9E3WAppN763k8bf2daJd06+qNtXzs5QF5F2Dt27byLAe0
   ZzI4m7pYcuQ3O9HwdIhUatRyLKpQbMG0XoQf9E3H+FWYknn1/iFXziYzO
   Q==;
X-CSE-ConnectionGUID: az6DQv3JSGW2UauoIfvf0A==
X-CSE-MsgGUID: fbfm64AxTui1RTxyg2rUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29671138"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="29671138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 10:19:00 -0700
X-CSE-ConnectionGUID: erxjZ4CzSSuCmgrK+9hJFA==
X-CSE-MsgGUID: 4aOi8Hy6Tz+4ZlBe8q8cHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="88147807"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 10:18:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6vIO-000hnX-0z;
	Fri, 01 Nov 2024 17:18:48 +0000
Date: Sat, 2 Nov 2024 01:18:28 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <202411020003.C5suQQDX-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411020003.C5suQQDX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020003.C5suQQDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020003.C5suQQDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/nxp-siul2.c: In function 'nxp_siul2_init_regmap':
>> drivers/mfd/nxp-siul2.c:318:1: warning: the frame size of 1116 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     318 | }
         | ^
--
>> drivers/mfd/nxp-siul2.c:50: warning: Function parameter or struct member 'reg_name' not described in 'nxp_siul2_reg_range_info'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +318 drivers/mfd/nxp-siul2.c

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
   312					ret);
   313				return PTR_ERR(info->regmaps[i]);
   314			}
   315		}
   316	
   317		return 0;
 > 318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

