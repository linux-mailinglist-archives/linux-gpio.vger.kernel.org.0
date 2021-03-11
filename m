Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FEE337CB1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 19:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhCKScn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 13:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhCKScm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 13:32:42 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF8FC061574;
        Thu, 11 Mar 2021 10:32:41 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso13978012wme.0;
        Thu, 11 Mar 2021 10:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sDUF6XLixuACLYaep3a0ny/psEb4rmGuWJJGx74m3RE=;
        b=bXHQPgmDf/tc4p2dQT0gIG39OqK8Lz2AG7lO7sSbaEMCJHrQ4YAKUX1e6/Hc3L+u8Y
         5vxddlTQcRJ9iaXHvxm8UpaUr4GFC9gZgGF2y7lm+AQzqdMXAzA+A1fZM4tB9YhZB6xE
         IO51J7Lb3EIQqsc8rScxeMxdlYvjSzOwS8WXIwfasqsxUhkCR0cmjOuqVB4Nbi323klw
         oXrOZp8txoopuPblwPoArP6f+2QJP0Hp6J0kHDjNtaGfVFjwF5G+LQvafU4t10hSa2Js
         cu+1HvTgOdm7KIZrXgXbvRUq6DLMhczqJ+6/dhHeHgvRvv0maWmvtIMH9j9iza69fNts
         fwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sDUF6XLixuACLYaep3a0ny/psEb4rmGuWJJGx74m3RE=;
        b=eqL1JuJuv3/W7y5FlVbFrb4cuJmpi/tKyeiFMHioZDvnAYULKXvqcKBNkbB//M66kV
         O3hCV9jaW1YVmxqswaGw4U6ndMBXJX18xc/wZhwpQZiAJIkVTtMpqJt8DNFSWDllsyrN
         NvAisALTMjeP1kOCG91Dxzo6oSYLSo6WmeSTtucFrfmTX1KGO3W5saLXXgSdlHOiKXG/
         k1gpZpnsK1FKJSGw4HgcROtcY2VlGq0rO1LAwQ7LWeda9PW2jCLW8u0jUzZUiH4NdKaG
         HnHUasvpdFKMwRLPKSZMOEqYWUYuCjBQTpB3mRQCR46rOIkpDJrK9WL7BtdUkGG5Bn27
         ehZg==
X-Gm-Message-State: AOAM530GPyUcL5JfrPfW1zQEUSLlByJSPZOSKTAz0hvTFaP6Id4I+TRD
        TcYjNLjhsSffFBWNDz4n1YE=
X-Google-Smtp-Source: ABdhPJzL9syZVlqckY8/fAVbd7ytYWkZs4fBloyKUBoXcv7cjShrak5J2w3XFTq4dUS+gHwshnNW2w==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr9281492wmb.20.1615487560161;
        Thu, 11 Mar 2021 10:32:40 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id q25sm4659713wmq.15.2021.03.11.10.32.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 10:32:39 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAL_JsqKSqQLUJB9OArwjtSgo5g4nPYLJFt+x54MwS+EHq0+Jww@mail.gmail.com>
Date:   Thu, 11 Mar 2021 19:32:37 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9022EE3C-47C1-446E-B5D7-EB60934B4E8A@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-4-noltari@gmail.com>
 <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com>
 <CACRpkda=isBSW8BwYJ2pCaPcByRoo2GFNVoZCxhaCbEKk9iNsg@mail.gmail.com>
 <CAL_Jsq+FfYE2SrzwB_A=d-LMut-JrqdivKz6x8EQhkc3Zh5NAA@mail.gmail.com>
 <CACRpkdaMYy_Z34i+0uRgciC=xBtoeNsWViHU9ZysvxqrFXB5+w@mail.gmail.com>
 <edb31609-e138-9844-7168-004c882cae97@gmail.com>
 <CAL_JsqKSqQLUJB9OArwjtSgo5g4nPYLJFt+x54MwS+EHq0+Jww@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 11 mar 2021, a las 19:24, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>=20
> On Thu, Mar 11, 2021 at 10:00 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Hi Rob and Linus,
>>=20
>> El 11/03/2021 a las 17:13, Linus Walleij escribi=C3=B3:
>>> On Thu, Mar 11, 2021 at 3:58 PM Rob Herring <robh+dt@kernel.org> =
wrote:
>>>> On Wed, Mar 10, 2021 at 6:09 PM Linus Walleij =
<linus.walleij@linaro.org> wrote:
>>>>> On Wed, Mar 10, 2021 at 6:51 PM Rob Herring <robh+dt@kernel.org> =
wrote:
>>>>>=20
>>>>>>> +static const struct of_device_id bcm63xx_gpio_of_match[] =3D {
>>>>>>> +       { .compatible =3D "brcm,bcm6318-gpio", },
>>>>>>> +       { .compatible =3D "brcm,bcm6328-gpio", },
>>>>>>> +       { .compatible =3D "brcm,bcm6358-gpio", },
>>>>>>> +       { .compatible =3D "brcm,bcm6362-gpio", },
>>>>>>> +       { .compatible =3D "brcm,bcm6368-gpio", },
>>>>>>> +       { .compatible =3D "brcm,bcm63268-gpio", },
>>>>>>=20
>>>>>> All these would be moved to gpio-mmio.c (or maybe that can have a
>>>>>> fallback compatible?).
>>>>>=20
>>>>> This is gpio-regmap.c and it can only be used as a library
>>>>> by a certain driver. gpio-mmio.c can be used stand-alone
>>>>> for certain really simple hardware (though most use that
>>>>> as a library as well).
>>>>=20
>>>> I don't really care which one is used, but the problem is that this
>>>> choice is leaking into the binding design.
>>>=20
>>> Aha I guess I misunderstood your comment.
>>>=20
>>>> The primary problem here is
>>>> once someone uses regmap, then they think they must have a syscon =
and
>>>> can abandon using 'reg' and normal address properties as Linux =
happens
>>>> to not use them (currently). I think we really need some better =
regmap
>>>> vs. mmio handling to eliminate this duplication of foo-mmio and
>>>> foo-regmap drivers and difference in binding design. Not sure =
exactly
>>>> what that looks like, but basically some sort of 'reg' property to
>>>> regmap creation.
>>>=20
>>> I see the problem. Yeah we should try to be more strict around
>>> these things. To me there are syscons and "other regmaps",
>>> where syscon is a real hurdle of registers while "other regmaps"
>>> are just regmaps by convenience.
>>>=20
>>> Documentation/devicetree/bindings/mfd/syscon.yaml
>>> describes what a syscon really is so if everyone could
>>> just read the documentation that would be great ...
>>>=20
>>>> Given we already have a Broadcom GPIO binding for what looks to be
>>>> similar to this one, I'm left wondering what's the real difference
>>>> here?
>>>=20
>>> Which one is similar? I can take a look.
>>=20
>> @Linus I think @Rob is referring to brcm,bcm6345-gpio:
>> =
https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f98372=
ac778/drivers/gpio/gpio-mmio.c#L686
>=20
> Well, since it's the bindings we're talking about:
> Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
>=20
> Which says this:
> "These bindings can be used on any BCM63xx SoC. However, BCM6338 and
> BCM6345 are the only ones which don't need a pinctrl driver."

Yes, I know because I=E2=80=99m the author of that driver=E2=80=A6
What I meant at that time is that it could be used temporarily until a =
proper =E2=80=9Cfull=E2=80=9D pinctrl driver was added.

>=20
> Not that the 1 in tree user of this is perfect. Seems like it too
> should be a child of a system controller if there's other registers.

There are other registers, but dirout and data registers are contiguous =
and separate from the others.

>=20
>>=20
>> However, the real difference between BCM6345 (and BCM6338) is that =
these
>> SoCs have no pin controller at all, only a GPIO controller:
>>=20
>> BCM6345:
>> typedef struct GpioControl {
>>   uint16        unused0;
>>   byte          unused1;
>>   byte          TBusSel;
>>   uint16        unused2;
>>   uint16        GPIODir;
>>   byte          unused3;
>>   byte          Leds;
>>   uint16        GPIOio;
>>   uint32        UartCtl;
>> } GpioControl;
>>=20
>> BCM6338:
>> typedef struct GpioControl {
>>   uint32        unused0;
>>   uint32        GPIODir;      /* bits 7:0 */
>>   uint32        unused1;
>>   uint32        GPIOio;       /* bits 7:0 */
>>   uint32        LEDCtrl;
>>   uint32        SpiSlaveCfg;
>>   uint32        vRegConfig;
>> } GpioControl;
>>=20
>> BCM6348 and newer also have pinctrl.
>> That's the main difference between that driver @Rob's referring to =
and
>> the ones in this patch series.

Best regards,
=C3=81lvaro.

