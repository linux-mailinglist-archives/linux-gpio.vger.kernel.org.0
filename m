Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599B2216799
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 09:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgGGHlT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 03:41:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39379 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGGHlR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 03:41:17 -0400
Received: by mail-oi1-f193.google.com with SMTP id w17so33460793oie.6;
        Tue, 07 Jul 2020 00:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IIXodC36fid5gag+MQ111CpCdP4PbZRYmljP1qbGXvM=;
        b=sDH6eGL8flrB2Ao20r2LUQWjt/4EMNXvtGhJMqR1FPJcz04fSu3QW8hgRKD1IPwk6X
         25gjd8qt5dPnz3TOJQ72py/s+d9aj4tus/1/bSIdbwTeaOceF2jDlU4D68u6Ta/GMtD/
         /LVMms4Bi1IKCe84t6DMvwBIu5xPr+Tf0OSHWDh4alrCqCbJvPmFfkgIMv0qgh+tWw3j
         b2sKKcb+4D0iZx1HRN3l3fqf9sJYcJh5BTV+U9GXsd9bnpCsQQwvUCAaGSQLkJ9upIPB
         p3+QAI8CTUSk5p1A/JGAlwB5BvQa/q1L4wbQWsy6b+J/nRvXEaRLvZjCieSadU7DU6D1
         ir0Q==
X-Gm-Message-State: AOAM531hBoOzf2rV4Ts9BKlxqDvG4xhPjzmLxF12qWRj9BzyoI9vBOsh
        07X2+g6s0QSXoLp/pZ7V1HcURB/l22wO0mKWB5/8TKLY
X-Google-Smtp-Source: ABdhPJwk06FiaZ8M+s7YOJ2w2UP2irVQub+VV3QoUFDLKQTBSklTH75Ib3LfU3MWLYne9V1yrAWzocqnIjlTAUaYgfs=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr2230577oib.148.1594107676367;
 Tue, 07 Jul 2020 00:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com> <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
In-Reply-To: <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jul 2020 09:41:05 +0200
Message-ID: <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
Subject: Re: [RFC] GPIO User I/O
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rodolfo,

CC devicetree

On Tue, Jul 7, 2020 at 9:17 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
> On 06/07/2020 23:00, Geert Uytterhoeven wrote:
> > On Mon, Jul 6, 2020 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >> On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> >>>> With Geert's GPIO aggregator userspace and device tree can conjure
> >>>> special per-usecase gpio chips as pointed out by Drew: this is
> >>>> very useful when you want some kernel-managed yet
> >>>> usecase-specific GPIO lines in a special "container" chip.
> >>>> To me this is the best of two worlds. (Kernelspace and userspace.)
> >>>
> >>> Maybe this is the "best of two worlds" as you say but the problem is that board
> >>> manufactures need a way to well-define how a GPIO line must be used for within
> >>> the device-tree and without the need of patches! In this point of view neither
> >>> the "driver_override" way nor adding a compatible value to
> >>> gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
> >>> board!). That's why at the moment they prefer not specify these GPIO lines at
> >>> all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
> >>> simple...
> >>
> >> I think the idea is to add a very generic DT compatible to the
> >> gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
> >> to create a new chip with named lines etc.
> >>
> >> But Geert can speak of that.
> >
> > The idea is to describe the real device in DT, and add it's compatible value
> > to gpio_aggregator_dt_ids[], or enable support for it dynamically using
> > driver_override.
> > The former indeed requires modifying the driver.
>
> I see.
>
> > Note that if you ever want to write a pure kernelspace driver, you do need
> > a proper compatible value anyway.
>
> OK, but for our purposes we need just one compatible value.
>
> > I do agree that it's annoying to have "gpio-leds", but not "gpio-motors"
> > or "gpio-relays".  However, you can always propose bindings for the
> > latter, and, when they have been accepted, add those compatible
> > values to upstream gpio_aggregator_dt_ids[].
>
> Having gpio-uio with proper names within it as motor0, motor1, relay0, etc. as
> in my solution would be suffice. However, after these discussions, are there any
> chances my patch (with needed modifications and documentation) may be accepted? :)
>
> Thanks for your time and answers.

Let's ask the DT people...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
