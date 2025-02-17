Return-Path: <linux-gpio+bounces-16160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BEA38850
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 16:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C021897FB1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E62253E0;
	Mon, 17 Feb 2025 15:48:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF121CA0C;
	Mon, 17 Feb 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807313; cv=none; b=X/5TMVS1lol476UE5YoX6FcVHBDvGZrwBzQHjZnMM9komyaPN2O7wTbeUBikiUjT+F5QbXok92Xs4EYgT2JotP/tqOh79v+XoDw1NvjqnkVgBNJKoSz0aZjfTpZMO2iCK1lBcpoWsFsALHkmTToaTc7YjFFXyMSCzOHv4BO6+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807313; c=relaxed/simple;
	bh=06+HsNBqZbxG8SrKyC7xwIUS/afQ5IoCNqI5xrOzpH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2VTnYJ3nvyNwtGGz7S3vEu4+1NdQhtXGDhnnMMvxGaTP6pp6W1WNQUadK98JJBVlEKVU2zISLdH2m/1ciPaQSlv3bLcR3eK/tEdS7xw01xmcqRgkTlEKRl/2J5XQUVLsR/zlGm2RKOkfE1KvKcgDLYBLX1mwDM/DeBJQHhLfKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5452c1daabeso2531663e87.1;
        Mon, 17 Feb 2025 07:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807308; x=1740412108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oT48PO3HfIeDjSDux1vBuhE4VoEwoL5q99u+4AwOVE8=;
        b=X7juZwg0Vaf1j8zTR16m290a06EOcRnUKmriK3MMYU1H6pMXJUwMEH8XlR1Acs1jec
         i7/sT9U/GkOsjkYcBT8oA0Y/8PibZi7VAh4WhQfDpCubTLUy7+BxvM7R9JQGkvfn2q/L
         y8Rm5dhMLB5wztVEhWob37beCnAUg+IwRDS4D7aUmkZ/MlMoVRzs7DUGxKo1BwaBekJZ
         jocH9+2k2+BVdXQZ+rtMv/8IfQeNlMHDI7PH5QXX+QRrSsbBJS2pqXIaql/WeezbPEB1
         Wu3oBs83TlQCPZKICIz3BDycOeVyZl0qkUr/xax3KXx7fIbF5XbW8lkj3xlRxQ5tCcCZ
         tAPw==
X-Forwarded-Encrypted: i=1; AJvYcCVrYb8OMYSE/hm9IT6YrgQW2+t7yFTRUR76zKqnOLSw8WHT6Ltkcjb89vrPiqvHkvZzfYp9AbrPxydQ@vger.kernel.org, AJvYcCWIK+/ulHVGj/RLxGpTVH2OksK4CS5INhFH0pc6WxN4FmX55SCxi4OjaCZEBs84L0y3YJrT/wMdY33+LA==@vger.kernel.org, AJvYcCXaIbzjsSnEaMELfLOckhQvnKNuMhcMz/8MU1kzx6CLkoAQC13IsGvnNL5l1TzoNNnwmn+o8DIFwaxNcWy9@vger.kernel.org
X-Gm-Message-State: AOJu0YytvXEEyVpsn1cQr/dhwyXZ9kC7Y0GVgng9E9kBkcFz855dTzif
	oL5m3UHS/xFz5iMhnMeBjmVoO3o9pM+i6t4p2zqQvOijqpXdkCj9eky4fvwO
X-Gm-Gg: ASbGnctdd8HaDm385ZAVStlwPRqsd5QfhHl8tsFevryGy3tgkbTIRMvI1gaoJnO7QYm
	+OBUbyaAlCmQcVnY2vMM6WxvlgRd3S1Rsp2cAPbasSVNH9o6rkyuFOF3CPT+96qlpNd5beSBncq
	tfp/uKkk2hJPtA1UGTTwbZzoeEDPdFn/NHnDPNiN+DFLmoiiFyB25Z/KFwcegZRvqFEBbKCpF8E
	1lmJ2Lw+HxXVyss896pctQKOT1B6S4T/iyNMEGy0RAs4/22DnjkaXuUtoUr3E28k/OieAzwBIG+
	sHzo557jbYaogkuOn5NWWRiOGxayjQ+y60luhpmqeEKeC8FO
X-Google-Smtp-Source: AGHT+IHMveMYalbAPmdQk9lzdqMIps0nEuh8cCGZlsvDS6WBd+8FZ+G1TeR4yhJAG+jCdayImAkKWw==
X-Received: by 2002:a05:6512:3b0b:b0:542:29b6:9c26 with SMTP id 2adb3069b0e04-5452fe95c7emr2982660e87.47.1739807307816;
        Mon, 17 Feb 2025 07:48:27 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545f60c18bcsm785589e87.2.2025.02.17.07.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:48:26 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a2dfcfd83so11116301fa.1;
        Mon, 17 Feb 2025 07:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4dib4Sfex2DNoK7Dzi4bh7caniCpvGZJoLgWm2lLqGabG5Y8dQY0YwW2MGjLMtT5N0xjyog6i3vQZBnHf@vger.kernel.org, AJvYcCVUxW6pFEMT50XS3+0MROUODSrZwXQPSBL9RbAXrZuhrPIt0aQlMYNc9ZZ8pdf0Z3qilUUOTdNP8QEMfg==@vger.kernel.org, AJvYcCWbL4hVeP8IIvNVrcX2/QGJRPqomii4TvbYGzVyDLI3CyYAcYiKtgrNxrMfb3RTylIzFZZ1QuTSdolo@vger.kernel.org
X-Received: by 2002:a2e:88c9:0:b0:309:2012:cc5d with SMTP id
 38308e7fff4ca-30927ad64e9mr23653441fa.24.1739807306250; Mon, 17 Feb 2025
 07:48:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-5-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:48:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
X-Gm-Features: AWEUYZlCDWHC9MbTz92hd57HNQUJnNXRSXbL_QnKKWLChMmYjVCum1sff3H_yMQ
Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: sunxi: support moved power configuration registers
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 83a031ceb29f2..a1057122272bd 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
>                 reg &=3D ~BIT(bank);
> -               writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> +               writel(reg | val, pctl->membase + pctl->pow_mod_sel_offse=
t);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>
>                 fallthrough;
> @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunx=
i_pinctrl *pctl,
>                 val =3D uV <=3D 1800000 ? 1 : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> +                           PIO_POW_MOD_SEL_OFS);
>                 reg &=3D ~(1 << bank);
> -               writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL=
_REG);
> +               writel(reg | val << bank,
> +                      pctl->membase + pctl->pow_mod_sel_offset +
> +                      PIO_POW_MOD_SEL_OFS);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>                 return 0;
>         default:
> @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>                 pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
>                 pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
>         }
> +       if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> +               pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> +       else
> +               pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
>
>         pctl->irq_array =3D devm_kcalloc(&pdev->dev,
>                                        IRQ_PER_BANK * pctl->desc->irq_ban=
ks,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 6cf721876d89d..a93385e456a57 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -87,9 +87,11 @@
>  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH     BIT(9)
> +#define SUNXI_PINCTRL_ELEVEN_BANKS     BIT(10)
>
> -#define PIO_POW_MOD_SEL_REG    0x340
> -#define PIO_POW_MOD_CTL_REG    0x344
> +#define PIO_POW_MOD_SEL_REG            0x340
> +#define PIO_11B_POW_MOD_SEL_REG                0x380
> +#define PIO_POW_MOD_SEL_OFS            0x004

Shouldn't this be PIO_POW_MOD_CTL_OFS instead?

ChenYu

>
>  #define PIO_BANK_K_OFFSET              0x500
>
> @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
>         u32                             bank_mem_size;
>         u32                             pull_regs_offset;
>         u32                             dlevel_field_width;
> +       u32                             pow_mod_sel_offset;
>  };
>
>  #define SUNXI_PIN(_pin, ...)                                   \
> --
> 2.46.3
>

