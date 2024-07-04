Return-Path: <linux-gpio+bounces-8049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F305927C3B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 19:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05BC5280A76
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 17:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CF4481DD;
	Thu,  4 Jul 2024 17:28:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F646447;
	Thu,  4 Jul 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720114120; cv=none; b=pVT7kc2NA1SUTwOe6AmHgCimrYJK9bsIHu2p4HRZM17637Qt2cb5TUsAS94g+HxF+zPgra2bdWyML9PYKSoZdHsFKUYWopCm5n/UVg6wIzC9fzW7y5ipNBplk2rCRc4rK6R4ueSR9wjEcVyEmV2Tu6RypmFHOC6auqBKyPZH6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720114120; c=relaxed/simple;
	bh=k90wRWSNtXsHHg1DxapLwrN3QXfr/aKyoh7wMXQ/E8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEo4T8CBbhixq2NErLoJnKN9y5dUI3QF+4xEKNBX6rDtR5j9bVW6uBzSX2aazg7kBIVv2AaoNEjoey/j2ezO1xV0sHslI3JmOCC23XOOJqeCPzGBPjZHplAis/vxHkfc+qH8gEYJR2HOv9qnmg7pjsPcsOejw3A2tAW3qxHRFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-64b5617ba47so8045047b3.3;
        Thu, 04 Jul 2024 10:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720114117; x=1720718917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR61nMwSwM6cVFAnAbtSvi4Auo1YFRorV0GSWe+xw9k=;
        b=nisAMJlLL6SI/5+upq2IF+cMsgfL0ebC4NYnbooXhzCX1vBNW+YfpVQzlt1DsYk3hI
         PTNTqyfVw5X+XuKmdvO8kciFm5CrCplVH25/WwoKNSSaMMdiQKjpR5bxEIs+6Sz/aGZ+
         scRyqruh/wEDRMrSvEkNjNpRTRGzn6X7x0sz3nXtONUza8aFw4Bx7imSaOP/k6QVOLIt
         q4pkGaWv8DNrguFbMd+67TyF98FpR2/C4A2JhbtrFV/YE+emxdP+acSl3TPk21oTWoFx
         0LUWicXFDRSiO/RPc+HMcji5H38cY7OY1ApsO8opfipzlcLQFbUBo8BE0XZhMQwb2T5J
         ZOsw==
X-Forwarded-Encrypted: i=1; AJvYcCUnFl+KwGS5NTkktojMgghTImyTmpbxQ1umYHNeNnjpZpV2K7CU5PfVD5LkPiJjCZi1UwHOe4qb+h2cb1H7F9mfbEMxn7Hpw1ov4PCM6uxeGVoxKPNHX0mwchvrsuUKWgX/LoOtmJc4qV1Fs21shysP/tXByMgdxhOIKhaU+gYfxfLkLXJ90CbEXQZmri6dYyGTOtXT2wmkDoiQqyWk6/ZE8PRy9l7kqw==
X-Gm-Message-State: AOJu0Yyw1Uw5dOxctB+Mizji0GpRXx09dFCGcv2+4Xfs6JjpwHJZxwao
	CgPZgp3CH3+SxHJewydI6EiG/TPeVhDJ7riFVpuBiVoAwqgY4FUNfhbj4/xj
X-Google-Smtp-Source: AGHT+IG4rmnI6tzdIpaZGrZGOlyCAXKjNpsFd9zECWXLb5g00KGkMsOI4J2B4yYhIV9IUit1mC3+BA==
X-Received: by 2002:a0d:ea8c:0:b0:61d:fcf7:3377 with SMTP id 00721157ae682-652d85369abmr22209757b3.44.1720114116969;
        Thu, 04 Jul 2024 10:28:36 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64b3a625488sm23794837b3.43.2024.07.04.10.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 10:28:36 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0360f8901aso875778276.2;
        Thu, 04 Jul 2024 10:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqc8Znx3b6XQvn+mY3usrq0h1sFUTqmEk8n5nZSEPaumn99FNx+yX2sz26lXTV1kOba9igQUmqvTPTQWLrJ+6JC2X8pY2HkEpK70dUsfF1KifioZ3BGq0DPqRkkIlwdZqyvfpIxmiAd55hKMWSLo0iKaFt3pHWxg6OMLYh6EDdpCzZuiDeRkymcF4mikxVh2X88Cg1LqZFqil1X58Oj2L9CSqkzKV3dg==
X-Received: by 2002:a81:8450:0:b0:648:857c:1530 with SMTP id
 00721157ae682-652d803a2bamr21894747b3.34.1720114116374; Thu, 04 Jul 2024
 10:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625200316.4282-1-paul.barker.ct@bp.renesas.com> <20240625200316.4282-3-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240625200316.4282-3-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jul 2024 19:28:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKUq=Tf9zTx2LDr_gkbsxBPnQeK=buDSsQ__-QUHX5Gw@mail.gmail.com>
Message-ID: <CAMuHMdWKUq=Tf9zTx2LDr_gkbsxBPnQeK=buDSsQ__-QUHX5Gw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] pinctrl: renesas: rzg2l: Clean up and refactor OEN
 read/write functions
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Jun 25, 2024 at 10:03=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> The variable naming in the various OEN functions has been confusing. We
> were passing the _pin & bit variables from rzg2l_pinctrl_pinconf_get()
> and rzg2l_pinctrl_pinconf_set() as the offset & pin argument to the
> oen_read() and oen_write() functions. This doesn't make sense, the first
> of these isn't actually an offset and the second is not needed for
> RZ/V2H but leads to confusion with the bit variable used within these
> functions.
>
> To tidy this up, instead pass the _pin variable directly to the
> oen_read() and oen_write() functions with consistent naming. Then
> rzg3s_read_oen() and rzg3s_write_oen() can use macros to get the port
> and pin numbers it needs.
>
> Instead of passing the pin capabilities into oen_read() and oen_write(),
> we can check that the pin supports OEN before calling these functions.
>
> Also, merge rzg3s_oen_is_supported() into rzg3s_pin_to_oen_bit() to give
> a single translation function which returns an error if the pin doesn't
> support OEN. While we're here, remove an unnecessary branch and clarify
> the variable naming. Lastly, check that we are not dealing with a
> dedicated pin before calling RZG2L_PIN_ID_TO_{PORT,PIN}().
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes v2->v3:
>   * Picked up Linus W's Acked-by tag.
>   * Skipped Geert's Reviewed-by tag as I've made a few changes here and
>     want another review.
>   * Check pin caps before calling oen_{read,write}() so we can drop the
>     caps argument to those functions.
>   * Simplify arguments to rzg3s_pin_to_oen_bit() and decode
>     pin_data/port/pin inside this function.
>   * Check for dedicated pin before calling RZG2L_PIN_ID_TO_{PORT,PIN}().

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> -static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, u32 caps, u32 off=
set, u8 pin)
> +static int rzg3s_pin_to_oen_bit(struct rzg2l_pinctrl *pctrl, unsigned in=
t _pin)
>  {
> +       u64 *pin_data =3D pctrl->desc.pins[_pin].drv_data;
>         u8 max_port =3D pctrl->data->hwcfg->oen_max_port;
>         u8 max_pin =3D pctrl->data->hwcfg->oen_max_pin;

As max_port and max_pin are used only once...

> -       u8 bit;
> +       u8 port, pin, bit;
>
> -       if (!rzg3s_oen_is_supported(caps, pin, max_pin))
> -               return 0;
> +       if (*pin_data & RZG2L_SINGLE_PIN)
> +               return -EINVAL;
>
> -       bit =3D rzg3s_pin_to_oen_bit(offset, pin, max_port);
> +       port =3D RZG2L_PIN_ID_TO_PORT(_pin);
> +       pin =3D RZG2L_PIN_ID_TO_PIN(_pin);
> +       if (pin > max_pin)

... I'd rather use their origins here...

> +               return -EINVAL;
> +
> +       bit =3D pin * 2;
> +       if (port =3D=3D max_port)

... and here.
I can do that while applying.

> +               bit +=3D 1;
> +
> +       return bit;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'll check with Linus whether I can still queue this in renesas-pinctrl
for v6.11.  As the first three patches of this series are a hard
dependency for the DTS parts, it would be good to get them in sooner
rather than later.

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

