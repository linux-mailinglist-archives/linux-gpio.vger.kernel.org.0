Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5606F20758E
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388903AbgFXOVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388749AbgFXOVA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:21:00 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A236C0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:21:00 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id m9so1095684qvx.5
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VGBn1ADNKRi6CmnrcT87PSE08/xMC9Atdj5KJQ7pe1A=;
        b=FLM8duueCnajG8bhEBr7syi968C1c9y7nKMIcq0a+Fad+EZ3DMrFka4TeqrC2oaM00
         5BGk+4cPv35d0oYGtlkYD7XXcHaujpjT0xdQGyxWOksFlli/VjH9s/VUS/HSL8UKYQ3q
         zKgPSy4/TtdjpTAjFAePrMz7vBKOrGJRD+6P7ANUidpdaV2Hc/F3vxXNWiW1x7ONA/b7
         CrJScLVCKfWyJifIuThgJzgL4KUJyFZeJKv4ChQpIx9Q5cbrN2qKpyFN9oEqJvA2sU2i
         Anxf3PgCJ1J7ypPOGuSZOwEQGz4MHQ1Moo6ahWQX6G/TT3NI4fPjvlpuugSuLELdbVXl
         mzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VGBn1ADNKRi6CmnrcT87PSE08/xMC9Atdj5KJQ7pe1A=;
        b=cfW0Fav+rnnYPZnHx8QsyHep8j5jDjtqh5c6u4nxbp2iZ5EwXcZGSqUMpXC+yJ13ub
         Q8wFSwRebiuFEXJGlZZJRXAHK14G5VKxAcgcppRJTf1GFXLn+9u0PQ2sOUKBlhMTffxk
         D9OC8I1WOm2KCtTI+rkKHpvpaI3o5q31/3ObytMC4SVm4zVLeoHmDqYgj+8xaVq66Kis
         PCm9SU81dMr6qMSUJ5ozigxMOikhk0ngKRAHdVdUNsjtj10GpeNx4ZdUuDJU257gv5RJ
         yieyoqXYeRmkJTIRV15izfcYi0aM1AfRyM0L5dY/nf1kL40/ayDNTMROiDGT1PiFuRgS
         gU/Q==
X-Gm-Message-State: AOAM531IAEoZRA9hwW2rkjKVLbZ3J2OAkf19WOjRjZpXb7iTr9Sr2tfz
        eSgtuxVm0vvpgfutfHxXJpJjaFnlMX4XWkidXcRQPw==
X-Google-Smtp-Source: ABdhPJyFfxziD7oVAzEcfyEpyNC3aE12eW0sLBsZQsRxFuoxZw4V54HvIQmB1NnJ9a0sHhJeb9fs6hggZuR9jriShnM=
X-Received: by 2002:ad4:55d0:: with SMTP id bt16mr30658208qvb.76.1593008459748;
 Wed, 24 Jun 2020 07:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-10-warthog618@gmail.com>
 <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com> <20200624141912.GB7569@sol>
In-Reply-To: <20200624141912.GB7569@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:20:49 +0200
Message-ID: <CAMpxmJVsPjOhHymkd=8OsNJZDZUXpU83=m1M4+winaUE0RO2sg@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpiolib: cdev: rename priv to gcdev
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 24 cze 2020 o 16:19 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Jun 24, 2020 at 04:04:09PM +0200, Bartosz Golaszewski wrote:
> > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > Rename priv to gcdev to improve readability.
> > >
> > > The name "priv" indicates that the object is pointed to by
> > > file->private_data, not what the object is actually is.
> > > It is always used to point to a struct gpio_chardev_data so renaming
> > > it to gcdev seemed as good as anything, and certainly clearer than "p=
riv".
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > >
> >
> > Ugh now it's gcdev and gdev everywhere and it doesn't really make it
> > more readable. Maybe chardev_data or cdev_data?
> >
>
> Agreed, it isn't ideal visually, but is at least more unique than priv.
> Linus was going for short names recently (e.g. gc for gpiochip), so I was
> going for something short.
>
> And I try avoid names ending in _data or _state or similar where they
> don't really add anything.
>
> Would chardev or gchardev work for you?
>

Yes, chardev is fine. Even cdev is fine for me: gdev vs gcdev is
confusing but gdev vs cdev looks better IMO.

Bart
