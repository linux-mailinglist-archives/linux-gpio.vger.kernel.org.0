Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDEB54FFF15
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 21:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbiDMTYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 15:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236581AbiDMTYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 15:24:51 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F644993A
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 12:22:29 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b15so3642434edn.4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MilXQC1tGawrIwnXnA0XmAAAlHvsFkKNc4Mvh7VSPxs=;
        b=09QiATtTDV+mr4QTOr2vwGHjd7VRC4YfgbltMGVapzsA8Amky0LqAA4RsmsinFLmPS
         swPbolc6MVlkhWVFdXhsbOxdk+sAGdQPnE3seed01gYAtK3clJPeh2zDiCOqkSPC29bY
         4RPvmXMe6umrwGwEV0B2vCH3kJZJBB5EYA4mUn0UXqIf0j/Naqy8YXh7QBDSivHofDGV
         rKr7xK0Ui/GkfcG4bdjrkIm9mCGaqI4Pi3kaDtx5woxHggOSRc7Sn45dIlGmTprVokTq
         cqGpnxwerhWNy5fYRv4cSwFmx92koc/ao8YBZlpdiP3y0bTtKiEGXK+cBUm1LepGazno
         9NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MilXQC1tGawrIwnXnA0XmAAAlHvsFkKNc4Mvh7VSPxs=;
        b=NVmQFaIUuUTjdn2I2N/xxUCyjhfXxfHhBUKkRtgBARpHdVgCUdyC2/+jgdjeQaZk+J
         aqHJzxRH749M3vFCjYeMNaDEuxzOzJ3HNtub7Oq73LeToE7pyBUyyZsi7bP6hJFwnQ6S
         EEkGCP7TINrc/PPLc0sUrGyGWzIHBf4sh19t3yoOgzQo3OnNZDxKyyAYONI2Go3PZaad
         645FxRhon5gshHbMo0qMxstJkXm6JNQfbT9iCqZNKJ0AzRgdQD+ZimudTdYIDzacy7pn
         wRVUhE7Dh19PYT7bt2Cet2fmlaE0HY4Wr855Oca/V+cxRrHcICA0RjuO1E+LLhDm4z0x
         7Xqw==
X-Gm-Message-State: AOAM532nXUzkprsapQNh7+QD25xo3EOSOyMt7LbZuEIEaIwgc3ph1Y3B
        ips9rS1jpdDW8sy03syAcHLZuQyuk9BP9FV/8tTDLQ==
X-Google-Smtp-Source: ABdhPJz2VpnF6zTkhx84UKodxUIcVJakqQ//DRrkWxRqYl0MzzRX8OVYvCgE7NDwXbJZGYG4FrIa0W6af6z45/zZZ3g=
X-Received: by 2002:a05:6402:22b5:b0:41d:7637:98b8 with SMTP id
 cx21-20020a05640222b500b0041d763798b8mr20229012edb.69.1649877747579; Wed, 13
 Apr 2022 12:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220413140132.286848-1-brgl@bgdev.pl> <YlcAEPYOBHk+NAD8@smile.fi.intel.com>
In-Reply-To: <YlcAEPYOBHk+NAD8@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Apr 2022 21:22:16 +0200
Message-ID: <CAMRc=MfNyzeZQ87n=Ley+7f9=4xxa_PTLcEbg7c3NXo7MLkGNw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix setting and getting multiple lines
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 13, 2022 at 6:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 13, 2022 at 04:01:32PM +0200, Bartosz Golaszewski wrote:
> > We need to take mask into account in the set/get_multiple() callbacks.
> > Use bitmap_replace() instead of bitmap_copy().
>
> Good catch!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>

I've actually spent two days tracking this. I noticed that a single
test-case in libgpiod v2 fails sometimes (about 1 in 10 runs) and
suspected some race condition but couldn't find any. Turned out it was
triggered by not masking the bits but would only be triggered if the
memory which got passed to the callbacks got written over with some
other values than zeroes.

Bart
