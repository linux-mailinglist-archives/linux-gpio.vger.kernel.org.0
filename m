Return-Path: <linux-gpio+bounces-13399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E29E04DC
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 15:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC53B26DCE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5DC1FECA9;
	Mon,  2 Dec 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtT4PH+/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848311FECA2;
	Mon,  2 Dec 2024 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143314; cv=none; b=i5MimTkyARPZUa1qiseZd5T+JHNxM41PFf3m4QWTXRBWqxF6JWVj7TXr+IbAzrqt1wJLOAGNfxoKVr8ORV8wLNhmluxiELGMY/I1aaOLaRrLZB8DNaTIRhBRlauSZERByYU/UnF/tY6otM5rTL4fUKlK2C8/pwMTjDvLw3uKpbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143314; c=relaxed/simple;
	bh=/6bKU0R/dnuGLOITYR0+vZxxFxDTHlhCvq2y8NVrENE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NK2toZEhSIeWP1h7ezw3jkYYvfMBMCKqAbHKZ6erQNJF39qeXaPjVMn7Mwt8nrmj5AZ0ptbuRem2qA9K8yNvasYUnIKvY16jU2eB/MSGDVE+f2bBzamK1q6FsDbVsKxZRUuEKwjLiJnKiGF78KvjRcJNTQXMZitFNxH8+t88xcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtT4PH+/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733143312; x=1764679312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/6bKU0R/dnuGLOITYR0+vZxxFxDTHlhCvq2y8NVrENE=;
  b=DtT4PH+/8VXQLqCpXVMu1xIQNdarDAqvxxdB052lNUVT4KZDnjR12LeK
   psH1iSHjKspfD+ldCKvxglbkXDH4D7IMPov7bII6dFB+s0f82UQkKLqEk
   Gx8QKmqRcVCH+B2UANS1zXxR0MyhGnrJZm+JPy3FOfCCYV5rPmGrHD3lr
   fpuwRSt1jWsMzlYidW4aKEMX15cCjKEOuNBkvWhSlAt95FYrLEdGMGzhw
   WF2FZSJA/fg6M2tU/ehZA9UNe0s20gRhF/ABuOV2hNJOxTnmqIeyvaFmQ
   9MRNrX1yTVbgRfnjCHYqg856e7n1GQEFK9frfjUHhXGm5BU2whHlDuelV
   g==;
X-CSE-ConnectionGUID: 1+oW0eAyTOmDyDkD87iNBA==
X-CSE-MsgGUID: 5NTI6/4MSzKQYN0GpQbgyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="20899669"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="20899669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 04:41:51 -0800
X-CSE-ConnectionGUID: mcGNoGCeS0urFo3Yqu+tLA==
X-CSE-MsgGUID: s3MeUe3iTtmJsdAwONITmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98125338"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Dec 2024 04:41:49 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI5kI-0002QD-2j;
	Mon, 02 Dec 2024 12:41:46 +0000
Date: Mon, 2 Dec 2024 20:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202412022033.G153neOU-lkp@intel.com>
References: <20241202085024.25375-1-ot_chhao.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085024.25375-1-ot_chhao.chang@mediatek.com>

Hi chang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241202-165544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241202085024.25375-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: arc-randconfig-001-20241202 (https://download.01.org/0day-ci/archive/20241202/202412022033.G153neOU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022033.G153neOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022033.G153neOU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/mediatek/mtk-eint.c:246:6: warning: no previous prototype for 'mt6983_eint_ack' [-Wmissing-prototypes]
     246 | void mt6983_eint_ack(struct irq_data *d)
         |      ^~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_suspend':
>> drivers/pinctrl/mediatek/mtk-eint.c:605:9: error: implicit declaration of function 'dsb' [-Werror=implicit-function-declaration]
     605 |         dsb(sy);
         |         ^~~
>> drivers/pinctrl/mediatek/mtk-eint.c:605:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     605 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c:605:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_resume':
   drivers/pinctrl/mediatek/mtk-eint.c:626:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     626 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c: At top level:
>> drivers/pinctrl/mediatek/mtk-eint.c:704:14: warning: no previous prototype for 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
     704 | unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/mediatek/mtk-eint.c:727:14: warning: no previous prototype for 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
     727 | unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dsb +605 drivers/pinctrl/mediatek/mtk-eint.c

   589	
   590	int mtk_eint_do_suspend(struct mtk_eint *eint)
   591	{
   592		unsigned int i, j, port;
   593	
   594		for (i = 0; i < eint->instance_number; i++) {
   595			struct mtk_eint_instance inst = eint->instances[i];
   596	
   597			for (j = 0; j < inst.number; j += 32) {
   598				port = j >> 5;
   599				writel_relaxed(~inst.wake_mask[port],
   600					       inst.base + port * 4 + eint->comp->regs->mask_set);
   601				writel_relaxed(inst.wake_mask[port],
   602					       inst.base + port * 4 + eint->comp->regs->mask_clr);
   603			}
   604		}
 > 605		dsb(sy);
   606	
   607		return 0;
   608	}
   609	EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
   610	
   611	int mtk_eint_do_resume(struct mtk_eint *eint)
   612	{
   613		unsigned int i, j, port;
   614	
   615		for (i = 0; i < eint->instance_number; i++) {
   616			struct mtk_eint_instance inst = eint->instances[i];
   617	
   618			for (j = 0; j < inst.number; j += 32) {
   619				port = j >> 5;
   620				writel_relaxed(~inst.cur_mask[port],
   621					       inst.base + port * 4 + eint->comp->regs->mask_set);
   622				writel_relaxed(inst.cur_mask[port],
   623					       inst.base + port * 4 + eint->comp->regs->mask_clr);
   624			}
   625		}
   626		dsb(sy);
   627	
   628		return 0;
   629	}
   630	EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
   631	
   632	int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
   633				  unsigned int debounce)
   634	{
   635		int virq, eint_offset;
   636		unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask,
   637			     dbnc;
   638		static const unsigned int debounce_time[] = { 156, 313, 625, 1250,
   639			20000, 40000, 80000, 160000, 320000, 640000 };
   640		struct irq_data *d;
   641		unsigned int instance, index;
   642		void __iomem *reg;
   643	
   644		/*
   645		 * Due to different number of bit field, we only decode
   646		 * the coordinate here, instead of get the VA.
   647		 */
   648		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   649					  &instance, &index);
   650	
   651		if (!reg) {
   652			dev_err(eint->dev, "%s invalid eint_num %lu\n",
   653				__func__, eint_num);
   654			return 0;
   655		}
   656	
   657		virq = irq_find_mapping(eint->domain, eint_num);
   658		eint_offset = (index % 4) * 8;
   659		d = irq_get_irq_data(virq);
   660	
   661		reg = eint->instances[instance].base;
   662		set_offset = (index / 4) * 4 + eint->comp->regs->dbnc_set;
   663		clr_offset = (index / 4) * 4 + eint->comp->regs->dbnc_clr;
   664	
   665		if (!mtk_eint_can_en_debounce(eint, eint_num))
   666			return -EINVAL;
   667	
   668		/*
   669		 * Check eint number to avoid access out-of-range
   670		 */
   671		dbnc = ARRAY_SIZE(debounce_time) - 1;
   672		for (i = 0; i < ARRAY_SIZE(debounce_time); i++) {
   673			if (debounce <= debounce_time[i]) {
   674				dbnc = i;
   675				break;
   676			}
   677		}
   678	
   679		if (!mtk_eint_get_mask(eint, eint_num)) {
   680			mtk_eint_mask(d);
   681			unmask = 1;
   682		} else {
   683			unmask = 0;
   684		}
   685	
   686		clr_bit = 0xff << eint_offset;
   687		writel(clr_bit, reg + clr_offset);
   688	
   689		bit = ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS)
   690			| MTK_EINT_DBNC_SET_EN) << eint_offset;
   691		rst = MTK_EINT_DBNC_RST_BIT << eint_offset;
   692		writel(rst | bit, reg + set_offset);
   693	
   694		/* Delay should be (8T @ 32k) from dbc rst to work correctly. */
   695		udelay(250);
   696	
   697		if (unmask == 1)
   698			mtk_eint_unmask(d);
   699	
   700		return 0;
   701	}
   702	EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
   703	
 > 704	unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   705					      unsigned int eint_num)
   706	{
   707		unsigned int instance, index, bit;
   708		void __iomem *reg;
   709	
   710		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   711					  &instance, &index);
   712	
   713		if (!reg) {
   714			dev_err(eint->dev, "%s invalid eint_num %d\n",
   715				__func__, eint_num);
   716			return 0;
   717		}
   718	
   719		reg = eint->instances[instance].base +
   720			(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
   721	
   722		bit = MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
   723	
   724		return (readl(reg) & bit) ? 1 : 0;
   725	}
   726	
 > 727	unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   728						 unsigned int eint_num)
   729	{
   730		unsigned int instance, index, mask, offset;
   731		void __iomem *reg;
   732	
   733		reg = mtk_eint_get_offset(eint, eint_num, MTK_EINT_NO_OFFSET,
   734					  &instance, &index);
   735	
   736		if (!reg) {
   737			dev_err(eint->dev, "%s invalid eint_num %d\n",
   738				__func__, eint_num);
   739			return 0;
   740		}
   741	
   742		reg = eint->instances[instance].base +
   743			(index / 4) * 4 + eint->comp->regs->dbnc_ctrl;
   744	
   745		offset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % 4) * 8);
   746		mask = 0xf << offset;
   747	
   748		return ((readl(reg) & mask) >> offset);
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

