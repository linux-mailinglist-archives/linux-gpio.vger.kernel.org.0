Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21943245789
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Aug 2020 14:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgHPMNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 08:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgHPMNo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 08:13:44 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B3BC061385
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 05:13:43 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id j187so12541058qke.11
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8xy2D18ViHXHHnG8eTL6cZ/YMislWq53P97uqX34Nk=;
        b=BzmsGUEvcpl+VKaOZXMkoqhFaZzJqQRLyTWupIldkAv5pyNXf7IprjB5vmdiKr8pl5
         wGunRF+MjDc5HfeICdhnYMUxRb2eIdfgI8ooX6e6DQAHSfE+CHUC2NheffguAXHA3V9I
         S2XAyY9bDu80v+awSkkNpgZawCAUMPx/WKlvC015LkLneT/Qe+9J2TOC8GcZmX9VI3Gs
         x88PlEXeslxPcMBbVNA4AywqAeOGIwblZWlUWl3mDv9YorfMe36NwDDsAJNGSjhzBkRs
         MdGxoQiZD6wbYqjtW5qBgxWarFXGA6cgPgSm3eU2LbsccY+SGFUG0r9RQn5zwyS77HjD
         NaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8xy2D18ViHXHHnG8eTL6cZ/YMislWq53P97uqX34Nk=;
        b=hr5TMj9BCWGIPpXn6rrKPIe7HrljVjOjRWEXkWEO+1xx5pn7Hnt5WzsNOs/Ec01Pyz
         REtstWdHVgV83f//mgbm2TeJhHCWZm8hdRkIYjlFfJ97NHouSP1SAMuBnlpJl7GXVJYv
         aB9wx3tuGz4YGSmLzNaGc9/noDFKrolx1mXFwxdLYgv9lwcmt0yjKBQFOYxJ9X0exOTC
         Hu/+r2jT7/4Eg3L5GgrftnHvypujw9I8j4Wx0+8UVTWpYL/JHRb+RJkQ10m5xTtbWykX
         s4WjSpoGHeNnsJ1p4yN7kuo+0F+anoIV6l3Gc3SulUwoDntom01iMWTvdSPM16TM+w1U
         vyaQ==
X-Gm-Message-State: AOAM531aQTf+PLS8z22HXy3Xn0JBEavl6FTU4+PUYORQwUQT/JsrTjm4
        b/Hc0/trDgCxoAjECwAvEamTh4p7dB0/aMLgfkDzfw==
X-Google-Smtp-Source: ABdhPJx2NWU3wfyK+WZMHR2x6gx8y1fXV28JxK5VMRAmqTiDX20cvzqhkR5qD6xFrVe7kAz9rRT0Xb2tswohITBhBxU=
X-Received: by 2002:a37:9d97:: with SMTP id g145mr8202450qke.263.1597580021370;
 Sun, 16 Aug 2020 05:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200814030257.135463-1-warthog618@gmail.com> <20200814030257.135463-8-warthog618@gmail.com>
 <CAMpxmJXdGUnnomfWNRmpi979jLPMj17JuA=0K2Nq-oVS_-oQ3A@mail.gmail.com>
 <20200815065309.GA13905@sol> <CAMpxmJVMJYJ71z59Mu-mCTQPNqV9N9sXJXNBjYazGo0tmXthfg@mail.gmail.com>
 <20200815132132.GA26885@sol>
In-Reply-To: <20200815132132.GA26885@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 16 Aug 2020 14:13:30 +0200
Message-ID: <CAMpxmJVz=ZYR+PEei4C+xjChkRsCsp7K=L5=GgMt2K4Vv3vBZQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 15, 2020 at 3:21 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sat, Aug 15, 2020 at 09:21:22AM +0200, Bartosz Golaszewski wrote:
> > On Sat, Aug 15, 2020 at 8:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Fri, Aug 14, 2020 at 09:31:29PM +0200, Bartosz Golaszewski wrote:
> > > > On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> > > > > returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> > > > >
> > > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > > ---
> > > >
> > > > Hi Kent,
> > > >
> > > > not many comments here, just a couple minor details below.
> > > >
> > >
> > > [snip]
> > >
> > > > > +
> > > > > +/**
> > > > > + * struct line - contains the state of a userspace line request
> > > > > + * @gdev: the GPIO device the line request pertains to
> > > > > + * @label: consumer label used to tag descriptors
> > > > > + * @num_descs: the number of descriptors held in the descs array
> > > > > + * @descs: the GPIO descriptors held by this line request, with @num_descs
> > > > > + * elements.
> > > > > + */
> > > > > +struct line {
> > > >
> > > > How about line_request, line_request_data or line_req_ctx? Something
> > > > more intuitive than struct line that doesn't even refer to a single
> > > > line. Same for relevant functions below.
> > > >
> > >
> > > As I've mentioned previously, I'm not a fan of names that include _data,
> > > _ctx, _state, or similar that don't really add anything.
> > >
> >
> > I certainly disagree with you on this. I think it's useful to discern
> > the object itself from data associated with it. Let's consider struct
> > irq_data and let's imagine it would be called struct irq instead. The
> > latter would be misleading - as this struct contains a lot additional
> > fields that form the context for the irq but aren't logically part of
> > the "irq object". And then you have irq_common_data which is even more
> > disconnected from the irq. This also would make using the name "irq"
> > for the variables containing the global irq number confusing.
> >
> > I think the same happens here: we may want to use the name "line" for
> > local variables and then having "struct line_data" (or similar) would
> > make it easier to read.
> >
>
> My counter example to both points is "struct file *file".
>

But struct file is always associated with a single file descriptor,
it's not the case for struct line. I would be fine with this name if
it was an object representing a single line like in libgpiod's
gpiod_line.

> > I'll listen to other's suggestions/voices but personally I think that
> > _ctx, _data etc. suffixes actually make sense.
> >
> > > I did consider line_request, but that was too close to the
> > > gpio_v2_line_request in gpio.d, not just the struct but also the
> > > resulting local variables, particularly in line_create() where they
> > > co-exist.
> > >
> > > Given the ioctl names, GPIO_V2_GET_LINE_IOCTL and
> > > GPIO_V2_LINE_GET/SET_xxx, that all create or operate on this struct, and
> > > that this is within the scope of gpiolib-cdev, the name 'line' seemed the
> > > best fit.
> > >
> >
> > And that's why line_data or line_request_data do make sense IMO.
> >
> > > And how does it not refer to a single line - what are the descs??
> > >
> >
> > I meant the fact that it can refer to multiple lines while being
> > called "struct line". I do find this misleading.
> >
>
> And struct line_data isn't?

struct line sounds as if it represented a single line, struct
line_data is more ambiguous and can be understood both ways IMO.

Bart
