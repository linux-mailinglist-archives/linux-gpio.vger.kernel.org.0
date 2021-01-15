Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E962F8293
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 18:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbhAORcV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 15 Jan 2021 12:32:21 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:37015 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAORcV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 12:32:21 -0500
Received: by mail-ot1-f43.google.com with SMTP id o11so9270003ote.4
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 09:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1KIWWC3aVuEV/Qa/g8YlCZhQBQv/QC2H1jHUD7cBkhw=;
        b=Dnb807jj479+19PY1EVQ+LouTSe2RX2Aru7iZ5bZYt2etjWhOKg4GnL/5UdjTPY3Ru
         l9z2IP7X/avveQXGn5RIPnuPSNym88V5nTUIRwInb3QCK2PNeAL2fB5NLbE5RbDjvZEz
         rQojaafGpVH4Fr7lATK7VNWQKWkwd+X+ds2Xpp/e3Ek7l7UnEI8XJbK4nV4TjHES0I0p
         5hSCIfb+H/d9pJDQBEjSRVxiUwA6WB0qHz1oUV1SM3D2w+vzqmBDibe8oBRzwM27/jZB
         cLRXTDbyZOQV0yv6cPYk7VPrc9M9uzgPpcUz+7IiHHw6tdGS3nCBOOs92bJ/KEITVkQw
         a/2A==
X-Gm-Message-State: AOAM532XrRwjfoZyBSveMlIlS/orxmZnLFhqGXLdWxaGNlq+DkEVBkSC
        P1o9onic4qv86377w0CyMy3rgINkaHuw+s3C8Tg=
X-Google-Smtp-Source: ABdhPJzuawCA4NeP2wKZjZSrNb+ETGaeSMZ/72wlC4yEqWJDtw8niG5HP0fJvI8AJcfUqIynQp1B/849qHs0NLdmKG4=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr9049427otc.145.1610731900623;
 Fri, 15 Jan 2021 09:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it> <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
 <860764e8df53481bb43c79560b859979@asem.it> <CAHp75Vdy4c4j2k8LWL_5s3KvGXPL2Zystfqb1+vcpBJzdmuNnw@mail.gmail.com>
 <CAMpxmJVEEPU44=sHUZSPtS9-zM-De=JppUkhDVLne3sCmGc70A@mail.gmail.com> <CAHp75Vd017YY8HU-Ai7jnQEJ4PEgiU4VXn-jhLBKwERmsG_5MA@mail.gmail.com>
In-Reply-To: <CAHp75Vd017YY8HU-Ai7jnQEJ4PEgiU4VXn-jhLBKwERmsG_5MA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Jan 2021 18:31:29 +0100
Message-ID: <CAMuHMdWJeYhGEA9dLfG9uVY9Byhy+KUfmTCnCaE++OzgJyTneg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 5:48 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Friday, January 15, 2021, Bartosz Golaszewski <bgolaszewski@baylibre.com> wrote:
>> On Fri, Jan 8, 2021 at 4:04 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>> > On Fri, Jan 8, 2021 at 4:39 PM Flavio Suligoi <f.suligoi@asem.it> wrote:
>> >
>> > ...
>> >
>> > > > > For example, something like the following:
>> > > > >
>> > > > > # gpiofind button_1
>> > > > > gpiochip0 20
>> > > > > gpiochip0 22 (duplicate)
>> > > >
>> > > > This cannot happen, as the duplicate is on the same gpiochip.
>> > >
>> > > Just a question:  I think that a duplicate name can be present
>> > > both in the same gpiochip
>> >
>> > No. This is against common sense. Can you have the same pin numbers on one chip?
>> >
>>
>> You're correct logically but technically this definitely can happen.
>> As the DT examples from qualcomm show: you can have multiple pins
>> being called "nc" for "not connected". I'm still not sure what
>> assumptions user-space can make in this case. Should we have a list of
>> unsupported or illegal names to look up? Sounds sketchy.
>>
>
> NC or “” or something like that should be done solely by framework (or at least be reserved by framework), otherwise it makes no sense to me at all.

To be ignored due to gpio_chip.valid_mask?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
