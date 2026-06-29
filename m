Return-Path: <linux-gpio+bounces-39102-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QUmpJdNFQmq73QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39102-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:15:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD796D8C54
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ZeKYU0v5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39102-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39102-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FF993000893
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEE23FBEAC;
	Mon, 29 Jun 2026 10:05:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FC3FAE19;
	Mon, 29 Jun 2026 10:05:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727539; cv=none; b=JVvJhK2yZXsdzPdtBps44RTfAoCTDGfmFgJnHRg1VE8LaYycV514LkqPSbtmYugDBDoNQY0NlMsawceV80cNHcibkl3KI/SQvPdC83ECJe3d4jwrgQJhKF7AMm2iTd82J2ZK4z+Qj5LbNvS4xSCK9/kog9jVextUV/dfr4Bu2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727539; c=relaxed/simple;
	bh=tIiREu5pXy/nUQ9dOW6a3+enIzKKULeLd6hiLgFvlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Bau9S121HyfK1pkjiR65hfdnhob8/lmqdEC47/HLrOvaKKwirxUE7drdLZZ2+r9pxVYqKHQolh/39N5i+92ztA4FT+eEGATYSaPZUiS8SBYCjjpTQ6GJF9QM65zvTc1NHjnDIpgmkZnTbIMncT681QVTpQK13QUGprb+tozU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeKYU0v5; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782727537; x=1814263537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIiREu5pXy/nUQ9dOW6a3+enIzKKULeLd6hiLgFvlUc=;
  b=ZeKYU0v5EBppIkx4mP5GOC1EI2Gp9xEqjkkCKbP0cgiBgZ3ig4GFj67M
   /E0mo1q1vjvcpz+R6vvfy0fAY3lyTb+riT6NTK7mYwyOpQdRurW/MBRRF
   domdGC3sk2Vhy4D7/gNHdQtI/0/tQQfqlBOW2Cf2B2Tj9nQJCWgbkcfdN
   1bgKktBJ++QY+4KOSYeAI6Sc6cv+CCvtfW58F0A1EWsnZvDwAJMg8tK9f
   7+Obazs7Nl+cTOTlUy4INhfWdEx2BoOI4bBeMn4330DHUqQ+BTJSE0/fc
   SeVjzkon6J8aKw5lyj9L9BkzsCR5nozEJh/LkzHhs97oYevXv84zuF+XG
   A==;
X-CSE-ConnectionGUID: v8YNKf/PQDmwat311Pjkbg==
X-CSE-MsgGUID: cLfEU/dEQkSiIQ8g9AcTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82406331"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="82406331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:05:36 -0700
X-CSE-ConnectionGUID: Ntom/HqKR5qqEM1xpEtHrA==
X-CSE-MsgGUID: j8RxipM4ToakveL+yLuIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255509012"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Jun 2026 03:05:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we8rr-000000007Gz-065t;
	Mon, 29 Jun 2026 10:05:31 +0000
Date: Mon, 29 Jun 2026 18:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH] gpio: dwapb: Defer clock gating until noirq
Message-ID: <202606291736.mAgOeA65-lkp@intel.com>
References: <20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39102-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+wangjia.ultrarisc.com@kernel.org,m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:brgl@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:devnull@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,wangjia.ultrarisc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,01.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CD796D8C54

Hi Jia,

kernel test robot noticed the following build errors:

[auto build test ERROR on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Wang-via-B4-Relay/gpio-dwapb-Defer-clock-gating-until-noirq/20260629-135404
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260629-gpio-dwapb-wakeup-v1-1-3394f02317da%40ultrarisc.com
patch subject: [PATCH] gpio: dwapb: Defer clock gating until noirq
config: sparc64-randconfig-001-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291736.mAgOeA65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291736.mAgOeA65-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-dwapb.c: In function 'dwapb_irq_set_wake':
>> drivers/gpio/gpio-dwapb.c:377:7: error: 'struct irq_data' has no member named 'parent_data'
     if (d->parent_data && !!ctx->wake_en != !!wake_en) {
          ^~
>> drivers/gpio/gpio-dwapb.c:378:9: error: implicit declaration of function 'irq_chip_set_wake_parent'; did you mean 'irq_set_parent'? [-Werror=implicit-function-declaration]
      err = irq_chip_set_wake_parent(d, enable);
            ^~~~~~~~~~~~~~~~~~~~~~~~
            irq_set_parent
   cc1: some warnings being treated as errors


vim +377 drivers/gpio/gpio-dwapb.c

   362	
   363	static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
   364	{
   365		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
   366		struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
   367		struct dwapb_context *ctx = gpio->ports[0].ctx;
   368		irq_hw_number_t bit = irqd_to_hwirq(d);
   369		u32 wake_en = ctx->wake_en;
   370		int err;
   371	
   372		if (enable)
   373			wake_en |= BIT(bit);
   374		else
   375			wake_en &= ~BIT(bit);
   376	
 > 377		if (d->parent_data && !!ctx->wake_en != !!wake_en) {
 > 378			err = irq_chip_set_wake_parent(d, enable);
   379			if (err)
   380				return err;
   381		}
   382	
   383		ctx->wake_en = wake_en;
   384	
   385		return 0;
   386	}
   387	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

