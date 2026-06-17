Return-Path: <linux-gpio+bounces-38642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdD7OYfFMmo75QUAu9opvQ
	(envelope-from <linux-gpio+bounces-38642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:04:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CA69B39A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="nZGg/F1A";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38642-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38642-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E8C1309E0CD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 15:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE47E495529;
	Wed, 17 Jun 2026 15:57:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EB48BD4A;
	Wed, 17 Jun 2026 15:57:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711856; cv=none; b=qYWxATkPviVjpIA4qzAFexG+uzF8g2GrbkMmNM7nRc0myjwL39+/ULdhy9hRicbZ1oj5RRg4j2UN9ejZAVmORUbzJfTR59NvvwTKiLpUsBIQ19SpjeWi5dXq4qzBO8cm4A0Ft3qu7/GUxWF2SAGHztZ4MYNzi1LpthDEjZfAZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711856; c=relaxed/simple;
	bh=mG+UF61LIWuVs7ffrhGbTRgerWizgP2NZwIcPmWs6xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN7EpF4hSI2keGBDqQPu0Fgm6c1Q63eNL0GiHHKPrXLcofO/91SMne/Pbzmfr0+XkCLFb3WMf0obEyW6EboG084lWVLCxs40Eytu4B2Q5eZECQIXK5Cd2iiUUSiKIBlEEqAQ3rWwzZoynKIQCbXCzLsMryZeqjngMl3lQTUCjhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZGg/F1A; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781711845; x=1813247845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mG+UF61LIWuVs7ffrhGbTRgerWizgP2NZwIcPmWs6xU=;
  b=nZGg/F1ARkMGZV9zSiOHYBNT2/eWRsa33RzEmoiTNd6hs3emRj2POoPU
   jFz4DIE9Ojv0Ecweq1XV+4aGle+Qd1f3sGyNPtAjh3jorVnC2w3HoZqYv
   JmE+A8am9txLbaA5VHh3TJ12AcpHEeyzoRJPQ/zxRSQdudGb2NGtliOvX
   CEvhHU+BmNvA5PNxP+SLXquU+6jwhjTuQIXlDhKftNsmQhqxEYz3HyCEX
   f1xzzjPbSPtgiuYNF2kSC3BQBfjkMBhUh78O9WR4mjWQ9lV/t7q5wOB/a
   jK9Q6ENYeaj5zehaLZXjxSKjrRPVVmaNsW7iY+v9a/AQbQm6RpBwvy1ez
   A==;
X-CSE-ConnectionGUID: YMGGlSQoR6K/77Uk6KyVqw==
X-CSE-MsgGUID: p2qD1Wk4Spm3qhbrLQWHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82411267"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82411267"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 08:57:24 -0700
X-CSE-ConnectionGUID: AETn2Kz3R5ybU2o4gXxAjA==
X-CSE-MsgGUID: W/MJ9UHnSHiTdMkc5dX+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="248160197"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.69])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 08:57:20 -0700
Date: Wed, 17 Jun 2026 18:57:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: sch: use raw_spinlock_t in the irq startup path
Message-ID: <ajLD3p-IH3U-UsG_@ashevche-desk.local>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38642-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,linux.alibaba.com,linutronix.de,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D04CA69B39A

On Wed, Jun 17, 2026 at 11:40:34PM +0800, Runyu Xiao wrote:
> sch_irq_unmask() enables the GPIO IRQ and then updates the controller
> state through sch_irq_mask_unmask(), which takes sch->lock with
> spin_lock_irqsave().  The callback can be reached from irq_startup()
> while setting up a requested IRQ.  That path is not sleepable, but on
> PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
> 
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
> 
> The grounded PoC kept the request_threaded_irq() -> __setup_irq() ->
> irq_startup() -> sch_irq_unmask() -> sch_irq_mask_unmask() carrier and
> used the original spin_lock_irqsave(&sch->lock) edge.  Lockdep reported:
> 
>   BUG: sleeping function called from invalid context
>   hardirqs last disabled at ... __setup_irq.constprop.0 ... [vuln_msv]
>   sch_rt_spin_lock_irqsave+0x1c/0x30 [vuln_msv]
>   sch_irq_mask_unmask.constprop.0+0x31/0x70 [vuln_msv]
>   __setup_irq.constprop.0+0xd/0x30 [vuln_msv]
> 
> Convert the SCH controller lock to raw_spinlock_t.  The same lock is
> also used by the GPIO direction and value callbacks, but those critical
> sections only update MMIO-backed GPIO registers and do not contain
> sleepable operations.  Keeping this register lock non-sleeping is
> therefore appropriate for the irqchip callbacks and does not change the
> GPIO-side locking contract.

Okay, no objection.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Bart, you can take it to your branch directly in case it's not too late
for getting into v7.2-rc1, otherwise I can take via my branch and then PR
somewhere near -rc2.

-- 
With Best Regards,
Andy Shevchenko



