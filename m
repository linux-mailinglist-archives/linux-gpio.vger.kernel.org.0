Return-Path: <linux-gpio+bounces-39311-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z/KqMKb8RGpj4goAu9opvQ
	(envelope-from <linux-gpio+bounces-39311-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:40:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4916ECE8B
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 13:40:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h0tPhmIu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39311-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39311-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C75B03065F12
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 11:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5800D480342;
	Wed,  1 Jul 2026 11:39:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499A48095A;
	Wed,  1 Jul 2026 11:38:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905941; cv=none; b=NiymTEiNh/bSN60uSwDby+cUiMkRu6OPhKx9Dpbfv0rsAs2VS+RUYheAdiTkiBiPLXGfzJ4MJQIA6PYNALTG8Xea7heZqNGvhXHoQnspXsYI2uvIdATcIk+wYxMkLoD8GVEFNsLX0zl/3UloFvrnXi/AAsBHONaFi08oQIh2zEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905941; c=relaxed/simple;
	bh=h9pSgGl8YkLBQ2exZouesGTns5v/BpmUC/xFWMtiDqs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=qkIu64bxnm98uqpgVT6QrBR4osEBWQk6DO6QUnsBr673uKHtmJ2vP4Gegituwf6ey2W4SMZScs5CJZS1LIdStaeNkCSv1Lj3KasBUjXkwlB2TF9jMPB4lZHoZWmpkuX9FWe0WI8XId2WI0mcfxp/89my7S4I5dhtRPeOXOQHZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0tPhmIu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ADD151F000E9;
	Wed,  1 Jul 2026 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905938;
	bh=h9pSgGl8YkLBQ2exZouesGTns5v/BpmUC/xFWMtiDqs=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=h0tPhmIuRQaVWZmQCLWf+J9ulT43fnQMsgoGsDBGPQgsPgKwOU4mn77ycRulCL/js
	 7PuktulmhmiKcJHPpug2x1AhrpH5ktLis70a07NbKQJbqFDeylRNEGfG6j3gtEkBM4
	 XgG+YF2Sc5reZpX/GBjB/D529lGlL2ZocWLe8WKjWuTA+wkPqTKrzd5x1PgS/iAsVv
	 AlsjI67zsaX+egQICbHu+5AtkaSZP+DJWTDdidFfXCeCnk3j8c+3YkHhTeFVaTluPT
	 Sfm5/z98r4P9PvuOA2cFJfQjeKhsMrUoK+fcXAVoiSYJTqVK6m1kHeHllXcsOqyTOj
	 VLZcxtm9LRlWw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 13:38:54 +0200
Message-Id: <DJN7EN61AJGW.2TV8JLMVRFTJ@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
 "wbg@kernel.org" <wbg@kernel.org>, "mathieu.dubois-briand@bootlin.com"
 <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "nuno.sa@analog.com"
 <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>,
 "dlechner@baylibre.com" <dlechner@baylibre.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
 <stanley_chang@realtek.com>, =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
 <james.tai@realtek.com>, =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
 <eleanor.lin@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
 <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
 <akTyDzdrt949VnWK@ashevche-desk.local>
In-Reply-To: <akTyDzdrt949VnWK@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy.shevchenko@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:andyshevchenko@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39311-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D4916ECE8B

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 1, 2026 at 12:55 PM CEST, Andy Shevchenko wrote:
> On Wed, Jul 01, 2026 at 01:01:10PM +0300, Andy Shevchenko wrote:
>> On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.org=
> wrote:
>> > On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
>> > > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.=
org> wrote:
>> > >
>> > >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot =
retrieve the
>> > >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these re=
quirements in our
>> > >> >>> map() function.
>> > >>
>> > >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
>> > >> only called if the irq handling is set up via gc->irq.chip and not
>> > >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
>> > >
>> > > Not really, the gpiochip_irq_reqres() is called to mark that a
>> > > GPIO line is used for IRQ, so the gpiolib cannot turn this
>> > > GPIO into an output line, gpiod_direction_out() will fail
>> > > on lines used for IRQ. So it's a failsafe.
>> > >
>> > > You can live without it of course, but then you don't get
>> > > this failsafe.
>> >
>> > Thanks for the explanation! So did I make a mistake years ago by
>> > adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
>> > ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>> >
>> > As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
>> > to be a gpio_chip, which isn't the case (in general) for an
>> > externally allocated domain, is it?
>>=20
>> So the whole issue comes from the fact that the IRQ chip is not marked
>> as immutable. For immutable IRQ chips (which all GPIO provides should
>> have) there is no such issue to begin with, id est there is no
>> gpiochip_irq_reqres() callback assigned (and respective _relres).
>
> Ah, for immutable chips we put either custom ones or
> GPIOCHIP_IRQ_RESOURCE_HELPERS which actually refers to those callbacks.
>
> So, if the domain is external, it should also provide irq_request_resourc=
es
> and release callbacks. In the custom case we can wrap gpiochip_reqres_irq=
()
> and gpiochip_relres_irq() respectively.

Exactly. And its seems that this should have been possible with this
series, too.

Apart from that, most drivers use regmap-irq with gpio-regmap. For
this we'd probably have to add something to regmap-irq because that
module owns the irq_chip.

> But we need to have a struct gpio_chip pointer for them. And note, the
> IRQ chip data can be anything in that case, so it's not a requirement.

That's what I've meant. Conceptionally, it should be part of
gpiochip_irqchip_add_domain()/gpiolib, so a user doesn't have to
have that knowledge. But I don't see how this could be achieved.

-michael

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakT8ThIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j29wF9F2RjUXkQCFlw9MAhKebih0vk6rnt8RJH
ZVGS/bJEnhLaCTuy3+MEHzj8ym4L4W4SAYDXrMLoVwpYVA+hB0NyniGo6j0kkPTA
T1NARfzcR/ZyvhE6qaERxH1/f+1E21odLOE=
=g4tC
-----END PGP SIGNATURE-----

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056--

