Return-Path: <linux-gpio+bounces-32591-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHIAGsWdqWnGAwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32591-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:14:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E3214435
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 16:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35650306C020
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 15:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A6F3BA230;
	Thu,  5 Mar 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="JuLsbX+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C03BD64D
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723432; cv=none; b=MUIk8LvU57J+1P75SMa2p4sFiVpFL+Vpekh4SqPh0xncmyfn/y8u9szPvFfdoWIjp8yuDIte4mzU9Ch9crY9g0IMabLsOeQ6oUawcrHjcFVY+hgVSkGSOEqVJX65I7SGGcb09ocE2egkKy5dYyEpYKegboZ5Lx1VhsEIlURPAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723432; c=relaxed/simple;
	bh=IlGW7Budi7defIPnBzuAt4N1jMIXIKWXtGk6kTK+i1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdfjJsulNFBg29lFPDwC4bN06PAeaxs6oetayHmQvs2YvEpVAN6Y6aKdETY3Oi0nXOsZPiDeH6jmYUTUG47u79bSmGK4abv7x3mtZXiEiya3JFSojveIuttlWqqHWZNBAGDFc3RRB9si+jVrlfHfeuHG0V6nZJ7J7LmJsD2iXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=JuLsbX+b; arc=none smtp.client-ip=94.124.121.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=IlGW7Budi7defIPnBzuAt4N1jMIXIKWXtGk6kTK+i1U=;
	b=JuLsbX+b+ETpaaNBxvUoJIrap/2zUAaPLKN3KiqVaoqo1kwQ4hEX8kgH0H+oX2gMosUwxELXFuwV8
	 3HU+UGqfok/1VPSxoaeIEQqwd2VaE24PBKuyWXJqWonp/+Y5bpKJ1lMAcTLhSwF1EOdM+SkJdcWrzg
	 A8t+cgGoymNJSr5KKLLvbbxzeLbSQ7CVC3vudgRuUYbdAeM8ZVbP/w2OxA7KY7sw0heNUVuJcuCQqd
	 mZ9yTOdrUMCXiGq9LpCbQJmqeeQCVSCn31pnBud20E/s04RzqjjJmsks3CGj572qI9UZLL26ObcD0Z
	 fQ2KMR6eK8b1aX86CkElDEmw3JS4K6A==
X-MSG-ID: 6d0cbf78-18a5-11f1-b532-0050568164d1
Date: Thu, 5 Mar 2026 16:10:19 +0100
From: David Jander <david@protonic.nl>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, "Rob Herring (Arm)" <robh@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260305161019.09b67af2@erd003.prtnl>
In-Reply-To: <CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
	<20260303133947.1123575-2-o.rempel@pengutronix.de>
	<177254885509.3251575.14819823286886805862.robh@kernel.org>
	<aacH7NmkOzZued0Y@pengutronix.de>
	<20260304-graceful-sweet-bittern-98efdb@quoll>
	<20260304100642.44d00b99@erd003.prtnl>
	<4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
	<20260304112500.4766f21b@erd003.prtnl>
	<98debf2d-cc29-42dc-bb93-ee97439683fd@kernel.org>
	<20260304131731.4d54f051@erd003.prtnl>
	<CAD++jLkK5od7cODqQ2BsEKE7tvp8vVAsv6erLu1dEzcn35F8QA@mail.gmail.com>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4F2E3214435
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[protonic.nl:s=202111];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[protonic.nl];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-32591-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@protonic.nl,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[protonic.nl:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,protonic.nl:dkim,protonic.nl:email]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 13:54:20 +0100
Linus Walleij <linusw@kernel.org> wrote:

> On Wed, Mar 4, 2026 at 1:18=E2=80=AFPM David Jander <david@protonic.nl> w=
rote:
>=20
> > > OK, thanks for the explanation, but then primary function is not GPIO
> > > either, because nothing on linked page says it is a generic purpose I=
O.
> > > It says it is switch detection. Maybe better generic name is then
> > > "pinctrl", thus also "pinctrl" child should be folded into the parent=
...
> > > but switch detection is also not a pinctrl. :/ =20
> >
> > I agree. This chip is indeed not very clear-cut with respect to the cor=
rect
> > Linux subsystem. It could also be an input device if you view it strict=
ly from
> > the "switches" standpoint. I thought about this also, but figured that =
it
> > would be more flexible to just view it as a pinctrl device, which could=
 always
> > be used in combination with something like gpio-keys.c if one really wa=
nted
> > the input functionality. For context, our use-case is primarily for ind=
ustrial
> > control reading digital sensors such as mechanical switches or industri=
al
> > optical sensors, and that is AFAIK the main application for this chip a=
nyway.
> > For this the gpio UAPI is a good match. =20
>=20
> I have read the datasheets and GPIO+pinctrl is the best fit in my opinion,
> mostly because there are a lot of electric properties involved and there
> are industrial use cases, which is a good fit for the GPIO character
> device and the pinctrl+GPIO generic pin config options, some which
> are already identical.

Ack.

Sorry for this following long question to Linus. TL;DR: switch vs voltage
semantics for logical input state.

Taking the opportunity that you read the datasheet and put some thought
into this (thank you!), I'd like to know your opinion on a specific friction
point where this chip doesn't quite fit the GPIO framework exactly (or maybe
it does?):

Looking at the description of the "switch status" register (chapter 7.20.27=
),
it says "A Logic [1] means the switch is closed while a Logic [0] is an open
switch". This reflects the semantics of the switches being the inputs.
Nevertheless, if a switch is in SG mode (switch to ground with positive
wetting current), this means that the voltage level at the chip input pin i=
s 0V
when the switch is closed. If the switch is in SB mode (switch to battery),
then the voltage at the chip pin is positive when the switch is closed.

In other words: the chip reports logic 1 or logic 0 in its input register
according to the state of the switch, and NOT according to the voltage at t=
he
input pin.

The question I have is thus: Should the GPIO driver of this particular chip
report the state of the switch or should it report the state corresponding =
to
voltage at the input pin?

The former would mean 1:1 reporting of the "switch-state" register bits. The
latter would imply having to invert all the bits that correspond to inputs
that are in SG mode, while leaving bits corresponding to inputs in SB mode
without inverting.

I am tempted to think that hardware developers that use this chip might exp=
ect
the GPIO driver to report the state as it is read from the register. But I
suspect that the Linux kernel GPIO framework might enforce strictly the
logical state to be equal to the voltage at the pin (i.e. logic 0 =3D=3D ze=
ro volt,
and logic 1 =3D=3D positive non-zero voltage), but is this true?

Right now the driver inverts the "switch state" register bits accordingly if
SG mode is selected for a particular input, but maybe it is better not to do
this, since it introduces more complexity and replaces the semantics of the
chip with some (mandatory?) semantics of the Linux kernel.

Please advice.

> The alternative would be to create something new in drivers/iio
> which I think is overkill.

I agree.
OT: I think "Industrial IO" is a bit of a misnomer, as this subsystem mainly
focuses on analog IO. If we were to extend "IIO" to also digital industrial
IO, then not only would it collide with GPIO, but probably the upcoming sec=
ond
iteration of the "Linux Motion Control" subsystem would also need to move
there... which is definitely overkill IMHO.

Best regards,

--=20
David Jander

