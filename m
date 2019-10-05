Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6C7CCA00
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 15:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfJENIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 09:08:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35012 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJENIB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 09:08:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so10231077wrt.2;
        Sat, 05 Oct 2019 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wn70i4M0g6I6OiAhtzXGyX55LyAgmOGTRfNvMSBv4kU=;
        b=SScte5exofBprLHGb3HqnY3+sxtvhJ9220zKgspaOgCyXrB/nUvvz2TquAfVDrFjPa
         O+W8iH+eUJxvp8D1Ee58HrmdaPUdfzrSDO7gxwBV69yBEY5CKDdWZsiLMT12ZrPpC2XF
         YUmzA3mJbVpHXt5ti6s8MJEgwJLdBNFaOjS5WaVlqoRCVlKxScCutAbuev8t0BE4m/IX
         XkbmVfROS7YpEjCX1ij0h7qDm8YDLaR33QNBsko355G96kJ1dNikuOjSIRxnoi8hTSNk
         nkJPrb2qGfZ5useF4IIKGuyq5PuB69q3kLw5I6n8lwvwFM7TMR73eE2b7uBuVMj7ECPW
         PpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wn70i4M0g6I6OiAhtzXGyX55LyAgmOGTRfNvMSBv4kU=;
        b=T6IxWxVKpurEJc0aXiQhfcwf73ZpeCqO481ctY/yhJfD0Cemqit7fVbhMZJkslVyIw
         szIsmk7sbpR/lO+HzXH6M7mLEsAzJjbynyRunQkq6vrJqfwj1o1ULArqBWd6Qt0PjEUF
         3jYmdRJOqnZqHu26SYcYahtTVhjXMBKHPPnONPqUqIygzyLaYUPj3rq3A+hnu2V22eLI
         tdAfIV47nvMAUUfHXK3JYAytjprs2DBxtJ4fQ64K/dIHsTGma9lW7rw/75IFv1SFk4Rj
         xHKm5MoZPUFX5rmqoqmDKWukz4FeUcq0mNLC1/CZAKg4+mfOkHTLCsBzP5iAV7rcLZhU
         BpLw==
X-Gm-Message-State: APjAAAXphCRx/VElX0b05mbsZMvzVl3Epn07AJJYvkezCKq5R1ILy/ib
        /SkNAR1aOQD7z3how+Gm6fY=
X-Google-Smtp-Source: APXvYqxJd5OeaMFJOJv9UssT2A+d4YgCTo0PHexEsguVYnXh7xAXdvzLWCNxkxkduzPH6HpexM5ENg==
X-Received: by 2002:adf:ce83:: with SMTP id r3mr14284524wrn.219.1570280877226;
        Sat, 05 Oct 2019 06:07:57 -0700 (PDT)
Received: from x230 ([178.24.245.70])
        by smtp.gmail.com with ESMTPSA id a7sm18995630wra.43.2019.10.05.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 06:07:55 -0700 (PDT)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
Date:   Sat, 5 Oct 2019 15:07:40 +0200
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
Message-ID: <20191005130740.GA22620@x230>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
 <CAMuHMdVt3yDiJzkbUGMdkKKd4+CJ0btWuO-J=YZL+pAo99_WXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVt3yDiJzkbUGMdkKKd4+CJ0btWuO-J=YZL+pAo99_WXg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, Sep 27, 2019 at 11:07:20AM +0200, Geert Uytterhoeven wrote:

[..]

> My standard reply would be: describe the device connected to the GPIO(s)
> in DT.  The GPIO line polarities are specified in the device's "gpios"
> properties.
> 
> BTW, can you give an example of what's actually connected to those
> GPIOs?
> Is it a complex device (the GPIO is only a part of it, it's also hanging
> off e.g. an I2C bus)?
> Is it something simple (e.g. an LED ("gpio-leds"), relay, or actuator)?

Since the targeted user of the new feature is not in immediate vicinity,
we expect some delay in getting this information.

> 
> Next step would be to use the device from Linux.  For that to work, you
> need a dedicated driver (for the complex case), or something generic
> (for the simple case).
> The latter is not unlike e.g. spidev.  Once you have a generic driver,
> you can use "driver_override" in sysfs to bind the generic driver to
> your device.  See e.g. commit 5039563e7c25eccd ("spi: Add
> driver_override SPI device attribute").

We have passed your suggestions along. Many thanks.

> Currently we don't have a "generic" driver for GPIOs. We do have the
> GPIO chardev interface, which exports a full gpio_chip.
> It indeed looks like this "gpio-inverter" could be used as a generic
> driver.  But it is limited to GPIOs that are inverted, which rules out
> some use cases.
> 
> So what about making it more generic, and dropping the "inverter" from
> its name, and the "inverted" from the "inverted-gpios" property? After
> all the inversion can be specified by the polarity of the GPIO cells in
> the "gpios" property, and the GPIO core will take care of it[*]?
> Which boils down to adding a simple DT interface to my gpio-aggregator
> ("[PATCH/RFC v2 0/5] gpio: Add GPIO Aggregator Driver",
>  https://lore.kernel.org/lkml/20190911143858.13024-1-geert+renesas@glider.be/).
> And now I have realized[*], we probably no longer need the GPIO
> Forwarder Helper, as there is no need to add inversion on top.

After having a look at the gpio aggregator (and giving it a try on
R-Car3 H3ULCB), here is how I interpret the above comment:

If there is still a compelling reason for having gpio-inverter, then it
probably makes sense to strip it from its "inverter" function (hence,
transforming it into some kind of "repeater") on the basis that the
inverting function is more of a collateral/secondary feature, rather
than its primary one. Just like in the case of gpio aggregator, the
primary function of gpio inverter is to accept a bunch of GPIO lines and
to expose those via a dedicated gpiochip. I hope this is a proper
summary of the first point in your comment. In any case, this is the
understanding I get based on my experiments with both drivers.

What I also infer is that, assuming gpio-inverter will stay (potentially
renamed and stripped of its non-essential inverting function), the gpio
aggregator will need to keep its Forwarder Helper (supposed to act as a
common foundation for both drivers).

The second point which I extract from your comment is that the "gpio
aggregator" could alternatively acquire the role of "gpio-inverter"
(hence superseding it) by adding a "simple DT interface". I actually
tend to like this proposal, since (as said above) both drivers are
essentially doing the same thing, i.e. they cluster a number of gpio
lines and expose this cluster as a new gpiochip (keeping the
reserved/used gpio lines on hold). That looks like a huge overlap in
the functionalities of the two drivers.

The only difference which I see is that "gpio-inverter" is getting its
input from DT and generates the gpiochips at probe time, while
"gpio aggregator" is getting its input from sysfs and generates the
gpiochips at runtime, post-probe.

So, assuming no objections from Harish and other reviewers, I would be
very happy to review and test the DT-based gpio inversion functionality
as part of gpio aggregator. Thanks!

-- 
Best Regards,
Eugeniu
