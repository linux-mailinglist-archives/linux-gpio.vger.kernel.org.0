Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BD232D2AE
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbhCDMNh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240314AbhCDMNN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 07:13:13 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8B5C061756;
        Thu,  4 Mar 2021 04:12:33 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d8so5609116plg.10;
        Thu, 04 Mar 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XiYssDwn8aWrUUPIZ0bSaYBRfxID6/TO2DA4DbU08gw=;
        b=Cp6p/NsItZt7stLd/mzS/+xf5wYb4MkM7EV/fHzz1DwPr6Bu3dUmmcazULu1liqRYk
         Q7clx12lHzMR/irFaWFLoeTfARoa6W+A5Z3BjPwhvqQpUm511ujvGM1VB0RufoP1B5e/
         811P8LGtlEJjBrwmx1fa56IXlmBznn8Vlcs2mXuiwteIizFmh15HFCTy0J9E+CbbeEe8
         e1FvW6clLErvKs3dozck8Zt53xIMDwc260wTnL6go7jUsP4VQmj0u8S3QllMm/wnJiEL
         XIWPzIhCKpPkMrqmq0OF4owS5/RUms50V0L9hZ+Wj9lS7U1KAtxZ54yQDqpxz67aLHXZ
         nfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XiYssDwn8aWrUUPIZ0bSaYBRfxID6/TO2DA4DbU08gw=;
        b=pOCWk8R+NjLMMdwiimKvTmFLcpd4s3aNI1rOrjWDotn7wNI6MZdfcRH2UGYfzNV38M
         K8EryyOmeSj/VK5lRHz/hrDYUqMwpLkpwafCJy0Bp3U4CNmdxclgDTQ1ewG58Uhq/tD4
         Vr9OEq4m8ZXPXce461z3TklBfXgLt79M71QftGMoQ/mmVENoRb5I1+v1nQ8GXYkdUKM0
         8d6zyVFhxLBedYaSTbks7l4cAoFf6JAueZqPv6TQjzG+yFtBAPqqv7NFqd2bhukt923g
         RT9gKJyS5aqgq2nFVwincwO7c/QflfBJLQfWAcA7hPhjozBR6hLKwIPnT8wNO1GUEQ2k
         X49g==
X-Gm-Message-State: AOAM530LaZzxYJ3HHJzPxsiPlou2aOjUJ+ymXl3jdZi9XJXt6lYg3i7k
        2XNnrcbfVGG7NeC0oTDYhZmL/V6GSeGAA6us7DY=
X-Google-Smtp-Source: ABdhPJx4KAz4+0m4gMaSg6NEehkZztP+dzaqrDK5Al1ExcfXAZJ6TPQqEZbjZECIkICmep1JHoL2VUT9wsbvVUTfvY8=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr4363678pjx.181.1614859952809;
 Thu, 04 Mar 2021 04:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-6-noltari@gmail.com>
 <CAHp75Vc8Gk0ZVjfQH71-Du1ZB1HT5qrgbT6HZgXQd-C6xE05ZQ@mail.gmail.com> <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com>
In-Reply-To: <F56A2594-5E16-457F-B170-D9D14E6592FE@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 14:12:16 +0200
Message-ID: <CAHp75VcVmzKOVn_v0iggaA3gtfYwh3CzO8rFpxA_JbebsEtWPQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: add a pincontrol driver for BCM6328
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 1:13 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 11:49, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:

...

> >> +       static const unsigned int bcm6328_mux[] =3D {
> >> +               BCM6328_MUX_LO_REG,
> >> +               BCM6328_MUX_HI_REG,
> >
> >> +               BCM6328_MUX_OTHER_REG
> >
> > When it's not terminator add a comma, otherwise remove a comma.

> =E2=80=A6 so you want me to add a comma or not?

Hmm... you tell me! If this is a list which covers all possible cases
_and_ the last one is the kinda maximum value (aka terminator), then
comma is not needed, otherwise add it (to me feels like the latter
should be done here).

> > Also, why is it inside a function? It's anyway global and constant.
>
> Because this is only used by this function and I=E2=80=99m used to doing =
this to comply with MISRA C 2004 at work :)

It makes code a bit harder to read.

> >> +       };

--=20
With Best Regards,
Andy Shevchenko
