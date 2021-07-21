Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA543D12CE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhGUPJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 11:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhGUPJU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 11:09:20 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891A5C061575
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 08:49:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gx2so1894620pjb.5
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=inBYu5ag7c45MW8HDl2wJjLOE4iuBAdb1D4julHQh2I=;
        b=JoYCQOT90yZYg68ABYw09NUwlkvhYWyLIYIuvV9ipOkP0s5IMJzBj6Y4eWj31EP2Pj
         YURwAVn4LFLGmPWOH2vgvHU0VZkz5Hkb1A0c6Aw7gfCGoGDGIrZQWP9fMMSQkAQ42o/4
         QUKM37vhm8hVlZ+CCg3uLAfP96bmynoBUTlPjBHECASSdEB8VZ5rJC4ElQPIlJqMEaU4
         Gd9bIqliavPLOCz5lnQ0tZqQ0Z3P5gREfEUGime2KX1aUctMEb6qdkF7V2Fxe/uO6eIU
         sRgNrCWjgD3ZbHRvHMt81AtI8dNKiummeY/rh6pkE01/c5pW2sChVlYgTN4kwHUbqR25
         l3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=inBYu5ag7c45MW8HDl2wJjLOE4iuBAdb1D4julHQh2I=;
        b=A4YIrHEzfUNkAaYMkjdWVwG2yBadpFvMnk6O/4cVBlXMXkkIDfUKJOrOGhqtCMVREl
         d91T/C88tSlPKTSO6DyrfzkAdNFAtT++t1uQsyRuU4Tab/cE+uBq+U/0yE7jXgvVjWdO
         +QXNKA2FeiYYLny2D2AGVuQjDf4JqgFcuT9nqzto3WM/17XKsmf5prBbHKt6Ta/B/y5z
         Bb8nd3ZT90vXPYznzJGs3ADzLcG7cBmNcci5BHOiOuqkD0bd8bQ2z93+3t3oNa/qm9bK
         YytprtoZpDIzK1rqffdlMkcYLeWKnj/BmNvMa+SqSrwNrLrLAVh9mfz0nWD+gnD7XrZo
         qE3A==
X-Gm-Message-State: AOAM532eoOjDmKXzsH24SowSvP84W0aMnSaOBP0BwJbbN43JzEcoFk0V
        g+hQk9T2Ias00cRhLOD/cXB3kl8835aZTx6g9d8=
X-Google-Smtp-Source: ABdhPJwtxXMeUt1ckwjLUEFJWmO5RZqlQfn6S4KZp6SzUCFHTOMZdyZ2jJ5TYjZwgNfAJEpk2VN3WDR6FtGvKnLyL8E=
X-Received: by 2002:a17:90b:3647:: with SMTP id nh7mr36027626pjb.228.1626882597112;
 Wed, 21 Jul 2021 08:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
 <YOh/JC//dotfm5J9@google.com> <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
 <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com> <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
In-Reply-To: <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 21 Jul 2021 18:49:17 +0300
Message-ID: <CAHp75Vc9E3D4+roG6Hpv1TDffpy+7=kP0zwMuwy3FFghL=pTpQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Greg KH <greg@kroah.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>,
        Roland Dreier <roland@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 4:46 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Wed, Jul 14, 2021 at 12:35 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > To me described scenario sounds rather like an object lifetime possible=
 issue.
> > In any case, shouldn=E2=80=99t VFS guarantee by a reference counting th=
at
> > gpiochip_remove() wouldn=E2=80=99t be called while file descriptor is i=
n use?
> > Or am I looking from the wrong end here?
>
> What happens is that the GPIO device disappears (such as unplugging
> a USB GPIO expander) while a multithreaded userspace is hammering
> exotic ioctl() commands to the same device like crazy.
>
> Under these circumstances (which should be rare, but you know,
> developers) it could happen that an ioctl() sneak in before the
> gpio_chip pointer is NULL if I read the code right.

So, gpio_chip is NULL but gpiodev is not NULL, correct?
If so, it means that the above mentioned scenario applies to the
latter one and I understand the checks.

--=20
With Best Regards,
Andy Shevchenko
