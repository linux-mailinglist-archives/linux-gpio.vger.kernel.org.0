Return-Path: <linux-gpio+bounces-21974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F65AE3587
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94B143A46F5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 06:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6302C1D2F42;
	Mon, 23 Jun 2025 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmBVQn/L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2541DC9BB
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659323; cv=none; b=Wm+d5mRLRQ23VuV22tPYbb5JJlqHtd3yYsacecggO2NWxqpIRLy4DHEyRvc+n5NlR4KmPWrel69SoXfm4hmG0Oq9TPzr89ESyFsuyV5qXGHA7IOkAJ5sBLIrL1B57M5DZsCt70xM6ImIeHbHEVULKp31DhDckPE0a4uDRmjw8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659323; c=relaxed/simple;
	bh=8dExokAvCBdhQOYv7n+ZVSUPc/CVbCGAYKdL9PCwj30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp7X7L4TE1taEiW0RcFppXcTduaFULxJPXEmHOJ5bNL8seWpqoMU6UnDw5akgBd3BZBMRfzclRchOSNszHr+aTNAqecmHd6Q1YGtMQC7Aic6Ml4zW0aFRt357IACVcHO0vU1qDUO6QEkU83/TtmiuTbD8vnUzedSkX7zUCWO2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmBVQn/L; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750659322; x=1782195322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8dExokAvCBdhQOYv7n+ZVSUPc/CVbCGAYKdL9PCwj30=;
  b=VmBVQn/LbP001mTyrBpZWv793cYoMl/oyt2wXXAmfObokWspwb0hTVwB
   cmn2I+Jn8XbNO4eOJKcBUXlw04nSP2JjSB5MTas0qb/dw23TQAsZ2ASbS
   kA/Qj9cIvRigI8br/wGmo7s12dtqw1FXau2lFt/kaiwPViEqhNM5uvtv6
   vVmZfC9zJangl6WN4KoRCijaLi2zppX6IXkCr4DBJLCRiquan7h9+6vIO
   2DYtjjCTmp5e0h55z/Kb2CNzvKUUAo9SHGaBUKSe7HqbJCLpAFJf0RrpX
   3uRX+JR+45i3MOEB5OVfeDwcUiSsCVeJSWk6ywM3V5+cL3vL6dha3OiqB
   A==;
X-CSE-ConnectionGUID: +dLsgKVTQM+Y3qe/VT6W7g==
X-CSE-MsgGUID: Kv5umd09QHuPU8Upy7CVaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="78262916"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="78262916"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:15:21 -0700
X-CSE-ConnectionGUID: OIR39lX+QVO7NSw55CS1Xg==
X-CSE-MsgGUID: VJoO+cCiS02/7/tFVypbQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151647055"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2025 23:15:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2F3F8224; Mon, 23 Jun 2025 09:15:17 +0300 (EEST)
Date: Mon, 23 Jun 2025 09:15:17 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
Message-ID: <20250623061517.GU2824380@black.fi.intel.com>
References: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>

Hi,

On Sat, Jun 21, 2025 at 10:49:33AM +0200, Hans de Goede wrote:
> Hi,
> 
> While debugging the following lockdep report:
> 
> =============================
>  [ BUG: Invalid wait context ]
>  ...
>  swapper/10/0 is trying to lock:
>  ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
>   at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>  ...
>  Call Trace:
>  <IRQ>
>  ...
>  __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
>  __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>  vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
>  __handle_irq_event_percpu (kernel/irq/handle.c:158)
>  handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
>  handle_edge_irq (kernel/irq/chip.c:833)
>  ...
>  </IRQ>
> 
> I realized after a while that the root-cause here is the IRQF_NO_THREAD
> usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
> intel: Prevent force threading of the interrupt handler") to avoid problems
> caused by using request_irq() for what should be a chained irq handler
> (which itself is a workaround because of a shared IRQ on some platforms).
> 
> Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:
> 
> 1. It introduces extra latency on PREEMPT-RT kernels
> 2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
>    interrupts to use raw-spinlocks only since normal spinlocks can
>    sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
>    handlers will run in an atomic context
> 
> 2. is what is causing the lockdep report above, by simply using a
> wake_up(&wq_head) call in an interrupt handler, since wait-queues
> use normal spinlocks not raw spinlocks.
> 
> I've tried just removing the IRQF_NO_THREAD flag and that fixes
> the lockdep report. I've also tried reproducing the problem for
> which the flag was added in commit 1a7d1cb81eb2 by using a kernel
> with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
> commandline. And the problem not reproduce. I'm not sure this is
> 100% proof that the flag is no longer necessary though ...

Can you try also with CONFIG_PREEMPT_RT and see if that triggers the issue?
If not then:

> So 2 questions:
> 
> 1. Should we maybe just drop the flag ?
> 2. Or should we have 2 different code-paths for GPIO controllers
> with/without shared IRQs and use a chained-irq approach for the
> not shared case, to at least reduce the usage of the flag ?

I would just drop the flag then.

