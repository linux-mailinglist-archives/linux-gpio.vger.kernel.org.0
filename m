Return-Path: <linux-gpio+bounces-26988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8DBCEE31
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 03:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA793E8484
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 01:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CC1136351;
	Sat, 11 Oct 2025 01:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4zKOOYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D85148850;
	Sat, 11 Oct 2025 01:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147099; cv=none; b=qeGSlTd6Lf3Lobtcs7Va8DoJWmIiWleZasSyQ5w9rwY/1eIF6jNVqZRAkG0epgTmdaWE3lAgDw5wX13LYxY7xldjKh/6L+JgDmPGSCQ39a/RUM265RFTcPsHr7oc5d1P12OOHKxqfjz1apN/BSMweSnPk7uPTimY0/Cmu/R/9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147099; c=relaxed/simple;
	bh=/bQg4XYN/VovXgBh/08m6D9aPhrDbsZ8VtYXirz0fbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHCQLC/jTFoucKAwWu/pqGPbCI2gTvlQ/Fy+VFjD+GMJosl1KMDwNS+afRFDM34tdJddZrAUq2vRTKXxVJvp1VdaxV3puTa1FxX2RzYE2UD+K/J17nUyNMo8W/tPGmdKkF2sccT+CRLb1IB2zXmMJm0QelRJ/gJMW/gACKqdbtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4zKOOYv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760147098; x=1791683098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/bQg4XYN/VovXgBh/08m6D9aPhrDbsZ8VtYXirz0fbc=;
  b=Q4zKOOYvnuyYw/EKj9grtVmwXQ/QV4aK/vgSDiOKMotMcQUSwIzG06DB
   kio4Kymlfgdd9j9QMiNrqYKtS/98A1He0jzTAa2mIiKmWuVMru+vYHW3P
   n2tnL350m4YevHoh1gM1Chag5rO4PzG1WxFa7jQTOEG3LCy/3TNZAOCdA
   Rdnl9+MkajNApuIbZYHYAyOJIg5IE3sObwoBmstgoYbt7YprHdE7peckc
   i6DMsgQnU5NTp8dqchLgSKTl8ruZEXWx6Sxa1EnhzPiUT82IvV7HSuiGe
   zeELxNGWZGbyk7MPEfIQI0LyOoasokKxG5NHykV1YHV4Ru6J6VIDdc8eS
   Q==;
X-CSE-ConnectionGUID: ToJQ88ZFTf2sZqhObSR2EA==
X-CSE-MsgGUID: 5OmWwhfnTqKWPxMi3wpFnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61399377"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="61399377"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 18:44:57 -0700
X-CSE-ConnectionGUID: 3obdzLB0Rd+Ap+7tCig8Cw==
X-CSE-MsgGUID: noIfFSMPTtGCHB3Stmar0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="211761163"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2025 18:44:54 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7OfD-0003Ot-39;
	Sat, 11 Oct 2025 01:44:51 +0000
Date: Sat, 11 Oct 2025 09:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Michael Buesch <m@bues.ch>
Cc: oe-kbuild-all@lists.linux.dev, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <202510110924.dUQeeRV6-lkp@intel.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010105338.664564-1-vaibhavgupta40@gmail.com>

Hi Vaibhav,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vaibhav-Gupta/driver-gpio-bt8xx-use-generic-PCI-PM/20251010-185625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251010105338.664564-1-vaibhavgupta40%40gmail.com
patch subject: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
config: loongarch-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510110924.dUQeeRV6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110924.dUQeeRV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110924.dUQeeRV6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_suspend':
>> drivers/gpio/gpio-bt8xx.c:233:19: error: 'struct bt8xxgpio' has no member named 'saved_outen'
     233 |                 bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
         |                   ^~
>> drivers/gpio/gpio-bt8xx.c:234:19: error: 'struct bt8xxgpio' has no member named 'saved_data'
     234 |                 bg->saved_data = bgread(BT848_GPIO_DATA);
         |                   ^~
   drivers/gpio/gpio-bt8xx.c: In function 'bt8xxgpio_resume':
   drivers/gpio/gpio-bt8xx.c:254:19: error: 'struct bt8xxgpio' has no member named 'saved_outen'
     254 |         bgwrite(bg->saved_outen, BT848_GPIO_OUT_EN);
         |                   ^~
   drivers/gpio/gpio-bt8xx.c:61:41: note: in definition of macro 'bgwrite'
      61 | #define bgwrite(dat, adr)       writel((dat), bg->mmio+(adr))
         |                                         ^~~
   drivers/gpio/gpio-bt8xx.c:255:19: error: 'struct bt8xxgpio' has no member named 'saved_data'
     255 |         bgwrite(bg->saved_data & bg->saved_outen,
         |                   ^~
   drivers/gpio/gpio-bt8xx.c:61:41: note: in definition of macro 'bgwrite'
      61 | #define bgwrite(dat, adr)       writel((dat), bg->mmio+(adr))
         |                                         ^~~
   drivers/gpio/gpio-bt8xx.c:255:36: error: 'struct bt8xxgpio' has no member named 'saved_outen'
     255 |         bgwrite(bg->saved_data & bg->saved_outen,
         |                                    ^~
   drivers/gpio/gpio-bt8xx.c:61:41: note: in definition of macro 'bgwrite'
      61 | #define bgwrite(dat, adr)       writel((dat), bg->mmio+(adr))
         |                                         ^~~


vim +233 drivers/gpio/gpio-bt8xx.c

ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  226  
2213c7a2cb81b2 drivers/gpio/gpio-bt8xx.c Vaibhav Gupta       2025-10-10  227  static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  228  {
2213c7a2cb81b2 drivers/gpio/gpio-bt8xx.c Vaibhav Gupta       2025-10-10  229  	struct pci_dev *pdev = to_pci_dev(dev);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  230  	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  231  
b9a557d05a7dde drivers/gpio/gpio-bt8xx.c Bartosz Golaszewski 2025-03-10  232  	scoped_guard(spinlock_irqsave, &bg->lock) {
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25 @233  		bg->saved_outen = bgread(BT848_GPIO_OUT_EN);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25 @234  		bg->saved_data = bgread(BT848_GPIO_DATA);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  235  
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  236  		bgwrite(0, BT848_INT_MASK);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  237  		bgwrite(~0x0, BT848_INT_STAT);
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  238  		bgwrite(0x0, BT848_GPIO_OUT_EN);
b9a557d05a7dde drivers/gpio/gpio-bt8xx.c Bartosz Golaszewski 2025-03-10  239  	}
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  240  
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  241  	return 0;
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  242  }
ff1d5c2f0268f4 drivers/gpio/bt8xxgpio.c  Michael Buesch      2008-07-25  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

