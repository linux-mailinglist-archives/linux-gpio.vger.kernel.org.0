Return-Path: <linux-gpio+bounces-10817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C198FE33
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A011F238A6
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1613C810;
	Fri,  4 Oct 2024 07:56:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1377C2209F;
	Fri,  4 Oct 2024 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028577; cv=none; b=G2YSFGL2GlYvyzincJFnbA2VoM+KIR70Fhs1B4SF9q2RaVi37A2Bt/1Ha711CxdvefHGciUezG5jRXksR9oDjnn99XtEYiE207vbUslaMKqecKYhrJqODrPhIRvEYxfu1O3AChhuXBgF88UZWycVbk+s1LUoRJ6YJ5n7NOfTQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028577; c=relaxed/simple;
	bh=TXa2IBei25ITtocRtX3mHCjtTw1WfsAY3jFNmx8sA+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l95yP1PN1bRN9U04Q2/mqtR/8oJGFmF0R67OUJZM/OiefIVLMDfe7o5UmvnM8e1oReU1apxwf+R97eVhf6kOjGudKHm1sm/hU/eJiR0M2ogWE5y/WFchWI4uaDwy/aR7zgVvg5EZ1AWYBdBHBxWNrU76wmqlJeJI60Nsi4YHELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e22f10cc11so14004997b3.1;
        Fri, 04 Oct 2024 00:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028574; x=1728633374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vw3UDrgN0eDorp0S+FlFbzBDQPM+Tat1+5k3CwngP4Y=;
        b=kPJxFSxhvHt1ihQnUVO16UvEX3usG/Oj9Tsb5s4r7tSha+LMhTVVdYqDYMg4D6YwLs
         ZaSR7qFZHY7ilIII0hQfU7BJe+6mdCbQ7qdRgBZMKKCYyZdIgRc8s+YnFZILVmDzin+V
         vtK2V6C4o/7f9Wy+sZZWN4SGOFqLk870ZOvTPsT4NKf4x8v/6yhdFcBpKMBsnYuMzdZY
         Abriouu2v1+9nzJaV5q2Ka3KDJxrIWvXI4uQni9HMfWd57UvGIJw+hy98wrw9ghLt61O
         Kengm0h/Vo05JKXQMWoFnZi/T0/taej4B/qSFm5Kc46DcGr/184o5A3tRiKNIo1r7ZFy
         a9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUHuENUQaMIMoEU8W11cJ3hNaE2gyusjoq3bOsVwGfiVMsA5OrhO0C52RQoy53+7a8P14Ag45G0XNpdhRp0ACd9/Xw=@vger.kernel.org, AJvYcCUdpe7Cn7vbFtjmVThwBKL6cETvhyfucm0WQ+KcdTRmSPjczbvpDLRuuzHX41mBU6prYaZ+YUGGcKfgUQbI@vger.kernel.org, AJvYcCUnEwlmnCUVSyP5ThlxepKFqBSEt3Vr1HxGn9zUhAhzA/W6C44MrPnwXdjElNsvqZLdwo37ln8r6Xqo@vger.kernel.org, AJvYcCVC/hL8S4/3GtOprAxScVWssaOp75QQgSse9NaH4V/PuT9+pR7b6og0RpRKo15WlXQa8WeBQXhZzTsvJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUHeD6HZuuPglCLd5HgYrvvj1Z+1EqFLbQbl8caq5EaMmdqT5
	1Dgw+AiCI+HPShiXGb8UQOpfM2y2Ja0psYGoEVdWfa9jGuovdce/1UOTP94HNBo=
X-Google-Smtp-Source: AGHT+IGWFvudqknuySB+gKmyEmWX5j0mxyv4tKvbWeCtZjljDeiiEGN51IcZV2/hv72R3iFdF6wVnQ==
X-Received: by 2002:a05:690c:dcc:b0:6e2:636:d9ee with SMTP id 00721157ae682-6e2c724118emr19478157b3.9.1728028574359;
        Fri, 04 Oct 2024 00:56:14 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bd1cf38asm5348107b3.140.2024.10.04.00.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 00:56:13 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e1f48e7c18so14513347b3.3;
        Fri, 04 Oct 2024 00:56:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZXjuvHEVVrOXlnvJJXO7FKjI7WrCJdGBA17jJF//yiE/jHOuBPbcrbNE6r737e7RJq2xtNSQ2zaYUJV58@vger.kernel.org, AJvYcCW90UaVdDfPPGqTneoN+uLHubCdI6XwrGHiQmHBJX0gxpRE/GZ7cL9FkUBDmCQjYJeGu9CeYZ9XIj1Rwg==@vger.kernel.org, AJvYcCWdjiXXtgHNP0fMRVox6As5elQiJ1d3c5KzGNcNTV1XtkaHFUZIk/fuD1AB4ZCSrfwclcqEEsCpUMN0@vger.kernel.org, AJvYcCWmyoa9rqEAVr7pRBi396Cnwf3L0cj45HxsaCube4fiZ8ylPuHSWmvnMjURyRiUTzN0Px71cwi/DW7fJ2sf9qvu5wk=@vger.kernel.org
X-Received: by 2002:a05:690c:60c1:b0:6e2:b537:3085 with SMTP id
 00721157ae682-6e2c72f6d27mr18822777b3.34.1728028572524; Fri, 04 Oct 2024
 00:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240918120909.284930-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240918120909.284930-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 09:56:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6OqLEWSyRZg_EOWoFJgEBVSLfuDJNxs+c_ucZxXwebQ@mail.gmail.com>
Message-ID: <CAMuHMdW6OqLEWSyRZg_EOWoFJgEBVSLfuDJNxs+c_ucZxXwebQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: rzg2l: Add support for configuring
 open-drain outputs
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

On Wed, Sep 18, 2024 at 2:09=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for configuring the multiplexed pins as open-drain outputs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -1466,6 +1477,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctr=
l_dev *pctldev,
>                         rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_=
MASK, index);
>                         break;
>
> +               case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +                       if (!(cfg & PIN_CFG_NOD))
> +                               return -EINVAL;
> +
> +                       rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_MA=
SK, 1);
> +                       break;
> +

I think you also need a case for PIN_CONFIG_DRIVE_PUSH_PULL,
so you can disable the NOD bit again.

>                 case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
>                         if (!(cfg & PIN_CFG_IOLH_RZV2H))
>                                 return -EINVAL;

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

