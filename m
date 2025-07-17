Return-Path: <linux-gpio+bounces-23420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40243B095D3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 22:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00CACA43A06
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 20:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC2622A4F6;
	Thu, 17 Jul 2025 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtqtllOa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F42248AE;
	Thu, 17 Jul 2025 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752784835; cv=none; b=R3SoLgCLFCM6h4Mu0SWJKHfpT4ulsjSnmtRL8PXVs1Y7b9YucRCS7tR3bd4/jEYc/Xe02ZP/L3RN+AR+UCRXyHBYKMRNtkrwMi6vmnCvg6ejFrJ2Ptp0AamxxPfBrOW9YTcQ5aP7LW1Y5YemHlkjKtH68619oKI3oy+yb15UaPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752784835; c=relaxed/simple;
	bh=PdIbTdktWh/WBwrcyr3gCqj0Qy8ntRTyRqr3z/psMAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiQwHLGhNYnCtb4rNcIFPP/ZCRLEiB5uaWoKgYOQeaOIwYg4ZYwPS+T3ZM/vpYEb2Ib+2ImPrl6NBhNPR24TfbNwXMHqXxbJIYMyGB5NYxQTXN52NPW9l25Abc35XJ9pm604u8iwgQTM8Wxr7rSZAm7+5hn2xEQGTHNA0VsQgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtqtllOa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752784834; x=1784320834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PdIbTdktWh/WBwrcyr3gCqj0Qy8ntRTyRqr3z/psMAs=;
  b=XtqtllOaT7ptrwI6riTgpMLsAQN/HpFPsEWqZIr3r/QavIQ7ZCYzDBNx
   p1Ohp/uKsfu95R3vseMgKzPxeiWbKNk7+0dZ5iK9NAx9pw1JRk2akb2tj
   4Xi2A1y30rX8i2bmBeulaSMCqM7GdF0nPiOjyvWUMphl2mMllaUNt4WSR
   ECXlaUoiI0+g9XtbwaDSjahfDYhP0x9ctRINIjmby3MkLhchBirRJfRzX
   vpSudkr3tjE/ftWuLb2OiIEkS7CqbcR9X49+UYKR73OaKzlO/v0iNhFSb
   mBHaxSrdGx4TnX0H6jNFHV+zxKIqX/Il+R92ZttdBKm1kJAScXUMzJrj7
   w==;
X-CSE-ConnectionGUID: kNeOfRNlQXi7UgpOGqXIRQ==
X-CSE-MsgGUID: 7tCDUj5sSNSUCnx4mZ3IsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55200007"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55200007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 13:40:34 -0700
X-CSE-ConnectionGUID: IuN4fVvGSIalVbCR9aDz2Q==
X-CSE-MsgGUID: BkOKgBq2Qm2hEkuq4K7EAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="158585075"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2025 13:40:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucVP1-000E0Z-0X;
	Thu, 17 Jul 2025 20:40:27 +0000
Date: Fri, 18 Jul 2025 04:39:46 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 19/24] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <202507180433.nXvvwmFy-lkp@intel.com>
References: <20250716193111.942217-20-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716193111.942217-20-demonsingur@gmail.com>

Hi Cosmin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250716]
[also build test ERROR on v6.16-rc6]
[cannot apply to robh/for-next staging/staging-testing staging/staging-next staging/staging-linus arm64/for-next/core linus/master v6.16-rc6 v6.16-rc5 v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-mc-Add-INTERNAL-pad-flag/20250717-033901
base:   next-20250716
patch link:    https://lore.kernel.org/r/20250716193111.942217-20-demonsingur%40gmail.com
patch subject: [PATCH v6 19/24] media: i2c: maxim-serdes: add MAX96724 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250718/202507180433.nXvvwmFy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180433.nXvvwmFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180433.nXvvwmFy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/maxim-serdes/max96724.c:273:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     273 |                                  FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:494:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |                                  FIELD_PREP(MAX96724_MIPI_TX10_CSI2_LANE_CNT,
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:693:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     693 |                            FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_DT,
         |                            ^
   drivers/media/i2c/maxim-serdes/max96724.c:741:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     741 |                                   FIELD_PREP(MAX96724_MIPI_TX57_TUN_DEST,
         |                                   ^
   drivers/media/i2c/maxim-serdes/max96724.c:914:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     914 |                             FIELD_PREP(MAX96724_PATGEN_0_VTG_MODE,
         |                             ^
   drivers/media/i2c/maxim-serdes/max96724.c:957:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     957 |                                  FIELD_PREP(MAX96724_VPRBS_PATGEN_CLK_SRC,
         |                                  ^
   drivers/media/i2c/maxim-serdes/max96724.c:985:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     985 |                                   FIELD_PREP(MAX96724_PATGEN_1_PATGEN_MODE,
         |                                   ^
   7 errors generated.


vim +/FIELD_PREP +273 drivers/media/i2c/maxim-serdes/max96724.c

   262	
   263	static int max96724_reset(struct max96724_priv *priv)
   264	{
   265		int ret;
   266	
   267		ret = max96724_wait_for_device(priv);
   268		if (ret)
   269			return ret;
   270	
   271		ret = regmap_update_bits(priv->regmap, MAX96724_PWR1,
   272					 MAX96724_PWR1_RESET_ALL,
 > 273					 FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
   274		if (ret)
   275			return ret;
   276	
   277		fsleep(10000);
   278	
   279		return max96724_wait_for_device(priv);
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

