Return-Path: <linux-gpio+bounces-31471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLfzCFmHhGl43QMAu9opvQ
	(envelope-from <linux-gpio+bounces-31471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 13:04:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBDF230F
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 13:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57881300440F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 12:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D3333ADBA;
	Thu,  5 Feb 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XQHLUTAs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lz3teZEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF56F2F2;
	Thu,  5 Feb 2026 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293075; cv=none; b=NhAxJ4wANm1XXx0w2rzyLCmsMB3d/d2tRQh/HHvajks3ZEKPBvZe0xC3MuMwEortLhD7OZINCjFt2xryNB9gVPDxhH6h0I559fEGsnat4kjkVXny7oNmh+BVWnN15VTsoiZrJROMh4V+51CUNF7DYk8n/VgBqicb0IBAQ9gU/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293075; c=relaxed/simple;
	bh=gsVsmUxwWWIvMIEGzVYefGOF3v9ABBkowmWjDY+/qPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn4J5pMrc0/ZgG+3DBh1XOj2I2dyjudKTtWEKLVSil8zApwh+Ns3SGZT9NoKfRV1atVlrabV0f2CYksLg2SoYC8qSp+kAub5LrNNgonDc3kD7LQzkizj16x5FCpmLIpIb9mKnpoFotati/ah8ngYMWRGoleSfR7XDYO0FbPFr3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XQHLUTAs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lz3teZEl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 5 Feb 2026 13:04:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770293074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2uGpEWV8ToSpnnO/16cB29Yandli/5BHdvA/0KnWmM=;
	b=XQHLUTAsY933a8ZE/aAoF5MXp9e2ecEi64qF8BvzWn5cCOerWJ0fuT68QFsVPaH6xGmwTh
	XuJGsaDF6vmYIdnN/gdSSMdLcPEC/Ht/wvdJHNpuRylry72Gar3l8+eL2+cNkgFk2I3Tse
	XpXNZv7kko44HxJZRdqYISxJem14/2XuDkOFrhpi1b1m89ROX6o4nSo0+WeN6mX8Hw8qHq
	F6niC4ehQPZET6nkEQ1UQSrco8bqBXdSiZVTw26B/UdzV611LnNWzPhONP2rd/Y9B52oE3
	DjRoe3eUcdHkfdz5kMj6Etkg6Z6dATWtKcw2R7ymVH1+OqzctK0VUthGyl/6dQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770293074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2uGpEWV8ToSpnnO/16cB29Yandli/5BHdvA/0KnWmM=;
	b=Lz3teZElscvxVOxxPe+cNvh75UftM2FrIZKtb/eu8qkTce5Pr4FDhIa1XUZLQN60Db3lRt
	f57CKLaMsMmTqiBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
Message-ID: <20260205120433.iKQIknOA@linutronix.de>
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31471-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 38DBDF230F
X-Rspamd-Action: no action

On 2026-02-05 12:39:30 [+0200], Cosmin Tanislav wrote:
> The rzt2h_gpio_get_direction() function is called from
> gpiod_get_direction(), which ends up being used within the __setup_irq()
> call stack when requesting an interrupt.
> 
> __setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
> an atomic context. spinlock_t cannot be used within atomic context
> when PREEMPT_RT is enabled, since it may become a sleeping lock.
> 
> An "[ BUG: Invalid wait context ]" splat is observed when running with
> CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned call
> stack.
> 
> __setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
> serialize access against a concurrent hard interrupt.
> 
> Switch to raw_spinlock_t to fix this.

I don't like the reasoning here because it looks like "lockdep
complained lets switch the locks and everything is fine now".

It is required to make the suggested change because the lock is used
in hardirq context and only while accessing the HW's register.

I just don't want that a lockdep splat becomes a green card for these
kind of changes without understanding the consequences.

> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Sebastian

