Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4F4637BB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 16:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfGIOUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 10:20:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35355 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfGIOUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 10:20:36 -0400
Received: by mail-io1-f66.google.com with SMTP id m24so34032641ioo.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2019 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XTag6E0HRY5pOM5AumSCXipohqiU4rMp+bu0B7wd10U=;
        b=ph8QN36Brvz4GaO1lsbpAF+S34pEG3KOZn6OCqqyV1r0b+nSHJmHs7L5iApZcmsVSv
         ONf5pK1IYRZTeE67/2OjKhJHRZCppo+3gWxUhmDXn4+yhq1jps7zacdDz6o6mLUYFUHs
         CVlO6upXOLgmWTmrKu7/BwNkp9MuXH50C2ZvDFjidCtZMLY7PRpw1O61qy/t3FX+ehSd
         UPrjkFnjsJ1ogTjp/UKUxSg1d+xfwMMJIPB1w+b4TR0TkpSOXaopRjZqhSd6V07a9Nxo
         rkLl/VbzpFAsJT3woNWB36gFV7OlFYWRb3Mfody3109YK+h5qrJBFZ+2wqms8DRrsZ87
         lPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XTag6E0HRY5pOM5AumSCXipohqiU4rMp+bu0B7wd10U=;
        b=WRKFEXyyfCFjJcB3Kq3o40kY/xyLMJEo+lZxK9mNKFzv+UBLCdDFktkQ3U2EZAZSE5
         FSNubsNhlScrnn+BhE96gk9Ua76AJhouyLoJRzUgEjYfEWbeFG4O5pPIka2vKDGQwjvD
         3/v670Fzf3ApkNCMIxcTNB4KQ7LfZg8y4+XT9A79rIgiO8aMNJCNW9eNqoD3Qxn4CSsQ
         7sWzGyZd/o3tnXt6IKEX7euhhTK25vH2+li7aNbiPyhE+rAMc9PDUObvlsjAmVBsKBvH
         pGqas9tEaCdnrmSvBfeDQhHdC8ZCKwuXw9gexZYlrt3oABoyelIJOGBSlVgU1RaerAuX
         Zpgw==
X-Gm-Message-State: APjAAAW95zpYyOtItvJTNzlzY9/BUgb4rovgFSYadK0mWDsi1UXoODKT
        /tRXDL21rC1HwyNPs2HJaXSEo+eSjDo7QmqYLSnhXEvU
X-Google-Smtp-Source: APXvYqwwrSRPNbn4TV83T9qqax53T5vJC4cuF7WYiJ/hbHx2RKwKXAKBF/PLOuBrRswRmAipW/TcA3SeRyefBbzged4=
X-Received: by 2002:a5e:8b43:: with SMTP id z3mr516301iom.287.1562682035066;
 Tue, 09 Jul 2019 07:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl> <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
In-Reply-To: <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Jul 2019 16:20:24 +0200
Message-ID: <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 9 lip 2019 o 15:30 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Hi Bartosz,
>
> On Mon, Jul 8, 2019 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > If gpiolib is disabled, we use the inline stubs from gpio/consumer.h
> > instead of regular definitions of GPIO API. The stubs for 'optional'
> > variants of gpiod_get routines return NULL in this case as if the
> > relevant GPIO wasn't found. This is correct so far.
> >
> > Calling other (non-gpio_get) stubs from this header triggers a warning
> > because the GPIO descriptor couldn't have been requested. The warning
> > however is unconditional (WARN_ON(1)) and is emitted even if the passed
> > descriptor pointer is NULL.
> >
> > We don't want to force the users of 'optional' gpio_get to check the
> > returned pointer before calling e.g. gpiod_set_value() so let's only
> > WARN on non-NULL descriptors.
> >
> > Reported-by: Claus H. Stovgaard <cst@phaseone.com>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I remember I had this discussion in the past, and I made a large
> refactoring to make it possible for drivers that need gpiod_*
> calls to simply do:
>
> select GPIOLIB
>
> in Kconfig.
>
> This should solve also this problem I think.
>
> However I do realize that there may be situations where people
> simply want to make GPIO support entirely optional without
> having to e.g. create custom stubs and encapsulate things
> inside if IS_ENABLED(CONFIG_GPIOLIB).
>

In this case the board doesn't provide any GPIO controller at all so
there's simply no need to select GPIOLIB - it would only add bloat.

> I was thinking something like this in the stubs:
>
> gpiod_get[_index]() {
>     return POISON;
> }
>
> gpiod_get[_index]_optional() {
>    return NULL;
> }

This is already being done.

>
> This way all gpiod_get() and optional calls are properly
> handled and the semantic that only _optional calls
> can return NULL is preserved. (Your patch would
> violate this.)
>

Maybe I'm missing something, but I don't quite see how my patch
violates this behavior. :(

> Then other stubs can do:
>
> gpiod_set_value() {
>   WARN_ON(desc);
> }
>
> As in your patch, and all will be smooth provided the
> _optional calls have been used to obtain the desc.
>
> Yours,
> Linus Walleij

Bart
