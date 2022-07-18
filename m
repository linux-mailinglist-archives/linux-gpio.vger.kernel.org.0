Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85659578E19
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 01:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236474AbiGRXMR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 19:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbiGRXMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 19:12:16 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F5E2CCA9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 16:12:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ez10so24021261ejc.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YSnQ3rapD15ubKyo5bpVJrV5ccHUA2lXa55ZKSPiAcQ=;
        b=Z/QbbtCgL1R/rvKX8GwhiCOpTlJVurn5orgpixFc7MZ3LgkpakJnbwVfdJE8nsNcDW
         lqVxMLrcN5p85xSYovEH/aDn3Kkhi8by8CNztxJjodhsW7i5WmQP0rgAX6GF2XrCa20B
         yGb+jbKUHcWl38ReLehKmCpC+7pcsZPoaiqmHxeN6Fy+SvLfCy9LFqTjpMMJymgDx5bI
         bqcvBUXSkWJf1BXSspKxT1VF9ZHQpGvEkDcK/q1hbEvMm0/+J8YHikSzO8Ey+q8Sdh63
         HnmmruvQ4MLr+LBBmGk/rTYekC64+5xbWa0+s7cvrhGjS0LJVUVezkwg8OG4jHYQJWSw
         AbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YSnQ3rapD15ubKyo5bpVJrV5ccHUA2lXa55ZKSPiAcQ=;
        b=cLsKhepQkI1z9bgKzUbq7qrQlTvaxljM5bBu+n6fMlA7YlnPuMnOpvS1yAKQeomyMd
         wkQQ6R5024d/OLNR9A3Wxs5oUC4kHj1Q1JL1QvJtGxwMhGITnVe6+un8VcN5AVrr9S30
         3Z5jM0GT8Y6FLnPjgYUcY311KF9ymYKLz27w/AW8FSD1B3fb5tyc3W0jGhJLJstVI1Bm
         v8R0x8xdVV6aU8h2DQFsNHZ3sCsHUvL+LG2U7t8HhGAPxf9e5likI9KiQKNUz7Zu84zn
         1eMiBOKLIwjvzqjmojaeGXce+NauDe/3LGPQM+wgfzctcm+NSckmeivZ76PpcyIYAX+G
         glVA==
X-Gm-Message-State: AJIora8DvkuA1E2T4hHIafZ31NNANWr7AYjd8PXyQBOJ1UEKEpAx0ZjB
        iyF62p3qZHf9Bj9mbxV3llOhrrfJxbKymQvoPUs=
X-Google-Smtp-Source: AGRyM1stZ0RhzF/HMdIf5a64tnztumAuq4OccTGtUiHo2Ux4vHOKV9OCDQvnWU63LCBEav93w5bkMChYv8Roj3JEjK8=
X-Received: by 2002:a17:907:2e0b:b0:72b:8720:487e with SMTP id
 ig11-20020a1709072e0b00b0072b8720487emr27013999ejc.102.1658185934404; Mon, 18
 Jul 2022 16:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de> <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
In-Reply-To: <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Jul 2022 01:11:37 +0200
Message-ID: <CAHp75Ve44vigGk80xpFQ1BrwmA2n8LymKG=btw2ORuQFrM=hJQ@mail.gmail.com>
Subject: Re: Is a multiplexer using latches a gpio controller?
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 12:58 AM Linus Walleij <linus.walleij@linaro.org> w=
rote:
>
> On Mon, Jul 18, 2022 at 10:22 PM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:

...

> I would use the actual 74xx numbers for the TTL circuits in the compatibl=
e.
> I have actually merged this placeholder (without bindings nor driver):
>
>         /*
>          * 74HC4094 which is used as a rudimentary GPIO expander
>          * FIXME:
>          * - Create device tree bindings for this as GPIO expander
>          * - Write a pure DT GPIO driver using these bindings
>          * - Support cascading in the style of gpio-74x164.c (cannot
> be reused, very different)
>          */
>         gpio_74: gpio-74hc4094 {
>                 compatible =3D "nxp,74hc4094";
>                 cp-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>;
>                 d-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
>                 str-gpios =3D <&gpio0 2 GPIO_ACTIVE_HIGH>;
>                 /* oe-gpios is optional */
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 /* We are not cascaded */
>                 registers-number =3D <1>;
>                 gpio-line-names =3D "CONTROL_HSS0_CLK_INT",
> "CONTROL_HSS1_CLK_INT", "CONTROL_HSS0_DTR_N",
>                                 "CONTROL_HSS1_DTR_N", "CONTROL_EXT",
> "CONTROL_AUTO_RESET",
>                                 "CONTROL_PCI_RESET_N", "CONTROL_EEPROM_WC=
_N";
>         };
>
> What's nice with 74HC4094 is that it has a strobe (str) signal so you can=
 send
> out all the values and then strobe them out in one go. But your construct=
ion
> makes sense too!

But 4094 is SPI and covered by 74x164 driver, while Uwe's case is
parallel drivers, which covered by
74xx driver.

--=20
With Best Regards,
Andy Shevchenko
