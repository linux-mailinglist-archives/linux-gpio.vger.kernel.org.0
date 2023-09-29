Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA657B3B94
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 22:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjI2UsT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 16:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbjI2UsS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 16:48:18 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AB31AB
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 13:48:16 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bebd5bdadso179623877b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696020495; x=1696625295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PB3in7uQxQJMooXEXWpiBaHwk+ekocGtELm1zz7ac4=;
        b=U+3jJ0gKkYUho3gGmo88xldu9TJkA1CeWbLN6HTCIqW5mV1hQqFWK0XqN3lvN+ZMed
         /03R+MVkn/T25onIUeUtupXjNBoRNrZad4lqXb8xl5FdLo6ryTLVF9sCvD2SVPqZO5MN
         DvtFj4+5tFKF6OXQp6jzMKSOEV47nVCVnGqyFVjbOIbFksJQeyciKt+uKG53N6FZ0/iM
         GDGifjx7/jNpVpPguiJqoN7a+dkqrlYPuf7EQIYEfi0TgRtbg2QkFTOyMOb2/OsTw5+M
         DUhtfzEqqOyDKFmrVCw9W9Cjzea+6qYXomi4zNsvmCUXpnUAhozJ7r3qkw5bRhz06pty
         l21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696020495; x=1696625295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PB3in7uQxQJMooXEXWpiBaHwk+ekocGtELm1zz7ac4=;
        b=nD/lbpDnVSJ13jOFh1ajd0cNuyzAFZmniQuaTx0KUyUk8C1YiNVu6mmd6AkRPfrM+m
         JAF6gB7JFd1J2MLaPFNsd+o8/chBHqCPapASEQ4J7Cw+R3cvvCoNt7dm2QwMqVIDhXR/
         hDz796MucozmZZG2ikfSy//hu+rvlvwvCigFrugaMPl7b7CCdCTh/xrDeyHNW5mp6GeU
         7yKYU0Yu0OkU72OYoX2f1+dMgwBBnHO8PA0qtF+P29c97m8reG+3AjOYxM8sBWL4wZ0Z
         siJdOVWIf5Fia34/d4q8xovGvMbgnY8ySOfEPSb98YR7M8j8Qk+SyVJY+ikdczKUaIw7
         ptjw==
X-Gm-Message-State: AOJu0Yw/CwQzr9w9zDamfZnPONH9XVqQzPWhS66xaUHvaeKSZjg5LXkZ
        DOKI58nipquYu55ZlDm1rPwdixMfgXO7HZlqYgU4hw==
X-Google-Smtp-Source: AGHT+IGhNuagYdzoQaqD/8H7vq+7TA/IEUrISt5AV9Vh1CFU389coOm1p2xo8o1X5Amvawa/yVVBQqfrtYEIKvx1fl4=
X-Received: by 2002:a05:690c:f8e:b0:5a2:4fd3:d05 with SMTP id
 df14-20020a05690c0f8e00b005a24fd30d05mr2158753ywb.31.1696020495343; Fri, 29
 Sep 2023 13:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-pxa-gpio-v3-0-af8d5e5d1f34@skole.hr> <20230929-pxa-gpio-v3-2-af8d5e5d1f34@skole.hr>
In-Reply-To: <20230929-pxa-gpio-v3-2-af8d5e5d1f34@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 22:48:04 +0200
Message-ID: <CACRpkdbDVLZBku4VYK98VNDB5qdd-O5XtZsynT+d4MRf96ExXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Duje,

thanks for your patch!

On Fri, Sep 29, 2023 at 3:15=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
(...)
> +       .table =3D {
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_ORANGE, NULL, =
0,
> +                               GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_GREEN, NULL, 1=
,
> +                               GPIO_ACTIVE_HIGH),

This looks right!

> +       gpiod_add_lookup_table(&spitz_led_gpio_table);
> +       spitz_gpio_leds[0].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 0, GPIOD_ASIS);
> +       spitz_gpio_leds[1].gpiod =3D gpiod_get_index(&spitz_led_device.de=
v,
> +                       NULL, 1, GPIOD_ASIS);
>         platform_device_register(&spitz_led_device);

I missed this before, sorry.

This will probably not work. You need to register the spitz_led_device
first, then
you can get the gpiod:s.

The lookup will use the device name to locate the device, and if the device
isn't there it can't be found.

Yours,
Linus Walleij
