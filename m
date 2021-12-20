Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A1547B023
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 16:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238525AbhLTPZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 10:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239477AbhLTPZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 10:25:21 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E3EC09B11F
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 07:07:17 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id z29so39460060edl.7
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 07:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHn9hs89sVWzHh2SxeZRz3wuaNP8dfg8lMqa/q5seRs=;
        b=vgF02nBpQ3V4vsHgN8izdvvyBF59f7lhmGfqzrZJ0Jf1dUy6W16GhEi14bWHcJcIij
         Mcnf2LwTaESVLdVII8c+4NKJmyVpw2xSvmbFxjMEqq6dtP05lE090lUqEBzGEa62BT60
         jKd7VTG+gYNCttakmN/gr/tayyHd7Hvl9o0+crIbPcVNWIdkfOimtePTMyaFcNTy9MWG
         Emc7EbtCEJT6X1Qa2Lr8QanC0fuMegXfnTALjdmapcEFKsUSakKBPt74Bh2Eqnieo4Oo
         S3dZflJkrXwxrASjL/lv4TRzRj8/mL45if+9b9kMA1UycCucLDkk/PacTWR2N988xiGM
         FRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHn9hs89sVWzHh2SxeZRz3wuaNP8dfg8lMqa/q5seRs=;
        b=trNjBj5gB59sb6N6ESRBR9A/k76o2qyPrFzTWlgvTLau4DzaZakEuEOBN1mpnLOEDF
         uKiuYDNIKvIc1Z6x1fOi/WQ57S7K+kTn9TQ7svHYZd6gL2sKD/rPO9DwhsaMwwfRk07K
         ucl/DRuAWuXXkPjUegTTmfJSd+MS2a0+UYTR5jmugfr5Q/3T8AeH7xCGjOus6j0HYjJN
         KzO8inFo6pnaGFSpnWKKP7rGzfOMj32adiZjAUB8/tAGwVt4CLpNHQMof8l5Zsufd4CF
         JmV/i9HykECjVmzuo4C0ePADEiVBoHH17LEtZf+PXIP11DGFJsoPQBnO5GPByzdJ6hUo
         ej0w==
X-Gm-Message-State: AOAM531ZAkNL/YTQXjeyiT1TXZPDNsCM8kptwDE0/1RyO45eoelMqSHh
        n7yQVG4LbFJIMNolVt24tWcup03bcFVyStbNlRN0iQ==
X-Google-Smtp-Source: ABdhPJzuKAvGN7YAcp5nXrRc+WQPSK8YcFJyMnHXzWvnC4eZi5W05eFHf1c18Qp4YPWMEXc61KRbWMDdYdIc53EOYAM=
X-Received: by 2002:a50:e611:: with SMTP id y17mr16496269edm.270.1640012836555;
 Mon, 20 Dec 2021 07:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20211213094036.1787950-1-daniel@0x0f.com> <20211213094036.1787950-5-daniel@0x0f.com>
 <CAMRc=Md_2b-sBnPQL-E59byYSv+Z0+d3V8JrbPqpGSMjGS+tgA@mail.gmail.com> <CAFr9PXkkp8B5Vv0eu+2gPF2S4CNaxZDwjPg+UXRgvyUkAZBFpA@mail.gmail.com>
In-Reply-To: <CAFr9PXkkp8B5Vv0eu+2gPF2S4CNaxZDwjPg+UXRgvyUkAZBFpA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Dec 2021 16:07:05 +0100
Message-ID: <CAMRc=MepS1rh13kYGvvsMmAec93fdtSHiddxqO1W4Bg+uy-dNg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: msc313: Add support for SSD201 and SSD202D
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 3:58 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Bartosz,
>
> On Mon, 20 Dec 2021 at 23:50, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Mon, Dec 13, 2021 at 10:40 AM Daniel Palmer <daniel@0x0f.com> wrote:
> > >
> > > This adds GPIO support for the SSD201 and SSD202D chips.
> > >
> > > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> >
> > I applied patches 1-3. This triggers a bunch of checkpatch errors.
> > Please address them and resend this single patch.
>
> The warnings about complex macros being wrapped in parentheses when
> the things it's complaining about are defined lists not macros?
> Not going to say I know better than checkpatch but I think the errors
> there are wrong. Putting parentheses around the lists would break the
> arrays they get put into.
>
> Cheers,
>
> Daniel

I took a closer look now and it got even worse. This is some major
obfuscation with those names being defined as macros defining partial
lists...

Anyway, it was already there when you got there so I guess we can
address it separately. Queued for v5.17.

Bart
