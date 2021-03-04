Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB09032D6C0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhCDPeo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235148AbhCDPeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:34:23 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F10C0613D7;
        Thu,  4 Mar 2021 07:33:05 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u125so10083895wmg.4;
        Thu, 04 Mar 2021 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=MZVJZJRjT4SLn3lrfW9LYd3YV//TU8ycIQavOqKS6/E=;
        b=Znx9YMh2w974Yjw/gEPyFyYJMB3HFYrZ9yj/MDcqvNdHpITKxJXXrw7weR8Bbr5cFd
         mESpQ4VplwNKtzlj3YpdvtMvhPyj+gncJwyzDClorz8zueBf5911nqiFtrreIH6ZZCup
         6Ra+CFetyTCqd9DGO+mQNoeIuGRwlYBH3mQPp1UMQgRgl0DAeYh20/3kzufyq35jHVP7
         unmpNJUdhMlcYvbXrfKlm/uGlE+DQhdiPqhzwP2sZiLzFDsKRLqorBDEdqbMQb3UXedc
         JB0tDw45XX1HyJ7e3oGF4QjLs/G0T7+KIBHUgLbENjpF4r2wp/D/MvxpChBcdyDcdEMy
         pIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=MZVJZJRjT4SLn3lrfW9LYd3YV//TU8ycIQavOqKS6/E=;
        b=YW7r7K65kuo7vWr4KC8oaCQgIOEmgI5KQFqqpqF/TDZs++pTWJps3f9GATOxBW1y6e
         RVIxZREWlDYw72/3SXk1Ic9wKUwdR6tHzaUFCbFHuakP4glYuBUv1wG8bR0ezgVPaysd
         3DUYzkoV1EZSDM/aS5jaXV+pq/LTP29kLaEpRo559TMiVmOj0K55H13OcUD6NjJzkDVi
         RHgZhUUcKYuyU6x7hu2VfwrXPkw3Q6xKjcE2+lyxFcN+BFWzUvA4FtU/KKui4gsofzyw
         nKUo2+vtCIW+Ar3bROvBf5cpRcf44T3TlfVBu6xIV4JHnY1KAIfMfTI3xZmV8XPTJ0Px
         EViA==
X-Gm-Message-State: AOAM532OmckzBhf1XT6gYGKOsUvbORNoMNHoDRpXV6tkGiJQqwsXKkGR
        oj9JZHal/zm736ocHFszfl4=
X-Google-Smtp-Source: ABdhPJwiV3iTSTvpEDERtISjyctmaOzX9KQBQ+GPjoqbT/fFkm6beMSVAElfP51Tjzg2zXBslXQe4w==
X-Received: by 2002:a05:600c:1553:: with SMTP id f19mr4557007wmg.33.1614871983762;
        Thu, 04 Mar 2021 07:33:03 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l8sm22452221wrx.83.2021.03.04.07.33.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:33:03 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75Vf6+1u5myV7cL1903Qc92H7vPFMuc916-_wjKQ6zwmoqg@mail.gmail.com>
Date:   Thu, 4 Mar 2021 16:33:03 +0100
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
Message-Id: <0A8F3739-E4A2-499F-8B25-C35CF6F811ED@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com>
 <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com>
 <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
 <CAE32628-DC0D-479F-BB17-2CFA475D5128@gmail.com>
 <CAHp75Vf6+1u5myV7cL1903Qc92H7vPFMuc916-_wjKQ6zwmoqg@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 16:25, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 2:25 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 13:12, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 1:13 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>>>> El 4 mar 2021, a las 11:49, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>>>> <noltari@gmail.com> wrote:
>=20
> ...
>=20
>>>>>> +               BCM6328_MUX_LO_REG,
>>>>>> +               BCM6328_MUX_HI_REG,
>>>>>=20
>>>>>> +               BCM6328_MUX_OTHER_REG
>>>>>=20
>>>>> When it's not terminator add a comma, otherwise remove a comma.
>>>=20
>>>> =E2=80=A6 so you want me to add a comma or not?
>>>=20
>>> Hmm... you tell me! If this is a list which covers all possible =
cases
>>> _and_ the last one is the kinda maximum value (aka terminator), then
>>> comma is not needed, otherwise add it (to me feels like the latter
>>> should be done here).
>>=20
>> Well=E2=80=A6 Then it shouldn=E2=80=99t be needed, since this is a =
list which covers all possible cases and the last one is a terminator.
>=20
> Honestly the name suggests otherwise. And looking into the code there
> is no guarantee you won't split that _OTHER_ area to something with
> new compatible hardware.

Every BCM63XX device has its own specific pin controllers.
It seems that on every new SoC created by Broadcom they decided that the =
previous pin controller approach was a bad decision or something xD.
Therefore I don=E2=80=99t think there will be such =E2=80=9Cnew =
compatible hardware=E2=80=9D...

> Renaming to BCM6328_MUX_MAX_REG will clear that this is terminator,
> but it means its value shouldn't be used except as to understand the
> amount of supported registers of this enumerator.

No, I don=E2=80=99t think this is a good idea.
Please, take a look at:
=
https://github.com/jameshilliard/gfiber-gflt100/blob/b292e8c271addbda62104=
bece90e3c8018714194/shared/opensource/include/bcm963xx/6328_map_part.h#L41=
0-L441
As you can see, BCM6328_MUX_LO_REG and BCM6328_MUX_HI_REG are used for =
specific GPIOs, but BCM6328_MUX_OTHER_REG is used for pins which lack a =
direct GPIO assignment.

>=20
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
