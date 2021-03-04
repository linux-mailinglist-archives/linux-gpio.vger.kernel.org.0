Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABD832D2F2
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240615AbhCDM3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240541AbhCDM3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 07:29:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BDEC061762;
        Thu,  4 Mar 2021 04:28:28 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k66so9502915wmf.1;
        Thu, 04 Mar 2021 04:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=wOdiWufM3hf4PVMfgdosAgtVl3oTI5phqBDSYUE0GVI=;
        b=LKD+szJZqCafdM1dcvj4e+TUyGJJpQ1MYCP0uGH6mYLUL7M+CBtLByzgVbYqkePjTn
         udTZHRH6toEXhH6vHy6dUeMZPWkMGgF9eLiECq/iGdrVUbb5omqNMihj/D3OpdeBrZoz
         rv8zLkopxEHmbwG8vJ+mKiid670l/tvJJqoukS716ypxmxdRtJNIrXWUbjLbCfICi72x
         Kb+rf2w387WfYZQccnEBG5MhA5HF8SknVlLaG3QIVBcZEFtIiQLTMuC4MZZAkjSTFc1N
         uwIXDYmk1ZOOPQrgn1dOTDVplAH9t79KwyeLr/zCHL21Whi9YUdZUcBzTTwZTytvW8zi
         Lztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=wOdiWufM3hf4PVMfgdosAgtVl3oTI5phqBDSYUE0GVI=;
        b=XPeDixFfQHrvqnIrU2RBd1o7tHg+PPp3/X7eGx0TDg8hWhukk0m9x1FOSKoVLfjFcx
         BNZnq89qtB2P8KsrVwPBOzhT0Q5asPyjp9kEEkP4O+NrwB0qj/4pzNF+0R3el2sl1X0h
         Tk6+xCP7ym6z/cXNee3lKtz6AwYWmAvbqz9m9u2tHt+t/JwZJUAptjHySisXyI2M0jiW
         BLcw3QuEAQJ7RYaJWNn0tdy2wiZuRmHh6w/v+YveJ3t1Nly5e9UIxLIzV2qPd8TDTLl+
         JqzuzW9TpVsY5tddChvuyiNDSVbbiM0T8Ssta69+7r8yMXcYA8W40vy265tysRNdpuKx
         kfkQ==
X-Gm-Message-State: AOAM5321yfeOj7TIO8ViBVmv6QUdu1A1R+vSYauOPpSZK1B8Y3I+dSRe
        YoweAcfMwXUcf5kTO0lNV28=
X-Google-Smtp-Source: ABdhPJwTg2dM6lsPTeYXP4XkZC24HPsjqLNZBDwBpVe/KWeXakgc4FhcM2cCZuC5QJ1qs0dUy82BhQ==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr3609412wmc.13.1614860907433;
        Thu, 04 Mar 2021 04:28:27 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm3785362wrx.56.2021.03.04.04.28.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Mar 2021 04:28:27 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAHp75VdzgSyz24xtDiniM40-tjRjKipzdtFvd=Fq=-Xbvr-amw@mail.gmail.com>
Date:   Thu, 4 Mar 2021 13:28:26 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E07960B-BB4B-4647-A1FD-E291F9FD6D74@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
 <20210304085710.7128-4-noltari@gmail.com>
 <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com>
 <667E0AEF-B453-4CC7-9514-5E72BEF4B0E3@gmail.com>
 <CAHp75VdzgSyz24xtDiniM40-tjRjKipzdtFvd=Fq=-Xbvr-amw@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

> El 4 mar 2021, a las 13:09, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>=20
> On Thu, Mar 4, 2021 at 1:17 PM =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> wrote:
>>> El 4 mar 2021, a las 11:43, Andy Shevchenko =
<andy.shevchenko@gmail.com> escribi=C3=B3:
>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>> <noltari@gmail.com> wrote:
>>>>=20
>>>> Add a helper for registering BCM63XX pin controllers.
>>>>=20
>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>=20
>>> This SoB is in a strange place.
>>=20
>> Why?
>> Can=E2=80=99t we both sign the patches?
>=20
> You can, but you have to follow the rules (see chapters 11-13 in the =
[1]).
>=20
>>> The order is wrong taking into account the =46rom header =
(committer). So,
>>> it's not clear who is the author, who is a co-developer, and who is
>>> the committer (one person may utilize few roles).
>>> Check for the rest of the series as well (basically this is the rule
>>> of thumb to recheck entire code for the comment you have got at any
>>> single place of it).
>>=20
>> Jonas was the original author of this patches (sent back in 2016) and =
I=E2=80=99m just continuing his work and trying to get those patches =
upstreamed.
>> I don=E2=80=99t know how to do it correctly, so a little hint would =
be appreciated.
>=20
> There are two ways (depends on the amount of work you have done):
> - leave him as an original author (so Author field will have his name,
> not yours) and apply yours with Co-developed-by tag and SoB since you
> are co-developed and committed
> - other way around

So I will move his SoB to the top, add a Co-developed-by referencing him =
before that and then leave my SoB as the last one.
@Jonas are you OK with that?

>=20
> [1]: =
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sig=
n-your-work-the-developer-s-certificate-of-origin
>=20
> ...
>=20
>>>> +#include <linux/pinctrl/pinctrl.h>
>>>> +#include <linux/regmap.h>
>>>=20
>>> The rule of thumb is to include only the headers that the below code
>>> is direct user of.
>>=20
>> Ok, so I will move them to pinctrl-bcm63xx.c.
>> I added them because they were needed for pinctrl_desc.
>=20
> Ah, for that yes, you need a header.
>=20
>>> The above are not used anyhow, while missed types.h and several
>>> forward declarations.
>>=20
>> =E2=80=A6 so I should include linux/types.h and I don=E2=80=99t know =
what you mean by =E2=80=9Cseveral forward declarations=E2=80=9D=E2=80=A6
>=20
> Like
>=20
> struct regmap;
>=20
> which effectively tells the compiler that "hey, this type is defined
> somewhere else".
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Best regards,
=C3=81lvaro.=
