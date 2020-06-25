Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C20209CCD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 12:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403896AbgFYK1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 06:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403816AbgFYK0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 06:26:48 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0868C0613ED
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 03:26:46 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id z1so4189728qtn.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=99pUPKZkDICBscx6IMwhfX3GDmfJWT4VBE0tHyrRPo0=;
        b=tC8ezzWdPiPEZ6KMH8cVuWoSivcTRRfwm7e5F3qBiBL+tCorvjtizYJb7nxpY/XtM0
         gmrcnV7c4sABi/aEllK843+4hvPna2JoDibtxw1Bu9jUR813QbL6XpvPCPWBNGS4YgIq
         1pKdMwAfQA79q7UH0l50RBPSK4Aszc0OrAoXN3A9O35p3TPVKpbLhoRwFZfoIpT06CX3
         JYZWM+g5kZii662tsrx3YbU4XzQ/b8u04u0FWjuLuadC6hr9dhQAH6IuUlUfwIOigCQy
         +SiSk7K8EqU6val/jMSPrEZbxcBlmoBxv5OkDJ50CueY9DYUCE7PfpyIkporqPfLCuko
         h3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=99pUPKZkDICBscx6IMwhfX3GDmfJWT4VBE0tHyrRPo0=;
        b=X2SnrVwUMtw+jmLzQf4ysTuqpepxSeCsY33NK+8L1aDbVpHGkJND79hN7s0ablSCRc
         0rWStl5/5+SBLvr5VNjgmhFLp/qIwMkrMv6lcm1+BOwNM/AqUIFBIVLl/iuzQXPWwGX9
         f3sqF4rxix25G+POJiRQX18cfZZMQLsWw9l3cB4/6nRWL5awOyf/BjV/ZiWCM+iS5h4C
         QDoypeGTOETeaFgowEPGy6WfNs6ZHJqzLihKKkuWkeZ7BrcbnS2noPRz9s97YkX6xzRN
         wwi7TtHWXE8j18T8Cwf2eVrQYf06/kbwX8aJxzuWOeqL/JyP+inDQsMJwEGKEAbctAjn
         9UlA==
X-Gm-Message-State: AOAM532S9gqTnJ/oDAdaVMfR68bMqwKmSIKfjYKZZtgdCunKM5rTOyM3
        SVRXI2XYIszJXBonjNjBPku0v/84wxjZe+Km8oDWyF1U
X-Google-Smtp-Source: ABdhPJzuNAv4XXBovZQ0lh7s9ClIwxlsrPIqAsQOroMS/09CtHlps2eupRQ5I0k+KkH3iVCIIIqfrx0JbzEXIvjfW+0=
X-Received: by 2002:ac8:134a:: with SMTP id f10mr23676521qtj.131.1593080806009;
 Thu, 25 Jun 2020 03:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-10-warthog618@gmail.com>
 <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com>
 <20200624141912.GB7569@sol> <CAMpxmJVsPjOhHymkd=8OsNJZDZUXpU83=m1M4+winaUE0RO2sg@mail.gmail.com>
 <20200624231611.GA6751@sol>
In-Reply-To: <20200624231611.GA6751@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 25 Jun 2020 12:26:35 +0200
Message-ID: <CAMpxmJXyG7CPqymw-7d4_dJUWcZrHJG9B8AcwrWF6GPW7m+dDw@mail.gmail.com>
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

On Thu, Jun 25, 2020 at 1:16 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Jun 24, 2020 at 04:20:49PM +0200, Bartosz Golaszewski wrote:
> > =C5=9Br., 24 cze 2020 o 16:19 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Wed, Jun 24, 2020 at 04:04:09PM +0200, Bartosz Golaszewski wrote:
> > > > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > Rename priv to gcdev to improve readability.
> > > > >
> > > > > The name "priv" indicates that the object is pointed to by
> > > > > file->private_data, not what the object is actually is.
> > > > > It is always used to point to a struct gpio_chardev_data so renam=
ing
> > > > > it to gcdev seemed as good as anything, and certainly clearer tha=
n "priv".
> > > > >
> > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > >
> > > >
> > > > Ugh now it's gcdev and gdev everywhere and it doesn't really make i=
t
> > > > more readable. Maybe chardev_data or cdev_data?
> > > >
> > >
> > > Agreed, it isn't ideal visually, but is at least more unique than pri=
v.
> > > Linus was going for short names recently (e.g. gc for gpiochip), so I=
 was
> > > going for something short.
> > >
> > > And I try avoid names ending in _data or _state or similar where they
> > > don't really add anything.
> > >
> > > Would chardev or gchardev work for you?
> > >
> >
> > Yes, chardev is fine. Even cdev is fine for me: gdev vs gcdev is
> > confusing but gdev vs cdev looks better IMO.
> >
>
> OK, I was avoiding cdev to try to make the name more likely to be
> globally unique, hence the leading "g".
>
> To try to keep it short, how about attacking it from the other end and
> reducing it to gcd?
> That would also be in keeping with the naming convention I use in later
> patches, e.g. glv for gpioline_values.
> So gcd for gpio_chardev_data. Hmmm, or maybe gcdd?
>
> Why is it that naming things is always the hardest part ;-)?
>

I prefer cdev here but it's just a personal preference. If anyone has
a better idea I'm happy to switch to it.

Bart
