Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE6648B1B4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 17:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240968AbiAKQN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 11:13:27 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:43553 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240877AbiAKQN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 11:13:27 -0500
Received: by mail-vk1-f175.google.com with SMTP id w206so9778560vkd.10;
        Tue, 11 Jan 2022 08:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2TMyac3teIzHsCPgKUQl60FrQqQoiQPUMwrCuorFe9U=;
        b=25jYlq4Q1p+cECJbwwJ+3HSb6PSt0em9ukpaKwEPX2b90WYYC0ic0xDnYSCyyYR4Pd
         Vgva/JD5RCFvuxLrAKocsdvE6jZA+ANALnXPfWCeJZBUzl6b3VKWUz/Csk1lc9UZ9JHT
         0H1aNs1cv0LKLv4/DErWQ1xUyZAiyRvSDx9VZ8I2d9P2qkRgqG5JLmZ2yTlzwL1SkVFx
         a06VQnWtA/sk3/zcoHGnGmpaYS1OXTs5mJw4smiLJ3w5GLAnyC3Qh7BykrV9hERbKfOe
         Mq8YOlzSU6N3b0wEPJ2xHa8UVz7AmEyNAFOLg8VsXcabLgZuDAqOu/XIN0H9PFX8N4AH
         4cJw==
X-Gm-Message-State: AOAM5312wUSei9VztuLi/VZdCQhDHsOG0Pfh2vwJLPiL/b8RN4fKKAgp
        ToAJq4a2GA/0f6RA7lou/+NsX/oxVDO3rw==
X-Google-Smtp-Source: ABdhPJwerfLuNKAiAKWhR+wuYOaRMwfmMXdbLlHJpQR53vD3m3rX1hvcM7NSPkWgnwc1FatNIUMFJw==
X-Received: by 2002:a05:6122:513:: with SMTP id x19mr2626828vko.19.1641917606259;
        Tue, 11 Jan 2022 08:13:26 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id k6sm5776632uak.9.2022.01.11.08.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 08:13:25 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id m15so16355201uap.6;
        Tue, 11 Jan 2022 08:13:25 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr2305199vsg.57.1641917605412;
 Tue, 11 Jan 2022 08:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20211210113226.40111-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211210113226.40111-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Jan 2022 17:13:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWP4UVWoGB3N8mOhbvLMmSJWZYOPY6-aeS9zO9K0bQkpg@mail.gmail.com>
Message-ID: <CAMuHMdWP4UVWoGB3N8mOhbvLMmSJWZYOPY6-aeS9zO9K0bQkpg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: renesas: rcar: don't enforce GPIO if already muxed
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wolfram,

On Fri, Dec 10, 2021 at 12:32 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For Renesas PFCs not setting .strict, we can snoop GPIOs which are
> already muxed to some other function. To actually make use of that, we
> shouldn't mux them back to GPIO if they have been already muxed to
> something.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> ---
>
> Not sure if this is a proper solution, but at least this is a
> proof-of-concept. It makes the sloppy GPIO analyzer work by assigning it
> GPIOs which are already muxed to, say, I2C or PWM. I didn't see any
> side-effects, but there may be some I missed. Tested on a Salvator-XS
> with R-Car M3-N where the only occasions of MUX+GPIO at the same time
> were the logic analyzer. AFAIU if '.strict' is set, the request will be
> rejected at higher levels, so on those systems should be no harm.
>
>  drivers/pinctrl/renesas/pinctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
> index f3eecb20c086..8d4541ac43a9 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -397,7 +397,7 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
>
>         spin_lock_irqsave(&pfc->lock, flags);
>
> -       if (!pfc->gpio) {
> +       if (!pfc->gpio && !cfg->mux_mark) {
>                 /* If GPIOs are handled externally the pin mux type needs to be
>                  * set to GPIO here.
>                  */

I can confirm this works fine to get the sloppy GPIO analyzer going.
I tested it on koelsch (R-Car M2-W), with additional debug prints
to see the full impact on PFC register configuration, and everything
looked fine.  I also gave it a run on the variety of Renesas hardware
I have access to, and there seem to be no ill effects.

Hence I think it is safe to queue in renesas-pinctrl-for-v5.18.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
