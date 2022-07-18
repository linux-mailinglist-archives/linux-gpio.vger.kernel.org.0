Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56AEA578DC0
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 00:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbiGRWyd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 18:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiGRWyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 18:54:32 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D709583
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:54:31 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id m16so17305768edb.11
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gbZSEA4LHBajIrQWOTsQX7FxI/EIk0XT6iMLE5XMVcI=;
        b=R3k2EeK8ZeDRvCA+dPphyoXPZuj5gZemM98+wdzEIKI615mAifDtBW0TC4OWlUulL/
         fscG0zl28uQThQsY9Ngbs9dFAYuyZweYyk2nvLggoSzi0pom2HvnMyzwizfi05+Hup3Y
         WfLih9+yVw54ive0iVew9jAQvSOTRlL4kq7nEJLAx9N5TrAFiM1GNfUnHnOP2CbU7fck
         zmuUjY2qdSzWUwl7YYIqkkFUDcZMQhd3ykvGCL9FJgv1Jx734kU6v2fD+pGipHH/zNGY
         EDuGWor63E+hBBgpTgslwnDJxxFFc8KVI5nDs3yf30HBN4fRqMp4cePZ0XEuKvmYZ/Fu
         7QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gbZSEA4LHBajIrQWOTsQX7FxI/EIk0XT6iMLE5XMVcI=;
        b=VoZfpjZ3IME4Q3ZAGLYWVwwz1wA4w5jytoyQQc5HO8d2ZMkKQV9TwIngDXDGWHNjkL
         o8rY11UZJp1/+dSxvUq4gUuoN0kNVtFyw3he7m+S4HTRXcgs252gP7Gqfe5RraIl5+tO
         z++lEfVHYdIhVGiVaoJhULEpB4alSN9S12kPJtlLgNsWmnoxaad2VZBKqJig3/oeDqoG
         zxM9N7dfKCISVDY+asImjVpSqC3GUPnaK4vlMqYWeaYQZqOH9n+KW3Z0vTsBSCuRGNlq
         aZGJZn4CvtUD2yY99gA0CORUFE6JL/dHolIC5NGcWp/FXzE8mGeLSAIGkwjd190/fRgf
         ap2A==
X-Gm-Message-State: AJIora9wKsVm2j60BFhlYMRatuSt9HwFqctln0Rw/bTkWy30+m57NuCR
        rVFUdN1LzVVJGp+5meM0M8iPYxXXGIzziUII4JNglQ==
X-Google-Smtp-Source: AGRyM1sx0A40ijK8IbBYt1C6iLyhmgaFm9J2jwc07SDt9jMi4r+FpI4SPplFuupLUlaCnGXcnrUWUSYPkX2DUWG2ZQA=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr38815618edb.46.1658184870515; Mon, 18
 Jul 2022 15:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
In-Reply-To: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 19 Jul 2022 00:54:18 +0200
Message-ID: <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
Subject: Re: Is a multiplexer using latches a gpio controller?
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 18, 2022 at 10:22 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> we have a customer board here that uses two 8 port latches to drive
> LEDs. The setup looks as follows:

Very nice drawing!

> So to change output 2 of latch #1 you have to apply the changed level on
> IN2, apply the previous level on the other inputs (to keep the other
> outputs constant) and toggle CLK1 once.
>
> This way you can drive 16 LEDs (or in general outputs) using only 10
> GPIOs. (And with a higher number of latches the proportion becomes a bit
> more useful.)
>
> Actually this construct is a general GPO (no input :-) controller, and I
> wonder if you would accept a driver that models it as a gpio controller.

In my opinion, yes.

> The dt binding could look as follows:
>
> latch-gpo {
>         compatible =3D "latch-gpo";
>         pinctrl-0 =3D <...>;
>         pinctrl-names =3D <...>;
>
>         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
>         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> };
>
> What do you think?

I would use the actual 74xx numbers for the TTL circuits in the compatible.
I have actually merged this placeholder (without bindings nor driver):

        /*
         * 74HC4094 which is used as a rudimentary GPIO expander
         * FIXME:
         * - Create device tree bindings for this as GPIO expander
         * - Write a pure DT GPIO driver using these bindings
         * - Support cascading in the style of gpio-74x164.c (cannot
be reused, very different)
         */
        gpio_74: gpio-74hc4094 {
                compatible =3D "nxp,74hc4094";
                cp-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>;
                d-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
                str-gpios =3D <&gpio0 2 GPIO_ACTIVE_HIGH>;
                /* oe-gpios is optional */
                gpio-controller;
                #gpio-cells =3D <2>;
                /* We are not cascaded */
                registers-number =3D <1>;
                gpio-line-names =3D "CONTROL_HSS0_CLK_INT",
"CONTROL_HSS1_CLK_INT", "CONTROL_HSS0_DTR_N",
                                "CONTROL_HSS1_DTR_N", "CONTROL_EXT",
"CONTROL_AUTO_RESET",
                                "CONTROL_PCI_RESET_N", "CONTROL_EEPROM_WC_N=
";
        };

What's nice with 74HC4094 is that it has a strobe (str) signal so you can s=
end
out all the values and then strobe them out in one go. But your constructio=
n
makes sense too!

Yours,
Linus Walleij
