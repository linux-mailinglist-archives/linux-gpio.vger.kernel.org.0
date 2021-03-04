Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E36832D1A0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 12:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239512AbhCDLSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 06:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235497AbhCDLSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 06:18:05 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8410C061574;
        Thu,  4 Mar 2021 03:17:24 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id u187so7674027wmg.4;
        Thu, 04 Mar 2021 03:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sg4X2WmQd8EM6o7lSCEfOiMlSMhswJ/nBH0wn23Elg0=;
        b=peKNmi0+SkcWFdvcwmG7LXbeMlWR5q0OmqXVk+RODGONYCQWox1eM6Kygf0KXDAB35
         eAWNUnFTn/I5IS0TcpJW5Cn/zJH2S84KN5Bzj0snGIlhPqIe7KJyO+lMBJvuFYOotwqX
         +54FATI+WUxUlJL383n99OBDxDNgzpk+roo+qmWZ/yLkwsYX+7Jvr43KAP0bJqB5YbTn
         ibnpmgjwpmmDuBOx0CSFQreLAazeGXpv1bJ0jsuOfDXvxAzWkjdsOaQjXdb2lPGra0Xc
         IDIlGIw018KBEv2v8rTlAoA932mu3g5AX6F8M28LXnuBj9bzAHHReLGO0JeFv3fmX9wc
         q1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sg4X2WmQd8EM6o7lSCEfOiMlSMhswJ/nBH0wn23Elg0=;
        b=E60d4o9CsVD7zqcmSFCOJMWpnK7GVE8QsWIU57hM+F2jg6P2jTafYzV6pswZbIbsaw
         1Hm3NbqZop0DwXJ3iPtfrr10y4gmVh2Ss9lEKCqmMqlpgjYzF48v51sFvC9VQGaUiwHs
         HhFvWxoIHB08UN3iq7mNkOWBKwmClb1glXCylcAqSscGptJBy79SbOdmibOhMhP8woFd
         Zuet1Pdq9+0t1vdCmzIwSRUMj5zYeiUQby0H2LCpwlzcMRMmmFUmrjz6qkqtkEL7m9t1
         fhAFxAX6/N3vk/X2jJghwOmTt4LV5h05vIi3EorS8OHDsBhP4dqZUCO/xC5r5V6EkkfI
         V9qg==
X-Gm-Message-State: AOAM5336+2HTzdWrUejGzJKOoLxnfYSIjS6bJt2zxkQyNcS6TJuyWhLe
        tbDX3XhcLod71XG0Y+OU8t4=
X-Google-Smtp-Source: ABdhPJy1rLNwixI3SFJIIEbvfatSStuUgVI4okBsQ7m4dgfypNGuTr3Ifvf6koRHTqLdvrDiV7z7kQ==
X-Received: by 2002:a1c:dc42:: with SMTP id t63mr3398802wmg.153.1614856643611;
        Thu, 04 Mar 2021 03:17:23 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q20sm8885069wmc.14.2021.03.04.03.17.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:17:23 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com>
Date:   Thu, 4 Mar 2021 12:17:22 +0100
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
Message-Id: <667E0AEF-B453-4CC7-9514-5E72BEF4B0E3@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-4-noltari@gmail.com>
 <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy

> El 4 mar 2021, a las 11:43, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Add a helper for registering BCM63XX pin controllers.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>=20
> This SoB is in a strange place.

Why?
Can=E2=80=99t we both sign the patches?

>=20
> The order is wrong taking into account the =46rom header (committer). =
So,
> it's not clear who is the author, who is a co-developer, and who is
> the committer (one person may utilize few roles).
> Check for the rest of the series as well (basically this is the rule
> of thumb to recheck entire code for the comment you have got at any
> single place of it).

Jonas was the original author of this patches (sent back in 2016) and =
I=E2=80=99m just continuing his work and trying to get those patches =
upstreamed.
I don=E2=80=99t know how to do it correctly, so a little hint would be =
appreciated.

>=20
> ...
>=20
>> +static const struct of_device_id bcm63xx_gpio_of_match[] =3D {
>> +       { .compatible =3D "brcm,bcm6318-gpio", },
>> +       { .compatible =3D "brcm,bcm6328-gpio", },
>> +       { .compatible =3D "brcm,bcm6358-gpio", },
>> +       { .compatible =3D "brcm,bcm6362-gpio", },
>> +       { .compatible =3D "brcm,bcm6368-gpio", },
>> +       { .compatible =3D "brcm,bcm63268-gpio", },
>=20
>> +       { /* sentinel */ },
>=20
> Comma is not needed in terminator line

Ok, I will remove it.

>=20
>> +};
>=20
> ...
>=20
>> +       dev_info(dev, "registered\n");
>=20
> Unneeded noise.

Ok, I will remove it.

>=20
> ...
>=20
>> +#include <linux/pinctrl/pinctrl.h>
>> +#include <linux/regmap.h>
>=20
> The rule of thumb is to include only the headers that the below code
> is direct user of.

Ok, so I will move them to pinctrl-bcm63xx.c.
I added them because they were needed for pinctrl_desc.

>=20
> The above are not used anyhow, while missed types.h and several
> forward declarations.

=E2=80=A6 so I should include linux/types.h and I don=E2=80=99t know =
what you mean by =E2=80=9Cseveral forward declarations=E2=80=9D=E2=80=A6

>=20
>> +#include "../core.h"
>=20
> Seems the same.

Ok, I will move it to pinctrl-bcm63xx.c.

>=20
>> +#define BCM63XX_BANK_GPIOS 32
>> +
>> +struct bcm63xx_pinctrl_soc {
>> +       struct pinctrl_ops *pctl_ops;
>> +       struct pinmux_ops *pmx_ops;
>> +
>> +       const struct pinctrl_pin_desc *pins;
>> +       unsigned npins;
>> +
>> +       unsigned int ngpios;
>> +};
>> +
>> +struct bcm63xx_pinctrl {
>> +       struct device *dev;
>> +       struct regmap *regs;
>> +
>> +       struct pinctrl_desc pctl_desc;
>> +       struct pinctrl_dev *pctl_dev;
>> +
>> +       void *driver_data;
>> +};
>=20
>=20
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.

