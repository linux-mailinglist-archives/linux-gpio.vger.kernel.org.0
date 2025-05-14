Return-Path: <linux-gpio+bounces-20168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F92AB76BF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 22:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0353A4A4F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 20:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3BB297B86;
	Wed, 14 May 2025 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5A4U/Mu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D445297B66;
	Wed, 14 May 2025 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253956; cv=none; b=cTYfEVXDX/EX8Nwdoaqg/OXAjrAKY2vB8o19tde+FpPY7jOR2qEzY1Ic91qlvT6//CGLP1YD2+GSfPx9rxnmTFgSSncFy+d376uvFbaGGL65os+wHk5Mwt7yqmKCpa/hjgzh79FACO7P6w4tw3uoV/EePVL0qj7hnIuQRowVasQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253956; c=relaxed/simple;
	bh=hYrU9RvV+4y2DHFLaQiCECHzjwEV+OkrnWnu8hwtrgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWrInO6x2H9b0gn3AGxsnG8oFx210UazMW94Sl3TcJcCBsW2EeOq1Jq76R1hsIh4wwA7C7MdvhGt3VJW9xxfvosv9aP48AXOAryEa12v8k+b/SuVTlHS2ACNJC97kybmaeBTb0Hr67UdkSNLlHCG3a8Dq46dZW4FAzAGr4fv2/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5A4U/Mu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747253954; x=1778789954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYrU9RvV+4y2DHFLaQiCECHzjwEV+OkrnWnu8hwtrgU=;
  b=W5A4U/MuznMYUwssUybHr6Rm/LiqYcRbcNvoGaVrM0pMreeuwRcSJ8Ka
   84wBWgCnBpmzoL4ysw+gfyJlXo1Hqi1/wC7cgo/3j9fnTCCn1vG7uzFWD
   D/iq/HDdKCuxjsMvnHPZjla4jtDtYm9cDkvkW2IKpvDl4Jj86amqx6BcK
   8U7whg80bbHgzJrj6dHAvem/AMlFbgAtMYXesN8Q7ExgLZ8logmU9r2tb
   pQGMO7Spj/C0Rcwg4YwWjlhMEXntykI3xoonrVhoMMM7mJXTCpFyJdRNK
   mPtmNXNDE5VBkY52/svEXTCCvTzFEf7N1M/boNYR/0+CRRM+cEDXwQhaz
   g==;
X-CSE-ConnectionGUID: 5QWR/utISUGSfEbj7XcfMQ==
X-CSE-MsgGUID: ROBM/K5iR62ukral0Mu3MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71677944"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="71677944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 13:19:14 -0700
X-CSE-ConnectionGUID: aoXVi9WcQ9WWpZlstv9FhA==
X-CSE-MsgGUID: c9k03sXERRO7riqhJkfvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="169084389"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2025 13:19:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFIZH-000HWZ-2b;
	Wed, 14 May 2025 20:19:07 +0000
Date: Thu, 15 May 2025 04:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
Message-ID: <202505150408.vMuuQH5G-lkp@intel.com>
References: <20250514-s6-s7-pinctrl-v1-5-39d368cad250@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-s6-s7-pinctrl-v1-5-39d368cad250@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on aa94665adc28f3fdc3de2979ac1e98bae961d6ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctl-amlogic-pinctrl-a4-Add-compatible-string-for-S7/20250514-150438
base:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
patch link:    https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-5-39d368cad250%40amlogic.com
patch subject: [PATCH 5/8] pinctrl: meson: support amlogic S6/S7/S7D SoC
config: arm64-randconfig-004-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150408.vMuuQH5G-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150408.vMuuQH5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150408.vMuuQH5G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:128:13: error: designator into flexible array member subobject
     128 |         .multi_data[0] = {
         |                    ^~~~~~~
     129 |                 .m_bank_id = AMLOGIC_GPIO_CC,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     130 |                 .m_bit_offs = 24,
         |                 ~~~~~~~~~~~~~~~~~
     131 |                 .sid = (AMLOGIC_GPIO_X << 8) + 16,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     132 |                 .eid = (AMLOGIC_GPIO_X << 8) + 19,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:138:13: error: designator into flexible array member subobject
     138 |         .multi_data[0] = {
         |                    ^~~~~~~
     139 |                 .m_bank_id = AMLOGIC_GPIO_CC,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                 .m_bit_offs = 24,
         |                 ~~~~~~~~~~~~~~~~~
     141 |                 .sid = (AMLOGIC_GPIO_X << 8) + 16,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     142 |                 .eid = (AMLOGIC_GPIO_X << 8) + 19,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     143 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:144:13: error: designator into flexible array member subobject
     144 |         .multi_data[1] = {
         |                    ^~~~~~~
     145 |                 .m_bank_id = AMLOGIC_GPIO_F,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     146 |                 .m_bit_offs = 4,
         |                 ~~~~~~~~~~~~~~~~
     147 |                 .sid = (AMLOGIC_GPIO_D << 8) + 6,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     148 |                 .eid = (AMLOGIC_GPIO_D << 8) + 6,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     149 |         },
         |         ~
   drivers/pinctrl/meson/pinctrl-amlogic-a4.c:69:19: note: initialized flexible array member 'multi_data' is here
      69 |         struct multi_mux multi_data[];
         |                          ^
   3 errors generated.


vim +128 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

   125	
   126	const struct aml_pctl_data s7_priv_data = {
   127		.number = 1,
 > 128		.multi_data[0] = {
   129			.m_bank_id = AMLOGIC_GPIO_CC,
   130			.m_bit_offs = 24,
   131			.sid = (AMLOGIC_GPIO_X << 8) + 16,
   132			.eid = (AMLOGIC_GPIO_X << 8) + 19,
   133		},
   134	};
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

