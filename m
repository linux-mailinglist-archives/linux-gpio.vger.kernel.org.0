Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D312ADAA6
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgKJPmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730299AbgKJPmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 10:42:20 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8D2C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 07:42:19 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id x20so12517629ilj.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LEjkygcowxJkJU2dQ83ZQcj0EJMnlBFchboDd/D6yKE=;
        b=fVsWahOwahNfyPu9fPmzE13kY1EptrlrQzYEOl+JHUKxqiPpZefNxKG3sbywCy/CBx
         u6eyeuxGvzKA3KG+c2LHcp6msn2Wfdxi3q+o9SfPpeeCFRJVGLykNFxM+S6IffKV0iY1
         LooMP14zwWY17DkbaMEzNvhXVidxfqcOQX6ws9KCwP09t7VhFp4givkDTZBW30kTiuIC
         dtea96wLQgT9HsKlnttroxYYW5CP7fbZt2Ke+juPtHqXlJ8ChyKMuISy8DGBiQt7MuDA
         3BIkaK0bHhtQ1MDch0MbMwMfM70Ig0e6Qfb0kidsyoX74RnGh4sjJrHiQ2DHwaAhGTFs
         VPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LEjkygcowxJkJU2dQ83ZQcj0EJMnlBFchboDd/D6yKE=;
        b=UJEBHBS7yR5giu8+dtdhchfkqgqN6eM8qyh+zrBncHlqgQSCmvsQhUbkwIJyilfV2f
         ayB04jGOltDFyyqhmA2admj/hKIN7Vo+kr6QMydQl16e/MliCO/fVrmh9Cx2/4NRleL7
         bwci0qikRTdyJbzaBJhL+ioC/m9c5IF5abn7wHkVefIpQWGfYF4RGRWZlwwqKKuv/eur
         8ZtjngGsfNYMFG1suW7cm0o3UBWqn3uIoVCYzwLoKYPAD2aQ7gh2xg56bAkvZvikD+sf
         y+1E/a8rtjWlSyIewmxHj8rSxxZSeTIgeKs9a/yTf6Srgokyzb6nq+HCNyuxnsAdOlBZ
         uH9g==
X-Gm-Message-State: AOAM530Vhf1PV749XYahbbSwrv4cX64aSigMGaI4+5E7Tuw0MYbIzvA3
        K2NLidA7ajasHFXg33i1Sh7IGmAdHTbA4Al2kIfJSw==
X-Google-Smtp-Source: ABdhPJyd5an3++YZ4MzAsRRMBDn/shw5czZtTKd4sWCeBqnKA6QhXKfCduPtf1xbzMgvluPfvg1tNEI7Tv0RBkIzXiU=
X-Received: by 2002:a92:4442:: with SMTP id a2mr14340197ilm.220.1605022939200;
 Tue, 10 Nov 2020 07:42:19 -0800 (PST)
MIME-Version: 1.0
References: <CAMpxmJWkcg0SgcQVzE2TVjenogyfUEiZAOR_0ssR7y8a-AnZXA@mail.gmail.com>
 <20201105030913.GA11741@sol>
In-Reply-To: <20201105030913.GA11741@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Nov 2020 16:42:08 +0100
Message-ID: <CAMRc=Mdk=aQdAOYOCJ7xCKedRbM+qNPUetBNp9+hO+Krb8oBsw@mail.gmail.com>
Subject: Re: [libgpiod] libgpiod v2.0 API discussion
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

>
> I'm also wondering if line bulk can be replaced with an analog of the
> uAPI line_request.  As the line bulk now only applies to a set of lines
> on one chip it has taken another step towards the line request, and
> cases where linke bulks are accepted or returned could be replaced with
> either a line request or a set of offsets on a particular request.

I was initially reluctant to take this into account but after thinking
about it over the weekend I figured out this may be a good idea.

What I have in mind is a new object: struct gpiod_line_request. This
would be returned by any request function and be internally associated
with the file descriptor returned by the request ioctl(). It would
also reference one or more lines for which the request was completed.
Unlike a bulk it would not allow users to modify the lines it
references. All value/event operations would take this as argument.
Maybe we could even drop the whole gpiod_line_bulk struct eventually.

I think it's a good approach going forward. Thanks for the suggestion Kent!

Bartosz
