Return-Path: <linux-gpio+bounces-38098-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fzz2LJDXJmo+lgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38098-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:54:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9458657954
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eYgNgmKS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38098-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38098-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7651C303BA04
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EC73CF02D;
	Mon,  8 Jun 2026 14:41:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8B3CCFB2;
	Mon,  8 Jun 2026 14:41:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929673; cv=none; b=SDYr/nKBe5Ke6jE2SI71spq/KI/PcPFEmtNHLGqd5PlG+dBsjWoJ6T3wtvmaSO4eD0R26XD0a3GA1s00qTFCECdGvMaDCwDZEMid9Ed98l/UqqBUBstzFWFvZSILvaSdgQNqkTVXfpe4z9gM++d+ayh16OucswjhjhiRQQh7Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929673; c=relaxed/simple;
	bh=fE1b9m6X8tZfpvHfiMJ+gOS3cPimN0u2PkMXjJQx/Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Fx0WJY9leRl4YeHz5mmYMXbFpsUJ5DD0CYqpN1IScSbcW/R5IAy+iZ0dIJwHQgk8xftqlWWGYaThg93RbW1fUbZxNCLeEtCGnnFpWJmLq7w6HNfHeXIYQ5TUH/tPd1vua46rjUGn2TAKYV9WSaHyy6wCwFdhzn2n6/Iyq1tGyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYgNgmKS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BCD421F00893;
	Mon,  8 Jun 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929672;
	bh=L9ZUAyPA++9VU0oc6CUX2aYB7mPcCRmX32/6vz2s6h8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eYgNgmKSz8+8vUuSqQLqjGrIl5qnT7M50Z/l7zNFcZI6k+OTPILcDfXGjawgWrhHB
	 DPTjMxWmNUGswh8HlOQkYtyl7NQobtkFASCTBzwVdl6BdxHJERevU6fsS12SS17T50
	 /I9GXjvrHcJRc3rKD95RM34f36WJq5cj50yDXzt4HJhOx2NQl5DO0YiA4ccBhNzE3M
	 5ZcTuULoOuKVYVNYdaaXKo+IAZYqBUZLRA2MF3U76/VUMl7ue22RAEFaMTUk+grOKo
	 XuMS4MZA9OkL3AVLDuKPZFSTPTtu0r15VKgPdI73Yx2n8CiaTbOoKssberufKbUKSV
	 U+yhd0NpMJdGw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ab88639452d187061230192ab1490bf4846f6d9975e50bf2597a3d568188;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 08 Jun 2026 16:41:08 +0200
Message-Id: <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com"
 <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
 <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org"
 <andy@kernel.org>, "dlechner@baylibre.com" <dlechner@baylibre.com>,
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
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38098-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9458657954

--ab88639452d187061230192ab1490bf4846f6d9975e50bf2597a3d568188
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 8, 2026 at 4:10 PM CEST, Bartosz Golaszewski wrote:
> On Wed, 3 Jun 2026 02:34:40 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
>> On Mon, May 25, 2026 at 12:04:09PM +0000, Yu-Chun Lin [=E6=9E=97=E7=A5=
=90=E5=90=9B] wrote:
>>> > On Tue, May 12, 2026 at 11:33:12AM +0800, Yu-Chun Lin wrote:
>>> > > Expose an accessor function to retrieve the gpio_chip pointer from =
a
>>> > > gpio_regmap instance.
>>> > >
>>> > > This is needed by drivers that use gpio_regmap but also manage thei=
r
>>> > > own irq_chip, where gpiochip_enable_irq()/gpiochip_disable_irq() mu=
st
>>> > > be called with the gpio_chip pointer.
>>> > >
>>> > > Add gpio_regmap_get_gpiochip() to allow drivers with complex custom
>>> > > IRQ implementations.
>>> >
>>> > Hmm... Can't we rather add
>>> > gpio_regmap_enable_irq()/gpio_regmap_disable_irq()
>>> > that take regmap or GPIO regmap (whatever suits better for the purpos=
e) and
>>> > do the magic inside GPIO regmap library code?
>>
>>> Thanks for the review! I apologize for the misleading commit message.
>>> The real reason I need the struct gpio_chip pointer is to properly set =
up a custom
>>> IRQ domain. Our SoC GPIO controller is quite complex. It routes differe=
nt trigger
>>> types to multiple parent IRQs, which doesn't fit the generic regmap_irq=
 framework.
>>> Therefore, we have to create our own irq_domain and pass it to
>>> gpio_regmap_config.irq_domain.
>>>
>>> The core problem occurs inside our custom irq_domain_ops.map() callback=
:
>>>
>>> static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int=
 irq,
>>>                                 irq_hw_number_t hwirq)
>>> {
>>> 	struct rtd1625_gpio *data =3D domain->host_data;
>>> 	struct gpio_chip *gc =3D data->gpio_chip;
>>>
>>> 	/*
>>> 	 * The second argument MUST be struct gpio_chip *.
>>> 	 * If we pass our custom data structure here, the kernel will panic la=
ter
>>> 	 * in gpiochip_irq_reqres() when it calls irq_data_get_irq_chip_data()
>>> 	 * and strictly expects it to be a gpio_chip.
>>> 	 */
>>> 	irq_set_chip_data(irq, gc);
>>>
>>> 	irq_set_lockdep_class(irq, &rtd1625_gpio_irq_lock_class,
>>> 				&rtd1625_gpio_irq_request_class);
>>>
>>> 	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_i=
rq);
>>> 	irq_set_noprobe(irq);
>>>
>>> 	return 0;
>>> }
>>>
>>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve=
 the
>>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requiremen=
ts in our
>>> map() function.

Why is gpiochip_irq_reqres() called in the first place? Isn't that
only called if the irq handling is set up via gc->irq.chip and not
via gpiochip_irqchip_add_domain() like in gpio-regmap?

>> This is all good and needs to be depicted in the cover-letter and/or com=
mit message.
>>
>>> Before I send a v4, I see 3 possible paths:
>>>
>>> Option 1: Keep the accessor (Current v3 approach)
>>> We keep gpio_regmap_get_gpiochip() but I will completely rewrite the co=
mmit message
>>> to explain the custom irq_domain_ops.map and lockdep requirements.
>>>
>>> Option 2: Let gpiolib create the irq_domain via gpio_regmap_config
>>> Instead of creating the irq_domain in our driver, we add all necessary =
IRQ fields
>>> (irq_chip, irq_handler, irq_parents, etc.) into struct gpio_regmap_conf=
ig. Then
>>> gpio-regmap.c populates the gpio_irq_chip structure before calling
>>> gpiochip_add_data(). This prevents an early return and allows the core =
gpiolib
>>> (gpiochip_add_irqchip()) to automatically create the irq_domain for us.
>>> Drawback: This adds a lot of fields to gpio_regmap_config and might vio=
late the
>>> original design philosophy of gpio-regmap.c (commit ebe363197e52), whic=
h explicitly
>>> states that it does not implement its own IRQ chip and delegates it to =
the parent
>>> driver.
>>>
>>> Option 3: Drop gpio-regmap entirely (Revert to v2 approach)
>>> Currently, all drivers using gpio-regmap (mostly simple CPLDs and exter=
nal I/O cards)
>>> use regmap-irq to get their domain. Since our SoC has a complex IRQ rou=
ting scheme
>>> with multiple parents, maybe gpio-regmap is simply not the right tool f=
or this
>>> hardware, and we should just implement a standard GPIO driver directly =
using gpiolib.
>>>
>>> Which approach would you prefer upstream?
>>
>> This question to Bart, Linus, and poissibly gpio-regmap stakeholders. I'=
m not sure
>> that my personal opinion will be the best fit here.
>>
>
> My preference would be for #2 but I understand that this could risk getti=
ng
> stuck in endless bikeshedding so I'm fine with going #3 with potential fo=
r
> future refactoring if we have more similar users.

Yeah, I'd like to keep that stuff out of gpio-regmap. But I'm on the
same boat regarding the refactoring if we have more data and
potential users.

-michael

--ab88639452d187061230192ab1490bf4846f6d9975e50bf2597a3d568188
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaibUhBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hoHwF+L2/C0SzzRn4Jx1XywdW3IuoaQvOH/CyM
tM+DiaJqPgiaiQHKQPw34Zd2pdQ6KAWfAX4i8MWoU3pRuIBrOY9/uz1/yXmfdz0h
BO8TtdBsdvvFAiFlxOBrtRXZDI/pOWJBA7U=
=N+gM
-----END PGP SIGNATURE-----

--ab88639452d187061230192ab1490bf4846f6d9975e50bf2597a3d568188--

