Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671CA3057C2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S316682AbhAZXJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387826AbhAZScZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 13:32:25 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEA3C061574;
        Tue, 26 Jan 2021 10:31:42 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id i63so10920247pfg.7;
        Tue, 26 Jan 2021 10:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rV/HbSiYayvD3RTtK+KMS472kjs7vW7gVS6mrTeKvM=;
        b=AHagMapSsIQ8CaSz0N4QNFXZTxr1GIjTrdWkRGTT4lspjQGl+uy9+GLezyNAKVK1Pg
         7nV5Jhcxy2zCkqkA8b5ADHPhZOt/efpEN9zgSP3BFhRE2xjxbqZiSwslCEyr62PtzWrc
         eP6Kzq+guDWtxjwGNaPNDJoriv/MsK572+d2aG612tEkb7fo8J63/Ywylfuh3LR7pa8Z
         +Yzhx0geVW4tCDcoLmoPWerlCf2pM8xsPDX9PjvaArjJxBLtlVRNs9wW1PN8/klooVko
         MMAxb+HzB92TwlNcvm/JwZw+YkdxNfCjFaoJDF0eGUdJl+Zf5xTwZZ0JBAApYk+O+m25
         AIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rV/HbSiYayvD3RTtK+KMS472kjs7vW7gVS6mrTeKvM=;
        b=CdD0GQWaihkQz7drnGPNig2WA/lIj7RZWxcKyX1TWzwp6t0mXUoWFp84NK+9EzqSY5
         3eX0c4mWK7xobw/XRmp2CRK5bTaO+hk7usS0cA+uHF8XI9GhWPwMwX5+FiaAdYPriR4I
         GLVwWOVlTt2hgrWzQq8O3hEyclMl7hSxmmrkBeANLQCcfIUhXRWkXfvCazzDqzvMdcUk
         yPlNpndRVVJr+PmnxIfvOJVfmDijuSd9Of01JeM9nmdC1auvwGXdnNsDImzk7CDVrvgR
         3cOyQIHcWS7dTrkyh4OkRWavh55GCLXnLg2IuZokaqzeR7CCxzWQTwBHt6eQYq3cofRy
         YVsQ==
X-Gm-Message-State: AOAM5337k5kl+DeeFdhG6wOFEwdBSedMxOHR4oJpRhMSBv8l/GLrbq3G
        1wz09nTnHvi1+bS5wOdU8ZIktHJTCEkLPQHrtsI=
X-Google-Smtp-Source: ABdhPJx14wVj4lbt4kIXgjVE3peDkGtCbbrY/LnxCa7EuGMuV/n6YlUGKewrYIe/L/9rH/4fU+uGqE07TXypLz1oykw=
X-Received: by 2002:a63:e50:: with SMTP id 16mr6858687pgo.74.1611685901959;
 Tue, 26 Jan 2021 10:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com>
 <CAHp75VfKiuVd7JO-0nwCuvy7tgPZScOpKX8Q4+oT+JSBR+d=ew@mail.gmail.com> <CAGETcx_FmOvLe4fN8ZZ_Kno-DnUy2DcPayk9Szmx2vrihr0KoQ@mail.gmail.com>
In-Reply-To: <CAGETcx_FmOvLe4fN8ZZ_Kno-DnUy2DcPayk9Szmx2vrihr0KoQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 26 Jan 2021 20:32:31 +0200
Message-ID: <CAHp75Vfjs-AwqZrcF+o77eYim-tmZtD6ZZHd+_k+b8LNcBteHw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 8:17 PM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jan 26, 2021 at 1:40 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Friday, January 22, 2021, Saravana Kannan <saravanak@google.com> wrote:

...

> >> Case 1: The driver for "foo" populates struct device for these gpio*

the struct

> >> nodes and then probes them using a driver that binds with "acme,bar".
> >> This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> >> This lines up with how DT nodes with the "compatible" property are
> >> typically converted to struct devices and then registered with driver
> >> core to probe them. This also allows the gpio* devices to hook into all
> >> the driver core capabilities like runtime PM, probe deferral,
> >> suspend/resume ordering, device links, etc.
> >>
> >> Case 2: The driver for "foo" doesn't populate struct devices for these
> >> gpio* nodes before registering them with gpiolib. Instead it just loops
> >> through its child nodes and directly registers the gpio* nodes with
> >> gpiolib.
> >>
> >> Drivers that follow case 2 cause problems with fw_devlink=on. This is
> >> because fw_devlink will prevent bazz from probing until there's a struct

prevent the bazz

> >> device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> >> supplier). Once the struct device is available, fw_devlink will create a
> >> device link with gpio0 device as the supplier and bazz device as the
> >> consumer. After this point, since the gpio0 device will never bind to a
> >> driver, the device link will prevent bazz device from ever probing.
> >>
> >> Finding and refactoring all the instances of drivers that follow case 2
> >> will cause a lot of code churn and it is not something that can be done
> >> in one shot. In some instances it might not even be possible to refactor
> >> them cleanly. Examples of such instances are [1] [2].
> >>
> >> This patch works around this problem and avoids all the code churn by
> >> simply setting the fwnode of the gpio_device and creating a stub driver
> >> to bind to the gpio_device. This allows all the consumers to continue
> >> probing when the driver follows case 2.

...

> > Do we need to unregister it at __exit initcall?
> > What side effects would be of the stub driver presence on the GPIO bus? Any traverse on it will work as before?
>
> I checked. There is no __exit initcall.

You might have checked further out of curiosity, but yeah, I used the
attribute name while the initcall name is __exitcall().

-- 
With Best Regards,
Andy Shevchenko
