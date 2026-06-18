Return-Path: <linux-gpio+bounces-38657-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JRIrDB2RM2qwDQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38657-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:33:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4C69DDB0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:33:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=1rp8a25D;
	dkim=pass header.d=linutronix.de header.s=2020e header.b="O0yHEg/q";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38657-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38657-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 362043016400
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B496C3290DE;
	Thu, 18 Jun 2026 06:32:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5F2E7362;
	Thu, 18 Jun 2026 06:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764377; cv=none; b=JM4RuHq1dmZHl4VDZP2KYsuH1Ac65m2pIU/BYNaFq7zdBMUfnCP8WmvV3eo9zFEevTG8vSQgk9SLKef0vij6JZYBqjrIqAbbTcpN0te0tGN6TPD8FIR4xwVDc1ZcAxTkE9GOi0W+s6r5dOyVdBpWR9bl/usP7sS0B7tM2T8l+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764377; c=relaxed/simple;
	bh=Qcz+7tjX7ygO3juELnfKHETvX+o1qYF94DDbsBU8MEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDXxCuHScX6iYK/PryytcT6udt7hDxyrIw8XQuqvVd1xELj7QMuZw/x9wfXtGGkvkV+Qi2BwJrQC3g5YJETgVLAw3yjCtynmSdxaPlaZDyOfdQQW+uFGr6YUnseiRC+wuhvCiGeZv+Iz0v79wa+5xZCn4S95UpNekMJPkEGlNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1rp8a25D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O0yHEg/q; arc=none smtp.client-ip=193.142.43.55
Date: Thu, 18 Jun 2026 08:32:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781764374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4kyA6yHk+GPcMH3U+HqnffMzuSZuB07AzC6h+UiwoU=;
	b=1rp8a25D/967AZOX+CqM+nUprDa4wyYeEhVMQpXBNss1e5uYAoVw1wUGx4Uss5/n8P6yCT
	cmGbkRdqAGC649bCR+Upq5f2mVIUA4WdUkV+il86dszzhIVwCUz0+mEBjXNWE9qSeRcBJx
	gctZSEuZN7Xvj+2tluclK67tPP7nsh6jyMQDtcSnuFjJvg+AKX269mvgapa4qjlfzZOp2P
	7Ht7vnZ7JwTfXwAtwz/1VFUED/3eYhciZRIR0SKmOx2Yo5oxYcwVCoaA41BuAfZiD8dWb/
	oeuEK9oG8+m96EoIol9WX88DsSS6YTBPIuBsqjyGd/Bce6H9dWtc3FCnHXBMVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781764374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4kyA6yHk+GPcMH3U+HqnffMzuSZuB07AzC6h+UiwoU=;
	b=O0yHEg/qslDvIlR7GMyoKaynzlyKIXGC6O3uoOdVh9AQXA3EOn2sGe7D5l4wSqM5aEf9Pb
	7SndOlQchb9Z4wBw==
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
Subject: Re: [PATCH 2/2] gpio: eic-sprd: use raw_spinlock_t in the irq
 startup path
Message-ID: <20260618063252.DYS2hgcJ@linutronix.de>
References: <20260617154035.1199948-1-runyu.xiao@seu.edu.cn>
 <20260617154035.1199948-3-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260617154035.1199948-3-runyu.xiao@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38657-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,seu.edu.cn:email,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,linutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEC4C69DDB0

On 2026-06-17 23:40:35 [+0800], Runyu Xiao wrote:
> sprd_eic_irq_unmask() enables the GPIO IRQ and then updates controller
> state through sprd_eic_update(), which takes sprd_eic->lock with
> spin_lock_irqsave().  The callback can be reached from irq_startup()
> while setting up a requested IRQ.  That path is not sleepable, but on
> PREEMPT_RT a regular spinlock_t becomes a sleeping lock.
=E2=80=A6
> Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

