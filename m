Return-Path: <linux-gpio+bounces-20190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050BAB7CB6
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 06:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 288DE1B6571E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 04:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668EE279358;
	Thu, 15 May 2025 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMhXI4Rb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F21863E;
	Thu, 15 May 2025 04:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747284130; cv=none; b=HKo1PJOFbWalkpWtD5xhQE5uImnKZ5WdZN3bmc3XjQiuHaMG6DNI4kgCmfjB+D1U3UXkSkSCrK0F+8HIkd4IuqrZgJPY98MUY7QWcMzqqai9yPQBrKyZRRaSItdO9efrppRUkqOdjDxk2T2RFfS0l2GtEGiQmLcO2oNJ3+2bIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747284130; c=relaxed/simple;
	bh=eMKbF1YyG2PQHQK5zGvXb1tw4RrftzaTI5iILQ1V+To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ou1jCtPkBcq4OmymOgYfQ+2WehQXn0TLjWf+Mi7fqpnEayuc9VkrT4AM+pU107xcbXeRRLP1vjGkSvfvu8DoChzzWdrbjEjseqoTOocfv0R4gkm5XR5Uj9LYiZ0/OneOO8oPre6O65XZFvZoXxZM9ZVcSiu539MFZ+wE/t5Cgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMhXI4Rb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747284128; x=1778820128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eMKbF1YyG2PQHQK5zGvXb1tw4RrftzaTI5iILQ1V+To=;
  b=UMhXI4Rb2jpN25mxvXt1naKmovjGz1GFfDl6DH3HyyRQi0eXFTsAtWww
   pgFTLbnKjRnPLl1OXj+OJA46j4CshQRe3OEOQ1WtKqQtXUH0lP9wJtlC9
   8OfFw6oCJ1CVI3dXYc3dY3j410bXnONonaTLOQbAllFMq/uzilH8dVWnZ
   JyxmR5JD/lk8fQw2BetwZoJG3195Od06M4EgUU0z9hRHkJ10KYND/3BMC
   HQEpq+znadOLS4pFdeEI49N7jtU+ZJqOjPi3TV83+K92Sn75YpOY9scq3
   iH9HLOU0nREslhY2L52i5hbu3KfnF08BPEnfA5bNUUdgcoBufjWop5859
   w==;
X-CSE-ConnectionGUID: 8jg70eVNTCKyQkqPR0VfFw==
X-CSE-MsgGUID: vxlzYJR5RU+y4BpEr0iIpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36825719"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="36825719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 21:42:00 -0700
X-CSE-ConnectionGUID: gmMAhZyOTOWsmCZCt08MmQ==
X-CSE-MsgGUID: /lVec4e1RMaGj5d52888vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138119667"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2025 21:41:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQPp-000HvT-1C;
	Thu, 15 May 2025 04:41:53 +0000
Date: Thu, 15 May 2025 12:41:50 +0800
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
Subject: Re: [PATCH v3 07/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <202505151200.uFAkmc5O-lkp@intel.com>
References: <20250514081125.24475-8-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514081125.24475-8-darren.ye@mediatek.com>

Hi Darren.Ye,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darren-Ye/ASoC-mediatek-common-modify-mtk-afe-platform-driver-for-mt8196/20250514-161921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250514081125.24475-8-darren.ye%40mediatek.com
patch subject: [PATCH v3 07/10] ASoC: mediatek: mt8196: add platform driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250515/202505151200.uFAkmc5O-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151200.uFAkmc5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151200.uFAkmc5O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8196/mt8196-dai-adda.c:384:30: warning: 'mt8196_adda_enum' defined but not used [-Wunused-const-variable=]
     384 | static const struct soc_enum mt8196_adda_enum[] = {
         |                              ^~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c: In function 'init_i2s_priv_data':
>> sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:4001:21: warning: the comparison will always evaluate as 'true' for the address of 'mt8196_i2s_priv' will never be NULL [-Waddress]
    4001 |                 if (&mt8196_i2s_priv[i]) {
         |                     ^
   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c:3889:38: note: 'mt8196_i2s_priv' declared here
    3889 | static const struct mtk_afe_i2s_priv mt8196_i2s_priv[DAI_I2S_NUM] = {
         |                                      ^~~~~~~~~~~~~~~


vim +/mt8196_adda_enum +384 sound/soc/mediatek/mt8196/mt8196-dai-adda.c

640b731680b027 Darren Ye 2025-05-14  383  
640b731680b027 Darren Ye 2025-05-14 @384  static const struct soc_enum mt8196_adda_enum[] = {
640b731680b027 Darren Ye 2025-05-14  385  	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8196_adda_off_on_str),
640b731680b027 Darren Ye 2025-05-14  386  			    mt8196_adda_off_on_str),
640b731680b027 Darren Ye 2025-05-14  387  };
640b731680b027 Darren Ye 2025-05-14  388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

