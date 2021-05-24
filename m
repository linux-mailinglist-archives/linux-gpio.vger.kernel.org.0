Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C4138E3FB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 12:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhEXK0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 06:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhEXK0S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 06:26:18 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B56C061574;
        Mon, 24 May 2021 03:24:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so10993630pjt.1;
        Mon, 24 May 2021 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MEQuDKUSQKw0MZlz9rMkXgWLUEoc5fj6IhTPOzDj8iU=;
        b=Qv4TPYvwJysNuGU2x2gZCJJZc/CsezboC7ejkinAqyTwUOPW2sQqSFyRm7Hg5oQmkZ
         hHkbkbfd4OVdLDim98PFHsvRh46B4g67lkzIrqgNCTFjMfuHEFfrzd/sFinLOhnGhS8L
         xFFinXINswnbZ5sMvCdGJ1I81XHwaYmhi9oRsrklreqbqE6nLbtgAG+LH/fbyXKx5+i6
         N9a0sU0M0p8u8TnP4+otmeCJxhtED7Bp89OWdoYuxxEQtEq7134CVFOUSLR6W1iuacQt
         w+0d3Jcg1hQPPB2OiofQYu6b++9NKmHO14Qj3DlKJ+rP2emse7HAu+6H2fkb8t/urcvZ
         5qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEQuDKUSQKw0MZlz9rMkXgWLUEoc5fj6IhTPOzDj8iU=;
        b=l0s2uTuhtVZV0khlBleRMLk0Pa5PVlLpvIMjDqtBzzM9BTojBt/esVT+71AVgg425e
         J1SXZuptj+MlzSybG7OK3eBGlgko6xyt0FCtiIm4I5mFY1YYw+NfXB0Ziel1iQGIXrfs
         Ka1jK9Dl6jt6vsSfRbkUIDhNkRyyUEPXPfQ8STcJJ8AHeBBWVg7jNPljzQHs1Co4u1qv
         zylelW0cQ7EsvWQQ9uh1VGsPxH8Zr3oz6CN2W+SKM0237J2OW2lZuOyfJ90/R0LlM6oF
         /hux8bzhHjeJeiAetTO8j5on0dmAaE0si9SHFV9gdFav8W2KT0rDvEYafHjSaJdsmeCs
         H2sg==
X-Gm-Message-State: AOAM5314KEfgTqemUt6MnMxZxAw8UkyhNJV2gu+maK0kEyOUMuX89k6W
        Y1kQonIlxY5zScQnr2YQsVpWY86dW+T1laNqIfs=
X-Google-Smtp-Source: ABdhPJx+rTrdBTgdPKGW3YRrFwFVcsETKQkPqTT0e3PgCx+XWECpiRV/lfsemIIjh58HUe7/Dq9qZgoi01trTtQ3tHQ=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr24585537pja.181.1621851889142;
 Mon, 24 May 2021 03:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <213ab7580a1d3229d32f7aac67bf4e828612153a.1621809029.git.sander@svanheule.net>
In-Reply-To: <213ab7580a1d3229d32f7aac67bf4e828612153a.1621809029.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 13:24:33 +0300
Message-ID: <CAHp75VdoSfO3Y9Lf+fcoG2=Rb+SBJKq+B0tG+gS7TaHUmN-iYg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] leds: Add support for RTL8231 LED scan matrix
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> Both single and bi-color scanning modes are supported. The driver will
> verify that the addresses are valid for the current mode, before
> registering the LEDs. LEDs can be turned on, off, or toggled at one of
> six predefined rates from 40ms to 1280ms.
>
> Implements a platform device for use as a child device with RTL8231 MFD,
> and uses the parent regmap to access the required registers.

...

> +         This options enables support for using the LED scanning matrix output

option

> +         of the RTL8231 GPIO and LED expander chip.
> +         When built as a module, this module will be named leds-rtl8231.

...

> +               interval_ms = 500;

Does this deserve a #define?

...

> +       ret = fwnode_property_count_u32(fwnode, "reg");
> +       if (ret < 0)
> +               return ret;
> +       if (ret != 2)
> +               return -ENODEV;

I would say -EINVAL, but -ENODEV is similarly okay.

...

> +       int err;

ret or err? Be consistent across a single driver.

...

> +       int err;

Ditto.


-- 
With Best Regards,
Andy Shevchenko
