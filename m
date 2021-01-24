Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B610630193C
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 03:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbhAXCzN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 21:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbhAXCzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 21:55:12 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E17C061786
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 18:54:32 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id y4so9751307ybn.3
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TbF3Lbs9wpNVllm6ynkRXy8qTf3NddpOylwzWmHrUp0=;
        b=rzIW9DL2YyNS6cO4zCkvKWTJYxqf1OJVsJp7/Fd9wkR1+gybMnazGjMskGej1BV2bM
         0Wzf0JfoZB6zbsckVB0KY2dAKu+dh6xKj5ET4mEDbDyro+ihxMHz2jN/6tzLii+2Hpsj
         09NdjeRmjmQjJDknDSjjuEmLBKJQq/NvIRYd8hKg7slQQ7Zlq4yzdPN4FPeftvhtnFZL
         QXSj4gn4/+rh0nT2kyxkZP+mj1jgjEm46iJ+M55gxzjD/iEHHRL552hDfbStFpEZMTJ7
         ++gLJm4BlwWx+iRrn/ayXa7TlPYsSB1aPZcEogWwu4h99i5YQ9kdbgToXEWdR4JtLXni
         jNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TbF3Lbs9wpNVllm6ynkRXy8qTf3NddpOylwzWmHrUp0=;
        b=sOQ6FbhHXsIYoqswuZe6qD7ipspHWbRAOh5Epdwx9umUB2hchRAr/GhT9Al9Mt6No+
         U/h3KLucaDU2eWR7VX6iPNzgIRgSEp9lyduHLElhzOCBlitpn+eC3d+gkc7YuNR2JZZn
         qSZv2AV+7t8roy53psXf227+WNszsUYPghI+8KhUwR6U4SdV3tWbcrxBogpfta2WlOmT
         Ae7gqD9Har8o2iStA3VguutAS0LLSFsA8jS440IXo92JXAbmzi/mb6F9TbD7AJaxu5bK
         UgBVLkDSzhhB3o92WXRXoQMN68LFP4/CofmDfT9fNu9x9272NGdhVuuCSYlQhC1D0P46
         dvBw==
X-Gm-Message-State: AOAM532WUPdDMIweJyV7kQ0HAamZDI1sPvpHjIQSjnN26+wg6qK9fbmO
        E5a+fKsPutxE0sL30MGudmfACLxEOxitFreLmUZlQQ==
X-Google-Smtp-Source: ABdhPJwJyE7+dnHnHwE09l1Za1YV9FJgMaarOUGTaiHQxGp3MFpju5eV5HEGJ45JzdYfvMFRNKVYdgAF0rlAMVJyBu0=
X-Received: by 2002:a25:dfcb:: with SMTP id w194mr15547389ybg.346.1611456871043;
 Sat, 23 Jan 2021 18:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com> <CACRpkdYtToLVxyMxC=24AoGVk89c9FyQt899OTz9Jx8yJeu+mw@mail.gmail.com>
In-Reply-To: <CACRpkdYtToLVxyMxC=24AoGVk89c9FyQt899OTz9Jx8yJeu+mw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Sat, 23 Jan 2021 18:53:55 -0800
Message-ID: <CAGETcx8Zozoe2BuP+zmJhQkJ6V0gJ1mtf5907BifEExw8s-zvQ@mail.gmail.com>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 23, 2021 at 2:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 22, 2021 at 8:36 PM Saravana Kannan <saravanak@google.com> wrote:
>
> > There are multiple instances of GPIO device tree nodes of the form:
> >
> > foo {
> >         compatible = "acme,foo";
> >         ...
> >
> >         gpio0: gpio0@xxxxxxxx {
> >                 compatible = "acme,bar";
> >                 ...
> >                 gpio-controller;
> >         };
> >
> >         gpio1: gpio1@xxxxxxxx {
> >                 compatible = "acme,bar";
> >                 ...
> >                 gpio-controller;
> >         };
> >
> >         ...
> > }
> >
> > bazz {
> >         my-gpios = <&gpio0 ...>;
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
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> This v5 version is a beauty!

Lol, thanks.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

 Considering the "Fixes" is only in driver-core-next, should this go
through driver-core?

-Saravana
