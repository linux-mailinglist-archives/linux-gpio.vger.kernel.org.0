Return-Path: <linux-gpio+bounces-25150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C4B3A9C1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9315D17E580
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD8526FA6F;
	Thu, 28 Aug 2025 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sV3S9goY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6852236F3
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405162; cv=none; b=dzZyMeXEVPcv8QQ17lAIwICsAF9/re6SaqhoMFmoxJo8EiNR7PWtZ1z/cunGDO0cRts93UwqkpG95NtrLKD+mWFmmpYZHuVlVLJRuzoeC2QQgHytL6+KliJ1kUJgfSEM3/r86Pgq5ukZqvaiOyQWioIMKksbdCQI17HqnujAZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405162; c=relaxed/simple;
	bh=jSRAPGlaacLCN8IweNZh4ovq/ER2fHwcytIyHUy6LpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0vqWbbg5u9CNQ0LLm/Vz8+chVLI4PeCnk308C3mnUSVNS9R+dR01MqdlOKW8FZUlrAphUNxa7JZ3PxnTr/Sg4bChZxVkklr3CoFPUeKLuzQo1AuKDUwyHigSMMEbnGZoINd9Vxr/vMdB5MCAmFPi+Hxnv/Fon9RVcfELnzaqrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sV3S9goY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336af63565dso4545331fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756405158; x=1757009958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8WCzP5XruJZcY+aCROX20DDrThlC8LXbUjIf1UiM2s=;
        b=sV3S9goY3NPAf5ctpK7jz0PvMJ5CZF+mdIgh/lZbNZTdmuxyIjxQWmKkd6mH2z48bh
         8t4LlF2hKGblupZPWyhKD5ZB00sDHXHWvLkt5kT1IODEB4wBC4mOThflyKB0SRQhjquQ
         JO9iwRWImL7WdLxae73B+vTYVVz2HI0rN7L7tVyuzQXCgDy1mOGhrBkaXHlJBMPrLrVn
         zTHuY3nnSfUfIPPSMTkJxNnVXwgt8PhwihTeoGwNd70zJJjWoE4E3B/o4cLNuoj8pCJw
         8EZgp4ZoioWvjcwmIkEpPXW9mTFSC49IJO5QVSX80wVn8dva9fAVBGV6GD0f6nPX7XXL
         eCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405158; x=1757009958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8WCzP5XruJZcY+aCROX20DDrThlC8LXbUjIf1UiM2s=;
        b=WzSiT3UDA9JuZn2GjxdshGpHErxqigAmz6qQftVXRKxaVtRD5ABlsejSr41qK3QlNF
         FzG8VbzcXuHkBCfj11q+l1+YSXV8SlQGzjZrG2JRllsuV6x872wh4z3kmi1YlIsPOfzW
         XVynuv6OUJB1rsTcx4kAbPtxrvB78k/MjB4oc5Ax+hhnk7TatuvkgZu/w4suSee9ucNN
         IEnsPXT6B9mACb+GzgVVtbQaPdHFLdG/+MQvO7hQWuSpF2vpzjVXIhOcBcs4tZjGkJw4
         Qq3mvYxxPJVBsKV+5wUYqluaXKzIXSTkW0FOMXMkG5OUCRix2+3HhF+vwjld++qX9h7Y
         kyeA==
X-Forwarded-Encrypted: i=1; AJvYcCVKWpvWvRTgGG7eaLu4BrU9XWIO/vRCeRfSxFq0u7ChzrPe8Z2J2xsVf7YsTh1xPd7X9ngGIYtqrhTq@vger.kernel.org
X-Gm-Message-State: AOJu0YwCqXeXnGdy2m4c91tuzyCzWePcAo6BLwo+2T42rlepQyrzq/6h
	TBrqrETRdpoZF5BY5wT2AdKkQvKNjCTLgPNXXqfPF3rw7uNcABlQeES/3mTk9NK5beDFg4d4KsR
	i9iXWEkdf7Cat1wfpwaGaB92bkcjRUGTgrJ5JLqEeOQ==
X-Gm-Gg: ASbGncsNeKUWIhiraQllC++h3iSvVADysq7IFE1Nt3hEl5pNUwSsYfaOTbMQWoayUkw
	Iv6C0/GJLJI5PZ84+2a7dv1eOyqV53luRswx9KSbyMMpzCM5I6BBM5a9GqPVXxGi6z2EjIxdYgh
	f6OEBC52VhS6Na7Vw+nGIA1WK//kLtNE2Q7cj3qwZGZlBtYnMz0jia3OTt4eidor6X2W4MkbwtO
	qSB/qE=
X-Google-Smtp-Source: AGHT+IH1DSJZGXknSzW6wH3w+Axy81DzZxfZ0orRS3bzF7NdL/MqGTEERDxVjp0WltcO4vKqnpq+IlyPKB7YEvEtM8Q=
X-Received: by 2002:a05:651c:f04:b0:332:4528:c0e0 with SMTP id
 38308e7fff4ca-33650f40230mr73400651fa.32.1756405158218; Thu, 28 Aug 2025
 11:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com> <0fa7e2cb-fa0b-4f9e-84d6-a4b2b3d8a4cf@kernel.org>
 <PUZPR06MB5887D9A879D16DC6A8C8ED58EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <25283b66-4cbb-4db9-9b1e-7a4e6e3db2a1@kernel.org> <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887887C93BFF42BC8417D96EF3BA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:19:07 +0200
X-Gm-Features: Ac12FXwRlxWLxClpU7dqWEVAoO6fz9nruFt5m8l0uHGvpyxmXFRxpd6jlKHnWxY
Message-ID: <CACRpkdYC-3qybKW7VH5MVfBc3oqSrOa2RTt1Q=p=HHsi5drGOQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvM10gZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBjaQ==?=
	=?UTF-8?B?eCxza3kxLXBpbmN0cmw=?=
To: Gary Yang <gary.yang@cixtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

thanks for your patch!

On Thu, Aug 28, 2025 at 10:58=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> =
wrote:
> > On 28/08/2025 07:37, Gary Yang wrote:

> > >> Whats the difference between? You have entire description field to
> > >> explain this but instead you said something obvious there.
> > >>
> > > Cix sky1 has three power states. S0 means work state. S3 means STR st=
ate.
> > S5 means SD state.
> > >
> > > The pin-controller on sky1 has two power states. They are S0 and S5.
> >
> >
> > State !=3D device. Please create bindings for devices, not states.
> >
>
> Sorry, maybe I didn't explain it correctly before, and then make you misu=
nderstand
>
> There are two pin-controller on sky1. One is used under s0 state, other i=
s used under s5 state.
>
> They are two devices

Just explain this in the description: and everyone will understand what
is going on. Since "S0" and "S5" can be easy to confuse for "states"
it is extra helpful with some extended descriptions.

> > >>> +    properties:
> > >>> +      cix,pins:
> > >>
> > >> No, use generic properties from pinmux schema.
> > >>
> > >> You should also reference it.
> > >
> > > Did you suggest us to refer to
> > Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml?
> > >
> > > Make us support drive-strength, bias-pull-down properties?
> >
> > and pinmux. There is a standard pins property.
>
> Ok, I see, try our best to support standard

Unfortunately many pin controllers have forged ahead
with custom foo,pins =3D <....>; settings where they set up
mux and electrical config by OR:in together different bits,
and then they just poke this into some registers.

This isn't very helpful for users.

I initially wanted all functions and groups to be strings
and then to associate groups with functions using
strings in the device tree.

But I have realized (though much pain) that many developers
don't like this. They want a magic number to write to
a register to configure a pin, because their hardware
has one (or several) register for each pin.

So nowadays the most common is to use a compromise.

A magic number in the pinmux property to set up the muxing.

For example:

arch/arm/boot/dts/mediatek/mt7623.dtsi:
pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
               <MT7623_PIN_76_SCL0_FUNC_SCL0>;

Then the electric properties like bias-pull-down; to set
these on the state:

        i2c0_pins_a: i2c0-default {
                pins-i2c0 {
                        pinmux =3D <MT7623_PIN_75_SDA0_FUNC_SDA0>,
                                 <MT7623_PIN_76_SCL0_FUNC_SCL0>;
                        bias-disable;
                };
        };

This is a good compromis becaus it looks similar on all
SoCs and you see immediately what is going on: we enable
SDA0 And SCL0 and disable bias, so there must be external
pull-up resistors on this bus since I2C is open drain. Very
easy for an electronics engineer to grasp, they don't need
to be computer engineers or device tree experts.

Yours,
Linus Walleij

