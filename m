Return-Path: <linux-gpio+bounces-39292-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yYUtJJ7mRGpD2woAu9opvQ
	(envelope-from <linux-gpio+bounces-39292-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:06:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535A6EBE1C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 12:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=luhcVtIx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39292-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39292-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F52303A700
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 10:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7821403AED;
	Wed,  1 Jul 2026 10:01:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C23EEAD0
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 10:01:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900110; cv=pass; b=iIVatjyJB1d/kNNuWXxklOcz4vpc+KK0LkTEx5WjhR/QtJDdwANzfWTp5ROuYSfe+TX4f++EgMGapzf1LYb+4E5cOp7TqkjU2Km/fpZUhx8mQsGs1qI8oFSzJVprVmrlt4sFbX4oi/NisuPZ+6UBki0mpHp72nGrthSpcY4j6+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900110; c=relaxed/simple;
	bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcVTZUTl8H/gTlEc/kDfqBLywLa9ew2ViMmSah2QMwgibF2x6kHboXDoyMzXcYxYsUFNt0227sJ5f5aLQ03/ZYObca1ycPJV92802xbbmG6yjVBIuyjfUJhr7nGTuUt62FkHiZ5l5O6BtLsZZEFoWuZ7UUMKubj30+lh07CM/tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luhcVtIx; arc=pass smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso867830a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 03:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782900107; cv=none;
        d=google.com; s=arc-20260327;
        b=VT5ziyy+IwQxMH++w0uSWdItCUZCrnkfo4uAm95b8Ie/55qCLnpGwZB3rt1XW7K+Q4
         LMI81upDUJcKJ+lnfxHldFZtvikhS5HQMyx4rpX+ggdlNonrJlPBR3JO81puCLtbSa/8
         Mjqh0jj/L9GyECyDM09a1C3/XKrC0MfmrjZ8vHYZdADQOzdmAi+XcEQbhbatzYMtMaTI
         DbUykMh8iH4l3vDeuOWS/ik9H7EhXemhFEyo0WvTqRRyTxb1BHUVMuCFU5bNeroH+t7V
         s7wRPqlTaqtcOlkpcdyjNWE1O0fZEb+5Bfem5dFPrHDadn732NsoM1zUoJdmMKfaGlQK
         ijSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        fh=PGlilgrUwuwiAjjmH6RRMaQYyVn7lugv9MyUkJX9ImU=;
        b=njnImub/eSeQEwmdtY72II0lcW8oi4Ikzsfzd9V0fNa344F9KQ4YCZC13ytoayWwjb
         bNMPIn4DzO/P1nZYc0OdbLfD1ryedUJ1Sf1hQJdjnGTdFSuU2ofDlepJOI8AQI4i6/nD
         ZjmJzntors2T7dz9X+0ZZ3WZ90ux/KFeycNOoUDyp/y0lWWc3r7GnMmssagG4WGhxH/e
         45QjnUQdo16wQZwnlttI0fJAMzo+mJR/xGoHWpROGL9DcqfkHKIk81tP2HlGIvDXbU77
         cHlG+C9TIwoCtr7Ku38rEQjhxWD/B9hO96RkWKc1s19k8teoCZ7Aqr5F6Z58YcvX3G3a
         mY6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900107; x=1783504907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=luhcVtIxtXDBoC5Se65QYH/Vd6YU0Id1WuYpLuLNfpZBMWEoL4kMwRi8j3syUsn3Dg
         1MjgATDpW0X07i2O+IgMiiXB0f9WEcwUre31vcqBwBHDl0Ts7RJw9R94iqFBMm6Hn/6b
         Lp2GJtsAlD5gj2Aj7AvdfMKVRiKn/inwjX/Ct1uu7Ln7wYIdRMegDBUeNKKDX0CHjh9e
         tJCBZ9zW7ll94ele9mlSXTJclf73jepdYY1u5aSs6syX5NKskqZI9VTTpViEB957vvmW
         LrLbPtPnP+MqbNOfWAZyRV6mA+LTKZPnfvflF5XWRCAa/24ru0ROYFIoHTSbsSFxZ+f/
         8wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900107; x=1783504907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqRmgIDfn8JlBVxfbI6Meg6G6wYP2KKDJWJAgquFHVo=;
        b=B1IDXhcSXk0mRY0qSDG/Kyas5FdVAUj8pI2kGb1i0Qj2XHjMKtbTB6FCoDzBai9EIq
         ezqaV8iX/eRYaBFTKgweLX9jDGqTKVrCqUr4q5oJmbo78cxfj0sgFXE5p2kDGYiwkBx/
         5cPlTreFoW1YaFkN/pNSUlNn7c1UUACBoixVcaeuBE/zM+xIT4NjeyDXjhJv9VEuHlM5
         r9GUoyp9N0H92zVNHxqtE3V+qjMvFFA0F1uJh2K4/FxXlyQzE1T4BpAhiuzxyKLyIE2w
         X6F7AykC/dPS41e9yaHSL6kkoWuz/GtjRifHHPR0gYhahrqAr+tBfDphXXfjkl37tY9g
         5fEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGdHcNUoVU/EHJon0JUpYDqZpsM7FgcbGTZbnFDHLIsgzvBYnHtLdaCeRVTLThtrEA/W9mdq8yK8sS@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMRn+r+dC0gjhCIBBL5r8nEoY/uCUmvDLOCHx0X6JcJHkIwhU
	udcknU76fghGEhml3jAGMC1IW7tJjKb6SJXV/NPTUwccxuhYoMYAyIky8Dob8DAcqV+gAjD82aF
	U90HXRC1zKUKPgOw3I0SINQep++qshDw=
X-Gm-Gg: AfdE7cl/Yh9m1axDKiO81kpmZA6wseVJk+LK+ogn6rTL7kHB8rsAJhsa86MsJVyJSRD
	RThmUxR93a1dBliC4bQdMhNqWuUrWb8M7dtx68ED6ONuDMkVRLZU4uph9GNy5x6Z4wm/R6iGRFe
	U49qHJxH0isrWVxW7v75bVeo0mihtvhKufIXqDc49s0TfPC12y5xd1x5aYeKJ+6W58v2khubfLK
	xJ8/Dp4xVi+YWCluqnv6WApsegHCKZuQoGXWq5mcI/6BeowMnZhqA4LDOT9Obn81PdjO3cC8JaY
	cCUH2VI0LQmbnIOwUf6RrUaCBENEMpJ3nu+MBGzP01AV+kKpYnGboa18z/v3TnTqLY9BAwEyadG
	oO3KYUjl3guLs9/JzkUlCSgJJZrhAuBVYOpEa6aeWnEFDDhE1RPeY/ZLqpQ==
X-Received: by 2002:a17:906:b792:b0:c12:7eeb:d2d5 with SMTP id
 a640c23a62f3a-c12aa1affdamr33696466b.33.1782900106941; Wed, 01 Jul 2026
 03:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org> <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
In-Reply-To: <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jul 2026 13:01:10 +0300
X-Gm-Features: AVVi8CfOApAIask00J9b0BLe88oz7fAW8fQFHDlsxs93vuIf3dHnb0iovhmAtW4
Message-ID: <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Michael Walle <mwalle@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"afaerber@suse.com" <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39292-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mwalle@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0535A6EBE1C

On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
> On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org=
> wrote:
> >
> >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot ret=
rieve the
> >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requi=
rements in our
> >> >>> map() function.
> >>
> >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> >> only called if the irq handling is set up via gc->irq.chip and not
> >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
> >
> > Not really, the gpiochip_irq_reqres() is called to mark that a
> > GPIO line is used for IRQ, so the gpiolib cannot turn this
> > GPIO into an output line, gpiod_direction_out() will fail
> > on lines used for IRQ. So it's a failsafe.
> >
> > You can live without it of course, but then you don't get
> > this failsafe.
>
> Thanks for the explanation! So did I make a mistake years ago by
> adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
> ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>
> As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
> to be a gpio_chip, which isn't the case (in general) for an
> externally allocated domain, is it?

So the whole issue comes from the fact that the IRQ chip is not marked
as immutable. For immutable IRQ chips (which all GPIO provides should
have) there is no such issue to begin with, id est there is no
gpiochip_irq_reqres() callback assigned (and respective _relres).


--
With Best Regards,
Andy Shevchenko

