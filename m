Return-Path: <linux-gpio+bounces-12168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AD9B1FB1
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 19:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE63928165A
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 18:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2162F175D4F;
	Sun, 27 Oct 2024 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRhhExUd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DCA175D4A;
	Sun, 27 Oct 2024 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730053285; cv=none; b=L5v57tbRXp6OhD27xY8QV+BEWikdWPlTnO0TdHpWUYb8FOttWp6s24cvbJIedDyjVj3Czq5PWPfwqgYAS/tOubMy6dHsY8/GOtR12POKXVOIX5HwzcAgcY7N/zng8gPTPUxCZtfxHvNLc77V/K6Sk7HI/yDXCLTMd0u8G+NV5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730053285; c=relaxed/simple;
	bh=M0foY50M4HsUnWQT73wNT19qOzDjY/3ojUHdpCR2Au0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUPbv67LgJuG8Gjfy8nDNQxg907s1RE0T388T0Kjq+CAHNSBHKMxaSpeeH1iOfIfbemL8jBKegs96KeSsojkt32BUjIO7uMrAJ9l3EXA+x4vIK6mF2oe3aAQqWrQPnGEBrC9sWKJ9gn6gKP4SjAyY0DObI6kBQUqOhiOSfkCBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRhhExUd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730053283; x=1761589283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0foY50M4HsUnWQT73wNT19qOzDjY/3ojUHdpCR2Au0=;
  b=HRhhExUdsQfWGThFvWPqGLDaBd4wU4nkbA6go/r6kVqGMV4uEtJltQzi
   8zvc52N8b/VzN7NIIzwnM24cPVvV360YxTM5rxwPS5hZ0wRcuX46RKdEq
   xDKVOHYQrGl83vsBGjv9CAaJ2Tyh7W1vs/Ay+dvHjXqtl2f7E6toIDnzS
   I59P/GpCVqem5tYOVW802jzDAG9lfLqRlXtllpKGa6W8hG9/Highe1oIW
   jBfzILvOS8UfDrXy2kuIq3hSjGVc9ZYpfddgtMGD0gfgnB7/F5xnHoRuB
   ixiStx3BVZ5jKA3zZZSaMc5W2J19W4i6MDM7ntgOnRgen/vo86dlQawoM
   g==;
X-CSE-ConnectionGUID: KJ23nCIHTYOKZac1+/+X3A==
X-CSE-MsgGUID: /DMjZh6cQvGx/3pCDbIcsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33564717"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="33564717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:21:23 -0700
X-CSE-ConnectionGUID: H1QstXZTRRS7jy5jDhNBEg==
X-CSE-MsgGUID: IpKzxFHhSB6Dxzeg+K+IdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81353158"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2024 11:21:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57t7-000au5-2t;
	Sun, 27 Oct 2024 18:21:17 +0000
Date: Mon, 28 Oct 2024 02:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410280230.KAMZK7aZ-lkp@intel.com>
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>

Hi chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241025-111952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241025031814.21442-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: s390-randconfig-r131-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280230.KAMZK7aZ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20241028/202410280230.KAMZK7aZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280230.KAMZK7aZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/pinctrl/mediatek/mtk-eint.c:14:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/pinctrl/mediatek/mtk-eint.c:588:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           dsb(sy);
           ^
   drivers/pinctrl/mediatek/mtk-eint.c:588:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   drivers/pinctrl/mediatek/mtk-eint.c:609:2: error: call to undeclared function 'dsb'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           dsb(sy);
           ^
   drivers/pinctrl/mediatek/mtk-eint.c:609:6: error: use of undeclared identifier 'sy'
           dsb(sy);
               ^
   drivers/pinctrl/mediatek/mtk-eint.c:686:14: warning: no previous prototype for function 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
   unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
                ^
   drivers/pinctrl/mediatek/mtk-eint.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   ^
   static 
   drivers/pinctrl/mediatek/mtk-eint.c:709:14: warning: no previous prototype for function 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
   unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
                ^
   drivers/pinctrl/mediatek/mtk-eint.c:709:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   ^
   static 
   14 warnings and 4 errors generated.


vim +/dsb +588 drivers/pinctrl/mediatek/mtk-eint.c

   572	
   573	int mtk_eint_do_suspend(struct mtk_eint *eint)
   574	{
   575		unsigned int i, j, port;
   576	
   577		for (i = 0; i < eint->instance_number; i++) {
   578			struct mtk_eint_instance inst = eint->instances[i];
   579	
   580			for (j = 0; j < inst.number; j += MAX_BIT) {
   581				port = j >> REG_GROUP;
   582				writel_relaxed(~inst.wake_mask[port],
   583					       inst.base + port*REG_OFSET + eint->comp->regs->mask_set);
   584				writel_relaxed(inst.wake_mask[port],
   585					       inst.base + port*REG_OFSET + eint->comp->regs->mask_clr);
   586			}
   587		}
 > 588		dsb(sy);
   589	
   590		return 0;
   591	}
   592	EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

