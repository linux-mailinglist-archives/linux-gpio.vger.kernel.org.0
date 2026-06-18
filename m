Return-Path: <linux-gpio+bounces-38656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mSKaJCSQM2qSDQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:28:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C269DD72
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b="vKF/ztU2";
	dkim=pass header.d=linutronix.de header.s=2020e header.b=aK40ZbtU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38656-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38656-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86A91301677D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20483368A5;
	Thu, 18 Jun 2026 06:28:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A34146A66;
	Thu, 18 Jun 2026 06:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764128; cv=none; b=AbF5Ju07qJ6QTDPQk47EWs3yS54HZ7exYhhfL0jAw5m2KR69UfRGb3SS5akV8+s8FNAKFW3oLonX0W7HOUjpbYl+WR6gbjMipDZzegKV8uDZbbPcFEkpA4XuaOIGgXHVCo1Yswpfbr65FgVkICd1hRu5/YJXxp+VSPzOWZoEyl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764128; c=relaxed/simple;
	bh=tbVx56po/SQzQgbuw5DtYXI3bcPs2gNfb+AJ4gh3QKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQc0fia9xhtgWTLQvde6LfhL1pJd1+bdQnxTEMpQN992DJgQdit6vRNpXY4jGHoLVDJjg9IzrJAAbozZILCA/EJljeIixro7RjnvQ11QygBARmkGiu7pWdo4bFIkxHgFVVOQsmvH1lasFGzzu3kRpMzcxMumnJ0zqYekOtxQq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vKF/ztU2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aK40ZbtU; arc=none smtp.client-ip=193.142.43.55
Date: Thu, 18 Jun 2026 08:28:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781764121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gv8sddD3UuF5Rf7ec5dmwrPPLbEvcHt690OH4TXc8/0=;
	b=vKF/ztU28iYem31/ZVUcGCAY9Xl4vQORViFV0dWnK27YmpDPZqmIdqjOhcReMDtSkfgOZs
	fGku/+A2/mkS28fW8J4U1bjOBpKCm7i5Eu894EsgGXoizp2/5xby2JNOWZlsd6Q9KSyqhJ
	bNlOtmtJ9SgtjCN32XzBdOUIyditaKyo+R4RQuixkFtU/A6NTUQYkjQNOiOBLqRQDFjSMC
	oEx5Wguqs4AcvzI7OCeGozWk2TJ3Pw0WZfIUNmes76qEQf5/EW+RvQ7tUDjvqRQf7JO+2L
	Jy8jWdu8IVCrQu+eQN4BAMz82zIki3ntnRteAh9coHNgBefHXEmK36TIt6+phQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781764121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gv8sddD3UuF5Rf7ec5dmwrPPLbEvcHt690OH4TXc8/0=;
	b=aK40ZbtUmjb/BDqoc7oe877FraCcm3PCcXRR1fltxCCyLUsk2kswT7akesTxpBveo6L6TR
	7gVwOU/7q4BFTdAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID: <20260618062839.4o1ewdEn@linutronix.de>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260617154035.1199948-2-runyu.xiao@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38656-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:andy@kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:jan.kiszka@siemens.com,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,linux.alibaba.com,goodmis.org,siemens.com,vger.kernel.org,lists.linux.dev,seu.edu.cn];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,seu.edu.cn:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 190C269DD72

On 2026-06-17 23:40:34 [+0800], Runyu Xiao wrote:
> sch_irq_unmask() enables the GPIO IRQ and then updates the controller
> state through sch_irq_mask_unmask(), which takes sch->lock with
> spin_lock_irqsave().  The callback can be reached from irq_startup()
> while setting up a requested IRQ.  That path is not sleepable, but on
> PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
=E2=80=A6
> Fixes: 7a81638485c1 ("gpio: sch: Add edge event support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

