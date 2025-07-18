Return-Path: <linux-gpio+bounces-23427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D3B0993D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 03:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1230E7B7EB9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 01:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F11194A44;
	Fri, 18 Jul 2025 01:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NS1QdQzK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3E145FE0;
	Fri, 18 Jul 2025 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752802685; cv=none; b=uxF8WRkIMllPB6JfQFjfb8beDCsfAw7JWGcjZa4j/+zrs9poP6vxs5tfoQu2leFIwDz/koG/Yvv+Uq4n8QQ+KhX/1WE4Y7AxcDPjgVDDDJde9+F1RhpVtXKDSJfN5vLzEU0LOtBl0DPu17Jmd7wOFoW8aHtKTjeptCghnNuBZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752802685; c=relaxed/simple;
	bh=a7LNu8NM/J83vU8tzW57I182ndErEcS3Is01U9ZCDZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+4Vtvx66JoV889QGSY8CLuVqZWUFKEVojutu2tDfIP8CnCowKz7L6Pkgbj0nXMyA1ewuJCv2g+byViqaZpbCQNwg8JsXzuS9NtmIILafYOPhMA2pWpZyMqsn9EVRUMD6ynbID8K4B/QEFRPdg2pjwFYm2G+XNMVoi5Uq5nEL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NS1QdQzK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752802684; x=1784338684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7LNu8NM/J83vU8tzW57I182ndErEcS3Is01U9ZCDZI=;
  b=NS1QdQzKjs0UZzn8ADwGtMz+WxXlpEGaMkhsM/+Z9KuRxd7FNPvn1bzh
   OsL+CVZDz47chAPEvsaJTdZlcnMAB2JrheuYUVehbl6ehHD+ddz0Kf8oA
   HhYDWHLwz5qmJ19RcwVK9dHqliahucuqvVTlmWNdQ72qM/v0Plb0eJ1uq
   9q1CGrdV/tIFw539XQMAbHXzbn/9xCuA90Q3NOT4b24xS2DJqDhKrvvsL
   8wLdrxJ2IDPEn2rICW20rZ1dcjIez/AYJCCKXTXw22nketLZ3eotfGdRw
   fsAPLIGwvWOXIdG2siWfIm2Gn8Suiyt9B+jocc5phCjskWMst3KfDitUM
   g==;
X-CSE-ConnectionGUID: ehMS2N73SCqxQPW5MSxexw==
X-CSE-MsgGUID: aZTEDhOWTwWfVsp6uzZx5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72661785"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="72661785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:38:03 -0700
X-CSE-ConnectionGUID: jpucQ4OlRqKihWV4hGzGMg==
X-CSE-MsgGUID: oRZWHOB0Srq4cJKs1OFhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162216197"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 18:37:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uca2u-000ECr-2H;
	Fri, 18 Jul 2025 01:37:56 +0000
Date: Fri, 18 Jul 2025 09:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
Message-ID: <202507180929.p1tVAhva-lkp@intel.com>
References: <20250716193111.942217-19-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-19-demonsingur@gmail.com>

Hi Cosmin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250716]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-19-demonsingur%40gmail.com
patch subject: [PATCH v6 18/24] media: i2c: maxim-serdes: add MAX96717 driver
config: x86_64-randconfig-003-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180929.p1tVAhva-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180929.p1tVAhva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180929.p1tVAhva-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_conf_pin_config_get':
>> drivers/media/i2c/maxim-serdes/max96717.c:485: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_conf_pin_config_set':
   drivers/media/i2c/maxim-serdes/max96717.c:655: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_mux_set':
   drivers/media/i2c/maxim-serdes/max96717.c:712: undefined reference to `pinctrl_dev_get_drvdata'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `max96717_gpiochip_probe':
>> drivers/media/i2c/maxim-serdes/max96717.c:1553: undefined reference to `devm_pinctrl_register_and_init'
>> ld: drivers/media/i2c/maxim-serdes/max96717.c:1557: undefined reference to `pinctrl_enable'
   ld: drivers/media/i2c/maxim-serdes/max96717.o: in function `pinconf_generic_dt_node_to_map_pin':
>> include/linux/pinctrl/pinconf-generic.h:219: undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: drivers/media/i2c/maxim-serdes/max96717.o:(.rodata+0xa68): undefined reference to `pinconf_generic_dt_free_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
   Depends on [n]: PINCTRL [=n]
   Selected by [y]:
   - VIDEO_MAX96717 [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y]


vim +485 drivers/media/i2c/maxim-serdes/max96717.c

   480	
   481	static int max96717_conf_pin_config_get(struct pinctrl_dev *pctldev,
   482						unsigned int offset,
   483						unsigned long *config)
   484	{
 > 485		struct max96717_priv *priv = pinctrl_dev_get_drvdata(pctldev);
   486		u32 param = pinconf_to_config_param(*config);
   487		unsigned int reg, mask, val, en_val;
   488		int ret;
   489	
   490		ret = max96717_get_pin_config_reg(offset, param, &reg, &mask, &en_val);
   491		if (ret)
   492			return ret;
   493	
   494		switch (param) {
   495		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
   496		case PIN_CONFIG_DRIVE_PUSH_PULL:
   497		case PIN_CONFIG_BIAS_DISABLE:
   498		case PIN_CONFIG_BIAS_PULL_DOWN:
   499		case PIN_CONFIG_BIAS_PULL_UP:
   500		case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
   501		case MAX96717_PINCTRL_TX_EN:
   502		case MAX96717_PINCTRL_RX_EN:
   503		case PIN_CONFIG_OUTPUT_ENABLE:
   504		case PIN_CONFIG_INPUT_ENABLE:
   505			ret = regmap_read(priv->regmap, reg, &val);
   506			if (ret)
   507				return ret;
   508	
   509			val = field_get(mask, val) == en_val;
   510			if (!val)
   511				return -EINVAL;
   512	
   513			break;
   514		case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
   515		case MAX96717_PINCTRL_INPUT_VALUE:
   516		case PIN_CONFIG_OUTPUT:
   517			ret = regmap_read(priv->regmap, reg, &val);
   518			if (ret)
   519				return ret;
   520	
   521			val = field_get(mask, val) == en_val;
   522			break;
   523		case MAX96717_PINCTRL_TX_ID:
   524		case MAX96717_PINCTRL_RX_ID:
   525		case PIN_CONFIG_SLEW_RATE:
   526			ret = regmap_read(priv->regmap, reg, &val);
   527			if (ret)
   528				return ret;
   529	
   530			val = field_get(mask, val);
   531			break;
   532		default:
   533			return -ENOTSUPP;
   534		}
   535	
   536		switch (param) {
   537		case PIN_CONFIG_BIAS_PULL_DOWN:
   538		case PIN_CONFIG_BIAS_PULL_UP:
   539			*config = pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIGH, 0);
   540	
   541			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   542			if (ret)
   543				return ret;
   544	
   545			val = pinconf_to_config_argument(*config);
   546			if (val)
   547				val = MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
   548			else
   549				val = MAX96717_BIAS_PULL_STRENGTH_40000_OHM;
   550	
   551			break;
   552		case MAX96717_PINCTRL_TX_ID:
   553			*config = pinconf_to_config_packed(MAX96717_PINCTRL_TX_EN, 0);
   554	
   555			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   556			if (ret)
   557				return ret;
   558	
   559			break;
   560		case MAX96717_PINCTRL_RX_ID:
   561			*config = pinconf_to_config_packed(MAX96717_PINCTRL_RX_EN, 0);
   562	
   563			ret = max96717_conf_pin_config_get(pctldev, offset, config);
   564			if (ret)
   565				return ret;
   566	
   567			break;
   568		default:
   569			break;
   570		}
   571	
   572		*config = pinconf_to_config_packed(param, val);
   573	
   574		return 0;
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

