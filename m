Return-Path: <linux-gpio+bounces-36138-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK1zMwO9+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36138-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:48:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2EF4CA1BA
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A5E030173BB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E622D061D;
	Tue,  5 May 2026 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJWuqp6O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DE29E116
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974432; cv=none; b=EZ4bOKqyEk6jx6K2nTdJWuAW6uM3PLpQk5J8PIWwpBB6/+dbuNLueDFMk5EZvuZEF0XXzc5ussN5mDrtkoNbaO0oBBpMsR7wK451cejHyxWvAJAtrKfG1Q/8wl6BFUUhauEEoR3MJ5saHkAbPp/Mjq0385iN9xi+Gbz8QenlS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974432; c=relaxed/simple;
	bh=rwH6hBKT44ZJOeb+mzc++yS7777RrA7f0KMw7Gsm2og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv32uTtWtUHqQ5QyxWF8mkJBI265kxlR0vDSK4gG+oz06wcI4WxsdL22qsqjsSRrc9mKX6X0PJ+VkAw0uU2NX639oT7YtNVm2z7LkKEVDByuyq/UZ8NJ66SyIiY1S52Y8xeykOoHK8vY4Q4EnHxfGY46Zrmi0NT8fFKX8zQnbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJWuqp6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF72C2BCB4;
	Tue,  5 May 2026 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974431;
	bh=rwH6hBKT44ZJOeb+mzc++yS7777RrA7f0KMw7Gsm2og=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJWuqp6OrhbEhzdTq7o2XxWkpvJBSf+4BpCWKHMGzDmWBJ+9DYONv1UJkgg6bHWP3
	 AzY3wFIiknmZPSw+fvIZ1e+nt37a3t2NUmSwu1u+unoYvXzpSN50+E4Xvua/eCBlum
	 mlST9iVUtpv9kB1Hz9y4sMzwj2U7vO5KPbkT808/awihdBYNLW+jtsDqtUSA43DXO+
	 BaiRq0L7u2wHIGU/g+5Bg5vI0f+nut7mB53dVYZN6gJlwQfBMuxTjb6xGbPsoBud4l
	 dhiSuVREimtazKYPqo45W7pZCTujQ+OrEwvqUkZYJd3O7b6GjjAypPasJrgzGne7FN
	 XQQNsyN5Q2i6g==
Message-ID: <f384dd12-c982-42e6-9b7b-95d09a1bb63d@kernel.org>
Date: Tue, 5 May 2026 11:47:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] pinctrl: intel: Stop setting IRQF_NO_THREAD ?
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org
References: <18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org>
 <20250623061517.GU2824380@black.fi.intel.com>
 <afm0GTghqnG6JuC0@ashevche-desk.local>
 <3df439b7-2c28-44f5-81ed-5d4747e7096f@kernel.org>
 <afm7t40WdlYopUKu@ashevche-desk.local>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <afm7t40WdlYopUKu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DD2EF4CA1BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36138-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi Andy,

On 5-May-26 11:43, Andy Shevchenko wrote:
> On Tue, May 05, 2026 at 11:39:51AM +0200, Hans de Goede wrote:
>> On 5-May-26 11:10, Andy Shevchenko wrote:
>>> On Mon, Jun 23, 2025 at 09:15:17AM +0300, Mika Westerberg wrote:
>>>> On Sat, Jun 21, 2025 at 10:49:33AM +0200, Hans de Goede wrote:
>>>
>>>>> While debugging the following lockdep report:
>>>>>
>>>>> =============================
>>>>>  [ BUG: Invalid wait context ]
>>>>>  ...
>>>>>  swapper/10/0 is trying to lock:
>>>>>  ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
>>>>>   at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>>>>>  ...
>>>>>  Call Trace:
>>>>>  <IRQ>
>>>>>  ...
>>>>>  __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
>>>>>  __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
>>>>>  vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
>>>>>  __handle_irq_event_percpu (kernel/irq/handle.c:158)
>>>>>  handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
>>>>>  handle_edge_irq (kernel/irq/chip.c:833)
>>>>>  ...
>>>>>  </IRQ>
>>>>>
>>>>> I realized after a while that the root-cause here is the IRQF_NO_THREAD
>>>>> usage in pinctrl-intel.c. This was introduced in 1a7d1cb81eb2 ("pinctrl:
>>>>> intel: Prevent force threading of the interrupt handler") to avoid problems
>>>>> caused by using request_irq() for what should be a chained irq handler
>>>>> (which itself is a workaround because of a shared IRQ on some platforms).
>>>>>
>>>>> Generally speaking using IRQF_NO_THREAD is undesirable for 2 reasons:
>>>>>
>>>>> 1. It introduces extra latency on PREEMPT-RT kernels
>>>>> 2. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO
>>>>>    interrupts to use raw-spinlocks only since normal spinlocks can
>>>>>    sleep in PREEMPT-RT kernels and with IRQF_NO_THREAD the interrupt
>>>>>    handlers will run in an atomic context
>>>>>
>>>>> 2. is what is causing the lockdep report above, by simply using a
>>>>> wake_up(&wq_head) call in an interrupt handler, since wait-queues
>>>>> use normal spinlocks not raw spinlocks.
>>>>>
>>>>> I've tried just removing the IRQF_NO_THREAD flag and that fixes
>>>>> the lockdep report. I've also tried reproducing the problem for
>>>>> which the flag was added in commit 1a7d1cb81eb2 by using a kernel
>>>>> with CONFIG_IRQ_FORCED_THREADING and "threadirqs" on the kernel
>>>>> commandline. And the problem not reproduce. I'm not sure this is
>>>>> 100% proof that the flag is no longer necessary though ...
>>>>
>>>> Can you try also with CONFIG_PREEMPT_RT and see if that triggers the issue?
>>>> If not then:
>>>>
>>>>> So 2 questions:
>>>>>
>>>>> 1. Should we maybe just drop the flag ?
>>>>> 2. Or should we have 2 different code-paths for GPIO controllers
>>>>> with/without shared IRQs and use a chained-irq approach for the
>>>>> not shared case, to at least reduce the usage of the flag ?
>>>>
>>>> I would just drop the flag then.
>>>
>>> Hans, any conclusion on this?
>>
>> I worked around this issue in the affected driver.
> 
> Is it upstream? Can you share the commit ID or patch in ML (if it's ready)
> for that? (Just for the record.)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cee3dba7b7416c02ff3

Regards,

Hans



