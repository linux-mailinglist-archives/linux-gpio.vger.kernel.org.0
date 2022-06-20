Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A49552209
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 18:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244275AbiFTQOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 12:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244441AbiFTQN6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 12:13:58 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A9020F62
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 09:13:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cf14so6031526edb.8
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ty8awprqai0PnsSCq09qPzo0eR34m1gtjsQlMZvrqrI=;
        b=e61fj//1r/dHzRAdugX6C98CZ5+UMrG2yhgAj4xK+x83N5PHLzTM+ItVwqfS0KqoYH
         mJddrsYXYKmsCDdNXWSPm8QWRDQg78ecljipxV4V4q1akNBHQBmYs0q4+/f7laPmolp0
         0zJP3Tldn/tz4mldAixymI9Rq1HdPStRd/YL7fdM84bjFAmhR5JbYH8TDHu3Fj/gc7vQ
         vhpt8Jarq4mqrZtZ8/gkcOUrbNRE1o++Mwm1lc241TpinW8wKq8D7QwO7PR1X4gYQT8G
         UmwfnM8DgF6cEA0fWbMGqXeWlE2Mhn7wbeJccW9PzorbXDkMXrstSAMivlJabM5tquXa
         R+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ty8awprqai0PnsSCq09qPzo0eR34m1gtjsQlMZvrqrI=;
        b=wHYplfl4aJtwSsrsb+fKjIVpSsgEn7SpUdUSgAIzDXJSnDrvFnFI6PK9aXZoQcoFZ8
         m9hYSCJi820v/8O9apkpkq687ou39QRAgOMGQjANINU5/DyMrwcprXkAzX1L3TAzGvuG
         B39kyNx8gtSG+Pbe0jclL8urfNG1LOcNngFaG+M/4+P6nwlil3Q2SivUVgZiOHKcCIJL
         diZn2PewSxCzr2kL9qFGGHsG10BODU9S1TOsiCgJy+uxF8G6NAwtBtHTAizUbaTjMZAX
         wWnwQglGNNslcAwZHb7E9zYBykZRb+Jp2YOCxDLwGTSpmb8iEErmBKZTmWN0MYiK9dBD
         c5kQ==
X-Gm-Message-State: AJIora8mbkGzCaQysDtMFW09OCEzjxwdWrMrYLj/N7YnZNj1PJDDlvdk
        sMFECaCCM2WrTSjjvl5wKLFiE/wHZ9P97dCIyg8=
X-Google-Smtp-Source: AGRyM1tKax+yCR9s4kEdqIjfnO3iTGMs4HJYVd3k1yckw0alT8WthWsVVGXVADyPW1eHBAizSsEE43kGj0X9re0jNyo=
X-Received: by 2002:a50:9f6a:0:b0:435:5804:e07 with SMTP id
 b97-20020a509f6a000000b0043558040e07mr25510117edf.178.1655741637680; Mon, 20
 Jun 2022 09:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220620122933.106035-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220620122933.106035-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 18:13:21 +0200
Message-ID: <CAHp75VcjBny6oXpcceoC=w6z0O=zAFA18HgAWV=ZWqV=93r3xQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: grgpio: Fix device removing
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2022 at 2:33 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> If a platform device's remove callback returns non-zero, the device core
> emits a warning and still removes the device and calls the devm cleanup
> callbacks.
>
> So it's not save to not unregister the gpiochip because on the next reque=
st

safe

> to a gpio the driver accesses kfree()'d memory. Also if an irq triggers,

GPIO
IRQ

> the freed memory is accessed.
>
> Instead rely on the gpio framework to ensure that after gpiochip_remove()

GPIO

> all gpios are freed and so the corresponding irqs unmapped. (I'm think th=
e

GPIOs
IRQs
are unmapped

I think

> gpio framework doesn't guarantee that, but that's a bug there and out of

GPIO

> scope for this gpio driver to fix that.)

GPIO

> This is a preparation for making platform remove callbacks return void.


...

What a bug are you seeing in the GPIO library? IIRC for IRQ over GPIO
the GPIO holds the module reference count as well as GPIO device
reference count. Am I wrong?

--=20
With Best Regards,
Andy Shevchenko
