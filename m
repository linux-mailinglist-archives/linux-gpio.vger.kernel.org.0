Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECE2298F9F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781815AbgJZOly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:41:54 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:5954 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781813AbgJZOlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1603723312; x=1635259312;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=Z51Y0WPuxfySceJvyCg6OljYCBlpG10jvErN7/lqG0I=;
  b=R+NiQfz5B+DbyhcfeUE5eJ5esnaiMONIGQPcVmK9Dpjlzg2LvD8rgAZ0
   m9W71NXMUI8i/MeR5zcSN7JQ9Vsc9L/XaFOh94HwBnPR6rip1tPSueraN
   h59kR0O7hsqSiJWRxFAUQKynfDdyTC+6E0TcRP2H9tDmh4bAQXE6/TL8S
   DsOl6XOVHVQnOuNYFsCeZmg0r+wIciDpqWRTZcGrGpAt7RZ+nhK/n7EGF
   mm26htIActEplS1nE5LCBOdnPBgMfiZdtWO4eCaCj+WCAWTKXdp33CG/T
   X66uSJhWLtWVpqgzemq8t8WclcT6gwYX+MBPpZXPMHL89bdMjCLSqT2Ks
   Q==;
IronPort-SDR: ur/iatolHsSQLlPgkra01jpyP5UkFR+f5oGAiX4Pjn2n9J/D9MuDMyL3kv6VEXO9c7A7mTJwUg
 xkaD593Pxs3tt+NKcnSCwp5g5iVK4g1VwkmMkzF89Uf/vF0WGR5HTRPPs9RTW9rmrMcJ7rRppO
 +mmBam0NpSmUlFv7OHKc9fODnfUkoz/5riwLNb2Z99G3KTobhCNw8swQiqoscQVQAhUOIWCOPy
 ChnKC2dgkrJ97Jg3lR297+N8NYLzL+SR8oX+M2jADYlFdtkF7Mkpl/29SgZ4F3uB5IkWi3WB3T
 AK4=
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; 
   d="scan'208";a="91396107"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Oct 2020 07:41:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 26 Oct 2020 07:41:51 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 26 Oct 2020 07:41:49 -0700
References: <20201014100707.2728637-1-lars.povlsen@microchip.com> <20201014100707.2728637-3-lars.povlsen@microchip.com> <CAHp75Vdd6ECJaWytYVz+5GYZrwybzZmviUOt3H=t-4LH=_idKg@mail.gmail.com>
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
Subject: Re: [PATCH v6 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75Vdd6ECJaWytYVz+5GYZrwybzZmviUOt3H=t-4LH=_idKg@mail.gmail.com>
Date:   Mon, 26 Oct 2020 15:41:48 +0100
Message-ID: <87blgp9hhv.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Andy!

Andy Shevchenko writes:

> On Wed, Oct 14, 2020 at 6:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>
> ...
>
>> +#define PIN_NAM_SZ     (sizeof("SGPIO_D_pXXbY")+1)
>
> +1 for what?
>

Reverse fencepost :-). I'll remove it.

> ...
>
>> +#define __shf(x)               (__builtin_ffsll(x) - 1)
>> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
>> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))
>
> This smells like bitfield.h.
>

Yes, and I would use it if I could, just bitfield.h don't like anything
but constexpr. The driver support 3 SoC variants which (unfortunately)
have different register layouts in some areas.

> ...
>
>> +static int sgpio_input_get(struct sgpio_priv *priv,
>> +                          struct sgpio_port_addr *addr)
>> +{
>
>> +       int ret;
>> +
>> +       ret = !!(sgpio_readl(priv, REG_INPUT_DATA, addr->bit) &
>> +                BIT(addr->port));
>> +
>> +       return ret;
>
> Sounds like one line.
>

Yes, I'll change that.

>> +}
>
>> +static int sgpio_get_functions_count(struct pinctrl_dev *pctldev)
>> +{
>
>> +       return 1;
>
> I didn't get why it's not a pure GPIO driver?
> It has only one function (no pinmux).
> I didn't find any pin control features either.
>
> What did I miss?

The hardware has more functions, which are planned to be added
later. This has already been agreed with Linux Walleij.

>
> ...
>
>> +static int microchip_sgpio_get_value(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +       struct sgpio_bank *bank = gpiochip_get_data(gc);
>> +       struct sgpio_priv *priv = bank->priv;
>> +       struct sgpio_port_addr addr;
>
>> +       int ret;
>
> No need.

Ok, I'll trim it.

>
>> +
>> +       sgpio_pin_to_addr(priv, gpio, &addr);
>> +
>> +       if (bank->is_input)
>> +               ret = sgpio_input_get(priv, &addr);
>> +       else
>> +               ret = sgpio_output_get(priv, &addr);
>> +
>> +       return ret;
>> +}
>
>
> ...
>
>
>> +       ret = devm_gpiochip_add_data(dev, gc, bank);
>> +       if (ret == 0)
>
>> +               dev_info(dev, "Registered %d GPIOs\n", ngpios);
>
> No noise.
>

OK, gone.

>> +       else
>> +               dev_err(dev, "Failed to register: ret %d\n", ret);
>> +
>
> ...
>
>> +       /* Get register map */
>> +       regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       priv->regs = devm_ioremap_resource(dev, regs);
>
> devm_platform_ioremap_resource();

Yes, I'll replace with that.

>
>> +       if (IS_ERR(priv->regs))
>> +               return PTR_ERR(priv->regs);
>
>> +       priv->properties = of_device_get_match_data(dev);
>
> It's interesting you have a mix between OF APIs and device property
> APIs. Choose one. If you stick with OF, use of_property_ and so,
> otherwise replace of_*() by corresponding device_*() or generic calls.

Sure. I will change the device_property_read_u32() with
of_property_read_u32().

>
> Can you use gpio-regmap APIs?

No, I think the sgpio hardware is a little too odd for that
(of_gpio_n_cells == 3). And then there's alternate pinctrl functions.

Thank you for your comments, they are very much appreciated. Let me know
if I missed anything.

I will refresh the series shortly (on v5.10-rc1).

---Lars

-- 
Lars Povlsen,
Microchip
