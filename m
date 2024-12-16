Return-Path: <linux-gpio+bounces-13919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 547259F3474
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 16:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBD2A1883F32
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEA91465A1;
	Mon, 16 Dec 2024 15:25:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E029013B7BC;
	Mon, 16 Dec 2024 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362743; cv=none; b=is7yfDHbR0Zbiu3jguPILSKF6c1y3shU/PFpGZ+tQPPXbR3xOW3e904caXdgpv3wBh41Q8veZqjYgzb95zZu2dsFZ0FmcwyoY06oBl+j8Z3kXKlNDiBHgCBLcxzwraCulXDtkFIYkNiuOW9AbQJceanwUSkBAzXu/41hCvXEDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362743; c=relaxed/simple;
	bh=wx7qcr/V6dWB5/dKspvjX2bygI4zA5JlejlM0IAWKLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/bxXGfaUESeAjXJPIU1k2mYwv8N+2o3iawW4NaP5W1HX8wiGSeob248HfsExClnmpx6WHaoXrXoq8Rj9s4ybCorDswSn6h2sZpqnGxMhUDNexvQw41jicIapvrdx3R/e8tIBSg+EjzoO0hgyV4fGSrup4nx3DSYFAJ7PJ5M8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d88d3d1eb6so39911516d6.0;
        Mon, 16 Dec 2024 07:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362739; x=1734967539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qca1jMXcWBb1vwdJmFpsybRuSIFF/oC4sYoKFFNjm5w=;
        b=YO2I5qlrIOUFZcGx+G0wg9HLKtnpljN/m4foTahDQm1Hpg8czEdK4FQ2lFY4HOnqbJ
         nNEyP+1F1EuvT9t0Z3rYTyt/ZtaIbZqIRHoyKCnFLQQfW4+RXiLjj8YJuo+NTsnEiOjK
         frXybKGufQfgYKYKH1hynE5yIAMFZdAKYU5ZiAVWlyUPjBwwfRtGlqLVv9UHpj/QQQNj
         JHIOe7YH7uWeESJ3Cq1HqDONxFdtI+Tdw4CoohuShcJcBnC8IvNV6eSmNINb3vqsETRj
         wEej3+PjKuhFHrSmLoSY2qX8ySBezQwPjQZGo1PZfzyQ8hKP8+O0FIbCWzf0c/tpJRiw
         nbcA==
X-Forwarded-Encrypted: i=1; AJvYcCVQl7GqMb1rkr0t00WAa8jD4fib5Zm4rsVX1sbYW8famyIFDQsCGGlWzFNE6+U2PQWPPV40BOcQQlX2olOYdkklueI=@vger.kernel.org, AJvYcCWys/G0+yPp7hhaFU7JVc0jPBdMa5awfBfSriKReboCzYsvqfYnbdCvXysOZQy8BVhnlgd3ZJx1pBBU@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHWnYIlMm+t46oKpRkO2FLO5ZKPG98pFbTT7CfgwtJimbz5rb
	w+P1aHNrCTz6LOOiV2qZNsVw0Zt7qST3GnrFAyjmwowTZYMObFa2d6+MxI0c
X-Gm-Gg: ASbGncsh102RmyB+PQW1l/KDKx6CVH/t0oZ3OOOgVhlWnktXFVIAexjPdoCu5iNmd4+
	r6GEx6uiZOX0Qt/8pHN3Ik9SXJxxTYLLNgA/HQcwQ/wAV5X3oDQpaeqK/qcZ3mpJA8rClDb25Lm
	B2YKICky/oXj3fh/FnO5lnjgb2GbcCLxfD3rer8ZEguoO4LY6qWjgoFCQ8DubU7nOGLXXa8Tts5
	j9eROF+OCnizuNV0C3C/T73cK5XXUjs0rsYkg9LvdzGloGCdFbtkOxWOwzQQtrPiqB0Peo/V9oP
	Ku3zr/Prw37XOikbnTEFJSg=
X-Google-Smtp-Source: AGHT+IGMN+5TcSMvS39rvMKLnBYjuuDELLt0LBBJMW85FT37vB4cqdPlFt8eM9tg5YjPIDEdTU16xA==
X-Received: by 2002:a05:6214:f22:b0:6d8:ad28:adce with SMTP id 6a1803df08f44-6dcbf0d521cmr234495676d6.15.1734362739190;
        Mon, 16 Dec 2024 07:25:39 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd25a2c8sm28336136d6.40.2024.12.16.07.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:25:38 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f7d7e128so359833585a.1;
        Mon, 16 Dec 2024 07:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTBIW6pxuGtSPmALneo3KTBIMLMojfT9ZSDRG5osTLsdcse1YOmYLy1OfXtVLyKI1s5vlcFPJkInOpJM5YOrQ2ar0=@vger.kernel.org, AJvYcCX5rezpBjD88H0JtFPP72vgEvnobbspaDJ27SDXwXGEw7dRFR+XZFqC6arkDo0RJxdsEOz/SEtNYmxY@vger.kernel.org
X-Received: by 2002:a05:620a:2943:b0:7ac:bc66:5efb with SMTP id
 af79cd13be357-7b6f8dce0f6mr2315459485a.27.1734362738155; Mon, 16 Dec 2024
 07:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com> <20241213173901.599226-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213173901.599226-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5WH2qnS_CQopN8J097oy_v=o86iNdSwmn8ny9Nfb2Kw@mail.gmail.com>
Message-ID: <CAMuHMdW5WH2qnS_CQopN8J097oy_v=o86iNdSwmn8ny9Nfb2Kw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 13, 2024 at 6:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add pinctrl driver support for RZ/G3E SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced RZG3E_* macro with generic PORT_* macro.
>  * Added ports based on hardware indices.
>  * Replaced macros WDTUDF_CA->WDTUDFCA and WDTUDF_CM->WDTUDFCM.
>  * Replaced macro QSD0_*->SD0*.

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1962,6 +2000,73 @@ static const u64 r9a08g045_gpio_configs[] =3D {
>         RZG2L_GPIO_PORT_PACK(6, 0x2a, RZG3S_MPXED_PIN_FUNCS(A)),         =
               /* P18 */
>  };
>
> +static const char * const rzg3e_gpio_names[] =3D {
> +       "P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
> +       "P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
> +       "P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
> +       "P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
> +       "P40", "P41", "P42", "P43", "P44", "P45", "P46", "P47",
> +       "P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
> +       "P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
> +       "P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
> +       "P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
> +       "P90", "P91", "P92", "P93", "P94", "P95", "P96", "P97",
> +       "PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
> +       "PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
> +       "PC0", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7",
> +       "PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +       "PE0", "PE1", "PE2", "PE3", "PE4", "PE5", "PE6", "PE7",
> +       "PF0", "PF1", "PF2", "PF3", "PF4", "PF5", "PF6", "PF7",
> +       "PG0", "PG1", "PG2", "PG3", "PG4", "PG5", "PG6", "PG7",
> +       "PH0", "PH1", "PH2", "PH3", "PH4", "PH5", "PH6", "PH7",
> +       "PI0", "PI1", "PI2", "PI3", "PI4", "PI5", "PI6", "PI7",
> +       "PJ0", "PJ1", "PJ2", "PJ3", "PJ4", "PJ5", "PJ6", "PJ7",
> +       "PK0", "PK1", "PK2", "PK3", "PK4", "PK5", "PK6", "PK7",
> +       "PL0", "PL1", "PL2", "PL3", "PL4", "PL5", "PL6", "PL7",
> +       "PM0", "PM1", "PM2", "PM3", "PM4", "PM5", "PM6", "PM7",
> +       "PN0", "PN1", "PN2", "PN3", "PN4", "PN5", "PN6", "PN7",
> +       "PO0", "PO1", "PO2", "PO3", "PO4", "PO5", "PO6", "PO7",
> +       "PP0", "PP1", "PP2", "PP3", "PP4", "PP5", "PP6", "PP7",
> +       "PQ0", "PQ1", "PQ2", "PQ3", "PQ4", "PQ5", "PQ6", "PQ7",
> +       "PR0", "PR1", "PR2", "PR3", "PR4", "PR5", "PR6", "PR7",
> +       "PS0", "PS1", "PS2", "PS3", "PS4", "PS5", "PS6", "PS7",

Can the non-existing P9x, PIx, and PNx-PRx be left NULL?

> +};
> +
> +static const u64 r9a09g047_gpio_configs[] =3D {
> +       RZG2L_GPIO_PORT_PACK(8, 0x20, RZV2H_MPXED_PIN_FUNCS),   /* P0 */
> +       RZG2L_GPIO_PORT_PACK(8, 0x21, RZV2H_MPXED_PIN_FUNCS |
> +                                     PIN_CFG_ELC),             /* P1 */
> +       RZG2L_GPIO_PORT_PACK(2, 0x22, RZG2L_MPXED_COMMON_PIN_FUNCS(RZV2H)=
 |
> +                                     PIN_CFG_NOD),             /* P2 */
> +       RZG2L_GPIO_PORT_PACK(8, 0x23, RZV2H_MPXED_PIN_FUNCS),   /* P3 */
> +       RZG2L_GPIO_PORT_PACK(6, 0x24, RZV2H_MPXED_PIN_FUNCS),   /* P4 */
> +       RZG2L_GPIO_PORT_PACK(7, 0x25, RZV2H_MPXED_PIN_FUNCS),   /* P5 */
> +       RZG2L_GPIO_PORT_PACK(7, 0x26, RZV2H_MPXED_PIN_FUNCS),   /* P6 */
> +       RZG2L_GPIO_PORT_PACK(8, 0x27, RZV2H_MPXED_PIN_FUNCS |
> +                                     PIN_CFG_ELC),             /* P7 */
> +       RZG2L_GPIO_PORT_PACK(6, 0x28, RZV2H_MPXED_PIN_FUNCS),   /* P8 */
> +       RZG2L_GPIO_PORT_PACK(0, 0x29, RZV2H_MPXED_PIN_FUNCS),   /* P9 */

P9 does not exist, so I think it should be left empty (NULL?).

> +       RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),                 /* PA */
> +       RZG2L_GPIO_PORT_PACK(8, 0x2b, RZV2H_MPXED_PIN_FUNCS),   /* PB */
> +       RZG2L_GPIO_PORT_PACK(3, 0x2c, RZV2H_MPXED_PIN_FUNCS),   /* PC */
> +       RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),                 /* PD */
> +       RZG2L_GPIO_PORT_PACK(8, 0x2e, RZV2H_MPXED_PIN_FUNCS),   /* PE */
> +       RZG2L_GPIO_PORT_PACK(3, 0x2f, RZV2H_MPXED_PIN_FUNCS),   /* PF */
> +       RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),                 /* PG */
> +       RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),                 /* PH */
> +       RZG2L_GPIO_PORT_PACK(0, 0x32, RZV2H_MPXED_PIN_FUNCS),   /* PI */

Likewise for PI...

> +       RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),                 /* PJ */
> +       RZG2L_GPIO_PORT_PACK(4, 0x34, RZV2H_MPXED_PIN_FUNCS),   /* PK */
> +       RZG2L_GPIO_PORT_PACK(8, 0x35, RZV2H_MPXED_PIN_FUNCS),   /* PL */
> +       RZG2L_GPIO_PORT_PACK(8, 0x36, RZV2H_MPXED_PIN_FUNCS),   /* PM */
> +       RZG2L_GPIO_PORT_PACK(0, 0x37, RZV2H_MPXED_PIN_FUNCS),   /* PN */
> +       RZG2L_GPIO_PORT_PACK(0, 0x38, RZV2H_MPXED_PIN_FUNCS),   /* PO */
> +       RZG2L_GPIO_PORT_PACK(0, 0x39, RZV2H_MPXED_PIN_FUNCS),   /* PP */
> +       RZG2L_GPIO_PORT_PACK(0, 0x3a, RZV2H_MPXED_PIN_FUNCS),   /* PQ */
> +       RZG2L_GPIO_PORT_PACK(0, 0x3b, RZV2H_MPXED_PIN_FUNCS),   /* PR */

... and PN-PR.

> +       RZG2L_GPIO_PORT_PACK(4, 0x3c, RZV2H_MPXED_PIN_FUNCS),   /* PS */
> +};

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

