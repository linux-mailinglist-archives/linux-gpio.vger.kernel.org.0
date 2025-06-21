Return-Path: <linux-gpio+bounces-21949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4FAE2813
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 10:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7762216C2B8
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0F11A8F60;
	Sat, 21 Jun 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPeh0Weo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD0149C41
	for <linux-gpio@vger.kernel.org>; Sat, 21 Jun 2025 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750495777; cv=none; b=q8DS7RrZF5x+1WeXXKsSi2kvUx259/2ey6VK2EUt2avIY20GME7g7GJqMu9frl2BkvCMCoaYN0rBzK63ZhPMoHzUry8fAaiQ8vVdU8jUxF980rknTw5YgpU7hrgTtUs68yo/uNPkt4Q4gwX7uHyQMG3ndK/ZXkXZ4iVnyNz+e+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750495777; c=relaxed/simple;
	bh=cl/ohYECku5gejXSY5e5k+E4OoNlsyAEqyqj7ZlYb4A=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uMwGEynvQYxHVg7jKpfBcHnyK/y989dkFlSBKGWWEv3fv0kOavP6rJpYYOb2yAzAMajqyRp/ezc80HElKNn3ticlrz9Iu7PUOdQkDd6saIDocFvZ5XmUVezPTrAbi/z3M3QVHgqIn7MBKeiUP+1R+5Hid/Hk7QUtL0dBeDEIEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPeh0Weo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A9C4CEE7;
	Sat, 21 Jun 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750495775;
	bh=cl/ohYECku5gejXSY5e5k+E4OoNlsyAEqyqj7ZlYb4A=;
	h=Date:To:Cc:From:Subject:From;
	b=hPeh0WeoE13o3xbNDqVa0Sl2bo+5f1mS7ABcnf94mIjCIttuO0nWM8RGdl2bb189S
	 GNu9jYEIDuLwVUYG7+1tz7QabPA74dve1wL3AdYVXZJlLvWc0L6BJz8JRqWoFuVsZs
	 gFkHRZwEwN4yW2SiDTWdXu3OTXo+2xZflWej32C1L3LKx0wKnXLF6Y8YolQgwgN12q
	 73GlizttlqGzWihLwps6W7OFQT0baBYCMUUwHfO36gZKs7O2ahZ7h7vgVk4VwH5+57
	 eS8KmHuLVHbIlh/DCMkA3D37Aya4x27gHhqi4sOQifQ1lRVJl5cfEwjFGzJhN1DhTH
	 bQup9of0E2qKQ==
Message-ID: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
Date: Sat, 21 Jun 2025 10:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
From: Hans de Goede <hansg@kernel.org>
Subject: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

While debugging the following lockdep report:

=============================
 [ BUG: Invalid wait context ]
 ...
 swapper/10/0 is trying to lock:
 ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
  at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
 ...
 Call Trace:
 <IRQ>
 ...
 __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
 __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
 vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
 __handle_irq_event_percpu (kernel/irq/handle.c:158)
 handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
 handle_edge_irq (kernel/irq/chip.c:833)
 ...
 </IRQ>

I realized after a while that the root-cause here is the IRQF_NO_THREAD
usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
intel: Prevent force threading of the interrupt handler") to avoid problems
caused by using request_irq() for what should be a chained irq handler
(which itself is a workaround because of a shared IRQ on some platforms).

Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:

1. It introduces extra latency on PREEMPT-RT kernels
2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
   interrupts to use raw-spinlocks only since normal spinlocks can
   sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
   handlers will run in an atomic context

2. is what is causing the lockdep report above, by simply using a
wake_up(&wq_head) call in an interrupt handler, since wait-queues
use normal spinlocks not raw spinlocks.

I've tried just removing the IRQF_NO_THREAD flag and that fixes
the lockdep report. I've also tried reproducing the problem for
which the flag was added in commit 1a7d1cb81eb2 by using a kernel
with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
commandline. And the problem not reproduce. I'm not sure this is
100% proof that the flag is no longer necessary though ...

So 2 questions:

1. Should we maybe just drop the flag ?
2. Or should we have 2 different code-paths for GPIO controllers
with/without shared IRQs and use a chained-irq approach for the
not shared case, to at least reduce the usage of the flag ?

Regards,

Hans


p.s. For the 2 different code paths approach I believe we can
use intel_pinctrl_probe_by_uid() to identify platforms which use
a shared IRQ. AFAICT on all platforms which use
intel_pinctrl_probe_by_hid() there will only be a single GPIO
controller instance.




