Return-Path: <linux-gpio+bounces-38666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TlGHHUSpM2o3EwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:16:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27269E612
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=r0y5D7NJ;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=5CPeMOk3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38666-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38666-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BE2A3030EAC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23BD2D322E;
	Thu, 18 Jun 2026 08:15:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DF19B5B1;
	Thu, 18 Jun 2026 08:15:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770559; cv=none; b=iSx7cl1eCUJtJytNm4++787mQSPSkPZB6ueN91p0HeehyAZf6+/pZaouAnOzfb57c+Pcxw0DCdAXn/z6Eb1XEna5E95F4+q98as+BwY+vg7Wk33+d75Z0++7s7xzYNWVH01KmgzVzo3Ta5hF1uMsrjGGVPw5h16ZzY3h1F+pSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770559; c=relaxed/simple;
	bh=Ft3DR8HYqhv7bLm/AkmBWtVUOn1fgDkjToaIGnHHPQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRgu72CWAD3+eOYqhqmLtHMKM7fOYiIrxCbyuVx1RueaDZqVNwR/aCEgelwgKnuhWc/6lKTiLxQvjN7B4VMionDgGOlwa6VFF7ZvfjGWYOAGbdbRSAMUqUHX4YcgYdgdXZMctqeN245yutNw6kLa7rWL/YhpdWf7D53RTNyW3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r0y5D7NJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5CPeMOk3; arc=none smtp.client-ip=193.142.43.55
Date: Thu, 18 Jun 2026 10:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781770556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfKiKVq3hU3pjcBqUpBBITy3boOVHoqwPFPh0Ujjzk8=;
	b=r0y5D7NJYb4QTTOEoORJ6biEUdtaD8LliAbG4rfJBSYfP0u/4miH20xoNkr3VAJVDDr+hC
	2kw2RkVTQhqwfZ3NbbLjKlVNdqpSNWt05bqc2Cmou0QG4NwzmxuSAv0cZtsEvMfp4bst5e
	YyY6mDGnP6vXPicLqUmAjUycpPhx6b0CFwsKA5m1cGmF0wx5zPIVU5pypGLf2IpVyj8IWg
	4Dz+Ji6QZpVMFvIvCkBOWOtIp/rftXIsEtbwCmDputtdUXO6yOxWfmrHJvZAaBYGS/oAE+
	XQgLfSbYtvGuLL6Bjvyv9y1vmxnDnBRfP8kv1iniZV3g3lCp9K8AqP7ya9QmAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781770556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfKiKVq3hU3pjcBqUpBBITy3boOVHoqwPFPh0Ujjzk8=;
	b=5CPeMOk3GIo1h9V/CqjAAL8dMVouMDzCVxeFdnTfaVIMu/N/0RPcwSBhdwm/hFObeI/2/w
	39FONTNnrS0xcEAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Mark Brown <broonie@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <20260618081554.zifCwv4I@linutronix.de>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:broonie@kernel.org,m:vireshk@kernel.org,m:linus.walleij@linaro.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-arm-kernel@lists.infradead.org,m:soc@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-38666-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF27269E612

On 2026-06-18 10:34:18 [+0800], Runyu Xiao wrote:
> Hi,
Hi,

=E2=80=A6
> The repair I am considering is to keep the gpiolib resource updates in
> the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> dropped desc->lock.  The driver would keep per-line shadow state for:
>=20
>   - IRQ disabled/enabled state
>   - pending IE update
>   - edge direction state
>   - pending EIT update
>=20
> and then synchronize those shadow updates from irq_bus_sync_unlock()
> under a mutex.

Not sure how this will look like, but okay. I was looking at making the
a lock a raw_spinlock_t for fast_io. Since it is just a read and write
it shouldn't be a problem. But then there is the regcache and the sync
of many registers might be painful. The actual problem is the type MAPLE
and RBTREE which have an allocation in their write callback. That is a
no but the FLAT ones should work since there is just one alloc during
init. Well, wouldn't it be for the lock that is acquired during the
callback.

I don't think this is required given that it is init time so
holding the lock shouldn't be required. This was introduced in commit
fd4ebc07b4dff ("regmap: Hold the regmap lock when allocating and freeing
the cache"). This change broke gpio-104-idio-16.c, pio-pci-idio-16.c,
pio-pcie-idio-24, gpio-ws16c48.c and pinctrl-apple-gpio.c.

So unless there is something that I miss=E2=80=A6

> In other words, the fast callbacks would only update local shadow state
> and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> regmap writes would be batched into the irq bus sync phase.
>=20
> Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> you prefer a different fix, such as changing the underlying syscon regmap
> locking model or handling only the IE register path?
>=20
> The draft patch I have locally is roughly:
>=20
>   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
>=20
> and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.
>=20
> Thanks,
> Runyu

Sebastian

