Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1997A449888
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 16:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240979AbhKHPiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 10:38:55 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:33692 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbhKHPiy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 10:38:54 -0500
Received: by mail-ua1-f49.google.com with SMTP id b17so32355607uas.0;
        Mon, 08 Nov 2021 07:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4LeFueSc7hLKiDpRlmPKtWWYGiljXl+wMBq6RJeU0c=;
        b=tmzvGeAwq+6gx0Eac/XWrOTd3yKwvI9T86qtVgAFiE1iuMKpcMKgfMqUTnZ85mb8qn
         YbuV3cIPN3N/63eInR80NkNVTa3aNpCk/pSVbml6TM9j5MX3nRzbIuUBRSJGtvjZVFfF
         6E6j4xiBCFXQnrqhcHokEpkFrSYvtvedKzJLmRVtwmx86vCUyjUFGGsMZ5hahZ9W7NqC
         A2puvO4mv6YrKrG3wBZn+Y8NkhnYLnmuh+/d6P+5vt+AT0net4OfaWolBBFzN4TNyybE
         BhNHWBYE5w7ANTts1ERX46ilbHzxD9A7PGInNzWh4Es07f5FrGz0auoNa0OhrBu0PkEn
         lIzg==
X-Gm-Message-State: AOAM533q+yzptSoSUCeKyQWT6Y9tFLWcOJXVxyrL1c76z1R8IQWCBM/1
        a3fGbUkw6wfd2j07MJiladKpEdztk3f660ot
X-Google-Smtp-Source: ABdhPJwjZe4LP3emz8bOQYdEOauW75VPvFIE2XCNaPDZu4Ev4NkmVlOvNKwhXNka7WusXpyFmacWiQ==
X-Received: by 2002:a05:6102:ed3:: with SMTP id m19mr405335vst.5.1636385769345;
        Mon, 08 Nov 2021 07:36:09 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id t12sm2618968vkk.52.2021.11.08.07.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:36:09 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id b3so32334505uam.1;
        Mon, 08 Nov 2021 07:36:08 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr75198533vsu.35.1636385768673;
 Mon, 08 Nov 2021 07:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 16:35:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com>
Message-ID: <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set pin config for GPIO port pins
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support to get/set pin config for GPIO port pins.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -495,6 +512,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
>                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
>                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> +       } else {
> +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> +               port_pin = true;

Instead of setting this flag, perhaps port should be adjusted?
Then rzg2l_r{ead,mw}_pin_config() don't have to care about that
anymore.

> +
> +               if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
> +                       return -EINVAL;
>         }
>
>         switch (param) {
> @@ -557,6 +582,14 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
>                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
>                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> +       } else {
> +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> +               port_pin = true;

Likewise.

> +
> +               if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
> +                       return -EINVAL;
>         }
>
>         for (i = 0; i < num_configs; i++) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
