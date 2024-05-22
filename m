Return-Path: <linux-gpio+bounces-6577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 778768CC414
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 17:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD251F232D4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BD770F1;
	Wed, 22 May 2024 15:30:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342523BE;
	Wed, 22 May 2024 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391818; cv=none; b=sIauBMgzEf/wzOFye7WrghLpfdArtKs7ZWN7ZK3uChWCMSimNLjHRv62DuYT0SyKkGHpl91wE+qBYncQ15IKYxPAW84gC9qsHAv2bh7TpsrQB6CuWq1hvRXZ+1rV3dy62Kco1Qg+zGQEpzx4KBuhTsUW13ycCdpMHhshCMV1xsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391818; c=relaxed/simple;
	bh=zZru86fIXiFkTYCb5WmuVf8xA/JutLp3XSO05kRVxc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9CrfHOwKOMLAnTzNbPUkZaDplfQpB4qHLu6DPLquZ7Hzk1MsmjeSVxdI15Aq7HW/HMBumFDD/DG+5qtF/ICj/iIohCUZHu8Dt4EXaPcqAN3ZNrT2H99DolQkynZgBQG1hcRDHR2rpeKqLcZUNsu7qE2PWs+b3t0WzKM6QqDWS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61af74a010aso10588607b3.0;
        Wed, 22 May 2024 08:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391814; x=1716996614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l65IJZn4qXBceTFbbW0vUcMQ48LpmB2S34V/Jdhwaec=;
        b=GqFcSZfBHdDdw7Tu8MV8c04gfFTu2T3qDA1iYiF+kZhSvqQJIBFXyRLJe4P6qsRHjl
         k/dvCg2mAGl+RQCJ9mZj9Nitw0gKXoft0mTFi/XEpaUeaFUrTjKD5RBfaPR1zb3ltoDo
         zoJx8VGxvYWYIOpElyLhGTK1lzz5qg22pm3eYfVeLZ8tu9p7fOqEDrBIZjLJXY82NRje
         lNrhvvNpmYdRywl1xySS6dGi5ceAK4vml1eN0oe+WAThZ/AYP6Ewb7ga1jYqmmjK33cV
         LgIRExAXj1IWzcCSZ5lzAXjhoxJE454i3HaRqTl4Fx6CQxBlAJfC3lY8TBgb1Q+Dh/IO
         2goA==
X-Forwarded-Encrypted: i=1; AJvYcCWQIMAJ3p5M1nX5JJ02eDchyYZqljSgeNIf1uAQ7F0ZuBBWs5s87iklpSTykB+Qld7uYg2ve/184WBVmqjeGaebYN5noKvSJ+s3w2XJaEtqqn6gmCnH98enkSJaW3cf5Zh1kRq0RI8RJiLCZ9Mq6pRra1NTlpzS8NJTSLOkK1av6iC6adP+mI5qhaKHYoCZE3q0zHN/LJluNTRSqBcf9diHZbK+88A96Q==
X-Gm-Message-State: AOJu0YxAtEVOwPegUk+furVgTryoo4ag4WhegFBqoxfGosm3BrGqoLH8
	NaqiorGnux73sb2Lx6/Ulw/QADtRZ7FSxzVyGTcFtavMn2zI1lpFLlawt1fq
X-Google-Smtp-Source: AGHT+IFjvEWTFF3xgoAg8yF7+SlgfOFknTwxIi1jcT6MCYpiKsi5SqbT+UNhW/RE49l5g5xlersAUA==
X-Received: by 2002:a05:690c:d06:b0:61b:3454:8ff9 with SMTP id 00721157ae682-627e46c775cmr29741847b3.10.1716391813685;
        Wed, 22 May 2024 08:30:13 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e26ae7esm59103057b3.57.2024.05.22.08.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 08:30:13 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-620390308e5so12182797b3.3;
        Wed, 22 May 2024 08:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfmYjoB7LfUUxaY2QWRKimEUQfRkcrhOAx/AWILFaM5BXzlzPSfaJsMV3qGllv7SZeWway+seYjsLmwxqI8f05+5PwQer6XHtUKHBCtTLMzFantVuAp3CL+KTI0SWdH5wl5z887XFgvd3XMGWbBttXc4GQ6UYm8YHYIkp8radcmn2Hiji5p8BhTUD9P/BSMNnOntQ2+DWPMHlvshVTPRQezuY9LS9aYQ==
X-Received: by 2002:a0d:d4d5:0:b0:61a:d846:9858 with SMTP id
 00721157ae682-627e46f8610mr23496397b3.20.1716391812363; Wed, 22 May 2024
 08:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 17:29:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVig3M_UY8i=+gJD-gkW90tQiS_cNDJqdRe5e-Z8kNoDg@mail.gmail.com>
Message-ID: <CAMuHMdVig3M_UY8i=+gJD-gkW90tQiS_cNDJqdRe5e-Z8kNoDg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] pinctrl: renesas: pinctrl-rzg2l: Add support for
 RZ/V2H SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Apr 23, 2024 at 7:59=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl driver support for RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
> - Dropped IOLH groups
> - Fixed dedicated pin configs
> - Updated r9a09g057_variable_pin_cfg
> - Added support OEN
> - Added support for bias settings
> - Added function pointers for pwpr (un)lock
> - Added support for slew-rate

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -59,6 +59,10 @@
>  #define PIN_CFG_OEN                    BIT(15)
>  #define PIN_CFG_VARIABLE               BIT(16)
>  #define PIN_CFG_NOGPIO_INT             BIT(17)
> +#define PIN_CFG_OPEN_DRAIN             BIT(18)

Or PIN_CFG_NOD, to match the docs?
You can always add a comment if the meaning is unclear:
/* N-ch Open Drain */

> +#define PIN_CFG_SCHMIT_CTRL            BIT(19)

SCHMITT (double T). Or just call it PIN_CFG_SMT, to match the docs?
/* Schmitt-trigger input control */

> +#define PIN_CFG_ELC                    BIT(20)

/* Event Link Control */

> +#define PIN_CFG_IOLH_RZV2H             BIT(21)
>
>  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
>                                         (PIN_CFG_IOLH_##group | \
> @@ -73,6 +77,10 @@
>  #define RZG3S_MPXED_PIN_FUNCS(group)   (RZG2L_MPXED_COMMON_PIN_FUNCS(gro=
up) | \
>                                          PIN_CFG_SOFT_PS)
>
> +#define RZV2H_MPXED_PIN_FUNCS          (RZG2L_MPXED_COMMON_PIN_FUNCS(RZV=
2H) | \
> +                                        PIN_CFG_OPEN_DRAIN | \
> +                                        PIN_CFG_SR)

I think you can include PIN_CFG_SCHMIT_CTRL here, and thus drop it
from all tables below?

> +
>  #define RZG2L_MPXED_ETH_PIN_FUNCS(x)   ((x) | \
>                                          PIN_CFG_FILONOFF | \
>                                          PIN_CFG_FILNUM | \
> @@ -128,13 +136,15 @@
>  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
>  #define QSPI                   (0x3008)
>  #define ETH_MODE               (0x3018)
> +#define PFC_OEN                        (0x3C40) /* known on RZ/V2H(P) on=
ly */
>
>  #define PVDD_2500              2       /* I/O domain voltage 2.5V */
>  #define PVDD_1800              1       /* I/O domain voltage <=3D 1.8V *=
/
>  #define PVDD_3300              0       /* I/O domain voltage >=3D 3.3V *=
/
>
>  #define PWPR_B0WI              BIT(7)  /* Bit Write Disable */

FWIW, this should be PWPR_BOWI (O like in Oscar, not 0 =3D Zero).

> -#define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
> +#define              BIT(6)  /* PFC (and PMC on RZ/V2H) Register Write E=
nable */

As this bit is called differently on RZ/V2H, and there are different
code paths to handle PWPR on RZ/V2H vs. RZ/G2L, please add an extra
definition for PWPR_REGWE_A, and use that in RZ/V2H-specific
functions.

> +#define PWPR_REGWE_B           BIT(5)  /* OEN Register Write Enable, kno=
wn only in RZ/V2H(P) */
>
>  #define PM_MASK                        0x03
>  #define PFC_MASK               0x07
                                   \
> @@ -330,6 +353,8 @@ struct rzg2l_pinctrl {
>         spinlock_t                      lock; /* lock read/write register=
s */
>         struct mutex                    mutex; /* serialize adding groups=
 and functions */
>
> +       raw_spinlock_t                  pwpr_lock; /* serialize PWPR regi=
ster access */

Do you need this lock?
I.e. can't you use the existing .lock above instead? (see below)

> +
>         struct rzg2l_pinctrl_pin_settings *settings;
>         struct rzg2l_pinctrl_reg_cache  *cache;
>         struct rzg2l_pinctrl_reg_cache  *dedicated_cache;

> @@ -480,6 +538,19 @@ static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *p=
ctrl, u8 val, void __iomem *
>         writeb(val, addr);
>  }
>
> +static void rzv2h_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, void _=
_iomem *addr)
> +{
> +       const struct rzg2l_register_offsets *regs =3D &pctrl->data->hwcfg=
->regs;
> +       u8 pwpr;
> +
> +       raw_spin_lock(&pctrl->pwpr_lock);

rzg2l_pinctrl_data.pmc_write() is always called with rzg2l_pinctrl.lock
held.

> +       pwpr =3D readb(pctrl->base + regs->pwpr);
> +       writeb(pwpr | PWPR_PFCWE, pctrl->base + regs->pwpr);

PWPR_REGWE_A

> +       writeb(val, addr);
> +       writeb(pwpr & ~PWPR_PFCWE, pctrl->base + regs->pwpr);

PWPR_REGWE_A

> +       raw_spin_unlock(&pctrl->pwpr_lock);
> +}
> +
>  static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {

> +static u8 rzv2h_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, u32 offset)
> +{
> +       static const char * const pin_names[] =3D { "ET0_TXC_TXCLK", "ET1=
_TXC_TXCLK",
> +                                                 "XSPI0_RESET0N", "XSPI0=
_CS0N",
> +                                                 "XSPI0_CKN", "XSPI0_CKP=
" };

        static const char * const pin_names[] =3D {
                "ET0_TXC_TXCLK", "ET1_TXC_TXCLK", "XSPI0_RESET0N",
                "XSPI0_CS0N", "XSPI0_CKN", "XSPI0_CKP"
        };

> +       const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[off=
set];
> +       u8 bit_array[] =3D { 0, 1, 2, 3, 4, 5 };

Do you need this identity-transforming array? ;-)

> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(bit_array); i++) {

ARRAY_SIZE(pin_names)

> +               if (!strcmp(pin_desc->name, pin_names[i]))
> +                       return bit_array[i];

return i;

> +       }
> +
> +       /* Should not happen. */
> +       return 0;
> +}
> +
> +static u32 rzv2h_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin)
> +{
> +       u8 bit;
> +
> +       if (!(caps & PIN_CFG_OEN))
> +               return 0;
> +
> +       bit =3D rzv2h_pin_to_oen_bit(pctrl, offset);
> +
> +       return !(readb(pctrl->base + PFC_OEN) & BIT(bit));
> +}
> +
> +static int rzv2h_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 of=
fset, u8 pin, u8 oen)
> +{
> +       const struct rzg2l_hwcfg *hwcfg =3D pctrl->data->hwcfg;
> +       const struct rzg2l_register_offsets *regs =3D &hwcfg->regs;
> +       unsigned long flags;
> +       u8 val, bit;
> +       u8 pwpr;
> +
> +       if (!(caps & PIN_CFG_OEN))
> +               return -EINVAL;
> +
> +       bit =3D rzv2h_pin_to_oen_bit(pctrl, offset);
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       val =3D readb(pctrl->base + PFC_OEN);
> +       if (oen)
> +               val &=3D ~BIT(bit);
> +       else
> +               val |=3D BIT(bit);
> +
> +       raw_spin_lock(&pctrl->pwpr_lock);

rzg2l_pinctrl.lock is taken above.

> +       pwpr =3D readb(pctrl->base + regs->pwpr);
> +       writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
> +       writeb(val, pctrl->base + PFC_OEN);
> +       writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
> +       raw_spin_unlock(&pctrl->pwpr_lock);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +       return 0;
> +}

> @@ -2747,6 +3098,32 @@ static void rzg2l_pwpr_pfc_lock(struct rzg2l_pinct=
rl *pctrl)
>         writel(PWPR_B0WI, pctrl->base + regs->pwpr);    /* B0WI=3D1, PFCW=
E=3D0 */
>  }
>
> +static void rzv2h_pwpr_pfc_unlock(struct rzg2l_pinctrl *pctrl)
> +{
> +       const struct rzg2l_register_offsets *regs =3D &pctrl->data->hwcfg=
->regs;
> +       u8 pwpr;
> +
> +       /*
> +        * lock is acquired in pfc unlock call back and then released in
> +        * pfc lock callback
> +        */
> +       raw_spin_lock(&pctrl->pwpr_lock);

Except for rzg2l_pinctrl_pm_setup_pfc(), this function is always
called while holding rzg2l_pinctrl.lock.  So I think you can just
take rzg2l_pinctrl.lock in rzg2l_pinctrl_pm_setup_pfc(), and get rid
of pwpr_lock?

> +       /* Set the PWPR register to allow PFC and PMC register to write *=
/
> +       pwpr =3D readb(pctrl->base + regs->pwpr);
> +       writeb(PWPR_PFCWE | pwpr, pctrl->base + regs->pwpr);

PWPR_REGWE_A

> +}
> +
> +static void rzv2h_pwpr_pfc_lock(struct rzg2l_pinctrl *pctrl)
> +{
> +       const struct rzg2l_register_offsets *regs =3D &pctrl->data->hwcfg=
->regs;
> +       u8 pwpr;
> +
> +       /* Set the PWPR register to be write-protected */
> +       pwpr =3D readb(pctrl->base + regs->pwpr);
> +       writeb(pwpr & ~PWPR_PFCWE, pctrl->base + regs->pwpr);

PWPR_REGWE_A

> +       raw_spin_unlock(&pctrl->pwpr_lock);
> +}
> +
>  static const struct rzg2l_hwcfg rzg2l_hwcfg =3D {
>         .regs =3D {
>                 .pwpr =3D 0x3014,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

