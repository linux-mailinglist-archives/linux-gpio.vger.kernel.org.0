Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630A9504BB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 10:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfFXInD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 04:43:03 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42400 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbfFXInD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 04:43:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id s184so9141794oie.9;
        Mon, 24 Jun 2019 01:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/c1meAnqJmzcYQFemk4BXY3H3LbuKNOUcsx8YXjSj/I=;
        b=BF+J+K4JNo8bRJTYdazn563Ewix+T+Lz3S6bKm6xE5mqkbzsgKOvOd9WAlB3g3d/DP
         VnMhlME0kEnfpD0bmrC64W+TeLLyjX3MH0KlBDi149zj9gkqC/DhhOxjpYbvn1/LKfeD
         nktB/WBoVZg5OOhj3fSoVhnoZK5V7yExTBC6k26cnQ71HC8qqQvGkM60E4taaCTj2CQP
         bNK91BgdDTVNBBP2eXmScZ2wYDA8ukRuTLdHZVbB+4b/ywUqzlW/b8R/ULL1r/py28Fc
         jmtwBE0kMcFequfmHMimPPoKjide7kxztU2YdZLbxHiclXMTlrRW6hUkP8gesiMBm4ut
         LvPg==
X-Gm-Message-State: APjAAAVWHiL74avHLuz7/0GDy2CGZZ5rf7ZuFeN1wH45Rx/KNI9d02D6
        Q5WWK2sdIsCy1jiJYfZUAWeZWxVtMPidnyOvVOI=
X-Google-Smtp-Source: APXvYqw7uVRKxSXEhTujdrIedhEVP77/f0iFG4RBcTwvRyglA23qNfZl+H6IoVVC+4XnnDMgq9++Ma3MUrUn5rL4MQY=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr9417693oif.148.1561365781918;
 Mon, 24 Jun 2019 01:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190620062420.11650-1-sr@denx.de>
In-Reply-To: <20190620062420.11650-1-sr@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jun 2019 10:42:49 +0200
Message-ID: <CAMuHMdXMpS_pg9N0qSW=Li0QavAMRG79RJcS4s0w6NTCxv_zzg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v9] serial: mctrl_gpio: Check if GPIO property exisits
 before requesting it
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Giulio Benetti <giulio.benetti@micronovasrl.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC gpio

This is now commit d99482673f950817 ("serial: mctrl_gpio: Check if GPIO
property exisits before requesting it") in tty-next.

On Thu, Jun 20, 2019 at 8:24 AM Stefan Roese <sr@denx.de> wrote:
> This patch adds a check for the GPIOs property existence, before the
> GPIO is requested. This fixes an issue seen when the 8250 mctrl_gpio
> support is added (2nd patch in this patch series) on x86 platforms using
> ACPI.
>
> Here Mika's comments from 2016-08-09:
>
> "
> I noticed that with v4.8-rc1 serial console of some of our Broxton
> systems does not work properly anymore. I'm able to see output but input
> does not work.
>
> I bisected it down to commit 4ef03d328769eddbfeca1f1c958fdb181a69c341
> ("tty/serial/8250: use mctrl_gpio helpers").
>
> The reason why it fails is that in ACPI we do not have names for GPIOs
> (except when _DSD is used) so we use the "idx" to index into _CRS GPIO
> resources. Now mctrl_gpio_init_noauto() goes through a list of GPIOs
> calling devm_gpiod_get_index_optional() passing "idx" of 0 for each. The
> UART device in Broxton has following (simplified) ACPI description:
>
>     Device (URT4)
>     {
>         ...
>         Name (_CRS, ResourceTemplate () {
>             GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                     "\\_SB.GPO0", 0x00, ResourceConsumer)
>             {
>                 0x003A
>             }
>             GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                     "\\_SB.GPO0", 0x00, ResourceConsumer)
>             {
>                 0x003D
>             }
>         })
>
> In this case it finds the first GPIO (0x003A which happens to be RX pin
> for that UART), turns it into GPIO which then breaks input for the UART
> device. This also breaks systems with bluetooth connected to UART (those
> typically have some GPIOs in their _CRS).
>
> Any ideas how to fix this?
>
> We cannot just drop the _CRS index lookup fallback because that would
> break many existing machines out there so maybe we can limit this to
> only DT enabled machines. Or alternatively probe if the property first
> exists before trying to acquire the GPIOs (using
> device_property_present()).
> "
>
> This patch implements the fix suggested by Mika in his statement above.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> v9:
> - Rebased on top of "tty-next", patch 2/3 dropped as its already applied
>
> v8:
> - Rebased on top of "tty-next"
>
> v7:
> - Include <linux/property.h> to fix compile breakage on OMAP
>
> v6:
> - No change
>
> v5:
> - Simplified the code a bit (Andy)
> - Added gpio_str == NULL handling (Andy)
>
> v4:
> - Add missing free() calls (Johan)
> - Added Mika's reviewed by tag
> - Added Johan to Cc
>
> v3:
> - No change
>
> v2:
> - Include the problem description and analysis from Mika into the commit
>   text, as suggested by Greg.
>
>  drivers/tty/serial/serial_mctrl_gpio.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
> index 39ed56214cd3..2b400189be91 100644
> --- a/drivers/tty/serial/serial_mctrl_gpio.c
> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> @@ -12,6 +12,7 @@
>  #include <linux/termios.h>
>  #include <linux/serial_core.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>
>  #include "serial_mctrl_gpio.h"
>
> @@ -116,6 +117,19 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
>
>         for (i = 0; i < UART_GPIO_MAX; i++) {
>                 enum gpiod_flags flags;
> +               char *gpio_str;
> +               bool present;
> +
> +               /* Check if GPIO property exists and continue if not */
> +               gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> +                                    mctrl_gpios_desc[i].name);

This will silently break DTBs using "(cts|dsr|dcd|rng|rts|dtr)-gpio" instead
of "(cts|dsr|dcd|rng|rts|dtr)-gpios".

> +               if (!gpio_str)
> +                       continue;
> +
> +               present = device_property_present(dev, gpio_str);
> +               kfree(gpio_str);
> +               if (!present)
> +                       continue;
>
>                 if (mctrl_gpios_desc[i].dir_out)
>                         flags = GPIOD_OUT_LOW;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
