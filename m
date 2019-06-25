Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF335510A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 16:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfFYOFO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 10:05:14 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45304 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFYOFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 10:05:14 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so12693542lfm.12
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kwBBfHuR28jPOOkgieul+kgQeA2qTi+gfGqu5Wtw3Tw=;
        b=f9t6Zm6ygaNft4VLl6GhLRKkcLSR5K0BDfX+rA9HDsNxWVtTfr/S818TPBlyXabRtc
         koFWXIryxTPGkScHCUxPJz91glR2C4U8Jl2VqPRjXpBQ01xuASQ1a1B2yISqQ859y6sB
         km7TsEZuDtfNAjwefjy2/OUWt8KwlpaOSum40jyTMgSMpporVHkxvYzREHt+hXtfRxmL
         EGSWQ3opIAYtO3JVq2RG8qD+8ljTNnREC+Njpxf1lSjQlDFqRUEUXeyg9s6RSgnfbH3R
         y7pSoExXLK3F5y4DXDpojgRD/9pN6mL5mdvYlg8CkxLKBPW8Qai12LDISlvuITdtCPhU
         n7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kwBBfHuR28jPOOkgieul+kgQeA2qTi+gfGqu5Wtw3Tw=;
        b=d3kJPkmJ0zo2eppdydmPYPFSvISK9mOsnT9lQNdZ7RMbQmQMn48LMxivU0Y4lY9ULp
         PvfUxagLLc4LPZO9AYuFYXUTgB+SlUrzlbnbArq/1eiC/h+v/2YzRADLzfO5MEb/J76h
         b8xeoSSmVOVyubKtcI57HN1GvzNzo0q3zoi7Qjks8MF1PJZfKbgM7v191DdHjFOQmTTI
         h7UxZSlqrwdhT7ei+t3/Qht1MGPfCZA5VoLzTCH9kUkAXzpMTpdMOR3ptHsDWqBm+ArV
         z8AgsLagnvt0iN37pYMpt+SqA32HaEoYk20Eeadh0zVbd87OqZqTWEWftjfcUrqFlwkX
         QYpQ==
X-Gm-Message-State: APjAAAUUxShFWnpONUt5STjI6Useo1qdOG5kqrcDzVlObweaJQwykP21
        zgopWvlQ9q/5bhQcoDe4Vsiadk9jNcB4TI9Qf8K9bQ==
X-Google-Smtp-Source: APXvYqzq8+/CVrHlSFxyMFqYJODngt0UEQO4cecaKMLvhYpsbECvwonttRmUtMlNNwWakCMlELZ2wS/oZUADAcRT/Os=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr275690lfn.165.1561471512126;
 Tue, 25 Jun 2019 07:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
 <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net> <CACRpkdaGFw9XZSW7ise5EBun8ehikNMzw4BCs9hByme=6z4KDg@mail.gmail.com>
 <0bd09e2a-5006-4587-056e-9aeb6b05d18c@metux.net> <CACRpkdaQTaKATc2piWPQ5dY3zNdNh4QXh5GkXJuLU=deEhz4Yg@mail.gmail.com>
 <64a7cfa3-9d49-f675-0822-77bf209b970f@metux.net>
In-Reply-To: <64a7cfa3-9d49-f675-0822-77bf209b970f@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 16:05:00 +0200
Message-ID: <CACRpkdZ96OjtAdOQob9ntxSMB+4psAtKLDPnTJ4nnNFxm9AyDg@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 12:50 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 18.06.19 13:42, Linus Walleij wrote:

> > GPIO_ACTIVE_LOW is there to tell which way the consumer acts.
> > If the line is counted as asserted when active low, it should be flagged
> > as GPIO_ACTIVE_LOW, in the strict sense.
>
> Right. But now some could argue: "the reset consumer contains an
> inverter, there the inverter driver shall be used" ;-)

Usually this is determined by the name and characteristic of the pin.

We don't try to model the inside of external components
on the board, the only thing we really step inside of any
other components than the main SoC.

Perhaps there may be special cases when we want to do that,
but we deal with that the day we have a real world example.

> Well, these electronic semantics can also have a some room for
> interpretation. Even if there's some explicit interverter in the
> schematics, one could count that part of the consumer and then
> declare the line low active. OTOH, one could count all low active
> lines "inverted" and demand an explicit inverter device here.
>
> IMHO, it's often a matter of perspective, which approach is better.
> It's good to have both options now.

IETF has this motto: rough consensus and running code.

As long as the semantics behave as expected it's fine.

> By the way: I'm a great fan of modelling devices semantically (not
> just electrically) correct for the whole machine (including external
> peripherals - not just the stuff on the board itself). For example in
> an embedded system w/ some gpio attached sensor, there should be a
> driver for the actual sensor (eg. IIO) instead letting userland play
> directly w/ the gpio. And if we have a line controlling some external
> device's power, there should be an explicit regulutor, etc, etc.
> (Actually, I'm pretty reluctant of handing out raw gpios to userland)

We are in violent agreement.

> > The fact that many people use this flag as a workaround doesn't mean
> > it doesn't have a valid semantic when used right.
>
> I'm still not sure whether these really are workarounds or just a
> different perspective. At least haven't had a case yet, where both
> perspectives have been equally valid.

When the component is a blackbox and the manufacturer doesn't
say what it looks like on the inside, just that this one pin is active
low, certainly use GPIO_ACTIVE_LOW. Other cases can be
debated.

Yours,
Linus Walleij
