Return-Path: <linux-gpio+bounces-21948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B035AE2809
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 10:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45C047AC550
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 08:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835CC1E1A16;
	Sat, 21 Jun 2025 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIy7nkRB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA4195B1A;
	Sat, 21 Jun 2025 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494936; cv=none; b=bT6fUsDFsdysI/grn8VXGdzE74daOlYUZGLDGxNNurpdJ8d74aIumSm/OBtrakWn0nW5TC7zuXe1z5I6gcQ+KVOy3BwlaHL9wNLf0E22VNe7MuW7/LcF1TR103KMBKBZ2giBcGhNhotlBrVh9K2ZyH690zku/2SoimRXIqg7Bzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494936; c=relaxed/simple;
	bh=IxnvwpPtE9uiMFUZjHjsqPPB12QCtRhBXJ2KaoEI0sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh40yw9P+k5YM/t6s1TctsZ691qQyWAQiFyh4FdYBa8QyDVcOl3pj9Unr6qwPiGI9w/I9SRq5pFGwSow9mfuHg45fw0ITgt4AoFe9ORSVtGCeNv1eXm4iGYm4O9nrUwKM4YDKPlYcP3FGE6Z9z/4T2zSamHK9fEpHJDDYWBU2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIy7nkRB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750494934; x=1782030934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IxnvwpPtE9uiMFUZjHjsqPPB12QCtRhBXJ2KaoEI0sk=;
  b=GIy7nkRBvQyHa3RBChGbixYD7vhQ1h7ekL2ej3MVXcI/FxYEz2oBdjTu
   11ayPoG2BXEl121elRb4KXVua/NQjD1ijUyoLNpQQt2/hIGJe+ubE4sOH
   II1wucFJy+P4RhAkdYIbHthvwkxmLTG/Y/9DBhNJOvcKFQb0ngL46f/zD
   dlfnlS7bX7MSqOZkTvH/f79yEEDJZIhBmrTWZgcDDJus/KukiKtRlRxcr
   BHhs3KKS0/Mx8X7fiveZrnS2NCY7emiult77MPl5ow2XvJh9BpEosp2mY
   NMPfzDWtq5jW8+/XzcoJl874ytmvPwowttcwEwGP3OMyrk0J7eknBrwEL
   w==;
X-CSE-ConnectionGUID: v/zdKtSoQmi1bcrjKnwPUg==
X-CSE-MsgGUID: hCVX9DhfSyquA6OTJIYrqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52459030"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52459030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 01:35:33 -0700
X-CSE-ConnectionGUID: x3bpnHumREixSSOk2WjHgQ==
X-CSE-MsgGUID: tYh93x4SQcS5i6AK0sfC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="150897564"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Jun 2025 01:35:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSth7-000MU4-1R;
	Sat, 21 Jun 2025 08:35:25 +0000
Date: Sat, 21 Jun 2025 16:34:28 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: Re: [PATCH v5 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
Message-ID: <202506211649.TGCEqNZ6-lkp@intel.com>
References: <20250620094140.11093-2-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620094140.11093-2-darren.ye@mediatek.com>

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250620-174746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250620094140.11093-2-darren.ye%40mediatek.com
patch subject: [PATCH v5 01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250621/202506211649.TGCEqNZ6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211649.TGCEqNZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506211649.TGCEqNZ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/common/mtk-afe-platform-driver.c:125:18: warning: shift count is negative [-Wshift-count-negative]
     125 |         pcm_ptr_bytes = MTK_ALIGN_16BYTES(hw_ptr - hw_base);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/common/mtk-afe-platform-driver.h:15:37: note: expanded from macro 'MTK_ALIGN_16BYTES'
      15 | #define MTK_ALIGN_16BYTES(x) ((x) & GENMASK(39, 4))
         |                                     ^~~~~~~~~~~~~~
   include/linux/bits.h:87:31: note: expanded from macro 'GENMASK'
      87 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:7:56: note: expanded from macro '__GENMASK'
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +125 sound/soc/mediatek/common/mtk-afe-platform-driver.c

    79	
    80	snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
    81					      struct snd_pcm_substream *substream)
    82	{
    83		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
    84		struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
    85		struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
    86		const struct mtk_base_memif_data *memif_data = memif->data;
    87		struct regmap *regmap = afe->regmap;
    88		struct device *dev = afe->dev;
    89		unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
    90		unsigned int hw_base_lower32 = 0, hw_base_upper32 = 0;
    91		unsigned long long hw_ptr = 0, hw_base = 0;
    92		int ret;
    93		unsigned long long pcm_ptr_bytes = 0;
    94	
    95		ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
    96		if (ret || hw_ptr_lower32 == 0) {
    97			dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
    98			goto POINTER_RETURN_FRAMES;
    99		}
   100	
   101		if (memif_data->reg_ofs_cur_msb) {
   102			ret = regmap_read(regmap, memif_data->reg_ofs_cur_msb, &hw_ptr_upper32);
   103			if (ret) {
   104				dev_err(dev, "%s hw_ptr_upper32 err\n", __func__);
   105				goto POINTER_RETURN_FRAMES;
   106			}
   107		}
   108	
   109		ret = regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lower32);
   110		if (ret || hw_base_lower32 == 0) {
   111			dev_err(dev, "%s hw_base_lower32 err\n", __func__);
   112			goto POINTER_RETURN_FRAMES;
   113		}
   114		if (memif_data->reg_ofs_base_msb) {
   115			ret = regmap_read(regmap, memif_data->reg_ofs_base_msb, &hw_base_upper32);
   116			if (ret) {
   117				dev_err(dev, "%s hw_base_upper32 err\n", __func__);
   118				goto POINTER_RETURN_FRAMES;
   119			}
   120		}
   121		hw_ptr = ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lower32;
   122		hw_base = ((unsigned long long)hw_base_upper32 << 32) + hw_base_lower32;
   123	
   124	POINTER_RETURN_FRAMES:
 > 125		pcm_ptr_bytes = MTK_ALIGN_16BYTES(hw_ptr - hw_base);
   126		return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes);
   127	}
   128	EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

