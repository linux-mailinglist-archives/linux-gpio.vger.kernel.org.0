Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A15178BEA2
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 18:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfHMQcb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 12:32:31 -0400
Received: from mout.gmx.net ([212.227.17.22]:53551 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727251AbfHMQcb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 12:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713944;
        bh=blTFPMwnYHnMZmyKuQRXcVHgNHyKeNg986XxwvUTgFk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ECIziFnQOj/78IuMkhD3MDBRGu6/ehZ8c4DT7fgw82Ir5YJbLoozVD+hK3EiOyOgy
         +f1egkrmPefxpN+umKb61IhTSqNM7JFZxy5JdQD0DseXnl0D35KpzwfGahE0QdWraD
         18ZpEnIUrkcZ6PLN5KYq4ICt3g96bfdUPzKvgSbo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MXmpv-1hl6sh2AI3-00Wn5u; Tue, 13
 Aug 2019 18:32:24 +0200
Subject: Re: [PATCH v2] gpiolib: Take MUX usage into account
To:     "Fried, Ramon" <ramon.fried@linux.intel.com>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190813014210.15519-1-ramon.fried@linux.intel.com>
 <1650c967-5176-70db-ff9a-b2af432ba1e7@i2se.com>
 <88cbb5b2-fd95-afb3-3645-e5b799844941@linux.intel.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <f568ca31-c9f0-0dc2-be12-22de25891794@gmx.net>
Date:   Tue, 13 Aug 2019 18:32:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <88cbb5b2-fd95-afb3-3645-e5b799844941@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:9UI5IqQVTdHWrD4023tJk9Mg4wAVmjc56Wh6hMHAN7a+xFJuyrG
 FYgoFnXz1rj0aKOLJNKjaUpW1IPeGLQHp/rIcm1ycDHBznk52xm643wniZKfHR6aZDlNoik
 i/Mvi6K26UuZi8N1FMs97clc2baUmDUS+r7sH0oIkFNtlAPx4b97ijLusE9Ckvt7SYEsgAm
 q+d6cXFqH/OVCYmeqsVtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tgsr0F5bASI=:49rSrdT0RGN83rogyGNssC
 2VroncK8WIQeAI/qk0utCzUtKvlvsU/cbCQkjz+VV+Dz5Vp4DGefpgLgtNz5lw1cMMMadv3uY
 ZeNOO8S+GCYF5g6jSWi13HCxhOQPOCN9wnN0/21edV71qnp4O8Ee680K54OBMuivWRxl3qeyu
 TYPF4GXSfmumWJIzX1FBZa6D6meLaNDSV2E8uKcUa3BRGYN1eqdCMGps8bBXLbOWG/4xhsJ5r
 9SzNI289U5JRdyCMn9DepijX2usrR06tg6csKk4hVmrNDpCDGMCPFqSbqE/Pg6s70TARsq5rO
 GVMzKg5Y2Wq+7W/3siRnw5NF4y8KhQ0GKucObMHzorg8FucU6ApF/Rb+YumzibO9m5/fih0hf
 VLxf7bwrcfVX3bRdAe+yV7pebwXEjOjsBhs6MvWNyN/cTYeX1gcuXvAQplx6fLsHCu9HxZZo/
 zwUTehZ0jAH9h5pgPThVYi4Vp9HIerl72P5dxncYN3U0TvAywpR/wIPuEBpPREY+i1Dj8ceL/
 4QqjrDi59bNi7pPiqJ6LnJQEdnln3xm7z3Bnv4p6O390kgCf4CIJn7zcPH9g8tKeJz5v+P2Hp
 V2F2siLGze34h+1N9JFRgTC6lit43/jk5AWSMMh7pss324Xbo+i3B+6iprdPdVo9XRO4GkLEO
 2KeQcqUAGxPZyzoXYz9WqCj/hQ2xijxg++gSBWZDhgaYamthkZQ3JakHvgTOV27QPjOXPdkJH
 /XNdk/kZzined/WeWyerc/n27TxTVlHz/IiI2PH0TfvxYoKk1z03HJ9YEgE1+BTd3gyqLBx/I
 IIeg9boJRBoTQPzmDSuuIX6NpvtTNP60ORgR4jEx5C8Q9zehm3plJOrFbqQ4oGsREXacgpqwS
 o2UWgURYdsGfkMqrSEre6DChFki9qhRpcDmGq/pbxDIl30cy0y5hqkkIaFnVivzetphjQ797O
 XwVSrKZirTeUn+Ou0rjS3Fq3BE2hEk1cfnHfHy4aUzH/2ic7+moDmy/0P0FGmGX7E57SdcZjl
 i+lV9MS1o/gTofWcg9RmpDeShXf3xjnFUz7cBDslhJUKRnthhK+JVBcY4BusYrgT2Tc9ekLad
 cAOphv5LvDJzpI6JzZKa7rMdcOB8kPA0n0p8aBpsJ0bUlW0PYO8hhi9WCF7MZITYaoCrj7jvn
 0q4U0=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 13.08.19 um 08:10 schrieb Fried, Ramon:
>
> On 8/13/2019 08:38, Stefan Wahren wrote:
>> Hi Ramon,
>>
>> On 13.08.19 03:42, Ramon Fried wrote:
>>> From: Stefan Wahren <stefan.wahren@i2se.com>
>>>
>>> The user space like gpioinfo only see the GPIO usage but not the
>>> MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to
>>> know which
>>> pin is free/safe to use. So take the MUX usage of strict pinmux
>>> controllers
>>> into account to get a more realistic view for ioctl
>>> GPIO_GET_LINEINFO_IOCTL.
>>>
>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> Tested-by: Ramon Fried <rfried.dev@gmail.com>
>>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>>> ---
>>> v2: Address review from linus:
>>> * ** Please notive logic was reversed **
>>> * renamed pinctrl_gpio_is_in_use() to pinctrl_gpio_can_use_line()
>>> * renamed pinmux_is_in_use() to pinmux_can_be_used_for_gpio()
>>> * changed dev_err to dev_dbg (Linus suggested removing it altogether, =
I
>>> =C2=A0=C2=A0 find it better to keep it for debug).
>> thanks for taking care of this.
>>> =C2=A0 drivers/gpio/gpiolib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
>>> =C2=A0 drivers/pinctrl/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 28 ++++++++++++++++++++++++++++
>>> =C2=A0 drivers/pinctrl/pinmux.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 27 +++++++++++++++++++++++++++
>>> =C2=A0 drivers/pinctrl/pinmux.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++++++
>>> =C2=A0 include/linux/pinctrl/consumer.h |=C2=A0 6 ++++++
>>> =C2=A0 5 files changed, 71 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>> index f497003f119c..52937bf8e514 100644
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -1084,7 +1084,8 @@ static long gpio_ioctl(struct file *filp,
>>> unsigned int cmd, unsigned long arg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test_bit(FLAG_IS_HOGGED, &desc->flags) ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test_bit(FLAG_EXPORT, &desc->flags) ||
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
st_bit(FLAG_SYSFS, &desc->flags))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
st_bit(FLAG_SYSFS, &desc->flags) ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !p=
inctrl_gpio_can_use_line(chip->base +
>>> lineinfo.line_offset))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 lineinfo.flags |=3D GPIOLINE_FLAG_KERNEL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test_bit(FL=
AG_IS_OUT, &desc->flags))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 lineinfo.flags |=3D GPIOLINE_FLAG_IS_OUT;
>>> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
>>> index b70df27874d1..2bbd8ee93507 100644
>>> --- a/drivers/pinctrl/core.c
>>> +++ b/drivers/pinctrl/core.c
>>> @@ -736,6 +736,34 @@ int pinctrl_get_group_selector(struct
>>> pinctrl_dev *pctldev,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> =C2=A0 }
>>> =C2=A0 +bool pinctrl_gpio_can_use_line(unsigned gpio)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct pinctrl_dev *pctldev;
>>> +=C2=A0=C2=A0=C2=A0 struct pinctrl_gpio_range *range;
>>> +=C2=A0=C2=A0=C2=A0 bool result;
>>> +=C2=A0=C2=A0=C2=A0 int pin;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Try to obtain GPIO range, if it fails
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * we're probably dealing with GPIO driver
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * without a backing pin controller - bail ou=
t.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if (pinctrl_get_device_gpio_range(gpio, &pctldev, =
&range))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&pctldev->mutex);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Convert to the pin controllers number space */
>>> +=C2=A0=C2=A0=C2=A0 pin =3D gpio_to_pin(range, gpio);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 result =3D pinmux_can_be_used_for_gpio(pctldev, pi=
n);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&pctldev->mutex);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return result;
>>> +}
>>> +EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
>>> +
>>> =C2=A0 /**
>>> =C2=A0=C2=A0 * pinctrl_gpio_request() - request a single pin to be use=
d as GPIO
>>> =C2=A0=C2=A0 * @gpio: the GPIO pin number from the GPIO subsystem numb=
er space
>>> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
>>> index 020e54f843f9..7e42a5738d82 100644
>>> --- a/drivers/pinctrl/pinmux.c
>>> +++ b/drivers/pinctrl/pinmux.c
>>> @@ -70,6 +70,33 @@ int pinmux_validate_map(const struct pinctrl_map
>>> *map, int i)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +/**
>>> + * pinmux_can_be_used_for_gpio() - check if a specific pin
>>> + *=C2=A0=C2=A0=C2=A0 is either muxed to a different function or used =
as gpio.
>>> + *
>>> + * @pin: the pin number in the global pin space
>>> + *
>>> + * Controllers not defined as strict will always return true,
>>> + * menaning that the gpio can be used.
>>> + */
>>> +bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev,
>>> unsigned pin)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct pin_desc *desc =3D pin_desc_get(pctldev, pi=
n);
>>> +=C2=A0=C2=A0=C2=A0 const struct pinmux_ops *ops =3D pctldev->desc->pm=
xops;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!desc) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(pctldev->dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "p=
in %u is not registered so it cannot be requested\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pi=
n);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> This return value looks strange to me.
>
> Basically, it's just the reversed return value you returned in the
> original patch,
> It means in this context that if the pin is not owned by a
> pin-controller it can be used for GPIO.
As long as the provided pin is valid. Btw shouldn't we change the logic
in the debug message?
>
> Thanks,
> Ramon.
>
>>
>> Stefan
>>
