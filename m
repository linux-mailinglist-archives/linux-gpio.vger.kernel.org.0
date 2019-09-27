Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F99C01C7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 11:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfI0JHc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 05:07:32 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44044 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfI0JHc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2019 05:07:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so1609178otj.11;
        Fri, 27 Sep 2019 02:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MDFyyEdK+vKqU3JXiF1KcbZp6UF/IB17v+0c7RhigIY=;
        b=ASoqVpCNanrru3NX7t8+tC7KvEu1jyBYmDQQPa/GycKVL6bLTMHlrd2kzxlr9aYGu6
         8ZrNS+aRVPKwrg/jvOkVg7WS+IRQaxD4trFh2eV1s6rhkhTi6klQHj3PsBHIvhgDjmer
         VF0IVXcQHmkGg0e0L/tazBidFvo+Yh3cn5UPBW2cHT9cBgba8FVZPWlhTXTPZ9pfjhNy
         J/7MnILrO84gnjXO/P8Kwy9d0JmHk1azHwOrxpaSJ2oOKMXS9Rlcy2lnhFEN1/vnffTv
         hRALeH+q2jKW+kwRS5LyyEhg7SPlxBY1hF4/cbam0MjinGKh49EPZu1pvwnDDmMTOY8X
         RhQQ==
X-Gm-Message-State: APjAAAXaW1w+UkbYKJSk4+GVeZTYe2YfL+/T8u5NSqR9kHEXy6BEBg1+
        JPYJI9jxH7fbahO7pRDuUrVkQGBTAJJW8BibxJ8=
X-Google-Smtp-Source: APXvYqx5dG79Zr5f0GKbd+i6d5GP5zna35OsBqzvA3CjbQgVd+2WcitMS0qBclhvTJJPtI3deczSCwAClZscI+T22fQ=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2246207ote.107.1569575251321;
 Fri, 27 Sep 2019 02:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com> <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 11:07:20 +0200
Message-ID: <CAMuHMdVt3yDiJzkbUGMdkKKd4+CJ0btWuO-J=YZL+pAo99_WXg@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Eugeniu,

On Wed, Sep 25, 2019 at 6:51 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> I've additionally Cc-ed Laurent and Stephen, since their fruitful
> discussion in [1] back in 2014 concluded with a useful documentation
> update [2] which is precisely related to the interpretation and usage
> of the polarity flag in GPIO specifiers.
>
> I've also Cc-ed those people who have participated in reviewing the
> previous patch iterations (Geert, Phil, Enrico).
>
> Before leaving this thread in limbo, I would like to attempt clarifying
> what it actually tried to accomplish, one more time.
>
> First of all, it stems from the need to implement a specific customer
> requirement. Whether this requirement is sane or not, that's actually
> a very important question, but I haven't found much discussion around
> it the comments posted so far.
>
> To paraphrase what Harish stated in [3], the customer has a list of GPIO
> pins which need to be controlled from userspace. Of course, the customer
> can set the polarity of those pins from userspace, as pointed out by
> Linus in [4] (thanks!). But, keeping track of GPIO polarity in userspace
> is seen like a burden. The customer thinks that the right place for this
> HW-specific detail is in device trees. Do you think this preference
> is ill-formed?
>
> If we hog a GPIO pin in DTS (which allows specifying its polarity),
> userspace no longer has access to that pin. There isn't a way to define
> GPIO polarity by means of DTS without affecting userspace access
> (can anybody contradict this statement?).
>
> Whether it is obvious or not, the main goal of this series is actually
> to provide the possibility of inverting the default ACTIVE_HIGH polarity
> for GPIO pin X _via DTS_ while still allowing to operate on that pin
> _from userspace_. My two questions are then:
>  - I hope it is something sane to desire?
>  - If it is sane, how can this be accomplished, if the functionality
>    implemented by Harish doesn't pass the community review?
>
> [1] https://marc.info/?l=linux-gpio&m=139204273132477&w=4 ("Correct meaning of the GPIO active low flag")
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51e8afc1c43c75 ("gpio: document polarity flag best practices")
> [3] https://marc.info/?l=linux-gpio&m=155721267517644&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
> [4] https://marc.info/?l=linux-gpio&m=155713157122847&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")

My standard reply would be: describe the device connected to the GPIO(s)
in DT.  The GPIO line polarities are specified in the device's "gpios"
properties.

BTW, can you give an example of what's actually connected to those
GPIOs?
Is it a complex device (the GPIO is only a part of it, it's also hanging
off e.g. an I2C bus)?
Is it something simple (e.g. an LED ("gpio-leds"), relay, or actuator)?

Next step would be to use the device from Linux.  For that to work, you
need a dedicated driver (for the complex case), or something generic
(for the simple case).
The latter is not unlike e.g. spidev.  Once you have a generic driver,
you can use "driver_override" in sysfs to bind the generic driver to
your device.  See e.g. commit 5039563e7c25eccd ("spi: Add
driver_override SPI device attribute").

Currently we don't have a "generic" driver for GPIOs. We do have the
GPIO chardev interface, which exports a full gpio_chip.
It indeed looks like this "gpio-inverter" could be used as a generic
driver.  But it is limited to GPIOs that are inverted, which rules out
some use cases.

So what about making it more generic, and dropping the "inverter" from
its name, and the "inverted" from the "inverted-gpios" property? After
all the inversion can be specified by the polarity of the GPIO cells in
the "gpios" property, and the GPIO core will take care of it[*]?
Which boils down to adding a simple DT interface to my gpio-aggregator
("[PATCH/RFC v2 0/5] gpio: Add GPIO Aggregator Driver",
 https://lore.kernel.org/lkml/20190911143858.13024-1-geert+renesas@glider.be/).
And now I have realized[*], we probably no longer need the GPIO
Forwarder Helper, as there is no need to add inversion on top.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
