Return-Path: <linux-gpio+bounces-22829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B4AFA60F
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 17:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE871785EC
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52742877DD;
	Sun,  6 Jul 2025 15:04:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B61136E;
	Sun,  6 Jul 2025 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814294; cv=none; b=k/6Pmk8FlIH9O4PVERH5sEFuHTHYHbJlWbf8s8ksm1wDtictfe7gnlqgFbOpsv1rb4yvFc0PE20iAopqmgDjzCsJ4XW9/D6ZVHqdPNLlzcljtnJ1p9sMjd820Bv1Exkga5O+u0jFpUWQgX6VNLm/d4c3EPDltvWWumRCPBWR644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814294; c=relaxed/simple;
	bh=R9C5i1aZz7KYzDHakfqVgxe0xLe+cYtqlwq5WzP8zvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZ7dbIdJZ9N8DC5yo4zGaAiX8Q2mSzE6kPBYLlz8iIGqB2JQa9/9Ww7kii9+DTJ/bhlDZJGOMxF+mWQyTXHVH3Ov4ghf+nx2X9bGoePthZ59Mul/Ro4WUMapnlbmIt+E9fxtmDYjQNOuNJ3IFhJ1i6vwjOxoOmsKekkEkZC5Ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b5165cf5so2984553e87.0;
        Sun, 06 Jul 2025 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751814288; x=1752419088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMlbKX+K6Yi3ZmsuHL3jCao7JCUHreI4o1rb+0N/8yw=;
        b=TJ7TdESp/JPQ4eN+d/m2K5rBj2wEXRfRWXnJk4YBF6iPzqQv7qJblQUt8m+SQZc9D+
         oOujdnoxWCCE/malLWM34hpC2PetJPzemCjEc1IxaAs2KSykT7mg6SA7s/9nxOJ2VmQ0
         yhmg2rWudjAe9/S55G5ODze/lOX+J1h+IhLYOF7UKObJkemNKLmVRlloWGkNqZaQEINW
         n8HvNjKIiDf3PsrpkwBqk8UMsBBXlPxSjvUe+61TjZFfWRoVEsHwnhzNV0/IrIYyARfx
         prLTtd2PNpTp/zIlpOt1rfRX7YnQC8meXqZwpG4KvAmcOOJdbfu4BsXriyOnlTmxILbd
         LipQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Wa7gVFU49MqCK+wIlZEDAYAGx3cxRkz0Z6JUTSHjokgdA8ggvxOypcHo7FmWckCsErmQI/pIXLkV@vger.kernel.org, AJvYcCW1ruLVro5IsYFEeSJyIel5taRucvgTxUQuXV/P2AL1ul9Zj79lO/spEV+2OtKIb/i1TsB1l7Nr@vger.kernel.org, AJvYcCXIhy5xz/0z1P2qVYe/CnMPhatPo7dzsqXrAFya6oPWjvvhireoRyk0m4HQ2EZFm/HdNoDZh9GQjgG2EQ==@vger.kernel.org, AJvYcCXXioEopNBZ2FO+9QzKvFpU2ZHR16ZIvmBDDBDHDdepACa8J5AMz/A+Mo3ja+SJAfApb6zcNbXt5XUq/1xf@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqPiEfPy9YIpXHBH/EKjJrN4f5zMu99D4ZbcfIhE8dI1a8rJZ
	tV/oDuCEGsuouYEEzRjgHYBXUVILksZ/DJwX8iOKpY4hJ7TWtEViYSozfq6aNetfEEs=
X-Gm-Gg: ASbGncvs5dUg7rrEYxErE5022ibjVT9jjh86Zp1ys1fNe0A8cs7ybljkM3nVfa40idv
	Wl4Iz+BBJpAWsKxSPp0n5qyQxJUTU2fF6rqBnoxruZ2eRNDcE20M/GBfiLJrao8tJDkAk2lWKt+
	EvgYbdpCmbdlXuykvDyoHCQT8GXTRSLlDD+5b252wcfkmtSbWAlZlXvvEac3W37i6/BYs3xlmig
	qva0CtmhLwtee+EU9NQAOiBCmTTnruQ1PxlfUTydeZBqQZtv42rjDZWU79mfL2B9p5nOU58J4Qy
	ZcYn1I3bIVss5HES4yJ1bYCiRXiGEft3qp3q65XQLOsqLgsvelK3c3irn7Lr+AwOFyHbB7nolwj
	qaDVXuZUAAT5Nsok=
X-Google-Smtp-Source: AGHT+IE8nuhlfgGfHRsYbEs/lX4UzFIccI8L6VGDpy/qkd8XYMvjD8qj/idSKXXaf5/thEevbT/p3A==
X-Received: by 2002:a05:6512:23a9:b0:553:5135:69fb with SMTP id 2adb3069b0e04-557e553a3bamr1169714e87.10.1751814288152;
        Sun, 06 Jul 2025 08:04:48 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8d6csm994273e87.79.2025.07.06.08.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b584ac96so2203337e87.1;
        Sun, 06 Jul 2025 08:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmOtdtJXU8QOekOnZmLYC0Hgj+XqM86iiTx/siqEXXV6Ieitcush5MdGVamoDIXLTqHONj7K9K@vger.kernel.org, AJvYcCV/CL7gydaQjVnV1O5/sZDNPN556eM1EjO+fhrQEtd2Q72mgbSK4tbvhjX2ywMrKM1ojl5/oZSKp/3W@vger.kernel.org, AJvYcCVeb1/m7L6QCZv6xPUbEBpR6UYcZpuT77mUxDhfAL4FrLUDdAqQf17UZr+tYfUvxBDifwqZ+ROUxI8r2Q==@vger.kernel.org, AJvYcCXqOyZ1w6UKejfm0kWEgeaAfEDPeBz38yGweWyHXrjkl/TXroMzBBv4HR7OSgbix9ATc54bT9q7du0p9j3T@vger.kernel.org
X-Received: by 2002:a05:6512:1101:b0:553:35c4:db08 with SMTP id
 2adb3069b0e04-557e558bbd7mr1533619e87.30.1751814287250; Sun, 06 Jul 2025
 08:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan> <aGm8n_wJPiGk85E4@collins>
In-Reply-To: <aGm8n_wJPiGk85E4@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 23:04:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
X-Gm-Features: Ac12FXzlhh-z7i6IZD8r5Xo-cn0NQ2gJKv7hIIuXOkIRtOdxBVrM3nhyYAYGLrQ
Message-ID: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Andre,
>
> Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > On Fri, 4 Jul 2025 23:35:35 +0100
> > Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Hi,
> >
> > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > trailing "0" that has no reason to be.
> > >
> > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die: i=
t's
> > > indeed not mentioned in the manual, but you can probe its MMIO
> > > registers (@0x5030000), and there is a second syscon register
> > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > It seem like no suitable pins are connected on the A133
> > > package, but that should not affect the A100 .dtsi (we use a similar
> > > approach for the H616 and A523).
> > >
> > > So I think we should keep the emac0 name.
> >
> > just thinking that it's even worse: this changes the DT visible pinctrl
> > function name, so it's a DT ABI change. With the "emac0" function name,
> > Ethernet would work with stable kernels already (as everything is
> > compatible, it's just about DT changes). But with this change, pinctrl
> > drivers in older kernels would not match.
>
> Given that the port is still very early and experimental and has very few=
 users
> and no field deployment so I don't really think it would have annoyed any=
body in
> practice. But yes in principle you are right, while the header renames ke=
ep the
> same value, the string names are used to match the device-tree definition=
s and
> this constitues ABI that needs to remain stable.
>
> > So I would very much like to see this patch moved out. Is it just in
> > LinusW's tree so far? I don't see it in -next yet.
>
> I don't think the patches were accepted for over a week so we can probabl=
y
> still act. I will send reverts, unless maintainers want to manually remov=
e
> these commits?

I can drop the dts patches from the sunxi tree. Linus might be able to
drop the pinctrl patch.

You definitely need to send a revert for the DT binding patch that is
already in net-next.


ChenYu


> Cheers,
>
> Paul
>
> > Cheers,
> > Andre.
> >
> > > [1]
> > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/=
dts/sunxi/sun50iw10p1.dtsi
> > >
> > >
> > > >
> > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner=
 A100 pin controller")
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > ---
> > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-------=
----
> > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/=
pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > >
> > >
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

