Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB76FB198
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 14:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfKMNlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 08:41:55 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35453 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfKMNlz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 08:41:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id r7so2645691ljg.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RRgmHzC6DK7zkyZ4JmJb/ZPiVnHC5EVyq2LawB2/zM0=;
        b=ZnC1WEenJfmvHkziOB5GLSNE2m+CTqveoBJnG1OlskxMaCTrZvoB3tTPL6bHMzaI/M
         1HK9JXSt7ZatQKvVNuZzsKpHAvtUb9aOoiUPNpyoSk+jaYpEabiby90Yd4bUAHz/ItL1
         GW7ozyY4fo2ccbZzbD6Gkg+jfQGB91+g0uBB2ljEsx9IS4IiYzMSjADQv4PwXIgM1Cu7
         5ztKLPOIYXsHwbZ7pGRMEYg5wzcwJIzsHErPga7oabz9dC/W9ISzbJ2222vuPb9NQwHE
         Dks9ayF5/ZrU0joJjjloPOABMP7evTPQtCmrySkAv1BbpSGJNoRUeo6O7ZPbNDpg92HS
         k83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RRgmHzC6DK7zkyZ4JmJb/ZPiVnHC5EVyq2LawB2/zM0=;
        b=c6202MqUuA3Yuv+neEPtQ26DnXFfrz7WDasP62NC+Q6bclAKVk64or/RRA72ijohER
         w/TOeuZCZzs3pk3X88YuszL/6umgUxnrAF30PiK3+a0lb6RdW+wN7Z57qYjOsm+CfZz9
         KzvyvBzwsigWy7oyGSUBfpnGN8A/0ZjpzC3Vq9MoL9GmPWqQ7TiDof9gelG3HqJ42c1n
         3YKzYomXgupt7LBgdpEzqj78pHNVSJv+nR/Mnifds9l1x5ktUbRIyyCXSjv75NVZoS5j
         dQV40YUhxYzhf+w+vuyGaGygLcTaBS94GLbRfUWg3EHx/rk76FbdbZHyLj8sqsi3+gTW
         Js/A==
X-Gm-Message-State: APjAAAXRDJH7MofmQ0Vev/0t8wcv7s9/xYm7hwY2H2hDn3Ry2T5eT4Af
        0brTo2leiO4qOlQRD4bFzYgne/VTLcz4CVEdG+qDpA==
X-Google-Smtp-Source: APXvYqyZNOArsRXSy4SKO+NOksD26XRa/qtzt8qjHfGw9lN2mdvtyiiJvj8qjcxi+lt3dYn7wLtVuOvkuRaZ8zZuvSg=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr2760576lji.218.1573652513281;
 Wed, 13 Nov 2019 05:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
In-Reply-To: <20191107214812.Horde.z_ETelVXryT7bme5Ed6oB16@www.vdorst.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 14:41:42 +0100
Message-ID: <CACRpkdaz23Eug+e+ghKQWWaDHegfdngPQ_UQkaP6zAbnic-7_w@mail.gmail.com>
Subject: Re: mt7621: gpio-hog not working properly
To:     =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 7, 2019 at 10:48 PM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:

> DTS:
>
> &gpio {
>         sfp_i2c_clk_gate {
>                 gpio-hog;
>                 gpios =3D <7 GPIO_ACTIVE_LOW>;
>                 output-high;
>         };
> };
>
> root@OpenWrt:/# dmesg | grep hog
> [    3.095360] GPIO line 487 (sfp_i2c_clk_gate) hogged as output/high

This looks correct, output/high and "high" in this case means
asserted and it's active low so that should mean it is driven
low.

> gpiochip0: GPIOs 480-511, parent: platform/1e000600.gpio, 1e000600.gpio-b=
ank0:
>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi ACTIVE LOW

So that is wrong :(

> DTS:
>
> &gpio {
>         sfp_i2c_clk_gate {
>                 gpio-hog;
>                 gpios =3D <7 GPIO_ACTIVE_HIGH>;
>                 output-high;
>         };
> };
(...)
>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi

OK that worked... sheer luck I guess.

> DTS:
>
> &gpio {
>         sfp_i2c_clk_gate {
>                 gpio-hog;
>                 gpios =3D <7 GPIO_ACTIVE_HIGH>;
>                 output-low;
>         };
> };
(...)
>   gpio-487 (                    |sfp_i2c_clk_gate    ) out hi

Yeah now it is wrong again...

> So as you can see gpio-hog is parsed well by the kernel.
> But it setting up the data value is not.

Please drill into the functions.

What happens down in the callback to the actual driver?
Can you check whether the .set_value() gets the right value
or not so we see if there is a logical or physical problem?
The mt7621 driver uses gpio-mmio so you should patch
drivers/gpio/gpio-mmio.c function bgpio_set() or
bgpio_set_set() I think.

Yours,
Linus Walleij
