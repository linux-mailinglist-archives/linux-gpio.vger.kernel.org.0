Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA807C40C5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 22:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbjJJUGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 16:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbjJJUEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 16:04:52 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77257D58
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 13:04:27 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7c08b7744so13405487b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696968266; x=1697573066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsgx0xQPge+9HmU8GeSr2i19e9kEWopqk+L20TkvvHU=;
        b=jYRDHubkHHeppyz50JJbbaZ8vgaSUrCsB5PS5zWtcfTY0UmBwGsKq1Xl0sY6zrhQqg
         O2u01L10tDfCLqUokrv372DGqDCMM/wrwEbQ3zHLml30+JXdWaIlqBTyEdsmgeniEnbq
         oEvIVjtpLK0LmAse6TsnBEbAjc2MZNMW31B5tymVrnYpyqHLq7hunLvl4lD4Jauhg4Px
         scOpNYWhfEVmbaJ5s1dqQcyrbAlc4UBGUrhEpIm/tQkKI7P/Qk8WNphImqdUS1IsP5xA
         jBL7dntbchvV7YlpdYsSkMsaiMsXn/wrZ6tTFkHMk0CevyRr5MXns8TW530aFsH5oMdD
         HtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696968266; x=1697573066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dsgx0xQPge+9HmU8GeSr2i19e9kEWopqk+L20TkvvHU=;
        b=e3oOCRk6J375RemNl4Utl+w+6rmDkaq5xLYzUfbKgqLYmQ+d3KxgMT4E469IWnjDZ7
         CnMuRYZrQLtSd8wyD4zcD0ELn6SKFiHdvSH2q4m5pj5vmMf7CIPpxQc8kDmhQ4w93S8G
         r60dJqr+J8lhwRbyWc58xjACyEgaf3rs0mG2dag+GgfYXLJkbHbCmJ8IN1lSP3OLzYkl
         EOZEkYy9dUIIhmv11qWhPpDfcUUNG4N/9QXfnsiKcaNrhlnb7a2G/kFjH18V7TsvuGWI
         fHxpBO8s8Qx/4GQwb8YlYWjF6akMkojvGS2KIYcyzdLl9FPpe4Ce06hHgmeG2nu8U4Tt
         VyRw==
X-Gm-Message-State: AOJu0Ywal7CIHxm2hw6DH2ij4Mu24+2pFhucUTVpwzobl7jq8sVIZV4f
        r31KqXhHKlwthINZn+Br0aAN4XQCQvoYNDCyIhyM9Q==
X-Google-Smtp-Source: AGHT+IGzom/ReBeggPYaQh3ululPlpooeQvd3UU+g9vhHJOk+VetQr2sXUXYcWmIJ7V4FJosqHhUU7LLH1jqvS0oyO0=
X-Received: by 2002:a81:b71f:0:b0:5a7:aa83:9fb with SMTP id
 v31-20020a81b71f000000b005a7aa8309fbmr4756178ywh.0.1696968266581; Tue, 10 Oct
 2023 13:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-pxa-gpio-v7-0-c8f5f403e856@skole.hr> <20231009-pxa-gpio-v7-2-c8f5f403e856@skole.hr>
 <CAMRc=Mc7=E9bMQgiUM8qqk7UD4+exhJZqw2DucTcsnqHcttR3Q@mail.gmail.com>
 <12313687.O9o76ZdvQC@radijator> <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
In-Reply-To: <CAMRc=MdWYNmBkJ6Nw6V_FzJKQw--g02tjLSztMYW_atNhisVpw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 22:04:14 +0200
Message-ID: <CACRpkda4ZeQ8eYKqXBR7XmWj9jJF58C+PLeRWqx2m7aSf2FWQw@mail.gmail.com>
Subject: Re: [PATCH RFT v7 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2023 at 7:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> It doesn't seem like anyone is using these GPIOs once they're
> requested? Wouldn't the above definitios be analogous to:
>
> GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, GPIO_ACTIVE_HIGH, GPIOD=
_ASIS)
> GPIO_HOG("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, GPIO_ACTIVE_HIGH, GPIOD_=
ASIS)

They are used:
+       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
+       spitz_gpio_leds[1].gpiod =3D leds->desc[1];

The descriptors are passed to the leds-gpio driver.

But wait: no.

This whole thing:

+static struct gpio_descs *leds;
+
(...)
+       leds =3D gpiod_get_array_optional(&spitz_led_device.dev,
+                       NULL, GPIOD_ASIS);
+       spitz_gpio_leds[0].gpiod =3D leds->desc[0];
+       spitz_gpio_leds[1].gpiod =3D leds->desc[1];

Just delete all that.

The leds-gpio driver will request and use the lines.

It was just so unorthodox that I missed it. Adding the descriptor
table is enough.

Yours,
Linus Walleij
