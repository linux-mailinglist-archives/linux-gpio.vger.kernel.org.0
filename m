Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAFA32CE6C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236742AbhCDI2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236747AbhCDI15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:27:57 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F402C06175F;
        Thu,  4 Mar 2021 00:27:17 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m7so415774wmq.0;
        Thu, 04 Mar 2021 00:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DhzRv1HTRJYO9NRCMMcTtvQlNov3HAyWzRcE1STMvlg=;
        b=XmhBZF8WkgUMbvr8jldDRJASiVtMHPoVVMBTL4pVdIIXQQ/b3SBhSFxizC4V/6148b
         J6WluDCaKsmb0JSfeOXcwthX4tvbDsewIIStOwZxPTJMyQbFQA2BEdWwL3yFtfFG8z7H
         THHrvrP5j08qEnfDG3XfuGRsZ2Qa1+iR4CcmbsfR0Q1O0rLJYMt+dbVFCd5lDqVS8yNr
         Wx0+MShAz6NHZOdaDN0h6zep5xetCNpb/qs3OrV3jOKB51U10U4FJNTG2pZmh4bMdB2I
         +CzGpDRQ3fH/S47UvHD4XfXK/WawownhLVfgXyiOcGTtXaW+/lEm4sgyutxAR/OlSyKD
         A0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DhzRv1HTRJYO9NRCMMcTtvQlNov3HAyWzRcE1STMvlg=;
        b=LrwOL07jS34Tv/ZOU/RopZPwxA5XncNWx7K8ROvR3jMeN3BYx2HxYPFfUlqgd0H9GN
         TOJz1P29Cj5lBEFkF4mFYcWlOzVFolAFEpJEyegzhJBuiMP72MW4/QaitkkVNpoiHSYE
         GsinYlLNiai5f5wt5hl9DJJsq/kjyKCmj4eZS9793bRN9YhWO9teIUJNCPXEFGB3QKq8
         QutAyanOcmJGbX4SWLbpf8t1Igs8j+VEKrIMETvgDMxbJfaDKsg5YImAo8f7K/aoqJzK
         eEnSiR5+M3RorUmJVbOlO1B6Ef396mp+3HpiEw1J+sKzvu8mc129eyk5buhuAoefMxqv
         PrUg==
X-Gm-Message-State: AOAM531YVoZVVWV2djJtL1fibTr7PmnH+jD5z8oc4OWM5h+QcB7Ve5Xa
        4ATYebZEm4/fiVkA65w+24s=
X-Google-Smtp-Source: ABdhPJyRiE0O3YcYS6HVMa7afmf2uN0emAWFAp08JbnN924VA5W64J8+yJuuk6qNv2h3H2UG3kxYJA==
X-Received: by 2002:a1c:4b11:: with SMTP id y17mr2596723wma.171.1614846435763;
        Thu, 04 Mar 2021 00:27:15 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id c26sm36518129wrb.87.2021.03.04.00.27.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 00:27:15 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] gpio: regmap: set gpio_chip of_node
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <dc9933abd720e1449f78e86e5ff10f48@walle.cc>
Date:   Thu, 4 Mar 2021 09:27:15 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <755C66F8-6B0E-469A-8419-6EFA290DA182@gmail.com>
References: <20210304071506.18434-1-noltari@gmail.com>
 <dc9933abd720e1449f78e86e5ff10f48@walle.cc>
To:     Michael Walle <michael@walle.cc>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

> El 4 mar 2021, a las 9:18, Michael Walle <michael@walle.cc> escribi=C3=B3=
:
>=20
> Am 2021-03-04 08:15, schrieb =C3=81lvaro Fern=C3=A1ndez Rojas:
>> This is needed for properly registering gpio regmap as a child of a =
regmap
>> pin controller.
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> ---
>> v2: split this patch from the bcm63xx-pinctrl series
>> drivers/gpio/gpio-regmap.c  | 1 +
>> include/linux/gpio/regmap.h | 3 +++
>> 2 files changed, 4 insertions(+)
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index fed1e269c42a..8898ab3e1d59 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -249,6 +249,7 @@ struct gpio_regmap *gpio_regmap_register(const
>> struct gpio_regmap_config *config
>> 	chip =3D &gpio->gpio_chip;
>> 	chip->parent =3D config->parent;
>> +	chip->of_node =3D config->of_node ?: =
dev_of_node(config->parent);
>> 	chip->base =3D -1;
>> 	chip->ngpio =3D config->ngpio;
>> 	chip->names =3D config->names;
>> diff --git a/include/linux/gpio/regmap.h =
b/include/linux/gpio/regmap.h
>> index ad76f3d0a6ba..566d76d0dbae 100644
>> --- a/include/linux/gpio/regmap.h
>> +++ b/include/linux/gpio/regmap.h
>> @@ -4,6 +4,7 @@
>> #define _LINUX_GPIO_REGMAP_H
>> struct device;
>> +struct device_node;
>> struct gpio_regmap;
>> struct irq_domain;
>> struct regmap;
>> @@ -15,6 +16,7 @@ struct regmap;
>>  * struct gpio_regmap_config - Description of a generic regmap =
gpio_chip.
>>  * @parent:		The parent device
>>  * @regmap:		The regmap used to access the registers
>> + * @of_node:		(Optional) The device node
>>  *			given, the name of the device is used
>=20
> Something is messed up here ;) This line should be together with
> the one containing @regmap. While at it please add the
> "If not given, the of_node of the parent device is used."

I think I was still sleeping when I did this=E2=80=A6
Excuse me for that :(

>=20
> -michael
>=20
>>  * @label:		(Optional) Descriptive name for GPIO controller.
>>  *			If not given, the name of the device is used.
>> @@ -57,6 +59,7 @@ struct regmap;
>> struct gpio_regmap_config {
>> 	struct device *parent;
>> 	struct regmap *regmap;
>> +	struct device_node *of_node;
>> 	const char *label;
>> 	int ngpio;

Best regards,
=C3=81lvaro.=
