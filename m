Return-Path: <linux-gpio+bounces-36114-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFq9I+O2+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36114-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:22:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E784C987C
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ED473070D3F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932D43F2107;
	Tue,  5 May 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGySdeW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9173D9041
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972255; cv=none; b=ojyvSmrwebKBAQ1NGHVPJdMUDvNXeeZuzw2FeV4/idqV2+cs3Q8cm7YEA1X1EaCjWyYIOHOIZILzEVHug0Y42R6GojmJuNQH9JvtQnt5Nm5ofL1pnmC83VupzjdkzgChnf93C+cP4V9s7zJBZEHzyGBTv3hNNop+5QBX6IRhov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972255; c=relaxed/simple;
	bh=vw6e0fJs8HY9YWHWgQBbBWGHH0G+obdWy9mwfQvTHck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZOpAAq1xH5S6FVjG0flnMhW56PhHHsmqmB7Clb5ofCefDicOKR98x7FuF7VI6JRiglHW4/U03EwjunJqHa5DnPbjQ9itcyTMn/jDuDOvHE6hI+uqUA/ny39e2KPwRhkyq6AsmWvevnEkw6FdxpDfP89k+DR+NN4UM2mIFUOiB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGySdeW6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777972253; x=1809508253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vw6e0fJs8HY9YWHWgQBbBWGHH0G+obdWy9mwfQvTHck=;
  b=EGySdeW6s8PwtXVZ1NRWLreFgFW9Z274yQ0yURi5653G3B7KZQnc4HpG
   4U9mvj2W5rhEkHZyNrJBtCU2f4Z1QzogVD2XZ0XDH/Zps6OuR/rT6vvF2
   0uI+xRRHJKToFgIE5NMSo+KMoCDx+LBWpJvVdtr3vhMI2Tt56UjbsBaO7
   C8KYXkGfy9jsWZoWlv1USEQWILpoIo/AiLgC4rFCEsa682QjeH6UFJSym
   0iAQuNGa1X6mGzQfW+iZC7F24HSlxjhHuBuwZ+hxjsSia90jqx5G3CqkJ
   VVbITvDhqz1LDLnxm4fghvzKYmf/LeMEu767036jpvAl0PYorrPVzW7j8
   Q==;
X-CSE-ConnectionGUID: vBml4rv4SROEukiyB/sMnw==
X-CSE-MsgGUID: cTwtV9zYRWW5l00XkIvkiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89430204"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="89430204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:10:53 -0700
X-CSE-ConnectionGUID: Z5k8Hiw5S1KErWy2fiPfkw==
X-CSE-MsgGUID: 97tRo8xsSbad5PqzhSmbdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259110866"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:10:51 -0700
Date: Tue, 5 May 2026 12:10:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
Message-ID: <afm0GTghqnG6JuC0@ashevche-desk.local>
References: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
 <20250623061517.GU2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623061517.GU2824380@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 91E784C987C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36114-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]

On Mon, Jun 23, 2025 at 09:15:17AM +0300, Mika Westerberg wrote:
> On Sat, Jun 21, 2025 at 10:49:33AM +0200, Hans de Goede wrote:

> > While debugging the following lockdep report:
> > 
> > =============================
> >  [ BUG: Invalid wait context ]
> >  ...
> >  swapper/10/0 is trying to lock:
> >  ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
> >   at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
> >  ...
> >  Call Trace:
> >  <IRQ>
> >  ...
> >  __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
> >  __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
> >  vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
> >  __handle_irq_event_percpu (kernel/irq/handle.c:158)
> >  handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
> >  handle_edge_irq (kernel/irq/chip.c:833)
> >  ...
> >  </IRQ>
> > 
> > I realized after a while that the root-cause here is the IRQF_NO_THREAD
> > usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
> > intel: Prevent force threading of the interrupt handler") to avoid problems
> > caused by using request_irq() for what should be a chained irq handler
> > (which itself is a workaround because of a shared IRQ on some platforms).
> > 
> > Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:
> > 
> > 1. It introduces extra latency on PREEMPT-RT kernels
> > 2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
> >    interrupts to use raw-spinlocks only since normal spinlocks can
> >    sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
> >    handlers will run in an atomic context
> > 
> > 2. is what is causing the lockdep report above, by simply using a
> > wake_up(&wq_head) call in an interrupt handler, since wait-queues
> > use normal spinlocks not raw spinlocks.
> > 
> > I've tried just removing the IRQF_NO_THREAD flag and that fixes
> > the lockdep report. I've also tried reproducing the problem for
> > which the flag was added in commit 1a7d1cb81eb2 by using a kernel
> > with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
> > commandline. And the problem not reproduce. I'm not sure this is
> > 100% proof that the flag is no longer necessary though ...
> 
> Can you try also with CONFIG_PREEMPT_RT and see if that triggers the issue?
> If not then:
> 
> > So 2 questions:
> > 
> > 1. Should we maybe just drop the flag ?
> > 2. Or should we have 2 different code-paths for GPIO controllers
> > with/without shared IRQs and use a chained-irq approach for the
> > not shared case, to at least reduce the usage of the flag ?
> 
> I would just drop the flag then.

Hans, any conclusion on this?

-- 
With Best Regards,
Andy Shevchenko



