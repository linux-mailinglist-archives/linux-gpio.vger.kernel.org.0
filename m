Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2108432E328
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 08:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCEHpo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 02:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEHpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 02:45:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6313C061574;
        Thu,  4 Mar 2021 23:45:43 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u16so1012309wrt.1;
        Thu, 04 Mar 2021 23:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=exdJjoCJ2rSvuP4ybnCq/QxIWwOykgPsfHghdEPauo8=;
        b=gj2EDqBiRmbuYy+mBkYa+Pyi7eKQwqyJ5Jwvb5gf8N++YPW2r+lcxiJmnmFIzVfLHa
         NYgEt/+CGLJag1DZjiXwanVfQxTnS8Y3xwzJjC/rQorFGMFLG4za2M//UIhL3GTf3DZE
         +eFI+StU6Ao/xGBpBKO9Ig84L/EHztMT5WBf/h4AkDsfcPXAXhUxE//Lo2DqMdoK1Qet
         DVxAW1PoShRjXsQJGED2WvfSjOF0rKNREFxAeRRvgMSBkB2cKudJwVZJAy6IFMVs4Xwk
         CKFkDCT5pbRPeZ584HIf4uA3scewoI+PzGmPDzjNumonl7J/IyNaZS3jm2YrGg/eWS6C
         pHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=exdJjoCJ2rSvuP4ybnCq/QxIWwOykgPsfHghdEPauo8=;
        b=mRrHJ05kRhNtBVWKe4mmAN7ypZ5nhIjB2a3FVcvNqrO9X+sY2b7eFvLGvO2QFJ3ZSN
         HQLqTbDR/MFErC0lV1EYdVhOgs0X7+Q7pM74yUhsitLmB6yKs9AhOvCMyYr3dBkDG1kC
         9OGlIbchzvtVm4LRe1AqXOgay2vtvwuCNXe4uthFGEAMZY+jcyx+gJHfhflgtINIBAM0
         12RW3kkDcFw7yiCjIUcTBqwZfE8EUZPUnxz2tMfc+7o+WpquQijb1OmWK1EHhmx360QC
         15H6F1tu6FHngoqYawCPIrXnpUeJHNBv1JQYmY28GUpVxNFWllCmCMTOKarcHZPTKzSN
         Eg0A==
X-Gm-Message-State: AOAM533V9BX0fbA/gMaDJVvd+wEI9Y7uMs1DLKbQgGnsjOHU1qBBxqN7
        wYSCTAr9yskCP2p6Nl2jvS8=
X-Google-Smtp-Source: ABdhPJw+hPTEEBhZuA3A26CFHXEimv5pulPVPx92bOBgVUnZcl0k50mD7OUcQF+gCnEgJyMLONFfhw==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr8219155wrq.162.1614930342625;
        Thu, 04 Mar 2021 23:45:42 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id e8sm3320516wme.14.2021.03.04.23.45.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 23:45:42 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
Date:   Fri, 5 Mar 2021 08:45:40 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <891B849E-32A0-4115-BCE9-2F0495274404@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
 <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
 <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com>
 <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 17:33, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 5:44 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 16:28, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 5:24 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>>>> El 4 mar 2021, a las 16:17, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>>>> On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>>>>>> El 4 mar 2021, a las 11:35, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>>>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>>>>>> <noltari@gmail.com> wrote:
>>>>>=20
>>>>>>>> + * @of_node:           (Optional) The device node
>>>>>>>=20
>>>>>>>> +       struct device_node *of_node;
>>>>>>>=20
>>>>>>> Can we use fwnode from day 1, please?
>>>>>>=20
>>>>>> Could you explain this? I haven=E2=80=99t dealt with fwnode never =
:$
>>>>>> BTW, this is done to fix this check when parsing gpio ranges:
>>>>>> =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/gpio/gpiolib-of.c#L933-L934
>>>>>=20
>>>>> Use struct fwnode_handle pointer instead of OF-specific one.
>>>>=20
>>>> But is that compatible with the current gpiolib-of code? :$
>>>=20
>>> Yes (after a bit of amendment I have sent today as v2:
>>> =
https://lore.kernel.org/linux-gpio/20210304150215.80652-1-andriy.shevchenk=
o@linux.intel.com/T/#u).
>>=20
>> Well that doesn=E2=80=99t fulfill my definition of =E2=80=9Ccurrent =
gpiolib-of code=E2=80=9D=E2=80=A6
>> @Linus what should I do about this?
>=20
> Well, fwnode is a generic, and I strongly against spreading
> OF-specific code when we have fwnode working. But let's hear Linus
> out, of course!
>=20
> But it seems you are right and the library needs a few more =
amendments.

Yes, but I=E2=80=99m trying to do as few amendments as possible since I =
already have quite a large amount of patches :)

>=20
>>>>> Also here is the question, why do you need to have that field in =
the
>>>>> regmap config structure and can't simply use the parent's fwnode?
>>>>> Also I'm puzzled why it's not working w/o this patch: GPIO library
>>>>> effectively assigns parent's fwnode (okay, of_node right now).
>>>>=20
>>>> Because gpio regmap a child node of the pin controller, which is =
the one probed (gpio regmap is probed from the pin controller).
>>>> Therefore the parent=E2=80=99s fwnode is useless, since the correct =
gpio_chip node is the child's one (we have pin-ranges declared in the =
child node, referencing the parent pinctrl node).
>>>=20
>>> I see. Can you point me out to the code where we get the node and
>>> where it's being retrieved / filled?
>>=20
>> Sure, this is where the child node is searched: =
https://github.com/Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb4=
8c04/drivers/pinctrl/bcm/pinctrl-bcm63xx.c#L100-L109
>> Then the gpio child node is probed and assigned here: =
https://github.com/Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb4=
8c04/drivers/pinctrl/bcm/pinctrl-bcm63xx.c#L51
>=20
> So, this is not (*yet) in upstream, correct?

No it=E2=80=99s not, but I've already changed the approach several times =
and I=E2=80=99m starting to get tired about it...

>=20
> So, why not to switch to fwnode API in that driver as well?
>=20
> When you do that and supply fwnode thru the regmap configuration, in
> the gpio-regmap we may assign it to of_node (via to_of_node() API).
>=20
>> Basically, I based that part of the code on the ingenic pin =
controller: =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/pinctrl/pinctrl-ingenic.c#L2485-L2491
>> =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/Documentation/devicetree/bindings/pinctrl/ingenic%2Cpinctrl.yaml#L15=
5-L176
>=20
> This doesn't use remgap GPIO.

Yes, I know, but there aren=E2=80=99t any pinctrl drivers using regmap =
GPIO right now, so I couldn=E2=80=99t base my code on anything else :)

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
