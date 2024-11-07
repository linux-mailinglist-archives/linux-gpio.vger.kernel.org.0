Return-Path: <linux-gpio+bounces-12653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F229BFB1F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 02:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97EB1B214F9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 01:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF22E7485;
	Thu,  7 Nov 2024 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lvhu9dgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D02CA9;
	Thu,  7 Nov 2024 01:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941309; cv=none; b=u6pjwHO2OVkVwtDgTM6isbNnn8GrmHmUBDEdOhA2r35kheiwllrz7LJiN9GRwhhY+CCYrEgU+uMS3oOW+R6M2XX43sduhisb+Oy+G1p6mZV2EtnsFifaR3v9np3ILOdTvds9eFqk5u6FNMEaFJaUpuN+5GC7Eq6f2rHUbsKp838=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941309; c=relaxed/simple;
	bh=8LZPvUCN9C3yUR3J6KQF9rZje6rFNhSf2IWdy4LztfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAkJwVzZKiKiZs3E8viqI0t4j9fbhlNAFcgoUomp9MAxhjXhsI//0S9zwFCJMtFQdMCMXLuuwMs2jBQ6vNWVecSk2wDuRoq9cTQYfvbsts79q68wHNEIUwe1HqFl7wY9AN3cY2jk2Z3KKPhmDwU2IafnOGFNMIEsUSO8kuJKQZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lvhu9dgh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941308; x=1762477308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8LZPvUCN9C3yUR3J6KQF9rZje6rFNhSf2IWdy4LztfM=;
  b=Lvhu9dghzo6t/W3NQZH4YkvzZM7Av0NSw6wvfoJ/QZQiF8fSZ3pfw92C
   jptB+OEXXtwmLcDGB5Ss/TtPQ2VWQceOv82gYxzmXc9dX+Ap1H78Ecqjl
   H+VtWYMiyDWvuIFZTXZmj35yk3mYtZomby3LwfnoihivdV4VTjwwdMkw4
   Hp7SwK7O62YYBB3hFxLYaB7aDHUUF89Ce9POFwsz+2hh1LYh/EQNbxtYQ
   eq9UMsm7VSpSxBYTkwBb66n8t5GbJedo1zyLKiizI+kGOlJIV9rSC9qBt
   RLmT7BRMPHpbnhRqMdPqJKNvBnq0Tqs619/9rE5c4XJLTErsk/qZxxWBf
   A==;
X-CSE-ConnectionGUID: yu/4f+IqSliFSWHa7VDteg==
X-CSE-MsgGUID: 66jC8EJeQkmJ4ijyHuQoHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30868869"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="30868869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:01:48 -0800
X-CSE-ConnectionGUID: w39IjmtKRLq/XpI8W46YJw==
X-CSE-MsgGUID: tU/9JlygSBWKwC5v93+JRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="88828063"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 17:01:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qu6-000pb4-12;
	Thu, 07 Nov 2024 01:01:42 +0000
Date: Thu, 7 Nov 2024 09:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
Message-ID: <202411070804.SS4EF03K-lkp@intel.com>
References: <20241106100741.173825-8-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-8-y.oudjana@protonmail.com>

Hi Yassine,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Oudjana/dt-bindings-pinctrl-mediatek-mt6779-pinctrl-Pull-pinctrl-node-changes-from-MT6795-document/20241106-181127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241106100741.173825-8-y.oudjana%40protonmail.com
patch subject: [PATCH v7 7/7] pinctrl: mediatek: Add MT6735 pinctrl driver
config: arm64-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070804.SS4EF03K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070804.SS4EF03K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070804.SS4EF03K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt6735.o:(.data+0xa0): undefined reference to `mtk_paris_pinctrl_pm_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

