Return-Path: <linux-gpio+bounces-14086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38B9F9690
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B653A163BA9
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0270219A90;
	Fri, 20 Dec 2024 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L23BlazE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9633062;
	Fri, 20 Dec 2024 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712071; cv=none; b=X7RY6KPDKkP7WuWIunBQwtiskbVPFciWKZ9JIAY7i7QSUz2Zf75Xw5loO4rku+gXaXciPzRiMogCkCPW/uVXwUow77OqZg8QzixZRhEfHw25CfJ/BdwTLP/O1NU1IcbPB23PqvxYnGZuPb71YLeM2kIlCW1uuo/AK2VYnmCDuBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712071; c=relaxed/simple;
	bh=jxHFAYBCnlTrcSh9H+awIzGplyXuNovtWtAuZm7pl1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9vXojChsCluqRUmBoSFqIUZ8NmyFE/+njQGmOYZIHVywdm7UVjNBMQoUCnbs+Lx5A408/4Iph9f1OO7VZgid+05Bvskv900dfwh4vvP/HtFHi2syabSQMX4LdA/PnN7gZgpLOOtGDd3h3UpO5g9s17y04KxPYSGCLnzGcnUs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L23BlazE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734712069; x=1766248069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxHFAYBCnlTrcSh9H+awIzGplyXuNovtWtAuZm7pl1I=;
  b=L23BlazE1g3T5AUTNwCKdDFxMyMvwrvBKPTAK3dmj1zBVQd23+Kz6eGF
   0brDJf5sJDoAqCrPDoQ2aR/n2cX9euuCr4k9dyM4Scv/SU09cx8A07R/2
   B2Si5cbF0Cs+UOWsjfGqptA30ePkX1w7ogiVxdrXY/G9Xus7Jsa65lsgM
   yrrtuLBel0krBGkea2RV1n30tH5D7xaVf0oR8qU/O6HoOFFq24zzlDB9A
   jvJRqn8xKgBVOtcmAW5fNlr3/u7gog+DMvUltFv+LJSThpqTHnw607bQp
   3SdJbgon/mrfzlc/zDB1JIgCxaXPd9wNNSiSjvWKkNVBKAd6TADbHbm8r
   w==;
X-CSE-ConnectionGUID: wM2cWlkGSze/ARD/sD1t3Q==
X-CSE-MsgGUID: +ayVz46SR/qxcuMMY4++yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35386491"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35386491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:27:49 -0800
X-CSE-ConnectionGUID: uhwcfmA7QfC75GZdThI05w==
X-CSE-MsgGUID: 7mYO4CX0STi+NZeBJWqDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98328861"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 08:27:46 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOfqp-0001P1-28;
	Fri, 20 Dec 2024 16:27:43 +0000
Date: Sat, 21 Dec 2024 00:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
	ot907280 <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Message-ID: <202412210007.sMeJEMYf-lkp@intel.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>

Hi ot907280,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ot907280/pinctrl-mediatek-Add-support-for-MT8196/20241211-140107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241211055454.17120-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: Add support for MT8196
config: sparc64-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241221/202412210007.sMeJEMYf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210007.sMeJEMYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210007.sMeJEMYf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sparc64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt8196.o:(.data+0xa0): undefined reference to `mtk_paris_pinctrl_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

