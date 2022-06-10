Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A51454669F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 14:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbiFJM1F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 08:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbiFJM1E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 08:27:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DA61E82A3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 05:27:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id s12so45971834ejx.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aru8d9opYdqmVU7zQRIwciw2rKwv+H6TohRF9x2A7Ww=;
        b=bP+L/F9vpe6SrwpYqU2bPZIg64aQeFcuARRZQXdjsQO3LDSbAXkmnQw3f09WYEUL1v
         2eCTbDzVARwxEWMkjUn2i2F5yESMTj0/GC+5KLf5MNKHKPAC11hHWxH3WPkLSJAGzhW6
         B72J/9rj7IMSnvbxmddXcbcLW/eNaP4VA3lw+lmJoa3meD+oU+6QkRemknztYCOHgI3g
         0Eb2eL8dmdwknYS33FNu4Miw+2TWQaarPmEdunJ5Ilg/en02e95Y817XCgRoK/y5NPvN
         OmdyOm4YjzK4j1xHN078P4C5PF0p6KqZwACfUYyAgZqLY54RgbTI5zFWL1SzXmlty7h0
         dLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aru8d9opYdqmVU7zQRIwciw2rKwv+H6TohRF9x2A7Ww=;
        b=sQkHK/q3VZQT5vOEgwXemUmhBATEBT/+WzwZHtyjuBZq68+g/AGjxyC722IyQbL4ZE
         Ma1c3GbxE6N0c05J7GHD8ZAxk6Z5khkfs0VdFPIIrq/Kkxr3vhDZDiNhzjIqJpRfiuGo
         NDM/c7cbkrm40LvkhlfSLJllvOsNe88G5IKrC+zLFuveW5CGvPLxv24TXfDW4xv3AwyC
         OgH/u42BD6IF7J4S3LUMbiQsx/sHXhzLWue3mOie5gMJM5T94nbbsY+S3qjuNugs31y7
         eshECqzIZuYQEYMxTXWllWOShk2c+IBuWW+Da8n7WaMr7y0fHUxyLoluBNFrAKa9e99v
         HHpw==
X-Gm-Message-State: AOAM5310d1EDpKV78mUs6SyaBIiXa1NSJDwyzVkDFn24m3H5Fe8ZwH0J
        wPAXFMli34gOHKo50Zm55QiMirCtmn1ziQCWcyS5Zw==
X-Google-Smtp-Source: ABdhPJzlOAUF7lf77UWUH6vF/DqJlWlqZoKgWH5EhJRsseBG/FKbYMCUuKJPy7ZH6W8ggwSTCxrJqWKXIhgAr/4wIlM=
X-Received: by 2002:a17:907:90c8:b0:711:c8e1:7109 with SMTP id
 gk8-20020a17090790c800b00711c8e17109mr25478777ejb.492.1654864021559; Fri, 10
 Jun 2022 05:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220610075152.10214-1-Sergey.Semin@baikalelectronics.ru> <20220610104500.28774-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220610104500.28774-1-Sergey.Semin@baikalelectronics.ru>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Jun 2022 14:26:51 +0200
Message-ID: <CAMRc=Mc=WYNS3uhDmWGwVsQd5q9i+qYvXuJ_Ks5MwU4Rjdh4Zw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Don't print error on -EPROBE_DEFER
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 10, 2022 at 12:45 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> Currently if the APB or Debounce clocks aren't yet ready to be requested
> the DW GPIO driver will correctly handle that by deferring the probe
> procedure, but the error is still printed to the system log. It needlessly
> pollutes the log since there was no real error but a request to postpone
> the clock request procedure since the clocks subsystem hasn't been fully
> initialized yet. Let's fix that by using the dev_err_probe method to print
> the APB/clock request error status. It will correctly handle the deferred
> probe situation and print the error if it actually happens.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>
> ---
>
> Link: https://lore.kernel.org/linux-gpio/20220610075152.10214-1-Sergey.Semin@baikalelectronics.ru/
> Changelog v2:
> - Use the dev_err_probe() return value as the return status of the
>   corresponding method. (@Philipp Zabel)
> ---
>  drivers/gpio/gpio-dwapb.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index b0f3aca61974..9467d695a33e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -652,10 +652,9 @@ static int dwapb_get_clks(struct dwapb_gpio *gpio)
>         gpio->clks[1].id = "db";
>         err = devm_clk_bulk_get_optional(gpio->dev, DWAPB_NR_CLOCKS,
>                                          gpio->clks);
> -       if (err) {
> -               dev_err(gpio->dev, "Cannot get APB/Debounce clocks\n");
> -               return err;
> -       }
> +       if (err)
> +               return dev_err_probe(gpio->dev, err,
> +                                    "Cannot get APB/Debounce clocks\n");
>
>         err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
>         if (err) {
> --
> 2.35.1
>

Applied, thanks!

Bart
