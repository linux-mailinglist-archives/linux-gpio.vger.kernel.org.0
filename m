Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCDB4679CE
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 15:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381579AbhLCO7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 09:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352667AbhLCO7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 09:59:39 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DA9C061353
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 06:56:14 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z5so12846610edd.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 06:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RFJamPwMcB79YpPJdr9X5nWsgWFVHH2mX3QM9pNgfiI=;
        b=pPeI0WldQzTug0+2ebOtE1TXML0bzl9wMsVc/B2ZxhkzPiMLZqjioQ/IeqFGeXLII9
         rWNBci1Y6WHViXW3gbu2ev5HcSfxHMvyoPqUYB13TELK6fKXTgTEg5f9ah46p9Y55S12
         dAYbq6gJV6ccGZU2n0NLD4ugHWkHU4YL/P1UlL19aYTRVmqm5cb/jDNqW0rJ6B0wvXQx
         62n31VzoViGNTPesbRRIBSx8wUEypcZWbLzwBZSuXfsuLd04sjHu4gdKL+TzEhG58+iA
         90h9XugTMEGYqMV4lits8Pd9RhPZeSXmtVr6nvMeEVH1mzOR0aOt3dU8FQchI3aEIlYv
         NSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RFJamPwMcB79YpPJdr9X5nWsgWFVHH2mX3QM9pNgfiI=;
        b=QytIsox8yWKqX23IWO6PVmciyBuqKi48MDc3PRQpoQiqz0d56T0uETIxafZkGhMu50
         PBkvZYAawVttCmk8WdoZ0m2LVdrsk0IK2CNoWvHdp5tK12JS+LUz9xL1gge1z0oQcmfN
         XrE/6/6bXWFolsXi+Ih+8liKJle4tzF8x6YfO+6cnXUji+Swoo38lxfPiJ6qnqtLWVR5
         Dm2WdfJNaHs7V75BuaKVYgqSuDZQmKZBLONYELZmeO8ieEHHidrZrhexbzl5oL5rCj+4
         oUG1NSX7j6SeEVJQ74zzy/EAKVmRZfrumYnrNNUfF9SR+rAWHb4KOem84RWp4ySN9wG+
         uQ2A==
X-Gm-Message-State: AOAM530AcUlYyT9T/rE9RdEu7voYP/3YfSsFNwAs5oPWp+Y1fmGDj9I/
        1h+MJaUuVHGA/us9pyLnrXUGk9tFu8F3lZkslGSBjw==
X-Google-Smtp-Source: ABdhPJzVqnP9oqtHp756WStFqP87RsySz8caMYyGs0eInE84HLBw62raTp9zYmpE32VQ9R2fttrRFSjK6z9tfkoBkls=
X-Received: by 2002:a17:907:1deb:: with SMTP id og43mr23827654ejc.189.1638543372008;
 Fri, 03 Dec 2021 06:56:12 -0800 (PST)
MIME-Version: 1.0
References: <ba7f82f348d77b6a65498dd13a92550949e69cc3.1638540167.git.geert+renesas@glider.be>
In-Reply-To: <ba7f82f348d77b6a65498dd13a92550949e69cc3.1638540167.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 15:56:01 +0100
Message-ID: <CAMRc=Me2528N_jT6AoSSTajznY4EFP+cFvEbqnw4rONB5nJsQw@mail.gmail.com>
Subject: Re: [PATCH resend] gpio: aggregator: Add interrupt support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Enrico Weigelt metux IT consult <info@metux.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 3, 2021 at 3:06 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Currently the GPIO Aggregator does not support interrupts.  This means
> that kernel drivers going from a GPIO to an IRQ using gpiod_to_irq(),
> and userspace applications using line events do not work.
>
> Add interrupt support by providing a gpio_chip.to_irq() callback, which
> just calls into the parent GPIO controller.
>
> Note that this does not implement full interrupt controller (irq_chip)
> support, so using e.g. gpio-keys with "interrupts" instead of "gpios"
> still does not work.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I would prefer to avoid implementing irq_chip support, until there is a
> real use case for this.
>
> This has been tested with gpio-keys and gpiomon on the Koelsch
> development board:
>
>   - gpio-keys, using a DT overlay[1]:
>
>         $ overlay add r8a7791-koelsch-keyboard-controlled-led
>         $ echo gpio-aggregator > /sys/devices/platform/frobnicator/driver_override
>         $ echo frobnicator > /sys/bus/platform/drivers/gpio-aggregator/bind
>
>         $ gpioinfo frobnicator
>         gpiochip12 - 3 lines:
>                 line   0:      "light"      "light"  output  active-high [used]
>                 line   1:         "on"         "On"   input   active-low [used]
>                 line   2:        "off"        "Off"   input   active-low [used]
>
>         $ echo 255 > /sys/class/leds/light/brightness
>         $ echo 0 > /sys/class/leds/light/brightness
>
>         $ evtest /dev/input/event0
>
>   - gpiomon, using the GPIO sysfs API:
>
>         $ echo keyboard > /sys/bus/platform/drivers/gpio-keys/unbind
>         $ echo e6055800.gpio 2,6 > /sys/bus/platform/drivers/gpio-aggregator/new_device
>         $ gpiomon gpiochip12 0 1
>
> [1] "ARM: dts: koelsch: Add overlay for keyboard-controlled LED"
>     https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=c78d817869e63a3485bb4ab98aeea6ce368a396e
> ---
>  drivers/gpio/gpio-aggregator.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> index e9671d1660ef4b40..869dc952cf45218b 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -371,6 +371,13 @@ static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
>         return gpiod_set_config(fwd->descs[offset], config);
>  }
>
> +static int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +       return gpiod_to_irq(fwd->descs[offset]);
> +}
> +
>  /**
>   * gpiochip_fwd_create() - Create a new GPIO forwarder
>   * @dev: Parent device pointer
> @@ -411,7 +418,8 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>         for (i = 0; i < ngpios; i++) {
>                 struct gpio_chip *parent = gpiod_to_chip(descs[i]);
>
> -               dev_dbg(dev, "%u => gpio-%d\n", i, desc_to_gpio(descs[i]));
> +               dev_dbg(dev, "%u => gpio %d irq %d\n", i,
> +                       desc_to_gpio(descs[i]), gpiod_to_irq(descs[i]));
>
>                 if (gpiod_cansleep(descs[i]))
>                         chip->can_sleep = true;
> @@ -429,6 +437,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
>         chip->get_multiple = gpio_fwd_get_multiple_locked;
>         chip->set = gpio_fwd_set;
>         chip->set_multiple = gpio_fwd_set_multiple_locked;
> +       chip->to_irq = gpio_fwd_to_irq;
>         chip->base = -1;
>         chip->ngpio = ngpios;
>         fwd->descs = descs;
> --
> 2.25.1
>

Applied, thanks!

Bart
