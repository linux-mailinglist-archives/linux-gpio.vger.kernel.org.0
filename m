Return-Path: <linux-gpio+bounces-18661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF27A84092
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4793AF397
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED792280CD8;
	Thu, 10 Apr 2025 10:20:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F13596F;
	Thu, 10 Apr 2025 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280415; cv=none; b=T1yeB80ZVJUPTO2ByXzH+Xgst3JyTF0xOlNvyc+ld8aQqCZAdvhdGs9GeJsWscyfrIyLrHHCTH81vGyRscGDtuZIJvKFY7BWpRR3Snirv+1WJtipx5/6fHojpnMcV4o/NKL/67QzVKfFYufcvRXg1hXnwN+G8wgZcF0xj8uGC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280415; c=relaxed/simple;
	bh=STXnym/Nr2t8Lenz1RUY5A2v+n8iUqtKTitbeFBx2W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcEXfI/u2WZZ/GHpt+t125XvRfUYvruKQKOw6VyI91d+GfL1E1F7j5LGfoPFKiXxXZyFjU5YihgJoYfXmH5kFDNduElwyRumTKpyReug7Vitu7c15Lij/zT3PC1sfEX1r67OHTYK2ZYTJApPgabe3tWAN7PR9LeLWjCYFdDyon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-525b44b7720so321049e0c.0;
        Thu, 10 Apr 2025 03:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280411; x=1744885211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODWzl5U+kYhA+n5JAsKOo52bKLUN4i9fElnwM1XhI38=;
        b=YCREBFisHBkEK1tCrpLenxse1MzacjCJcEWj5tuYzM6fRcbBxGL+brteqvoj+xdHt0
         xT18VYsHMasbyUPMhGQiFJUax4m6w5oyD8fLN0gS+0+NlqMs7sXjUG7Ee6VnKoDsiwgk
         cCm0HA50x9ItrFPSVqtqH0OpBN/Dr0r0yf/98P8M48UOxtiF82cDyP7xhfHK7/1MexS/
         QQx6e+D70RFhON3vYnyYnv6uzqIBeuA2TkVnJ84VVs9U3QFWNT/CQObUQrF//updUSmp
         mtctc7j/2LslEdEnAzS1prze4qDGnLwPNh4RsZ026oa0va0W4qZ6AoR0uN/MX0agQNef
         9mpg==
X-Forwarded-Encrypted: i=1; AJvYcCU/MQ1a+PR8BPLtCU7xLT1fSYQAhrp/oXRgA2S++j5BVDgTp8z3+2E+U3rgFS0Sq6vRHXM1pwjJng2H1j9r@vger.kernel.org, AJvYcCVNi20Tb0VFzr7qbR9lVsblHeFxugTlppjn8XL7aV4Qb9SWOzXYVcqITtnEW1oftRgMAbfzBrN+uRI1oMsx@vger.kernel.org, AJvYcCWRbBwLfmfX7DMEEhgLm1xBjk5XUgmDchf7BMaZG5c+Kn4/cdzUXTLAHl0r3CaO1+uV+4kdE7CLIUx5EA==@vger.kernel.org, AJvYcCXBAgNB/RkHkYDzlEYzJ6JRjFrFYjga4Bru/UYx/YI1Pa34k6vuP0ZjqsqTe6GYA5r0t5KNHqfsnRRFZZl1xEVM4U8=@vger.kernel.org, AJvYcCXjjWFgJ/G0oDNNj3xdGUIbk0s1/TErzm4VhlccI8ZL25co5qBfon970bgDb2Iz4zLQCQmq3ln1aDp4@vger.kernel.org, AJvYcCXw7yAqJ+RQIZPk9BvmEh2arJskelTyDG8i9wO3UVyglxJvaiRaR/Xpq1Rk3ycHkhC0jsN5H2/LLxeH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6zohWV35bBgJnW/opL2TJ5A+Mk99X44CW71RG+8bEXZCgRXI
	9G47JFhy/4t3z8z0Jttd1AVf9cy7nhAog2O0Y8cYn0PjfP/HXViFIVAGv8LSuEw=
X-Gm-Gg: ASbGnctZGGyuw/JPmlxCfxO66Hex2RC1Jpg8j4t7KsaVcQj0pI8mR0OzQZBADBnABdV
	840/kro23WzB5U3W1LWPSTdwqCl/4p48pBERQz7MCSy+qz2TVtvvqxkNI1S7abeiL1M5dV4LsC/
	41tlsT7psNQncJh2S5xp7BMVvYGaqjHVHP8Y7ahaBTMZn/Pm2GM4efxJd7MUwPYZP8mrpyTaeTs
	/USCuP9ueAsxgWQ6RVV588fBY8Bx4Bh9K0M0nciTXcWWI6fQ9JlFOBKr9CG/TJd6q+OUF9w7vft
	pDobOOImLmfkkx6xIT5GdaXfQNebA3KFCn4elLd7EZtK4XPWiOXIQDp+zbmCKR4YKAtT9/lSn8U
	NREU=
X-Google-Smtp-Source: AGHT+IGDnrwd/pRhxXcBRW34jqcXglHIXgKQjOJdxR/uZPSFVzKz648FxnkB/QXrtYn+PgefePQdUw==
X-Received: by 2002:a05:6122:168d:b0:526:483:95fd with SMTP id 71dfb90a1353d-527b50f5076mr1237693e0c.10.1744280411375;
        Thu, 10 Apr 2025 03:20:11 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4e8fdsm585458e0c.2.2025.04.10.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:20:10 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d3805a551so275105241.3;
        Thu, 10 Apr 2025 03:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfknW/C2QFw37QL4sTz1/kD3gMVukMgg5XeTO0u5rDU2iV+kd6Sgx1IbLbVcuIvFYwlQQEaVmbRCXZoYBtaKwjRoE=@vger.kernel.org, AJvYcCUk9jHNC3IoJcgpJrgkzDOZMaj0Rfv/mIh2zf9Wdw7JyH9ynjB9NGIf7v1SGTWO8xwQM04814cqqQj5@vger.kernel.org, AJvYcCVyr7p4jM1+7lWuu6Zfw1hV0vw90zOQs9Gejg5Pr+rcIS37XvGStfglrBl+KuPi4JjPeYGNERFKpHydEA==@vger.kernel.org, AJvYcCXU5pZpe7tC48VfA2BKf36gfjPeARnrziEfGZwM4VIhE3VdHdRQqhlaaAmLDP06LtRCgs+gxClAHVJcGq2X@vger.kernel.org, AJvYcCXpFnUxpwcjxX+wym6wHXh+xKV8vH6gO1AxwbYoS0kC+dwTpvZDdmwEFbGMCKgiHl3T6ycFBMEb0OwxVHL4@vger.kernel.org, AJvYcCXr0Xv0BQ+IR27Y7DJoX2rE9olMjVRTstT3CZtfgN8u/PN/6CNdi4zP9KOSKtF1ttT1WQjdukM0fCT7@vger.kernel.org
X-Received: by 2002:a05:6102:3e8a:b0:4c1:86bc:f959 with SMTP id
 ada2fe7eead31-4c9d34b2b55mr1523924137.8.1744280410407; Thu, 10 Apr 2025
 03:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:19:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRokrL3EPKQbhHhCL84h1fZ7L3LjM0gFw96iqv36EiVA@mail.gmail.com>
X-Gm-Features: ATxdqUGjvQ5S18MOWEQVYhe-LHAQ30tmHpWeWOmzudY-_jg54YISF-DWnbivz3c
Message-ID: <CAMuHMdWRokrL3EPKQbhHhCL84h1fZ7L3LjM0gFw96iqv36EiVA@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
> RZ/V2H(P) pin configuration data. The PFC block is nearly identical, with
> the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.
>
> To accommodate this, move the `PCIE1_RSTOUTB` entry to the end of the
> `rzv2h_dedicated_pins` array and set `.n_dedicated_pins` to
> `ARRAY_SIZE(rzv2h_dedicated_pins) - 1` in the RZ/V2N OF data.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Suggestion for improvement below.

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2304,7 +2304,6 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
>         { "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
>                                                     PIN_CFG_IEN | PIN_CFG_PUPD)) },
>         { "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
> -       { "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
>         { "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
>                                                      PIN_CFG_IEN | PIN_CFG_PUPD)) },
>         { "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
> @@ -2359,6 +2358,14 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
>         { "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
>         { "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
>         { "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
> +
> +       /*
> +        * This pin is only available on the RZ/V2H(P) SoC and not on the RZ/V2N.
> +        * Since this array is shared with the RZ/V2N SoC, this entry should be placed
> +        * at the end. This ensures that on the RZ/V2N, we can set
> +        * `.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins) - 1,`.
> +        */
> +       { "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
>  };

Alternatively, you can replace the single array by a structure
containing two arrays, one for common pins, and a second
for V2H-only pins, like the common and automotive arrays in
e.g. drivers/pinctrl/renesas/pfc-r8a7791.c.  That would get rid of
the literal "- 1" (and the need for a comment ;-), and would protect
against future mistakes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

