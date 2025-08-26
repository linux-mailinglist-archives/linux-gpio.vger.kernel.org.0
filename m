Return-Path: <linux-gpio+bounces-24949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C44B351DC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 04:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667D91B6173B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 02:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750B2279335;
	Tue, 26 Aug 2025 02:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D98vDBHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEBB1C8610;
	Tue, 26 Aug 2025 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176460; cv=none; b=TBtE9eIEtEnuwUaee1MOlejJ8yzVK9mJsqsEGjEhBmwjDf2LP+G+sLjUAWZGwf6w/g7m2c37DZy7oK/+EsEQWf6Q72PbzHbD5sn+1TDxh0L3+iTgWMrTdqDNnD1oCBsPzNFcklw9eXmfKV1ZMRBlU5vHA3ev0sFTjPjtgFJCcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176460; c=relaxed/simple;
	bh=Wm/2S21Pg6Nmoyskp843r48HknqB72yRjYDtSbAC9eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFGNIuHr5E+0ekOUOIx7m3EEkLhT7MZULYkQp3ymQA3w/xz/6wYVaKhVsmZPs8J07Yc1wiJDlMEd/ubuF+qUp3WrZVaNuiDkzyjC5WWfZaiN14OcDyqRG9AvdsQ48tP3aN4ZJdBPmj0Wz1RX3DrJy/1HFvOe6kd9yGgb9l8KdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D98vDBHd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756176458; x=1787712458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wm/2S21Pg6Nmoyskp843r48HknqB72yRjYDtSbAC9eI=;
  b=D98vDBHdVQiSsAWdYqa8G9n9+g2+p+qrSIAMoIQR+MDNj8uREv5nzUri
   wi6qtgINiynikjMY638u2U1uz76pJY8qMHiSZ4jzVN7/m0sKaMpivEd1w
   Dv9c7yeA9IsvU4Bi8gZ8kARpN8l3/CFPbuNvedc9gh01wgtc38ukSiwG/
   dx2+q6GYT69tst8fAOBV3nWOB/O4wCdfPcTv+1qKGsgA59O2tXqa7oILo
   MfeK5VxxaOLNKobEn+6BmCEr0yOsma4vTd92HLAtXbChTEH7AVWsaK10F
   mlqU2RgC3Us3MPJvI8kneNOygajSo7frSLAdZnO7yRUozKG/oAm3Kgnxj
   g==;
X-CSE-ConnectionGUID: VrOeYicPSWm+O9I8dpiacA==
X-CSE-MsgGUID: 0HV8kHJQTvielMcDZqsvcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58467741"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58467741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 19:47:37 -0700
X-CSE-ConnectionGUID: olyZ81apQuaoegO1K0ddNw==
X-CSE-MsgGUID: gZmNKNo5SPmhtImu+Ik1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173760513"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Aug 2025 19:47:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqjic-000OB9-1g;
	Tue, 26 Aug 2025 02:47:30 +0000
Date: Tue, 26 Aug 2025 10:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH v7 09/10] ASoC: mediatek: mt8196: add machine driver with
 nau8825
Message-ID: <202508261004.7adPXk4m-lkp@intel.com>
References: <20250822125301.12333-10-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822125301.12333-10-darren.ye@mediatek.com>

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.17-rc3 next-20250825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250822-210108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250822125301.12333-10-darren.ye%40mediatek.com
patch subject: [PATCH v7 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
config: arm64-randconfig-r131-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261004.7adPXk4m-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508261004.7adPXk4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261004.7adPXk4m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int to @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse:     expected unsigned int to
   sound/soc/mediatek/mt8196/mt8196-nau8825.c:183:33: sparse:     got restricted snd_pcm_format_t [usertype]

vim +183 sound/soc/mediatek/mt8196/mt8196-nau8825.c

   175	
   176	static int mt8196_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
   177					  struct snd_pcm_hw_params *params)
   178	{
   179		dev_info(rtd->dev, "fix format to 32bit\n");
   180	
   181		/* fix BE i2s format to 32bit, clean param mask first */
   182		snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
 > 183				     0, SNDRV_PCM_FORMAT_LAST);
   184	
   185		params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
   186		return 0;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

