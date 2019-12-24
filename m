Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7944612A12B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfLXML7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:11:59 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:33249 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfLXML6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:11:58 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so18983298ioh.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RO+QoJTwJvstR4vxoRapKAeNA3k9sx2u+8ySGBZQxoY=;
        b=LQExxefK/OVgLrEUxkZNiO+irKJnfHoaEhw0z8H9ZlZ/OezxnI66InN9NeG3m7khTf
         zn+QOAEzZ2hs3WN4uySVVQp+Dcgf3wxs20xosS/3PNHGcRestxtQKXCPkzXpis/ll7xI
         Krq1vb3WSx0S6A//4iC98x1WoEbeZZ9e2LZeiI53YZA8XvqervWU57O4SbMdctpczrvx
         5nerCH8cpApHjmV5w+bjRyeZrkkN4a4JwmmDUzk59TcX4EHFplensGsg6diJObZa8t7z
         +Q1VmFzasSdQzzmJkIyctydC8tXQz49rCdJj53BTB93gv44abx0h+w+oO03wzSVKDzp4
         T2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RO+QoJTwJvstR4vxoRapKAeNA3k9sx2u+8ySGBZQxoY=;
        b=m5edDhl1H8UaRfPpCmVKYxT4blDDqr/z+a2IkCrbHw8MWc0V9aNr2Fhh21zxns1P+W
         a9POzuyUAU0rPUqVM6Y7SIOfByW8Mn7VAWRsNyR+lEfqtu19zPjFCf7+p/MKTPgsma9A
         ZON32TrlPN2OeieoqBmjRaQVvyqF4UqPxQVeiKStRWNU+k/JgH/DfRyFtDQ9ivRpz2n8
         TdPoJJXP4Na7luSk6ukLf6PlqR4vypxCsi/fISmBTEi/Vny88pKgT2xqf0qUH2f45IW4
         qOeBRp0RA2sAd7hluVTx8zNBP/QLZO6ntZiX8NHRNdcVY+QVPvR76YRfcGRJxs/k3tV5
         JNug==
X-Gm-Message-State: APjAAAWJUs/haVgM1+GCcm0ww6gKg6xHkxBZaHEgCpQTR1jMUHETg0Uu
        yoDQ9M0X7YNn8U/1wKDDYrpcL134Ojpefoi3myB0UA==
X-Google-Smtp-Source: APXvYqyRUIlQlvRTkEbv4XWYLqu+eBhc7er4wiK6jXNG3uZKapzufZ6N8VYu3U/ZmPEvkjbtbwW2Mi7YhGnSzCDIEfQ=
X-Received: by 2002:a6b:fc0c:: with SMTP id r12mr22548960ioh.189.1577189518168;
 Tue, 24 Dec 2019 04:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20191218142449.10957-1-brgl@bgdev.pl> <20191218142449.10957-4-brgl@bgdev.pl>
 <20191219133502.GA12028@firefly> <CAMpxmJVXgx-zduPT4pAFJw3QFFCb=7f3aXB-rhd2uXuKYefTSg@mail.gmail.com>
 <20191219140518.GA12078@firefly> <CAMRc=MdKhLpBsDjcwM4JfFkUmx_VFAjfxNrMFWUBsc8ZWO49Ow@mail.gmail.com>
 <20191219143631.GA12100@firefly> <CAMRc=McXP7g=XCYZiOhmXR_WLvYgT2aJ76E=S-uq5NMzjj_6kw@mail.gmail.com>
In-Reply-To: <CAMRc=McXP7g=XCYZiOhmXR_WLvYgT2aJ76E=S-uq5NMzjj_6kw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Dec 2019 13:11:47 +0100
Message-ID: <CAMRc=McZ6iz4cZUBEBXMBxY5fJACKZmPcO9Mba0BjxW2ETPkKA@mail.gmail.com>
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

czw., 19 gru 2019 o 17:19 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> czw., 19 gru 2019 o 15:36 Kent Gibson <warthog618@gmail.com> napisa=C5=82=
(a):
> >
> > > > >
> > > > > I'm not sure I understand. We can't have two event fd's for the s=
ame
> > > > > line. Or are you thinking about setting up a second line, generat=
ing
> > > > > events on it and consuming them so that we can rely on the timing=
 to
> > > > > make sure the events were registered for the first one too?
> > > > >
> > > >
> > > > I was thinking of two event fds on the one line, and you are
> > > > correct, there can only be one, so that wont work.
> > > > Wrt using two lines, I'm not sure ordering can be guaranteed as you
> > > > end up with two separate debugfs writes...
> > > >
> > >
> > > Yeah I gave it a spin and it turns out it's not reliable - some event=
s
> > > still get dropped albeit less than without any syncing. The usleep()
> > > calls are still better than this. Any other ideas? I agree this is no=
t
> > > optimal, but couldn't come up with anything else.
> > >
> >
> > The two options I can think of are getting the debugfs write
> > to block until the simulated interrupt has been serviced, or adding a
> > multi-line set to the mockup so the two lines can be set simultaneously=
.
> > I'm not sure the first is possible.
> > And the second wont help if it results in two interrupts unless the
> > order the interrupts are serviced is guaranteed.
> > Either way it seems like a whole lot of work just to remove the sleeps,
> > so the sleeps seem like a reasonable workaround :(.
> >
>
> Now when I looked at gpio-mockup again I'm under the impression that
> the interrupt should be fired from the set() callback, not from the
> debugfs write callback. But this is a minor detail and it won't help
> here.
>
> Anyway, I'm really not sure how to do it any differently. We can also
> be less strict in user-space - we can schedule, let's say, 16 events
> without sleeps and not really verify the number of read events - just
> check if it's bigger than 1 and that what we read are actual events
> (valid event_type).
>
> Bart

If there are no other issues, I'll apply this series as is (with some
comments explaining why we do this). We can improve the tests later
once we have something better in place in the kernel. For now - they
are pretty stable, I've been running them a lot and never saw an issue
with missed events.

Bart
