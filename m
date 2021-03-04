Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F6232D199
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 12:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239504AbhCDLOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 06:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239447AbhCDLNr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 06:13:47 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3D5C061574;
        Thu,  4 Mar 2021 03:13:06 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id e23so7658356wmh.3;
        Thu, 04 Mar 2021 03:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gqQ43NPGzvS91VWTv4uty0yhZhVHqU/N7pIkr8BcRwU=;
        b=qXLVJOLFE5UVgPkDr7nB1tGhMLp6m0ZpPtU38/t+iEeEsaApx8hjdUuKKU2heHff2n
         Y0UKWcMUsYwWpZyA+Yvmr++klU3C2AJ+OQPe/LkQsbeP8/lf8dPwSIXKIcb1+yQev7Yr
         1DzalDgxQPIQbatiQknN82vj/suLOFYAXHWvZ55uyBRs6yXxyBA54Qvh+nTTH3FnMOOo
         AnJU0pMnOQnpj89X8Sh+gwUqOEax+hdMsRawQRp/G38WVoWX9OKzptvv0v/RGFnYvSnd
         Q6pk9m055WjOjEku8ptSgDJ/LWR37qzuAGWNkVMsT6ZGDfXvXlW3QA8sgiobPh5ePGCY
         jmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gqQ43NPGzvS91VWTv4uty0yhZhVHqU/N7pIkr8BcRwU=;
        b=W2FuMCXzV9kbmPeYPmz09qA26sjKcsVywzKaKmoVnA0NVJhUnq8Yft1TE3c9OhE1UP
         REI03+/66IZLXIVPLRsVN+k0wFOz73ggmFINIyGvRBTzTSR1EpP4KP6QuOCiYYjio6i3
         IT/UV+/0frfel3MyQiO9esMVn4a9YG3X4CE3lV22zOqPh9XcUOzDieVmxlGxGK2SePZ7
         yo9ANPFGCSZjjddOCEz851wRmOCJi33E2w0EDen3qfTqG9Rh2FOtHVqc7XCHS2lQ+mjl
         QXtxiY7mBSp9XG858rPvXmG9mTohg8CvV7Zkq0uvJR1aVrfQWhUFSOUS+6HS+1Lyevip
         ehGg==
X-Gm-Message-State: AOAM530X7JaNOH8dQ9dRVcU4ZdFs6JaJMqXbrrJOGiKAVmu+jYl9J4MH
        QJgI6ArCqs7haR6GbbMzwVI=
X-Google-Smtp-Source: ABdhPJyo/cFv8xOP2UL/i4kCgxknS98LMS1tuHsEYAHxdKb33qoP4ZQjTAf2P0RU+0npg4R4TNig0w==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr3395814wmh.19.1614856385309;
        Thu, 04 Mar 2021 03:13:05 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id s20sm9079311wmj.36.2021.03.04.03.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:13:05 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
Date:   Thu, 4 Mar 2021 12:13:04 +0100
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
Message-Id: <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 11:49, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Add a pincontrol driver for BCM6328. BCM628 supports muxing 32 pins =
as
>> GPIOs, as LEDs for the integrated LED controller, or various other
>> functions. Its pincontrol mux registers also control other aspects, =
like
>> switching the second USB port between host and device mode.
>=20
> ...
>=20
>> +static inline unsigned int bcm6328_mux_off(unsigned int pin)
>> +{
>> +       static const unsigned int bcm6328_mux[] =3D {
>> +               BCM6328_MUX_LO_REG,
>> +               BCM6328_MUX_HI_REG,
>=20
>> +               BCM6328_MUX_OTHER_REG
>=20
> When it's not terminator add a comma, otherwise remove a comma.

=E2=80=A6 so you want me to add a comma or not?

>=20
> Also, why is it inside a function? It's anyway global and constant.

Because this is only used by this function and I=E2=80=99m used to doing =
this to comply with MISRA C 2004 at work :)

>=20
>> +       };
>=20
> ...
>=20
>> +       regmap_update_bits(pc->regs, bcm6328_mux_off(pin),
>> +                          3UL << ((pin % 16) * 2),
>=20
> 3UL =3D> #define BLABLA  GENMASK(1, 0)

Ok, I will add a define for this.

>=20
>> +                          mux << ((pin % 16) * 2));
>=20
> ...
>=20
>> +static const struct of_device_id bcm6328_pinctrl_match[] =3D {
>> +       { .compatible =3D "brcm,bcm6328-pinctrl", },
>> +       { },
>=20
> No comma.

Ok, I will remove the comma.

>=20
>> +};
>=20
> Above comments to all your patches.

Ok, I will try to address all of this comments in v5.

>=20
> --=20
> With Best Regards,
> Andy Shevchenko

