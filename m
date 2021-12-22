Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8028D47D18C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 13:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240474AbhLVMOL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 07:14:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhLVMOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 07:14:11 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C374C061574;
        Wed, 22 Dec 2021 04:14:11 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id z29so7854744edl.7;
        Wed, 22 Dec 2021 04:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ZM7U5IQ5UMOQwC4FTn9PkIIrXkBUnJr18s67beYpto=;
        b=C/SejDNgTx+9c5w8WGYkkQlEtRHcutHV7xfCDgexhHOQE9nTw/nSAU7Ine0sRIk/gZ
         zpoSf0Omei5MCeA8j2ewE1TObeRcTYmE8ki7xHdE1vtN9ADQCrhtlxTXqdt1Dlfg3Ars
         Jeq1+0HMdEWwA5U+SMMgrUcj17OXk0LS0vAHmaZX7X3pdaA9KOf8VSY2RybEzZZ7j7WX
         tolsv3ANL6gsSpfxSEsnavz1XA1BsHc8Kj2ozn9b4y8R0tBGs+Q9t83U+QWh7ToCMViW
         5ps+XvdrHenIOwMx4Wu5+ftM4iXhdC5XVaTD9lQPj/ZQwPgAg1PNVZZjwSDvOu46/pg+
         uw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ZM7U5IQ5UMOQwC4FTn9PkIIrXkBUnJr18s67beYpto=;
        b=hYZjA65pbDWJcdbCZRGqqEAp5vzK5LkGDjiL08GD/akvpVZOSPFT1YwzrmEq5QH791
         TFhVFeTLjoq/r8uQwdB4B6S+iEX5szd/wAEHdciiAVOY4fG45dPbZKSmGn6T7eKdb8FP
         lDnVgIO08mvGuQNiSBORBzbN7dpqtYbJj3lxZMqgU+ikC9QrBPGitFx+lGy5GwGGp1yt
         c2Rwuv/X8HSPFQuKprVpcGhL8fx0HwYvITozGPGt0KEG7iNpx2ruKKkf6VbMdUoaGLGV
         3gcn602y1mOrf82nOvFlfsuvcw06FvfXkM9MfOlHTA4eFrZdIEofJu/pU1ZjIp4AkFF7
         f6QQ==
X-Gm-Message-State: AOAM533Y3unIXQ0On7iQGfJ4kQDDRK04GgwyberfBNy/9H2T+Slx3X9S
        cue2xsfPGjO8KH13qNx/tC3SoGafz1DMwj+C9wU=
X-Google-Smtp-Source: ABdhPJz2i6OXBEK+v9UsfreCvF6GoLrEauIHscblrBUdW8uxzbqPPEHwK3e3JAs2OrMcP2vvTjb1DHooUoE8iOqZmYA=
X-Received: by 2002:a05:6402:849:: with SMTP id b9mr1205649edz.258.1640175249667;
 Wed, 22 Dec 2021 04:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20211215204753.5956-1-zajec5@gmail.com> <20211215204753.5956-2-zajec5@gmail.com>
 <CAHp75Vcu2JLE2w8LkGO9i1kL6-stL6nXsG6Ghnk0af4amY---A@mail.gmail.com> <c17724bc-2d5a-7c70-4aea-899ff3665b73@milecki.pl>
In-Reply-To: <c17724bc-2d5a-7c70-4aea-899ff3665b73@milecki.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 14:12:11 +0200
Message-ID: <CAHp75Vd3npYTP7etoBdOL1UbXYqJZ1qhPzft+hspUmUib0bppQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 12:19 PM Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>=
 wrote:
> On 16.12.2021 20:55, Andy Shevchenko wrote:
> >> +/*
> >> + * Copyright (C) 2021 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> + */
> >
> > One line?
>
> I don't think there's a rule for that. Not in coding-style.rst as much
> as I'm aware of. checkpatch.pl also doesn't complain.

There is no rule, but common sense. Why occupy 3 LOCs instead of 1 LOC?

...

> >> +#include <linux/pinctrl/pinconf-generic.h>
> >> +#include <linux/pinctrl/pinctrl.h>
> >> +#include <linux/pinctrl/pinmux.h>
> >
> > Can you move this group...
> >
> >> +#include <linux/platform_device.h>
> >> +#include <linux/slab.h>
> >
> > ...here?
>
> Any reason for that? For most of the time I keep my includes sorted
> alphabetically. Now I checked coding-style.rst is actually seems to
> recomment "clang-format" for the same reason: sorting includes.

Yes. The reason is simple. With moving this group separately you
follow the rule of going from most generic to most particular headers
in the block.  Grouping like this will show better that this code has
tighten relations with the pin control subsystem.

...

> >> +#define TEST_PORT_BLOCK_EN_LSB                 0x00
> >> +#define TEST_PORT_BLOCK_DATA_MSB               0x04
> >> +#define TEST_PORT_BLOCK_DATA_LSB               0x08
> >> +#define  TEST_PORT_LSB_PINMUX_DATA_SHIFT       12
> >> +#define TEST_PORT_COMMAND                      0x0c
> >> +#define  TEST_PORT_CMD_LOAD_MUX_REG            0x00000021
> >
> > The prefix of all above doesn't match the module name.
>
> Those are register names as in Broadcom's documentation. I don't think
> those names can conflict with any included header defines but I can
> change it.

They may easily conflict through headers with something more generic
not related to your driver or even GPIO. The TEST_PORT_COMMAND seems
one of this kind that might potentially collide.

...

> >> +
> >
> > Here and everywhere else, please drop redundant blank line.
>
> No clear kernel rule for that.
>
> I use blank line to indicate / suggest that comment applies to more than
> just a single line that follows.

Maybe these comments are not so useful after all?

...

> >> +
> >
> > No need.
> >
> >> +module_platform_driver(bcm4908_pinctrl_driver);
>
> You have 1344 other source files with empty line above
> module_platform_driver(). coding-style.rst says to "separate functions
> with one blank line". Are we supposed to argue now whether a macro can
> be considered a functio nor not?
>
> grep -B 1 -r "module_platform_driver" drivers/* | egrep -c "\.c-$"
> 1344

Same as above, common sense and the tight relationship between two.

--=20
With Best Regards,
Andy Shevchenko
