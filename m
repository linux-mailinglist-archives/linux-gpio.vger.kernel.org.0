Return-Path: <linux-gpio+bounces-12148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E119B1A69
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865D81F21DBB
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 18:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ABA1D61B1;
	Sat, 26 Oct 2024 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ryv2s0mp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F11D5CD6;
	Sat, 26 Oct 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729967303; cv=none; b=QALK0RZ7vMmwqJIhuNwE+XilCjqpB5X02XfNd5dHYlZhfBVe4qVSPNeIVCNhw9Wabjvz+Rlp3XS9ntlLdxjtUyR0hppIji6FhQmTSwm1RVwKtNj2tR1Wdp3nt35qNKj2X39990PUo/0O6Y1BuMAy8XfUAiI39QH2emMf7UZ28E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729967303; c=relaxed/simple;
	bh=Qn0+EUEBwHw/wS8WVeU9EYrJ/6q9fzV8u+7eXowaNyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShqPE3mr5hCgtVCkGt5CuwGGBE/6frde77u9Hchbh6nBurfiMZLHcnPaH/7LO2VmQplTDtH173giJlYV5ztqrYFE79P/ApvgumIsnQ5In7S4R0HequFPj2lsUsBuCmEJRn8mn83zvmLN6kg1I50i701m2gO41kPacdlXnVvPfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ryv2s0mp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729967300; x=1761503300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qn0+EUEBwHw/wS8WVeU9EYrJ/6q9fzV8u+7eXowaNyU=;
  b=Ryv2s0mp/gnGJx+k1swmdHCujvlfSSl6BZh3JyLAB8mKbvwYMtjFD/7i
   BDtDqzMSxYguIBPdm3DcsCftIyn2wTymZ+EP3QerqYnbQfbCzbUn7ZShx
   hhDTbnAjniGSLpV41Xz9CPvbmDM6sti5/d+ZK/2Muih4Pqf1f3zbW7E+x
   E5QB8W7U/JJ6VmC4zEskosI+ogwaZRZWmbBT+2QSN9I4kUfbSZmlhEfvV
   EVRH0fazOUF4BmtJks6ZpVyyPnONXLL+BtadNI3h0QvbP9N6e0/eAMqi9
   XQZsp7aoPaRfcoROtFgFV6FU+ByVpH+KNtc6JYqTCGcfstaZZgvMzO3qw
   w==;
X-CSE-ConnectionGUID: tHSZ5q6tTT2XI7L/YLFcdg==
X-CSE-MsgGUID: YCokAzHcRyObP10xqSIcXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="41006194"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="41006194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 11:28:19 -0700
X-CSE-ConnectionGUID: C1/vY19HRTa7GdJOUmrzQg==
X-CSE-MsgGUID: SsPm+H7rQMWmsp4BOsyosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="80806687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 11:28:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4lWI-000Zvt-0z;
	Sat, 26 Oct 2024 18:28:14 +0000
Date: Sun, 27 Oct 2024 02:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410270252.vGIAE54G-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chang-hao/pinctrl-mediatek-add-eint-new-design-for-mt8196/20241025-111952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241025031814.21442-1-ot_chhao.chang%40mediatek.com
patch subject: [PATCH] pinctrl: mediatek: add eint new design for mt8196
config: arm-randconfig-r122-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270252.vGIAE54G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410270252.vGIAE54G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270252.vGIAE54G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/mediatek/mtk-eint.c:686:14: sparse: sparse: symbol 'mtk_eint_get_debounce_en' was not declared. Should it be static?
>> drivers/pinctrl/mediatek/mtk-eint.c:709:14: sparse: sparse: symbol 'mtk_eint_get_debounce_value' was not declared. Should it be static?
>> drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] *[assigned] ph @@
   drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse:     expected restricted __be32 const [usertype] *p
   drivers/pinctrl/mediatek/mtk-eint.c:823:53: sparse:     got unsigned int const [usertype] *[assigned] ph

vim +/mtk_eint_get_debounce_en +686 drivers/pinctrl/mediatek/mtk-eint.c

   685	
 > 686	unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
   687					      unsigned int eint_num)
   688	{
   689		unsigned int instance, index, bit;
   690		void __iomem *reg;
   691	
   692		reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
   693					  &instance, &index);
   694	
   695		if (!reg) {
   696			dev_err(eint->dev, "%s invalid eint_num %d\n",
   697				__func__, eint_num);
   698			return 0;
   699		}
   700	
   701		reg = eint->instances[instance].base +
   702			(index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_ctrl;
   703	
   704		bit = MTK_EINT_DBNC_SET_EN << ((index % REG_OFSET) * DB_GROUP);
   705	
   706		return (readl(reg) & bit) ? 1 : 0;
   707	}
   708	
 > 709	unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
   710						   unsigned int eint_num)
   711	{
   712		unsigned int instance, index, mask, ofset;
   713		void __iomem *reg;
   714	
   715		reg = mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
   716					  &instance, &index);
   717	
   718		if (!reg) {
   719			dev_err(eint->dev, "%s invalid eint_num %d\n",
   720				__func__, eint_num);
   721			return 0;
   722		}
   723	
   724		reg = eint->instances[instance].base +
   725			(index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_ctrl;
   726	
   727		ofset = MTK_EINT_DBNC_SET_DBNC_BITS + ((index % REG_OFSET) * DB_GROUP);
   728		mask = 0xf << ofset;
   729	
   730		return ((readl(reg) & mask) >> ofset);
   731	}
   732	
   733	int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
   734	{
   735		int irq;
   736	
   737		irq = irq_find_mapping(eint->domain, eint_n);
   738		if (!irq)
   739			return -EINVAL;
   740	
   741		return irq;
   742	}
   743	EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
   744	
   745	static const struct mtk_eint_compatible default_compat = {
   746		.regs = &mtk_generic_eint_regs,
   747	};
   748	
   749	static const struct of_device_id eint_compatible_ids[] = {
   750		{ }
   751	};
   752	
   753	int mtk_eint_do_init(struct mtk_eint *eint)
   754	{
   755		int i, virq;
   756		unsigned int size, inst = 0;
   757		eint->instance_number = 1;
   758		eint->total_pin_number = eint->hw->ap_num;
   759	
   760		for (i = 0; i < eint->total_pin_number; i++) {
   761			eint->pins[i].enabled = true;
   762			eint->pins[i].instance = inst;
   763			eint->pins[i].index = i;
   764			eint->pins[i].debounce =  (i < eint->hw->db_cnt) ? 1 : 0;
   765	
   766			eint->instances[inst].pin_list[i] = i;
   767			eint->instances[inst].number++;
   768		}
   769	
   770		for (i = 0; i < eint->instance_number; i++) {
   771			size = (eint->instances[i].number / MAX_BIT + 1) * sizeof(unsigned int);
   772			eint->instances[i].wake_mask =
   773				devm_kzalloc(eint->dev, size, GFP_KERNEL);
   774			eint->instances[i].cur_mask =
   775				devm_kzalloc(eint->dev, size, GFP_KERNEL);
   776	
   777			if (!eint->instances[i].wake_mask ||
   778			    !eint->instances[i].cur_mask)
   779				return -ENOMEM;
   780		}
   781	
   782		eint->comp = &default_compat;
   783	
   784		eint->domain = irq_domain_add_linear(eint->dev->of_node,
   785						     eint->total_pin_number,
   786						     &irq_domain_simple_ops, NULL);
   787		if (!eint->domain)
   788			return -ENOMEM;
   789	
   790		mtk_eint_hw_init(eint);
   791		for (i = 0; i < eint->total_pin_number; i++) {
   792			virq = irq_create_mapping(eint->domain, i);
   793	
   794			irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
   795						 handle_level_irq);
   796			irq_set_chip_data(virq, eint);
   797		}
   798	
   799		irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
   800						 eint);
   801	
   802		global_eintc = eint;
   803	
   804		return 0;
   805	}
   806	EXPORT_SYMBOL_GPL(mtk_eint_do_init);
   807	
   808	int mtk_eint_do_init_v2(struct mtk_eint *eint)
   809	{
   810		int i, virq, matrix_number = 0;
   811		struct device_node *node;
   812		unsigned int ret, size, ofset;
   813		unsigned int id, inst, idx, support_deb;
   814	
   815		const phandle *ph;
   816	
   817		ph = of_get_property(eint->dev->of_node, "mediatek,eint", NULL);
   818		if (!ph) {
   819			dev_err(eint->dev, "Cannot find EINT phandle in PIO node.\n");
   820			return -ENODEV;
   821		}
   822	
 > 823		node = of_find_node_by_phandle(be32_to_cpup(ph));
   824		if (!node) {
   825			dev_err(eint->dev, "Cannot find EINT node by phandle.\n");
   826			return -ENODEV;
   827		}
   828	
   829		ret = of_property_read_u32(node, "mediatek,total-pin-number",
   830					   &eint->total_pin_number);
   831		if (ret) {
   832			dev_err(eint->dev,
   833			       "%s cannot read total-pin-number from device node.\n",
   834			       __func__);
   835			return -EINVAL;
   836		}
   837	
   838		dev_info(eint->dev, "%s eint total %u pins.\n", __func__,
   839			eint->total_pin_number);
   840	
   841		ret = of_property_read_u32(node, "mediatek,instance-num",
   842					   &eint->instance_number);
   843		if (ret)
   844			eint->instance_number = 1; // only 1 instance in legacy chip
   845	
   846		size = eint->instance_number * sizeof(struct mtk_eint_instance);
   847		eint->instances = devm_kzalloc(eint->dev, size, GFP_KERNEL);
   848		if (!eint->instances)
   849			return -ENOMEM;
   850	
   851		size = eint->total_pin_number * sizeof(struct mtk_eint_pin);
   852		eint->pins = devm_kzalloc(eint->dev, size, GFP_KERNEL);
   853		if (!eint->pins)
   854			return -ENOMEM;
   855	
   856		for (i = 0; i < eint->instance_number; i++) {
   857			ret = of_property_read_string_index(node, "reg-name", i,
   858							    &(eint->instances[i].name));
   859			if (ret) {
   860				dev_info(eint->dev,
   861					 "%s cannot read the name of instance %d.\n",
   862					 __func__, i);
   863			}
   864	
   865			eint->instances[i].base = of_iomap(node, i);
   866			if (!eint->instances[i].base)
   867				return -ENOMEM;
   868		}
   869	
   870		matrix_number = of_property_count_u32_elems(node, "mediatek,pins") / ARRAY_0;
   871		if (matrix_number < 0) {
   872			matrix_number = eint->total_pin_number;
   873			dev_info(eint->dev, "%s eint in legacy mode, assign the matrix number to %u.\n",
   874				 __func__, matrix_number);
   875		} else
   876			dev_info(eint->dev, "%s eint in new mode, assign the matrix number to %u.\n",
   877				 __func__, matrix_number);
   878	
   879		for (i = 0; i < matrix_number; i++) {
   880			ofset = i * REG_OFSET;
   881	
   882			ret = of_property_read_u32_index(node, "mediatek,pins",
   883						   ofset, &id);
   884			ret |= of_property_read_u32_index(node, "mediatek,pins",
   885						   ofset+FIRST, &inst);
   886			ret |= of_property_read_u32_index(node, "mediatek,pins",
   887						   ofset+SECOND, &idx);
   888			ret |= of_property_read_u32_index(node, "mediatek,pins",
   889						   ofset+THIRD, &support_deb);
   890	
   891			/* Legacy chip which no need to give coordinate list */
   892			if (ret) {
   893				id = i;
   894				inst = 0;
   895				idx = i;
   896				support_deb = (i < MAX_BIT) ? 1 : 0;
   897			}
   898	
   899			eint->pins[id].enabled = true;
   900			eint->pins[id].instance = inst;
   901			eint->pins[id].index = idx;
   902			eint->pins[id].debounce = support_deb;
   903	
   904			eint->instances[inst].pin_list[idx] = id;
   905			eint->instances[inst].number++;
   906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

