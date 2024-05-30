Return-Path: <linux-gpio+bounces-6942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA08D49C7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A18284ABE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9596817C7A4;
	Thu, 30 May 2024 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWX8aoxk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0981761B1;
	Thu, 30 May 2024 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717065499; cv=none; b=YqHoIdB7DacOCVmrQzPxKVegsbC13pFDyhbci/TcNpax50zKA7TS6wwvfArWH1Zqya27Garw3qZ1phW2q7ywDR89lFwJsAQtpqEbwqX7tGoiTDEUUZqqfkr/3kzeDh6EnAOVtM4V7FJ71BsYwAIev8xkA/8JrJaaOSiLIr4qfNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717065499; c=relaxed/simple;
	bh=paHIyos98c7Tzrey/YbuwAxiZsj8aHHP8Y0RMacDQ3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofLyK7jm95cHK6sNJIldxHgtBUFTjmMUZu04ctT8EKYJEfsqM1sanT/59HwL7z6WuOxUv79bFLBKFPv/CMGi9nz8dhnKvNXygezk2/hkSVghon6P9Lq7UpKdMqWSSq1bXx1jGkPYoq9Nk4DqyME1kZ0y9R7iHKG5IjL7y+Aaee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWX8aoxk; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4e4f05835b5so545395e0c.0;
        Thu, 30 May 2024 03:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717065497; x=1717670297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aCM8VS5o1VCn3rq9y/Ep6mH6LHi55hEY6pUD21r+dg=;
        b=GWX8aoxkL2G/wQ7jt8Ls/PPgWJ/mrP52mXFVPVbPasfC4e2e/PRkNKyAIj7jxRXsE/
         op5Glh/d7ZHMCil5NZzrmSDQp2Nr9WjIW2pnWC/FA2ziyNHBS8+ZFnrgsbSJqhhHkl/Q
         UvoTcHWt9LR+0hZq3qhyJQ7dUjiA0CP1kQiOVjg5XReVbSbTOoXYjHO10x6HIkB4E5fo
         msu5rrk0hYx8mnMKCXk0sW2eGRowCwEXtRH/UJSqc/QtyD41FTTfE2FMfFcn7Zu0Pd3O
         zxrwrkmdVdWjO583/Szy2nO7IBJxvpBvGeaOrkLf6U+H5ATIRXYYCspd1sYmTsG576vg
         owdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717065497; x=1717670297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aCM8VS5o1VCn3rq9y/Ep6mH6LHi55hEY6pUD21r+dg=;
        b=E/NoOPCODF7XR21PMTZJagwLPdhjkktjU3RPLCwEf5k7RbXezD/LQAhgi1H01s0VC0
         BXxkH0TohleAuh7hwOYlQAM4pthcOQtg9aLE5FRdAxJD1uBaRVcdr9P7DBsY+vpw+/NC
         DTKYBmFvxyvhyz/OanbqopFb97MoYfpA2d6xgcVg8ZPPxei+bw2OlrOgEZTNhrGur019
         cUNGFjS8l74nBHiv2h4nmUu10yhTosBQlkMSKw4Miz4XUyHsotwrghNoZadFklwE/1Pu
         jbGN9is87SY5UvM5rEpYUR7bwg5L/JWqD8gCmNGKG5SK0tbA7+DQmm+E43p4dbjlxo/w
         z8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXeK07fWh4pYqZwq116ubI1XzKYs2uJxDTLFJnJ4nW63f9hyfBmAoHJyHnjJBPsXyX3BS5hWppDquUxnO+moGdwQPriNJQ9JLSBxttvQeW9iy8nXQBU56WpHjnXYRDhSgm0TbcI6WpgO+SCwoPgZp5gFZqs3ebhMrKZ+EzJuYBBwzR0ln5XyWShKB7GoMFnOgT/UOe+ew2C/+WMQ4foFz0QcNzSpI3lZQ==
X-Gm-Message-State: AOJu0YyBqz1H06P1Wy1WDQ9OVAXFWOidQ9IVWb+waNFgIkgBcur0Afse
	xMg/qGVqfuvPuzgLddChcVk7TD6n3hhPALfM9YO41u8+rj/U6+Xiu9KaZpViVfxqdF8gaCr1RIv
	jiJEOx05KkUPPc/nBPZozT24OO3U=
X-Google-Smtp-Source: AGHT+IFWhDim4sUo4i3oHo9nVgGW6PBD+uCPAftoB8U+86YE72uWAOrR+rjRCuwPAPuqA/Z6iIGelU3qj2VSYwPD1GA=
X-Received: by 2002:a1f:f205:0:b0:4ea:f0ef:a2ef with SMTP id
 71dfb90a1353d-4eaf30ac1c2mr1191971e0c.0.1717065495174; Thu, 30 May 2024
 03:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <862d7d16-367b-492e-b7be-e2fe71b904c2@tuxon.dev>
In-Reply-To: <862d7d16-367b-492e-b7be-e2fe71b904c2@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 May 2024 11:37:48 +0100
Message-ID: <CA+V-a8smD3EMbDsbGJ0z+Sxuk2E_NrtukLp7kEMam98pyAsZ=Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 8:48=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Prabhakar,
>
> On 23.04.2024 20:58, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support to configure bias-disable, bias-pull-up and bias-pull-down
> > properties of the pin.
> >
> > Two new function pointers get_bias_param() and get_bias_val() are
> > introduced as the values in PUPD register differ when compared to
> > RZ/G2L family and RZ/V2H(P) SoC,
> >
> > Value | RZ/G2L        | RZ/V2H
> > ---------------------------------
> > 00b:  | Bias Disabled | Pull up/down disabled
> > 01b:  | Pull-up       | Pull up/down disabled
> > 10b:  | Pull-down     | Pull-down
> > 11b:  | Prohibited    | Pull-up
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v2
> > - New patch
> > ---
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >
> > diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/=
renesas/pinctrl-rzg2l.c
> > index 102fa75c71d3..c144bf43522b 100644
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -122,6 +122,7 @@
> >  #define IOLH(off)            (0x1000 + (off) * 8)
> >  #define SR(off)                      (0x1400 + (off) * 8)
> >  #define IEN(off)             (0x1800 + (off) * 8)
> > +#define PUPD(off)            (0x1C00 + (off) * 8)
> >  #define ISEL(off)            (0x2C00 + (off) * 8)
> >  #define SD_CH(off, ch)               ((off) + (ch) * 4)
> >  #define ETH_POC(off, ch)     ((off) + (ch) * 4)
> > @@ -140,6 +141,7 @@
> >  #define IEN_MASK             0x01
> >  #define IOLH_MASK            0x03
> >  #define SR_MASK                      0x01
> > +#define PUPD_MASK            0x03
> >
> >  #define PM_INPUT             0x1
> >  #define PM_OUTPUT            0x2
> > @@ -265,6 +267,8 @@ struct rzg2l_pinctrl_data {
> >       void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, void __io=
mem *addr);
> >       u32 (*read_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset=
, u8 pin);
> >       int (*write_oen)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offse=
t, u8 pin, u8 oen);
> > +     int (*get_bias_param)(u8 val);
> > +     int (*get_bias_val)(enum pin_config_param param);
> >  };
> >
> >  /**
> > @@ -1081,6 +1085,38 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl =
*pctrl, u32 caps, u32 offset, u8
> >       return 0;
> >  }
> >
> > +static int rzg2l_get_bias_param(u8 val)
> > +{
> > +     switch (val) {
> > +     case 0:
> > +             return PIN_CONFIG_BIAS_DISABLE;
> > +     case 1:
> > +             return PIN_CONFIG_BIAS_PULL_UP;
> > +     case 2:
> > +             return PIN_CONFIG_BIAS_PULL_DOWN;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int rzg2l_get_bias_val(enum pin_config_param param)
> > +{
> > +     switch (param) {
> > +     case PIN_CONFIG_BIAS_DISABLE:
> > +             return 0;
> > +     case PIN_CONFIG_BIAS_PULL_UP:
> > +             return 1;
> > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > +             return 2;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> >  static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >                                    unsigned int _pin,
> >                                    unsigned long *config)
> > @@ -1139,6 +1175,25 @@ static int rzg2l_pinctrl_pinconf_get(struct pinc=
trl_dev *pctldev,
> >               arg =3D rzg2l_read_pin_config(pctrl, SR(off), bit, SR_MAS=
K);
> >               break;
> >
> > +     case PIN_CONFIG_BIAS_DISABLE:
> > +     case PIN_CONFIG_BIAS_PULL_UP:
> > +     case PIN_CONFIG_BIAS_PULL_DOWN: {
>
> Block { } can be removed here.
>
> > +             if (!(cfg & PIN_CFG_PUPD))
> > +                     return -EINVAL;
> > +
> > +             ret =3D pctrl->data->get_bias_param(rzg2l_read_pin_config=
(pctrl,
> > +                                                                     P=
UPD(off),
> > +                                                                     b=
it, PUPD_MASK));
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             if (ret !=3D param)
> > +                     return -EINVAL;
>
> Can this happen? Otherwise it can be removed.
>
Yes this can happen (and is needed) as we want to report only the
current BIAS setting of the pin.

For example without this condition I get the below for ET1_RXD3 pin:
pin 173 (ET1_RXD3): input bias disabled, input bias pull down (0x1
ohms), input bias pull up (0x1 ohms)
with the check included:
pin 173 (ET1_RXD3): input bias disabled

Cheers,
Prabhakar

