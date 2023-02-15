Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F29697F90
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 16:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjBOPfe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 10:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBOPfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 10:35:34 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F21B74C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 07:35:33 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id h10so10153694vsu.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2i+hOOD/XXfFq2xjGBtPfhSLUO1F+yLEJY+o/KzQff0=;
        b=ZHcCugrnULfmYIH0yONSRJAKEWocuZRU4/fNd3ihGhdl2TUopte1+wRa4yL7n6cMF4
         +fVGoKNvua2UAAw8j2kBVydYFb8S9yK6x3QgkoKcCXyCSEr8NBqxPSU38JcjTU+SG+C5
         0tzZDJm+D7t5kic0PdfCFzCT6eKvtEBI+c2hgIYIXJgKfEydlIW099ygKrFligry0ni0
         FFBGUJpNlGYeHSnLd2ZbYSgcMq1tBqt0UJgZ8fT7rVmLm3Hyseh3irujSSZ2t8QxSGXj
         aNrKbt6qL52O2zdC4vLmPssy9i8E+eUWkhFTmCRpC+3wO7028Y8F+89V/Ya97x9I6x8i
         W1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i+hOOD/XXfFq2xjGBtPfhSLUO1F+yLEJY+o/KzQff0=;
        b=rI3X+ze9yLgyKMC+Mcl/tcv9xLFOk3wJ1o5XRODdwsZUWY57sX5QPpkhANdqTT88qA
         43vriRK6UNPK4luDDBxnZapR2jQ45G+RjPDwCj10Lt+0WyVBL4hCQyBpIwY9mGeJQDpb
         BlO+ky9xDHgC3mHZsBaa6yhKhC7g4qH72wg18NymNOkVUYzUn/Aff2uCFRc+9IjU5Cqw
         Jwjpjsokxfsk7ADLH6w/QXBwMRQdd/MQpgz1Nj3VOYl7VVKvgVVF4pyXoSXmCxEql+sg
         1lmrwm4CFgkFlDiK39iP8XUcBc8zeiCR0uLxbfwkjuQfGq8tJ/OgNZYan0cEAnma7dAQ
         syJg==
X-Gm-Message-State: AO0yUKVeU4Yc6CsS6YUQ6oiJ31FHhvhdox63+5Jrw6n+4zU5SnamWXKv
        Vt1Cf22CpIRlje9Cdlmhs63pd+bce/qC0qGs23Tnbp6qxEsqiw==
X-Google-Smtp-Source: AK7set/G2Po8tORo3A0sfQzAwRiKj4aM9OUEueDuN45rxn0PZFjZDFfFQEVZgZHa+cGC9DZZsPE2A7YhA+HLZaGdXsk=
X-Received: by 2002:a05:6102:7db:b0:410:e23:4ba with SMTP id
 y27-20020a05610207db00b004100e2304bamr421208vsg.80.1676475331880; Wed, 15 Feb
 2023 07:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20230215145206.1761912-1-linus.walleij@linaro.org>
In-Reply-To: <20230215145206.1761912-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Feb 2023 16:35:21 +0100
Message-ID: <CAMRc=McZjQV+C7oZS0eT5JjKDtv-zXzsX941iv5Ow+RmZXAVBQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mlxbf2: select GPIOLIB_IRQCHIP
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023 at 3:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This driver uncondictionally uses the GPIOLIB_IRQCHIP so
> select it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ec7cfd4f52b1..e9917a45b005 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1531,6 +1531,7 @@ config GPIO_MLXBF2
>         tristate "Mellanox BlueField 2 SoC GPIO"
>         depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
>         select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
>         help
>           Say Y here if you want GPIO support on Mellanox BlueField 2 SoC.
>
> --
> 2.34.1
>

I queued that for fixes as it can trigger a build failure.

Bart
