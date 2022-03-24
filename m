Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627994E6ADE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 23:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243864AbiCXWrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 18:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiCXWra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 18:47:30 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF82DB6E4D
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:45:57 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id x20so10900554ybi.5
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jnJBPgTCQpIk4GXIuP3Svzof43wtZ+jGtbmFoomefJ4=;
        b=FR7K6oy09xDnwnDN3lVbdYmbbXOHICk+8+rBqJSPGr/RU3dQxTeRPznc1rSzsIknPK
         6UlSwhVvETV27E/4ZMitIOMAecKMV4CI5oYJC9MmL2EH0hFum21IbkKiaT+cwp6v53yX
         +WreO7gh109pVaE+z8Xcg8vkZ33kVZ1Qvwy6BAv7hWLp0JoB/Vq7fOf8/hjdCJbh+Qa2
         8YtdUl3EEZPWjHFR1j5l/gmsNXh6PB4PuCa7+hWaLWCLum9VHEUNIcPSLXlHttdzr9YE
         1Ei8DWlhR9KeGdNlWhE+jAREG6xEutcw3PAlXHT5w6DJKmBXTowAUSggnVD1BSi/LziL
         gb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnJBPgTCQpIk4GXIuP3Svzof43wtZ+jGtbmFoomefJ4=;
        b=GnfBv1o+0Jbv1WrIkdhsZXK37nicAfQoFmJcieOFECZNnbwO/1vnwQkc6e+hs/dXXK
         vIqFYu3kH7gXdek9a8wW1FarTLAoUDA0OW6YfRJ3S2HIsKz+Y8ULbZvoEnkSxDWXDMR2
         JL1hL0Ct1zMAbj4pkZZ68xqr1Wyh7X0DtQXs7rzqMXpGGkdgOTw+V4TcEYAr2dkJ3Mx/
         tHvVQn7EkwW46BJpcJx4F8clYA9u5v21f2NngCS56xDem1Q0u5f4Y17ZiANLzvA15rKr
         ePuNpnNeuSYt0YeqYjTGl8UrlJwJOurBSxemts7foi7p0/cTXwQ/dDkK9lb6MOsLcB3j
         Eb9w==
X-Gm-Message-State: AOAM533CpsiGjuRZMSzZyeCg4F+AUw2v3nt27O3tJxXo4Nu+s3Ji3C6m
        nrlVhH0qGIX6M9hgALz7xY1chkwf9eFRfqzIyGp+MoAzWYI=
X-Google-Smtp-Source: ABdhPJy39u4ZEV8Xaawz/qPi1GypVDnEF+uqHYrrv2UrKZPEFW8WoLwEg+moNFcTiXR4gN1/U4aNYxhpgrMn5u6g5jM=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr7230564ybb.514.1648161957107; Thu, 24
 Mar 2022 15:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133241.121367-1-shreeya.patel@collabora.com>
In-Reply-To: <20220321133241.121367-1-shreeya.patel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 23:45:45 +0100
Message-ID: <CACRpkdaYck+DOM1t7KCrFpA3O-YOa7A3VLXhSnTXVQ08vc4sXQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: Restrict usage of GPIO chip irq members before initialization
To:     Shreeya Patel <shreeya.patel@collabora.com>
Cc:     brgl@bgdev.pl, krisman@collabora.com, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, alvaro.soliverez@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 21, 2022 at 2:33 PM Shreeya Patel
<shreeya.patel@collabora.com> wrote:

> GPIO chip irq members are exposed before they could be completely
> initialized and this leads to race conditions.
>
> One such issue was observed for the gc->irq.domain variable which
> was accessed through the I2C interface in gpiochip_to_irq() before
> it could be initialized by gpiochip_add_irqchip(). This resulted in
> Kernel NULL pointer dereference.
>
> Following are the logs for reference :-
>
> kernel: Call Trace:
> kernel:  gpiod_to_irq+0x53/0x70
> kernel:  acpi_dev_gpio_irq_get_by+0x113/0x1f0
> kernel:  i2c_acpi_get_irq+0xc0/0xd0
> kernel:  i2c_device_probe+0x28a/0x2a0
> kernel:  really_probe+0xf2/0x460
> kernel: RIP: 0010:gpiochip_to_irq+0x47/0xc0
>
> To avoid such scenarios, restrict usage of GPIO chip irq members before
> they are completely initialized.
>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
