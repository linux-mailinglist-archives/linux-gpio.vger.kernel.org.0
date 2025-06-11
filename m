Return-Path: <linux-gpio+bounces-21297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57300AD491B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 05:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956FA17CCB1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 03:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB37E226CE4;
	Wed, 11 Jun 2025 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjmtIOHb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341312253FB;
	Wed, 11 Jun 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611028; cv=none; b=qFV965rQ12OKpkgiN4b6m0qJMtA7dpnZX9AyLi2s9a/0uwMPpXwqdLWrZAXlQ7A7pco5XpYwjPcoZjWFsJpBqQVeg7O1sc1xrSPkfhgsl35YBPO3iGIxZ7BhTkAvIqMRiQ181AQUGBfSUi0DB3miME0u3A5NpNsanYD2drL8ljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611028; c=relaxed/simple;
	bh=3zY7OPrHfBJ8D5fNCMI/aXZ74/+C9WQVAvtm2BH8Q9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8ifMNKc7p3jl5SDvrTfk+yCbLHyMVYh0sRGmVu20KT8o6xFsnyOKHa3BwW9rLmQVWPnjpvC0a+e4vvh7sMpc9IXSZ9XKF69gaP9F827+os68vNC6CUJp8FQLj5Uao7DRaxmWXa/IgoP8C2sIQWxoNgslyY8TdULq91TPgkgt60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjmtIOHb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749611026; x=1781147026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zY7OPrHfBJ8D5fNCMI/aXZ74/+C9WQVAvtm2BH8Q9I=;
  b=fjmtIOHbbw86645V5eWVYESoCCbl+MgvtxcC84aKxE9H99nReSp/H116
   AcXaiF/K4pySfu8kFBxU7Bi1oxsaSWOcYSMJwaIzwP4FT/qWOU2rN+xW1
   5DgblMmaY5k++NHuPyElpVJ9FAL+AZ97WdmXU6SrzX41IFrr2K69QeATf
   TEZRQfTgYCGiz5dCojAyvrkLPP7mS65tNRZKCXYta+uhJopFzjzRlzw0T
   1cXmc6ZuEXzqADAcEiejyk3AnJ6n4IqeBqLoerlh05zEW3Q2GtJS51b1s
   Fh0H2ksWHLMYX8dmEvfocbPdLNfCoQv/Dt/LfYsk+sol/kdIootUeZGEp
   w==;
X-CSE-ConnectionGUID: zqYF68dsR1OxLx3BVE7Kow==
X-CSE-MsgGUID: SfFbxYV7TxGH27aFVkKshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55544310"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="55544310"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 20:03:46 -0700
X-CSE-ConnectionGUID: 2dff+bDFRzGZFeWc8MMivA==
X-CSE-MsgGUID: 3H9wXEEfRfec+bJEfsTIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146930170"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jun 2025 20:03:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPBkY-0009xY-1A;
	Wed, 11 Jun 2025 03:03:38 +0000
Date: Wed, 11 Jun 2025 11:03:11 +0800
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
Subject: Re: [PATCH v4 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Message-ID: <202506111019.lK2Vphtz-lkp@intel.com>
References: <20250610092852.21986-4-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092852.21986-4-darren.ye@mediatek.com>

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.16-rc1 next-20250610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250610-175139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250610092852.21986-4-darren.ye%40mediatek.com
patch subject: [PATCH v4 03/10] ASoC: mediatek: mt8196: support audio clock control
config: i386-buildonly-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111019.lK2Vphtz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111019.lK2Vphtz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111019.lK2Vphtz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/pcm186x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm3060.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm3168a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/pcm512x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rl6231.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rl6347a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt-sdw-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5514-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5640.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5645.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5659.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5663.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5670.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5677-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5677.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5682.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/rt5682s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/sigmadsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/src4xxx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/ssm2602.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-comlib-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-comlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tas2781-fmwlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic23.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic32x4-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic32x4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/tlv320aic3x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/ts3a227e.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/twl6040.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd-clsh-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd-mbhc-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd937x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd938x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wcd939x-sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wl1273.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8350.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8731.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8804.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8903.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8962.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8994.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm8996.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_adsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/codecs/wm_hubs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_asrc_m2m.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/fsl_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-audmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/imx-pcm-fiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/lpc3xxx-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/fsl/mpc5200_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/audio-graph-card2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/generic/simple-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst-mfld-platform-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/atom/sst/sst_pvt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/hda_dsp_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_board_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_cirrus_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_maxim_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_nuvoton_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/boards/sof_realtek_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-adl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-arl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-bxt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-byt-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cfl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cht-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cml-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-cnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ehl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-glk-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hda-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-hsw-bdw-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-icl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-jsl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-kbl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-lnl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-mtl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ptl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-rpl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-skl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-ssp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/intel/common/soc-acpi-intel-tgl-match.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-fe-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-afe-platform-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dai-adda-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-dsp-sof-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/common/mtk-soundcard-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8186/mt8186-mt6366-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8188/mt8188-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-afe-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8192/mt8192-dai-i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mediatek/mt8195/mt8195-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> sound/soc/mediatek/mt8196/mt8196-afe-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-fifo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-formatter.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/axg-tdm-interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-card-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/meson/meson-codec-glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/mxs/mxs-saif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/lpass-hdmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/audioreach.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6adm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6afe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6apm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6asm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6prm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/q6routing.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/qdsp6/topology.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/sdw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/qcom/usb_offload_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/renesas/siu_pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/dmaengine.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/samsung/idma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_asoc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdca/sdca_regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l42.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs42l43.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_cs_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_maxim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt5682.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt711.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_amp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_dmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sdw_utils/soc_sdw_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-component.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-dapm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-generic-dmaengine-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-link.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/soc-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp63.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/acp70.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/rembrandt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/renoir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/amd/vangogh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/compress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/fw-file-profile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/imx/imx-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/atom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/cnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-codec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-common-ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dai.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-mlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-probes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-sdw-bpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda-trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/hda.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/lnl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/mtl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/ptl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/skl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/intel/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/iomem-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   sound/soc/sof/ipc4-pcm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

