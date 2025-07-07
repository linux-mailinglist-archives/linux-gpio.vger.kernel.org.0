Return-Path: <linux-gpio+bounces-22864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3439DAFB061
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D226C16F22E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C52296161;
	Mon,  7 Jul 2025 09:52:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C76293C48;
	Mon,  7 Jul 2025 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881951; cv=none; b=GOQeZhexeRzeWC1t2/luW4le7+xqABY8CijKRFyys1MBjzaIex4YbZGFo/P923TPYnHzpC+xnHqMxzqU3BGtDSiSzQ1eEP7m5iGvQqZmDfHbYNcWB4CdCm8QFc5qkVzRSchk9WLLi7aQ7runM+6pF8xA5dkL/x7lXjWA8X/pTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881951; c=relaxed/simple;
	bh=rS2IvUHGDP7e41GAbVUWMoGzeRdRQt6arlmFScKX+TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQGqpTneaDqJzotFfvq2KceJG58gFF+H58zj58iYF4KgdBsIMOYJAfDvrszTyYP1SzfvevxLPZgEZGdyuO2C+BZofsopocxq91GPjyHIBnG2hsEXDadwH7Wl629j9D4M2Y2zMSxOLsauGs6lOg7vcT58/riMdFmM90GPKUksZX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso34245501fa.3;
        Mon, 07 Jul 2025 02:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881942; x=1752486742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+G9RXNsu4/lHuRGJgb9rsOZh1/O90NgzHuMfw5EvSM=;
        b=BjmvpFxjzANy0wzshvig2Oo+odWTQWzv3ywaDwtIjrE38/shpGE1VOVMJH2o1B2Hsj
         v/AXe6W5bNERMymbU8PRzDOyjCtLBTdlCxfrT/EilTRkq06Eiz40wAVTcirMs+2/fOs9
         3JTcawvtKCJjqcgvBERqrWCumnHEnEhMiG/hSFz6Y9++iI3FeW4OKHMwbxCrQC4KW6FE
         Zl/BzerMp8pzkSuwEcvANs/XN41V+dA65dJ4IQtmPlXkOhSWtH9FG5Zl0q2tC/TYcyPG
         eq4A9O2Wh8OHT6rlnq/3uUlrTIYYM4lCd0baZN6qjdOk3HJy/9u2zC1REIT/hQmorB4S
         wXCg==
X-Forwarded-Encrypted: i=1; AJvYcCUnA76paxDxW+2EmkIeEXHQ/fZw6yBf+Z8dCG0Y2/8cpKHNYqhMGdJXc6EN4AY0DU3rxqjzEFM1iDz8@vger.kernel.org, AJvYcCVFy7UrB7aaJmWdwz4htc64EKzLQNYewuikjDye7vniXDD3qF0xCC7RkvhDWFP9UAeUe3wu6FU/ebp9z7G9@vger.kernel.org, AJvYcCWDtbuVJq7y3AKt8oLpLYe9+K5mhZu8gfYIqvFrMXej1gIZ90Fb5lechklnNjfXePRIZPShLLVdK/Yo3A==@vger.kernel.org, AJvYcCX1XAstKgKbb+KmPjlfTMYfk5dCFTsWf+AJEt53UnnTWmqU8fj3SukkxzshJgKBmrbeUdHDDDlT@vger.kernel.org
X-Gm-Message-State: AOJu0YzGbu6s5s8NdKuCNeOIQTbR6DfgrUNDoqXbw8Q3hvfA8sJLZDxw
	AeACfzQEYcjOUfl8ry88j7StL7Ss0nzRGhS91S02w4rltE1b5aYUCExqwdNIi0L4
X-Gm-Gg: ASbGnct3gxJeUiaubwu8QE7KXeySNL/aNVOQV/qW1FwMU4daLjIaf8d4PqAeG1NPNrJ
	bLqJRSjHQx5g8pQ19CsKth/veKi0B3pQGkFXIqsoRdNONHW+ZM+2JoiHR1lE+ikYwmVDhcmItWK
	loBmlJF/S3jBmzLndo4G/fh7B1dLlP8HMOb/IlQ+WGZLZojFDaNZLUmBqxKHKE7ZIikkDK0kUFA
	QrbARLs2i25a2vJqPQQoAwUiEQFNY+gJ5Omi7E9eapk63V0aiX6wlaawH1+fHvviK2vVgKlzPWj
	q0G9xYafk3u0AHM3xM9BxRiy9O7G6Zy45IU481gc/37KpWEPHJPdrZk/PJIk0QSIBQ7AsrwDe5y
	D8a7qs/glY2LoQ/G5OGU/3aSreN+Y+Q==
X-Google-Smtp-Source: AGHT+IEhPEBGggGxwkltvbwHInJFN3YyXcJ8/Tk2pg2oyagVcEeodztgDpeqcUIr2Ps8R12BGBGVgA==
X-Received: by 2002:a05:651c:31c4:b0:32a:7dd7:ff47 with SMTP id 38308e7fff4ca-32f19ae2a9fmr20754931fa.30.1751881941607;
        Mon, 07 Jul 2025 02:52:21 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83020sm11780661fa.21.2025.07.07.02.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32cd499007aso21846461fa.0;
        Mon, 07 Jul 2025 02:52:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXTqOSNiyoNsuvzB1D65CVzshVL+cEtIlvuV20t2KYbZLUPte71z5glKRV0a9zZaM1H1Ga6yakTysMBg==@vger.kernel.org, AJvYcCW4ttq1NU01Z5fxk0E5P9rBhva4EFjB26whA1OtZqK9nZcG/LBpUSGEvZfL9fP4wpGndiPhzs9CCBhE@vger.kernel.org, AJvYcCXF8dnYj131+5DfYQ3GyBWsFW6DhUlatqEP36e7hq6PK1O0lJXIeS70IQ6W3z4WGeuIOOIhgAUS@vger.kernel.org, AJvYcCXUyK82woEJIu2g8dKTpP10kEpShxAzfgzaqpN/Ht2TNux+QjgGQv0jHXO4/c3Wfq4aFb6vRrWei7zBxF0z@vger.kernel.org
X-Received: by 2002:a2e:bc1c:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32f199879cbmr17915751fa.4.1751881939832; Mon, 07 Jul 2025
 02:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
In-Reply-To: <aGuV3gcKSRIyey53@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 17:52:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
X-Gm-Features: Ac12FXxL47gWjXZzuSKcW-0cl9NbdUx83T52e-2ARQaXs9NhvEcm9RfhLdsxmoU
Message-ID: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
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

On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi Chen-Yu,
>
> Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Andre,
> > >
> > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > >
> > > > > Hi Paul,
> > > > >
> > > > > > The Allwinner A100/A133 only has a single emac instance, which =
is
> > > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > > trailing "0" that has no reason to be.
> > > > >
> > > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 di=
e: it's
> > > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > > registers (@0x5030000), and there is a second syscon register
> > > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > > It seem like no suitable pins are connected on the A133
> > > > > package, but that should not affect the A100 .dtsi (we use a simi=
lar
> > > > > approach for the H616 and A523).
> > > > >
> > > > > So I think we should keep the emac0 name.
> > > >
> > > > just thinking that it's even worse: this changes the DT visible pin=
ctrl
> > > > function name, so it's a DT ABI change. With the "emac0" function n=
ame,
> > > > Ethernet would work with stable kernels already (as everything is
> > > > compatible, it's just about DT changes). But with this change, pinc=
trl
> > > > drivers in older kernels would not match.
> > >
> > > Given that the port is still very early and experimental and has very=
 few users
> > > and no field deployment so I don't really think it would have annoyed=
 anybody in
> > > practice. But yes in principle you are right, while the header rename=
s keep the
> > > same value, the string names are used to match the device-tree defini=
tions and
> > > this constitues ABI that needs to remain stable.
> > >
> > > > So I would very much like to see this patch moved out. Is it just i=
n
> > > > LinusW's tree so far? I don't see it in -next yet.
> > >
> > > I don't think the patches were accepted for over a week so we can pro=
bably
> > > still act. I will send reverts, unless maintainers want to manually r=
emove
> > > these commits?
> >
> > I can drop the dts patches from the sunxi tree. Linus might be able to
> > drop the pinctrl patch.
> >
> > You definitely need to send a revert for the DT binding patch that is
> > already in net-next.
>
> Should this really affect the bindings though?
>
> From what Andre reported, both EMAC0 and EMAC1 should be the same block s=
o it
> doesn't seem particularly necessary to have a different compatible.
>
> Looking at Allwiner's BSP code for the A133[0], I don't see any differenc=
e
> between the two. While there's device_type property in Allwinner's dt, it=
's
> apparently not used by the driver[1].
>
> So I think we're still fine with a single compatible (without the control=
ler
> index in it).

The block is the same, but the integration is slightly different, as
the register for the RGMII clock delays and other stuff is at a different
offset in the system controller. The BSP handles this by directly
including the register in the "reg" property.

So yes, you do need a separate compatible string, if only to deal with
the slight difference in the integration layer.

ChenYu

> [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/lin=
ux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
>
> All the best,
>
> Paul
>
> >
> > ChenYu
> >
> >
> > > Cheers,
> > >
> > > Paul
> > >
> > > > Cheers,
> > > > Andre.
> > > >
> > > > > [1]
> > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/b=
oot/dts/sunxi/sun50iw10p1.dtsi
> > > > >
> > > > >
> > > > > >
> > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwi=
nner A100 pin controller")
> > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > ---
> > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++---=
--------
> > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driv=
ers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >
> > > > >
> > > >
> > >
> > > --
> > > Paul Kocialkowski,
> > >
> > > Independent contractor - sys-base - https://www.sys-base.io/
> > > Free software developer - https://www.paulk.fr/
> > >
> > > Expert in multimedia, graphics and embedded hardware support with Lin=
ux.
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

