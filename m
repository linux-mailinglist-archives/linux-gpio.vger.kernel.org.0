Return-Path: <linux-gpio+bounces-26741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10EBB202E
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 00:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B4A17AE198
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 22:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D07F311C14;
	Wed,  1 Oct 2025 22:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TR64NXoi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B082877E2
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759358614; cv=none; b=oBztmvqZiz6lur96kVV38+Lg9ZX8NYQaxBazSllcyJEpB21E5EWngl4QRawuIusumDRO7PnYq/X+Hatt7WLK3QQU2is1QazLN+7Qu3ksfqh1c/f3dcl08VzORIXDVmn33FI2JPzirfYAotzXdXclgs0a7/XqIbvJIFIOnoDaHXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759358614; c=relaxed/simple;
	bh=UOQdDoYVPk5MuVZO/y+CTYfvq/YX4f2qAPDfmLt+6/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jX3/oUqZSfPjlyuEEB5aA+haKPffCsNooC98Ru/K6pRUYJen4G/AKCvHuHpBpoT6+osAKBKDZ3Aq5Kwsl3+dRQvEbvzTZoDcj1e++hL7zPvyt7+167Y6piqIUy3seG4ODnvRZoJl8OYK0JNAMA7QLy/K0vw1jrEry18i154B2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TR64NXoi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-58af7f8b79dso271386e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759358611; x=1759963411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJlkWvrAVlj+yQaLRTA96ZrQDqsxK1wvi2JnIevLfeg=;
        b=TR64NXoi2duwyG0ZBX+hTmYz8YJp5zzlFF4Z0+5RUTWhopw0ONPzLDN3zaZUW/jUvp
         ZauD6qtBn9BrcnL1wEgEdQM5JZ9iJgGyw81TAMBXPJTavVwiyiOHPYEOuFSjjfEUMwoz
         ohnwLRR4PunZgbMOeSpEivAedZ/tcjrrzoXpVeT/FymiQhlmDjlnC0RIlyTGRXBPx5Q3
         4szlglLBnDBXjNFga3r/j8+lmsm3JngBOwWGgUHDtojzeq4tTm6WnMijoNcbvlCLSiSw
         OcrXUftpsB9LiEeNrH4+XHpE70uwLcJrKYyVuyNwksue4S74l8jelMa85e6x9MMYoo0A
         C4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759358611; x=1759963411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJlkWvrAVlj+yQaLRTA96ZrQDqsxK1wvi2JnIevLfeg=;
        b=ZwuXxI4ozFMypKthtcvGpi34EdFQaY87GmU8JJzuJj6zmT1tiMqrM2pvIgDaaM+zSb
         QRAHfDgsJ161VOzr4Ou2Nf0TDulEDAxrlFSR+4x5f5ND+NHZzOJXNut7bIpSajdtdbyR
         yqFP+rI9ulwTU7CyG3tmb0FLHMxBQapq6rED8H/6aQzGf+/t/vy3NKAH9DfuSewDGJKa
         ti1LS8BWfeFPlVFzbVj6Qy5zbBqu0VUOGq76Rm4qVIAN9Colw6U6xIvmr0CGEqeEYluS
         AecTxIc7B+REsw1JUBywlzh8fppNZMlaEz8/T6QhoCrh9tm+Hop9NzigIx8jIzVM6cIB
         JZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVdrI14UWSwCdz50upUbnlRuje9YaaMri4+6idfg6dxTCr/EvA6W2PHiVCJzzjW2H70AGGBmMWwgR7r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QLpXnvxK87jFLFZGJZXZ7UXHZFLAz4nLgVrBFiWsRANf/eA5
	mueYpr1V0Ne8H68qoATyo+K70v2e35xY3tXXgy7fPW2YNS/o3ijAKvE0Ct6WVuCSeC2fQmxf0qY
	w2pHJ8JuhcZr+MVI+uBtPnlHFUaJNFQCJXzpFj1quNw==
X-Gm-Gg: ASbGncsAFSxkA7KX1j0rriztiF8fA6vTs6Td0I49fD4Z00uAoBa5jQ16PIrFdI5cN3V
	Lxgdm1zt04Idi59JT9AY1Ioax9q51jPA1xb32RfcuFBruEluSUupOmvvTfUGs40UvcKodmS9hpj
	afBRjjvpplrEF4NP5EUMhjl17Nxt45Dx53sF4W/nV8UYQzUe5bMhmEcyugPK3cyCzHqDP453MEx
	xGHdkJJ9N5oAYC9V5a5RYkqCehKORg=
X-Google-Smtp-Source: AGHT+IFdKM5xbgBHrlutRdp/DdOPN4lLh19uK4jLc2UrL7m+ouIpIDPcsf+/ShVSFNC9EZgXpRm4hlxAMqIcQ3SPUrc=
X-Received: by 2002:a05:6512:3d0b:b0:578:3df8:7673 with SMTP id
 2adb3069b0e04-58af9eff3d6mr1450030e87.19.1759358610851; Wed, 01 Oct 2025
 15:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
 <CAHi4H7HLNu9YV8+dXshFigvjfMrYL+kGz5xWwab8L1nnefohaQ@mail.gmail.com>
 <CACRpkdaAUXpYi7Z+zgZDhLiJiSUAndLhPMA5YOvnk2GGYOoj4A@mail.gmail.com> <CAHi4H7EzydzKRZPMM-VGOJ8A2RxfEYb5umuBvBEceiwj-8KTrA@mail.gmail.com>
In-Reply-To: <CAHi4H7EzydzKRZPMM-VGOJ8A2RxfEYb5umuBvBEceiwj-8KTrA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Oct 2025 00:43:19 +0200
X-Gm-Features: AS18NWCTOhQMyUgnvLwAyIlqNw1Y9SpvK2SAJcfaUqnrHN3YwY3r_5sXqWNxV3I
Message-ID: <CACRpkdbmM0nND05ODmEa4J2y6JS6getB9s7h9TXywyED5gqh0A@mail.gmail.com>
Subject: Re: [PATCH 0/6] pinctrl: bcmbca: Refactor and add BCM6846
To: William Zhang <william.zhang@broadcom.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 7:38=E2=80=AFPM William Zhang <william.zhang@broadco=
m.com> wrote:

> > But if you can generate say 6846_pinctrl.dtsi, I guess from some
> > HW data that the public has no access to, then why can't you
> > generate bcm6846.c with the same contents as C structs?
> >
> We could but we don't prefer to do that because we want the driver to
> be generic and not requiring any change to support a new chip

But you will be generating big DTSI files.

And it is not really the ambition of the device tree to be used as a hardwa=
re
abstraction layer containing a lot of per-SoC information. The device
tree is supposed to describe and configure the hardware, not
abstract it. There is a difference.

(The DT maintainers can hit me in the head about this but I have
certainly heard things like this before.)

Alas, there is no hard definition of what this means and indeed
some drivers in the kernel does define groups and functions
in the device tree instead of using C files. So that happens too.

> You are absolutely right that the current dtsi does not group the pin
> properly for certain interfaces such as i2c. The tool has the same
> goal to combine interfaces in the group whenever possible. It is just
> we don't have the correct group config for certain interface when
> generating the dtsi.   If I fix all these group issues and provide the
> new dtsi files and I will be the contact if you have any question
> regarding generator files,  would it be possible for you to use and
> upstream that driver?

I assume you fear having to follow the pattern and hand-code
a C file for every BCA SoC and never get done. I understand that.
Also I try to live by the stance "rough consensus and running
code" and not be too strong in pushing things my way.

We can do this if the files follows some basic process.
You still need to use proper bindings.
This:

>         rgmii_pins: rgmii_pinmux {
>             pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
>             function =3D <1>;
>         };

This isn't proper bindings.
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
describe the bindings you can use.

properties:
  function:
    $ref: /schemas/types.yaml#/definitions/string
    description: The mux function to select

  pins:
    oneOf:
      - $ref: /schemas/types.yaml#/definitions/uint32-array
      - $ref: /schemas/types.yaml#/definitions/string-array
    description:
      The list of pin identifiers that properties in the node apply to. The
      specific binding for the hardware defines whether the entries are int=
egers
      or strings, and their meaning.

  groups:
    $ref: /schemas/types.yaml#/definitions/string-array
    description:
      the group to apply the properties to, if the driver supports
      configuration of whole groups rather than individual pins (either
      this, "pins" or "pinmux" has to be specified)

  pinmux:
    description:
      The list of numeric pin ids and their mux settings that properties in=
 the
      node apply to (either this, "pins" or "groups" have to be specified)
    $ref: /schemas/types.yaml#/definitions/uint32-array

  pinctrl-pin-array:
    $ref: /schemas/types.yaml#/definitions/uint32-array

function cannot be a number like that, it is intended to be string such as
"spi" or "uart0".

E.g.

         rgmii_pins: rgmii_pinmux {
             pins =3D <42 43 44 45 46 47 48 49 50 51 52 53>;
             function =3D "rgmii";
         };

This also makes sense for at least BCM6846 because the include file
have things like this:

        b_wan_early_txen_pin_4: b_wan_early_txen_pinmux {
            pins =3D <4>;
            function =3D <1>;
        };

        b_wan_nco_1pps_sig_pin_6: b_wan_nco_1pps_sig_pinmux {
            pins =3D <6>;
            function =3D <2>;
        };

Completely different function numbers, still both are related to WAN,
which is what pin control refers to as a function.

I do understand that the "function" number is actually just a mux setting
for that pin. But this isn't very standardized or very helpful.

Also, we don't really want to see more custom properties such as
brcm,function  =3D <2>; here either.

What you can do, if you insist to just use magic numbers is to combine
them.

#define BCA_PINMUX(function,pin) ((function << 16)|pin)

         rgmii_pins: rgmii-pinmux-pins {
             pinmux =3D <BCA_PINMUX(1,42), BCA_PINMUX(1, 43),
BCA_PINMUX(1, 44) ....>;
         };

This type of pattern in creating per-pin 32bit values in the pinmux
attribute is acceptable and found in other drivers, and the driver
can then decompose this and use it to poke the registers.

If your tool can output something like that then it can be done.

Yours,
Linus Walleij

