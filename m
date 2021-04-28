Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B2E36D99F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 16:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhD1Ode (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 10:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbhD1Odd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 10:33:33 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D888C061573;
        Wed, 28 Apr 2021 07:32:48 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id c17so9245704pfn.6;
        Wed, 28 Apr 2021 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/G9d3flGgZYtCISo+Gr6g6iqy1o7Dj28fy8B9gfzJQ=;
        b=fh3ryZh/KTSMVkaq2n9fBh8bHXFR/UzD/V6oQBgwAWMoYIeL8eSrU5175xdWf10pGn
         FQoallQ9+5RPYDhOW72HJPVAmQAfu20zHDg4pZ6PU65n45dLbYam9ewswAK9Ld/vRi7u
         ca6TJWLOBm9EGIv0mJMq1Bty9bc3TYud/qO6r2HeuHcP8GxI0SS7wJ4EI7bVgWgZcWiq
         5HRZ079aeOQ7lsrFMQQ6Nq4ukKBpNgWnZwcFkWEBgGA3puob3G0LiuTHVLzm4aQ4lF1T
         YTWch9ars6l37W1uVzIkMIuJ7pJaiuK/Jhz5zx7f6xKQhbZEIU4KhAJ6lkTxa+mAWsQX
         JirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/G9d3flGgZYtCISo+Gr6g6iqy1o7Dj28fy8B9gfzJQ=;
        b=S/3keE9PE19bOBH10xpocbdRjjFzqujvPd7vusW46ZgQEJmY8rlTuziryk8NZwwyMj
         QV6f5fy5wZn41kCtBCFwGLCyMfT0ZPLBc9gMtq8ALNsmiIoJF7nDN+pEGaXcr6ODQ4x7
         uok2A7X/39UCEJ5x9oOHgRP77h+H790h8SAKjeAhvZuV/XuTHRKHd725HA96elgKWDYa
         4oBBBsNOUW8tWkI9jTLfzRZRZmWd3RrEEFct9pJtq7uonkHBN6vyyvza3gTqCGrc7W1L
         l8Q8h+r2r/7cLWL1moBd0zrbIQohLGZUGd0hjUQgptWiM4TMtFphbchJ/D+ejD/BsGvR
         lGuQ==
X-Gm-Message-State: AOAM533pd08RMZ2mF7Ptyf5Oyya7mYbk9rCbWpqzggvmWgpedS0IVnkL
        NMYwb80godpSaepV70JgDKzSi0KO926fVF3odNQ=
X-Google-Smtp-Source: ABdhPJz8xG7N0ouhBBO88L7oV/bbvK64OlWn7vBdRqjFuTDgf0xjy0j1KjfdKCj6kmOvvFKSODR1zqMcQUj0xAZAFuo=
X-Received: by 2002:a62:5c6:0:b029:24d:e97f:1b1d with SMTP id
 189-20020a6205c60000b029024de97f1b1dmr28861666pff.40.1619620367811; Wed, 28
 Apr 2021 07:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
 <6f6bce2f070998db49acca2f6611727b@walle.cc> <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
 <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc> <CAHp75VcXEu2YGOoL70zueEgARCe8D+Q=CFsN62-vFK5svjJAQA@mail.gmail.com>
 <880011ffd80ae7d1a32e7a17d405b987@walle.cc>
In-Reply-To: <880011ffd80ae7d1a32e7a17d405b987@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Apr 2021 17:32:31 +0300
Message-ID: <CAHp75Vd41C8K9pNbNF6RYXUiASb1RYdUneoqqRp2f8sJCOAZog@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 28, 2021 at 5:04 PM Michael Walle <michael@walle.cc> wrote:
> Am 2021-04-28 15:44, schrieb Andy Shevchenko:
> > On Wed, Apr 28, 2021 at 2:57 PM Michael Walle <michael@walle.cc> wrote:
> >>
> >> Am 2021-04-28 13:07, schrieb Andy Shevchenko:
> >> > On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
> >> >> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
> >> >> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
> >> >> > <tsbogend@alpha.franken.de> wrote:
> >> >> >
> >> >> > 2) there is gpio-regmap generic code, that may be worth
> >> >> > considering.
> >> >>
> >> >> This driver uses memory mapped registers. While that is
> >> >> also possible with gpio-regmap, there is one drawback:
> >> >> it assumes gpiochip->can_sleep = true for now, see [1].
> >> >> Unfortunately, there is no easy way to ask the regmap
> >> >> if its mmio/fastio.
> >> >
> >> > I don't see how it is an impediment.
> >>
> >> You'd have to use the *_cansleep() variants with the gpios,
> >> which cannot be used everywhere, no?
> >
> > *can* sleep means that it requires a sleeping context to run, if your
> > controller is fine with that, there are no worries. OTOH if you want
> > to run this in an atomic context, then consumers can't do with that
> > kind of controller.
>
> Ok, then we are on the same track.
>
> > What I meant above (and you stripped it here) is
> > to add a patch that will fix that and set it based on
> > gpio_regmap_config.
>
> Yes, but ideally, it would ask the regmap. Otherwise that
> information is redundant and might mismatch, i.e. gpio_regmap_config
> tell can_sleep=false but the regmap is an I2C type for example. Also
> if a driver wants to support both regmap types, we are no step
> further.

Yeah, I agree that is a band aid, but you are free to fix it actually
on regmap level.
I don't think it will require an enormous amount of work there.

We have time :-)

-- 
With Best Regards,
Andy Shevchenko
