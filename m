Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846E532D701
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbhCDPp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235547AbhCDPp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:45:28 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4629DC061756;
        Thu,  4 Mar 2021 07:44:48 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id w7so8464379wmb.5;
        Thu, 04 Mar 2021 07:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7L6ldQhpGzs3xLIq8oXpk2BNI6m2lMU5dInt+OjQ/hE=;
        b=NnXBHTtpCGowCPvVs40ll/KxB7mLq2dz3YgqwFr2q5BSn9Cj+RwEnaqCRUEbnYwyeQ
         bU/gBL99IYMzGDB8FjSfy1IwaclZDhpkI/jPrUSQawyeKGYkgN3+Ck2shPrUNefnPO8O
         mdm3hAFbLt7fDYu4N53gNPvk+p81jWOAGUDEFuFwPVAJSAGMlGdc+0PvTLrRgYTBxGzM
         hkJ+1B/JpwxX/hNnpnWs+bwofda9h64covW9imLXu6xLNpHXaPSfWJwRybXd1jUUXdxD
         DAPVvfd/VYX+lDIkLA6gh3sSPw6zhJkKXVzwMaxrWfjnuPvrUWvFU+leVTqdVox53aYO
         p3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=7L6ldQhpGzs3xLIq8oXpk2BNI6m2lMU5dInt+OjQ/hE=;
        b=C2L5ybOlSXIcXtgRO9i53hCba1DqhUxTZ2e5GgA6nGYDlUPClsvCkHlsdP6TD0yLVM
         LP7JOR+xNJtRt7gxBhXYnaco1oc64Q0/XGJQsCnufsvmpNWCQoLCIoF2z4UDsv4D8fEg
         UbZBKvNKABAHzOdjEVcShb9DWHhWzL1GJ/73pTTcWILOIyepalJr6to8raDVV+KVpBO0
         sCQukoPt22dUm6AdydHt4R1ph7JI/YGP2N+VcsaitW7tfFBpi4HYPZgwwqt44p+g6HPY
         D2sfCbgLg+AnYKsfWys1WxLPTOOkPPgf9siQ9ELFzmIz0gdoRyOOR25nlzRr5Nzfmjrw
         6Tww==
X-Gm-Message-State: AOAM532b4gjaXt4sLrtjUrGH5Iuz6ncwffexm6RilpVVTmOhtsI0139l
        6DkM5H+/MnInhwgc7FDuEXc=
X-Google-Smtp-Source: ABdhPJx0YeO54X7YVltOLAorkUwBk6cX1IEHoxxU7/2fAHuBtSca4HGCDYdvkxfpZzY4Xebz3oTTvQ==
X-Received: by 2002:a05:600c:35c2:: with SMTP id r2mr4519413wmq.54.1614872686938;
        Thu, 04 Mar 2021 07:44:46 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id d204sm10808676wmc.17.2021.03.04.07.44.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:44:46 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
Date:   Thu, 4 Mar 2021 16:44:47 +0100
Cc:     Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>,
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
Message-Id: <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
 <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com>
 <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> El 4 mar 2021, a las 16:28, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 5:24 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 16:17, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>>>> El 4 mar 2021, a las 11:35, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>>>> <noltari@gmail.com> wrote:
>>>=20
>>>>>> + * @of_node:           (Optional) The device node
>>>>>=20
>>>>>> +       struct device_node *of_node;
>>>>>=20
>>>>> Can we use fwnode from day 1, please?
>>>>=20
>>>> Could you explain this? I haven=E2=80=99t dealt with fwnode never =
:$
>>>> BTW, this is done to fix this check when parsing gpio ranges:
>>>> =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/gpio/gpiolib-of.c#L933-L934
>>>=20
>>> Use struct fwnode_handle pointer instead of OF-specific one.
>>=20
>> But is that compatible with the current gpiolib-of code? :$
>=20
> Yes (after a bit of amendment I have sent today as v2:
> =
https://lore.kernel.org/linux-gpio/20210304150215.80652-1-andriy.shevchenk=
o@linux.intel.com/T/#u).

Well that doesn=E2=80=99t fulfill my definition of =E2=80=9Ccurrent =
gpiolib-of code=E2=80=9D=E2=80=A6
@Linus what should I do about this?

>=20
>>> Also here is the question, why do you need to have that field in the
>>> regmap config structure and can't simply use the parent's fwnode?
>>> Also I'm puzzled why it's not working w/o this patch: GPIO library
>>> effectively assigns parent's fwnode (okay, of_node right now).
>>=20
>> Because gpio regmap a child node of the pin controller, which is the =
one probed (gpio regmap is probed from the pin controller).
>> Therefore the parent=E2=80=99s fwnode is useless, since the correct =
gpio_chip node is the child's one (we have pin-ranges declared in the =
child node, referencing the parent pinctrl node).
>=20
> I see. Can you point me out to the code where we get the node and
> where it's being retrieved / filled?

Sure, this is where the child node is searched: =
https://github.com/Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb4=
8c04/drivers/pinctrl/bcm/pinctrl-bcm63xx.c#L100-L109
Then the gpio child node is probed and assigned here: =
https://github.com/Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb4=
8c04/drivers/pinctrl/bcm/pinctrl-bcm63xx.c#L51

Basically, I based that part of the code on the ingenic pin controller: =
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/drivers/pinctrl/pinctrl-ingenic.c#L2485-L2491
=
https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba37=
0f797/Documentation/devicetree/bindings/pinctrl/ingenic%2Cpinctrl.yaml#L15=
5-L176

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
