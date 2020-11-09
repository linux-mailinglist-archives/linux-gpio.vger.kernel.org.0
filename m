Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6152A2AB7C1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgKIMHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:07:51 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:2995 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgKIMHu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604923669; x=1636459669;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=ZFITE8s1FUU3VZjTP8ZkAcYVJGUpVToCjdKUZZw01us=;
  b=zrnUrKL33BqAQeWDdBSa99RyXNin0zwDax0jvIx+S9xdpCXjOJ9NzRWq
   OW3sB2z7Y224Cbhd8QBkN9fYnNDk3qFRx7ZE6OVe1Ov7XkTL7zTibAdQ8
   pjKvjoDbg7EQjlH1nim1v2yIX1o8omj4Aqd4UqnUZfa6ii56XbmM/m4Rk
   8KzSb9+ZEDLq8FX9V48tGaZtgfLRJhasswRjz1f7/b5V+NGtLhRVlKjXo
   JvuZ7htEAZjYusZbaZhZd8/L3LjgzMSujngP48XfEC4x2iCKWgLoaQK79
   knZ8GfIP67zQdbQloMTNJExQN55CKhudGdkPPwgKZmHU62e0XQzPoagJU
   w==;
IronPort-SDR: 7rmE2ODFt6Vlgoe/9+e+2YH5WDrfgHBRkPGQhqpupDNMiTV7iulMP/9KfHXzZx1LcpgPJXsJVA
 84xxP0KKVas0pjvr7a0XoFNXT1ocRgRSadIx8bIhTZ7X0yJxn9rDwbxoLE/Fo8ziXFDMlsTFEq
 oI3pJPBZ6f7Uo0ZS9ODFQTIKnWeXHUVswK1Q+yH5OGs5Apv4AbANDRzBSudo3+YSJSXzDCqA+4
 hw3SUxfS5W68tThkvZy1TIEo8VUWkYs3AQ/X4XnooQJEkVqxXqc2/JX0djfMQHUEHwvPUWfVuE
 C1E=
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="32921006"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2020 05:07:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 9 Nov 2020 05:07:48 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 9 Nov 2020 05:07:46 -0700
References: <20201029134027.232951-1-lars.povlsen@microchip.com> <20201029134027.232951-3-lars.povlsen@microchip.com> <CAHp75VedcNP5x72PN4tqZ_0HhbCyd666T=AWn+TFr7Fp8EEs7Q@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-arm Mailing List" <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v7 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75VedcNP5x72PN4tqZ_0HhbCyd666T=AWn+TFr7Fp8EEs7Q@mail.gmail.com>
Date:   Mon, 9 Nov 2020 13:07:23 +0100
Message-ID: <874klyg2dg.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Thu, Oct 29, 2020 at 3:40 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>
> First Q is can you use gpio-regmap?
> Second one, why this driver is a pin control? I haven't found any
> evidence it can be plain GPIO.

I think I responded in <87blgp9hhv.fsf@soft-dev15.microsemi.net>, did
you not see that?

>
> Also note, if comment is given about one part of the code, you need to
> check all the rest which are similar and address accordingly.
>
> ...
>
>> +config PINCTRL_MICROCHIP_SGPIO
>> +       bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
>
>> +       depends on OF
>
> I think this is not needed, see below.

I will remove the OF dependency, I think you are right it can be
done. I just did not see that as a goal in itself.

>
>> +       depends on HAS_IOMEM
>> +       select GPIOLIB
>> +       select GENERIC_PINCONF
>> +       select GENERIC_PINCTRL_GROUPS
>> +       select GENERIC_PINMUX_FUNCTIONS
>
>> +       select OF_GPIO
>
> ...neither this...

OK.

>
>> +       help
>> +         Support for the serial GPIO interface used on Microsemi and
>> +         Microchip SoC's. By using a serial interface, the SIO
>> +         controller significantly extends the number of available
>> +         GPIOs with a minimum number of additional pins on the
>> +         device. The primary purpose of the SIO controller is to
>> +         connect control signals from SFP modules and to act as an
>> +         LED controller.
>
> ...
>
> Missed header here, like bits.h.

I'll add that.

>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>
>> +#include <linux/of_device.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_platform.h>
>
> I think this driver is OF independent, if you convert the OF leftovers
> to device_/fwnode_ API.

As stated, I'll be removing the OF parts.

>
> Then you need to drop these headers (most of them actually are
> redundant even now) and add property.h. Also you missed
> mod_devicetable.h.
>
>> +#include <linux/clk.h>
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/pinctrl/pinmux.h>
>> +#include <linux/pinctrl/pinconf.h>
>> +#include <linux/pinctrl/pinconf-generic.h>
>> +#include <linux/platform_device.h>
>
> Perhaps ordered and linux/pinctrl/ be grouped after generic ones?

Sure, I can do that. There's some that *are* needed, but your're right
that some are redundant.

>
> ...
>
>> +#define __shf(x)               (__builtin_ffs(x) - 1)
>> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
>> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))
>
> Isn't it home grown reimplementation of bitfield.h?
>

This was answered in the aforementioned mail.

> ...
>
>> +static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
>> +                                    struct pinctrl_gpio_range *range,
>> +                                    unsigned int offset)
>> +{
>> +       struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
>> +       struct sgpio_priv *priv = bank->priv;
>> +       struct sgpio_port_addr addr;
>> +
>> +       sgpio_pin_to_addr(priv, offset, &addr);
>> +
>> +       if ((priv->ports & BIT(addr.port)) == 0) {
>> +               dev_warn(priv->dev, "%s: Request port %d for pin %d is not activated\n",
>> +                        __func__, addr.port, offset);
>
> Don't use __func__ in messages, it's rarely needed and here I believe
> is not the case.
>

Ok, I will drop that.

>> +       }
>> +
>> +       return 0;
>> +}
>
> ...
>
>> +       /* Note that the SGIO pin is defined by *2* numbers, a port
>> +        * number between 0 and 31, and a bit index, 0 to 3.
>> +        */
>
> /*
>  * Fix multi-line comment
>  * style. Like in this example.
>  */

Sure. A drag network style insist to be different, but thats another
sory...

>
> ...
>
>> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
>> +{
>> +       struct device *dev = priv->dev;
>> +       struct device_node *np = dev->of_node;
>> +       int i, ret;
>> +       u32 range_params[64];
>
> Better to use reversed xmas tree order.
>

Ack.

>> +       /* Calculate port mask */
>> +       ret = of_property_read_variable_u32_array(np,
>> +                                                 "microchip,sgpio-port-ranges",
>> +                                                 range_params,
>> +                                                 2,
>> +                                                 ARRAY_SIZE(range_params));
>> +       if (ret < 0 || ret % 2) {
>> +               dev_err(dev, "%s port range\n",
>> +                       ret == -EINVAL ? "Missing" : "Invalid");
>
>

?? Did you have a comment?

>
>> +               return ret;
>> +       }
>> +       for (i = 0; i < ret; i += 2) {
>> +               int start, end;
>> +
>> +               start = range_params[i];
>> +               end = range_params[i + 1];
>> +               if (start > end || end >= SGPIO_BITS_PER_WORD) {
>> +                       dev_err(dev, "Ill-formed port-range [%d:%d]\n",
>> +                               start, end);
>> +               }
>> +               priv->ports |= GENMASK(end, start);
>> +       }
>> +
>> +       return 0;
>> +}
>
> Doesn't GPIO / pin control framework have this helper already?
> If no, have you considered to use proper bitmap API here? (For
> example, bitmap_parselist() or so)
>

Past reviews suggested using an array form. And as the binding is
already reviewed, I would like to keep this as is.

> ...
>
>> +       if (fwnode_property_read_u32(fwnode, "ngpios", &ngpios)) {
>> +               dev_info(dev, "failed to get number of gpios for bank%d\n",
>> +                        bankno);
>> +               ngpios = 64;
>> +       }
>
> Don't mix OF APIs with fwnode APIs.
>

OF is gone.

> ...
>
>> +       pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
>> +       if (pins) {
>
> Use usual pattern  and drop one level of indentation ('else' is redundant).

Yes, done.

>
>> +               int i;
>> +               char *p, *names;
>
>> +               names = devm_kzalloc(dev, PIN_NAM_SZ*ngpios, GFP_KERNEL);
>> +
>> +               if (!names)
>
> Redundant blank line.
>

Gone.

>> +                       return -ENOMEM;
>
>> +               for (p = names, i = 0; i < ngpios; i++, p += PIN_NAM_SZ) {
>> +                       struct sgpio_port_addr addr;
>> +
>> +                       sgpio_pin_to_addr(priv, i, &addr);
>
>> +                       snprintf(p, PIN_NAM_SZ, "SGPIO_%c_p%db%d",
>> +                                is_input ? 'I' : 'O',
>> +                                addr.port, addr.bit);
>
> Wow, snprintf() with constant size argument in a loop. Are you sure
> you are doing correct?

I changed this to per-string allocation.

>
>> +                       pins[i].number = i;
>> +                       pins[i].name = p;
>> +               }
>> +       } else
>> +               return -ENOMEM;
>
> ...
>
>> +       pctldev = devm_pinctrl_register(dev, pctl_desc, bank);
>> +       if (IS_ERR(pctldev)) {
>> +               dev_err(dev, "Failed to register pinctrl\n");
>> +               return PTR_ERR(pctldev);
>> +       }
>
> return dev_err_probe(...);
>

Yes.

> ...
>
>> +       /* Get clock */
>
> Useless comment.

Ok, removed.

>
>> +       clk = devm_clk_get(dev, NULL);
>> +       if (IS_ERR(clk)) {
>
>> +               dev_err(dev, "Failed to get clock\n");
>> +               return PTR_ERR(clk);
>
> dev_err_probe() as above.
>

Yes.

>> +       }
>
> ...
>
>> +       /* Get register map */
>
> Useless comment.
>

Removed.

> ...
>
>> +       nbanks = device_get_child_node_count(dev);
>> +       if (nbanks != 2) {
>> +               dev_err(dev, "Must have 2 banks (have %d)\n", nbanks);
>> +               return -EINVAL;
>> +       }
>
> Don't mix device_property API with OF one.
>

Removed OF.

>> +       i = 0;
>> +       device_for_each_child_node(dev, fwnode) {
>
> Ditto.
>

Don't sure I understand this comment, but device_for_each_child_node()
is from <linux/property.h> - this should be OK I think.

>> +               ret = microchip_sgpio_register_bank(dev, priv, fwnode, i++);
>> +               if (ret)
>> +                       return ret;
>> +       }

Thank you for your comments. They are much appreciated.

I will refresh the patch later today.

Cheers,

---Lars

-- 
Lars Povlsen,
Microchip
