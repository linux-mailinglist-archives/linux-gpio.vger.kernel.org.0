Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADD81D6002
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgEPJaw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726271AbgEPJau (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:30:50 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70FDC061A0C
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:30:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b6so4777622ljj.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5T9hQMIe1D/f51iIfhrDEL/PLl5vY2+2w0v+LSamN4=;
        b=m691b3txDQl92upzOLE5lEnAeh4PYLToC1WZu/Q634s005NwQPzSoRWsyERlxc985m
         5PgFGMyBLl1zI+KK35wTSO0kJMTfqCJ8A3MsMCC02ynymU8xYwE7Vr54aw0e3jJ1A9AV
         GCgjEb7pZgsXTBc1YMgWLSia2SVHDu/gRX3RziqDZpGgc7zkZetAwoOY9cK1UYuaSHsP
         MBH60IcnXnza4nQuwLMK7nOuoRn4QZdJRCE7uT8Lh+uH43AtNwNZ/A+Z4p36cd+AnnHu
         68TVjCZdzFpYZnhzmfeEpgpnqq/YrBdl8ZfdAm2pGBWybxOlNUODAAMX0FyDuCMZO8NU
         hgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5T9hQMIe1D/f51iIfhrDEL/PLl5vY2+2w0v+LSamN4=;
        b=RszS6VIK+sl0G3Kekb4Dw7y64Dm37U+VgHnu0kClE5IaTF8cy1dUh75zUpWCIzHwxB
         B5HUgSip0Qw0cSKOFxBYxKX0rjgT5trblazprYOpNNQFf2Zt+EccmLktNsLQmmLenylo
         mTQ3A7ue9LY0ZpwJ//81vAMNZEPeQq7cJuP5h4UaLeeqSTCBWedy6M0WcGuuIjvAMXFQ
         8Un52jWC4+juavkSeo9kvCPu/qX9+RdXAJ0rNuiCPYCqWXBjSOmI//0FHogTM8RNuOhl
         gg8PRvq7pu2DrL57IdDcM6JOCyGkLDooB02dg4Rwv5Psfxmnv012TmH5lBYWxloWgnf5
         XL3w==
X-Gm-Message-State: AOAM530eVYX/3YfVT/T4R7+Fc4qPtJ+LL2UrFoqPCx1jWahB7BrMavM8
        Aaxm/ymU3hHXBygIBoarnV5LzvQe1zAIzorhPNwUQg==
X-Google-Smtp-Source: ABdhPJwhNNHCnYEN5PX+Rf8+hr4dw2XtQ7VKh1pmMRbupDUV3DJpSTVJkZZmN9FsC0GxfweAWevclSfnBL/rZ0Vm6zw=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr4987823ljh.223.1589621447199;
 Sat, 16 May 2020 02:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200509141507.19531-1-brgl@bgdev.pl>
In-Reply-To: <20200509141507.19531-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:30:36 +0200
Message-ID: <CACRpkdZ2WGs=aWjwS=vk6-PDMvXMLppfBBF-8rs42F=ko3biNg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: notify user-space about line status changes
 after flags are set
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 9, 2020 at 4:15 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Since the flags can be configured in different ways depending on how the
> line is being requested - we need to call the notifier chain in different
> places separately.

Ooops.

> This comes late in the release cycle but I only recently got down to
> writing libgpiod support for this new ioctl(). When writing test cases
> I noticed this doesn't really work as expected.

This is why I am so grateful about the tests you are doing with
libgpiod! We actually find these problems quickly and not after
years. Thanks!

> This patch fixes the
> issue I identified this week. There may be more coming the following
> week though...

I will pull in your pull request once the next -rc is out as I had already
sent my first pull request, but do not hesitate to bug me about this.

Yours,
Linus Walleij
