Return-Path: <linux-gpio+bounces-28864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08FC722E6
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 05:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 3D6BB2DB17
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 04:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1D42D94A8;
	Thu, 20 Nov 2025 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYwqZrIH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517FD1F4CB3;
	Thu, 20 Nov 2025 04:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763612786; cv=none; b=e9zkrpBW4J8m8FzMnBLd48y9KjtEfjySIfGIl6MzZbqO4TIVIBuIT1iKMBCvgVqmw6O48K/QzRB2Ub+ryFBH6dCkczTwEe6nLdSSvOD7ud1+GuUAoRJldL65D0KoOi23nXt/DNHRnHqrW4r7AsPbsNyzBougNGvcoFb2gw/pKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763612786; c=relaxed/simple;
	bh=AoBCatCcUTo8pQY7B3M+B7FHb9s+7p9nuNzOnOSP1Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0ytE9Q9SWFOggj+aqHVQBj20wHqBbI7xbSa7PJLo+cLDMfupbhHyqFuGLm/hVAJtTTf/chVozXVmi3B30ncdKv62paIFyE3fVE4zZCTJ/vTAHuMwUHXKUNetiCDSsPYWTetvfa75wn/iv/JgIBEWhySqf+93qQSJ93TDK66vJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYwqZrIH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763612783; x=1795148783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AoBCatCcUTo8pQY7B3M+B7FHb9s+7p9nuNzOnOSP1Pg=;
  b=JYwqZrIHpNULMeu1GNAwZ5GFYNFHVUL7NkNY1Obx/PuSFOJqtWea/BeN
   motlVUpFGMz7zA4w6e0ZaUWMkw6Nrjk4OFFxRz5cRRuoRhOtPkvOmwA3x
   gW9wQwn3Ig0GEK1nFSehXL7N9X/O+2JBgWIncCYVyq5hFXqdHjvZMxLQb
   hBc+UbJ54TW/ut5uA5DQdM6z9IZjEp09ttqL3oN/JPqbesQ4t904hkcb6
   HjJ3ScgFJBjAycZ6bhjQetqHn7DkebRIYoRBcMDRiyYf+I2/MpZgjiKZE
   r6pfcnH+w2nX13RKAvj31//msGLHZebPY9Yat7EtztrHM3OGjGNgkXAXO
   w==;
X-CSE-ConnectionGUID: DYF4084vRv2VuYKiHLLwQQ==
X-CSE-MsgGUID: R0CS3EsSTiqdtFf7EVBgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65758470"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65758470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 20:26:22 -0800
X-CSE-ConnectionGUID: Af/weTQ1RIqEzViG3Qz70w==
X-CSE-MsgGUID: 0Jb0A23gS9Gn7dgzvYydzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191511784"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 20:26:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLwFN-0003bL-0O;
	Thu, 20 Nov 2025 04:26:17 +0000
Date: Thu, 20 Nov 2025 12:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Pascal Paillet <p.paillet@foss.st.com>
Subject: Re: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp257
 pinctrl support
Message-ID: <202511200853.efuVxuoM-lkp@intel.com>
References: <20251118161936.1085477-6-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118161936.1085477-6-antonio.borneo@foss.st.com>

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 61cbe48d9d1ff277bc54051fbab8b733b2e64ccb]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Borneo/pinctrl-stm32-accept-string-value-for-property-st-package/20251119-011734
base:   61cbe48d9d1ff277bc54051fbab8b733b2e64ccb
patch link:    https://lore.kernel.org/r/20251118161936.1085477-6-antonio.borneo%40foss.st.com
patch subject: [PATCH v2 05/15] pinctrl: stm32: add new package to stm32mp257 pinctrl support
config: microblaze-randconfig-r111-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200853.efuVxuoM-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200853.efuVxuoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200853.efuVxuoM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/stm32/pinctrl-stm32.c:143:10: sparse: sparse: Initializer entry defined twice
   drivers/pinctrl/stm32/pinctrl-stm32.c:144:10: sparse:   also defined here

vim +143 drivers/pinctrl/stm32/pinctrl-stm32.c

f263343bb793fa Antonio Borneo    2025-11-18  130  
f263343bb793fa Antonio Borneo    2025-11-18  131  static const char * const stm32_pkgs[] = {
f263343bb793fa Antonio Borneo    2025-11-18  132  	/*
f263343bb793fa Antonio Borneo    2025-11-18  133  	 * Default dummy value, as match_string() doesn't accepts NULL.
f263343bb793fa Antonio Borneo    2025-11-18  134  	 * Also not an empty string because it will match the old numeric
f263343bb793fa Antonio Borneo    2025-11-18  135  	 * values <= 0x00ffffff.
f263343bb793fa Antonio Borneo    2025-11-18  136  	 */
f263343bb793fa Antonio Borneo    2025-11-18  137  	[0 ... (STM32_PKG_MAX - 1)] = "x",
f263343bb793fa Antonio Borneo    2025-11-18  138  
f263343bb793fa Antonio Borneo    2025-11-18  139  	[STM32_PKG_AA] = "AA",
f263343bb793fa Antonio Borneo    2025-11-18  140  	[STM32_PKG_AB] = "AB",
f263343bb793fa Antonio Borneo    2025-11-18  141  	[STM32_PKG_AC] = "AC",
f263343bb793fa Antonio Borneo    2025-11-18  142  	[STM32_PKG_AD] = "AD",
f263343bb793fa Antonio Borneo    2025-11-18 @143  	[STM32_PKG_AI] = "AI",
66cbedfcc7caae Clément Le Goffic 2025-11-18  144  	[STM32_PKG_AI] = "AJ",
f263343bb793fa Antonio Borneo    2025-11-18  145  	[STM32_PKG_AK] = "AK",
f263343bb793fa Antonio Borneo    2025-11-18  146  	[STM32_PKG_AL] = "AL",
f263343bb793fa Antonio Borneo    2025-11-18  147  };
f263343bb793fa Antonio Borneo    2025-11-18  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

