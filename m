Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882222ADADF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbgKJPvf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:51:35 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:57694 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbgKJPvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 10:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605023495; x=1636559495;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=MfNkSF8AOw/rVgF97sOcjF8eM8dUN0QlwUwCq5q9uCw=;
  b=KodfbEcNDFSonZajMEw1vQTzMqWmeuRC3p5r4rS4u4/nkIkI3uJ1H18g
   hzhW9Uv+N08d2f9LCJqkXc76Rbdfhi7oZ/YiSeTDJM3veSpvPRcULCGYE
   zXf/3pQRHjd7GZDrysP/a9/TZe+eGir/mfH3wKlkpHzuSazsF8265KaqS
   q/cQXdLTv/wfRQSdmHf791u0GfhT6BG8iNizx3LtC47g4HnCk7llPQN9+
   r/tOxcCtGZpM5GlgDMiBZ98C0/Ka9e9MLgTrke0X0gFxCM6Fm3Aq7Z4/D
   9Xw5wIJOBBGMChM6UCXU9Du+VvcFVY/D6H+XH6184tUpdzY34wtL6oU+h
   A==;
IronPort-SDR: FefI0ey1jMP0uh4DgqujRElDA4FDZaqUm2OBJBkJ6VzKYfpuhzzkovkyXMHz9p6PWi6JHNI1Im
 s0YpKazCqQUdrrcSfM6Jit1IPBi7chpWoFqal0BQdXzIeEYPHgrjY+FWCi6XMMKhwkmEmVSL5V
 GX0kW4JBEDybscuMEJbOO7TnWyC1SKuk9+XlQ3MCHamOozeDJaFJFMeF+Arc2LB8jWQ8ufdteE
 YgSLOW6h3xh/PTvPn8iIeAN6bkuvGvk1r0gN0Brdj3OIB64n/Su8T+FY9UwdUdRtrZ6PpQ23OR
 Vec=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="102884959"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 08:51:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 08:51:33 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 10 Nov 2020 08:51:31 -0700
References: <20201109132643.457932-1-lars.povlsen@microchip.com> <20201109132643.457932-3-lars.povlsen@microchip.com> <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
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
Subject: Re: [PATCH v8 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75Vdfm7A5=Mi-LZ1sHJS5fSngypZQ50-rGQ7A6kD2kmVFTA@mail.gmail.com>
Date:   Tue, 10 Nov 2020 16:51:13 +0100
Message-ID: <87361hfbwu.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Mon, Nov 9, 2020 at 3:27 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>
> Please, elaborate what you said previously, because now it has no
> justification to be a pin control driver.
>

As previously stated, the individual pins have possible other functions
than GPIO. When these functions are added, the driver will need pinctrl
functinality. This was accepted by Linux Walleij.

> ...
>
>> +#define __shf(x)               (__builtin_ffs(x) - 1)
>> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
>> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))
>
> I answered the old thread that it probably makes sense to make
> something like field_get() / field_prep() available for everybody.

I assume its not in there for a reason.

Anyway, I have changed the code to use <linux/bitfield.h> directly, so
this is now gone.

> ...
>
>> +       unsigned int bit = 3 * addr->bit;
>
>> +       unsigned int bit = 3 * addr->bit;
>
> Magic number. Perhaps a defined constant?
>

I can add a constant.

> ...
>
>> +               return -EOPNOTSUPP;
>
> Are you sure? IIRC internally we are using ENOTSUPP.
>
> Couple of drivers seem to be wrongly using the other one.
>

Checkpatch complains about ENOTSUPP:

# ENOTSUPP is not a standard error code and should be avoided in new patches.
# Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.

> ...
>
>> +                       err = -EOPNOTSUPP;
>
> Ditto.
>

Ditto.

> ...
>
>> +       if (input != bank->is_input) {
>
>> +               dev_err(pctldev->dev, "Pin %d direction as %s is not possible\n",
>> +                       pin, input ? "input" : "output");
>
> Do we need this noise? Isn't user space getting a proper error code as
> per doc and can handle this?
>

This need not go to user space, as one use-case is using the pin as a
i2c mux. In this case no signs of the error condition is recorded, it
just doesn't work. So I concur it is not noise, it is sign of an
erroneous situation which should be fixed, IMHO.

The message makes it easy to locate the issue, if any. The message will
not occur on a properly configured system.

Lets have the maintainer make the call.

>> +               return -EINVAL;
>> +       }
>
> ...
>
>> +       if ((priv->ports & BIT(addr.port)) == 0) {
>
> '!' is equivalent to ' == 0', but it's up to you.
>

Thank you, I prefer the current form.

>> +               dev_warn(priv->dev, "Request port %d for pin %d is not activated\n",
>> +                        addr.port, offset);
>> +       }
>
> ...
>
>> +       return bank->is_input ?
>> +               sgpio_input_get(priv, &addr) : sgpio_output_get(priv, &addr);
>
> I would leave it on one line.
>

I can make that one line.

> ...
>
>> +       pin = gpiospec->args[1] + (gpiospec->args[0] * priv->bitcount);
>
> Redundant parentheses.
>

Yes, they are.

> ...
>
>> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
>> +{
>> +       struct device *dev = priv->dev;
>> +       struct device_node *np = dev->of_node;
>> +       u32 range_params[64];
>> +       int i, ret;
>> +
>> +       /* Calculate port mask */
>> +       ret = of_property_read_variable_u32_array(np,
>> +                                                 "microchip,sgpio-port-ranges",
>> +                                                 range_params,
>> +                                                 2,
>> +                                                 ARRAY_SIZE(range_params));
>> +       if (ret < 0 || ret % 2) {
>> +               dev_err(dev, "%s port range\n",
>> +                       ret == -EINVAL ? "Missing" : "Invalid");
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
> As per previous version comment, i.e. perhaps find an existing API for
> this kind of parser or introduce a generic one.
>

I fixed the use of OF api's - that was surely an oversight.

I have searched for a suitable API without finding one. The closest
thing was the parsing of "gpio-reserved-ranges" in gpiolib-of.c, but
that was coded directly. So I think this might not be of general use.

If it is, lets do that after the driver is merged.

> ...
>
>> +       bool is_input = (bankno == 0);
>
> Now I'm not sure why you need this variable here and in the structure.
> Can't you use the above check directly?
> If you want to have flexible settings (i.e. not all generations of hw
> have it like this) I would rather recommend to do it via DT.
>

I have eliminated the local variable - its only in the bank structure.

The pins are (by earlier reviews) separated in distinct input and output
banks. (All variants have both).

> ...
>
>> +       for (i = 0; i < ngpios; i++) {
>> +               char name[sizeof("SGPIO_D_pXXbY\0")];
>> +               struct sgpio_port_addr addr;
>> +
>> +               sgpio_pin_to_addr(priv, i, &addr);
>> +               snprintf(name, sizeof(name), "SGPIO_%c_p%db%d",
>> +                        is_input ? 'I' : 'O',
>> +                        addr.port, addr.bit);
>> +
>> +               pins[i].number = i;
>> +               pins[i].name = devm_kstrdup(dev, name, GFP_KERNEL);
>
> Above with this is a NIH of devm_kasprintf().

Good catch, I'll apply that.

>
>> +               if (!pins[i].name)
>> +                       return -ENOMEM;
>> +       }
>
> ...
>
>> +       /* Get clock */
>
> Useless comment.

Sorry, forgot to remove that. Gone!

>
> ...
>
>> +       div_clock = clk_get_rate(clk);
>> +       if (of_property_read_u32(dev->of_node, "bus-frequency", &priv->clock))
>
> Again, choose one API, no need to spread among several.
>
> As I have told you already: if any comment is given against one
> location in the code, check the entire contribution for similar places
> and address accordingly.
>
>> +               priv->clock = 12500000;
>> +       if (priv->clock <= 0 || priv->clock > (div_clock / 2)) {
>
> How can an unsigned value be possible less than 0?

I'll change that to "==", thanks.

>
>> +               dev_err(dev, "Invalid frequency %d\n", priv->clock);
>> +               return -EINVAL;
>
>> +       }
>
> ...
>
>> +       /* Get register map */
>
> Useless.
>

OK, removed

> ...
>
>> +       /* Get rest of device properties */
>
> This one though may be left.

Thank you for your continued interest in improving the driver. I hope
you'll find the next version palatable.

Cheers,

---Lars

--
Lars Povlsen,
Microchip
