Return-Path: <linux-gpio+bounces-14687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BBBA0A3C8
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 14:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BE9E7A4127
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 13:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D321A01B9;
	Sat, 11 Jan 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRshf6EE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3763139D;
	Sat, 11 Jan 2025 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600949; cv=none; b=OKE/LtnHtCJtAhx6wULH6xNnrNVJ6j5rhKlhoJm9zdsfydGdx6rmdIY6U2tDf2J4tC0I62fJFjaEdfjDEAUCHH7VraDebl01SDI+/aCO6EzQujjqyuXuJS3BaLQyLdvkbc9beZBA8Nif4guVQQ63vvwObnhdWOBK4M5Ji7CUECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600949; c=relaxed/simple;
	bh=th1e+p23X+UdstG6BGZ9C9GnjYoYqz3mjlgM+5zrhSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcE02Z4UXSC4txeBjLLMyf1v9tzO28Tb5IJlevZLvpxsvFjRU1L7DOCY+FSgoNhOf9kedLBXpeNCS2CPZ22xzR+Qvdf7o3ikd3mmRe7hItxz4uX57/4EVwYSeNHKjsxq8GWDfVIkDN7cd9TBQmR84r8QGt+Tb2a2GBOwIUFmwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRshf6EE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736600948; x=1768136948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=th1e+p23X+UdstG6BGZ9C9GnjYoYqz3mjlgM+5zrhSs=;
  b=QRshf6EEX5GPYSt16wmqWoNGNFfAk4LiPH1+MclCBihRuk/CFiTiA6ds
   3TD1NeY8N0oNj3oJCHBXQLTAaz51HhdD6xYfUtdhEflHbahhOdrEZ5q9l
   0AvZwos56Y66NSjL5R8INwtjYZSweR2W0j9V8LysP1Jd+hcjBps/dSEO3
   up2yDGfqxeQl0VqA2o8Q3NaoE/p3+K/1HU6h+ENA+E/FjboBEpRQQNoMG
   q/s8jmhpMPfb3isvOsERwlkm91RL9THme3k40kC5an+IwLvUYmETg2WLZ
   QCrhKjtXRhgla+9i54VFy8cTZ8ExqUzJNpgIE9uPtAf+4YbXCJH7kRigF
   g==;
X-CSE-ConnectionGUID: TcYgMklTSN2fZOw3/FI88w==
X-CSE-MsgGUID: haST1oCwSWSxsEzezJnihg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="24492512"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="24492512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:09:05 -0800
X-CSE-ConnectionGUID: 1WQ5tDhmQlmBHSfszG4lLw==
X-CSE-MsgGUID: lwElejONRY+RkC+Q317r1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108042240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 05:09:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbEY-000KfX-2S;
	Sat, 11 Jan 2025 13:08:58 +0000
Date: Sat, 11 Jan 2025 21:08:12 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.com>,
	Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
Message-ID: <202501112005.DuwEi3Ig-lkp@intel.com>
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
config: arm64-randconfig-003-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112005.DuwEi3Ig-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112005.DuwEi3Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112005.DuwEi3Ig-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:23: error: use of undeclared identifier 'mtk_eint_pm_ops'
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                                     ^
   1 error generated.


vim +/mtk_eint_pm_ops +1753 drivers/pinctrl/mediatek/pinctrl-mt8196.c

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

