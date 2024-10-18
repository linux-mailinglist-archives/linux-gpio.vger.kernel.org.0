Return-Path: <linux-gpio+bounces-11650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5279D9A483F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760561C215B3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 20:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3229206962;
	Fri, 18 Oct 2024 20:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ga4kn+CN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5618801F;
	Fri, 18 Oct 2024 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283947; cv=none; b=YXwVarFbG24qmJFPLjk3ffnMB86e3po0WjmZ5UpR0t+nSApCxBOz6VnunkXTR5eVA0iXu+g0EKoxke4JeDXbbcDTyLCRUZndoIm21/8bCJKthu/herIff4bu8j6UyH0XbB9xJzfo8BNXCnbVc/pxXhTKn7G+lh+JIeOZj9ZiDOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283947; c=relaxed/simple;
	bh=UFgY7nQ/+9Kk9FAvomP/z0BzB/J5FmyIv+Qtu5xS03g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tko4zFAGDMwDyhE5t9Uuc5sT1W8uVBgzhvjkbyIE0Z9HXDsMHggJZUe/rCIAYXI96xy2wKJncax9E7Yhs2PD2CMRfo3dqtqVBhyKQDnXGgxnV5m5oyw35U20/Tjurs8vZuAixZRv0PWu35t1HeKkpHKanHaKHu78FUyHLdLJs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ga4kn+CN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729283946; x=1760819946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UFgY7nQ/+9Kk9FAvomP/z0BzB/J5FmyIv+Qtu5xS03g=;
  b=Ga4kn+CNWq49SAIVIA4wcapxm8Vsj+41BFYuq9bKZ3iOh1MsHFt4xFYO
   6LNiO8F7j/YRfXq8KhH2XzhqsTySh/zHCsAngyXj1Z768lFCnI7JjJ5Ba
   98iIUFdFXSM3NR/YdOvOysNdtPwMxa+b0kJIJ4kFxYSrD8AZT3XGRR0kD
   EgDWwN2y8Q8qv7AhUFcoTVB5I6li3SJ3AYSWwIlORb4Wlm4QVf0HO0Pjb
   81SohH223t6bU0ZRIgbI7a2HatHcC/W4QGQRhZvsdrDRWtQM+ZCg6m3cF
   3Qe1CJ7DLtCyoYtDL/LFLL0GSH2S+Lb+383SGGrxYrqM6f1nHyt8q2NFq
   g==;
X-CSE-ConnectionGUID: /H5wU2VTT3mi/GERzY4zMw==
X-CSE-MsgGUID: O+IVOup9Q3ulmRK/oTXeAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32515118"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32515118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 13:39:05 -0700
X-CSE-ConnectionGUID: rAB6xkV6RViK06qQGjQlrg==
X-CSE-MsgGUID: XZBQz+AGRmuplNxQnYCQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109796431"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 13:39:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1tkR-000OI1-11;
	Fri, 18 Oct 2024 20:38:59 +0000
Date: Sat, 19 Oct 2024 04:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is
 requested
Message-ID: <202410190448.yDDAKyxt-lkp@intel.com>
References: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-pinctrl]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next geert-renesas-devel/next linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-rzg3s-smarc-Drop-hogging-of-GPIO-pins/20241017-194200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20241017113942.139712-7-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
config: arm-pxa3xx_defconfig (https://download.01.org/0day-ci/archive/20241019/202410190448.yDDAKyxt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190448.yDDAKyxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190448.yDDAKyxt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/core.c:38:
>> drivers/pinctrl/pinmux.h:104:6: warning: no previous prototype for 'pin_requested' [-Wmissing-prototypes]
     104 | bool pin_requested(struct pinctrl_dev *pctldev, int pin)
         |      ^~~~~~~~~~~~~


vim +/pin_requested +104 drivers/pinctrl/pinmux.h

   103	
 > 104	bool pin_requested(struct pinctrl_dev *pctldev, int pin)
   105	{
   106		return false;
   107	}
   108	#endif
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

