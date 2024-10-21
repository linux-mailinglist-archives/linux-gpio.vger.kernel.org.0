Return-Path: <linux-gpio+bounces-11700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C439A5908
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 04:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4DE0281241
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 02:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91518433BB;
	Mon, 21 Oct 2024 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9sfkGjT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4B29408;
	Mon, 21 Oct 2024 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729478926; cv=none; b=bwpj8dtCEtopmGH5Z+Z98r47FCChkv1TZ1eEgqXwWVcY55mHozK2N4xYePkGQYG79994WzHtjPERjm8L8dUJiOsPDOQDoIaIq+pnzaH61m6KsWOUZX0BTILMvhVbDu+nUbxvJDw/Rxco/5T8y0GAeClTqNwJOIlStokq25klOys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729478926; c=relaxed/simple;
	bh=Cr/IcJU+i0W4asDlN443uFwPMZgQlI6G+rafZwdkb3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSdxdOCTLnH9LYjle2l4GEt5KjOMKJieRigu8QHKT+MspdiADtNyokJGrvWA3l1WefRSsU4i6UqTWaE0zZ6VoXlV+cD82z883pdJrLDgMOeysbQoDNf7vgKo1SWeTTB/4slRd567tVDKhG1bc/4aQyNd6n1U5UGQ6EUy8wSn4Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9sfkGjT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729478924; x=1761014924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cr/IcJU+i0W4asDlN443uFwPMZgQlI6G+rafZwdkb3A=;
  b=e9sfkGjTXPVaH5ZV0gY3y5Ea8kl6ocdPhbY+/NH+lTqc+9e4DO+dWNx7
   6hOZkm76+ukgdNl41l5mts8jG9NDRM18l27mnYCfOorYKlVZAHXR8PkhG
   Z3pZunQUizKtsPf1/SN1CYMrlhzkLQKHTAgTBTW4xJofXMnLOvaGUH1gf
   ZoFbM+XCWrBULgby1Cpc/HyK60SY7GAA+PazmS2r0WXzhVH5EGZXXmCzf
   X1M/8O9KZW2PrEpliwxHvqtOv6tF6OmSC+8vnbHakXwqs2y7f0PRBKgpU
   aJLp0AZMxnpPjwSB6lQUgiGFc9EAPOA2Y7ZsdezHkohoIVB2Tuoxd+NtE
   g==;
X-CSE-ConnectionGUID: Zt16Qlh/QQaYOsK5mZtQbg==
X-CSE-MsgGUID: IryGCeZ2RUC8mktUjG9t+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29159685"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="29159685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 19:48:38 -0700
X-CSE-ConnectionGUID: E5c7vqo5QEyzjElefJQcRA==
X-CSE-MsgGUID: /cIoSbYOR4mFZlKLjpnhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79346293"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Oct 2024 19:48:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2iT9-000R4d-0t;
	Mon, 21 Oct 2024 02:48:31 +0000
Date: Mon, 21 Oct 2024 10:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is
 requested
Message-ID: <202410211007.sFKERNFY-lkp@intel.com>
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
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next geert-renesas-devel/next linus/master v6.12-rc4 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/arm64-dts-renesas-rzg3s-smarc-Drop-hogging-of-GPIO-pins/20241017-194200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/20241017113942.139712-7-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
config: hexagon-randconfig-001-20241021 (https://download.01.org/0day-ci/archive/20241021/202410211007.sFKERNFY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211007.sFKERNFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211007.sFKERNFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/core.c:28:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/core.c:28:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/core.c:28:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/pinctrl/core.c:38:
>> drivers/pinctrl/pinmux.h:104:6: warning: no previous prototype for function 'pin_requested' [-Wmissing-prototypes]
     104 | bool pin_requested(struct pinctrl_dev *pctldev, int pin)
         |      ^
   drivers/pinctrl/pinmux.h:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | bool pin_requested(struct pinctrl_dev *pctldev, int pin)
         | ^
         | static 
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


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

