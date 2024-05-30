Return-Path: <linux-gpio+bounces-6936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F928D496B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0C85B21606
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D48176AAE;
	Thu, 30 May 2024 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgX/da3Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4E56F2E9;
	Thu, 30 May 2024 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717064189; cv=none; b=BsAQ9P51rRDuyvRPduJcUnOUrYG7Soi2f7WHJqVKCWgJ8W0q507bzHFYrfS05gvUUL5OHteW3Arn7+jLK2tf5FYK0cPvUu00YNeM1zKLS6JE0dgC63ivHcAECWSV3km83x0EkT2pd7eRafHFSp1Upqs58mKXKEF7dnrbam4H1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717064189; c=relaxed/simple;
	bh=kOki+MSeYe6E86EINaVSzPfnje4NTbdLxmTtFcpGBUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtEWs7tCQQa8LraztL95qrH7ARo1LdDCbootNMa3I2yKEuqU5yfaxglny91zwIXTmZd4WiLXQw6KuhppEpHDRGH8KP62ljS7+JGXV4C83JA/g+BUwOAmrhi6o3ax9Ec3lszpjPJyzSQEY3t2EMRaK4RhYkA5yb7mt7k3WP0ZXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgX/da3Y; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-80ac8c7caddso262058241.2;
        Thu, 30 May 2024 03:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717064186; x=1717668986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsVhoPFXTzuro6hgsrIOL1tsF092n2kCE0avYqh6/k0=;
        b=IgX/da3Ysrf3VwyPPupceVO88ZZiH1eeJ0myq3sBbdAk3W2hb1R2MqpMuT7gpc/iFG
         hHsFlXsHvwMdfqO90DLkQG9e/oA3nq3tmdVp95/s4XyyroMiDAMJ//RQjMmYDHHSAQm0
         Pd2ynpDl8IZJ/w8hrvhmwNE0a3fBLmRxxtVv6oqbM6YS/pRXUHLcBTY5Wkfskh8/Y6Jf
         IWLn+7+fuuEUYba6FkcPAfheOHnUJEXkj1/Ex1JQ4fd5jSLH5q3nbRDLzTqO6gvyumWO
         6ZpaRwT+J949ujxSONwuH7RlsFdMbNjuHaP1MckSpoSQwldYxDopHImNQumGar99lfBT
         +X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717064186; x=1717668986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsVhoPFXTzuro6hgsrIOL1tsF092n2kCE0avYqh6/k0=;
        b=dsYh2qTVl8mv1OmnsW1KBfHVykHeLwxqFAWAp1/3VCYAxxo7g0X8MXpI2pBsICmBf4
         x0zlLlFCmJGa7FRZA7YPrIlUOjcsoVeXAtxSvW49D8wp6UPRzgxgClauM5mZOKxo/XVK
         1FeUNPTSilwhq4x8xNVAFmZqT7qZwWEbY2pkmnxipj192vYjxmMDGO72AhSfd9htsMrF
         ZnpFqalBuUaFe3k8JdhB+uzSv+M3nfYXuPg5GJRxeUQUHNNV1Z79sHYXaFYKqs6ytj4c
         SU1xPYrXI07ao0GlyiE2uHXuLd0wrGhPrecABXX9E1P+ZhZodcR+Sy82Z6YR40ls90L/
         dFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVOu8h3PtZ8Gab8wgYewDQgnhgzfdkruYLp48nAXdj/rQc7OiLeNgbG3Sdod0UnaP+Nx04J8YVN28LNGP3kax4ZZKaKOKe6uRUlxuc7+SmBgJGvUpspfbPdRCk6srCapO3QYI+4BbOiQPtmoyHDuXMQ3Z2jL+TVvDBrRJIu6MmY5aohHzm0YfjGrzR5x7Vo/89h4NS5pqTbLSji7KWRdXTRxDNn133HKA==
X-Gm-Message-State: AOJu0YxefUTIJhEJoa6AB/P8HhHU/9HNla6b1DslovulTIYS8/trLBhJ
	bDGGcHpKQ0uRQYEsCQNjFCv0treuYEEufnJGyV52Kc5UeFP1434l5L52aQUbD50xqEePLjd7GdI
	8LNPKvzwYv3xOM1tslFSYgjB2C44=
X-Google-Smtp-Source: AGHT+IG9KX6x4/jzfz9rTi/NIb2LNpMBSsFpJBMWPOPEehtOuOhQS2WlLCLLrQXKl3msOhmUXDYLIhRl4HFwwqQjhz0=
X-Received: by 2002:a05:6122:2a4a:b0:4ea:edfb:8da6 with SMTP id
 71dfb90a1353d-4eaf23f3095mr1803595e0c.10.1717064184788; Thu, 30 May 2024
 03:16:24 -0700 (PDT)
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
Date: Thu, 30 May 2024 11:15:05 +0100
Message-ID: <CA+V-a8uUUoLOacFfh80JKNY+zTU+p50zZoK=x7GkFWJ962dcCA@mail.gmail.com>
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

Hi Claudiu,

Thank you for the review.

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
Agreed, I will drop it.

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
> > +             /* for PIN_CONFIG_BIAS_PULL_UP/DOWN when enabled we just =
return 1 */
>
> What about bias disable? I haven't checked in detail, is it OK to do
> arg =3D 1 here?
>
For BIAS_DISABLE config there isn't any argument, hence the above
comment mentions only for UP/DOWN. Passing arg =3D 1 for BIAS_DISABLE
has no effect.

> > +             arg =3D 1;
> > +             break;
> > +     }
> > +
> >       case PIN_CONFIG_DRIVE_STRENGTH: {
> >               unsigned int index;
> >
> > @@ -1254,6 +1309,20 @@ static int rzg2l_pinctrl_pinconf_set(struct pinc=
trl_dev *pctldev,
> >                       rzg2l_rmw_pin_config(pctrl, SR(off), bit, SR_MASK=
, arg);
> >                       break;
> >
> > +             case PIN_CONFIG_BIAS_DISABLE:
> > +             case PIN_CONFIG_BIAS_PULL_UP:
> > +             case PIN_CONFIG_BIAS_PULL_DOWN: {
>
> Block { } can be removed in this case.
>
Agreed, I will drop it.

Cheers,
Prabhakar

