Return-Path: <linux-gpio+bounces-31453-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHp4AqSag2nppwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31453-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 20:14:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04BEBF96
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 20:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 235BA3033536
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 19:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB97428499;
	Wed,  4 Feb 2026 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nS6k0ILO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cgtz93kO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74C31A551;
	Wed,  4 Feb 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232467; cv=none; b=c5l2nMwAScua0DJfutu4RkflHTR75+/XLtUWtFqBJrTDJ87MKd3aBl1RANVyQjA0wcQGN1QFn5NBU5bE5ET84O3bSnEfCKDNB5OpzyP8NXJlAK/gHEkHUHFe+ElUckngCM/H+n2of5AboTTHbeT2k9qQy6Oj8YCdEDBGLC+AtmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232467; c=relaxed/simple;
	bh=XqpFA/NYx33FQAft2HXpUO53aObwTnNv/2D2jgkdn7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qb9Smncu/3UCOrjXyVJC9flmcS6WPt1TSnyxpO4Yxx4WG9Kgpl7TKKkLlwELoKgSyYbce8nZ3jU0+8uEJYypIK3JSAld+msAdo+Jv516xgfapZdPyhd9LwpQmhJroSAnTMnMAln5XUdF2lmsMtzIGGCMlxfhnJLwJSB1L1UvAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nS6k0ILO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cgtz93kO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 4 Feb 2026 20:14:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770232464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WII2kn7u3/Xalkz9NiyLRXgVNGB3TXXXNldyGhtrXXQ=;
	b=nS6k0ILOBr6RxEmhzKDTFcaKsG5+pwJoj2BQ5Bxv1WVDghib14vLAsFzyuHlMHUoOA0Emx
	ZzWqyXMFxTD7zZLPHffdRrRRY7Ll4hRfJrlZu5dDLBYjMyxQJb/1fsIkjQq+BO57fOtdUa
	mUBGWKvQSYmrqFfz8yIWC6xvKWfoBwfu91/n+DVDhFBIdtv2mQCFtLsVfTlfL8Q3dDVnwo
	pUDtgvwbuWOHe2r1PI80emxhcfrgpe9KFxv8shYG+4EPE8hb8dtwuUYz1C5R/IB12JQ2H8
	Mnyew5Qdd7TXBgZ51ETdLYmSbx20/YBCB5zQeLQ2afhiZK7Cnypwuo5rwT5LCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770232464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WII2kn7u3/Xalkz9NiyLRXgVNGB3TXXXNldyGhtrXXQ=;
	b=Cgtz93kOUDN3jjr7d9hFgw/QvU9xFDJ2CfZSUeSFF97GAFniryxy742SpXmf2ih/ekgUv7
	FT5XdWLkWiSZyKBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: fix invalid wait context
Message-ID: <20260204191423.9mmBtJOn@linutronix.de>
References: <20260204180448.529313-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204180448.529313-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31453-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D04BEBF96
X-Rspamd-Action: no action

On 2026-02-04 20:04:48 [+0200], Cosmin Tanislav wrote:
> The following invalid wait context BUG is observed when running with
> CONFIG_PROVE_LOCKING enabled.
> 
> This seems to stem from the fact that __setup_irq() takes a
> raw_spinlock_t, while we take a spinlock_t inside gpiod_get_direction().

From the backtrace yes. It is more that the irqchip used interrupt chip
needs to be able to mask interrupts in hardirq context which it needs a
raw_spinlock_t.

> raw_spinlock_t is a strictly spinning lock, while spinlock_t can sleep
> if PREEMPT_RT is enabled.
> 
> Switch to raw_spinlock_t to fix this.
> 
> [   20.641809] =============================
> [   20.646336] [ BUG: Invalid wait context ]
> [   20.650964] 6.19.0-rc8-next-20260202+ #417 Not tainted
> [   20.656892] -----------------------------
> [   20.661517] (udev-worker)/235 is trying to lock:
> [   20.666842] ffff000182d4ab58 (&pctrl->lock){....}-{3:3}, at: rzt2h_gpio_get_direction+0x3c/0x150
> [   20.676928] other info that might help us debug this:
> [   20.682560] context-{5:5}
> [   20.685572] 4 locks held by (udev-worker)/235:
> [   20.690701]  #0: ffff000180b398f8 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x10c/0x210
> [   20.700480]  #1: ffff000186f41a60 (request_class){+.+.}-{4:4}, at: __setup_irq+0x10c/0x740
> [   20.709952]  #2: ffff000186f418c8 (lock_class){....}-{2:2}, at: __setup_irq+0x12c/0x740
> [   20.719057]  #3: ffff000182d4a690 (&gdev->srcu){.+.+}-{0:0}, at: gpiod_get_direction+0x40/0x24c
> [   20.729135] stack backtrace:
> [   20.732450] CPU: 2 UID: 0 PID: 235 Comm: (udev-worker) Not tainted 6.19.0-rc8-next-20260202+ #417 PREEMPT
> [   20.732459] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
> [   20.732464] Call trace:
> [   20.732467]  show_stack+0x18/0x30 (C)
> [   20.732479]  dump_stack_lvl+0x70/0x98
> [   20.732489]  dump_stack+0x18/0x24
> [   20.732497]  __lock_acquire+0x910/0x1594
> [   20.732508]  lock_acquire+0x2f0/0x42c
> [   20.732517]  _raw_spin_lock_irqsave+0x5c/0x94
> [   20.732529]  rzt2h_gpio_get_direction+0x3c/0x150
> [   20.732538]  gpiochip_get_direction+0x34/0x90
> [   20.732547]  gpiod_get_direction+0xd8/0x24c
> [   20.732556]  gpiochip_lock_as_irq+0x68/0x144
> [   20.732565]  gpiochip_irq_domain_activate+0x18/0x30
> [   20.732574]  __irq_domain_activate_irq+0x60/0xb0
> [   20.732583]  irq_domain_activate_irq+0x34/0x5c
> [   20.732593]  irq_activate+0x2c/0x38
> [   20.732600]  __setup_irq+0x2d8/0x740
> [   20.732610]  request_threaded_irq+0xb0/0x180
> [   20.732620]  request_any_context_irq+0x58/0xac
> [   20.732629]  devm_request_any_context_irq+0x78/0x160
> [   20.732637]  gpio_keys_probe+0x344/0xb40 [gpio_keys]
> [   20.732657]  platform_probe+0x5c/0xa4
> [   20.732666]  really_probe+0xbc/0x2ac
> [   20.732675]  __driver_probe_device+0x78/0x118
> [   20.732684]  driver_probe_device+0x3c/0x170
> [   20.732693]  __driver_attach+0x118/0x210
> [   20.732701]  bus_for_each_dev+0x7c/0xdc
> [   20.732710]  driver_attach+0x24/0x3c
> [   20.732718]  bus_add_driver+0xe4/0x204
> [   20.732727]  driver_register+0x68/0x124
> [   20.732736]  __platform_driver_register+0x20/0x2c
> [   20.732746]  gpio_keys_init+0x20/0x1000 [gpio_keys]
> [   20.732758]  do_one_initcall+0x7c/0x530
> [   20.732770]  do_init_module+0x54/0x23c
> [   20.732780]  load_module+0x181c/0x1ed0
> [   20.732789]  init_module_from_file+0xd8/0xfc
> [   20.732797]  idempotent_init_module+0x1e0/0x2d0
> [   20.732806]  __arm64_sys_finit_module+0x60/0xa4
> [   20.732814]  invoke_syscall.constprop.0+0x40/0xf0
> [   20.732824]  el0_svc_common.constprop.0+0xb8/0xd8
> [   20.732832]  do_el0_svc+0x1c/0x28
> [   20.732839]  el0_svc+0x4c/0x2dc
> [   20.732850]  el0t_64_sync_handler+0xa0/0xe4
> [   20.732860]  el0t_64_sync+0x198/0x19c

Please get rid of this backtrace. It adds no value to the description.

> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Sebastian

