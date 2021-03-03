Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D669432BB46
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236422AbhCCMUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842438AbhCCHGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 02:06:10 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396E6C061756;
        Tue,  2 Mar 2021 23:05:30 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id o16so5167183wmh.0;
        Tue, 02 Mar 2021 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gAq60drMyiinIRI3LPgOZbcKj8NSqmxYko+HQBe0/Ro=;
        b=IDOX6nDRgVNa1VUfes0ZvyCre5DrtFWuFCYvmlVM3Eijwf+CmpjfPcAoFiRtIt1Sud
         GudyeFZbmJMkluOM4fhLAbsSpZCxaKIA2QQXFOrJLxjJU+k9VCSMOMB7LZMyh16LruXx
         6ZFJK6jmCHgdNUAstV4fvtatL+PGm+VGZKIIls8er/tqZURXYYr0JCHrFy4BfrwX/FgA
         +LhfTokPOJjfy2eATq8rJLHNarXYtUT2xtBWCB2QLXvUP0cR45cPoAxAZD6szlcD1rm8
         4HrHA1mv6VyM29xCmkuIGiGOWgiXN7z6wZzrgu0ZGk9d4HVFgQvH5yAviFbBnWFypDU5
         U7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=gAq60drMyiinIRI3LPgOZbcKj8NSqmxYko+HQBe0/Ro=;
        b=BIzLOZY5Va8pT+YZHutkIlu5fla5ol6gSYMJKFg511gQrnN6B6/Ow4uPu9gv1a1Biz
         rF5t2BqajPEbfuZimfnXwmatG0sVdlj1COiaGQu8SVgVY0jHfqxUXTfA0JwDAjk6ijPK
         dLFjDt+SfToesh6BW8lKjGIF4iJUN+oPWR66cZlCRMG8UGLrkyZm/UgOyYUUmWumYR+h
         Y1YCnZR5w0v/ljsTtIeOHsRhiPsZL5+TtH8M0GTP0W3vvbcpVvbKi/8re/fRHcO/h8Bz
         +f4k5tdj5R1mt/YAVLsLBoTXoJxmcasJDA3YXGceNO4Y6Kfp7kLn8pjvKRUuSiL3svEp
         AD4w==
X-Gm-Message-State: AOAM5325F/VZhed72S6zjHwMjTeTyu0imskhrupjBRL489iRYF1XO8zj
        +JxcE+/JY3GuInGj8wzzx1U=
X-Google-Smtp-Source: ABdhPJzHbDeMvcf+JgymfeNDX1BciFJkjZcGav/McpS8E1RwSBuGweBlRfqJ1SiTkknCmM1FM+T3cQ==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr7663900wmi.117.1614755128753;
        Tue, 02 Mar 2021 23:05:28 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y62sm6561512wmy.9.2021.03.02.23.05.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 23:05:28 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CACRpkdbHV+HCfTw__2u_EF1SbmG_0Ce-6VMs7wbAe+HtJXYM_A@mail.gmail.com>
Date:   Wed, 3 Mar 2021 08:05:26 +0100
Cc:     Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4197E9C5-56BD-44A2-A250-FC6BAE13480C@gmail.com>
References: <20210302180601.12082-1-noltari@gmail.com>
 <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
 <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
 <CACRpkdbHV+HCfTw__2u_EF1SbmG_0Ce-6VMs7wbAe+HtJXYM_A@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> El 2 mar 2021, a las 23:39, Linus Walleij <linus.walleij@linaro.org> =
escribi=C3=B3:
>=20
> On Tue, Mar 2, 2021 at 7:14 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>=20
>> I'm trying to add support for bcm63xx pin controllers, and Linus
>> suggested that I could use gpio regmap instead of adding duplicated =
code.
>> However, I need to access gpio_chip inside gpio_regmap to call
>> pinctrl_add_gpio_range() with gpio_chip.base.
>=20
> Can't you just put the ranges in the device tree using the standard
> property gpio-ranges?

Ok, I=E2=80=99ll use that on v3 :).

So I guess that I should also call gpio_direction_input() and =
gpio_direction_output() directly to replace gpio_chip->direction_input() =
and gpio_chip->direction_output() for the two drivers that need it =
(BCM6358 and BCM6368).

>=20
> These will be added automatically after the chip is added.
>=20
> It is documented in
> Documentation/devicetree/bindings/gpio/gpio.txt
> a bit down the file.

Thanks for the link :)

>=20
> The code is in of_gpiochip_add_pin_range() in gpiolib-of.c
> called from of_gpiochip_add() which is always called
> when gpiochip_add_data_with_key(), the main gpiochip
> registering function is called.
>=20
> This would just do the work for you with no effort in the driver.
>=20
> It is a bit counterintuitive that this can be done in the device
> tree but the hierarchical IRQs cannot do the same clever
> manouver to map IRQs, sorry.
>=20
> Yours,
> Linus Walleij

Best regards,
=C3=81lvaro.=
