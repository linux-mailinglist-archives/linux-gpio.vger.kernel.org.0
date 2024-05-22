Return-Path: <linux-gpio+bounces-6571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B008CC1DD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 15:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF051F23B9E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F6D13DDB5;
	Wed, 22 May 2024 13:14:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75481AA7;
	Wed, 22 May 2024 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383669; cv=none; b=qo0ACq+rQgDjujCxAOgxNXSS8FC4IaiRuVWyXEfQoThnhDOvRmWsPHEI46akk8t5UAkIr7qgMeNc3bih610Gtx+sb0JTGXtKQ09HTa4+w8x7mkaNU/reHONVjJ1Jep+3e/WIkqgVZIsMZM85HRx39trhCwv0FPWZbnfCdl17Ukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383669; c=relaxed/simple;
	bh=+ql5s7twq56ZN51p9rmxlMwspvxi8gDEQs/VohgnOUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1CJdNokWmLHgkx3NFZmHSs/1lShz+BBj5+eYSIo9LltXhHi+XGCwVWFT+CdqnY2v3xqcM0EHOAWTfPvMzL/NtVlsVAB7llqPs8q90A64Ht7zBTQOroISzJpouBLZLxoEb75w+9RRp3Gwe+/ckr5Ip0H4QoCjRlS0ivUZ4fpnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61b2218ab6fso38956007b3.1;
        Wed, 22 May 2024 06:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383666; x=1716988466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50RAHZ2xJHKNsIYx+TNKp/AXx6DjSSBikxPs1TqFpb8=;
        b=twtETVW/GKB8bLZ33zyqJXV3HqR9Vms09MDuJCR9DjNx/lYqWKhpROS0X+3YhyF5aK
         NxJ1iQzDyktRLXZeraZbzJqhJNN7FmNpjDCnw2GH5RafvBwGHH3g2m07bJ2cEK8scNj0
         8u2VsKmuRQbaZyrMXdDvzOacVVAL2JY8OpxHuIvueT3QWWX7fbKbNNUGMZGv9OjzEPzN
         AhbG3JqTxxp8Oq0nNrQX/VFXwqKXkk+53bEqRaAGh5e6gRZDhgrUohQ888kgNCIz2l+A
         v+2m51MwaCUMoJm9/w98DVaeeAPIR9XIGhkgor/CPPi7T9JMBqi3T/186p4U0rV1pMHW
         GZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCX59/nS1Ngzo899yoV/jp5DVelWIQq83aI4XmOxnwOzTwQNPELhvbhfoSuA24//KK+f4yFQ/3PTe1jFnd+UfMbnGGLZjWCRtvLllBvEDykXCE9yV07f9RK9nYPkT5VAyNhRb9RIsogCzr0vJ1EmmZdwWdxk/X/gWAwTicOSphU0kpAlh3aEYPxz7rZWTZDGiUcV0PiurjBM450SCy8ucDgPzfv8ZRZz4Q==
X-Gm-Message-State: AOJu0Yzv6GF9MKrVSUIUQkqvayVYer3uk3aLZ6wmd1DSCLR9HeFVFrS6
	/rpN6cFNsV8r4t4zoDj5zBJ12B5sWp4kEgIlvuPLa/8RahUtR6+s2p77y7P7
X-Google-Smtp-Source: AGHT+IFP8mlAmvOpSi1OSgJM9DOVjvxlcFZB54RQeulzRlrLBgpEL3IZ+z+jfCeBRNwPaRkcCwGUNQ==
X-Received: by 2002:a81:498e:0:b0:618:8390:341f with SMTP id 00721157ae682-627e46c99c5mr19760967b3.1.1716383665948;
        Wed, 22 May 2024 06:14:25 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e272f0csm58040917b3.64.2024.05.22.06.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:14:25 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61b2218ab6fso38955437b3.1;
        Wed, 22 May 2024 06:14:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1MZvW6U6tDhXMACPC/lBfwbojqgNa6VJcTLtfWycMgmVjkBbm/WeWPeRYe6l4yPHNkl0fQJ3FqE7t3x6Lca7ntazuDRxmeMiLGjlk7zrr9ss97F3/Utvyg1bDrhrQ60iarHtmHFDXYzQGHZe3V7sF3uefJRKwjlE809ilY3cJJG+63baA+m9SGRYQPs1Y8/yvspFe2IPDUMSAvexSJd2MgudLMvKrmg==
X-Received: by 2002:a25:8692:0:b0:dcf:411a:3d22 with SMTP id
 3f1490d57ef6-df4e0e27dd6mr1937841276.60.1716383665271; Wed, 22 May 2024
 06:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423175900.702640-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240423175900.702640-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 15:14:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwfRvLv9QG2L0orVEFjo88UY45nPFMTs3wEav1TVuWww@mail.gmail.com>
Message-ID: <CAMuHMdWwfRvLv9QG2L0orVEFjo88UY45nPFMTs3wEav1TVuWww@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] pinctrl: renesas: pinctrl-rzg2l: Add support to
 set pulling up/down the pins
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
> Add support to configure bias-disable, bias-pull-up and bias-pull-down
> properties of the pin.
>
> Two new function pointers get_bias_param() and get_bias_val() are
> introduced as the values in PUPD register differ when compared to
> RZ/G2L family and RZ/V2H(P) SoC,
>
> Value | RZ/G2L        | RZ/V2H
> ---------------------------------
> 00b:  | Bias Disabled | Pull up/down disabled
> 01b:  | Pull-up       | Pull up/down disabled
> 10b:  | Pull-down     | Pull-down
> 11b:  | Prohibited    | Pull-up
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> RFC->v2
> - New patch

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1139,6 +1175,25 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctr=
l_dev *pctldev,
>                 arg =3D rzg2l_read_pin_config(pctrl, SR(off), bit, SR_MAS=
K);
>                 break;
>
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN: {
> +               if (!(cfg & PIN_CFG_PUPD))
> +                       return -EINVAL;
> +
> +               ret =3D pctrl->data->get_bias_param(rzg2l_read_pin_config=
(pctrl,
> +                                                                       P=
UPD(off),
> +                                                                       b=
it, PUPD_MASK));

This is rather long, so please split it in two parts, like is done in
other cases in this function:

    arg =3D rzg2l_read_pin_config(pctrl, PUPD(off), bit, PUPD_MASK);
    ret =3D pctrl->data->get_bias_param(arg);

> +               if (ret < 0)
> +                       return ret;
> +
> +               if (ret !=3D param)
> +                       return -EINVAL;
> +               /* for PIN_CONFIG_BIAS_PULL_UP/DOWN when enabled we just =
return 1 */
> +               arg =3D 1;
> +               break;
> +       }
> +

The rest LGTM.

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

