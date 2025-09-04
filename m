Return-Path: <linux-gpio+bounces-25629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AEB44822
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22FC71C833B4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252F129A30A;
	Thu,  4 Sep 2025 21:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV4EqNqf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361081A23A9;
	Thu,  4 Sep 2025 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757020293; cv=none; b=EG0HY/tMCQMLjll7T7MxdlWlHGbC+914Bt/0ZeGPb1kICBxX0FfL+wNph0r+AgJmQRQl8644k7mpDUCPL32Yq7teqoKdRytRnHGVIrJcShLKi6sm4QxDzPpw9J2jS2ER3rEqxhkSvCDFLrHlbRylRHId4DrFwraNPbsbdY2khdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757020293; c=relaxed/simple;
	bh=o3hG4agtS9G7U6cY5dbG3D1IVkgCdsnfrqkX/1YLurY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va4IzDr9ZmjW6uL9ixR6jW3E8SBsYZ0utZ/XMJayC6jnkIo4SceEi9SjQPbKsVDFlVCAEqNjTFuky5z3Mo2Em8drF0OJSexy3gjjwafuD0voYTYxAJ0rNGye9TceoZWNTEt8b2pryM2z4kM3CPhlu/LisQ7B4yh63EgDPkVFKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV4EqNqf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757020292; x=1788556292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o3hG4agtS9G7U6cY5dbG3D1IVkgCdsnfrqkX/1YLurY=;
  b=jV4EqNqfeVz+XZaV0fhH4ph+0qwSQxXhkh2fr6Dpo44PaBxySdGxqAM1
   0KJCORh04/L/LwQQiSHQ92Wqncrzl6CWSK+r1eOgrEsVPxqdZfgCaekNr
   1GdypgJ5S5h26pgvoakhlzH5GaZg2X0o7rkBM4ISKQe+N5yiWKMdNwwxi
   XpXeXzqOxmkICtbFFe9T0HJjFiIOsAUuniaeF7RnJsDCg40RyF9GfnEhs
   7J/cmpLlI6YOX2TmJdcwNkcGsTSWkkDGJjkH+Y8Tn9uc7XTdOxiFaBaIl
   2PgueEesOY14tKM0fZOZhfIFDdibTEJ8OPg9lKTO7mOyn3Cw/t6RIHivB
   w==;
X-CSE-ConnectionGUID: REDCwWJ3QvSLbBtRMtfEaw==
X-CSE-MsgGUID: CIlzHTRAQOyUPs5sSmSoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70078885"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="70078885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 14:11:31 -0700
X-CSE-ConnectionGUID: aDFwf0HIRkmjp06zkGZ2sQ==
X-CSE-MsgGUID: 3LHLMkHcQV6iqtG8oK6sFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="171574115"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2025 14:11:28 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuHEs-0005vT-0P;
	Thu, 04 Sep 2025 21:11:26 +0000
Date: Fri, 5 Sep 2025 05:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 2/2] clk: add TI CDCE6214 clock driver
Message-ID: <202509050404.kfqjYP6B-lkp@intel.com>
References: <20250903-clk-cdce6214-v6-2-b2cc0a6f282b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-clk-cdce6214-v6-2-b2cc0a6f282b@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build errors:

[auto build test ERROR on b320789d6883cc00ac78ce83bccbfe7ed58afcf0]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/dt-bindings-clock-add-TI-CDCE6214-binding/20250903-215839
base:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
patch link:    https://lore.kernel.org/r/20250903-clk-cdce6214-v6-2-b2cc0a6f282b%40pengutronix.de
patch subject: [PATCH v6 2/2] clk: add TI CDCE6214 clock driver
config: i386-randconfig-014-20250905 (https://download.01.org/0day-ci/archive/20250905/202509050404.kfqjYP6B-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050404.kfqjYP6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050404.kfqjYP6B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-cdce6214.c:1537:3: error: field designator 'is_generic' does not refer to any field in type 'const struct pinconf_ops'
    1537 |         .is_generic = true,
         |         ~^~~~~~~~~~~~~~~~~
>> drivers/clk/clk-cdce6214.c:1549:3: error: field designator 'num_custom_params' does not refer to any field in type 'struct pinctrl_desc'
    1549 |         .num_custom_params = ARRAY_SIZE(cdce6214_dt_params),
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-cdce6214.c:1550:3: error: field designator 'custom_params' does not refer to any field in type 'struct pinctrl_desc'
    1550 |         .custom_params = cdce6214_dt_params,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk-cdce6214.c:1551:3: error: field designator 'custom_conf_items' does not refer to any field in type 'struct pinctrl_desc'
    1551 |         .custom_conf_items = cdce6214_conf_items,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +1537 drivers/clk/clk-cdce6214.c

  1535	
  1536	static const struct pinconf_ops cdce6214_pinconf_ops = {
> 1537		.is_generic = true,
  1538		.pin_config_get = cdce6214_pinconf_get,
  1539		.pin_config_set = cdce6214_pinconf_set,
  1540	};
  1541	
  1542	static struct pinctrl_desc cdce6214_pdesc = {
  1543		.name = "cdce6214-pinctrl",
  1544		.pins = cdce6214_pinctrl_pins,
  1545		.npins = ARRAY_SIZE(cdce6214_pinctrl_pins),
  1546		.pctlops = &rtc_pinctrl_ops,
  1547		.owner = THIS_MODULE,
  1548		.confops = &cdce6214_pinconf_ops,
> 1549		.num_custom_params = ARRAY_SIZE(cdce6214_dt_params),
> 1550		.custom_params = cdce6214_dt_params,
> 1551		.custom_conf_items = cdce6214_conf_items,
  1552	};
  1553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

