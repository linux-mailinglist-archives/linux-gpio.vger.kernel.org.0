Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B1F421F1D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 08:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhJEGzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 02:55:01 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:38415 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhJEGzB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 02:55:01 -0400
Received: by mail-ua1-f49.google.com with SMTP id y3so8732578uar.5;
        Mon, 04 Oct 2021 23:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n5rvDJLT46KKVmj57QzEkEkQwVXnYVpO8DvlptVRyCA=;
        b=jWK5x5OKncZn065eh5icxcgmS3DgqPjzAeVrwZIpAj/N4g1mirSuJ2X3fm4EkhyVhX
         jfxxUi2rhaOX3YWcU3S/7Dexp5afwOmY3JDiUossOWhWTn4li9UTVY7Dnq94CUTNoiH0
         RhCfsHh78Nt72pN4BTDVd4H/Uv2YRemTZrfPgCZtPPbGnvkCkuzZycU/xgbFv9pLri6a
         2XH47lYpKHyTcqMndY0FJyXTj4GFwp+9q1Q71JPcbOK2yADmMQQQpRHv8CCOkC9RR7la
         zJYPnUXiplo+gl3+OdbgaqYL+eyH58D/8lq6nnZ/n3MDxNA38earfWNfBPo4mMwW9cSY
         SUJw==
X-Gm-Message-State: AOAM5306A68tqOW+hJjz9TkNgItIrb+/5DHJL0mWS78nxIcdStGUAEQz
        DCc2gvJo+AIRXB9A29au/jU06aEHcHCIdlNEwdo=
X-Google-Smtp-Source: ABdhPJy5k1nMkYMYkWxdc7yorDKtTzk8W9HuAKjJZVnHbBCfhiYAPghoP07JTjh7MLd8GwhUpT80oTqR0wBZYVkKy3U=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr10581513uaf.114.1633416790751;
 Mon, 04 Oct 2021 23:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <c987d0bf744150ca05bd952f5f9e5fb3244d27b0.1633350340.git.geert+renesas@glider.be>
 <20211005055050.ggimidaqis5tfxav@vireshk-i7>
In-Reply-To: <20211005055050.ggimidaqis5tfxav@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 08:52:59 +0200
Message-ID: <CAMuHMdVk6gDcHtYSM=Y8BAK=GVJuLqxTHk7zS4-MJPi0H0T=jQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: Add interrupt support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Enrico@rox.of.borg, Weigelt@rox.of.borg,
        metux IT consult <lkml@metux.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Viresh,

On Tue, Oct 5, 2021 at 7:50 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 04-10-21, 14:44, Geert Uytterhoeven wrote:
> > Currently the GPIO Aggregator does not support interrupts.  This means
> > that kernel drivers going from a GPIO to an IRQ using gpiod_to_irq(),
> > and userspace applications using line events do not work.
> >
> > Add interrupt support by providing a gpio_chip.to_irq() callback, which
> > just calls into the parent GPIO controller.
> >
> > Note that this does not implement full interrupt controller (irq_chip)
> > support, so using e.g. gpio-keys with "interrupts" instead of "gpios"
> > still does not work.
>
> Thanks for looking into this. I am not sure of the difference it makes
> with and without full irq-chip, but lemme explain the use case that we
> are concerned about with virtio.
>
> Eventually the interrupt should be visible to userspace, with
> something like libgpiod. Which can then send the information over
> virtio to the guest.

Exactly, that was what I had in mind, too.

> Will the interrupts be visible in userspace with your patch ?

Yes they are.
Before, gpiomon (test app from libgpiod) didn't work, now it does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
