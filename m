Return-Path: <linux-gpio+bounces-38668-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3g2EhWqM2pLEwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38668-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:19:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000A69E648
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=bgpoXraC;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=+PAOCBZ6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38668-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38668-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40EC930AED2C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D201388E5A;
	Thu, 18 Jun 2026 08:18:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B2738E5EF;
	Thu, 18 Jun 2026 08:18:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770726; cv=none; b=l4LehJfiFjsoTFPrFhvLIs2/5a8YLUFdGzAX3GmoYVPFP5aClY7gvXH15+hC43142f3kKtrgOBPAZhdfvL9dUjIsmH9X9fEUnoh/81P5thJiTgIRbYtaXkcUYz2a+9OUmQJJYJZjk+wRi6Ob5+l2RAjdOFJ61RArCU2hAy9DmTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770726; c=relaxed/simple;
	bh=QWZAgUG33sDVoOYvsZHlVsv36qxjPW2xLkggJ9D40hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+vYC9FOSp7vD6oZMDJCAPJ2rDdd7CkJZT5O5BiGNq6kroLWLo9XVFgCQEqorlWskGZ16gFmfF/GN+yJPHUhjI/IRdC1MkUTiAc1gRCoUAkwlGz/S6sXFduiflqNkT0z5iClKWW2peDGxdNQ8vjqJCLTSRfoKykhMO+RyfBgYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bgpoXraC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+PAOCBZ6; arc=none smtp.client-ip=193.142.43.55
Date: Thu, 18 Jun 2026 10:18:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781770722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esNCyoPGjThitgO/ONZd6FII4CTw4WW+HhHMD7dROhE=;
	b=bgpoXraCqEcTq/A1VHEfomvk7NjTwbH52o92fLD0lTRIqkRAEopghmZJIgYaX0rO7SRcfP
	7N5y3xITSWfAigN+yUpqrRZltUGQ1uXFo0VCAE4MpRuwjpuFNGqbNhpqqT05W1YdAzdTz1
	Z3px8lS1RoJE4mx/3/KQMc5YyJEVhtJ56cu6g6FErAW6i6ob53ydVsGq/0obmxAJ9WcxCk
	m+7RjQ3eKdovQ6vN299Awepf22cjql56wSwGk+KLZBoShc/lAPryI8WLmwPtDbebw8J8Tl
	uf8lUIg3Nffr1bn9h+yDo69xFLqd/O05CynGpM42SCnQP9XqN9v2fXMHqC2E/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781770722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esNCyoPGjThitgO/ONZd6FII4CTw4WW+HhHMD7dROhE=;
	b=+PAOCBZ6krTyj3cKO28sUF+z9qnobDQbrowNq7D7oCQD31FisaxSCZhWTNTc4azTwf3SM6
	LVas/zdYRlOgSpDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: sch: use raw_spinlock_t in the irq startup path
Message-ID: <20260618081841.QBWh0eV5@linutronix.de>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
 <20260618062839.4o1ewdEn@linutronix.de>
 <ajOS2UR9pw_pUBxr@ashevche-desk.local>
 <ajOTLrrUCBxsy5jf@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ajOTLrrUCBxsy5jf@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38668-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[seu.edu.cn,linaro.org,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,seu.edu.cn:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,linutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0000A69E648

On 2026-06-18 09:41:50 [+0300], Andy Shevchenko wrote:
> On Thu, Jun 18, 2026 at 09:40:31AM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 18, 2026 at 08:28:39AM +0200, Sebastian Andrzej Siewior wro=
te:
> > > On 2026-06-17 23:40:34 [+0800], Runyu Xiao wrote:
> > > > sch_irq_unmask() enables the GPIO IRQ and then updates the controll=
er
> > > > state through sch_irq_mask_unmask(), which takes sch->lock with
> > > > spin_lock_irqsave().  The callback can be reached from irq_startup()
> > > > while setting up a requested IRQ.  That path is not sleepable, but =
on
> > > > PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
> =E2=80=A6
> > > > Fixes: 7a81638485c1 ("gpio: sch: Add edge event support")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> > >=20
> > > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >=20
> > There is already a v2.
>=20
> Or not... I might have been confused with other patch that got two versio=
ns
> in a row.

I am catching up so I wouldn't be surprised ;) And it is entirely
possible that sashiko came up with the pre-existing condition worth
fixing ;)

Sebastian

