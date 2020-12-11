Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF2B2D82D5
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407180AbgLKXmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404957AbgLKXmm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:42:42 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B61BC061793
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:42:02 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id x23so12856787lji.7
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tvv41c0b3Uz1EGY0zuCA6ODah1hN2CWIHzGJ1BfAni8=;
        b=UHRV0itR5RNZUH1Pa/m3zLxlKl30HDKWkPKlKp8EJ19hMEfxHikpdP9HkvReviOwOn
         XApkDR648hFypMX0HHMoTrVO5qOOIHB/V6oXm1fFYS/X+cDrAlcwQ6zGROiUGOnAeLMM
         BOtTum8GOGOKquyaUNddY4/drYa3o1dnn5alj8YNOvRTeaOyEPcRoGRcYKT/uSPo5p3d
         CsEYCxoJYgICfK/6yp0p0qwafMSlOVZR1HzeGQGDGlJiss3GB6d2/f3x390z38uW8K7B
         QI+X5G1Z2l9xOXeRUgyOpHAgDyK/tYCym+f33jqb1/Tp11RKeRsoPTFb47Iqsx4ybRea
         B1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tvv41c0b3Uz1EGY0zuCA6ODah1hN2CWIHzGJ1BfAni8=;
        b=Mxofv7YNUHWsWcxSSFBOuYQxGmWsS30a4jlkaR0aA5s1JujIbyZrtzIgfz7qXGtR7N
         qLuLUDOOrQl5KOsI5y+2+py7jce8pE+boTvXjs5NbimX88DFdzOKSv8zxq2IWK4EU3w2
         RbN//ye43+9R0g7rGvZIkMQPc+CSFlGFxFw8R2cGTlERBNdhuIZ6eV2eFVuRJdzU0GHQ
         +nIFSvH1pbR3rl6XLjbLCwl073nVTQ5ipydfkK/u9j0nVFOFxbxsdTC6QqnfCuG5kMfB
         ardNBuIfPkSNIinvMyC+tFSgNz6IwoAadNp6jzlmKC/j5ZzQZbipQFNNmcWoUwQqovuw
         An+w==
X-Gm-Message-State: AOAM533F1ldT0SEVONhMdpYeuGOesc5SKDceJlqhB/0+Jlnb8orKHbHp
        7k47AruK/AK/Bq8we7SRI2tsrSbQ8Mg06TBsTIM/TA==
X-Google-Smtp-Source: ABdhPJxTy6zo52t03kgnCyXboCllsivFOvxMmT1mgI1YkWhVD45MixcDmc/7lsiqjnmxCI+VCqqh56YU3TVSwTsZn3U=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr1497765ljl.467.1607730120891;
 Fri, 11 Dec 2020 15:42:00 -0800 (PST)
MIME-Version: 1.0
References: <20201209161821.92931-1-linus.walleij@linaro.org> <X9HdfKxuUD3CZGNP@localhost>
In-Reply-To: <X9HdfKxuUD3CZGNP@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 00:41:50 +0100
Message-ID: <CACRpkda+GhBF9f7nemrhL_mbgO0YENkWQJKZG_WA3g+ibp6ZhQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: Try numbered exports if symbolic names fail
To:     Johan Hovold <johan@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 9:33 AM Johan Hovold <johan@kernel.org> wrote:

> I suggested having the driver set a flag which determines whether to use
> the line names in sysfs or not.

Aha I get it.

I need to think about if I can fix that in some good way.

> The above will trigger a bunch of nasty warnings and backtraces in the
> sysfs code (for every gpio line!), which is not something we want for
> normal operation.

At this point I feel any use of sysfs kind of deserves that but OK
it's a bit nasty.

> Having the sysfs interface for the same USB device
> depend on probe order is not very nice either.

The sysfs for a USB device is already very dependent on probe order.
Since all dynamic gpio_chips pass -1 as base they will be allocated
some global GPIO numbers at random (well, semi-random)
depending on probe order.

The user will not have any idea whatsoever what to echo into the sysfs
export file without inspecting other things such as debugfs.
That's how unstable this interface is, and one of the reasons we
are trying to get rid of the global GPIO numberspace to begin with...

Maybe that is actually an argument for any multi-instance GPIO
devices to
depends on !GPIO_SYSFS

It's a sad excuse for an ABI, the form it has was maybe acceptable
in debugfs.

> Since the USB GPIO controller do not register any names today (as
> gpiolib currently require a flat name space), there's no need to worry
> about legacy scripts depending on those either (or rather, the argument
> goes the other way since adding names now could break a functioning
> script).

OK I get how you think this should work.

> Just add a flag to suppress the renaming and we can safely start adding
> names to hotpluggable controllers (if the rest of gpiolib can handle
> non-unique names).

I'll see if I can think of something clean enough. I don't really want to
add fields into the struct gpio_chip pertaining to a legacy ABI.

Yours,
Linus Walleij
