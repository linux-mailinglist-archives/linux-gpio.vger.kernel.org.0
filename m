Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEB02A7A92
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbgKEJal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbgKEJal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:30:41 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9625AC0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:30:40 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t13so821686ljk.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZN+WfK95j3WNBJ+ol5Mhe90DeQbrUMPsZqT09PhMmI=;
        b=bRxfd+Vw6/vXM5/m25DhNTAgPuZpbq5DnZ0UWwXzOAwRVR4dm04iodsVdoKrREelkw
         mzY0XIWR0e5AGRX/vKCA7HDffWpb+FIm+wOcJ/q0gF/hv/DFXwoos5rEQOPv65YzBXCs
         rITsYIu/MOI4sDgRrVDMhcSBVQsa/132Az7qOim01iU4vgqNlEu0JVdo60xInxM5VDiZ
         ggC2h3gZj91cjp4x6mbAbXLtv+NEAhflkz2g4C7ayJI8HKtwvichxqiXUZdy9ha0/j3O
         sc5+W9r02izMS2O6oWIOB3bKlTiqtBCoZsGB/kvG+BwbRMzaAPu+oDqXhXEzQZOrmP9L
         h+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZN+WfK95j3WNBJ+ol5Mhe90DeQbrUMPsZqT09PhMmI=;
        b=Ml9zIUQrr7X54aurnisEzwy1jVB3lWumIj8Lb+B0nkh0g68jZ5YwsluLmWHYJEXwZ0
         32AcXbjOjEDmzoj3CQX5jeAN2cgIG0HAfgIrLbbe8Bp759YTEY2lVfkcTIvhqg9RUdTr
         s+gCLhedvdXpL7aJEuRExAoPXgfAXJLe9tSP6Ox8Mh+UBv3Juv927WV5yboWNsF7+muT
         Yni+jTIgdzZwkauABlExRdozf2BWGT8tyynYNxuKToH4S4+Wcu+gBCbIK2KShLO4j32Q
         +GWsFJP0AUkhCSbaEivESHaOcsv6CgnR02YIXXJbSO8dSv1Hik09Tickbg5o6jHueWq0
         lyvg==
X-Gm-Message-State: AOAM5311wy5hENaHUJQoVROAm8V7Ioe65Uql/Wvc3qmMpPPsM2iLuvDb
        HCJLW8HgYjBgALIuIgxcwbOASUiWagQR9W9E+CyUcg==
X-Google-Smtp-Source: ABdhPJzY7pGQkemBfw9MRaNTlchglAp9MYHnkUu2pulxJapClIQRpjwVlHyeV79/VLD77Psc+jAHLkHh6do6mdhiuvk=
X-Received: by 2002:a2e:8905:: with SMTP id d5mr539562lji.144.1604568639075;
 Thu, 05 Nov 2020 01:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-4-daniel@0x0f.com>
 <CAHp75Vf5iUzKp32CqBbv_5MRo8q8CyBPsBcgzKsww6BFtGJwUA@mail.gmail.com>
In-Reply-To: <CAHp75Vf5iUzKp32CqBbv_5MRo8q8CyBPsBcgzKsww6BFtGJwUA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:30:28 +0100
Message-ID: <CACRpkdZKE4TE6sN+evviB8uHU6ZZ9W4XCiPpOS6-YsDd7ZxMUg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 1:59 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 19, 2020 at 5:11 PM Daniel Palmer <daniel@0x0f.com> wrote:

> > +config GPIO_MSC313
> > +       bool "MStar MSC313 GPIO support"

> > +       default y if ARCH_MSTARV7

I think it is possible to write:

default ARCH_MSTARV7

For this.

> Why boolean?

I answered this question in some other mail but there is usually somewhat
a good reason for this but let's discuss it a bit.

The following usecase:

- You have a generic distribution such as Android

- The generic distribution does not use initramfs to support basic
  drivers (does Android? Nowadays?)

- So all modules would need to load from actual storage media.

- The storage media is an SD card.

- The SD card reader has a card detect line connected to one
  of the GPIO lines.

- Now we have catch-22 because there is no way to load the
  GPIO driver modules from the storage media because the
  driver is needed to mount the storage media.

I do not know if this "never happens" because every generic
distribution "should" be using initramfs for their drivers. But it
provides a convenient way for users to shoot themselves in the
foot and be frustrated about that their root filesystem is not
mounting.

I do not think this is limited to GPIO card detects but it is a very
immediate example.

What is the consensus here?

Yours,
Linus Walleij
