Return-Path: <linux-gpio+bounces-22241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA1AE9473
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 04:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 661961C27E21
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 02:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739BB202C45;
	Thu, 26 Jun 2025 02:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PblPNg/S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86475202961;
	Thu, 26 Jun 2025 02:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906685; cv=none; b=kXti0SrmOC2QnmvoJ4PU0ZO3sm0TAcf/VZVVIGUNxxTsHfYUw86rrMHHEwtlPx+PpaZeqOB5i4OsY0CPhQbxIu9eZReYpdzm4UJOcEvWdiihP9ABsWjagFPzH6JWirFw2WaqbEJXGtKTQJSm95l6JndWgXFY3dCYiQX8t+OJsf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906685; c=relaxed/simple;
	bh=U4PNK5Viw/uVhts0OTE2xo+hRXKVL1sSoE1wzsR7ZBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yus7s56MSc/5CoSUz93ouIcbb0r+zHaGqkPesniOCW6ie++1KnP2Z6KXLnR+JQ2LRUobfzE0/0rREaL/uwOOu9RWmnvjcJHisP+N0ii+H9nCYdh6PJ04qRdC4K2LQRyn1YRkzlkjRC8MVpF1uWDR2f7N0RTYjW2+e3hAfQbTAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PblPNg/S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750906684; x=1782442684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U4PNK5Viw/uVhts0OTE2xo+hRXKVL1sSoE1wzsR7ZBQ=;
  b=PblPNg/SPjRL8W6nzEPMzGxBiNW5HJqbAqIOTdHtM6+DsS4yuRgwbenT
   iatfly4kX1d7jVkcD/7QblG/9aln/cjAyhbOramcVSvy5zV4nVjxvsSnV
   HCN1YJDZy8M1Voa85yfHMgGt2WZDuWume6IAYsIjPoJTEJxm+FIWIshqH
   M2/BtKi4wx++/pm8HAEOwoReIkTRVtyTgUT9UHxSbINBOaYUM/hdUv+LP
   m9IX0O6gxvRC3CN/BYGEA5PjgdUH/4jYqhGnEqwsCOyzVAFSbqnUUn8kP
   8QlTwmHVj6vY/+C53ftmLQE3yPyhP3JhkkHk6R/XZLj0xatEuQbAAALub
   A==;
X-CSE-ConnectionGUID: 5wn777HBTiCTDIvRxwacYw==
X-CSE-MsgGUID: V6wJ8GkLT7W1UlERaMjmUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63789879"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63789879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 19:58:03 -0700
X-CSE-ConnectionGUID: KdLI1+gSSrezQWLe7I8q7Q==
X-CSE-MsgGUID: yRddVIpyQFGN6hzDj2zmLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="183277814"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jun 2025 19:57:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUcoH-000TeY-0i;
	Thu, 26 Jun 2025 02:57:57 +0000
Date: Thu, 26 Jun 2025 10:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: Add support for RZ/T2H
Message-ID: <202506261030.cncLTO3X-lkp@intel.com>
References: <20250625130712.140778-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625130712.140778-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next robh/for-next linus/master v6.16-rc3 next-20250625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-pinctrl-renesas-document-RZ-T2H-and-RZ-N2H-SoCs/20250625-210839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20250625130712.140778-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v2 2/3] pinctrl: renesas: Add support for RZ/T2H
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250626/202506261030.cncLTO3X-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261030.cncLTO3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261030.cncLTO3X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/renesas/pinctrl-rzt2h.c:106:1: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 | RZT2H_PINCTRL_REG_ACCESS(q, u64)
         | ^
   drivers/pinctrl/renesas/pinctrl-rzt2h.c:91:3: note: expanded from macro 'RZT2H_PINCTRL_REG_ACCESS'
      91 |                 write##size(val, pctrl->base0 + offset); \
         |                 ^
   <scratch space>:123:1: note: expanded from here
     123 | writeq
         | ^
>> drivers/pinctrl/renesas/pinctrl-rzt2h.c:106:1: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/pinctrl/renesas/pinctrl-rzt2h.c:99:10: note: expanded from macro 'RZT2H_PINCTRL_REG_ACCESS'
      99 |                 return read##size(pctrl->base0 + offset); \
         |                        ^
   <scratch space>:126:1: note: expanded from here
     126 | readq
         | ^
>> drivers/pinctrl/renesas/pinctrl-rzt2h.c:311:13: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |                 pins[i] = FIELD_GET(MUX_PIN_ID_MASK, value);
         |                           ^
   3 errors generated.


vim +/writeq +106 drivers/pinctrl/renesas/pinctrl-rzt2h.c

   103	
   104	RZT2H_PINCTRL_REG_ACCESS(b, u8)
   105	RZT2H_PINCTRL_REG_ACCESS(w, u16)
 > 106	RZT2H_PINCTRL_REG_ACCESS(q, u64)
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

