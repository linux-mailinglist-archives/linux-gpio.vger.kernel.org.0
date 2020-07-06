Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C6B2160BE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 23:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgGFVBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 17:01:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43081 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGFVBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 17:01:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id 95so22093565otw.10
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 14:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VVcSo3/EdCdhz080IZWjFQy/2TXYFP8sIMKl1sxMEV4=;
        b=I+MT3OIXZ+4S+uXB/JfDSzwf4WFYupKwWEOM0JzOj1eEE9feESeFL40LfOvLIlhCMo
         XyCj1yQcci79QV/Wztu4Werq3+jAJl4Sym/wO9uomHJTGqNPMRU59OxjUR9txyVYYL0R
         eyagxrMHqejNile9fezJ+vvUkvhvKoaMOgOc3faOzTPfHG5tiNuDew4bbQYggjcr2QFm
         lObiR9Qe4VEZsA0DfdaOy+4NUMJWCv9HSwgttL+rH7zUu+Y5vZ1Jb1lOtnZnjFhQQYKJ
         avIkbGwibfT579/qIPSndSUyM2vKjPHzNROxNB9PS63kf2cRCdxEhl7BV825aM1qRCos
         jeRQ==
X-Gm-Message-State: AOAM5335ZVxvfY8OUrnTrK4M/9BI/zTr7WDB5qT54e+7mA0mp8U/KJ7A
        9FUzZ3Z/1i6GPkS9pGJVWg5zphPS/dnPO7pg/PY=
X-Google-Smtp-Source: ABdhPJw/MafV5w2hAAUNaJf3ablZa3UlpDuvFLqhbJMojcoUrA6g4vWFZ+BRmVKGyIchBn9Vp2Naev0N1V4PBn4ew4A=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr10404643otl.145.1594069259754;
 Mon, 06 Jul 2020 14:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
In-Reply-To: <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jul 2020 23:00:48 +0200
Message-ID: <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
Subject: Re: [RFC] GPIO User I/O
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rodolfo Giometti <giometti@enneenne.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 6, 2020 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jul 6, 2020 at 5:33 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> > > With Geert's GPIO aggregator userspace and device tree can conjure
> > > special per-usecase gpio chips as pointed out by Drew: this is
> > > very useful when you want some kernel-managed yet
> > > usecase-specific GPIO lines in a special "container" chip.
> > > To me this is the best of two worlds. (Kernelspace and userspace.)
> >
> > Maybe this is the "best of two worlds" as you say but the problem is that board
> > manufactures need a way to well-define how a GPIO line must be used for within
> > the device-tree and without the need of patches! In this point of view neither
> > the "driver_override" way nor adding a compatible value to
> > gpio_aggregator_dt_ids[] can help (this last solution requires a patch for each
> > board!). That's why at the moment they prefer not specify these GPIO lines at
> > all or (improperly) use the gpio-leds and gpio-uinput interfaces to keep it
> > simple...
>
> I think the idea is to add a very generic DT compatible to the
> gpio_aggregator_dt_ids[]. That way, any DT can use the aggregator
> to create a new chip with named lines etc.
>
> But Geert can speak of that.

The idea is to describe the real device in DT, and add it's compatible value
to gpio_aggregator_dt_ids[], or enable support for it dynamically using
driver_override.
The former indeed requires modifying the driver.
Note that if you ever want to write a pure kernelspace driver, you do need
a proper compatible value anyway.

I do agree that it's annoying to have "gpio-leds", but not "gpio-motors"
or "gpio-relays".  However, you can always propose bindings for the
latter, and, when they have been accepted, add those compatible
values to upstream gpio_aggregator_dt_ids[].

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
