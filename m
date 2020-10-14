Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E6328DBCD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgJNIkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbgJNIkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:40:02 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962B7C051111
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:40:01 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id p13so2247065edi.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1Lw6gtNiCwBeb/6UFRdEXXgFtxEPrjsUk8E2dY4vDU=;
        b=i+2NF4LqcZohJ/vZnE2Kso7qUnbUzT25JtxTHGhbZUOUm1lHXbLAUfyhew2QW0wXM0
         PemS7UkHokeoomwICIPZQD89N5omBZmWZtCAgefOGsh6Q6rAlneRIcizXXrxgve3qG2B
         lJj5kifXieM+1g0QNrc3zWMNvmjkGdOk8K+Q4QUDdB/NKvFM6rzsarVEyKe/zBGIC2O0
         dhHzJrw67arW1QTpTvCiGYjl/Kf0fOjSmvoIYmNj4EPaI3HsBN/OKP+GZtHkekhYDl2+
         HU3luGLIO3xbEBfmvd5AgoiD3MqPM9C1hwCx9f5TRgMswNZYSsqmtKuo88vxtSnMPiJ4
         FYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1Lw6gtNiCwBeb/6UFRdEXXgFtxEPrjsUk8E2dY4vDU=;
        b=p3H08lVIE/BIO7QVymffwsTWQuD8iK4UTGr7i8006rGHQVEz/7phIg8aV8D+JFRZyk
         YkTfdued6vKEu3MhGN/n3XqYe0pyXboXAMT3qwAJ5quRIPx0ZKNe4x+CH0n8Y/ibNSju
         8LEGwh1U2aWpxJyQt6zPvGtl8jk+0vDgb5TsyKWga8zmbO/eaGBl8qiS2HfQcrFzNvrt
         Uo5oN7HN+kITihYkRNdASj+HH4koXyEn63zt06Ym/lTcSNKfqMrvuo2IbbR4DyGn8aJk
         nnzM00+/lzJzZJMXqTxENZ0+DjH51q+xqm5U1UXSchbIi+ANmBvZ49TUtYuEcWds5kg/
         zyug==
X-Gm-Message-State: AOAM5309XX0P8oMTVKTjHPRr3BxZ57+eH8DTYzLU5zVB/Fs5F24alZv6
        J6mLqPWrPQEVJgZ18J1UZrpMdFSkCwjNqiiGlD2NGQ==
X-Google-Smtp-Source: ABdhPJwijwJa6oMCMAA6z++PF5r9SMkTSMOcr+V0TnpjJfyTLtJMRG8M0AuGWfUcDHdE4hcmhJza7yrHRJigF+yQta8=
X-Received: by 2002:a50:d987:: with SMTP id w7mr3988276edj.113.1602664800239;
 Wed, 14 Oct 2020 01:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201014034758.19427-1-warthog618@gmail.com> <CAMpxmJX0E+awshoBJykp2C1ZOK-oCgSDTE2xmeKKZdYW0m4q8Q@mail.gmail.com>
 <20201014083712.GA92960@sol>
In-Reply-To: <20201014083712.GA92960@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 14 Oct 2020 10:39:49 +0200
Message-ID: <CAMpxmJWXCeMcooJov2rL8Lk8u15G2njvkQ_UDg_f3365dWMTag@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] tests: improve wait_multiple coverage
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 10:37 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Oct 14, 2020 at 09:50:08AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > A couple of patches for the v2 branch that improve the coverage of the
> > > wait_multiple test case.
> > >
> > > The first creates a mismatch between the chip offsets and bulk offsets
> > > to highlight the problem with my initial implementation of
> > > gpiod_line_event_wait_bulk() for uAPI v2.
> > >
> > > The second adds a check on the event.offset field added for uAPI v2.
> > >
> > > Kent Gibson (2):
> > >   tests: create mismatch between chip and bulk offsets in wait_multiple
> > >   tests: add check of event offset to wait_multiple
> > >
> > >  tests/tests-event.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.28.0
> > >
> >
> > I suppose that, if we don't want to do the backward compatible port
> > for now, these can be ignored?
> >
>
> It wouldn't hurt to have them either way - in my book it never hurts
> to increase test coverage.
>
> Cheers,
> Kent.

Ok I thought they only apply to your v2 port but I see they'll work in
master too.

Bartosz
