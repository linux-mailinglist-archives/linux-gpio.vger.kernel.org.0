Return-Path: <linux-gpio+bounces-24952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C9B353AD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 08:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C01997AB30D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 06:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D5E2F0688;
	Tue, 26 Aug 2025 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSSJUf+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA21D5178;
	Tue, 26 Aug 2025 06:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188128; cv=none; b=jCvK0cOIeKgDgAAPwQB9I5kaD3+dUlKMt2/zKGqrljupv/3S5u1kSOnIdiAGIkBxz3oxXxSqbsKvCsnbIsWwFKlSSvHwgEqy1wQnxdKccXft5y9b1J/74uqCKWHeAL5P51vvMmmpz1Ii2P3w5mEq8x6/xm32QsttCBnneWtzYAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188128; c=relaxed/simple;
	bh=/NAbA3KKPlkGUVLEW64dW+p7Ub0Umd/LU/ByfgYQHFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4b0vUTXXa53csTDUxmJ4p43lwXpysgmiZnHFdvDre2qGdZK+lCbfp1VXeBFqoNyTXe1eVTF7Ou8DMSA7lFWWB0D59OyqH5Ud4OiAMNX9ymERxc0jSOU8QpuHwTR8IT7yLJ7Y7KUZrhZXgwrttLNXDN4z3ZZChMTwEO2qTW8Vvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSSJUf+V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756188126; x=1787724126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/NAbA3KKPlkGUVLEW64dW+p7Ub0Umd/LU/ByfgYQHFI=;
  b=TSSJUf+V5hz5I1NHQD0i0xZ1uDcJgRm60cJmcj8yWTWygIfwdibGjvs8
   5iSznAOW68X3Bcs96CwKVM/uDeuZusLIyzIY6y4IRH8HZoYkwz8JWJnD9
   uQ0a2dNaIEft6DurwXNsMDCK3U1jGZT+UJq6XxvLAgFaICzK5p3ScXYpc
   GyPEkOPzVzkBXC8hUWTKUdjUgQPS8nOQyTjZv3P6aefpQj2uCcEGSNSmC
   eLWv6DW7dOFZ/qDZI7sWSihCBf7P7AQRtQRtju9lMTefMbsLrq5yJ7Wcx
   gxMrkLARZclPDIg12B8dufakb3kijovrFvjhRhjPE5fdtAk39nIZtvj2X
   Q==;
X-CSE-ConnectionGUID: awJM9WHWTyaZIfYAzUbxJQ==
X-CSE-MsgGUID: gKuj3Oe8QH6OaAgwSBH/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="45989821"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="45989821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 23:02:05 -0700
X-CSE-ConnectionGUID: dBjAjTnISYmtD9zAf5DjAg==
X-CSE-MsgGUID: aLP9yIKGRpqcaAGSsX+lxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169654456"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Aug 2025 23:02:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqmkp-000OG7-0N;
	Tue, 26 Aug 2025 06:01:59 +0000
Date: Tue, 26 Aug 2025 14:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nickolay Goppen <setotau@yandex.ru>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Nickolay Goppen <setotau@yandex.ru>,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Message-ID: <202508261333.8hcdJOVB-lkp@intel.com>
References: <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824-sdm660-lpass-lpi-v1-3-003d5cc28234@yandex.ru>

Hi Nickolay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nickolay-Goppen/pinctrl-qcom-lpass-lpi-Introduce-pin_offset-callback/20250825-045348
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250824-sdm660-lpass-lpi-v1-3-003d5cc28234%40yandex.ru
patch subject: [PATCH 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
config: microblaze-randconfig-r123-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261333.8hcdJOVB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508261333.8hcdJOVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261333.8hcdJOVB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:110:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
>> drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:148:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?

vim +/sdm660_lpi_pinctrl_groups +110 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c

   109	
 > 110	const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
   111		LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
   112		LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
   113		LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
   114		LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
   115		LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
   116		LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
   117		LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
   118		LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
   119		LPI_PINGROUP(8, LPI_NO_SLEW, _, _, _, _),
   120		LPI_PINGROUP(9, LPI_NO_SLEW, _, _, _, _),
   121		LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, _),
   122		LPI_PINGROUP(11, LPI_NO_SLEW, _, _, _, _),
   123		LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
   124		LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
   125		LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
   126		LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
   127		LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
   128		LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
   129	
   130		/* The function names of the PDM GPIOs are derived from SDM670 */
   131		LPI_PINGROUP(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _),
   132		LPI_PINGROUP(19, LPI_NO_SLEW, pdm_sync, _, _, _),
   133		LPI_PINGROUP(20, LPI_NO_SLEW, pdm_2_gpios, _, _, _),
   134		LPI_PINGROUP(21, LPI_NO_SLEW, pdm_rx, _, _, _),
   135		LPI_PINGROUP(22, LPI_NO_SLEW, comp_rx, _, _, _),
   136		LPI_PINGROUP(23, LPI_NO_SLEW, pdm_rx, _, _, _),
   137		LPI_PINGROUP(24, LPI_NO_SLEW, comp_rx, _, _, _),
   138		LPI_PINGROUP(25, LPI_NO_SLEW, pdm_rx, _, _, _),
   139		LPI_PINGROUP(26, LPI_NO_SLEW, dmic12, _, _, _),
   140		LPI_PINGROUP(27, LPI_NO_SLEW, dmic34, _, _, _),
   141		LPI_PINGROUP(28, LPI_NO_SLEW, dmic12, _, _, _),
   142		LPI_PINGROUP(29, LPI_NO_SLEW, dmic34, _, _, _),
   143	
   144		LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
   145		LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
   146	};
   147	
 > 148	const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
   149		LPI_FUNCTION(comp_rx),
   150		LPI_FUNCTION(dmic12),
   151		LPI_FUNCTION(dmic34),
   152		LPI_FUNCTION(mclk0),
   153		LPI_FUNCTION(pdm_2_gpios),
   154		LPI_FUNCTION(pdm_clk),
   155		LPI_FUNCTION(pdm_rx),
   156		LPI_FUNCTION(pdm_sync),
   157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

