Return-Path: <linux-gpio+bounces-31477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HJUI+C/hGnG4wMAu9opvQ
	(envelope-from <linux-gpio+bounces-31477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 17:05:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24CF4F38
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 17:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B333E303CE83
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 16:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015F83F0758;
	Thu,  5 Feb 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s+xF6yMW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VrKRyQdr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E32542EECC;
	Thu,  5 Feb 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307245; cv=none; b=JwZ+i9/qzXUTscI6/Rdg3KfQdvfLpq8VMMYsV3HdCrl/ZkU3+WrB3ASoHHR1q4mm9KmbR9jMRmUJgJoktCUaaEfQmVfneN80yZsxpQJANK6KTfBW3+nTMuVqs+ue9fOCBxXHLAHXBRJSXzzaIw9WJG/PKmOkQbYWB34nSqaEvVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307245; c=relaxed/simple;
	bh=3IYAtFChRhUR9aPSjBL8aTL9oIZv0Ud4zv6jZRSMwgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtJ1hMfJvdzrRbvvBOKGabnMYYGSjvil0TugKPiHLb2MrBmibgk7V4jQYNg2prh1jHAZRROOMnQosodwmrEZLRcHsuHmY48BEDL+bEsH1BMm/R8SaXYd86xc4JCI/a8zLdAOrwz2Rtg43nQ/BDS5mLQzb8GGdsHSebmhYw9sVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s+xF6yMW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VrKRyQdr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 5 Feb 2026 17:00:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770307243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4eJBnpC1sd0Kvvv9UCtdgEuOI6p24RrICHzpa/9gZA=;
	b=s+xF6yMWk3uep8E204ZYbr08wyspcKBUvYy/8nyysVpowCnMzA/J/SUGNszEYUMja8joKS
	j7DqDGHQjMHMKse7hUFDm/bWrD0gIZScIvjhsTcwPkT/mvOEC8fPmzDdNu6I4Px4jvRWco
	ONkQeW0j5FP2Vq0vfmcCMJ9dey+s2Hlkhqo//tFn8Us9qQpyV43jCnf8Kj7jCfnZgvZDqn
	Hl7tUYblwhBBkANHi5npvh9PlE6wAvsKSndMC7A7K9pe2KQ5OTJcqjHic6HqoxuXvaHoVc
	kpuonWhTcczN3cWmjFWre5yvOn7gEhYYsGa5BKM0PvxBeg3lzn8za5qlrRBUog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770307243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4eJBnpC1sd0Kvvv9UCtdgEuOI6p24RrICHzpa/9gZA=;
	b=VrKRyQdr+9xBzcK8iu6U9qW4LShja6oKnp5IQy+MgTrpFT9AerujRJK1NXmv65hWD3xzWv
	ErdVPb8QAY34ZSAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>
Subject: Re: RE: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
Message-ID: <20260205160041.TIoBDYAk@linutronix.de>
References: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260205120433.iKQIknOA@linutronix.de>
 <TYRPR01MB1561934DB60CE0C07D39264D78599A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYRPR01MB1561934DB60CE0C07D39264D78599A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31477-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C24CF4F38
X-Rspamd-Action: no action

On 2026-02-05 14:30:36 [+0000], Cosmin-Gabriel Tanislav wrote:
> Hi Sebastian, thank you for your feedback.
> 
> I agree that a lockdep splat should not warrant a spinlock_t to
> raw_spinlock_t conversion since that's not always the correct solution
> for it.
> 
> This driver delegates masking/unmasking to the parent IRQ chip, and none
> of the local irq_chip callbacks take the pctrl->lock.
> 
> The pctrl->lock is taken in the gpio_chip->request, ->get_direction,
> ->direction_input, ->direction_output, pinmux_ops->set_mux and
> gpio_irq_chip->child_to_parent_hwirq implementations.
> 
> My understanding is that the only issue is that ->get_direction takes a
> spinlock_t while being called from __setup_irq() which holds a
> raw_spinlock_t with IRQs disabled, rather than spinlock_t being taken
> inside a hardirq context, which is what I tried to describe in the
> commit message.
> 
> Am I missing something?

I see. Usually there is also mask/ unmask which makes this mandatory for
this as well. In that case it is probably just the invocation from
__setup(). Instead of nitpicking here 

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

and you said that the splat does warrant for the lock splat so I hope
the best ;)

Sebastian

