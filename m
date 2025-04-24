Return-Path: <linux-gpio+bounces-19271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F30A9AD62
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 14:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26F53B7BB2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF7E25D91E;
	Thu, 24 Apr 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="mXhODf+u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408BD25A334;
	Thu, 24 Apr 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497573; cv=pass; b=YXcrGy0QlgKY5t6lMk8GvV/G/OPpCrUGj6sD8PE+27atPdonVzDALUG8VU3zOwG8L+kNLftTF+/r9SEOsH3NWcQO+lPUW76ieFYMN3RikGcvZSlSfExL4ZxfT6mwuoJWELpJ0t81IteeIPVzwj8kkSWpB65FZNCUasXxXnkqw0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497573; c=relaxed/simple;
	bh=Sbs1+npj6WAlGfBRhvWrInsT1B/Gk04REktMxgJiGtU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qurxc7IyaZqBjfV3R2jIa2fla2AyfIQKujlLPjvCWLoa3VSga1lBwJmzYyHkKO1j/H3KpV2KCjvAAZU+fzCRg47XjLe9T9v6V9hNybKM1nSLPCQr7meAXqI4WJNwmETQT5yPfqdvUsOXjS3By9qrsQoK1dXPSaRtMLE0XTjnUZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=mXhODf+u; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745497551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H8BlMqnIHjw4CtLH/Yn0TapHjcjGiO1ZCjZbGA7DHDc5kXkiVgRN85TRuiASG8O26w67Wiffvf9Y0X6WFhJHEc0Mx929foyfqBMwa26g/mhXOy2fFcAxGI8mXzpa5Guf2iG+/Hjjk95YJlrXGZZtxIStEvWYRpGHA0zEuyQX+9U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745497551; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sbs1+npj6WAlGfBRhvWrInsT1B/Gk04REktMxgJiGtU=; 
	b=PHTFa9PXZFTd4ld+pYXc02qHV3/BfobtI0PxJlLOFW7yvUBdOBZ4NKlvGBw+Rne8DzQG8rA6gAe8S9+Jl5jfVTJiS5n+xo86zyyyJVxcwrNRct064dRRP1EgD/v1IrVaaWV9e+AcQFnG89D1bsLL6Z6E0hTV8e9pBVTZkLeNc/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745497551;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Sbs1+npj6WAlGfBRhvWrInsT1B/Gk04REktMxgJiGtU=;
	b=mXhODf+uc65g+sni/MC1Kpan87oFKEGupVO5z5YJnuEpzrnEjRied3ILx9FCBewQ
	FIkNm/WKYbvLpLiwtKqNQer4y5EEIQ8sq+dSxAGOIQIKTcS9NIwr2H1YPp0yDLL58nx
	y3VPQ/hCnmXXS0KUxWnmf5wTyD5Y02gBpF2PDxDRjLew8ro/LtFG0RFVWWFgUraJDNp
	UlhAvoIiODexWA/3YF0UsdbD7duRpXsLxl4y+6oWbwbXYuxl4q06jZuxaVYagtne6gr
	RW3d0NA64yDkbV511walU0Gu0sV4SMqjrI0OAt/cqkjiDH2GSlZf+iSoqx/D/ZEZNDH
	pqgb9wS7OA==
Received: by mx.zohomail.com with SMTPS id 174549754871497.68482437052171;
	Thu, 24 Apr 2025 05:25:48 -0700 (PDT)
Message-ID: <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Thu, 24 Apr 2025 20:25:35 +0800
In-Reply-To: <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
	 <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
	 <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-04-24=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 12:30 +0200=EF=BC=
=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Apr 24, 2025 at 11:38=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me>
> wrote:
> > =E5=9C=A8 2025-04-24=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 10:51 +0200=EF=
=BC=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, Apr 24, 2025 at 8:20=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me=
>
> > > wrote:
> > >=20
> > > > The JH7110 SoC could support internal GPI signals to be routed
> > > > to
> > > > not
> > > > external GPIO but internal low/high levels.
> > > >=20
> > > > Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two
> > > > virtual
> > > > "pads" to represent internal GPI sources with fixed low/high
> > > > levels.
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > >=20
> > > As per my other reply in the previous post, I think this should
> > > be
> > > handled internal in the kernel instead using a tighter
> > > integration
> > > between
> > > the GPIO and pin control parts of the driver and utilizing the
> > > gpio-specific struct pinmux_ops callbacks.
> >=20
> > Well I cannot understand this -- these signals are not GPIOs,
> > totally
> > not related to the GPIO subsystem (because they're only pinmux, not
> > related to GPIOs). This is described in my previous mail.
>=20
> OK sorry if I'm a bit dumb at times :(
>=20
> I guess I was falling into the common confusion of "something named
> general purpose" such as your GPI and GPO registers, is also
> related to GPIO which it is not, at least not always.

Ah, sorry, these GPI/GPO names are directly taken from the StarFive TRM
from the register field names. They CAN be routed to the external
GPIOs, but is not required so.

>=20
> > The pin mux of JH7110 strictly route its inputs to its outputs. For
> > signals from other SoC blocks (to external pins), the registers
> > define
> > how OUT/OEn of IO buffers *are driven by* the signals; however for
> > signals to other SoC blocks (from external pins), the registers
> > define
> > how IN of IO buffers *drive* the signals. (This follows the generic
> > signal-driving rule that one signal can drive multiple signals but
> > cannot be multi-driven).
> >=20
> > In addition the situation I am trying to handle here is an addition
> > to
> > the latter part of the previous paragraph -- in addition to 64
> > inputs
> > corresponding to 64 GPIOs, two extra inputs, one always 0 and
> > another
> > always 1 are available to the pin controller for driving other SoC
> > blocks' input (as output of pin controller).
>=20
> OK ... maybe I get it now.
>=20
> > > This solution looks like software configuration disguised as
> > > hardware
> > > configuration.
> >=20
> > Well this solution handles these internal wires in the same way as
> > signals from external GPIOs, excepting specifying special GPIO
> > numbers.
> > If you are against the principle, maybe the current already-
> > included
> > GPIOMUX system of the StarFive pinctrl is to be blamed instead of
> > my
> > small extension to it.
> >=20
> > I must admit that the current GPIOMUX system isn't a faithful
> > representation of the hardware because it's a pad-centric setup
> > instead
> > of a register-field-centric one, which isn't very natural for input
> > signals. However configurating the mux in such a way is against
> > people
> > reading, and we're not able to break the system because it's
> > already
> > there.
> >=20
> > Well in the situation that one GPIO used as input drives multiple
> > internal signals the pinmux looks a little confusing too, e.g. the
> > I2S
> > clock situation I mentioned in my reply in the previous revision of
> > the
> > patchset.
>=20
> I guess what rubs me the wrong way is why the external users
> (devices, device drivers or even pin hogs) cannot trigger the chain
> of
> events leading to this configuration, instead of different "magic"
> configurations that are just set up in the pin controller itself.

Well I am just extending what's already in use...

Currently it's already supported to route GPIOs to GPI signals, I added
the support to route fixed level sources to them, in a similar way.

If any external users ever have the need of banging the internal
signals instead of tying it fixedly, maybe switching between different
pinctrl configuration sets is enough? (Because this kind of operation
could never be as high speed enough as real hardware pins)

>=20
> But if you are positively convinced that there is no other way,
> I guess I have to live with it.
>=20
> Yours,
> Linus Walleij


