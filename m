Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4732B17EE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 10:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgKMJLn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 04:11:43 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:46363 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMJLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 04:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605258696; x=1636794696;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=k7KOilJq4Qoe1sB0NcQtlID2iAhlZGIj58vMSyi4npQ=;
  b=eXLVb3u6ZZP7kRbwmAbElwW7e6ZcK1+L6usRoRdQplFCrWOO1rqgYwBp
   hKh+wopUqzsMaXIj6QAzlo6sAAvSbmHM6w6mrU9FJbBi3Vj90U9cfOnTe
   LV3gv+UQuqlKKs7szm9KrA0ebBFQYwrKcpwyx+I9bRejFZFpIhT6AaDi3
   zpg8qLe1jGs9qdM3/gCKYFE6ussv/mRFRVE8OJNiSJtjvKzySg9hpwClO
   mitfLppvQgpbwIaRHOScQ/flpO+OsnfKHsWP5wtvYFvl3RYNygy+iJYmp
   Ei31srPGWHoG5p30ozdX7revknb670OzyqAfJ26hgUWQrTVPQMosAnn0W
   Q==;
IronPort-SDR: 5uBBXILPPP1cLUTarADn81UIsrGsrGEWHkmZK589I5eGgdeAZbO/U7mNt1ecehW1OACSSWZy0r
 AQpqNGSkYAfIvCBCvOlItZaY3/wyqoiJVIv8AIRvM7EKwhShH/g1wuqz5kizQI+jr22/zSmpq/
 ASfdGsyW0uQ1tf928TXuYEUTfa1r2q5cF+xqLYhxqC4xFpjUu5Nvs4mp42+BlWDoPxDTYSo1gY
 V9bIhL+7tJNjcWA6eMOagQ8iELA2JDXhKL1hrOMUSryrRc5/i2s1NtMNTc8PWQTuIiLH6UsBFE
 n3w=
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="33516749"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2020 02:11:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 02:11:34 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 13 Nov 2020 02:11:33 -0700
References: <20201111122454.6240-1-lars.povlsen@microchip.com> <20201111122454.6240-3-lars.povlsen@microchip.com> <CAHp75VfJ7T-ODiyKiMqK-oq5nO3776poSCJag9gvB-aqD3hoMg@mail.gmail.com>
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
Subject: Re: [PATCH v9 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CAHp75VfJ7T-ODiyKiMqK-oq5nO3776poSCJag9gvB-aqD3hoMg@mail.gmail.com>
Date:   Fri, 13 Nov 2020 10:11:26 +0100
Message-ID: <87v9e94o5d.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andy Shevchenko writes:

> On Wed, Nov 11, 2020 at 2:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>>
>> The driver is added as a pinctrl driver, albeit only having just GPIO
>> support currently. The hardware supports other functions that will be
>> added following.
>
> Thanks for an update!
> Seems closer to the final. My comments below.

Well I am certainly glad to hear that!

>
> ...
>
>> + * Author: <lars.povlsen@microchip.com>
>
> No First Name Last Name?
>

I'll add that.


> ...
>
>> +static int sgpio_output_get(struct sgpio_priv *priv,
>> +                           struct sgpio_port_addr *addr)
>> +{
>> +       u32 val, portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
>> +       unsigned int bit = SGPIO_SRC_BITS * addr->bit;
>> +
>> +       switch (priv->properties->arch) {
>> +       case SGPIO_ARCH_LUTON:
>> +               val = FIELD_GET(SGPIO_LUTON_BIT_SOURCE, portval);
>> +               break;
>> +       case SGPIO_ARCH_OCELOT:
>> +               val = FIELD_GET(SGPIO_OCELOT_BIT_SOURCE, portval);
>> +               break;
>> +       case SGPIO_ARCH_SPARX5:
>> +               val = FIELD_GET(SGPIO_SPARX5_BIT_SOURCE, portval);
>> +               break;
>> +       default:
>> +               val = 0;
>
> Missed break; statement.

Fine.

>
>> +       }
>> +       return !!(val & BIT(bit));
>> +}
>
> ...
>
>> +static const struct pinconf_ops sgpio_confops = {
>> +       .is_generic = true,
>> +       .pin_config_get = sgpio_pinconf_get,
>> +       .pin_config_set = sgpio_pinconf_set,
>
>> +       .pin_config_config_dbg_show = pinconf_generic_dump_config,
>
> Do you need this? I mean isn't it default by pin core?

No, I see other drivers also setting this up explicitly.

>
>> +};
>
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
>> +               dev_warn(priv->dev, "Request port %d.%d: Port is not enabled\n",
>> +                        addr.port, addr.bit);
>> +       }
>> +
>> +       return 0;
>
> I believe this function also does some sanity checks. Perhaps you need
> to call a generic one.
> Hence check what should be done in the tear down case.
>

This checks whether the requested signal is actually enabled in the
bitstream. If it is not, it will trigger a warning message. I recon it
should also signal this with the error code, so I'll add that.

Generic code does not have knowledge about the bit stream configuration
(priv->ports), so it can't check for that.

>> +}
>
> ...
>
>> +       if (priv->in.gpio.ngpio != priv->out.gpio.ngpio) {
>> +               dev_err(dev, "Banks must have same GPIO count\n");
>> +               return -EINVAL;
>
> -ERANGE?

We can do that.

>
>> +       }

Thanks,

---Lars

--
Lars Povlsen,
Microchip
