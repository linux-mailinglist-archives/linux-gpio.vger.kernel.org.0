Return-Path: <linux-gpio+bounces-38673-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0EMMPnBM2pgFwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38673-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:01:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B452569F0F6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:01:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=KyUQ5AXZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38673-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38673-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261F430479E9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28543DEACC;
	Thu, 18 Jun 2026 09:54:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083903E0C5F;
	Thu, 18 Jun 2026 09:54:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776470; cv=none; b=P0tdpH8oqcH7S+a323m51L4bhRJYil8GI562Nny+jVvx5PqZOy/f3J6diRg1yJ0H4SdicyUVSuBK1l6jWXoGjGzy24erejlVRrbxYCRaAEyU8f9HDmOs9Schg1HdkGBaUoEPkO72CuSd/WDUr0AQlAwdYukWuDjsDGFTyPtRHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776470; c=relaxed/simple;
	bh=4uJCDCF5AjST5Im305PEl9dVzRJgMK7rgnKd0CVoeTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ti8LZ6NwSYSA0cRG7uenSFBuO3OAKdmfmxMiehvqIOodjMjNfFZXwKo1PAeHrwYm93a4SGLSK6ZVym6Z8E6Wgy1w5uOcVfz5/Isg9GxffwRGg30PXNQ60QNWbgJ0VMKh1piZ+OPxa/Yrav9Jpnjy5o5Q7wBpQvwgF/PZPNweNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KyUQ5AXZ; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 823EB4E42F9A;
	Thu, 18 Jun 2026 09:54:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 385B55FF03;
	Thu, 18 Jun 2026 09:54:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BF15106C8326;
	Thu, 18 Jun 2026 11:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781776466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UWjxZPbO7YyWOylyQwzbH8jAmeHC+JWQnIMid9X14ts=;
	b=KyUQ5AXZua/L2ZCNVAnSqLro4Y3sx4uqBwBsTO7cJFgnu5Rp+dqmtK1F/xgk8G0UvQOK4L
	VwI2xMwITW95tQSPsvqn224uNxRy/BsjM2iTHP6lFxamo0rj3pbFdCprNH+8SmbVEfETA+
	tj8K1oaMbgnQOw/RPm1/UAoG1+wu6eFZ8Fg+nuTL0BnAYcYm57WDABzLeV2duWrbWhlSri
	j24g4Z7zs8RgCQ3QSAfHymrBB2m3ATV+2t1Hi0uOgunt/EeTGx2jOIlEfq8Q2mxI9pzbTP
	89ennLqwDihGKNA968tH7zjBHocVAbQjRWUuky+IYz3Fb/BW7nHMMavOdizaxg==
Date: Thu, 18 Jun 2026 11:54:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <20260618115415.28b99ea2@bootlin.com>
In-Reply-To: <sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
	<sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38673-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viresh.kumar@linaro.org,m:runyu.xiao@seu.edu.cn,m:vireshk@kernel.org,m:linus.walleij@linaro.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-arm-kernel@lists.infradead.org,m:soc@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B452569F0F6

Hi,

On Thu, 18 Jun 2026 13:10:31 +0530
Viresh Kumar <viresh.kumar@linaro.org> wrote:

> + Herve (the last guy to work on this driver).
> 
> On 18-06-26, 10:34, Runyu Xiao wrote:
> > Hi,
> > 
> > While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
> > flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
> > against the current tree.
> > 
> > The path is:
> > 
> >   irq_startup()  
> >     -> plgpio_irq_enable()
> >        -> gpiochip_enable_irq()
> >        -> spin_lock_irqsave(&plgpio->lock)
> >        -> plgpio_reg_reset()
> >        -> regmap_update_bits()  
> > 
> > On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
> > sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
> > management paths while the IRQ descriptor raw lock is held, taking that
> > regular spinlock there looks unsafe.
> > 
> > A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
> > reports:
> > 
> >   BUG: sleeping function called from invalid context
> >   irqs_disabled(): 1
> >   plgpio_rt_spin_lock_irqsave
> >   plgpio_irq_enable
> >   request_threaded_irq_probe_path
> > 
> > My first thought was to convert the PLGPIO register lock to
> > raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
> > updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
> > the syscon/MMIO regmap used here, regmap may still take its own regular
> > fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
> > raw_spinlock_t conversion in the PLGPIO driver alone may just move the
> > PREEMPT_RT problem one level down into regmap.
> > 
> > The repair I am considering is to keep the gpiolib resource updates in
> > the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> > IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> > dropped desc->lock.  The driver would keep per-line shadow state for:
> > 
> >   - IRQ disabled/enabled state
> >   - pending IE update
> >   - edge direction state
> >   - pending EIT update
> > 
> > and then synchronize those shadow updates from irq_bus_sync_unlock()
> > under a mutex.
> > 
> > In other words, the fast callbacks would only update local shadow state
> > and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> > regmap writes would be batched into the irq bus sync phase.
> > 
> > Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> > you prefer a different fix, such as changing the underlying syscon regmap
> > locking model or handling only the IE register path?
> > 
> > The draft patch I have locally is roughly:
> > 
> >   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
> > 
> > and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.  
> 
> I haven't worked on this for a very long time now (15 yrs). There are some
> people who use this hardware, and so it is not removed until now.
> 
> Also I am not sure if RT kernel is a valid use case here for this SoC family.
> 

I know some users and they don't use RT kernel.

But well, isn't the pattern present in some other gpio controller drivers ?
How it is done in others ?

What is specific in this controller compare to others ?
We take and release spinlock in gpio chip .irq_enable(). I think we can
find other drivers doing that and probably drivers using a regmap as well.

Best regards,
Hervé

