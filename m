Return-Path: <linux-gpio+bounces-31455-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCDXC3Wlg2l3rgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31455-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 21:00:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269CEC513
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 21:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B85D300CC24
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 20:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C7D3043B2;
	Wed,  4 Feb 2026 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZcfAHUlB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nu/gMAAC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F6923BD02;
	Wed,  4 Feb 2026 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770235238; cv=none; b=hqx7FQ/S6J5wQB9tyuCwPHp6JJ2hN7M+3NDO8RHbi1CotXWEAV7V8hnNjL7Wd5Q3BavRBXXMvAh0NH8LkAaVKHjUgy3AUrkKVfHAGvABLfWSWa7a+hymToyEbNql9Wfmiu7vO2KJQN2oJeFC48Ct6K8R0uSLWAZM/b5A6OmzyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770235238; c=relaxed/simple;
	bh=PV7EY+nM4v5DIdD00oIDabp4+NPuWfWy928PN2MH2WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqTCSDlR1eA9ejWBQEUd7RwygoeXaJ+BaRaihyj8RleEGOCI9tB2ePyLQiR0iiXvBisBka9evkFtcN9d27IyzZXb9MWcc0zuXpqE7iT3p4T6dLTDng30bmfj6QVtbjyx+OQlrJScI/3rDws9/XvfjeXnhsf3ybF0wlQws6CO+n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZcfAHUlB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nu/gMAAC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 4 Feb 2026 21:00:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770235236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SLI+4aqUQAdjIZ3zATptZiNnPPue4XsGM+GPb5GIy6A=;
	b=ZcfAHUlBwOKc+d2Rxew+LvTAjVj0UGbaONUpBqmOUiCR6sFDbWWIu3L6OfzqPENH2TOwDJ
	NyOvsQu3NSItpXEQ7mNmk3LdvGQIIIqn19+9kjSVJBPXB0bL1KfC0MimH0PFyMD3RNDxos
	0w9IeUuMxSfh4BvCph9dL4GEKbk7+lX3iPt8W/1uRj3w6emLObwGW8v2N3aqpQCIHClLG9
	JuOMfqL2WaX0MbT3dvLk8LPNTEjA78ZiVU22eU93WGuti1WFdSuSePIBP+KM0TyL12pfls
	nHPs0+Ga7VNZBJXlHVSxRVhFbJ3GLv2BKThpJ+tlyJcmGEqrOPiay+f9FGS5Ew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770235236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SLI+4aqUQAdjIZ3zATptZiNnPPue4XsGM+GPb5GIy6A=;
	b=Nu/gMAACgk1fkIq8JRyGxyNVO9dpAbA4m9fw/Q/eUdkmiADzxpl3ZzGsSDhZrzEdMaIpXH
	R9wQBMo6xVeIpsDw==
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
Subject: Re: RE: [PATCH] pinctrl: renesas: rzt2h: fix invalid wait context
Message-ID: <20260204200034.b1UsoMT9@linutronix.de>
References: <20260204180448.529313-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260204191423.9mmBtJOn@linutronix.de>
 <TYRPR01MB156191EEA4542FC6DC6BA9A488598A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYRPR01MB156191EEA4542FC6DC6BA9A488598A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
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
	TAGGED_FROM(0.00)[bounces-31455-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8269CEC513
X-Rspamd-Action: no action

On 2026-02-04 19:53:36 [+0000], Cosmin-Gabriel Tanislav wrote:
> > From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Sent: Wednesday, February 4, 2026 9:14 PM
> > 
> > On 2026-02-04 20:04:48 [+0200], Cosmin Tanislav wrote:
> > > The following invalid wait context BUG is observed when running with
> > > CONFIG_PROVE_LOCKING enabled.
> > >
> > > This seems to stem from the fact that __setup_irq() takes a
> > > raw_spinlock_t, while we take a spinlock_t inside gpiod_get_direction().
> > 
> > From the backtrace yes. It is more that the irqchip used interrupt chip
> > needs to be able to mask interrupts in hardirq context which it needs a
> > raw_spinlock_t.
> > 
> 
> Would you like me to reword the commit message? I only analyzed why it
> happens, I didn't investigate why it needs to happen. :D

It did explain. It would make sense to include the reasoning and not
symptoms.

Sebastian

