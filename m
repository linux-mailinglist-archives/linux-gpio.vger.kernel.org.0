Return-Path: <linux-gpio+bounces-22867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A310EAFB11A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 12:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498D21AA3B58
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CFB2957C2;
	Mon,  7 Jul 2025 10:22:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AC928A3EF;
	Mon,  7 Jul 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883763; cv=none; b=ZsKDT8k1qBazRwtL2g52kK30PkbK2EU98UEGCrmoLzFRAYfpemWBCZg7wDrF+248cRyOmXQxZwKowTkcqDTp+aL1L6wDOHk/Adq+EWusKdLGyb3TAa000rQz6FcrreextIBFqi3rJkAXcZhsi55gkR8/KmnDJkyKHVUDdmyRltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883763; c=relaxed/simple;
	bh=AIkdq6M0L7MSBoi0kiJ4+qlLHbwYNXTLj0FbkVjibtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoIg2LLwT5TVMpoS16oTVfv/+gFT9/6LmvGnOJb6mcLg6b356cdBJnJooNztre3vJacmyCTicQ4047A995kdKLuHHFY24c9ZPC2l2or6eo1cIRrNWsoeeVpGbjg5EP+vyfpOlOV24Kshxnk6VchTKSiZ7dp64bsYebuICkp3kys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b544e7b4so2827978e87.3;
        Mon, 07 Jul 2025 03:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883754; x=1752488554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sLO+XCFjd6kZQcTbPTUaHXEMjyFiunpLQXn/d3kRmo=;
        b=G2aEHJB4KMfsxOA4ohd+LpxSj0pqu4pW9L+xGB5/pnGoLMp/quECW4NBdEsvX9tOol
         rf8pn8/7aZYlgPYMKeA5rfOsrRuZ5yzuidKKp9Gtn6oO3sIz8I5j5Ya9OrQ9cWAenxrR
         U0ySrC3CxoPtquiqyGfPpgZsLHq1TAJs0jWPnhgN2G9xsjbaewfrjADCsFTM5KgiFpIQ
         KVa9nDUuSvGprhgIokPyXha7F2vc2XqZczQTGNxyP/68JWRrj+NlAbExByFrjQUxWJWq
         UuSk6n7Jk79tEz+FToOUfFGE/gYmGWOnzKhLwPp77Fd4m3HFbfcd4qu6imkOya6tKoX2
         qpRw==
X-Forwarded-Encrypted: i=1; AJvYcCVO/vjSQEcYEgeUBzu3kgfV11GwsxvRcmVOiyYI06pSLuEicW4yrpGv79pggLnlZ9bxcVZhgADJHxdn@vger.kernel.org, AJvYcCVTQMufckcYwZ4i9uLTT0VFhnewRsQE+sucFetKjwEVX1L9yIB59qzlzCKfiB36ZiCxlwpPlzuMqV/9Ug==@vger.kernel.org, AJvYcCWbMtlJoXU8vbywm8NIAExbhju8bnCCpAl2+OhSqC2dOVqa1XmfMbWSZ9HC7SP2s/y33nCCqx4y@vger.kernel.org, AJvYcCXLY9+nvjUSdI1xY9MdcQsiVR/PR9ZBfyVKn+megYTwokKMPsTPTz7q+pODStwnsKM45risHxuoOfbrqrR0@vger.kernel.org
X-Gm-Message-State: AOJu0YzMe4XZf3hNQ3rkPoAhoSpL41+GQBOFZXuEkIKoRmvm+5mMVS0O
	Cy30X4bK2RaMObhw8/1Dpm/bS1zKy2RvNPSfetGC+Bwuq+8B+bHKNoUEXUG/puXM
X-Gm-Gg: ASbGnctZp9s5wJs2/IfoH+2ANX+1iuDhNFwMmq0cvB7vO5MKAXAhfQoJnJ6pXwlqRyd
	klV4bOY4vv3qZVztSYbzpRYmUJVKzcb8t2EOl01Tt6lrROiOFLI4LYXdqYPiT8HD1auQ9agxjui
	oEdiiKbVnHG9VCn7QjMM5te7/gcEQr3iJlyG/yJWZnbyvqRslBplOXrElJG8kXrVYbE+MJhg3l3
	iZecJiqqZBunA0YSib6HT/87oPqiGGlnGg+1fiHU9Ox2jcCvERyyenwgk+RlTtqxB/Zk0k0pAL9
	7QeGVgWwXLwWoaIGc8YJhgKEp4DQ3ixhDtstz2jKKE21liNxJFqRwM3UF+ORwXF6Ftqm71dyGfG
	msHfmdMZHNkbdeo/YJ40=
X-Google-Smtp-Source: AGHT+IHPDVtKJGF4tTeA+7RigB6lLjHFufqa58UqulVE7fkNmT827EVpOyXniTphiAtCiwoSTu0AhA==
X-Received: by 2002:a05:6512:3d88:b0:545:1082:91a1 with SMTP id 2adb3069b0e04-557a14219cemr3168477e87.7.1751883753740;
        Mon, 07 Jul 2025 03:22:33 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383b518fsm1292917e87.14.2025.07.07.03.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:22:32 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b5226e6beso26266311fa.2;
        Mon, 07 Jul 2025 03:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjGwFgiCIHRLLNceH4HOhapzp5VVscZDCuShUiljlkakO03brtdC0CvLSV+SBehfxv+gGf2+bz@vger.kernel.org, AJvYcCVeNzotoG5PcWCaE47Us/CctpUw6uOlzDo7VcVAN+fl0aATiilTNpUEsFACE51shnIjtMG4tf7eCjC0@vger.kernel.org, AJvYcCWsWNkmCR0JCOs49VabAZUNj8ziapupY5KhC8t2oqCobvEmGPykQ/aLvJCNmHrlPsZ/ZEBogyOzUJhpPzDH@vger.kernel.org, AJvYcCXzQIaal9gRxxEbgn5lrPzWEgSBguG463dVsaFB9uaabeHs+pnAMmWdApA5fga3XtY4qTm7YLYP9dT7Ow==@vger.kernel.org
X-Received: by 2002:a05:651c:2105:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-32f092c6873mr36486781fa.25.1751883752130; Mon, 07 Jul 2025
 03:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins> <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins>
In-Reply-To: <aGud0aVLHGoql3Vj@collins>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 18:22:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
X-Gm-Features: Ac12FXyg9XXCP12FlM42TuajsfubuWC369QAdithyWrauBmCL6zemqSIgfSLhuw
Message-ID: <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
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

On Mon, Jul 7, 2025 at 6:13=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi,
>
> Le Mon 07 Jul 25, 17:52, Chen-Yu Tsai a =C3=A9crit :
> > On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-bas=
e.io> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > > > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys=
-base.io> wrote:
> > > > >
> > > > > Hi Andre,
> > > > >
> > > > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > > > >
> > > > > > > Hi Paul,
> > > > > > >
> > > > > > > > The Allwinner A100/A133 only has a single emac instance, wh=
ich is
> > > > > > > > referred to as "emac" everywhere. Fix the pin names to drop=
 the
> > > > > > > > trailing "0" that has no reason to be.
> > > > > > >
> > > > > > > Sorry, but this is wrong. There *is* a second EMAC on the A13=
3 die: it's
> > > > > > > indeed not mentioned in the manual, but you can probe its MMI=
O
> > > > > > > registers (@0x5030000), and there is a second syscon register
> > > > > > > (@0x03000034). It's mentioned in several BSP code places ([1]=
).
> > > > > > > It seem like no suitable pins are connected on the A133
> > > > > > > package, but that should not affect the A100 .dtsi (we use a =
similar
> > > > > > > approach for the H616 and A523).
> > > > > > >
> > > > > > > So I think we should keep the emac0 name.
> > > > > >
> > > > > > just thinking that it's even worse: this changes the DT visible=
 pinctrl
> > > > > > function name, so it's a DT ABI change. With the "emac0" functi=
on name,
> > > > > > Ethernet would work with stable kernels already (as everything =
is
> > > > > > compatible, it's just about DT changes). But with this change, =
pinctrl
> > > > > > drivers in older kernels would not match.
> > > > >
> > > > > Given that the port is still very early and experimental and has =
very few users
> > > > > and no field deployment so I don't really think it would have ann=
oyed anybody in
> > > > > practice. But yes in principle you are right, while the header re=
names keep the
> > > > > same value, the string names are used to match the device-tree de=
finitions and
> > > > > this constitues ABI that needs to remain stable.
> > > > >
> > > > > > So I would very much like to see this patch moved out. Is it ju=
st in
> > > > > > LinusW's tree so far? I don't see it in -next yet.
> > > > >
> > > > > I don't think the patches were accepted for over a week so we can=
 probably
> > > > > still act. I will send reverts, unless maintainers want to manual=
ly remove
> > > > > these commits?
> > > >
> > > > I can drop the dts patches from the sunxi tree. Linus might be able=
 to
> > > > drop the pinctrl patch.
> > > >
> > > > You definitely need to send a revert for the DT binding patch that =
is
> > > > already in net-next.
> > >
> > > Should this really affect the bindings though?
> > >
> > > From what Andre reported, both EMAC0 and EMAC1 should be the same blo=
ck so it
> > > doesn't seem particularly necessary to have a different compatible.
> > >
> > > Looking at Allwiner's BSP code for the A133[0], I don't see any diffe=
rence
> > > between the two. While there's device_type property in Allwinner's dt=
, it's
> > > apparently not used by the driver[1].
> > >
> > > So I think we're still fine with a single compatible (without the con=
troller
> > > index in it).
> >
> > The block is the same, but the integration is slightly different, as
> > the register for the RGMII clock delays and other stuff is at a differe=
nt
> > offset in the system controller. The BSP handles this by directly
> > including the register in the "reg" property.
>
> Ah I see, I forgot about the syscon register. However it doesn't seem lik=
e a
> very good approach to have a different compatible to express the idea tha=
t an
> external resource is different. Just like we do for clocks, resets and ot=
her
> things, we should probably find a way to express the offset via some dedi=
cated
> property instead of spinning a different compatible each time it changes.
>
> > So yes, you do need a separate compatible string, if only to deal with
> > the slight difference in the integration layer.
>
> So maybe an additional allwinner,syscon-offset property or a new

If you can get that accepted, I think that works?

> allwinner,syscon that takes the syscon phandle first and the offset secon=
d?

I would prefer to avoid any changes to the syscon reference that would
require more custom code. I only just recently found that we could use
the standard syscon code with the provider registering the syscon. We
could drop the of_parse_phandle() + find device + dev_get_regmap() bits.
This is partially covered in my GMAC200 series.

ChenYu

> It seems that various other platforms are doing similar things (e.g.
> ti,syscon-pcie-mode).
>
> Thanks
>
> Paul
>
> >
> > ChenYu
> >
> > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel=
/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel=
/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > >
> > > All the best,
> > >
> > > Paul
> > >
> > > >
> > > > ChenYu
> > > >
> > > >
> > > > > Cheers,
> > > > >
> > > > > Paul
> > > > >
> > > > > > Cheers,
> > > > > > Andre.
> > > > > >
> > > > > > > [1]
> > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm=
64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the A=
llwinner A100 pin controller")
> > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > ---
> > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++++++++=
+-----------
> > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/=
drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO *=
/
> > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL =
*/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL =
*/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI *=
/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 =
*/
> > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 *=
/
> > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 *=
/
> > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 *=
/
> > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Paul Kocialkowski,
> > > > >
> > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > Free software developer - https://www.paulk.fr/
> > > > >
> > > > > Expert in multimedia, graphics and embedded hardware support with=
 Linux.
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

