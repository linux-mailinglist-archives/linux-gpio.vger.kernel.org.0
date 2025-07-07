Return-Path: <linux-gpio+bounces-22833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA9AFA9FD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 05:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57105165A7E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 03:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6D71DDA24;
	Mon,  7 Jul 2025 03:08:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AD2746C;
	Mon,  7 Jul 2025 03:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751857690; cv=none; b=NhRjaHBdw6B6jMSmVrRQ4aMBpVfre6FqbIkUrkrenJrQXCop0ihDKQSB98k5S3pcHtZvHlqLh8BeZndd+1w0eIBRZZvOhtSxnF2bv61S1QZn3zkEB1UZhl+kLWEP0FeN2eVgQS0GZs+kMvGmIqgNebdYswhqStE5xOxH2BM5AqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751857690; c=relaxed/simple;
	bh=Ca1CYyBhk01PGA3N3SBefAOzKtSvua47Ltsb0rPNAOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgPGGYAWlX2Qb+pzMddvC3RvWv4+viFGx2rUt1eFLBDRMIJUazjb18f7K8/eeuZQT9+eElBVVjBMjft6d+w08S7JDwxC5igYBCSqTQjcuDCYprBWfCrDzEOwZaoink56+nH0kb53hI+Yl6G8rrDOVOXrYO8mu/+Rqe5rnT0Bw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b584ac96so2492093e87.1;
        Sun, 06 Jul 2025 20:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751857683; x=1752462483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpwrIqvCgmRZGYtw8vPnIP+63GX8mQwr98rVO4r7ZcQ=;
        b=rwBhQxSZrdegXpZjsl1HRKf8OnDquLi5+Eeva2b/1dNhr2yOsyo9lInVZ6mweFJM0Y
         K4EedJHLD9CJ+TYsAZMjg4Jm+74qDKnlXylhZa51otBmF341x7ITbXShF6TgzyepiUz/
         CsKP3g3KDdHCTzFUjld/C2z+H7FHcUP++ee5CM6QcpPfEPBOJ5VmvGvtYdxuz6Bm7ioH
         WpXGIryXgzNFC3gtf2El0MwiREN3E5aAgmw+l7gTj5iU/PAEuGO2bIaQaxjXYRA7gYqY
         JT3CTdjW9mEtsfP6KeXPFtMyTRc7nmXkO2eW2sI4Dwf8aDLg4B3n5iwQoi1lAD8c1GXj
         2oDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWewToZ1dkw5P/12qbtU7aqUvHR+2qWxu0jnD6AIyrp0NxpfjDU9mzmE90IMZiD3ApyQrGj36NrtOL@vger.kernel.org, AJvYcCVGHUfYxQdzmT2QRZUBsjdjA+SwtZvQBb/IWTPui9MMlGkInx0Xu4eHLbNx18+kp+6c7PMUuO2RCBAzlg==@vger.kernel.org, AJvYcCVcTPK38PpjHgQdZcPuuXswaf7+G7jo5Pu74h5kOA0traUbq7sx+4Bg6bXv2DBHt5IRxmGprgf5@vger.kernel.org, AJvYcCVgfmhajmr5U8wDJQDBQXWZ9TD6f2/rk/fjkI1hAJ8/U3OIOnNebCKTITQQD5lUrLXAbNToz7gSaatJPR/O@vger.kernel.org
X-Gm-Message-State: AOJu0YyNb6ZVtXwz7OKzjhW2gULAhjaNpjdqE4ei+s5gseFB1K1eUjTE
	BKAbf+5WanXgiPqgi6QuVKTW9twwhqyoWzbSkpvJHHMaCT30fCEdQl12eHw4pVX6dy8=
X-Gm-Gg: ASbGncsN7wvZlywF08V9GPtSHw+qefl/jbgfjd5g54fJWMiU5G8M3x9aVI5qPaNGIs0
	8mwKJSUANrA40a1Tq0HTe9QYX6j7upu5AaQ61O1+QJ7f43Yv/Xs/cIroKxdQ8astRuhOQ72sgy4
	T1/pYcYkdbkww/+8Bd0+UTVtHuFh2/SFTABZWrHkuNh8pB3qINIbjjWMOIJJebnT9kzRohCDED9
	5M3gOpwKgDdXSPDvjYHOGZO3ZD6w6c2vh4TnxlMPEx0S5J7wQM6eDpPq5TzGNas4cdWIMA3C3m6
	mM6aqePv5hu5pE+TDT9zTnVlbrudZgLc/opjjffbNOUp2oVlwYLf5wLQ1FBZocb8p3HAzs5qT7B
	WEByOsjRf2Gipy30bVoY=
X-Google-Smtp-Source: AGHT+IErlp+ZyfJ0CQFfpF+N2uTUFnZhzbybhFgb2ehMkts7zDt95IE0BiDBaQm9aW6gscSslk9gQA==
X-Received: by 2002:a05:6512:398c:b0:553:5135:6a0e with SMTP id 2adb3069b0e04-557e553a42fmr2059410e87.4.1751857683093;
        Sun, 06 Jul 2025 20:08:03 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ac04esm1187492e87.175.2025.07.06.20.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso25817531fa.1;
        Sun, 06 Jul 2025 20:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOJ1jpu0TWGZmCFQ96gwKsgGROC5s0iGXwzWVzgob7bg/w2jFS1vRfo7nmyOzHMHG3exHwCNKqW/yl+cEI@vger.kernel.org, AJvYcCUcroqSZjmsrFTwOoRrJoZ2QeR7hQfqgoG6zy8eRBemUmRDLx7KnYZoyos28rnHV6/Ihf1WcK11SbRJ@vger.kernel.org, AJvYcCVKvYFNfDJhsGM06lTLmrbmGQFNLvTgledFeHdXAZ7BqQprhuj2oaYed/zbhLWChg2rkLMp8yXaKAOgNA==@vger.kernel.org, AJvYcCWctCkPjHSsNf5PHtBqtUi1+dv5CdFIRYcW0Ol5eVhjlInIvz/3u00fKg/h+8pN/s5Jw8XIDUQr@vger.kernel.org
X-Received: by 2002:a2e:a009:0:10b0:32c:4306:5a0f with SMTP id
 38308e7fff4ca-32f19b851d2mr10639921fa.30.1751857681789; Sun, 06 Jul 2025
 20:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 11:07:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzzu3aJMTQ8pfrhQCoLQSJDG0pZU4ID4TpVVBWoaKajpCQaMSfB2jg324k
Message-ID: <CAGb2v65GeM8EDqzZ77i_iw3Kf+bCxOy6AK-TWVanwL1OXDnUBQ@mail.gmail.com>
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

On Sun, Jul 6, 2025 at 11:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Andre,
> >
> > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > trailing "0" that has no reason to be.
> > > >
> > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die:=
 it's
> > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > registers (@0x5030000), and there is a second syscon register
> > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > It seem like no suitable pins are connected on the A133
> > > > package, but that should not affect the A100 .dtsi (we use a simila=
r
> > > > approach for the H616 and A523).
> > > >
> > > > So I think we should keep the emac0 name.
> > >
> > > just thinking that it's even worse: this changes the DT visible pinct=
rl
> > > function name, so it's a DT ABI change. With the "emac0" function nam=
e,
> > > Ethernet would work with stable kernels already (as everything is
> > > compatible, it's just about DT changes). But with this change, pinctr=
l
> > > drivers in older kernels would not match.
> >
> > Given that the port is still very early and experimental and has very f=
ew users
> > and no field deployment so I don't really think it would have annoyed a=
nybody in
> > practice. But yes in principle you are right, while the header renames =
keep the
> > same value, the string names are used to match the device-tree definiti=
ons and
> > this constitues ABI that needs to remain stable.
> >
> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.

FYI I dropped the dts patches for now, though I forgot to redo the -next
branch last night, so today's linux-next might not reflect it.

ChenYu

> You definitely need to send a revert for the DT binding patch that is
> already in net-next.
>
>
> ChenYu
>
>
> > Cheers,
> >
> > Paul
> >
> > > Cheers,
> > > Andre.
> > >
> > > > [1]
> > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boo=
t/dts/sunxi/sun50iw10p1.dtsi
> > > >
> > > >
> > > > >
> > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinn=
er A100 pin controller")
> > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > ---
> > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----=
------
> > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >
> > > >
> > >
> >
> > --
> > Paul Kocialkowski,
> >
> > Independent contractor - sys-base - https://www.sys-base.io/
> > Free software developer - https://www.paulk.fr/
> >
> > Expert in multimedia, graphics and embedded hardware support with Linux=
.

