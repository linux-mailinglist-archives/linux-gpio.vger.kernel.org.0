Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C01C61833E4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCLO5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:57:40 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43178 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbgCLO5k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:57:40 -0400
Received: by mail-ua1-f67.google.com with SMTP id o42so2210391uad.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bxw33SxWFZjkWPj88ZuXOvwLRBj2S+g2ZJwa2FkjrJE=;
        b=m2lcmjUGkYWP7vkV0Vjot/cSZwZUNCcrXd/WLLuloMRr0AWoQY+jqcc/1wuUSM7DDw
         PqWzpdtoqX/gAP4yv2cKjurTp3cckazG7srtdvXHK8g76Tki8cdQXX8xelU3OB3zySg9
         0KsHSFbk9uRX8+aRa4wmtwMYAvXbuXLOv70swGxt1sVRBXSVStkyGrRkeW0hlNtS8bAC
         H/DBHSdfGZmPGLqt093ppxRWjhZFdTFTZEnGt5kqd8UjsiZIQAZuxC20LSQMDmhmwdCA
         N6uxbr+q2W5htsfi5uFGNaAIdqYa9P6ZEEPBx1gbDz0x5QKr21FtszKn/uXbNtDP0Kgm
         zboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxw33SxWFZjkWPj88ZuXOvwLRBj2S+g2ZJwa2FkjrJE=;
        b=bR38U0CuQbRmpTzsfi8AjZ0sGmaOHZT8xeUGOtH9JgL7pGRSbfdZ+PGq8i7GztxvtZ
         Ksm1QpF/KsErc8aiMdDufAP1XoV8uSsQHzY/bm+oBwUdGy8D8MtofV8ND09SXIMS9MCb
         KOJ2G2afUFiJpIQmAktEsf2nK1tMsq9o2LNKQFGymbPZpg3NzlSNUSaTU2tspDUnFd0W
         V7S5lV0SUDRGre+0UPM5XiSUJjglvhGpj8JbBCp14YvaRDmMJZ9kU5RgIECc108qYzwL
         +qJtSQMMYfsL2YFhEuy4tY/HcvCvoTKwWP6wmWBmuxdt8qGWJOwqn5vSLTgtGHjdA4R2
         CQUA==
X-Gm-Message-State: ANhLgQ0bgTZr0CuH6Jw9jTSj4DkIPMoOY9ahX0QR2CfAZpVl+d6tv/Dg
        rIUshnNAUlXDnOvdtgK9Iez/mGC06kcVggm/uYqLRQ==
X-Google-Smtp-Source: ADFU+vt8Y3FRACC456zlqNPr2bqDTb34pZ4BOiYmKDy6ILZJ5KXw0GLwuYQXTML4HDWtsFJfrbuTd6Mahqifpd8BpCo=
X-Received: by 2002:ab0:2a55:: with SMTP id p21mr3753572uar.54.1584025057464;
 Thu, 12 Mar 2020 07:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200218151812.7816-1-geert+renesas@glider.be> <20200218151812.7816-4-geert+renesas@glider.be>
In-Reply-To: <20200218151812.7816-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 15:57:26 +0100
Message-ID: <CACRpkdacAaw4PJp3Oa569JJTHTB4HjP-hPqZLmdFcuxvdvwBHg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: Add GPIO Aggregator
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

thanks for your patience and again sorry for procrastination on my part :(

Overall I start to like this driver a lot. It has come a long way.

Some comments below are nitpicky, bear with me if they seem stupid.

On Tue, Feb 18, 2020 at 4:18 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> +#define DRV_NAME       "gpio-aggregator"
> +#define pr_fmt(fmt)    DRV_NAME ": " fmt

I would just use dev_[info|err] for all messages to get rid of this.

> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/ctype.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#include "gpiolib.h"

When this file is includes I prefer if there is a comment next to
this include saying why we have to touch internals and which
ones.

> +struct gpio_aggregator {
> +       struct gpiod_lookup_table *lookups;
> +       struct platform_device *pdev;

What about just storing struct device *dev?

Then callbacks can just

dev_err(aggregator->dev, "myerror\n");

> +static char *get_arg(char **args)
> +{
> +       char *start = *args, *end;
> +
> +       start = skip_spaces(start);
> +       if (!*start)
> +               return NULL;
> +
> +       if (*start == '"') {
> +               /* Quoted arg */
> +               end = strchr(++start, '"');
> +               if (!end)
> +                       return ERR_PTR(-EINVAL);
> +       } else {
> +               /* Unquoted arg */
> +               for (end = start; *end && !isspace(*end); end++) ;
> +       }
> +
> +       if (*end)
> +               *end++ = '\0';
> +
> +       *args = end;
> +       return start;
> +}

Isn't this function reimplementing strsep()?
while ((s = strsep(&p, " \""))) {
or something.

I'm not the best with strings, just asking so I know you tried it
already.

> +static int aggr_parse(struct gpio_aggregator *aggr)
> +{
> +       unsigned int first_index, last_index, i, n = 0;
> +       char *name, *offsets, *first, *last, *next;
> +       char *args = aggr->args;
> +       int error;
> +
> +       for (name = get_arg(&args), offsets = get_arg(&args); name;
> +            offsets = get_arg(&args)) {
> +               if (IS_ERR(name)) {
> +                       pr_err("Cannot get GPIO specifier: %pe\n", name);

If gpio_aggregrator contained struct device *dev this would be
dev_err(aggr->dev, "...\n");

> +static void gpio_aggregator_free(struct gpio_aggregator *aggr)
> +{
> +       platform_device_unregister(aggr->pdev);

Aha maybe store both the pdev and the dev in the struct then?

Or print using &aggr->pdev.dev.

> +       /*
> +        * If any of the GPIO lines are sleeping, then the entire forwarder
> +        * will be sleeping.
> +        * If any of the chips support .set_config(), then the forwarder will
> +        * support setting configs.
> +        */
> +       for (i = 0; i < ngpios; i++) {
> +               dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
> +                       desc_to_gpio(descs[i]), descs[i]->label ? : "?");

If this desc->label business is why you need to include
"gpiolib.h" then I'd prefer if you just add a

const char *gpiod_get_producer_name(struct gpio_desc *desc);

to gpiolib (add in <linux/gpio/consumer.h> so that gpiolib can
try to give you something reasonable to print for the label here.
I ran into that problem before (wanting to print something like this)
and usually just printed the offset.

But if it is a serious debug issue, let's fix a helper for this.

gpiod_get_producer_name() could return the thing in
desc->label if that is set or else something along
"chipname-offset" or "unknown", I'm not very picky
with that.

> error = aggr_add_gpio(aggr, name, U16_MAX, &n);

Is the reason why you use e.g. "gpiochip0" as name here that this
is a simple ABI for userspace?

Such like obtained from /sys/bus/gpio/devices/<chipname>?

I would actually prefer to just add a sysfs attribute
such as "name" and set it to the value of gpiochip->label.

These labels are compulsory and supposed to be unique.

Then whatever creates an aggregator can just use
cat /sys/bus/gpio/devices/gpiochipN/name to send in
through the sysfs interface to this kernel driver.

This will protect you in the following way:

When a system is booted and populated the N in
gpiochipN is not stable and this aggregator will be used
by scripts that assume it is. We already had this dilemma
with things like network interfaces like eth0/1.

This can be because of things like probe order which
can be random, or because someone compiled a
kernel with a new driver for a gpiochip that wasn't
detected before. This recently happened to Raspberry Pi,
that added gpio driver for "firmware GPIOs" (IIRC).

The label on the chip is going to be more stable
I think, so it is better to use that.

This should also rid the need to include "gpiolib.h"
which makes me nervous.

Yours,
Linus Walleij
