Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F82B32D2AA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240322AbhCDMK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:10:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240325AbhCDMKs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 07:10:48 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7A2C06175F;
        Thu,  4 Mar 2021 04:10:08 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id a23so8968477pga.8;
        Thu, 04 Mar 2021 04:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yoz5jqRPrabeeWC7lF5SS1fMw0aRxorlReRXftd3nug=;
        b=vgVW5XubFKYg+Ogj/E4XqL/mS+iYQ4jjUk6vxdlEvUgxrTlfR/f/DK7//21Ts6lBxo
         KI2H0VqBrIFO7byH4zRXjZKvR2Et60SyABVTB+R7qWYbstfTuS+t6gNOwc/900k/yCeM
         Ws2nr1hIj0ho0H7pTtUuhHO3uPQ/sb1foFbyCrdbXEER1mz/OPdtbbMh7t01SCKVhrcG
         WY2I0/p3yDaFCCNkz3ejzHl3Ly27kkxt7m2JMx9/54gb933VCaI+fdCz26w9IP2Eo8Pt
         Tne7r3UjSC2s9fVC8HyG38z1XZ47W6mk8zwQ4ig/hZhQx7QsAUKjLRixqBR9VHID9Y5U
         vNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yoz5jqRPrabeeWC7lF5SS1fMw0aRxorlReRXftd3nug=;
        b=ZyHjPN4JjwcTivQkCQ+i2L9msLpCDbbC9pZ+h44ipWCpkJ3qVsIq4x+ZtJNfjKoxer
         GkfCRhW/gqgtak/gDm/89dLIiIadZNfvbVs+5BVwrrDNzjOnSIttdLgzx9raEa8BAzaH
         xvA2IzTjpiY0qX0IfvoLUESkaqkRgEpQxK3QSUh2a6tfNHh+p+x0MmVmptsNE1EJcUNc
         ECIzA63tl0VDB9VK+4XEZQwn37DTyBHNcZ/6Sx/kso3+f/kZv1qVZ1JRT4msTNi4Nx9x
         VLLmrJSjfKF9sUSGaW9T7cQI5ijdPQwFVARcXgdJLLPo3N+lI72JngwAbXkgGKDQyvos
         5Trg==
X-Gm-Message-State: AOAM5339GA6nN45rHyhtEN7y9aJ5x0PmBIT97s1ZGtATC+MKHvyIShY6
        fJ+6LeJA8fpTm5qDmCwPAhnppO1KnFN25kJAhXA=
X-Google-Smtp-Source: ABdhPJx92hqgultoYaHzyqPkakObWaKQSED0zMERe/Ug+hsfZDUXSlAOxmIck4U7rJHPhRBmXPML4aM1Rnm3orGhPBM=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr3357910pgq.203.1614859807567;
 Thu, 04 Mar 2021 04:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-4-noltari@gmail.com>
 <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com> <667E0AEF-B453-4CC7-9514-5E72BEF4B0E3@gmail.com>
In-Reply-To: <667E0AEF-B453-4CC7-9514-5E72BEF4B0E3@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 14:09:51 +0200
Message-ID: <CAHp75VdzgSyz24xtDiniM40-tjRjKipzdtFvd=Fq=-Xbvr-amw@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
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

On Thu, Mar 4, 2021 at 1:17 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 11:43, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:
> >>
> >> Add a helper for registering BCM63XX pin controllers.
> >>
> >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >
> > This SoB is in a strange place.
>
> Why?
> Can=E2=80=99t we both sign the patches?

You can, but you have to follow the rules (see chapters 11-13 in the [1]).

> > The order is wrong taking into account the From header (committer). So,
> > it's not clear who is the author, who is a co-developer, and who is
> > the committer (one person may utilize few roles).
> > Check for the rest of the series as well (basically this is the rule
> > of thumb to recheck entire code for the comment you have got at any
> > single place of it).
>
> Jonas was the original author of this patches (sent back in 2016) and I=
=E2=80=99m just continuing his work and trying to get those patches upstrea=
med.
> I don=E2=80=99t know how to do it correctly, so a little hint would be ap=
preciated.

There are two ways (depends on the amount of work you have done):
- leave him as an original author (so Author field will have his name,
not yours) and apply yours with Co-developed-by tag and SoB since you
are co-developed and committed
- other way around

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#sign-your-work-the-developer-s-certificate-of-origin

...

> >> +#include <linux/pinctrl/pinctrl.h>
> >> +#include <linux/regmap.h>
> >
> > The rule of thumb is to include only the headers that the below code
> > is direct user of.
>
> Ok, so I will move them to pinctrl-bcm63xx.c.
> I added them because they were needed for pinctrl_desc.

Ah, for that yes, you need a header.

> > The above are not used anyhow, while missed types.h and several
> > forward declarations.
>
> =E2=80=A6 so I should include linux/types.h and I don=E2=80=99t know what=
 you mean by =E2=80=9Cseveral forward declarations=E2=80=9D=E2=80=A6

Like

struct regmap;

which effectively tells the compiler that "hey, this type is defined
somewhere else".

--=20
With Best Regards,
Andy Shevchenko
