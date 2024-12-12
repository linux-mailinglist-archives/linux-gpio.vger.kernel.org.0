Return-Path: <linux-gpio+bounces-13791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 214999EDEA1
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 05:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52D4E1889274
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 04:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0495516DEA9;
	Thu, 12 Dec 2024 04:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3KiGUwl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A631465AD;
	Thu, 12 Dec 2024 04:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733979193; cv=none; b=QDdaOv2yXTiqhjQZyQIID/8nc7R2ka4/6MF776LgDBcMKdkXa0+qDGk+tpQVGCbixkHHrThn4zCbXhLi1obPA0YU26I6DjtjsogJcKkQWOlMPr6d2Ovw8RJWUVVdRQDfdJOSdfzaU167dvKOpfLHM8EVFlyLn87uanAvBrmdazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733979193; c=relaxed/simple;
	bh=zjOKo7X1WIM6wbB1lJ8RKKq+iVqK9Xjvj89egCgASEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHnKW2KE0EVTQC8PHjxi4TRwic4GByulwzvP5DKJUeBxAytjgLdeFi7dp1NxELlhCNg9n7o62qkwsYysTLO5a9YE2oRf+TXEtqPVEl1YyjxCWXSsllWpFe8/1MOpH9YT4L/aW8Rmb8EuGXspf0JOir1UW2ze9kXN/6ZODuKw64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3KiGUwl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733979192; x=1765515192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjOKo7X1WIM6wbB1lJ8RKKq+iVqK9Xjvj89egCgASEk=;
  b=T3KiGUwljQ28JBsY80Vfg2btqMySP+idLAj3sd80YRgbcAsEX66gAZgE
   idvAc4FccTTRP6tGIa8MzWwInD34Fp+RKgfaXKTZB01IDUDNiszuZQN73
   JM1l5cdCnVJcQdnJTjZrCNbKIyZQB45hwDI775YChS5bXk4a4I8qOzLkU
   yzdHJh9WYsbtbpNI9Gu1HXqCYgwKNq59zEumGcvl7V3nGNZoaEkmedAld
   KcG7IzCKULFh5LQoPLq0653lLm1UnMz9Fl2twcvNN3xT4lWaLK8cPBNKa
   P8poX7aJ+4dJHRamTAYtO+XdmK6NpKyYB4yBKk77aC+yUV3MHEHS1UhNS
   Q==;
X-CSE-ConnectionGUID: EMlXCVfFRkiCNbKGmosqSg==
X-CSE-MsgGUID: 7QOkU95OTKyePa9XnNr+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45765792"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45765792"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:53:11 -0800
X-CSE-ConnectionGUID: +rugh9WjSH+JrBIWnRnsdA==
X-CSE-MsgGUID: BF3cQvgFS2qxjoUB8kTOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95947179"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 20:53:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLbCD-0007Rx-2e;
	Thu, 12 Dec 2024 04:53:05 +0000
Date: Thu, 12 Dec 2024 12:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
	ot907280 <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
Message-ID: <202412121226.WW9Airfh-lkp@intel.com>
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
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ot907280/pinctrl-mediatek-Add-support-for-MT8196/20241211-140107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241211055454.17120-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: Add support for MT8196
config: arm64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121226.WW9Airfh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121226.WW9Airfh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121226.WW9Airfh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mtk_paris_pinctrl_pm_ops
   >>> referenced by pinctrl-mt8196.c
   >>>               drivers/pinctrl/mediatek/pinctrl-mt8196.o:(mt8196_pinctrl_driver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

