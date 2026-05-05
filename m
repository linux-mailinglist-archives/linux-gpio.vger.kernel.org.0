Return-Path: <linux-gpio+bounces-36136-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB4gAOS7+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36136-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:44:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D414CA03F
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1530300ED8B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6FD21018A;
	Tue,  5 May 2026 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSIzHJD7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753B40DFB4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974239; cv=none; b=cXRbPET6dUdDexmdcf8jr38L9NYvYALZYwOCl1IFmkRfFoCq2wCDGzTZXoDeRBpRMwirwM5wK+SwePuLjEhp3Gedl/YbsRJLD3UW5CPzcBYqKyYRPHZkJr++3aitVen+FcI79I10bBb5MyzQGkRDbqLyRpjbySqEhoqhCwC0FDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974239; c=relaxed/simple;
	bh=QrRCmg6SuXumAsDxe7PAOZf5B2aVVOoXcQE4tRoRyKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ5g5fttWM8JRO8NlLKkXp2kgjUL+Rpn6ghO9/xtoE200xZCMfzd0HiILrBXK9MfwZVY53POKnSaJOL4L6iW1TDxnx2kr0P8sCjTfpcgq0hcxwaVFG1Cnyjtvi+v1FnnvzajrkWGL4Cfrxi0KdP9buVNt/psaWys1GEbtsa3hXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSIzHJD7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777974236; x=1809510236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QrRCmg6SuXumAsDxe7PAOZf5B2aVVOoXcQE4tRoRyKQ=;
  b=RSIzHJD7qmZFDe7vHO+ffpOn1ah17e3bP5dxsjkYl6IaWzi+stgnNZdB
   ltBN+pARIUlNAXnbbhRL8V202SP+eXWyrl9wpNicnWzuGQtZZE++JvP8g
   VcJiLX3nrDc+z/OUv0kxrNMGpN7b+BKmRLhEtBB4W8vdu+CQX0fNwQxX+
   t0xcRbTFfCdCl1qFYgLKAdSC2Q5jgiD6zIBZqJKEch/K0SqTdBYJean55
   drdMYb/s5Rp6JCo5bRwxsS2+dEkdDi3e1P8D8g/mlVjgvmKlOYvNSk0bf
   141C4Hi7gCHeb1jNNlneQj4vaS06k9blNMcF18c4cHFrIfP4DgufQYAYL
   A==;
X-CSE-ConnectionGUID: 10l6DkpQSiyKnQIoxR4rFw==
X-CSE-MsgGUID: QgtPWH/KTRCm46JkkKG42w==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101509581"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="101509581"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:43:29 -0700
X-CSE-ConnectionGUID: ChOAiKdYR72veR1sLmc1aA==
X-CSE-MsgGUID: Q48GGzMURcSbsvKpbFLO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="233107632"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:43:22 -0700
Date: Tue, 5 May 2026 12:43:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
Message-ID: <afm7t40WdlYopUKu@ashevche-desk.local>
References: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
 <20250623061517.GU2824380@black.fi.intel.com>
 <afm0GTghqnG6JuC0@ashevche-desk.local>
 <3df439b7-2c28-44f5-81ed-5d4747e7096f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df439b7-2c28-44f5-81ed-5d4747e7096f@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 77D414CA03F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36136-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]

On Tue, May 05, 2026 at 11:39:51AM +0200, Hans de Goede wrote:
> On 5-May-26 11:10, Andy Shevchenko wrote:
> > On Mon, Jun 23, 2025 at 09:15:17AM +0300, Mika Westerberg wrote:
> >> On Sat, Jun 21, 2025 at 10:49:33AM +0200, Hans de Goede wrote:
> > 
> >>> While debugging the following lockdep report:
> >>>
> >>> =============================
> >>>  [ BUG: Invalid wait context ]
> >>>  ...
> >>>  swapper/10/0 is trying to lock:
> >>>  ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
> >>>   at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
> >>>  ...
> >>>  Call Trace:
> >>>  <IRQ>
> >>>  ...
> >>>  __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
> >>>  __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
> >>>  vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
> >>>  __handle_irq_event_percpu (kernel/irq/handle.c:158)
> >>>  handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
> >>>  handle_edge_irq (kernel/irq/chip.c:833)
> >>>  ...
> >>>  </IRQ>
> >>>
> >>> I realized after a while that the root-cause here is the IRQF_NO_THREAD
> >>> usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
> >>> intel: Prevent force threading of the interrupt handler") to avoid problems
> >>> caused by using request_irq() for what should be a chained irq handler
> >>> (which itself is a workaround because of a shared IRQ on some platforms).
> >>>
> >>> Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:
> >>>
> >>> 1. It introduces extra latency on PREEMPT-RT kernels
> >>> 2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
> >>>    interrupts to use raw-spinlocks only since normal spinlocks can
> >>>    sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
> >>>    handlers will run in an atomic context
> >>>
> >>> 2. is what is causing the lockdep report above, by simply using a
> >>> wake_up(&wq_head) call in an interrupt handler, since wait-queues
> >>> use normal spinlocks not raw spinlocks.
> >>>
> >>> I've tried just removing the IRQF_NO_THREAD flag and that fixes
> >>> the lockdep report. I've also tried reproducing the problem for
> >>> which the flag was added in commit 1a7d1cb81eb2 by using a kernel
> >>> with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
> >>> commandline. And the problem not reproduce. I'm not sure this is
> >>> 100% proof that the flag is no longer necessary though ...
> >>
> >> Can you try also with CONFIG_PREEMPT_RT and see if that triggers the issue?
> >> If not then:
> >>
> >>> So 2 questions:
> >>>
> >>> 1. Should we maybe just drop the flag ?
> >>> 2. Or should we have 2 different code-paths for GPIO controllers
> >>> with/without shared IRQs and use a chained-irq approach for the
> >>> not shared case, to at least reduce the usage of the flag ?
> >>
> >> I would just drop the flag then.
> > 
> > Hans, any conclusion on this?
> 
> I worked around this issue in the affected driver.

Is it upstream? Can you share the commit ID or patch in ML (if it's ready)
for that? (Just for the record.)

> I have not looked
> further into actually dropping IRQF_NO_THREAD from the Intel pinctrl/
> GPIO drivers.
> 
> I do think that dropping IRQF_NO_THREAD from the Intel pinctrl/GPIO
> drivers is probably a good idea, but this will need someone to drive
> this forward including dealing with any regressions this may lead to.

Thanks for clarifying the state of affairs!

-- 
With Best Regards,
Andy Shevchenko



