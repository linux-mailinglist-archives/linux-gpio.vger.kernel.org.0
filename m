Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422BE2ABEAF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgKIO3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 09:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgKIO3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 09:29:35 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08DDC0613CF;
        Mon,  9 Nov 2020 06:29:34 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id f38so7305272pgm.2;
        Mon, 09 Nov 2020 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=omX9+EeJ0qhLTi+kUhz0Bp/5ZreuL86fDrkgxVovth0=;
        b=MsBJzihps6zADb78PiQDjYZt1v1fYXXLvWzhkuEbwvv86Jxp40cAfW/ueRQqH8p9HA
         AO18NW0sbd+7ic9zB+JhYrI9LZ5Q88iG3tAtFqD5ZkJH8+rbIfK/sfwMY0clQ3yaD509
         sEY0pgmjRRClBLjXYhMexsdXNzsvgnvLBWEX256bQaX+rw0PqT6gl27Os3pVHSWrWVu4
         EaMMYPXYBZb/RKZ7wMOdeZ8xGXlnlYS54Wif3mSmJHXEPSUXQzq8GrV+u/UvVaNcsw/b
         t3gr5qx5ziUN+/jXOzbGzgfPSCgAQEVF/c1rVoA9TVtrqip7czdYmkXBQwky2PmcAIjC
         FQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=omX9+EeJ0qhLTi+kUhz0Bp/5ZreuL86fDrkgxVovth0=;
        b=kWJhUiLtI/qz4/In5pTL6pqYh/o+6gg3GhOFL1iNzpRdEYdagQWtiDixBeiZn61JSw
         viVHzdbQGD9VRmBWl94YaCpmDQ7d73tes1+3dO7uqKhXD7iofWEadB75jRykYuFDqRtu
         N6DqbafdhAWM+Ul6HGpClnleikH2yeUF1chLSillB2hMJRWlpC6Iy66H1fSrw32KkZsY
         r8N+nWtBlVeXv55Use+22NvpTD03qchq++VT6T+hmOqgXQzBbSnoc6CYGhOYoRrYaTTp
         Lvh0HpNNStJ7obtaQsdNsDqOci9SVqJ4N47GYCJ1p7JUN7R4h65sBf5YfW2XvbO6CpWN
         yA+A==
X-Gm-Message-State: AOAM530Ncellf4/v06+5+626jEWVYnWuu7sbnoUNCagmZwuD+Fw5BsLO
        o5j0h4+HXZR58qbE8yIRN0JqUR10R5x0Y8QtE4GGSE+O4mE=
X-Google-Smtp-Source: ABdhPJzZ42EpAH5I/T7a9F93sS4vDsMyrazBhE++GYn/cLY+pBtPWEoHIhGDJT3SgR4alvP0f86gVIC+NDEJrpbxrxU=
X-Received: by 2002:aa7:942a:0:b029:164:a853:f0fc with SMTP id
 y10-20020aa7942a0000b0290164a853f0fcmr13581934pfo.40.1604932174349; Mon, 09
 Nov 2020 06:29:34 -0800 (PST)
MIME-Version: 1.0
References: <a491261f-8463-474d-a6b3-d674670c7bb7@www.fastmail.com>
In-Reply-To: <a491261f-8463-474d-a6b3-d674670c7bb7@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 16:30:23 +0200
Message-ID: <CAHp75VcBB9wGdrBKXXSnCeHRwS1uEEz9TSrnbxzZ5g+yGdXaiA@mail.gmail.com>
Subject: Re: How to handle a level-triggered interrupt that is slow to
 de-assert itself
To:     Jamie McClymont <jamie@kwiius.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 2:57 PM Jamie McClymont <jamie@kwiius.com> wrote:

Looking into the problem I think the better people to answer are ones
from the input subsystem (or closer), so I have added a few to the Cc
list.

> Background context:
>
> I'm continuing my efforts to reverse-engineer and write a driver for the =
Goodix GXFP5187 fingerprint sensor in my Huawei Matebook X Pro (the host is=
 an Intel i5-8250U).
>
> The device is connected via SPI plus a GPIO Interrupt pin, defined like s=
o in the ACPI tables:
>
>     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>         "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,) { 0x0000 }
>
> This line is held down by the device when it has a message for the host, =
and stays held down until the host finishes reading the message out over SP=
I.
>
> I'm handling this with a devm_request_threaded_irq-type handler, where th=
e irq part is just "return IRQ_WAKE_THREAD", and the threaded part does all=
 the work. My understanding is that this is a reasonable approach since I d=
on't have tight latency requirements (and the sleeping spi functions are co=
nvenient, plus I don't want to introduce any unnecessary jitter to the syst=
em) -- please correct me if I shouldn't actually be using a threaded handle=
r here.
>
> ---
>
> Here's my problem:
>
> the IRQ line actually stays held down for roughly 180us after I've finish=
ed reading out the message over SPI. That means that as soon as the handler=
 finishes, a new one starts, and it reads out corrupted data, since the sen=
sor doesn't have anything to say.
>
> This is okay in theory -- the corrupted message header can be detected by=
 its checksum, and disregarded. However, this leads to a race condition whe=
re the chip can decide it DOES have something to say to the host, WHILE the=
 host is reading out the corrupted header. At that point, the two sides de-=
sync in their ideas of what needs to be read, and everything stops working.
>
> So, I'd like some way to pause interrupt handling for 200us+, and only re=
-run the handler if the line is still held down after that time.
>
> My first approach was to add a sleep (usleep_range) at the end of the thr=
eaded handler, right before returning IRQ_HANDLED. However, it appears that=
 after the sleep finishes, the IRQ is triggered one more time -- presumably=
 it has been set as pending before/during the sleep?
>
> My new workaround is to save a ktime_get_ns timestamp at the end of the h=
andler, and check it against the current ktime at the start, returning earl=
y if not enough time has yet elapsed. This is unsatisfactory, as it is effe=
ctively a 180us busy-wait, and gets in the way of whatever the core could b=
etter be doing (presumably idling and saving power :).
>
> Is it possible to return to the first approach, but prevent that one spur=
ious interrupt from firing after the handler ends?
>
> Thanks
> -- Jamie McClymont



--=20
With Best Regards,
Andy Shevchenko
