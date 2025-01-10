Return-Path: <linux-gpio+bounces-14631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD3A08F79
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 12:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED151188DE8D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 11:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CE920D4E5;
	Fri, 10 Jan 2025 11:30:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72820B215;
	Fri, 10 Jan 2025 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508658; cv=none; b=e2oAWkzaqE+L5peElXUfJMQCBSM03dq4ZsFcqO6Ru2NzfeZcYnl9yP3DUuJoyTmU6DYk1VOuZYVBhEvoMWgsYl1LqIlc2OXYDohXlFQlID8giF/DUaSIxLuQq4MycuxFq38uML0S1+qkJ0JKwvXqze2CVQzFcF0osKeCZjioMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508658; c=relaxed/simple;
	bh=3qxibX+5PFBnuexUouliZJ6F24gjvV3wIoa6kR9DE4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYLOgT+55n3BvsRqj+5xjIHt0UV0QIvBHTGG0lbMBjdsWhGMtV0nENPVeanz/CXjmOSwnQugjUvn6CUmINXonDYGZXKCPl0KloLucdrdzt/4fvs6PqJN9g8jNpbKrozd2Mg6zJkYbO+hlGUUBaVzJn3C6/NAjDWH3Uj5rS1S4bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5188b485988so671730e0c.3;
        Fri, 10 Jan 2025 03:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736508653; x=1737113453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJW33FPdvGJUuHfWENGbxvG9HL5q6KYxPg2rX6LxQlc=;
        b=IAh/sae+hSa2NId80ddqRp0Mvw9n+oSso31eQyj8WfFi3zspnI69/SZhdzkE0Et0vj
         P6+PJDcjPjqWFwkMgtkq3zIXkhe+4/9VIJgV0JKlhR8NtXxa3y3rpxv6YEE59A+/q2pK
         ct8BwMDAkXzdZAP6rzQEb/92yeThUJfrWzuZoGUXsbQcfxJBaeiHdaip+g4XgOqX84Qo
         Gu5IXQAidZB19Cl6gauv6Tu/xZM/FXGQvkXD6nyrqCpuX4fHrOfOb5D/pBeI0gOdKE4S
         o2nsvo2xgXAwNTqVm2wbBMV3dNUTcDlF7dVeXDp+posr21vwC7VDpV1/e/ZhQGedeWu1
         Vwmw==
X-Forwarded-Encrypted: i=1; AJvYcCUdk385EHtSxzozBZ+eUABPRmCAK6qtdWjI1poK4YUgkeborclKJsnDggz2Q1oGsF1OB07YzwWMOMcP+GUMXyJxK3Y=@vger.kernel.org, AJvYcCUtTkz+hrH5/RhWhu2BqZZ/gWcyVYSYYk070dCwwrkUHz0Q8T4Ru8mBzqsZ2HCRaawag9eszpqwZBMm@vger.kernel.org, AJvYcCXZJfPkOS35a0WxFT4oDSseYHkSfO1/bCtiFtNTumFQuPgEEftoG4h3in53mmY4M4fa8EiNBooB4byvgMZY@vger.kernel.org
X-Gm-Message-State: AOJu0YyQCHf0OM5DB7dGd8HBO65mkMIvDl/7B4sXCyts+cO49vxfp8HH
	R4BV+l84Af9mr/92eXq7AvqVv9qgA6FWjc9Ya1s/8DZJmCu1CdEW4A9g7+D3
X-Gm-Gg: ASbGncthqhTjIrpVsxSC8fKfhXQqX5QxcoE/f5wVGcEBYwYaPlk61oLHTpw7kILRtKM
	Jn4P2oXaAJck9KNDVm7dQKSU0+2Wpmveur26am3eIOy01uStsPuGyAPPVQ2UT8MiqFKmDLJ8lQ8
	dhPpfBw5wyBIRCaQ72XUIqm3Cu6dyYv2T8rIhosATdwlRNTVC0ywMW1F8RxA7NmukPgTYj6VAU6
	mS6t5lNxYs3UTnuXdsrWSraaE0k7Caxb6+ciEX+vdG7Dl93DIGWJowxEGTNxboi4W3alfvPIWhw
	HqFCWlEjQkpQHQHGIcDjUJI=
X-Google-Smtp-Source: AGHT+IEFD3gt50JAPIf6+zcBY9uZOWfY4UiiYXKh741hwfbeZM6pGJgroJCRvVR1pX8lCCPAzKCWfA==
X-Received: by 2002:a05:6122:1d14:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-51c6c50fa64mr8698914e0c.9.1736508653180;
        Fri, 10 Jan 2025 03:30:53 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbfde05sm1923405e0c.25.2025.01.10.03.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 03:30:52 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5160f1870f3so697600e0c.0;
        Fri, 10 Jan 2025 03:30:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEPc7y9Huql2T5OFbBdxCx34YZdSsWpYFhk+zOhAHK09eSI5S4UV1RPHpq2KzIQxwPg37l5Zqv6MCVnVoF@vger.kernel.org, AJvYcCX44k93lGGVCXhRARsjoRKAvsKRCYrQjbotknwuCnelgIax7ttJO4U+v7kGNW8rrqTGdAdtMD2Z/Lk+NBA4VRKoxKI=@vger.kernel.org, AJvYcCXXuAXZfeOexPx3I/Vd2MN9hyLfFQ4x8Q4EE2Oh4Y5FJp9Mu59GBOxVokoX3iXopFSE5cu9RMHmovIj@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:4b2:5ca2:48fe with SMTP id
 ada2fe7eead31-4b3d0f46233mr9677397137.15.1736508652383; Fri, 10 Jan 2025
 03:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107105947.321847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250107105947.321847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 12:30:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHYDV=R6pVCXc-Upwi=egW1UYO0XJePE7JC4WGbaW=1A@mail.gmail.com>
X-Gm-Features: AbW1kvZ8sjbozaUg_Glc-J5zbxnCG9bAgjQSZPGIPV_aVFpK2tgVJWSGjpdFhgY
Message-ID: <CAMuHMdWHYDV=R6pVCXc-Upwi=egW1UYO0XJePE7JC4WGbaW=1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use configurable PFC mask
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, Jan 7, 2025 at 11:59=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Make the PFC mask for the PFC_mx register configurable to address
> differences between SoCs in the RZ/G2L family and RZ/V2H.

"and the RZ/V2h family", as RZ/G3E is also affected.

> On RZ/G2L family SoCs, the PFC_mx mask is `0x7` (3 bits), while on RZ/V2H
> it is `0xf` (4 bits). The previous implementation hardcoded the PFC mask
> as `0x7`, which caused incorrect behavior when configuring PFC registers
> on RZ/V2H.
>
> To resolve this, introduce a `pfcmask` field in the `rzg2l_hwcfg` structu=
re
> to make the mask value configurable based on the SoC. Update PFC-related
> logic to use `hwcfg->pfcmask` instead of a hardcoded value. Additionally,
> update hardware configuration definitions to include the appropriate mask
> values (`0x7` for RZ/G2L family and `0xf` for RZ/V2H).

i understand this means that SD1_CD has always been broken:

    arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts:
        pinmux =3D <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */

and this should be queued as a fix, and backported to v6.12?

> Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC=
")
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -159,7 +159,6 @@
>  #define PWPR_REGWE_B           BIT(5)  /* OEN Register Write Enable, kno=
wn only in RZ/V2H(P) */
>
>  #define PM_MASK                        0x03
> -#define PFC_MASK               0x07

What about just changing this to 0x0f instead? The bitfields are
4-bit wide anyway, and reserved bits on RZ/G2L are documented to be
read as zero, and ignored when written.  Sole impact would be that
specifying invalid functions 8-15 in an RZ/G2L DTS would no longer be
masked by software.

>  #define IEN_MASK               0x01
>  #define IOLH_MASK              0x03
>  #define SR_MASK                        0x01

> @@ -505,7 +507,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_p=
inctrl *pctrl,
>
>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>         reg =3D readw(pctrl->base + PM(off));
> -       reg &=3D ~(PM_MASK << (pin * 2));
> +       reg &=3D ~(hwcfg->pfcmask << (pin * 2));

Oops, this should not be replaced?

>         writew(reg, pctrl->base + PM(off));
>
>         pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);

> @@ -3110,7 +3113,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l=
_pinctrl *pctrl)
>                                 continue;
>
>                         /* Set pin to 'Non-use (Hi-Z input protection)' *=
/
> -                       pm &=3D ~(PM_MASK << (pin * 2));
> +                       pm &=3D ~(hwcfg->pfcmask << (pin * 2));

Likewise.

>                         writew(pm, pctrl->base + PM(off));
>
>                         /* Temporarily switch to GPIO mode with PMC regis=
ter */

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

