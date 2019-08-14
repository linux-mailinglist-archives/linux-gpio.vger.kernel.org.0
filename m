Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE6A08D0AA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 12:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfHNKXJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 06:23:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:3680 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfHNKXJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 06:23:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 03:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,384,1559545200"; 
   d="scan'208";a="376683811"
Received: from rfried-mobl1.iil.intel.com ([143.185.152.137])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2019 03:23:06 -0700
Message-ID: <8dbeb0c64fbb90d05dfa7302c48cbf1ca45faa43.camel@linux.intel.com>
Subject: Re: [PATCH v2] gpiolib: Take MUX usage into account
From:   Ramon Fried <ramon.fried@linux.intel.com>
To:     Stefan Wahren <wahrenst@gmx.net>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 14 Aug 2019 13:22:12 +0300
In-Reply-To: <f568ca31-c9f0-0dc2-be12-22de25891794@gmx.net>
References: <20190813014210.15519-1-ramon.fried@linux.intel.com>
         <1650c967-5176-70db-ff9a-b2af432ba1e7@i2se.com>
         <88cbb5b2-fd95-afb3-3645-e5b799844941@linux.intel.com>
         <f568ca31-c9f0-0dc2-be12-22de25891794@gmx.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2019-08-13 at 18:32 +0200, Stefan Wahren wrote:
> Am 13.08.19 um 08:10 schrieb Fried, Ramon:
> > On 8/13/2019 08:38, Stefan Wahren wrote:
> > > Hi Ramon,
> > > 
> > > On 13.08.19 03:42, Ramon Fried wrote:
> > > > From: Stefan Wahren <stefan.wahren@i2se.com>
> > > > 
> > > > The user space like gpioinfo only see the GPIO usage but not
> > > > the
> > > > MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want
> > > > to
> > > > know which
> > > > pin is free/safe to use. So take the MUX usage of strict pinmux
> > > > controllers
> > > > into account to get a more realistic view for ioctl
> > > > GPIO_GET_LINEINFO_IOCTL.
> > > > 
> > > > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > > Tested-by: Ramon Fried <rfried.dev@gmail.com>
> > > > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > > > ---
> > > > v2: Address review from linus:
> > > > * ** Please notive logic was reversed **
> > > > * renamed pinctrl_gpio_is_in_use() to
> > > > pinctrl_gpio_can_use_line()
> > > > * renamed pinmux_is_in_use() to pinmux_can_be_used_for_gpio()
> > > > * changed dev_err to dev_dbg (Linus suggested removing it
> > > > altogether, I
> > > >    find it better to keep it for debug).
> > > thanks for taking care of this.
> > > >   drivers/gpio/gpiolib.c           |  3 ++-
> > > >   drivers/pinctrl/core.c           | 28
> > > > ++++++++++++++++++++++++++++
> > > >   drivers/pinctrl/pinmux.c         | 27
> > > > +++++++++++++++++++++++++++
> > > >   drivers/pinctrl/pinmux.h         |  8 ++++++++
> > > >   include/linux/pinctrl/consumer.h |  6 ++++++
> > > >   5 files changed, 71 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index f497003f119c..52937bf8e514 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -1084,7 +1084,8 @@ static long gpio_ioctl(struct file *filp,
> > > > unsigned int cmd, unsigned long arg)
> > > >               test_bit(FLAG_IS_HOGGED, &desc->flags) ||
> > > >               test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
> > > >               test_bit(FLAG_EXPORT, &desc->flags) ||
> > > > -            test_bit(FLAG_SYSFS, &desc->flags))
> > > > +            test_bit(FLAG_SYSFS, &desc->flags) ||
> > > > +            !pinctrl_gpio_can_use_line(chip->base +
> > > > lineinfo.line_offset))
> > > >               lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
> > > >           if (test_bit(FLAG_IS_OUT, &desc->flags))
> > > >               lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
> > > > diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> > > > index b70df27874d1..2bbd8ee93507 100644
> > > > --- a/drivers/pinctrl/core.c
> > > > +++ b/drivers/pinctrl/core.c
> > > > @@ -736,6 +736,34 @@ int pinctrl_get_group_selector(struct
> > > > pinctrl_dev *pctldev,
> > > >       return -EINVAL;
> > > >   }
> > > >   +bool pinctrl_gpio_can_use_line(unsigned gpio)
> > > > +{
> > > > +    struct pinctrl_dev *pctldev;
> > > > +    struct pinctrl_gpio_range *range;
> > > > +    bool result;
> > > > +    int pin;
> > > > +
> > > > +    /*
> > > > +     * Try to obtain GPIO range, if it fails
> > > > +     * we're probably dealing with GPIO driver
> > > > +     * without a backing pin controller - bail out.
> > > > +     */
> > > > +    if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
> > > > +        return true;
> > > > +
> > > > +    mutex_lock(&pctldev->mutex);
> > > > +
> > > > +    /* Convert to the pin controllers number space */
> > > > +    pin = gpio_to_pin(range, gpio);
> > > > +
> > > > +    result = pinmux_can_be_used_for_gpio(pctldev, pin);
> > > > +
> > > > +    mutex_unlock(&pctldev->mutex);
> > > > +
> > > > +    return result;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
> > > > +
> > > >   /**
> > > >    * pinctrl_gpio_request() - request a single pin to be used
> > > > as GPIO
> > > >    * @gpio: the GPIO pin number from the GPIO subsystem number
> > > > space
> > > > diff --git a/drivers/pinctrl/pinmux.c
> > > > b/drivers/pinctrl/pinmux.c
> > > > index 020e54f843f9..7e42a5738d82 100644
> > > > --- a/drivers/pinctrl/pinmux.c
> > > > +++ b/drivers/pinctrl/pinmux.c
> > > > @@ -70,6 +70,33 @@ int pinmux_validate_map(const struct
> > > > pinctrl_map
> > > > *map, int i)
> > > >       return 0;
> > > >   }
> > > >   +/**
> > > > + * pinmux_can_be_used_for_gpio() - check if a specific pin
> > > > + *    is either muxed to a different function or used as gpio.
> > > > + *
> > > > + * @pin: the pin number in the global pin space
> > > > + *
> > > > + * Controllers not defined as strict will always return true,
> > > > + * menaning that the gpio can be used.
> > > > + */
> > > > +bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev,
> > > > unsigned pin)
> > > > +{
> > > > +    struct pin_desc *desc = pin_desc_get(pctldev, pin);
> > > > +    const struct pinmux_ops *ops = pctldev->desc->pmxops;
> > > > +
> > > > +    if (!desc) {
> > > > +        dev_dbg(pctldev->dev,
> > > > +            "pin %u is not registered so it cannot be
> > > > requested\n",
> > > > +            pin);
> > > > +        return true;
> > > This return value looks strange to me.
> > 
> > Basically, it's just the reversed return value you returned in the
> > original patch,
> > It means in this context that if the pin is not owned by a
> > pin-controller it can be used for GPIO.
> As long as the provided pin is valid. Btw shouldn't we change the
> logic
> in the debug message?
Good catch. yes we should.
I'll send V3 shortly.
Thanks,
Ramon.
> > Thanks,
> > Ramon.
> > 
> > > Stefan
> > > 

