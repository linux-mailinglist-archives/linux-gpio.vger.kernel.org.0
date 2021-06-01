Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401C339719A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFAKj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhFAKjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:39:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7407CC061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:38:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i10so8981359lfj.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yN5uiFBkkTeT2+j1gnjicofSI0ZU0aW0s8cvIPMUB5c=;
        b=Yp4g9qfAZ2U4RijeC/9A/sXt0dNmQH8B2qgnGaUsUALb9c0wdcbuwpoelkQx97gpJ7
         g1q1rUo6V/D+UN0Xy7n9Wwkh+MlP/n5z3hm41lYLlHgL+aB4y+PEHQ7/stAQvwxqoMdd
         KsVE/QJlsIt0BZTMveHgGG9V4wkx8m9LMjZTiY8qklY58VAkq7gXoONJ+GzdZGmtKu5f
         US1s4g+gA9pgtUUoc3GFG2mMLabhCX3JtI/1lwAtbqD5MjUa/nnwM/Bx3TUkeVDFis3i
         MgBiwJCASB7dQyqwmQH+j+6UeHjCZKrSn+ticL0q6+9zcP0gELkMRAvgr6qFvzPpuiad
         no8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yN5uiFBkkTeT2+j1gnjicofSI0ZU0aW0s8cvIPMUB5c=;
        b=e/2Wy+sLCo5R648a0s189qjMhB7Qx/UCv++FK1fLfZJ+hIJpuV0Fg/zzdvT8Y2C3ED
         EvNSKcTVqrlQ5G4VCJJr/I2cIzuNe4uKIeyIb5Dnj6hh/dpNS3v6Mcyhunyx9GUs7wje
         ZZNEEmBD2FL6HK9m3kcrqLhG6k13M0qRt9C2K+oB8ejPi3iqzyPjcXC9CHHKsNCrqfrS
         d0c0XjB7eqiQSdAKC50ltJ6ZsW8S+AMaDcwNkfb6STwM0+gIWuaK/cvOCqGPGY1+Dq2t
         NP57BMTInH+/AAD1XoMbw2CaDR6j8ywm8o47yVuJboJiAARuQx2O53r6g8actu8E1OWe
         vypA==
X-Gm-Message-State: AOAM533zRzfYVLM3xjMWlVPRanwl7f82+Jc9w80qgPAUeBuFe84ZF1sG
        DQsI9S179CiJGVDIl8i63XGctclgjsS2Ajy9I/ZTgveGb6ezxQ==
X-Google-Smtp-Source: ABdhPJyrNY1gdF74/aahJD6WWpvmsfypMnfesq4IK/NIfeVwSBC8cYbo6kOwQ59ZGcFwYnmhMPCTSa5bqu3fh/F7YJ4=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr18182416lfn.465.1622543892812;
 Tue, 01 Jun 2021 03:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-3-maukka@ext.kapsi.fi>
In-Reply-To: <20210530161333.3996-3-maukka@ext.kapsi.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:38:01 +0200
Message-ID: <CACRpkdYf06W2QDY6EN0OG3RjOnJ+AVE+Wd4M6Z9=B7aZ9rGfwA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 6:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> Adds support for a generic GPIO multiplexer. To drive the multiplexer a
> mux-controller is needed. The output pin of the multiplexer is a GPIO
> pin.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>

The commit message and part of the driver becomes hard to
read and understand because the word pin is overused.
Switch to talk about "gpio lines" rather than pins.

Draw a simple ASCII image like this:

               /|---- Cascaded GPIO line 0
              |M|---- Cascaded GPIO line 1
GPIO line ----+U| .
              |X| .
           \|---- Cascaded GPIO line n

Maybe also as illustration in the driver and in the bindings.
Make things easy to understand.

Explain exactly why only input lines can be multiplexed.

I'm not sure it should be restricted to just input
in theory, but since that is all we can test, restrict it to
input in practice.

> +config GPIO_MUX_INPUT
> +       tristate "General GPIO input multiplexer"

Rename it just GPIO_MUX
  "General GPIO multiplexer"

Then clarify in the help description that it currently can only
handle input lines.

> +       depends on OF_GPIO
> +       select MULTIPLEXER
> +       select MUX_GPIO
> +       help
> +         Say yes here to enable support for generic GPIO input multiplexer.
> +
> +         This driver uses a mux-controller to drive the multiplexer and has a
> +         single output pin for reading the inputs to the mux. The driver can
> +         be used in situations when GPIO pins are used to select what
> +         multiplexer pin should be used for reading input and the output pin
> +         of the multiplexer is connected to a GPIO input pin.

Input output etc, this gets very hard to understand.

Switch terminology from "pin" to "GPIO lines", (or "GPIO rails").

Use the word "routing" as the GPIO line is routed through the
multiplexer. Maybe spell out multiplexer for clarity.

Explain why, for electrical reasons, output lines are harder
to multiplex like this, as the output will not maintain
state. Notice that "using open drain constructions, output
multiplexing may be possible, but it is currently not implemented."

> +static int gpio_mux_input_get_direction(struct gpio_chip *gc,
> +                                       unsigned int offset)
> +{
> +       return GPIO_LINE_DIRECTION_IN;
> +}

Explain why this is a restriction with a comment in the code.
Add comment that in the future we might be able to handle
also output.

> +static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)

This looks very nice!

We might have to extend this driver at some point.

Intuitively I'd say it takes some time and then someone
comes along and say "actually we have done this
for output as well, using some open drain and stuff"
but this is a good starting point anyway we need no
big upfront designs.

Yours,
Linus Walleij
