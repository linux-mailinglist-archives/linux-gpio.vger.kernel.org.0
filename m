Return-Path: <linux-gpio+bounces-15610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C3A2DB3B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2025 06:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 510043A6FEB
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2025 05:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CD53987D;
	Sun,  9 Feb 2025 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lragoFyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78AF24339E;
	Sun,  9 Feb 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739079427; cv=none; b=bKMsEwT1TqSr6zJe51jhlIWKCYjP7iWv41APFThSDid01cYgy/GYj1RJzSoLEdEH1B2BwicaCsVK62ibihuVNVYR14I1MLirrp0C4tU6bjqctldKMVjqgU4M1w6YVExxpQxwD+5svdPX09yOhn9rqanKZbyQ/oZxsc8P4zZBL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739079427; c=relaxed/simple;
	bh=LQYHpToHZqvrvUEO8vPOG+RisUsfNychAkbijb2JVT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUAMjsNyo12iC6EEZJib0p6K+WPp1v8CgfdqqSqa7NY3pNhyB/69wEn1vlSyrDMA6IyXKD5b48QOPmWMU/4obLE3vwi0IJDT6p+FByelCvbY+rW5pZ4lYlJXMftkvJoPn1YbhfwHOzrnqZ4Ns4TRQkEaprkgtiHgw3bsU4BapdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lragoFyn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739079425; x=1770615425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQYHpToHZqvrvUEO8vPOG+RisUsfNychAkbijb2JVT4=;
  b=lragoFynu7/SQydzU1Bxa63vNkAjlGt9m1LvmhtcqfRe8f8eXgsB44FW
   4GmbOlshi6iVkCOQ+l8fv2TB0cuTpFaqSsR00BKzNPa9ENiORna2NwACv
   9GUnfgX7QeTrd/SDM4DO6TYqVRL91U4D+h/X2Ns/OUI4wnAOXRlfaXZzX
   NMXh5fBsY+gMVhB6zf+BqB5xAAaKLYg2PArMd5mtfHfD8wEArO33GGkjy
   T3CFxgSMajeQsdYPngzLY6OoVYyFqCLzRf1mlVjOW9iuuvOaamsqs+G8G
   MPC2r0PYLsrvmblAwEQcQV/6xMyRKUwLF30wjXqKLsEmc88fpdMrk1S/X
   w==;
X-CSE-ConnectionGUID: pljfILQ/RVOm2f7uj6cvWw==
X-CSE-MsgGUID: SYHp7DnKQLCtOWBtkCQT/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62157868"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="62157868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 21:37:04 -0800
X-CSE-ConnectionGUID: uJznlC4YT/+W9s625x6DMA==
X-CSE-MsgGUID: /jWVE8OJTeyAq4L1lGPEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116486851"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 21:37:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th001-00117X-3A;
	Sun, 09 Feb 2025 05:36:57 +0000
Date: Sun, 9 Feb 2025 13:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Daudt <bcm@fixthebug.org>,
	Sherman Yin <syin@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: bcm281xx: Provide pinctrl device info as OF
 platform data
Message-ID: <202502091354.vwFJOxGn-lkp@intel.com>
References: <20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b@gmail.com>

Hi Artur,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Artur-Weber/dt-bindings-pinctrl-Add-bindings-for-BCM21664-pin-controller/20250208-040646
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250207-bcm21664-pinctrl-v1-4-e7cfac9b2d3b%40gmail.com
patch subject: [PATCH 4/7] pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502091354.vwFJOxGn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091354.vwFJOxGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091354.vwFJOxGn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/bcm/pinctrl-bcm281xx.c:971:19: error: initializer element is not a compile-time constant
           .regmap_config = bcm281xx_pinctrl_regmap_config,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:1424:6: warning: unused variable 'rc' [-Wunused-variable]
           int rc;
               ^
   1 warning and 1 error generated.


vim +971 drivers/pinctrl/bcm/pinctrl-bcm281xx.c

   962	
   963	static const struct bcm281xx_pinctrl_info bcm281xx_pinctrl = {
   964		.device_type = BCM281XX_PINCTRL_TYPE,
   965	
   966		.pins = bcm281xx_pinctrl_pins,
   967		.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
   968		.functions = bcm281xx_functions,
   969		.nfunctions = ARRAY_SIZE(bcm281xx_functions),
   970	
 > 971		.regmap_config = bcm281xx_pinctrl_regmap_config,
   972	};
   973	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

