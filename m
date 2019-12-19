Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABA31266AE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 17:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfLSQUA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 11:20:00 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:36612 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbfLSQUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 11:20:00 -0500
Received: by mail-io1-f65.google.com with SMTP id r13so6347719ioa.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x7d4TllQNgMDMPZTRJpJmOWDPekc1T35SM9lCcLfJdQ=;
        b=SCuxem4Jxz0STF3/inTNjLORR6liCKiEzIao5lCAoWanEIukjQRnfqWvt3UdERFwa4
         gIQxD0doQs8L56Er+ycUEQLMMMrJSdBq5z681aqGoooQ/vPpl3LxW5NGl/SirdFRwZLY
         2tWTZzsKYBkJoCNYYJfYV9wOyz5kJIv495o7/m+6rRx1r+RPKI0iojCfnAAvVWN648PE
         6m6ldIUqvjwtXnAwfNAfxtPWArrssB2TL2uaLZROlAE0N4WGoPO4tm1l6qJpDZuJEJPq
         05GePHvq8vEnIhslymxzuEmOqO8GvosIYxWqcyfG/ugY+rGmrS+yuZCPgnrRxsPSd9Qh
         sk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x7d4TllQNgMDMPZTRJpJmOWDPekc1T35SM9lCcLfJdQ=;
        b=MbjlUdu9DXvN3PAcuoOnAryjbI78EVUwi6sJFUV+0ADFb3Nv1nJrKfYtFHst1zTDPM
         XPw3NBQ+ANKb3YGib6+DZgw/LI2Pe4C5KMDlxcVYa2ro4xLnKcYCCj3wWwk1I+TkPGCC
         56D+jv7s+oh/sueKXRJ98uAXG2e44vcahOsOQwYmhH3fKUZc1RudYAuGmkP7GHZcdHBZ
         2GdK6CXjOby5AJMfS3Wu2wMzwbhdkmIFMJPBFDQ94ZwooCplgvqrKFM9NsFn04zVVMnw
         QPENsg3ZCqsDctG8ckuetQuaNuIP/HKXUaN4/rIJjE1Rti5Ty8R6BkziHx/9BBlgzt/s
         Q/9g==
X-Gm-Message-State: APjAAAUMNNKP5NvpOQoaV/nGuQaXKoEjDXQnnEvXhriounQUZ5G1cWsJ
        1dopFYPWfl7ySAklVGZ6xPSff0d7qL9psVA8Ut/9fm0V
X-Google-Smtp-Source: APXvYqyPBd6B2KV5t/GSBcPBsGOvvHmqItuV+Y/Q99BlKJU4kbND51rDCxtqycefrrihej3Lv9q5C5+xtakGk0cfVY8=
X-Received: by 2002:a6b:fb19:: with SMTP id h25mr6564091iog.40.1576772399642;
 Thu, 19 Dec 2019 08:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20191218142449.10957-1-brgl@bgdev.pl> <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly> <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
 <20191219140518.GA12078@firefly> <CAMRc=MdKhLpBsDjcwM4JfFkUmx_VFAjfxNrMFWUBsc8ZWO49Ow@mail.gmail.com>
 <20191219143631.GA12100@firefly>
In-Reply-To: <20191219143631.GA12100@firefly>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Dec 2019 17:19:48 +0100
Message-ID: <CAMRc=McXP7g=XCYZiOhmXR_WLvYgT2aJ76E=S-uq5NMzjj_6kw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/7] tests: event: extend test coverage for
 reading multiple line events at once
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> > > >
> > > > I'm not sure I understand. We can't have two event fd's for the sam=
e
> > > > line. Or are you thinking about setting up a second line, generatin=
g
> > > > events on it and consuming them so that we can rely on the timing t=
o
> > > > make sure the events were registered for the first one too?
> > > >
> > >
> > > I was thinking of two event fds on the one line, and you are
> > > correct, there can only be one, so that wont work.
> > > Wrt using two lines, I'm not sure ordering can be guaranteed as you
> > > end up with two separate debugfs writes...
> > >
> >
> > Yeah I gave it a spin and it turns out it's not reliable - some events
> > still get dropped albeit less than without any syncing. The usleep()
> > calls are still better than this. Any other ideas? I agree this is not
> > optimal, but couldn't come up with anything else.
> >
>
> The two options I can think of are getting the debugfs write
> to block until the simulated interrupt has been serviced, or adding a
> multi-line set to the mockup so the two lines can be set simultaneously.
> I'm not sure the first is possible.
> And the second wont help if it results in two interrupts unless the
> order the interrupts are serviced is guaranteed.
> Either way it seems like a whole lot of work just to remove the sleeps,
> so the sleeps seem like a reasonable workaround :(.
>

Now when I looked at gpio-mockup again I'm under the impression that
the interrupt should be fired from the set() callback, not from the
debugfs write callback. But this is a minor detail and it won't help
here.

Anyway, I'm really not sure how to do it any differently. We can also
be less strict in user-space - we can schedule, let's say, 16 events
without sleeps and not really verify the number of read events - just
check if it's bigger than 1 and that what we read are actual events
(valid event_type).

Bart
