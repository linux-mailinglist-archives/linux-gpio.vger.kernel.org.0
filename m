Return-Path: <linux-gpio+bounces-36666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG4bMEwLA2pmzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:13:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F281551F241
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4593026771
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3151C383998;
	Tue, 12 May 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZ29DWjz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903BC368D43
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584238; cv=none; b=Q/BVw2gL56Q0SvP4YrWnzIJXOKzIQ5q63icER/pagPyCfLRJOvneH/nzvul6UbLH3YIFNdJvBkZyJlIWiN544FKRsz4wDvhVhiUBqHNrOdEGMKjv36pVb1nMydKAytpFvCrgeUwP695pj76W+2zR2gbCH177lmCp25t4QzGaMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584238; c=relaxed/simple;
	bh=hGE9/7VIiKpqMd1gLfnf/oK3ekKDHSFpRFVHfHnWCvo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJG/uv/Bqp6+Ts2+igXuBmJe/8fUmNVXAwm+u9zE0NqeYwG1vcjZiiNVmY4djpC5KWys3/i0/GHtpb+iHA0tHTX6ZGwLW4f0Ne/XTF3FOwYxJoq6rd15QKkhXe/Sa2IPv/Dk5gsOr1UzQdtlO2Or6RRwvXFoPX3vtPDP8lpq0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZ29DWjz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778584236; x=1810120236;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=hGE9/7VIiKpqMd1gLfnf/oK3ekKDHSFpRFVHfHnWCvo=;
  b=RZ29DWjz7v/2jBUPTpQWDr40hTlZCIrfpFFKiA2RCzBpgJjSLci/zcix
   l8fLNJsryNUExyXxBwQPTkBE9ALKkpagMQwCd3tR8JLdRHnXgshDfKyWG
   zlwNCdQA7AecSrYZBgmwM1d9ZaR1WDTlRl2xkHT43piIFyfD8lBibJvje
   GmKacCD74UWJ2Yp00rQG6e2ckWlsbEXlDpKZm+ivHGiZ3tjOKmu1x4SIo
   pN29oXeNUbOYlEg+YJCi7eA/BBQM8wXrASht56tJpdmemQsf1k+PnUNI2
   FXffSQ76dImLYF1qeHHI4aUCruvJ5JmSYM8jNCWs+wpQwdgbG8nLnOq4j
   g==;
X-CSE-ConnectionGUID: +6CmE3ZHT+Wy8u3FZpWFQA==
X-CSE-MsgGUID: grSFxY27Tn6ziGlUo6NgTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79473603"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79473603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:10:36 -0700
X-CSE-ConnectionGUID: lH9hOFyuQgioN0DPEDdi6Q==
X-CSE-MsgGUID: hrdxVba3Rf+MdzbgBGPyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242734861"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2026 04:10:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMl0S-0000000021z-32k3;
	Tue, 12 May 2026 11:10:32 +0000
Date: Tue, 12 May 2026 19:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
Message-ID: <202605121826.ZJeoP3Ek-lkp@intel.com>
References: <20260509003327.955942-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509003327.955942-1-rosenp@gmail.com>
X-Rspamd-Queue-Id: F281551F241
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36666-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/gpio-sodaville-allow-COMPILE_TEST-builds/20260512-125042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260509003327.955942-1-rosenp%40gmail.com
patch subject: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605121826.ZJeoP3Ek-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121826.ZJeoP3Ek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121826.ZJeoP3Ek-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-sodaville.c:253:1: warning: data definition has no type or storage class
     253 | builtin_pci_driver(sdv_gpio_driver);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sodaville.c:253:1: error: type defaults to 'int' in declaration of 'builtin_pci_driver' [-Wimplicit-int]
>> drivers/gpio/gpio-sodaville.c:253:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   drivers/gpio/gpio-sodaville.c:245:26: warning: 'sdv_gpio_driver' defined but not used [-Wunused-variable]
     245 | static struct pci_driver sdv_gpio_driver = {
         |                          ^~~~~~~~~~~~~~~


vim +253 drivers/gpio/gpio-sodaville.c

b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  244  
b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  245  static struct pci_driver sdv_gpio_driver = {
6a5ead91d45d091 Paul Gortmaker            2016-05-09  246  	.driver = {
6a5ead91d45d091 Paul Gortmaker            2016-05-09  247  		.suppress_bind_attrs = true,
6a5ead91d45d091 Paul Gortmaker            2016-05-09  248  	},
b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  249  	.name = DRV_NAME,
b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  250  	.id_table = sdv_gpio_pci_ids,
b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  251  	.probe = sdv_gpio_probe,
b43ab901d671e3e Sebastian Andrzej Siewior 2011-06-27  252  };
6a5ead91d45d091 Paul Gortmaker            2016-05-09 @253  builtin_pci_driver(sdv_gpio_driver);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

