Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6283347A3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 20:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhCJTMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 14:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbhCJTMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 14:12:31 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882C3C061760;
        Wed, 10 Mar 2021 11:12:30 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u14so24574167wri.3;
        Wed, 10 Mar 2021 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=INYKDm2dkWL3HE2MRCJAw093pEqyLHWbGAiMdHovjhk=;
        b=mAmxOdjfbEfZnSsdD1Ad2PsBOumA9wyfB8ymlbOx8psLBmdUdXGj4WMYr5pGdhp7Pn
         GY1C80JK55Q5Cxf0XQom9oJw55P5RRNsN3/rgjSPNFHQpuLu4M+q9Kdd4uwsI+G/2++8
         c+ZvlreERo8wdkgmWUulChN1+wuLi2IKQ+sxUUnDCOZIqJyFrR0rI5NpQcQtpDYWF4e0
         8t1611ZFg/SS/kD3K7XL0T65gA9nNbg94RY5r07mmt8TmuOOgVK3fXwRotr48nh/rNDY
         LDaNiAV5ogHWjY99yqGUGZQel3RngNE9A0rQe+5e/LhBfhAtix5cHBQM3rutBv98Pug3
         DmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=INYKDm2dkWL3HE2MRCJAw093pEqyLHWbGAiMdHovjhk=;
        b=eJ52QtZ5pe8B/fkvcZ0F/xCG86UdDpPUrfZPJmPXuN2njbe0/PU/x4VLDc6foRpqkI
         yy0giwwsWLjZrVbVBrbmjiKHabjkDjUsK2Kz/5z4EF6h5piHE3b2sVebaOrkVxEmPUnE
         Tmrv9tUOgu5q0A33VnpBFlzXxqwSmqbQhNOftQx/vqTzY0ORUtKAOw6ndc8AYJ+LF1qR
         UKvuYZKV0rNX3UAzaAXz2tJQpeewf++hYFT5nJfa8ncRhLojI94u2m66Jj/KljpLYihL
         ZCvytYBn1TH1SH0UZgLZXuUsFjNPySCvXk/TtKw2d0MvbdhFH7+0tZLvoUw5CDhGl1xY
         NX4A==
X-Gm-Message-State: AOAM530fGTxwm0pUvsRx1cWz/LWmzKHC9Qy4qgYltSx+6KMtQIToWYi1
        abQ04OLwoKuhTgACdY4h7wY=
X-Google-Smtp-Source: ABdhPJz8zw5oOPXHDEHY8HB8sSVKZh2Cq9JbL7/EDaG3+sn7QeLQZCxJVErWjwxWfXyryqbhJAD/YA==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr4996560wrd.126.1615403549157;
        Wed, 10 Mar 2021 11:12:29 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h25sm452790wml.32.2021.03.10.11.12.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 11:12:28 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 02/15] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <7e35bfd395f3ae40029b0f3cb2bc8f70@walle.cc>
Date:   Wed, 10 Mar 2021 20:12:27 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC6BACCE-C76F-41C5-8CB9-BEF3257B3B57@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-3-noltari@gmail.com>
 <7e35bfd395f3ae40029b0f3cb2bc8f70@walle.cc>
To:     Michael Walle <michael@walle.cc>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

> El 10 mar 2021, a las 19:27, Michael Walle <michael@walle.cc> =
escribi=C3=B3:
>=20
> Am 2021-03-10 13:54, schrieb =C3=81lvaro Fern=C3=A1ndez Rojas:
>> This is needed for properly registering GPIO regmap as a child of a =
regmap
>> pin controller.
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> ---
>> v6: add comment and simplify of_node assignment
>=20
> Ah, I see you add the comment for the documentation. Nice. But I'd
> like to see it in the code, too. See below.

Ah, sorry for that, I thought you wanted it on the header.
Excuse me for that...

>=20
>> v5: switch to fwnode
>> v4: fix documentation
>> v3: introduce patch needed for properly parsing gpio-range
>> drivers/gpio/gpio-regmap.c  | 1 +
>> include/linux/gpio/regmap.h | 4 ++++
>> 2 files changed, 5 insertions(+)
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index 5412cb3b0b2a..d4fc656e70b0 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
>> struct gpio_regmap_config *config
>> 	chip =3D &gpio->gpio_chip;
>> 	chip->parent =3D config->parent;
>=20
> If there will be a new version, please add the following comment:

Right now I don=E2=80=99t know that either, because I=E2=80=99m honestly =
getting tired of this=E2=80=A6

>=20
> /* gpiolib will use of_node of the parent if chip->of_node is NULL */
>=20
>>> +       chip->of_node =3D to_of_node(config->fwnode);
>=20
> Otherwise, it is not obvious that config->fwnode is optional.

Yes, you=E2=80=99re right.

>=20
> -michael
>=20
>> +	chip->of_node =3D to_of_node(config->fwnode);
>> 	chip->base =3D -1;
>> 	chip->ngpio =3D config->ngpio;
>> 	chip->names =3D config->names;
>> diff --git a/include/linux/gpio/regmap.h =
b/include/linux/gpio/regmap.h
>> index ad76f3d0a6ba..334dd928042b 100644
>> --- a/include/linux/gpio/regmap.h
>> +++ b/include/linux/gpio/regmap.h
>> @@ -4,6 +4,7 @@
>> #define _LINUX_GPIO_REGMAP_H
>> struct device;
>> +struct fwnode_handle;
>> struct gpio_regmap;
>> struct irq_domain;
>> struct regmap;
>> @@ -16,6 +17,8 @@ struct regmap;
>>  * @parent:		The parent device
>>  * @regmap:		The regmap used to access the registers
>>  *			given, the name of the device is used
>> + * @fwnode:		(Optional) The firmware node.
>> + *			If not given, the fwnode of the parent is used.
>>  * @label:		(Optional) Descriptive name for GPIO controller.
>>  *			If not given, the name of the device is used.
>>  * @ngpio:		Number of GPIOs
>> @@ -57,6 +60,7 @@ struct regmap;
>> struct gpio_regmap_config {
>> 	struct device *parent;
>> 	struct regmap *regmap;
>> +	struct fwnode_handle *fwnode;
>> 	const char *label;
>> 	int ngpio;

