Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B610D47A0C5
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Dec 2021 15:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhLSOCf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Dec 2021 09:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhLSOCf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Dec 2021 09:02:35 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDFBC06173E
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 06:02:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z7so27602141edc.11
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Rn7MzjWfN2l13l2VUjM7MiiPLjH10XqIwfX7gmND9g=;
        b=tmT2x5VLkXrLywwrkT2gY8UM8F0jdpYos6wTPRn6wD+tiwo1AVYPrDOFzAU6hkO58h
         v9naRUU+Sl84Y69wc3kLGrbxPp6KOjEeEn9w1mhwVC0NQD2XyBp4AsmlI7JhJhB0YVHw
         dE+cg8k+fyv/6WI9m4YzbSmfpyXOv4jsmk6HwzZQJHGcgcNR1IDNL+fZeFz6wDWg0oE8
         L+Tpza73CJImHN9zDJEOTcqm/wSujBbuXrJmoGyrULUdNJo2Z13bo9TFLL09SLGcaTLS
         VffZwgQ9qEkuI5heVWE6pju4rdpkcicsaBhrh1/CHa/+grTEyKCGnanzCH++O/M+dahu
         N/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Rn7MzjWfN2l13l2VUjM7MiiPLjH10XqIwfX7gmND9g=;
        b=osLxG7rBE26KZeG5ISyoDBa2IpVIhitUb4qex7cRm5KP4eNzbCGshxKPocIEPxNs1K
         Sfn1zGYuN2besARIF2VWaesGaX2xbNGMgk9b4PFXL9Q9nK67CaqYdI2E5TVCFEey7fjc
         6ewPG5UmPhweVWjtQ6G9NX+ENGyVtIkjtMBtwDrCLJ6tSz1J1d9ReIyPcGW65CKeBdC4
         TnOA3HiSB+kMMhpfmcM6W/8EHew1VQhR4Vt6HeS08cUbmgshS+Dl214fRAJsJk/ETdff
         UI1dBcmEoJc8DfoeibExum0KVkL8ycd1oTSHFE2xIyf2K/Z9haTXoAi3LZl4yxg/6NjJ
         mvzg==
X-Gm-Message-State: AOAM531bMXUiEyRfn8FY9kha7+Kd9ksrP43UQr+vwjxPS+V7zRZW3taM
        qYLMELuKp5W6cPeM+hoS+ccK5W0VMFxUdpbV/HKgKw==
X-Google-Smtp-Source: ABdhPJxGRncr7cZAZNhqgBIxWgY7w7hv5Styt1A51kAQl7Qy1MNrtWkL1qQj7D38WlbzPbP7ue+vvBkHTPI+cJ9c5/o=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr9520277ejb.492.1639922553118;
 Sun, 19 Dec 2021 06:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20211018112201.25424-1-noralf@tronnes.org> <CACRpkdZQSB+McOGK9HZUNAr2p+FX=6ddbY=5-sQ8difh1pEqGg@mail.gmail.com>
 <1e95e757-a0e3-a1e9-8430-3accc25d0f84@tronnes.org>
In-Reply-To: <1e95e757-a0e3-a1e9-8430-3accc25d0f84@tronnes.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 19 Dec 2021 15:02:22 +0100
Message-ID: <CAMRc=Mdwn3=n7j1hPsadzSRegA23RTiWEabiJPWJs67UTYDuCw@mail.gmail.com>
Subject: Re: [PATCH] gpio: dln2: Fix interrupts when replugging the device
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 19, 2021 at 1:01 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
>
>
> Den 24.10.2021 23.09, skrev Linus Walleij:
> > On Mon, Oct 18, 2021 at 1:23 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org=
> wrote:
> >
> >> When replugging the device the following message shows up:
> >>
> >> gpio gpiochip2: (dln2): detected irqchip that is shared with multiple =
gpiochips: please fix the driver.
> >>
> >> This also has the effect that interrupts won't work.
> >> The same problem would also show up if multiple devices where plugged =
in.
> >>
> >> Fix this by allocating the irq_chip data structure per instance like o=
ther
> >> drivers do.
> >>
> >> I don't know when this problem appeared, but it is present in 5.10.
> >>
> >> Cc: <stable@vger.kernel.org> # 5.10+
> >> Cc: Daniel Baluta <daniel.baluta@gmail.com>
> >> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
>
> Ping, has this been forgotten? Can't see it in -next.
>
> Noralf.

Hi Noralf,

As of commit d1d598104336075e7475d932d200b33108399225 my email address
has changed and the relevant commit has been in mainline for a while
now. I only by accident noticed this patch now. Please use
scripts/get_maintainer.pl in the future.

Now queued, thanks!

Bart
