Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEDE32C7F9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236237AbhCDAdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbhCCQOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 11:14:42 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A178EC061762;
        Wed,  3 Mar 2021 08:12:38 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b18so17812186wrn.6;
        Wed, 03 Mar 2021 08:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+esVDoo5iSfzTZlFC03UaiUxOtwcJzAgay1XsaeRfDM=;
        b=NQzVWHwRMy6kPKhLvaTEp1qFufAbIAoWBrfM30EGM1hDrGCuGDzuXXmMIKz7Ue3KIJ
         BfHt5gB0+xLuczBamCKjG8NBbnfiTxxb4C/zKqDSp4UthA7aL3RxoQKMB0T5JGu+uZzD
         sxG1KFIpvxo1Un428cYIC+LoOizyZTNFVV3cNEUCTHcxvrA8+U3i90Rlu00GYAoTTu/0
         0DtTmg0uwOY/c77SvIXPzvkTJTpHYq91ockLDOdmx8IUjxS8BqNjeegkZgQwaYdh73ri
         8DBpK8Rgqls/dh+suw125F0ituJCKqsttYbFxD1EXH3hxAdtHKOULJDjoGQIEY3mfTi3
         DEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+esVDoo5iSfzTZlFC03UaiUxOtwcJzAgay1XsaeRfDM=;
        b=gf7s3joM/YzOPTX/HzWttsGLuEFG8b+odMEmzzB4+CEbXqulA+EdGivvYe3Ka8Qjfp
         B1djJiwplWCCxTeTkhg1aAONyZkhNd70F520IFLteKl7YPZYk/X/No46nMijoVNcG7nB
         eCjBUajLXCYjGM8xGyznAe0OUvX7nEffKnFRHDSCkr5wED6ijSKP5d8SuLcm9jPDXXoE
         VW8tKtTaDoZ4PZWfwm45IYMrK6gUy2fnPMlCJNsJqVftr64c4oJjqPzUR6xz4dD5XSBy
         sqc75uQAFETpfy/JzAb89fdu2njcY4iY3LuMLMGhdOk/b+RE8Cl5+P3gYKMtE7BWW98P
         5V8g==
X-Gm-Message-State: AOAM5323MGiNVJVeuFjYCDlCjiMwFiEAAGEh++K/Weg1k9DQ7Fr6wWvv
        iM4xJJ41NNEAUJ4iQMPn340=
X-Google-Smtp-Source: ABdhPJwG5MD3K8iGd853L2bIAh2Htqvyzse1GJP9e26dvtDpdzAbLIAA+1XURoR2U16O+rskOglP6g==
X-Received: by 2002:a5d:528f:: with SMTP id c15mr27955555wrv.142.1614787957367;
        Wed, 03 Mar 2021 08:12:37 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id o13sm37119531wro.15.2021.03.03.08.12.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 08:12:36 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <40403445ae34e822474e5f39be75fd0b@walle.cc>
Date:   Wed, 3 Mar 2021 17:12:35 +0100
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E341768B-BF42-4749-8D43-8C5CB24D64C3@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
 <20210303142310.6371-2-noltari@gmail.com>
 <40403445ae34e822474e5f39be75fd0b@walle.cc>
To:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Do you want me to send v4 with these changes?
Or maybe just this single patch?

Best regards,
=C3=81lvaro.

> El 3 mar 2021, a las 17:08, Michael Walle <michael@walle.cc> =
escribi=C3=B3:
>=20
> Am 2021-03-03 15:22, schrieb =C3=81lvaro Fern=C3=A1ndez Rojas:
>> This is needed for properly registering gpio regmap as a child of a =
regmap
>> pin controller.
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v3: introduce patch needed for properly parsing gpio-ranges.
>> drivers/gpio/gpio-regmap.c  | 1 +
>> include/linux/gpio/regmap.h | 3 +++
>> 2 files changed, 4 insertions(+)
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index 5412cb3b0b2a..752ccd780b7d 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
>> struct gpio_regmap_config *config
>> 	chip =3D &gpio->gpio_chip;
>> 	chip->parent =3D config->parent;
>> +	chip->of_node =3D config->of_node;
>=20
> chip->of_node =3D config->of_node ?: dev_of_node(config->parent);
>=20
> As mentioned in my previous reply in this thread, for clarity
> reasons.
>=20
>> 	chip->base =3D -1;
>> 	chip->ngpio =3D config->ngpio;
>> 	chip->names =3D config->names;
>> diff --git a/include/linux/gpio/regmap.h =
b/include/linux/gpio/regmap.h
>> index ad76f3d0a6ba..f6e638e32d2a 100644
>> --- a/include/linux/gpio/regmap.h
>> +++ b/include/linux/gpio/regmap.h
>> @@ -4,6 +4,7 @@
>> #define _LINUX_GPIO_REGMAP_H
>> struct device;
>> +struct device_node;
>> struct gpio_regmap;
>> struct irq_domain;
>> struct regmap;
>> @@ -14,6 +15,7 @@ struct regmap;
>> /**
>>  * struct gpio_regmap_config - Description of a generic regmap =
gpio_chip.
>>  * @parent:		The parent device
>> + * @of_node:		The device node
>=20
> Please add "(Optional)" and move it below @regmap. This should also
> mention that if not supplied parent->of_node is used.
>=20
>>  * @regmap:		The regmap used to access the registers
>>  *			given, the name of the device is used
>>  * @label:		(Optional) Descriptive name for GPIO controller.
>> @@ -56,6 +58,7 @@ struct regmap;
>>  */
>> struct gpio_regmap_config {
>> 	struct device *parent;
>> +	struct device_node *of_node;
>> 	struct regmap *regmap;
>> 	const char *label;
>=20
> With these changes:
> Reviewed-by: Michael Walle <michael@walle.cc>
>=20
> -michael

