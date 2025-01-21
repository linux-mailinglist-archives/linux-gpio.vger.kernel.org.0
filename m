Return-Path: <linux-gpio+bounces-14963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE00A17AF6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD33161A61
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA15F1E5718;
	Tue, 21 Jan 2025 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mczFHPSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7737D1D9595
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453844; cv=none; b=OLl4BvtBaF3B45YURFQ7lkzbKiTTebfvhiZX0enCxz/TYJr2awXon5Ce5VGDTND8u8HXI+qCP3i0D9WXa4VK7ltJhM20NWPEs4oyLmXWULmw7vicm4eZWD0Dsp1E8mQGnWG+TmzndNQY7rXXi2q3om5iLTD111ymgTPNSr0RJHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453844; c=relaxed/simple;
	bh=Z739xe2Zk4y/33z0NHP9Qtji1lg7PSxSUAI1wFbBcro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qC8sY7tQsWii17SKFh2Pyt+l6bahACq6zxD+Z/QH9kznc6r2xdfzr7/v05/jrVUPXzuxXPc8gcGP8NiCuuVtsA4J2/hqRp3bpcqLNYqx0nYYYRn6KZ/nalaqllnr9gxQFM2BvO15nTevawERj4bYfmkXmyUwCOOR1BAmFoSK7bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mczFHPSU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54026562221so5491300e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737453840; x=1738058640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6/n8hDp7QRArU4O2g/ML/aye8ngcZnZwiazO907zlw=;
        b=mczFHPSUnKwPXJdcdX/dBKpH0rL6NeKEO8C2sfo1rgLua9KfaQ9ifHLH5kl1Jo7fJw
         RElNL1U8M+gwNWxg5bw2X4xb0chjeN/2P6zJZ42qP+eBVdXsxWq/hFVkZ6AgrzM+BVFP
         of4I/Ze6Ma90Kz3XieHMO62iTlWmkVzcG4gdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453840; x=1738058640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6/n8hDp7QRArU4O2g/ML/aye8ngcZnZwiazO907zlw=;
        b=FAGNbIoWGOV22aW9IWDHC4YpuHcGkLYOpmrgNPssvvYwApt+tKmtE/6ou+wIbvN9V8
         kjNaj8JnBwCzNnMIRepdjKNbQ6lq3CVjKu1JcCIYDcisBNuYedw2Yn+fcIonK0bYbKYR
         8/1S9WohmOmBlRXVaDNU45uqq7yEQNQ7kBx8OAKCvnvukWHXfWyIy15ZdGV4JLC1J7kt
         QYsgFEmeh3dFzYQSwa4GyBzGcQCvxNOqw3bh6o18VGukeoIGyNwEZLsanrBo6XuGr5jX
         2us/zFOI6J4sywr14N0qQreZux8TgpfgyPCHCF5uZyirRE+fDM1WvmPd7A5YFrLtTaqr
         solA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ATwk9WyOnwwPWvkpkz5MDw/zavOD+UUcJtiYtIXQ8/HQSQhdsqz0jChPA9r/LtSqSzEAhAShBhsb@vger.kernel.org
X-Gm-Message-State: AOJu0YwFONxpGOlNg7HmTCot/RlWT4MX789rjKzeMy43k9UnOW1RkVBi
	eAEljHhVG9fKOPfPDOntV81VoDRa1SykDmNTYN5DiwU4Przx1TJX1p7Yarn9eG8JjdqNvRqgIzr
	kDqF+slGAFeFPl2jFaJ0pS7ix1Msw66l+HdW6
X-Gm-Gg: ASbGncu+lM0tl2U7dHEFy/YrRVMfmZI9hCdB431nRayOwW4D+hBTomww7ts6dGi1LID
	t+ASbM/U4DhLI0M3ODsHrS9YA+frO2AFS8Dnhe/2nl3aDO5A1XnRyyIgYbmIg1CrzoyUjclaoUe
	yRfw==
X-Google-Smtp-Source: AGHT+IEHkmodUPY8jx3l9mPpOWb5qGvotXrLEwy87UqZLyCSEt+B6PD7M50ngyePU/VJqW5r/Wi7zurFvL6FFAiUMyw=
X-Received: by 2002:ac2:511e:0:b0:542:98bb:5678 with SMTP id
 2adb3069b0e04-5439c248293mr3883356e87.25.1737453840514; Tue, 21 Jan 2025
 02:04:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com> <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org> <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org> <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
 <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com> <8ca2e369be804697ef71491dfd366cf6afcca9bd.camel@mediatek.com>
In-Reply-To: <8ca2e369be804697ef71491dfd366cf6afcca9bd.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jan 2025 18:03:48 +0800
X-Gm-Features: AbW1kva5BWbWh-3Q7_Rq2n5cpf3IRTiqkqz7iCKINLZ1rxFHRVj_riUn5jQd4B8
Message-ID: <CAGXv+5EYMM=hn8nKig3iHqD3KhxHVQyteweL-OiSoCV8mD2iew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
To: =?UTF-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"krzk@kernel.org" <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	=?UTF-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 5:58=E2=80=AFPM Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=
=B7) <ot_cathy.xu@mediatek.com> wrote:
>
> On Mon, 2025-01-20 at 13:42 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Il 20/01/25 10:17, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) ha scritto:
> > > On Thu, 2025-01-16 at 11:20 +0100, Krzysztof Kozlowski wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >
> > > >
> > > > On 16/01/2025 09:18, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) wrote:
> > > > > On Thu, 2025-01-16 at 08:28 +0100, Krzysztof Kozlowski wrote:
> > > > > > External email : Please do not click links or open
> > > > > > attachments
> > > > > > until
> > > > > > you have verified the sender or the content.
> > > > > >
> > > > > >
> > > > > > On 16/01/2025 03:20, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) wro=
te:
> > > > > > > > > +          bias-pull-down:
> > > > > > > > > +            oneOf:
> > > > > > > > > +              - type: boolean
> > > > > > > > > +              - enum: [100, 101, 102, 103]
> > > > > > > > > +                description: mt8196 pull down
> > > > > > > > > PUPD/R0/R1
> > > > > > > > > type
> > > > > > > > > define value.
> > > > > > > > > +              - enum: [200, 201, 202, 203, 204, 205,
> > > > > > > > > 206,
> > > > > > > > > 207]
> > > > > > > > > +                description: mt8196 pull down RSEL
> > > > > > > > > type
> > > > > > > > > define
> > > > > > > > > value.
> > > > > > > >
> > > > > > > > Not much improved.
> > > > > > >
> > > > > > >    I have removed the content related to 'resistance
> > > > > > > value', we
> > > > > > > use
> > > > > > > 'RSEL' instead of 'resistance value'.
> >
> > This is wrong.
>
>   Sorry, I think I may not have expressed myself clearly. What I meant
> is that the attribute 'mediatek,rsel-resistance-in-si-unit' is not
> supported. In the dts, can write the resistance value, for example:
> bias-pull-up=3D<1000>, but can't use 'mediatek,rsel-resistance-in-si-unit
> =3D <xxx>'.

`mediatek,rsel-resistance-in-si-unit` is supported in
drivers/pinctrl/mediatek/pinctrl-paris.c

Angelo is requesting that you continue that support and make it
exclusive, i.e. not support the RSEL macro magic numbers, and
_only_ support ohm values, in the device tree.

ChenYu

> > > > > >
> > > > > > So the value in Ohms was removed? I assume above do not have
> > > > > > known
> > > > > > value
> > > > > > in Ohms?
> > > > >
> > > > >    Yes, value in Ohns was removed, no code have knowm value.
> > > >
> > > > Does the hardware have known value in Ohms?
> >
> > It does.
> >
> > >
> > >    What do you mean by 'hardware'? When writing to the rsel
> > > register,
> > > the value written is 0-7.
> > >
> >
> > Hardware means "the pin controller of the mt8196 SoC" :-)
> >
> > Anyway.
> >
> > The RSEL registers' function is to select a specific resistance value
> > to
> > pullup/down a pin, or a group of pins.
> >
> > Devicetree bindings require to specify values in known units, so in
> > device tree
> > you *need* to specify the RSEL resistance in Ohms.
> >
> > You cannot specify RSEL register value in device-tree. That's
> > unacceptable.
> >
> > Regards,
> > Angelo
>
>  Yes, I understand what you mean. However, I was referring to writing
> the rsel register in the driver, not in dts.
>
> >
> > > >
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > +            description: |
> > > > > > > > > +              For pull down type is normal, it doesn't
> > > > > > > > > need
> > > > > > > > > add
> > > > > > > > > RSEL & R1R0.
> > > > > > > > > +              For pull down type is PUPD/R0/R1 type,
> > > > > > > > > it
> > > > > > > > > can
> > > > > > > > > add
> > > > > > > > > R1R0 define to
> > > > > > > > > +              set different resistance. It can support
> > > > > > > > > "MTK_PUPD_SET_R1R0_00" &
> > > > > > > > > +              "MTK_PUPD_SET_R1R0_01" &
> > > > > > > > > "MTK_PUPD_SET_R1R0_10"
> > > > > > > > > &
> > > > > > > > > +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> > > > > > > > > +              For pull down type is PD/RSEL, it can
> > > > > > > > > add
> > > > > > > > > RSEL
> > > > > > > > > define to set
> > > > > > > > > +              different resistance. It can support
> > > > > > > > > +              "MTK_PULL_SET_RSEL_000" &
> > > > > > > > > "MTK_PULL_SET_RSEL_001" &
> > > > > > > > > +              "MTK_PULL_SET_RSEL_010" &
> > > > > > > > > "MTK_PULL_SET_RSEL_011" &
> > > > > > > > > +              "MTK_PULL_SET_RSEL_100" &
> > > > > > > > > "MTK_PULL_SET_RSEL_101" &
> > > > > > > > > +              "MTK_PULL_SET_RSEL_110" &
> > > > > > > > > "MTK_PULL_SET_RSEL_111"
> > > > > > > > > define in
> > > > > > > > > +              mt8196.
> > > > > > > > > diff --git a/include/dt-bindings/pinctrl/mt8196-
> > > > > > > > > pinfunc.h
> > > > > > > > > b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..bf0c8374407c
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > > > > > @@ -0,0 +1,1572 @@
> > > > > > > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-
> > > > > > > > > Clause
> > > > > > > > > */
> > > > > > > > > +/*
> > > > > > > > > + * Copyright (C) 2025 Mediatek Inc.
> > > > > > > > > + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +#ifndef __MT8196_PINFUNC_H
> > > > > > > > > +#define __MT8196_PINFUNC_H
> > > > > > > > > +
> > > > > > > > > +#include <dt-bindings/pinctrl/mt65xx.h>
> > > > > > > > > +
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) |
> > > > > > > > > 1)
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) |
> > > > > > > > > 3)
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0)
> > > > > > > > > |
> > > > > > > > > 4)
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK
> > > > > > > > > (MTK_PIN_NO(0) |
> > > > > > > > > 5)
> > > > > > > > > +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0)
> > > > > > > > > |
> > > > > > > > > 6)
> > > > > > > >
> > > > > > > > I do not see how you resolved my comment from v1. In v2 I
> > > > > > > > reminded
> > > > > > > > about
> > > > > > > > it, so you responded that yopu will change something, but
> > > > > > > > I
> > > > > > > > do
> > > > > > > > not
> > > > > > > > see
> > > > > > > > any changes.
> > > > > > > >
> > > > > > > > So explain: how did you resolve my comment?
> > > > > > > >
> > > > > > > > These two examples where you claim you will change
> > > > > > > > something,
> > > > > > > > but
> > > > > > > > send
> > > > > > > > the same. I skipped the rest of the patch.
> > > > > > >
> > > > > > >    Thank you for your patient response, here is my
> > > > > > > explanation
> > > > > > > for
> > > > > > > you
> > > > > > > question:
> > > > > > >
> > > > > > >    In v1, I undertand that you meant I didn't sent a real
> > > > > > > binding,
> > > > > > > and
> > > > > >
> > > > > >
> > > > > > The comment is under specific lines, so I said these defines
> > > > > > are
> > > > > > not
> > > > > > a
> > > > > > real binding. You sent them again, but they are still not
> > > > > > bindings,
> > > > > > because they are not used in the driver. Maybe the usage is
> > > > > > convoluted,
> > > > > > so which part of implementation are these connecting with
> > > > > > DTS?
> > > > > > IOW,
> > > > > > which part of driver relies on the binding?
> > > > >
> > > > >    I got you. This binding define many macros, which will be
> > > > > used
> > > > > for
> > > > > 'pinmux' setting in the DTS. The usage like this:
> > > > >
> > > > >    adsp_uart_pins: adsp-uart-pins {
> > > > >                  pins-tx-rx {
> > > > >                          pinmux =3D
> > > > > <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
> > > > >                                   <PINMUX_GPIO36__FUNC_I1_ADSP_
> > > > > URXD0
> > > > > > ;
> > > > >
> > > > >                  };
> > > > >          };
> > > >
> > > >
> > > > That's DTS, not driver, so not a binding. Drop the header from
> > > > bindings.
> > >
> > >    Sorry, I don't quite understand the relationship between binding
> > > and
> > > driver. Driver will parse this macro to get gpio number and
> > > function.
> > >

