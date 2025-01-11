Return-Path: <linux-gpio+bounces-14682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2DA0A2D7
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 11:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA10E188C1FB
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 10:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EA11917CD;
	Sat, 11 Jan 2025 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rt/RYUat"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D7190482;
	Sat, 11 Jan 2025 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736591716; cv=none; b=hBkS4TlIzRNO+UtBkRYBNUARI4VHvhh03WEBLjXSIkF26w8+Pc6tG086ZlMe5XJlezZ4PF5lwjaZPS6phs8Ktynpp7EjoW6fqHhRNiWWwRDMR0tSaxqNaWJ4KjKblcYnvwqfFsG7WE3slRI6VZFoJC0b3uEmomJ1cR2sgmAAvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736591716; c=relaxed/simple;
	bh=4BeJTqqm28Qv5oKR0dD1hGxB/DuI9FfILfZRugCKv8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKhQ8oW72BCjFwB+BnTc3xCwQE0HgiomAHbb78+RTwALaaDg6gEjSbNp5iovaYQ5mZu0yRL0TJwvvha35gevw6gO2+rmAGp04x+dJv9+jgy+I+u6bYLJWW2rXy2FW1EwmY/WFIL3OBnFQzV7dwGEe4RgLENBF0s5LZL2/xtEdyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rt/RYUat; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736591714; x=1768127714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4BeJTqqm28Qv5oKR0dD1hGxB/DuI9FfILfZRugCKv8I=;
  b=Rt/RYUatEkqFk0PURw+eHPZVP5ZXnpuGsS1jArM2H/TcPJZNtGnFhmye
   2Ntyam4U0C4YssqYjwG7LiOSN24Extn+vIJpWk7z5X2KWgoe2jpcQk1O8
   52AclS07ZISdLVVF4KwHZAga7ppEOPvqtRnR8PGcgU+IGrW83o7J2TpKh
   NMgszGYhCZJ2dbsHli+Wvmo/slufafMpxnFJqvb7uDc6H1OLVoMTcZLTJ
   Vpqx6ZOvNkg3k5kFJmOHNI/09QOWknCgH3kMWSJKitUNGTer5MQXms7m7
   MmRaQFsZUMeYQQovoQO2BogkbhRtWc4L3vzkE6lzsY3u9flDxKZqb0BrB
   A==;
X-CSE-ConnectionGUID: QcSkjCh0SVGK6sWud3RiRQ==
X-CSE-MsgGUID: 1hwKWwPuScafVx7c/CQT3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37112095"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="37112095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:35:13 -0800
X-CSE-ConnectionGUID: pGD7UTJTQc2Da3Y2xbpPoA==
X-CSE-MsgGUID: CUAO05POTmibjKRUAVNYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="108970921"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 02:32:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYn7-000KUR-1E;
	Sat, 11 Jan 2025 10:32:29 +0000
Date: Sat, 11 Jan 2025 18:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
	wenbin.mei@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.com>,
	Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
Message-ID: <202501111834.dc1JHSLT-lkp@intel.com>
References: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>

Hi Cathy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cathy-Xu/dt-bindings-pinctrl-mediatek-add-support-for-mt8196/20250110-184846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250110104703.13625-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111834.dc1JHSLT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111834.dc1JHSLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111834.dc1JHSLT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/pinctrl/mediatek/pinctrl-mt8196.c:7:
>> drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:37: error: 'mtk_eint_pm_ops' undeclared here (not in a function); did you mean 'mtk_eint_regs'?
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                                     ^~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:23: note: in expansion of macro 'pm_sleep_ptr'
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                       ^~~~~~~~~~~~


vim +1753 drivers/pinctrl/mediatek/pinctrl-mt8196.c

  1748	
  1749	static struct platform_driver mt8196_pinctrl_driver = {
  1750		.driver = {
  1751			.name = "mt8196-pinctrl",
  1752			.of_match_table = mt8196_pinctrl_of_match,
> 1753			.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
  1754		},
  1755		.probe = mtk_paris_pinctrl_probe,
  1756	};
  1757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

