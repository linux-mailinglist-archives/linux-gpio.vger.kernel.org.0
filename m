Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5814F2771E2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 15:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgIXNLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 09:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbgIXNLl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 09:11:41 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EBFC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:11:40 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gr14so4453961ejb.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d6KirD9EXogJ4rZJQXX3ptf6I4wM6ASOXJms4dQX+94=;
        b=ZhMBPNQcf28Yt2lHYT+OHZAdIx3yiMf2LJsxNli5PUxfad4XzRToF8iyR6VnLOgo1m
         P3O1k02I+SFChVRMSGQ53HKWAvpK6LOFefJfwali9DWLK5PN6U5PQRF6jD5fX1w6UsAk
         NRJ53ni8+867wAplO3jaC5YqCwrNLUnahfR3hPVozbk1WiDlGeVB2T9dKJIU7dtYyjyO
         2t1UHvaE2SIisqosVsLv94bCRiE/vWc9OIHATdrh1Rs4ePyApnYUvYcErzamiWi1Dhjl
         8TsGeI9oRCj8S5jjhnnWK8at+BvxVpfgmK0iiibm09l5nA3oI+0zwxAE8Z+ptVtFsN37
         KI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d6KirD9EXogJ4rZJQXX3ptf6I4wM6ASOXJms4dQX+94=;
        b=hBBS5vwhfK/Gbpfef67txihLvhxgM0XK4JvZRs7Q7S//kHHk4FqHTtRcIdl9/l0otJ
         pvuKx9pqfjak/PsfxIK+LWVBLCzcYdwvSgCEbTCIWbrWM3jXHSoYZIMUKbJFafQDWO9X
         MIORXkmq/33xCQxHRAvkom4GiBwyw4zsTnlFL72xTBVujLC4AvR/4qy/uO8lfPO5KgVI
         qiKikU6DAoGEuo2+T/asnYbN6mDL5g5MFtHYpGLrA1vDJxqfXcLelK7FXbwrybyIu8av
         HU2Topcgk881fGqf0YyqIwfSsFPcsiKJe6/saS17e9Qgtfg1UMff2kj+O+vpJJuMBdHn
         IhxA==
X-Gm-Message-State: AOAM531M/+KKLabz1BQphrbZqdxDBZcoYXpPkLZcizhMjEs0JgqamIcv
        wf0HeZq3QT7KJsE0eEnEi4nWFa6jvQ2+ahx733olAw==
X-Google-Smtp-Source: ABdhPJw3akn1PeO9dv8nYxrkCw9k5Pgola2iVlAs1aCOPnrNGPrIV2RxkbWRC8roXNvYBwMPJ3CHgcTZUlBPthPycRY=
X-Received: by 2002:a17:906:a198:: with SMTP id s24mr970854ejy.154.1600953099274;
 Thu, 24 Sep 2020 06:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com>
 <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
 <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com> <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
In-Reply-To: <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:11:28 +0200
Message-ID: <CAMpxmJX7yg0Y2ibEdQaDb5MseT4Kr1-uG+RLxxKO_YF1BMkqEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To:     Joel Stanley <joel@jms.id.au>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 2:59 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 16 Sep 2020 at 11:09, Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hi GPIO maintainers,
> > >
> > > On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > > > >
> > > > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > > > corresponding to the 80 status bits available in hardware. Each of these
> > > > > lines can be configured as either an input or an output.
> > > > >
> > > > > However, each of these GPIOs is actually an input *and* an output; we
> > > > > actually have 80 inputs plus 80 outputs.
> > > > >
> > > > > This change expands the maximum number of GPIOs to 160; the lower half
> > > > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > > > We fix the GPIO directions to correspond to this mapping.
> > > > >
> > > > > This also fixes a bug when setting GPIOs - we were reading from the
> > > > > input register, making it impossible to set more than one output GPIO.
> > > > >
> > > > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> > > >
> > > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > >
> > > This series is good to go in for 5.10:
> > >
> >
> > Hi Joel,
> >
> > I don't have this in my inbox. Did you copy me on this series?
>
> I did not; I am not the author of the patches as you can see.
>
> I notice that Jeremy sent them to the linux-gpio list, but you were
> not copied. Are you able to grab them from lore, or do you need him to
> resend them?
>
> Cheers,
>
> Joel

Now queued, thanks.

Bartosz
