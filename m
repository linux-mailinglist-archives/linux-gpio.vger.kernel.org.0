Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA53B3285DE
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 18:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhCAQ75 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 11:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbhCAQ6M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 11:58:12 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C836C061756;
        Mon,  1 Mar 2021 08:57:30 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id q20so11898288pfu.8;
        Mon, 01 Mar 2021 08:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGGKabR50vKKIaiOMZrIQ/8/zi9WOZxscxD/HgJ2FSw=;
        b=dw0XSkA3Z+NBejWmUiOq/LwQvIbHDJI3MZU6nib/cdN1f7VOU0Auq3/qylxA2WjcZj
         SJlKSju4TMMRY2mCBAlzWHtG+2ERYMggx2lYDtCIj3Hr2B5YvUbrgAm0DHEhvhUte7/N
         j+B/nY5rSwr2HBBoddiaDl3voyORKi2LZzZyXgdyUJ3XnAYWONM3ZJy3LXMJ+dRLTJ3O
         W/mHjWzuqzGChFkDBg+1VsfUwycrDozak7Zz/+3bJmjheonr+WAgboHanYiqIh1C4+yc
         iyG4BeGQBqK/ktAMswNq84CROsG/pMJtYn1pZvvNoela2bEomnxPA2EgBFgLCzSDag0S
         SbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGGKabR50vKKIaiOMZrIQ/8/zi9WOZxscxD/HgJ2FSw=;
        b=ZVUfcj5T1exhWTCvyGA4YlHQVyGvy6Qq2K+4132CjYYU5livsvWHIrCXrkVDSLWOtU
         MNGUdLyfEpGzMJ7BKyN7GN1XG3Nwa7+0WfDWKSR+ADkKPZYntsiR7U3LyC1jtXSXFNd5
         RwP1TRyq7nhawj6LCnobsK1N+tUhauGtfjk/g/3/ZY1b3E94o9CoEFBvpg37ENC7xeK1
         0F8+RM5iEZadXQzDJ4OjhcL2mlQgVP1eAZ2k6M4ghjZ3IEr2izIrS4ROl5V1J+fSPA6y
         ov0ik+FQp+7YKBwNBHke6D9tbvoQOhzo6QzaO0os5eU0r1a7hcWVQODogLwBvCKSSwe0
         1l3A==
X-Gm-Message-State: AOAM530lBuZ+mfIgSt+N3+LcR33NJQv+oK8Nm72rcIvRB35UFrpGH4C4
        wdTbk51WABMycCcMpVomv/g+VeCuiRVuwfqHD0w=
X-Google-Smtp-Source: ABdhPJyDvlGKkuDCnUm4ipNLihPj8NDR+SBnD3ZJNC8vg9fJMDtWAQvJ5J7OURUWiChGadMVkh4+1FqQRNjx9QQOcgg=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr14437498pgt.74.1614617850155;
 Mon, 01 Mar 2021 08:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20210301090519.26192-1-johan@kernel.org> <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
In-Reply-To: <CAMpxmJXfyM89vfFDQfvOU+CX5EQSp_n_UrbEYC5MP0T-0phc-Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Mar 2021 18:57:14 +0200
Message-ID: <CAHp75Vc2NN59qxQ_5W4Uz_N6Nsrz=oKCCGUhizg1BpQuNHfmVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: regression fixes
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 11:13 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Mon, Mar 1, 2021 at 10:05 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > Here's a fix for a regression in 5.12 due to the new stub-driver hack,
> > and a fix for potential list corruption due to missing locking which has
> > been there since the introduction of the character-device interface in
> > 4.6.
> >
> > Johan
> >
> > Changes in v2
> >  - drop the corresponding drv_set_drvdata() which is no longer needed
> >    after patch 1/2
> >  - add Saravanas's reviewed-by tag to patch 2/2
> >
> >
> > Johan Hovold (2):
> >   gpio: fix NULL-deref-on-deregistration regression
> >   gpio: fix gpio-device list corruption
> >
> >  drivers/gpio/gpiolib.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)

> Patches applied, thanks!

Ooops, you are fast!
Anyway, I have tested with gpio-aggregator (w/o this series it
sparkles with all possible bugs).
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
