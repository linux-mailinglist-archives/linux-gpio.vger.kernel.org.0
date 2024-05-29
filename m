Return-Path: <linux-gpio+bounces-6889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8E8D3FAB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 22:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8F81F247DB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 20:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593261C68B6;
	Wed, 29 May 2024 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFbWKpDQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E8D1B960;
	Wed, 29 May 2024 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717014841; cv=none; b=czyL/Ow8TmO9T06QPFh9ux3Ot5RKrrRaBxN3ummoU6fZ5ARe4sT64cRenApI5kr3NRSLkck7BRi9xHGpS71iiT4qY/0oONJkoK35K8AZGiEIU6dBdr4ym2MmO+OyvPX+XPyi7ytCwip0PzNAwSlKTsEmh9M2kT0dwF85cW+fshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717014841; c=relaxed/simple;
	bh=fJphTOtn5DIVZnAXYLdPlqayiHth8f4F8eRKezQ4TlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXS/Bayh/NVzZY1+UuEUcLM+i3JAsjB0pv7Ho8DS7IXDtXRJ+9x4BSWWM6BXjkO9ShNeidxJuReNxKxXm6UlTVilaVMIV04PvX2xjjQkVjgumNYuQYEdRsQXnWySlBs/dluItoMIfv1tKcCqvUHyGCh35o1FCHNmyYUFH2rjweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFbWKpDQ; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-80327fdd618so57982241.3;
        Wed, 29 May 2024 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717014838; x=1717619638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Fauxb3a9woYVSVleH2HKCsQTUw+gla+mpZmCxLA2Jw=;
        b=YFbWKpDQvvt3mgGGlcwb68r5TpJLJp8xJrtoGIbC/EgW7hZ9QJLw+oNBoEgBTYS6rz
         yaqxEjVjoM6KQ+/9IqvtviRp0r3hF6CuFxEWYTFFtb4FeKBWGxvEysViA8cY2/SRJ20v
         Nk0LiOCgB9WI6zYVnkxmN6q9mDoiWx1WPxJopsVPAxK7w6gbcy+v7GmYnUalGtDXZg0k
         FamjCwUVcVkiPLreiV/BysQCb41oyOsCtH8ssS4G9alkxW/1oF4SMxPfHSSR5VZA7oxh
         Ae8SMpjUQsa00nOgCDUoWKB+SItHz1k8C8mSs4MU+kO7ER2q9cZRh8mxys2gxgAGhgUO
         flVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717014838; x=1717619638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Fauxb3a9woYVSVleH2HKCsQTUw+gla+mpZmCxLA2Jw=;
        b=qRpOkVr6PE8dyIULO6fQsRYNblpmUuHKTqytpxz/YnkwMV9Ci7aUb/MQuLQ/gyGki9
         2dFV5LvXpTEZlmGs+OmTybGWKQ0gcvpMnPxl4CiRDPm3m61rBTJWdqjL06kwnoNwedgy
         aPXl694aw1GuzJJCok+AeOv9PqvBMbCSza3nTQCxXD+ECopCROM9j+C6FiBB/p8+MAOr
         UWgkAjQ1LVPXinUrhTZMh1Ev7n3g17WIxMPkqkBeuegqWsOvvcbxxJTZhjfxnhg3naph
         IijHl4py+B7fQqRGVtCJSbDFw/+HwGqoNIcYaG9hV9eBPBv3IeLzOnG6nKQgEyKwvhRA
         NQug==
X-Forwarded-Encrypted: i=1; AJvYcCUCAeAvtHjEWGSFeFdrlPb4FtpUzyQ3U7SafjlFr2wAzuVdAWpO9bIacaAuA2Z+w15cGvwFvbzFgR0icQRLc55suFe9lUQdsA6acwTdXXi4A5W19wYqrE+qPshR/Xi+r70M1Zx+7Ygb8EH2IfYV0OJTdJ9n8qQfEJF3jsA88Dd4zZ6c2WLPvxVj+IkTIbLXYBQ9nyB/ml5xTNPp4VRYJIUgpInFDMdTWQ==
X-Gm-Message-State: AOJu0Yx0wCTqnSAIrIqoMEIlHUkXIqL6STvNNJC/TtbR14ww8/11BJfW
	BxGIIwiemqopk9RdktQMACiqLjVsNka+eHsDLi9TTdx5J2qOeC6FOJm+8VL4QLli4DiAfbec0Cd
	TQUMm7qXBcfcHnrs+FIRDdGOZHvc=
X-Google-Smtp-Source: AGHT+IFsQR1NmU2V7AWQVOp1FsXFS6oy+GYj2U5Mi1Q111IlxexDo/ZZDcfAukfBerkLeWrBoM6iOAFX+kYpCkGdvfs=
X-Received: by 2002:a05:6122:368f:b0:4d4:872:c68a with SMTP id
 71dfb90a1353d-4eaf216c287mr237868e0c.1.1717014838126; Wed, 29 May 2024
 13:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVig3M_UY8i=+gJD-gkW90tQiS_cNDJqdRe5e-Z8kNoDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVig3M_UY8i=+gJD-gkW90tQiS_cNDJqdRe5e-Z8kNoDg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 29 May 2024 21:32:39 +0100
Message-ID: <CA+V-a8v_g4u4VEks+T8VQnWfNwrnAeXNGhgW4Nz+Ty3Ohk8Kcg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] pinctrl: renesas: pinctrl-rzg2l: Add support for
 RZ/V2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, May 22, 2024 at 4:30=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pinctrl driver support for RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
> > - Dropped IOLH groups
> > - Fixed dedicated pin configs
> > - Updated r9a09g057_variable_pin_cfg
> > - Added support OEN
> > - Added support for bias settings
> > - Added function pointers for pwpr (un)lock
> > - Added support for slew-rate
>
> Thanks for the update!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -59,6 +59,10 @@
> >  #define PIN_CFG_OEN                    BIT(15)
> >  #define PIN_CFG_VARIABLE               BIT(16)
> >  #define PIN_CFG_NOGPIO_INT             BIT(17)
> > +#define PIN_CFG_OPEN_DRAIN             BIT(18)
>
> Or PIN_CFG_NOD, to match the docs?
> You can always add a comment if the meaning is unclear:
> /* N-ch Open Drain */
>
Agreed, I will update as above.

> > +#define PIN_CFG_SCHMIT_CTRL            BIT(19)
>
> SCHMITT (double T). Or just call it PIN_CFG_SMT, to match the docs?
> /* Schmitt-trigger input control */
>
Agreed, I will update as above.

> > +#define PIN_CFG_ELC                    BIT(20)
>
> /* Event Link Control */
>
> > +#define PIN_CFG_IOLH_RZV2H             BIT(21)
> >
> >  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
> >                                         (PIN_CFG_IOLH_##group | \
> > @@ -73,6 +77,10 @@
> >  #define RZG3S_MPXED_PIN_FUNCS(group)   (RZG2L_MPXED_COMMON_PIN_FUNCS(g=
roup) | \
> >                                          PIN_CFG_SOFT_PS)
> >
> > +#define RZV2H_MPXED_PIN_FUNCS          (RZG2L_MPXED_COMMON_PIN_FUNCS(R=
ZV2H) | \
> > +                                        PIN_CFG_OPEN_DRAIN | \
> > +                                        PIN_CFG_SR)
>
> I think you can include PIN_CFG_SCHMIT_CTRL here, and thus drop it
> from all tables below?
>
Agreed.

> > +
> >  #define RZG2L_MPXED_ETH_PIN_FUNCS(x)   ((x) | \
> >                                          PIN_CFG_FILONOFF | \
> >                                          PIN_CFG_FILNUM | \
> > @@ -128,13 +136,15 @@
> >  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
> >  #define QSPI                   (0x3008)
> >  #define ETH_MODE               (0x3018)
> > +#define PFC_OEN                        (0x3C40) /* known on RZ/V2H(P) =
only */
> >
> >  #define PVDD_2500              2       /* I/O domain voltage 2.5V */
> >  #define PVDD_1800              1       /* I/O domain voltage <=3D 1.8V=
 */
> >  #define PVDD_3300              0       /* I/O domain voltage >=3D 3.3V=
 */
> >
> >  #define PWPR_B0WI              BIT(7)  /* Bit Write Disable */
>
> FWIW, this should be PWPR_BOWI (O like in Oscar, not 0 =3D Zero).
>
Indeed, I'll make a seperate patch for this.

> > -#define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
> > +#define              BIT(6)  /* PFC (and PMC on RZ/V2H) Register Write=
 Enable */
>
> As this bit is called differently on RZ/V2H, and there are different
> code paths to handle PWPR on RZ/V2H vs. RZ/G2L, please add an extra
> definition for PWPR_REGWE_A, and use that in RZ/V2H-specific
> functions.
>
Agreed, I will add PWPR_REGWE_A.

> > +#define PWPR_REGWE_B           BIT(5)  /* OEN Register Write Enable, k=
nown only in RZ/V2H(P) */
> >
> >  #define PM_MASK                        0x03
> >  #define PFC_MASK               0x07
>                                    \
> > @@ -330,6 +353,8 @@ struct rzg2l_pinctrl {
> >         spinlock_t                      lock; /* lock read/write regist=
ers */
> >         struct mutex                    mutex; /* serialize adding grou=
ps and functions */
> >
> > +       raw_spinlock_t                  pwpr_lock; /* serialize PWPR re=
gister access */
>
> Do you need this lock?
> I.e. can't you use the existing .lock above instead? (see below)
>
> > +
> >         struct rzg2l_pinctrl_pin_settings *settings;
> >         struct rzg2l_pinctrl_reg_cache  *cache;
> >         struct rzg2l_pinctrl_reg_cache  *dedicated_cache;
>
> > @@ -480,6 +538,19 @@ static void rzg2l_pmc_writeb(struct rzg2l_pinctrl =
*pctrl, u8 val, void __iomem *
> >         writeb(val, addr);
> >  }
> >
> > +static void rzv2h_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, void=
 __iomem *addr)
> > +{
> > +       const struct rzg2l_register_offsets *regs =3D &pctrl->data->hwc=
fg->regs;
> > +       u8 pwpr;
> > +
> > +       raw_spin_lock(&pctrl->pwpr_lock);
>
> rzg2l_pinctrl_data.pmc_write() is always called with rzg2l_pinctrl.lock
> held.
>
> > +       pwpr =3D readb(pctrl->base + regs->pwpr);
> > +       writeb(pwpr | PWPR_PFCWE, pctrl->base + regs->pwpr);
>
> PWPR_REGWE_A
>
> > +       writeb(val, addr);
> > +       writeb(pwpr & ~PWPR_PFCWE, pctrl->base + regs->pwpr);
>
> PWPR_REGWE_A
>
> > +       raw_spin_unlock(&pctrl->pwpr_lock);
> > +}
> > +
> >  static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
> >                                        u8 pin, u8 off, u8 func)
> >  {
>
> > +static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset=
)
> > +{
> > +       static const char * const pin_names[] =3D { "ET0_TXC_TXCLK", "E=
T1_TXC_TXCLK",
> > +                                                 "XSPI0_RESET0N", "XSP=
I0_CS0N",
> > +                                                 "XSPI0_CKN", "XSPI0_C=
KP" };
>
>         static const char * const pin_names[] =3D {
>                 "ET0_TXC_TXCLK", "ET1_TXC_TXCLK", "XSPI0_RESET0N",
>                 "XSPI0_CS0N", "XSPI0_CKN", "XSPI0_CKP"
>         };
>
> > +       const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[o=
ffset];
> > +       u8 bit_array[] =3D { 0, 1, 2, 3, 4, 5 };
>
> Do you need this identity-transforming array? ;-)
>
Oops, it can be simplified.

> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(bit_array); i++) {
>
> ARRAY_SIZE(pin_names)
>
> > +               if (!strcmp(pin_desc->name, pin_names[i]))
> > +                       return bit_array[i];
>
> return i;
>
> > +       }
> > +
> > +       /* Should not happen. */
> > +       return 0;
> > +}
> > +
> > +static u32 rzv2h_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 o=
ffset, u8 pin)
> > +{
> > +       u8 bit;
> > +
> > +       if (!(caps & PIN_CFG_OEN))
> > +               return 0;
> > +
> > +       bit =3D rzv2h_pin_to_oen_bit(pctrl, offset);
> > +
> > +       return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
> > +}
> > +
> > +static int rzv2h_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 =
offset, u8 pin, u8 oen)
> > +{
> > +       const struct rzg2l_hwcfg *hwcfg =3D pctrl->data->hwcfg;
> > +       const struct rzg2l_register_offsets *regs =3D &hwcfg->regs;
> > +       unsigned long flags;
> > +       u8 val, bit;
> > +       u8 pwpr;
> > +
> > +       if (!(caps & PIN_CFG_OEN))
> > +               return -EINVAL;
> > +
> > +       bit =3D rzv2h_pin_to_oen_bit(pctrl, offset);
> > +       spin_lock_irqsave(&pctrl->lock, flags);
> > +       val =3D readb(pctrl->base + PFC_OEN);
> > +       if (oen)
> > +               val &=3D ~BIT(bit);
> > +       else
> > +               val |=3D BIT(bit);
> > +
> > +       raw_spin_lock(&pctrl->pwpr_lock);
>
> rzg2l_pinctrl.lock is taken above.
>
> > +       pwpr =3D readb(pctrl->base + regs->pwpr);
> > +       writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
> > +       writeb(val, pctrl->base + PFC_OEN);
> > +       writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
> > +       raw_spin_unlock(&pctrl->pwpr_lock);
> > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +       return 0;
> > +}
>
> > @@ -2747,6 +3098,32 @@ static void rzg2l_pwpr_pfc_lock(struct rzg2l_pin=
ctrl *pctrl)
> >         writel(PWPR_B0WI, pctrl->base + regs->pwpr);    /* B0WI=3D1, PF=
CWE=3D0 */
> >  }
> >
> > +static void rzv2h_pwpr_pfc_unlock(struct rzg2l_pinctrl *pctrl)
> > +{
> > +       const struct rzg2l_register_offsets *regs =3D &pctrl->data->hwc=
fg->regs;
> > +       u8 pwpr;
> > +
> > +       /*
> > +        * lock is acquired in pfc unlock call back and then released i=
n
> > +        * pfc lock callback
> > +        */
> > +       raw_spin_lock(&pctrl->pwpr_lock);
>
> Except for rzg2l_pinctrl_pm_setup_pfc(), this function is always
> called while holding rzg2l_pinctrl.lock.  So I think you can just
> take rzg2l_pinctrl.lock in rzg2l_pinctrl_pm_setup_pfc(), and get rid
> of pwpr_lock?
>
Agreed.

Cheers,
Prabhakar

