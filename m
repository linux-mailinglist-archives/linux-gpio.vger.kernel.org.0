Return-Path: <linux-gpio+bounces-13832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A39EF15E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1123728DA4A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E022A7FC;
	Thu, 12 Dec 2024 16:26:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099D222D7D;
	Thu, 12 Dec 2024 16:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020810; cv=none; b=dsCkWtwd4HvP/iSzTWNp95nxH6kl3lOrlwZJ8zfklmXXOASLF+CZYz60MwKlNMxFKzBE4pzgK242iUVYwRuFGkhpC/FDznrICGtGDtwHUoDmS+RaLC6ufQwRiG3VtDCDGwYW2RevJsatxnzv7TMNYoRZdmZ+5fdOTHvlmlp2LlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020810; c=relaxed/simple;
	bh=3BqDJ9IE28Vm637IKbe7D+AverMUfpFzzOLy73Ms0L0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM3iV10ZERTnMGJCyICaEmHnHD1r/Jrr/AMhchK9GCouGEwr992r9bVkoIQG+7499UH2Fs3I2jWuafdinqh5RgXTDwr9C0+xBhXqYcXcDRXJfg2Oj8EOAmUBWt0OXgreBGyI+4v4u9b2fxsCKWthgUZfgiSARUb8x0jA1RJLIPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6e9586b82so58918385a.1;
        Thu, 12 Dec 2024 08:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020806; x=1734625606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gmd/BJFeq2Hao7Wbaw63l9kXbYIa+IGJrdLMUYPON4=;
        b=E616Pp6BeICL+WZT3DtYeEyZ0jJ1CnYJtkFTzJQMmfv8EzKnKLxNKIcvHylSGNba5U
         5GU89rahS9qdvsP57s4wjDYeljK2Pz/8K8xWbjae8eiEnfkDGeOUE3O1l4RoGQ+Kz3U1
         DAmnhG4x2JuYP5BMtzcC+QFv3WS1j4FQ0QbdTPtIzqu2aMv7wgv8VxGsh4bqqZQWKOJC
         n4F5gnWbl4PaULlZmOJzg3lEEKD17LLEUnJL35RBoW0uPb4tgyboi60BA6d044HRvis3
         B04tFQbRceeWUHX1OtdLXSGxGRzbdaowcExZakEXrgk8phoKG7OAMPcDXyAGWS7ellD/
         VtlA==
X-Forwarded-Encrypted: i=1; AJvYcCVhIM64MmKocwKpCKcuchfQiUgCh3oVsX/Tcuw2uGDyOVqkJfn7bItu4lzNnLhk8iTgTsoedx7THX6e@vger.kernel.org, AJvYcCVurQtk8kIWj1vnOeLVhLJULVllorcJFfro7jamoLAzRMWG8B8RZohZ9belT0KJS6hBn8fDc2QhzkBLMg==@vger.kernel.org, AJvYcCWhSzdpJe6VKVS0uRwlvhLsdqAnyHkMdEgk2jl7hus4U2sVefYAntDkL2SH2mOphkOL5Nd1/VYGRb+yV+jjWKwRDBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlWuCU0gK7p/g3tZ79DYwjgjJiLQhc85wslRFGbxoYU8i+HIF
	hscV82rUvLf9veRvb0HReVV2zE8D0juG/VFW9l7/LF/s8Oh6YXcgXRuUIY/BySM=
X-Gm-Gg: ASbGncvld85A6djPLmJpoo7RH1xugBszkcodFxFi9qkJxosbGf9Z8a1b5glyPyK2SiG
	PVYIno0OVjfb1ld3MR1rAYYtZBiHsEjR29eWbpiZCCfZZneZfBoiY14RPbH3SOYOGIF6Qc9prJR
	lV6+knqA9TZg0Bie+dJBbuySUBLqjmn0lAqECFbvnnLcYMpZUtoFr/BQ/IfoaVLmih7Qr4AHH1A
	YxpWlLg3KmPDhqUQdq77Og18GNEueLX2F2FzF+44Jm6/4oNu601VO3Dc72Zly6mTGow7bhTrwHk
	vGIbJDE0GcR1HsR5x1w=
X-Google-Smtp-Source: AGHT+IGl+ZVExP5Fh4dgDfIj+1iHyCdZzI+mDeaZvywnXKlC5YnDUP8TctR2GnoRWT2UOdpES4y+UQ==
X-Received: by 2002:a05:620a:240f:b0:7b6:d383:3cca with SMTP id af79cd13be357-7b6f89acff5mr124571285a.35.1734020806597;
        Thu, 12 Dec 2024 08:26:46 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c464d9216sm1763780241.5.2024.12.12.08.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:26:46 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afed12283eso397459137.1;
        Thu, 12 Dec 2024 08:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbKIDWP//Isf68+QWSVzX3VT6/ffuFX3TtznurtIOyrWSfAk+rQmVJ+NchghzYUrd32bWrYDnQOzuW@vger.kernel.org, AJvYcCW7hqtq5uzguCVghrKF3t9UUN0U+atDamWX5ITga4N0L96ua+t0CFm2i0cLVEGPoUj6NbacgD0LaKO4Hw==@vger.kernel.org, AJvYcCWxCxQQJM6LIDg8OMDD8clTOp+4vkYwsX3Qs57qnopiAd1FAOsw3w9YWJ4yyo4mbzMyugxvAWJkQIcE8nrtU/81ERw=@vger.kernel.org
X-Received: by 2002:a05:6102:3f88:b0:4b2:48dd:aade with SMTP id
 ada2fe7eead31-4b257f7d94amr1900641137.12.1734020806064; Thu, 12 Dec 2024
 08:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com> <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 17:26:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
Message-ID: <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 6, 2024 at 11:23=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add documentation for the pin controller found on the Renesas RZ/G3E
> (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
> pins(P00-PS3). The port number is alpha-numeric compared to the number on
> the other SoCs. So add macros for alpha-numeric to number conversion.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Fixed the warnings reported by bot.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yam=
l
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yam=
l

The changes to the bindings LGTM.

> diff --git a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h b/include/dt-bin=
dings/pinctrl/rzg2l-pinctrl.h
> index c78ed5e5efb7..1b1b1114a84c 100644
> --- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> @@ -11,13 +11,38 @@
>
>  #define RZG2L_PINS_PER_PORT    8
>
> +#define RZG3E_P0               0
> +#define RZG3E_P1               1
> +#define RZG3E_P2               2
> +#define RZG3E_P3               3
> +#define RZG3E_P4               4
> +#define RZG3E_P5               5
> +#define RZG3E_P6               6
> +#define RZG3E_P7               7
> +#define RZG3E_P8               8
> +#define RZG3E_PA               9
> +#define RZG3E_PB               10
> +#define RZG3E_PC               11
> +#define RZG3E_PD               12
> +#define RZG3E_PE               13
> +#define RZG3E_PF               14
> +#define RZG3E_PG               15
> +#define RZG3E_PH               16
> +#define RZG3E_PJ               17
> +#define RZG3E_PK               18
> +#define RZG3E_PL               19
> +#define RZG3E_PM               20
> +#define RZG3E_PS               21

This maps the discontiguous alpha-numerical port name range to a
contiguous numerical range.
As there are corresponding holes in the register layout, I am not sure
such a mapping is a good idea.
What if a future variant (or a future documentation update) exposes
the ports in between?

> +
>  /*
>   * Create the pin index from its bank and position numbers and store in
>   * the upper 16 bits the alternate function identifier
>   */
>  #define RZG2L_PORT_PINMUX(b, p, f)     ((b) * RZG2L_PINS_PER_PORT + (p) =
| ((f) << 16))
> +#define RZG3E_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(RZG3E_P##b, p, =
f)
>
>  /* Convert a port and pin label to its global pin index */
>  #define RZG2L_GPIO(port, pin)  ((port) * RZG2L_PINS_PER_PORT + (pin))
> +#define RZG3E_GPIO(port, pin)  RZG2L_GPIO(RZG3E_P##port, pin)
>
>  #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */

Note that I do like the clever scheme to handle alpha-numerical
port names. Perhaps this should be implemented for RZ/V2H, too?
RZG2L_GPIO(10, 2) and RZG2L_GPIO(10, 3) in r9a09g057h44-rzv2h-evk.dts
do refer to PA2 and PA3.

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

