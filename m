Return-Path: <linux-gpio+bounces-38771-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BZ/lNovuOGrzkAcAu9opvQ
	(envelope-from <linux-gpio+bounces-38771-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:12:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3F6AD94C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:12:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NLVUkNYX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38771-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38771-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FA9F3011343
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 08:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B909E38F639;
	Mon, 22 Jun 2026 08:12:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66738F25F
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:12:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115926; cv=none; b=Xe4iTYphLnNJJR+IRWnHyXwkM4lPelGRjGGVrazhlSO2NSEfmmUsm4LsZ+yoN5qjkaOTNw+gIafPkZ5YbWJvXywa3+TSQLrKsMyAZiKoPn6FKebNS8Zcr+o5zuE8QV05bGLfIcyHWMOEmr0l0IaOSt2CFyRxXoot1zC7deHcspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115926; c=relaxed/simple;
	bh=8AnsaLC6+od/MionGyP+iUdHXVA5Ii9OWWHkviV6EK0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1Q/oCDD2h+i+oIVDC6JjdLUhPWc2prumCCvHxayGQmx1KRKHiP4nCa2OWUH+IaOl/+8MvkxIs/pVRGqagp5RDDaDIwhg2qqxoTomEifXlwX2WbdQFmG0CxYulfS2es0EwEIcP0+UyPSMRIcLUpnq2cwe2oLNXmcANsn0GGSRpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLVUkNYX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AD41F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782115925;
	bh=FqQEkPM+u6oWS3l11lDW5Uya8g1eWi5A0wr0M91x+u8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NLVUkNYXMDntWPPjhmvjuFuioG5PEWxueEpL5SS3y9clOq4wHzNmw46IoGnae2W89
	 hmYjhzADgaQh3gOnJbzYZgDcoY9Kb+VWAkFDKC1vKuJby5gxeEXgcQGgapfx71RTPL
	 Z2D7/FflFfn4zLw2MMiVGcZMp0A0kifU3ZflrKg3DEgRUpYYJic67Ci0xVHylotxI2
	 24gs5mBX8lADYPr6tURnntt4b8duzkyv7cKPWGXyLmgJK9EB/6HvV07F7RAnRHc3Gy
	 hACSL+lpc8nSW+DyOLkrt6xfpH86h8GnYc/mY93Bw/pcnAgglUAIInO4fLkT5HlYPC
	 Iv7BDYBvjUvAg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396775c26e0so38976981fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:12:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Dsemw3YCDeu9r3tbUITxuviPj7sjG3IDMGFz8jFLUDcSY9BkMFpr3byYipCCFt/ozpY5XSMDjkhKy@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJw7uersycNdFYF//SfRSvD5cDgx13kG0mB9z7nC25zOOD326
	K+BH66/mGDFFWWCnxuOxFB16mtjQaNnmKkNTnigfLQvHbnuIXUr4Nko2R42mhLfSt7Kw5WeOwUj
	1iDpPMcyz/3DcRRIvAKaQ1dQXUi9Xga4zGxMbpZvP1Q==
X-Received: by 2002:a05:6512:4288:b0:5ad:5073:987e with SMTP id
 2adb3069b0e04-5ad58f4d496mr2795277e87.30.1782115923684; Mon, 22 Jun 2026
 01:12:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:12:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:12:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260620120136.2482872-2-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620120136.2482872-1-sergio.paracuellos@gmail.com> <20260620120136.2482872-2-sergio.paracuellos@gmail.com>
Date: Mon, 22 Jun 2026 04:12:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeDOBUY+rfBq2ncjvaGJ1ebpoAonGzVvdavpAPYL3p-=A@mail.gmail.com>
X-Gm-Features: AVVi8Ccot-G97b4w3YomAlUWE-T2jiKR6KyttO9_NUB08z_QL_nMP7q7HgYPofA
Message-ID: <CAMRc=MeDOBUY+rfBq2ncjvaGJ1ebpoAonGzVvdavpAPYL3p-=A@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: mt7621: avoid corruption of shared interrupt
 trigger state
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38771-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sashiko-bot@kernel.org,m:linux-gpio@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F3F6AD94C

On Sat, 20 Jun 2026 14:01:33 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
> The bank-shared fields like 'rising' and 'falling' are modified using
> non-atomic read-modify-write operations. Since every gpio chip instance
> represents an entire bank of 32 pins, if 'mediatek_gpio_irq_type()' is
> called concurrently for different IRQs on the same bank a possible overwrite
> of each other's configuration is possible. Thus, protect this state with
> 'gpio_generic_lock_irqsave' lock in the same way it is handled in irp_chip
> 'mediatek_gpio_irq_mask()' and 'mediatek_gpio_irq_unmask()' callbacks.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/gpio/gpio-mt7621.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index a814885ccd5d..ceb99641baee 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -187,6 +187,8 @@ mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
>  	struct mtk_gc *rg = gpiochip_get_data(gc);
>  	u32 mask = BIT(mt7621_gpio_hwirq_to_offset(d->hwirq, rg));
>
> +	guard(gpio_generic_lock_irqsave)(&rg->chip);
> +
>  	if (type == IRQ_TYPE_PROBE) {
>  		if ((rg->rising | rg->falling |
>  		     rg->hlevel | rg->llevel) & mask)
> --
> 2.43.0
>
>
>

Can you add a Fixes: tag and Cc stable? I'll queue it for v7.2-rc1.

Bart

