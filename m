Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF6E7AF4F5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 22:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjIZUWL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 16:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjIZUWK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 16:22:10 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEBA120
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 13:22:03 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59f4f80d084so86490117b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695759723; x=1696364523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQPgNKa2ckzekLFC/mzb8gdM+KeB0NKG+j9gRkdkJyY=;
        b=moYeveR07OEjQ6/umxmF+9HR0p1HjxOMeHYGeQefnIYH1OAABI++MO7umRQIPdRw5e
         +/vKjGDlIX1+7+/NrPkNGdxjvKNZucfwtx+Ih5NtTABVYSqKkNB6YqIpbUPVA2U2mE7x
         4Qnwe7BLfXEiMyTI3gMT4YWElWPhs02/V4FTCRwMSBQu0xISH/AzQ2moh41+40yvj9s5
         21mMjtIvVsokUECCDYg4BTj0I0r+5MC0LEhAy+HaYSr5TUeiAuyIaqUXQdC/oZD6VKnY
         qs0GPpM1K+eGoRmw47pSY5FeZfoGI6Yny+IxTmMmZM2s4MunHvwcdY1FFDuu7/2gm6bd
         NZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695759723; x=1696364523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQPgNKa2ckzekLFC/mzb8gdM+KeB0NKG+j9gRkdkJyY=;
        b=uPmAOQKUA+YlZ/bLRNRJVManJIm/i3qYZsETfUen4lUJ+D6HqVU0SwY1lItjb6qtRt
         6oSL2fgjDY/9ct2gX1T7glhIrUmpKYpUpkOKeRkt6gtROWrE7L0jvqKUT8idvqE5ga2O
         L4uleTjwIel5YqeyOKvDqPbL4CDKJNLBlDVxHOMYD9LYKBpklvFiCFwru/jRv6LfF0DE
         IXjOKpaGDxULn0TsrDyjwJAJflgSrPbADl5XjVTReYPhLJYw4/3U/6JX7jMWBawdIMnr
         fgTBL/6JsstTZhiCLkWGHbhpE5zeKsA6tfs7Mp6A0AIRrUCXs055IlocVENAsiH8uD2h
         p8FQ==
X-Gm-Message-State: AOJu0Yxi6YWyhXLRaJhoUgauSaP6UFVyGC4A8vkqPqimIqg1EAwcm0EH
        mZmmDNu2o24ZaXjwgnvmrBWKBo29QDX7tUsQO3HbBymmJ6LATVL5nQE=
X-Google-Smtp-Source: AGHT+IFdsZivhBu7767dRMUTS4xzM+2fJEFXct3seu6QtXNrBvvb2Kl0FmLDOB3+wgdk2qyy/xNzAYl+aSMdAVjIs50=
X-Received: by 2002:a81:a0c3:0:b0:58c:53ad:ee3f with SMTP id
 x186-20020a81a0c3000000b0058c53adee3fmr74738ywg.34.1695759723006; Tue, 26 Sep
 2023 13:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230926-pxa-gpio-v2-0-984464d165dd@skole.hr> <20230926-pxa-gpio-v2-2-984464d165dd@skole.hr>
In-Reply-To: <20230926-pxa-gpio-v2-2-984464d165dd@skole.hr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 22:21:51 +0200
Message-ID: <CACRpkdZBbUa9C=wj9vSuCem50+JutiYy-AMwMExKdC5SoVghgw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/6] ARM: pxa: Convert Spitz LEDs to GPIO descriptors
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

On Tue, Sep 26, 2023 at 5:46=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Sharp's Spitz board still uses the legacy GPIO interface for configuring
> its two onboard LEDs.
>
> Convert them to use the GPIO descriptor interface.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
(...)
> +static struct gpiod_lookup_table spitz_led_gpio_table =3D {
> +       .dev_id =3D "leds-gpio",
> +       .table =3D {
> +               GPIO_LOOKUP("pxa-gpio", SPITZ_GPIO_LED_ORANGE, "led_orang=
e",
> +                               GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("pxa-gpio", SPITZ_GPIO_LED_GREEN, "led_green"=
,
> +                               GPIO_ACTIVE_HIGH),

Unfortunately this is not how leds-gpio works.

You have to have the name be NULL instead of "led_orange" etc, and
put the LEDs in index order, in this case something like;

+       .dev_id =3D "leds-gpio",
+       .table =3D {
+               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_ORANGE,
NULL, 0, GPIO_ACTIVE_HIGH),
+               GPIO_LOOKUP_IDX("pxa-gpio", SPITZ_GPIO_LED_GREEN,
NULL, 1, GPIO_ACTIVE_HIGH),

Yours,
Linus Walleij
