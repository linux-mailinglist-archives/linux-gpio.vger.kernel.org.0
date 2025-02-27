Return-Path: <linux-gpio+bounces-16703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A657FA47D7F
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BA9A1896212
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAC122B8AC;
	Thu, 27 Feb 2025 12:18:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9141270048;
	Thu, 27 Feb 2025 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658699; cv=none; b=cf+mwlCWn/vR9mToGqeVzIXrw61uiSCXDOd4Z6GZac8rmnis8el7hd5P7SiIMGtaQ8MPYQMpzB2W7tZUEQpUljx1lwM2jr6/EcTQCxZXftW8OWSoBwkI9gr0KnOuzB7EaNmTPngfowjj24mOPHkLwGPrqc6DPmmfI0xiorcYkH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658699; c=relaxed/simple;
	bh=HSa4X05wJ6LbkPCWaSBF4nZC+iFFswKuy147sU4Tx1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rms3KrA4l0vM26dhJkg/KIEgjj6XqfJJOu11v5q56jxtwn1h1znhPo/Of6gcfsPhE8IIr9vpHwNIDVEBgTknJlVOqm+rYnc4q9BJoHBYq9c2RLgMGjyoW60MxaulXx2AufO5v6q1KQc7E+sewEgDIjLJLC5vCE8otwILQitDWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 971B62BCA;
	Thu, 27 Feb 2025 04:18:31 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF5E3F673;
	Thu, 27 Feb 2025 04:18:14 -0800 (PST)
Date: Thu, 27 Feb 2025 12:18:11 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] pinctrl: sunxi: support moved power
 configuration registers
Message-ID: <20250227121811.23460bf0@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-5-andre.przywara@arm.com>
	<CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Feb 2025 23:48:13 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi,

> * # Be careful, this email looks suspicious; * Out of Character: The send=
er is exhibiting a significant deviation from their usual behavior, this ma=
y indicate that their account has been compromised. Be extra cautious befor=
e opening links or attachments. *
> On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner pincontroller IP features some registers to control the
> > withstand voltage of each pin group. So far those registers were always
> > located at the same offset, but the A523 SoC has moved them (probably to
> > accommodate all eleven pin banks).
> >
> > Add a flag to note this feature, and use that to program the registers
> > either at offset 0x340 or 0x380. So far no pincontroller driver uses
> > this flag, but we need it for the upcoming A523 support.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 83a031ceb29f2..a1057122272bd 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > -               reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> > +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> >                 reg &=3D ~BIT(bank);
> > -               writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> > +               writel(reg | val, pctl->membase + pctl->pow_mod_sel_off=
set);
> >                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
> >
> >                 fallthrough;
> > @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >                 val =3D uV <=3D 1800000 ? 1 : 0;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > -               reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> > +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> > +                           PIO_POW_MOD_SEL_OFS);
> >                 reg &=3D ~(1 << bank);
> > -               writel(reg | val << bank, pctl->membase + PIO_POW_MOD_S=
EL_REG);
> > +               writel(reg | val << bank,
> > +                      pctl->membase + pctl->pow_mod_sel_offset +
> > +                      PIO_POW_MOD_SEL_OFS);
> >                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
> >                 return 0;
> >         default:
> > @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platfor=
m_device *pdev,
> >                 pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
> >                 pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
> >         }
> > +       if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> > +               pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> > +       else
> > +               pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
> >
> >         pctl->irq_array =3D devm_kcalloc(&pdev->dev,
> >                                        IRQ_PER_BANK * pctl->desc->irq_b=
anks,
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 6cf721876d89d..a93385e456a57 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -87,9 +87,11 @@
> >  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
> >  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
> >  #define SUNXI_PINCTRL_PORTF_SWITCH     BIT(9)
> > +#define SUNXI_PINCTRL_ELEVEN_BANKS     BIT(10)
> >
> > -#define PIO_POW_MOD_SEL_REG    0x340
> > -#define PIO_POW_MOD_CTL_REG    0x344
> > +#define PIO_POW_MOD_SEL_REG            0x340
> > +#define PIO_11B_POW_MOD_SEL_REG                0x380
> > +#define PIO_POW_MOD_SEL_OFS            0x004 =20
>=20
> Shouldn't this be PIO_POW_MOD_CTL_OFS instead?

Ah, I already got lost myself in those three-letter stubs, but you are
right: it's the offset of the control register within the POW_MOD(?)
register block.
So nice catch, will fix it.

Thanks,
Andre

> ChenYu
>=20
> >
> >  #define PIO_BANK_K_OFFSET              0x500
> >
> > @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
> >         u32                             bank_mem_size;
> >         u32                             pull_regs_offset;
> >         u32                             dlevel_field_width;
> > +       u32                             pow_mod_sel_offset;
> >  };
> >
> >  #define SUNXI_PIN(_pin, ...)                                   \
> > --
> > 2.46.3
> > =20
>=20
>=20


