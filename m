Return-Path: <linux-gpio+bounces-13866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0C9F1108
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 16:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28485282AEB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E894B1DFE08;
	Fri, 13 Dec 2024 15:33:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AD153803;
	Fri, 13 Dec 2024 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104020; cv=none; b=c/aL8YwCicDnMIRx8JRqODmAMdcXrvwX1aRtDVojJOliOZfvzZMxbV8pAU5y77+/cyJMn7gvyd76kL8xs7kwSvv8mvMXSKdjnovO2QnbUz/cmQ2j5mxpDSDEj6TYr3iBRqpztXPOec1mlEuKEBfcmXOg1KdZKU4Lw5lSErRvVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104020; c=relaxed/simple;
	bh=HUJKthSHQWRnPbBb9GSm51/jQjx+CT6hYN34Oc3ZxFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4cSsQLO/7rnZBFd7r11zBAY/48O5SlKzoEAMtREl9deYo6OND/c0vZKYjtmvQt0L30yO4xCIEoQU5SkU8DolmOfe63usXLGFZ+o/xOC3usqO9FlLCDp1oXMn2oxQlrQSBZzOjIgBsmW1pSqao5SHtFByrlSi52eT8tOh9tsIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d918f066c1so10218896d6.2;
        Fri, 13 Dec 2024 07:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104017; x=1734708817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QxZXxU6nPHT+i8fbp5ti7aLfw4Z2VRpdt1v9r/Gv3M=;
        b=hpzXunc0e5yw7e4QnBsrWVLvGUFQSR9drldHpwcOgDUwHzK4iHEUCcixpC26w+pwdo
         elGN0asYPGEIUPQzvFUzk6LbMdrP1Drik1jlq8PztJ0P4c40equO39sYa7Z3Kmb4jGq+
         zGeUtZAv6ol2PviUiDacPM1qEoIZV0GbsbZtQEDDWedaj+qZfyn7/8t+14XdkabRpVGo
         r2lqpykGCj+vA0b1wTT/QuW425sfK1v9dfAnwdRSZ5+KSMvC1gjWkzfNpghLIaxsgINo
         oOn7cZTX9RWI8njb+b6BWkw1s4O6ROzUvQZHM3wdvaxgXWwv29LrNQki/LVu5F9div1X
         67zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+PKRwqkYGncE5r3WQvk48vA2dBDeL3bP/5QGDUkoMCJ53oMd1/ffJSJPifMNptTzWHvWQAwN5v0s2@vger.kernel.org, AJvYcCWbvwlCTC/84x2Lsb5DnGSmuWqutsu4aRWOuY7EbRsmktkhSYM8ny3INaWK31UKUhjHhGLq2YBPmxoY1bhUfRYc/sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCb+cPEoJW4qEFyCE5N9IKtbgbgV2PMk4y6I7Ln8QsN/xgqvP
	st52Dvr40DlythbFiAcF7nau1tmD+rQjM891pfXWPZRLtYxw7Bzn7masn31k
X-Gm-Gg: ASbGnctOC4g2r65eWXlxvBRytS4hEzf5kVUrsam5FQHqx8PtlPVLfzF3qqmRjT+rFoK
	51BkBDzjHKw2/trEcdLuEAh3tDSa4rOXxTonw2lks/Zk2Uvya/c+6y7H6BVsOoiq2yx1xqzB+5d
	hjjfOq7+iOjuuRelP+UbTnS7gu5eJoWX3Fe36BDb15A+wB0flB+YE0iHyt2kns+QFbBQw817zCi
	47+/prL3hnK4X3lbDZNyQodNEJoNF5H7GXG5u/iqvbbjbr7pqeDDrMZUMYwphe1qHMOAiGWqXDB
	djo6QCymavh69D6pGO3N6sI=
X-Google-Smtp-Source: AGHT+IERpP6mjTUst0/2UgiR3uU7U0tiE9tpGHoTYKOwUEQwrhCIhMQtBIZq+5iPY1PmJFUGipJnxw==
X-Received: by 2002:a05:6214:5011:b0:6d4:1a42:8efa with SMTP id 6a1803df08f44-6dc70f9d5c0mr46329216d6.0.1734104016782;
        Fri, 13 Dec 2024 07:33:36 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8fc9d432fsm68547216d6.8.2024.12.13.07.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:33:36 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6c3629816so83623185a.1;
        Fri, 13 Dec 2024 07:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhvByVVmZEu1v3aRSSls1q/I2ulJMhgxLt7fnQGfBqJtyMHoNJmZqEtqA+R3Qv92BRvI4F+lpvkRkE@vger.kernel.org, AJvYcCWx+DmU8iz1pkeuAsUvKGpXBkhqE0plPIGSAE9yfS/HAXx4SsCcFFxGgnj8lLmuDj4NZYSJlbcVcwfhz9AUxdW8NMc=@vger.kernel.org
X-Received: by 2002:a05:6214:4115:b0:6d4:10b0:c249 with SMTP id
 6a1803df08f44-6dc8ca83d02mr51437416d6.22.1734104015457; Fri, 13 Dec 2024
 07:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com> <20241206102327.8737-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241206102327.8737-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 16:33:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7EOVXSCuM3Y2re9pJzRJhbnF8d+_srdeAwhBu7DArdA@mail.gmail.com>
Message-ID: <CAMuHMdX7EOVXSCuM3Y2re9pJzRJhbnF8d+_srdeAwhBu7DArdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 6, 2024 at 11:23=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add pinctrl driver support for RZ/G3E SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2252,6 +2343,43 @@ static struct rzg2l_dedicated_configs rzv2h_dedica=
ted_pins[] =3D {
>         { "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
>  };
>
> +static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] =3D {
> +       { "WDTUDF_CA", RZG2L_SINGLE_PIN_PACK(0x5, 0,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD | PIN_CFG_NOD)) =
},
> +       { "WDTUDF_CM", RZG2L_SINGLE_PIN_PACK(0x5, 1,

Except for Table 4.2-13, these are called WDTUDFCA and WDTUDFCM
everywhere.

> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD | PIN_CFG_NOD)) =
},
> +       { "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD)) },
> +       { "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_PUPD)) },
> +       { "QSD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
> +       { "QSD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_RSTN", RZG2L_SINGLE_PIN_PACK(0x9, 2,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
> +       { "QSD0_PWEN", RZG2L_SINGLE_PIN_PACK(0x9, 3,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
> +       { "QSD0_IOVS", RZG2L_SINGLE_PIN_PACK(0x9, 4,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
> +       { "QSD0_DAT0", RZG2L_SINGLE_PIN_PACK(0xa, 0,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT1", RZG2L_SINGLE_PIN_PACK(0xa, 1,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT2", RZG2L_SINGLE_PIN_PACK(0xa, 2,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT3", RZG2L_SINGLE_PIN_PACK(0xa, 3,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT4", RZG2L_SINGLE_PIN_PACK(0xa, 4,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT5", RZG2L_SINGLE_PIN_PACK(0xa, 5,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT6", RZG2L_SINGLE_PIN_PACK(0xa, 6,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},
> +       { "QSD0_DAT7", RZG2L_SINGLE_PIN_PACK(0xa, 7,
> +        (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) =
},

SD0_*?

> +};
> +
>  static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctr=
l *pctrl)
>  {
>         const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[vir=
q];

The rest LGTM.

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

