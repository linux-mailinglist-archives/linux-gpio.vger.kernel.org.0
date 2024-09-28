Return-Path: <linux-gpio+bounces-10531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56122988D77
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 04:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907BF28315A
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2024 02:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A0A1BDDB;
	Sat, 28 Sep 2024 02:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XK6EqbG2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43814295;
	Sat, 28 Sep 2024 02:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727488866; cv=none; b=EcJ3LHK0Nq289KA5Y+D2dKHUuyBatVQpScJ2mbMh8Rhl0xAJB6USNBAaucFnBDkTWEzwiXdXYrX0IPDi61w4nCv/scKmuZbltRnG2NiFERHlD0gCZcoInoAe2D7yGeOd2Bnx434DQE1tAmKKpYLh5QMwyNvZJZRSmpEebfQnC1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727488866; c=relaxed/simple;
	bh=B0hDTo+aoXxw0AAPicUpctplhokJ78Jz3FNO3oGMdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i268LA3xPf6gUf9pCfgR8Jr1QixWVJcBl01/GPqfFjJ6VPYGbBa5iL7NYd1DEObyuhn+42IiNePfupNxzxXuixvZ+gmnirw3S8iaAj/AqVMYkQhF8LdYTAHHYVqKBsNj1Ao1+tMiky+/9zgW//HFfztRGvQU4N26Ygd5Cfp0dow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XK6EqbG2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727488863; x=1759024863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0hDTo+aoXxw0AAPicUpctplhokJ78Jz3FNO3oGMdjs=;
  b=XK6EqbG2mljohs8e/SNqevD1RBQDPqQzfVS6vyoTi+qDz8kv3oMB9V+N
   RUzvsIR1mAx2SbzehijuJBlbL1O978cYcgrRZ0IdrVeUpSl5kbsxtF/WD
   xc86Rmexg2rkyxxbKO8ivO6o4/dyJgtJqa6ROUzDkeqQx0+oHM5WBoTRA
   P6hUH0irrWGwZuRJMU1/HRQD37gcuFd/y6Jr3hK+cMubf+ybjaeyeGFUm
   6jsTbkNu/NMub1ki02U4MSrQJNRIaMy3cgFAo9oMsGJ6aXezr1fP4Xzn4
   4/CBFIv8XZS0IPto5vFbzH6c2bz37EASEWJ1N4Lz2tlSc869SkfnWWb1X
   w==;
X-CSE-ConnectionGUID: mUOyy1I7T/6ssxlXIs7HWQ==
X-CSE-MsgGUID: 6ugb0AtbQnye/w7kYtaYNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30535220"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30535220"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:01:00 -0700
X-CSE-ConnectionGUID: uAa4TFtBTmKYWHLL4w/w+g==
X-CSE-MsgGUID: kLnfXukeRt+crR+PvgSM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73025912"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 19:00:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suMlQ-000Mpw-2G;
	Sat, 28 Sep 2024 02:00:52 +0000
Date: Sat, 28 Sep 2024 10:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202409280936.0GoVcXMc-lkp@intel.com>
References: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus robh/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/drivers-provide-devm_platform_get_and_ioremap_resource_byname/20240926-223448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240926143122.1385658-4-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: mips-randconfig-r123-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280936.0GoVcXMc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409280936.0GoVcXMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280936.0GoVcXMc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse:    unsigned int *
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse:    unsigned long long [usertype] *
   drivers/gpio/gpio-siul2-s32g2.c:143:9: sparse: sparse: context imbalance in 'siul2_gpio_set_direction' - wrong count at exit
   drivers/gpio/gpio-siul2-s32g2.c:296:46: sparse: sparse: shift too big (32) for type unsigned int

vim +296 drivers/gpio/gpio-siul2-s32g2.c

   273	
   274	static struct regmap *common_regmap_init(struct platform_device *pdev,
   275						 struct regmap_config *conf,
   276						 const char *name)
   277	{
   278		struct device *dev = &pdev->dev;
   279		struct resource *res;
   280		resource_size_t size;
   281		void __iomem *base;
   282	
   283		base = devm_platform_get_and_ioremap_resource_byname(pdev, name, &res);
   284		if (IS_ERR(base)) {
   285			dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
   286			return ERR_PTR(-EINVAL);
   287		}
   288	
   289		size = resource_size(res);
   290		conf->val_bits = conf->reg_stride * 8;
   291		conf->max_register = size - conf->reg_stride;
   292		conf->name = name;
   293		conf->use_raw_spinlock = true;
   294	
   295		if (conf->cache_type != REGCACHE_NONE)
 > 296			conf->num_reg_defaults_raw = do_div(size, conf->reg_stride);
   297	
   298		return devm_regmap_init_mmio(dev, base, conf);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

