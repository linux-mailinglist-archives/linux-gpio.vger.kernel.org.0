Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3111A7ABF
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 14:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501916AbgDNM1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 08:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2501913AbgDNM1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 08:27:01 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B40C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 05:27:01 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w70so8679595qkb.7
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 05:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oMYbOdpo+9J1ouSM2RLjgqda5qd9JwHSLPm5KH5iBRA=;
        b=OL87gJfF0Lai5QA/wkTraFaZeOSO+QXBHPXq0YlRcK9vzbCcbJbbNygT9g3JoYpxX9
         UmzBQJJBdQFeP5Ik+CjapitA0S0n7Gyj+lqyQv7FVz0I6aIl75ayTu0PXTUkVT50oymk
         tCVguHZuWurqV7A5lm1gDhOiYLsEbWR/U7Z1fATYeLq0UDSi616BDI1FGmcybn5vJgxN
         xaQr/YKAsAWKDoO5xR3wtcK3d3oKrUPZRp2ydp2mqDCXRSEXRD6cQT90GhQvHWzqzebr
         0A/VTHHpJQSx3lnhSlYl6ugxjCZocDuLwfU6xPARV3Z9BLcrWicByovFwVB40bBq1JOm
         8trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oMYbOdpo+9J1ouSM2RLjgqda5qd9JwHSLPm5KH5iBRA=;
        b=f1iG9ymo88Fia0D+qoI3+/5VBT9L5WlG6ZKkiBU15f2BL4kP7uvfaKZWIxd7FilQp7
         NshjqA2OS1l20NAA0Hm0nmzuo0E1pyOtZVSdAB7hSPLqDBir4mntthYy2Zil9crbV3oT
         p+WWDNYv7F2afZ2ZK31oqNYe0m3j6vzU5NtNyIgSscop2wTuU+UJC/YT92Y1HRri5aPt
         d2NZraLnl5rHug4wNJhWIkmi9TaDwThBgwvFpNDVg2A01phnaW5144Vm5avlg7dlYz9N
         noFijnXR4xaz6J5xWZPk740YwUTfxuZ+moC4Ek685pFUVqdR4WL6FF0n3JksntfMQdsk
         xdXg==
X-Gm-Message-State: AGi0PuYcZCjzgX83JqAgebCGmHjCiQ2sE7xlmYB0U/YTJW6s00E5gl68
        Sjf+wG/DfcLbQ9uZrihX8INMJV5wZtDSSkaEkoD0rQ==
X-Google-Smtp-Source: APiQypKKyn+xF7HXSEHC+hxChronDvELDGTLZLon3xgVgEW+iP+8F2yjGXq99NGOy7nJFf4ORjyVpTF4K9uqCozhjpQ=
X-Received: by 2002:a05:620a:1289:: with SMTP id w9mr6020359qki.263.1586867220834;
 Tue, 14 Apr 2020 05:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200320093125.23092-1-brgl@bgdev.pl> <CACRpkdZgWUwmmuXn12DS3TsQS0yQxcweqK6HGxBm=V_2LBLBMw@mail.gmail.com>
In-Reply-To: <CACRpkdZgWUwmmuXn12DS3TsQS0yQxcweqK6HGxBm=V_2LBLBMw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 14 Apr 2020 14:26:49 +0200
Message-ID: <CAMpxmJUb09KGreHw6Bdz79rbnQE7oZnWg_5qN_FhzoS2-XccFA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't call sleeping functions with a spinlock taken
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 14 kwi 2020 o 14:00 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Fri, Mar 20, 2020 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We must not call pinctrl_gpio_can_use_line() with the gpio_lock taken
> > as it takes a mutex internally. Let's move the call before taking the
> > spinlock and store the return value.
> >
> > This isn't perfect - there's a moment between calling
> > pinctrl_gpio_can_use_line() and taking the spinlock where the situation
> > can change but it isn't a regression either: previously this part wasn'=
t
> > protected at all and it only affects the information user-space is
> > seeing.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Fixes: d2ac25798208 ("gpiolib: provide a dedicated function for setting=
 lineinfo")
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I'm sorry that I lost track of this patch :(
>
> Do we still need something like this or has it been fixed
> by some other patches?
>
> Yours,
> Linus Walleij

Nope, this is still an issue. Do you have a better idea than mine?

Bart
