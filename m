Return-Path: <linux-gpio+bounces-19258-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 928C8A9A8B9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 11:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7925A3B643E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89C221FD2;
	Thu, 24 Apr 2025 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="qfXoCEr7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DDC221FC2;
	Thu, 24 Apr 2025 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487533; cv=pass; b=NX/BoiD75iDcxvqUltN/rXLPqG3FsRHkwbs0t5Z9v/Am6/LTG/dwgmu7SeAjKCD71ukG7JKo+YY80DwvwSD9jFvPE5z/sp7fxtcuNM15kYc9L+khqyL4e0xRJDbnTOIea7kdbzYlmE6zsujw5oSd8CKQvrnB70khAFfBJ87QhvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487533; c=relaxed/simple;
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGOH46mWuHZYpdivGEW2tTxg+WDr4tE9aNuO5PdoO2CQi7LHhYGkp6FOHgbnDRzGfadRS/u8PAxDwvqiVeGfgJpOGTdSyBqGd1kp2TXsx/jcBw29oFAU17XrVPFJbvpgdLxtr2oLxCl/gcnvO05pHjY/f6ZFIVkGZfYVMsxJQag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=qfXoCEr7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745487507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eWHXAzgrAP0yaKWz/ozs7h3vD4xkghAbBCljuFxWvbfTHCg8bB7O20Wj5Cey7zbwD83bKeATVCQmrgXoymM6Lya2UtsQN7MVx4CMPE2jlMOq7qxFfYhlsV1o2l6RCHhvsRBHLBCJ0YL+0XggR/jwNUTdVAwcSBp5SQRIQEIOGPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745487507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=; 
	b=DHSi6PJJSSdsBNx8Q6gcPlWkCrtC3eJ270kQ1qKiOVODN/qZtPTjqsNtaLHCu1bespcQIaemquGNuv6PKmes98e9jPAOOG1Sgb/ASy2rlDQS0Ubm47nHswRiTtaTHOkv6sUDhR4nh7WSmK9T9NmvTnPXoGtJ8y2MVKmPH9s7E7o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745487507;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=enVte3lTiHlJmRqVD73bg+H5H0csB3a1mMrL205Arz8=;
	b=qfXoCEr7FQ9msjMMk+80tOQFcRYAJOkVcDSabeIUZoB/V4FpBb26CTdSda4LE0yK
	fo9HylKuV1bD8f3fcPUrREMovKRdpXoD0SZQvglA489xMwzcX53UPrSxIX0CFg6WP0R
	InG3nz1h5fZPfi7kHS7WEdueULDPnUm1RVrr3hVHIRicF9XBKTIBdgEAEexu1nBDC27
	aJ0P7cJfdzmwXm1ETWv9rcb/Vsd9WbLzUiT55gu9M7m7ZUzDuF9bZCPvg5oITGjvRnx
	k2U+NrEc1kWJKSqgl+ClkD2WXgVaPMyEPvMhSNqNQaQxHZs07iRaqH3R3Wo9/4iOHTA
	G6TModPKfA==
Received: by mx.zohomail.com with SMTPS id 1745487504141154.190763735755;
	Thu, 24 Apr 2025 02:38:24 -0700 (PDT)
Message-ID: <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
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
Date: Thu, 24 Apr 2025 17:38:16 +0800
In-Reply-To: <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
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

=E5=9C=A8 2025-04-24=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 10:51 +0200=EF=BC=
=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Apr 24, 2025 at 8:20=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wr=
ote:
>=20
> > The JH7110 SoC could support internal GPI signals to be routed to
> > not
> > external GPIO but internal low/high levels.
> >=20
> > Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two
> > virtual
> > "pads" to represent internal GPI sources with fixed low/high
> > levels.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>=20
> As per my other reply in the previous post, I think this should be
> handled internal in the kernel instead using a tighter integration
> between
> the GPIO and pin control parts of the driver and utilizing the
> gpio-specific struct pinmux_ops callbacks.

Well I cannot understand this -- these signals are not GPIOs, totally
not related to the GPIO subsystem (because they're only pinmux, not
related to GPIOs). This is described in my previous mail.

The pin mux of JH7110 strictly route its inputs to its outputs. For
signals from other SoC blocks (to external pins), the registers define
how OUT/OEn of IO buffers *are driven by* the signals; however for
signals to other SoC blocks (from external pins), the registers define
how IN of IO buffers *drive* the signals. (This follows the generic
signal-driving rule that one signal can drive multiple signals but
cannot be multi-driven).

In addition the situation I am trying to handle here is an addition to
the latter part of the previous paragraph -- in addition to 64 inputs
corresponding to 64 GPIOs, two extra inputs, one always 0 and another
always 1 are available to the pin controller for driving other SoC
blocks' input (as output of pin controller).

In fact this is why there is ` + 2` when calculating ival in
jh7110_set_gpiomux() -- the first two possible values are for always 0
and always 1, 3 represents the IN of GPIO0, etc.

>=20
> This solution looks like software configuration disguised as hardware
> configuration.

Well this solution handles these internal wires in the same way as
signals from external GPIOs, excepting specifying special GPIO numbers.
If you are against the principle, maybe the current already-included
GPIOMUX system of the StarFive pinctrl is to be blamed instead of my
small extension to it.

I must admit that the current GPIOMUX system isn't a faithful
representation of the hardware because it's a pad-centric setup instead
of a register-field-centric one, which isn't very natural for input
signals. However configurating the mux in such a way is against people
reading, and we're not able to break the system because it's already
there.

Well in the situation that one GPIO used as input drives multiple
internal signals the pinmux looks a little confusing too, e.g. the I2S
clock situation I mentioned in my reply in the previous revision of the
patchset.

>=20
> Yours,
> Linus Walleij


