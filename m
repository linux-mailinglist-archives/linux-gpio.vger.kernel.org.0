Return-Path: <linux-gpio+bounces-36129-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BemEqS7+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36129-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:43:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D21034C9FEA
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E109A306B35A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D7721018A;
	Tue,  5 May 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbDD/Pwh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E493346A5
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973994; cv=none; b=uEkdOEdf3C2e4nxAhTXuFOwqG/rLzocYaguZewt2oeRIdGcr6WAxt5nTDvKaX+x4KfT8ESF7EcdToEYJtr159aREErecQCu0623Q6GOhTjVLTEgcJmeYRnIDEZk3ZYI2YVBKMfjI8KhBd8MwOZh51bE4xN8AZuIaCA5jAfW0DO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973994; c=relaxed/simple;
	bh=pXWil8ibvG15Q8+3JxUm9O4lJcLqf9F/Aer9XZ+zJX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHDOabFA1WWuUikaPiwGCw8gMjayutLZ/fFfN74g3+4ONiIY4D4e9z5v2nS5KkS9bYRZVZyavn2KyQugxxW84g967iaJF3+khdrdb8M24OGGVT/NAAyINVdgoJupzfnJfyWD3bTfa742W79vcK9gseIdWs0be6lKfh/w1u/lYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbDD/Pwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C53BC2BCB4;
	Tue,  5 May 2026 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973994;
	bh=pXWil8ibvG15Q8+3JxUm9O4lJcLqf9F/Aer9XZ+zJX0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mbDD/PwhHZvBbiXqvrZ829g7Zr0GlAam2Cbodb21mf0/2oO39lrnHVPdhYYYUxR7+
	 0lcxgYNt/PFSQlS8XlS8KkJpQq9QSP4rw2MDFXpPaRS+zoiAP0U8CRSYp+55qw8kYs
	 A2R9x3Zo5frHpeErQ9fJ/Rs7aqXc21MG45N4+QXu/F3EOEs6x1O+jvnboJfh7VgycL
	 y03c6y41I4Bhg2FPhep+VPOuyDsY3X1U6W9W4qDPnj1lqC0z8NeEryUjPHfPqnp8c5
	 EbSMnEa5H+PfPWs8WEYY+NQrobukbVsX2G3VzHPRcobkbeVwddlsKDfwR1BFEGeAL7
	 LFaZhyN5B5Zyg==
Message-ID: <3df439b7-2c28-44f5-81ed-5d4747e7096f@kernel.org>
Date: Tue, 5 May 2026 11:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
 <20250623061517.GU2824380@black.fi.intel.com>
 <afm0GTghqnG6JuC0@ashevche-desk.local>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <afm0GTghqnG6JuC0@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D21034C9FEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36129-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Andy,

On 5-May-26 11:10, Andy Shevchenko wrote:
> On Mon, Jun 23, 2025 at 09:15:17AM +0300, Mika Westerberg wrote:
>> On Sat, Jun 21, 2025 at 10:49:33AM +0200, Hans de Goede wrote:
> 
>>> While debugging the following lockdep report:
>>>
>>> =============================
>>>  [ BUG: Invalid wait context ]
>>>  ...
>>>  swapper/10/0 is trying to lock:
>>>  ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
>>>   at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>>>  ...
>>>  Call Trace:
>>>  <IRQ>
>>>  ...
>>>  __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
>>>  __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>>>  vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
>>>  __handle_irq_event_percpu (kernel/irq/handle.c:158)
>>>  handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
>>>  handle_edge_irq (kernel/irq/chip.c:833)
>>>  ...
>>>  </IRQ>
>>>
>>> I realized after a while that the root-cause here is the IRQF_NO_THREAD
>>> usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
>>> intel: Prevent force threading of the interrupt handler") to avoid problems
>>> caused by using request_irq() for what should be a chained irq handler
>>> (which itself is a workaround because of a shared IRQ on some platforms).
>>>
>>> Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:
>>>
>>> 1. It introduces extra latency on PREEMPT-RT kernels
>>> 2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
>>>    interrupts to use raw-spinlocks only since normal spinlocks can
>>>    sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
>>>    handlers will run in an atomic context
>>>
>>> 2. is what is causing the lockdep report above, by simply using a
>>> wake_up(&wq_head) call in an interrupt handler, since wait-queues
>>> use normal spinlocks not raw spinlocks.
>>>
>>> I've tried just removing the IRQF_NO_THREAD flag and that fixes
>>> the lockdep report. I've also tried reproducing the problem for
>>> which the flag was added in commit 1a7d1cb81eb2 by using a kernel
>>> with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
>>> commandline. And the problem not reproduce. I'm not sure this is
>>> 100% proof that the flag is no longer necessary though ...
>>
>> Can you try also with CONFIG_PREEMPT_RT and see if that triggers the issue?
>> If not then:
>>
>>> So 2 questions:
>>>
>>> 1. Should we maybe just drop the flag ?
>>> 2. Or should we have 2 different code-paths for GPIO controllers
>>> with/without shared IRQs and use a chained-irq approach for the
>>> not shared case, to at least reduce the usage of the flag ?
>>
>> I would just drop the flag then.
> 
> Hans, any conclusion on this?

I worked around this issue in the affected driver. I have not looked
further into actually dropping IRQF_NO_THREAD from the Intel pinctrl/
GPIO drivers.

I do think that dropping IRQF_NO_THREAD from the Intel pinctrl/GPIO
drivers is probably a good idea, but this will need someone to drive
this forward including dealing with any regressions this may lead to.

Regards,

Hans




