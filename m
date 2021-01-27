Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5B9305E6E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 15:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhA0OeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 09:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbhA0OcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 09:32:10 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DDFC061574
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:31:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a10so2917157ejg.10
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qqg87q6fRYh0uVLXRvnL8lduoFCRvpTSBgNlnG7E0/w=;
        b=FN14CvD8/wuqht4OsjLpznRaUft1L7xtWwY+35E69AWs3AqXyeuQa1bd76s/jx+04Z
         4d7YeITqS/cz8/THnFZs0YRHwV533A4kJ/izXLQcCR5/rg3ms1O9g7oNAhad1K6iNoQA
         ZiLT/mW6hidZV7S2bQdXCuZZP16QvHmuYhH6yybQi77O7rRSeCA9McWecfOtazz7UjNM
         cx40sgXyUweKIR5fic5Mt1ORqvs9zxeFtuMkYQVUBwS+FvyW/RO6NW4xYtPWl/FBBOXN
         wlWTF5+qGCqU44BzMvFHGk1eGaZO0cH56FMTqiLKMp5b2IDm5fWigUaUIJ4pIR16bUWC
         e2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qqg87q6fRYh0uVLXRvnL8lduoFCRvpTSBgNlnG7E0/w=;
        b=DUR5hKnT7z5vMokbSHB2I93GcB5hTQZ8N9b6EQqKhK4V8hgj/iQlOsNlIXjxu3M3d1
         VcB5y7kKQg2yMSuXKLs9619bwFUzbRrmGOhjoil9ts7QbiavSXJvQiwRTG+Zf94B1I2W
         kzl/EcwjnipYo9Ndu77gmT3trC5qHRIBTCoo110dBnnM6J7LVr+r6Tmh08u0sR8dndns
         kuEy7b/pHglFyFKDGMGuSmjxgaRDx1VlaYxEL4/xCycX8s3khCgDLeoTfRsBxtzQqBXM
         7gda6zOlGYqhtbEUquCInYrk2luywUYOvj0BARDGKl10x+B076ASwwSQaXniFFP0DbXV
         Mclw==
X-Gm-Message-State: AOAM5327SF7NtuFpUx667NW6OoL0o84JKqnqUnL9aFWpYKs7nPaTesbl
        pxPxzN08Ge+uqBgqXHoihmdfs3N+U+OfaN4J9rLKng==
X-Google-Smtp-Source: ABdhPJxKLdEEI/uv+tQfgvYQWhP4BvplaqPHmQ9dd2I6FUg7wzOR9fESuUuzSv9cc1JOH//w5EdkZ+T8wXvBcyUfpfI=
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr7256319ejx.516.1611757888748;
 Wed, 27 Jan 2021 06:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com> <YBF3MVttE1aTfx7o@kroah.com>
In-Reply-To: <YBF3MVttE1aTfx7o@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:31:17 +0100
Message-ID: <CAMpxmJXDo6oXKzkun9PCT3bWN8adUcyWvf3Sr7SkrKD6r4P8Pg@mail.gmail.com>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        kernel-team@android.com, linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 3:22 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 22, 2021 at 11:35:59AM -0800, Saravana Kannan wrote:
> > There are multiple instances of GPIO device tree nodes of the form:
> >
> > foo {
> >       compatible = "acme,foo";
> >       ...
> >
> >       gpio0: gpio0@xxxxxxxx {
> >               compatible = "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       gpio1: gpio1@xxxxxxxx {
> >               compatible = "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       ...
> > }
> >
> > bazz {
> >       my-gpios = <&gpio0 ...>;
> > }
> >
> > Case 1: The driver for "foo" populates struct device for these gpio*
> > nodes and then probes them using a driver that binds with "acme,bar".
> > This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> > This lines up with how DT nodes with the "compatible" property are
> > typically converted to struct devices and then registered with driver
> > core to probe them. This also allows the gpio* devices to hook into all
> > the driver core capabilities like runtime PM, probe deferral,
> > suspend/resume ordering, device links, etc.
> >
> > Case 2: The driver for "foo" doesn't populate struct devices for these
> > gpio* nodes before registering them with gpiolib. Instead it just loops
> > through its child nodes and directly registers the gpio* nodes with
> > gpiolib.
> >
> > Drivers that follow case 2 cause problems with fw_devlink=on. This is
> > because fw_devlink will prevent bazz from probing until there's a struct
> > device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> > supplier). Once the struct device is available, fw_devlink will create a
> > device link with gpio0 device as the supplier and bazz device as the
> > consumer. After this point, since the gpio0 device will never bind to a
> > driver, the device link will prevent bazz device from ever probing.
> >
> > Finding and refactoring all the instances of drivers that follow case 2
> > will cause a lot of code churn and it is not something that can be done
> > in one shot. In some instances it might not even be possible to refactor
> > them cleanly. Examples of such instances are [1] [2].
> >
> > This patch works around this problem and avoids all the code churn by
> > simply setting the fwnode of the gpio_device and creating a stub driver
> > to bind to the gpio_device. This allows all the consumers to continue
> > probing when the driver follows case 2.
> >
> > [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
> > [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > Cc: Kever Yang <kever.yang@rock-chips.com>
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
>
> As this commit is in my driver-core git tree, can I just take this in
> the same tree?  Can I get an ack from the maintainer for this?
>
> thanks,
>
> greg k-h

Go ahead.

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
