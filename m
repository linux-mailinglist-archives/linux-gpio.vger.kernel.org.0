Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D43B3B99E5
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 02:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhGBAMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 20:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbhGBAMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 20:12:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1058DC061764
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jul 2021 17:09:29 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq39so2340407lfb.12
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jul 2021 17:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSioyAxRhL+T4Kz1oYTd6+IXqYGgxKke1/8HrWftbXw=;
        b=GYo3bgZGgzxukZ//9CU0suFsHalp9rrtUeco7oqsVp9rmAxIKKJMDHV5MmCreRKCYe
         NwPJQtTClEcVfx6welm/q4dWWLj+0OvhO5QaVC9lJPdOeo3kOXYMHoWLNf7jFfv5eHHT
         CRZYRlH9Owfa1lgs/7Y2nLZrNaDHOPcWl1i9d2a30EMLI2oqqR2ixfdiMx5DpdOd1FTi
         lbPuE/fWimNQiXA2vT7FY8iuyTq8QH91dn779cfKw2s726Lk8VPxkAAltkI2Ecd5aN2c
         x0SULlAyr3Pj8Lo6v0Q2xQ15JReGyT7CPOQHbr0hApuAwGcnQepOFg8giGv3WGETZU9y
         IBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSioyAxRhL+T4Kz1oYTd6+IXqYGgxKke1/8HrWftbXw=;
        b=duKLxh0HVcUuEZm7F+AcWcebwjwDoNteaMV/s4DUuUTzUYYzCTDv3AqUsfnO4TBgXV
         mA0YquGwI0/JK+1/rIumUmgwJM7DhNxc1CaKOQjPBVtnvlCMw4e/BDq4W2vAiKDqp3V5
         FTW4N+/bQV0MEGBsfVczzjUrHJF6WyOmGwndGDRlrOTkXz1FftPA2mjyx7byKqZyuTtt
         p243Y1/Icb6aveXFYNcKeT1p8c7uab6sveM7mi27zjsBrwFUenNZA5WVrZWirkZb9V7z
         MxKnunnXQihFlfrJ+1SBg5KCfkD1AtvlEdLbRM1b9F/pCNyHViTosGtbo2IDCR1ytHzo
         bbSQ==
X-Gm-Message-State: AOAM531cxrakI+oJ7XjVbVFkctJRVkIHDOMAiIVby66XV69H4qQCYkux
        7Dv/8N5QzgsuDO0B1naOuYfUg8cLxK67yo95A5gz2A==
X-Google-Smtp-Source: ABdhPJx9MLbSsjqLQciWXdUynMkMJmQbWzruHlTEYNE0GGVAuQzUNHCWeLEBq+xkNDrxpGs9VFWhv4BiWRUofBxFLEM=
X-Received: by 2002:a19:f202:: with SMTP id q2mr1642554lfh.586.1625184568235;
 Thu, 01 Jul 2021 17:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
In-Reply-To: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jul 2021 02:09:17 +0200
Message-ID: <CACRpkdY4bU=bEAyA5ZCx7PVF7nKoPSR7iv6x0t-QM6Bc6bc99Q@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 28, 2021 at 5:37 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:

> gpiolib (gpiochip_irq_reqres, gpiochip_reqres_irq, gpiochip_lock_as_irq)
> does not call gpiod_request_{,commit}, resulting in a pin which is available
> for use.

Nope and they should not.

> Is this intentional ?

Yes.

The basic reason is that gpiochips and irqchips are orthogonal.
You can request an IRQ on a GPIO line without requesting the
GPIO line for anything else.

This is also used when drivers want to inspect the state of a GPIO
line (read the value) while the same line triggers IRQs. This is
perfectly legal. An extreme example is:
drivers/media/cec/platform/cec-gpio/cec-gpio.c

There is sometimes confusion around gpiod_to_irq().
This is just a convenience function locating the IRQ for a certain
GPIO. Both resources still have to be requested separately
and there is no dependency between them, they are just
often implemented in the same driver, using two different
subsystem APIs, in the end.

sysfs can't be used as any guide here since it conflates GPIO lines
and IRQs and provides several dangerous ways to shoot oneself
in the foot. The chardev does a better job at keeping this in
order.

> Also, I notice that both gpiochip_hierarchy_add_domain and
> gpiochip_reqres_irq call gpiochip_lock_as_irq, and I am surprised I do not
> get any error about this: in my understanding only the first call on a given pin
> should succeed, but with my WARN_ON I am seeing both stack traces and
> no other warning.

Hm that may be a subtle bug.

The state is just a bool so the first to leave will turn out the lights
for whoever is left in the room :P

Yours,
Linus Walleij
