Return-Path: <linux-gpio+bounces-28747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2CC6E61C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E418385439
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21980357738;
	Wed, 19 Nov 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYKm0mVl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8EE33C1A0
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554123; cv=none; b=g0zgRCNIP/U7YDlU6DdDD7AbQ41BMtyL5rf7obd1Uyaxd2y5HBtf0oZtvjiK8fA5dAc0A6YiLzKl7D7R/xcyX08MGmoyf4iT6YJTrkJr2zqjaa+crXpdSzaqROSkSaWoD44YJIQIWIllF4BxjUMS9JqO6kHbGOsHMZaQFglfNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554123; c=relaxed/simple;
	bh=ByPytVwOkYKXwrFR1eX0Dldo7i7jLrts7cxdQE5Z9vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUy/4AvtCge6gRlE6ohPd/YPff4zoSbaYm5ZNMB27K1wMwtH+vt24cL+UtTFz69Qme+q0RzfzOaUAwy0xC4rXrl0tNuMwMW546/zxoTtdaf5xxkP6Skw/G89GFFelid/b1L4mAYE7MHgACtlePhasrmKd7D9SSGuox4GZPf/aJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYKm0mVl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-594516d941cso6277310e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763554120; x=1764158920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CupoU1rlidvFb//Su+E+dztn1SFhUsAToU3niKlBzQ8=;
        b=JYKm0mVlg6+ec++5MJet+Xvn+rifA14fPQ3FvzJYrVmx5neVFa5Dc7VvERasG0hAYL
         n6jYLAENl0DLA5RXOUK2KxrboyEuL071DzJtKh6tS9b5Mao94iY2X6AP5/doyoBzwZfb
         YOGlpaTc+YvbXJ63Ru58x6oYX+XqJsVOeLLFYb35i82D7nmPcvRT7BJa/Ow1lB0JakYI
         irXSXuDVBJC0oqq4n3Fu1h8o9t6a2jRgiJ1OOb+lwAKFy+55i1+pPSrtHRVOH5vJvjtF
         v0Qh+FishrztkiWHnNOJVXh3PxDRZPgBGvORFExZ1Z0u1fCGOM8GaNd9MQArVSibZFJ9
         yD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763554120; x=1764158920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CupoU1rlidvFb//Su+E+dztn1SFhUsAToU3niKlBzQ8=;
        b=wFVQFiPE7dRJKnA819GiBpWwDiB2QvfYlL2oDQcDLFWs4ET7LtL26rN8Lt6cBRsLPy
         5Lgn6HIT3rR7HrBNj/YjDRQuijVSU71CgJyL2B2SsPJCJEskvDUWoov9k3DUQjh9A+DB
         RlwiL5XwQzczJ4ToV09+GapWyThmPEzK1FV35N/1vcJT0PnK87qeyFw6Y6jNBEpQeqgd
         o0gQzabLOOGENN+Mmtr5AwtY1XLOHNDnae75nGGIuzNI67mF8bekfdk7cW08Qhbk0hT1
         V0Um+vJOVTyxBwQDXxSKiD/RL4c6fov/Ioiz/HQQAbYLULNX4sKiT2lEK5jyuGqLI+3Z
         qtKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEWMJS+udb6D6+RH9HEfOicOGPn8OapuhtzCeb1NtKAko+XVZfRpb0WDMgdtAzDHK0PQ9J82AJkCmI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ptQCdq6HXeRzqUAPAHDuu9FbjQ+WkecuIiZavQeQFB7Il3BS
	WLhm4JEejgSKp9lC3NdNH+QLoHstwDtPxg8XubyeLCmECB1VRC8He1pLgfVemeTofpCWws2xbJi
	YuRoR3JjfGGJJHpOeJXtYsqYrc9hybSMMYj+c0UjTkw==
X-Gm-Gg: ASbGncsHPCeZRRv+cjRgancX19EUlZQVDdZPbnJopBmOG3G9vv2eeeZmY41ww5Gbf4+
	hCEENUQPCuWV5PDFKNYRRAMIBeMxE0uKTyCkNTfX7INWIJJ9oZQRTzJKyw2nu9NQ3k//gX3h/OZ
	OaV4pTs7qVkluEJG3P9MlwbxHc9uTCMysRl/JP6znASaLbPK2FFt5oNa/VzLrLAtaTkwj5taKa5
	XXVkh+l3D2+fmoE6mDf01PLmovacBzZm6xv0D9hK6mijYuxs1bMlqg1JJ+yZr7HFtlFLPs=
X-Google-Smtp-Source: AGHT+IFciWtpr9shGuhQdJuvFO1JoD1hUUOxBDCbMz3L6aCSp3UqpGOGtGjUFPTd2WWaTP0bbFJs9Iywa/nFQqCmxUg=
X-Received: by 2002:a05:6512:1508:20b0:595:9195:3390 with SMTP id
 2adb3069b0e04-595919534dbmr3250626e87.5.1763554119994; Wed, 19 Nov 2025
 04:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-lantern-sappy-bea86ff2a7f4@spud> <20251112-improving-tassel-06c6301b3e23@spud>
In-Reply-To: <20251112-improving-tassel-06c6301b3e23@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 13:08:26 +0100
X-Gm-Features: AWmQ_bl8GTS1pxmVH4FYnWu6Hvd-wjg97P1oQPtijz6Z6iNATfFpYwFKIsJIGZQ
Message-ID: <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

took a quick look at this!

On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> +#include "linux/dev_printk.h"

Weird but it's RFC so OK :)

> +#define MPFS_PINCTRL_LOCKDOWN (PIN_CONFIG_END + 1)
> +#define MPFS_PINCTRL_CLAMP_DIODE (PIN_CONFIG_END + 2)
> +#define MPFS_PINCTRL_IBUFMD (PIN_CONFIG_END + 3)

Yeah this should work for custom props.

> +struct mpfs_pinctrl_drive_strength {
> +       u8 ma;
> +       u8 val;
> +};
> +
> +static struct mpfs_pinctrl_drive_strength mpfs_pinctrl_drive_strengths[8=
] =3D {
> +       { 2,   2 },
> +       { 4,   3 },
> +       { 6,   4 },
> +       { 8,   5 },
> +       { 10,  6 },
> +       { 12,  7 },
> +       { 16, 10 },
> +       { 20, 12 },
> +};

I would probably assign field explicitly with C99 syntax, but no
hard requirement.

{ .ma =3D 2, .val =3D 2 }

BTW you can see clearly that each setting activates
another driver stage in the silicon, each totempole giving
2 mA.

> +static const struct pinconf_generic_params mpfs_pinctrl_custom_bindings[=
] =3D {
> +       { "microchip,bank-lockdown", MPFS_PINCTRL_LOCKDOWN, 1 },
> +       { "microchip,clamp-diode", MPFS_PINCTRL_CLAMP_DIODE, 1 },
> +       { "microchip,ibufmd", MPFS_PINCTRL_IBUFMD, 0x0 },
> +};

I take it these have proper documentation in the DT bindings, so users know
exactly what they do.

> +static int mpfs_pinctrl_pin_to_iocfg_reg(unsigned int pin)
> +{
> +       u32 reg =3D MPFS_PINCTRL_IOCFG01_REG;
> +
> +       if (pin >=3D MPFS_PINCTRL_BANK2_START)
> +               reg +=3D MPFS_PINCTRL_INTER_BANK_GAP;
> +
> +       // 2 pins per 32-bit register
> +       reg +=3D (pin / 2) * 0x4;

This is a nice comment, easy to follow the code with small helpful
things like this.

> +static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, st=
ruct device_node *np,
> +                                      struct pinctrl_map **maps, unsigne=
d int *num_maps)

I saw in the cover letter that you wanted this to use more generic helpers.

If you see room for improvement of the generic code, do not hesitate.
Doing a new driver is the only time when you actually have all these
details in your head and can create good helpers.

> +       //TODO @Linus, it correct to group these 3? There's no control ov=
er voltage.
> +       case PIN_CONFIG_INPUT_SCHMITT:
> +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +       case PIN_CONFIG_INPUT_SCHMITT_UV:

Consider not supporting some like PIN_CONFIG_INPUT_SCHMITT_UV
in the bindings if they don't make any sense, and let it just return error
if someone tries to do that.

Isn't PIN_CONFIG_INPUT_SCHMITT_ENABLE the only one that
makes sense for this hardware?

> +static int mpfs_pinctrl_pinconf_generate_config(struct mpfs_pinctrl *pct=
rl, unsigned int pin,
> +                                               unsigned long *configs, u=
nsigned int num_configs,
> +                                               u32 *value)
(...)
> +               case PIN_CONFIG_BIAS_PULL_DOWN:
> +                       //TODO always start from val =3D=3D 0, there's no=
 reason to ever actually
> +                       // clear anything AFAICT. @Linus, does the driver=
 need to check mutual
> +                       // exclusion on these, or can I drop the clearing=
?
> +                       val &=3D ~MPFS_PINCTRL_PULL_MASK;
> +                       val |=3D MPFS_PINCTRL_WPD;
> +                       break;

I was about to say that the core checks that you don't enable pull up
and pull down
at the same time, but apparently that was just a dream I had.

The gpiolib however contains this in gpiod_configure_flags():

        if (((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DOWN)) ||
            ((lflags & GPIO_PULL_UP) && (lflags & GPIO_PULL_DISABLE)) ||
            ((lflags & GPIO_PULL_DOWN) && (lflags & GPIO_PULL_DISABLE))) {
                gpiod_err(desc,
                          "multiple pull-up, pull-down or pull-disable
enabled, invalid configuration\n");
                return -EINVAL;
        }

So there is a precedent for checking this.

So if you patch pinconf-generic.c to disallow this that'd be great, I think
it makes most sense to do this in the core.

> +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +                       if (!arg)
> +                               break;
> +                       fallthrough;
> +               case PIN_CONFIG_INPUT_SCHMITT:
> +               case PIN_CONFIG_INPUT_SCHMITT_UV:
> +                       //TODO Is it enabled regardless of register setti=
ng, or must it
> +                       // be set for lower voltage IO? Docs are missing,=
 MSS Configurator
> +                       // is not clear. Leaning towards the latter.
> +                       //bank_voltage =3D mpfs_pinctrl_pin_to_bank_volta=
ge(pctrl, pin);
> +                       //if (bank_voltage < MPFS_PINCTRL_LVCMOS25 && !ar=
g) {
> +                       //      dev_err(pctrl->dev,
> +                       //              "schmitt always enabled for 1.2, =
1.5 and 1.8 volt io\n");
> +                       //      return -EINVAL;
> +                       //}
> +                       val |=3D MPFS_PINCTRL_ENHYST;
> +                       break;

See above.

I hope this helps!

Yours,
Linus Walleij

