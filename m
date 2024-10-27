Return-Path: <linux-gpio+bounces-12162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22E9B1BEF
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 04:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09CB21C20CAA
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Oct 2024 03:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD49C17BA6;
	Sun, 27 Oct 2024 03:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRwmrAP9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6790125B9;
	Sun, 27 Oct 2024 03:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730000173; cv=none; b=ViiA2p+IoeYL3zq7EU+kVTLz2G1kWSeV+LyiYwxZifE77m0YSHn9qOaxQjm5lkyqHa7+5RFfyEcqkmNZGtauHD3YKUnlMFCoDSWfZMHw5PIslGQo/QuxQEpuCYRHETsWkk0dMoTHFuerWGmQ1rs/QNRFY3MeiKlzPu3qzElvtPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730000173; c=relaxed/simple;
	bh=tuqOPQeN5J9ifQjSyw5F6waaOmkOaPGwOqm5ND0MEeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2NqrnDIk1is7KRbfGtRkKY/c8otrRgeVXUKIaUN6XIVILTnsrFUYMrHNtOk5iJ4ILYX0zbvWKC2OGWjgzzms1ntKSp83XURuSQSsVe4MCdSl7/j0jrwjc0V5xAOZbjnQ2PJoX/Y/6pBYN4j+iP5BjGVaRgRdMsHXhvjF+KIE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRwmrAP9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730000171; x=1761536171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tuqOPQeN5J9ifQjSyw5F6waaOmkOaPGwOqm5ND0MEeA=;
  b=JRwmrAP9EmRirJevIrl7acVUwZIdEORVj3BErOZi9Nho4R55IRAEUvdr
   nphleZ40N8d100pQYuM1t8oNf8J+dw3AEBMTLS67mX5xD9yKjCkq5pyyq
   HBZPCoh6l+HqkYBiECOrqJCbGBPQ6uXpArEGvSFHKXpW+lgwZLcUAVHvl
   qRCeeLN/QW8KgJasYCViMTi9S21atENpABeIfmgZGHEqpx1A9MGkS8t2n
   1IgDVn0ff6w9UXZeYUoIcE7XHr7yRcXNljXOm8Bf1h4fWQw+uQSo0JbJN
   V9f+yE1UTvfl4+eMDoBDMY3z+w8tn9PO97+UOAfCamAZjrbNp0DNHSDM+
   g==;
X-CSE-ConnectionGUID: EaGGrze+RTy7ZiXwaaVTrg==
X-CSE-MsgGUID: 2BXnmgBVSImed46+NMua3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29766356"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29766356"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:36:10 -0700
X-CSE-ConnectionGUID: +czJQ7F3Rt2k4fq9aWg89Q==
X-CSE-MsgGUID: ql3X8lkzRTC9A4t5AZnybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85835570"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2024 20:36:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4u4S-000aKG-1k;
	Sun, 27 Oct 2024 03:36:04 +0000
Date: Sun, 27 Oct 2024 11:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	linus.walleij@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chhao Chang <ot_chhao.chang@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
Message-ID: <202410271123.3hyFF6pg-lkp@intel.com>
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
config: csky-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271123.3hyFF6pg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271123.3hyFF6pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271123.3hyFF6pg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_suspend':
>> drivers/pinctrl/mediatek/mtk-eint.c:588:9: error: implicit declaration of function 'dsb' [-Wimplicit-function-declaration]
     588 |         dsb(sy);
         |         ^~~
>> drivers/pinctrl/mediatek/mtk-eint.c:588:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     588 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c:588:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_do_resume':
   drivers/pinctrl/mediatek/mtk-eint.c:609:13: error: 'sy' undeclared (first use in this function); did you mean 's8'?
     609 |         dsb(sy);
         |             ^~
         |             s8
   drivers/pinctrl/mediatek/mtk-eint.c: At top level:
   drivers/pinctrl/mediatek/mtk-eint.c:686:14: warning: no previous prototype for 'mtk_eint_get_debounce_en' [-Wmissing-prototypes]
     686 | unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/mtk-eint.c:709:14: warning: no previous prototype for 'mtk_eint_get_debounce_value' [-Wmissing-prototypes]
     709 | unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/mtk-eint.c:749:34: warning: 'eint_compatible_ids' defined but not used [-Wunused-const-variable=]
     749 | static const struct of_device_id eint_compatible_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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

