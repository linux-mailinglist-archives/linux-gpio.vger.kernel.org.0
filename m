Return-Path: <linux-gpio+bounces-33678-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMt2FovcuWlHOgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33678-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 23:58:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67F72B3535
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 23:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61D62309B08F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 22:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F295C3B4EA4;
	Tue, 17 Mar 2026 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExHki4zl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABA3A7F47
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787974; cv=none; b=gDTafzukqTD+SMcHzIYnQNV8yJZthPVXjyZCEfVIQEeEC3l6Pr6T2hL/Ee/h8vU48WDKkwe2cplfWFZLcPrteyFejQjpvVAAoL1Z+VCbNxH3scgNSUho0jJSi4PJpmIUFmhPwlyCuoJuhKAlp/2fZgNAc7nSCMlmyRRvTADmaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787974; c=relaxed/simple;
	bh=90y8N2wsqf8T2qk4q2gXoV2ouFVDYXDB1GvOAIs9jDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uFECZxHQXnrflZLBvvxFu6QvXiakpFQ6wi2nR6IeBcMV8yEgC+p1oXK+9v9nFX0RCoE7WFZSVF4uNhBG7j4AkWQuUCMHqXVGEGWnuhYlRD1Snx07tGxt3xgHDk43b/DYhExlMvYHZNrGyKkFrFJ9ZvklKy66NBbFu4NcZXGOKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExHki4zl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773787973; x=1805323973;
  h=date:from:to:cc:subject:message-id;
  bh=90y8N2wsqf8T2qk4q2gXoV2ouFVDYXDB1GvOAIs9jDY=;
  b=ExHki4zlt91C2No3oCE495syMjPadojMydF4w9jyq8Cn1Vls18YR2EWa
   K0UEKXnND8oUVVrDqvTzCRL7vglWUeklPdKC/LBR7nv/RJI0Y6RrWe/vq
   f+sOJRRbqIheONcLRUtaJphWzFwBuoISRlyoXHY0hdMbAsoKlh5rK7W9u
   bEj1f3f+2GtFS97qvAY5vqqM8GUjjE7S3fnw4IyKPVwPeslQ5prxhw8m8
   a3xF05vWcV8hzyOIxqqMoVlwzdooyonUfCl5GyG/9e7chcX5RQoYDokJp
   Y+se79aOS34aMShNZZ4mbQfxqwtUgln93/Nq4ka7q5R6H3yxVfcy4vSOH
   A==;
X-CSE-ConnectionGUID: /WLwfWCZT6uNK47WlItXJA==
X-CSE-MsgGUID: XRVhUYixR3212pwZ8x5dQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92218331"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92218331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:52:53 -0700
X-CSE-ConnectionGUID: hfEH69HuR2un55TML+R5LA==
X-CSE-MsgGUID: ZSHrtwqnSkyvFbsWDRQ75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227093509"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 15:52:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2dHM-0000000028f-2SWW;
	Tue, 17 Mar 2026 22:52:48 +0000
Date: Wed, 18 Mar 2026 06:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linusw-gpio:b4/descriptors-wireless 2/2]
 drivers/gpio/gpio-ath79.c:264:1: warning: non-void function does not return a
 value
Message-ID: <202603180646.GLjbhfKi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33678-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: B67F72B3535
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
head:   f498eb811e7dd7b968743a9bba20710a5070c0be
commit: f498eb811e7dd7b968743a9bba20710a5070c0be [2/2] wifi: ath9k: Obtain system GPIOS from descriptors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180646.GLjbhfKi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180646.GLjbhfKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180646.GLjbhfKi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-ath79.c:264:1: warning: non-void function does not return a value [-Wreturn-type]
     264 | }
         | ^
   1 warning generated.


vim +264 drivers/gpio/gpio-ath79.c

   217	
   218	#if IS_ENABLED(CONFIG_ATH9K_AHB)
   219	/*
   220	 * This registers all of the ath79k GPIOs as descriptors to be picked
   221	 * directly from the ATH79K wifi driver if the two are jitted together
   222	 * in the same SoC.
   223	 */
   224	#define ATH79K_WIFI_DESCS 32
   225	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   226							const char *label)
   227	{
   228		struct gpiod_lookup_table *lookup;
   229		int i;
   230	
   231		/* Create a gpiod lookup using gpiochip-local offsets + 1 for NULL */
   232		lookup = devm_kzalloc(dev,
   233				      struct_size(lookup, table, ATH79K_WIFI_DESCS + 1),
   234				      GFP_KERNEL);
   235		if (!lookup)
   236			return -ENOMEM;
   237	
   238		/*
   239		 * Ugly system-wide lookup for the NULL device: we know this
   240		 * is already NULL but explicitly assign it here for people to
   241		 * know what is going on. (Yes this is an ugly legacy hack, live
   242		 * with it.)
   243		 */
   244		lookup->dev_id = NULL;
   245	
   246		for (i = 0; i < ATH79K_WIFI_DESCS; i++) {
   247			lookup->table[i] =
   248				/*
   249				 * Set the HW offset on the chip and the lookup
   250				 * index to the same value, so looking up index 0
   251				 * will get HW offset 0, index 1 HW offset 1 etc.
   252				 */
   253				GPIO_LOOKUP_IDX(label, i, "ath9k", i, GPIO_ACTIVE_HIGH);
   254		}
   255	
   256		gpiod_add_lookup_table(lookup);
   257	
   258		return 0;
   259	}
   260	#else
   261	static int ath79_gpio_register_wifi_descriptors(struct device *dev,
   262							const char *label)
   263	{
 > 264	}
   265	#endif
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

