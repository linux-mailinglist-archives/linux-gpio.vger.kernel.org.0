Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A922D78D2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 16:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391014AbgLKPHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 10:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392619AbgLKPHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 10:07:38 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076D8C061793
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 07:06:58 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id p5so9057240iln.8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 07:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u3Vl2YonkvOYDA6jRZxCIzAEsp4XqnPy49dyUCWeUhw=;
        b=MlmVpKAQ/PRmhb8d0VhYckYORWjg4Lp+Utah3HOKCVK/Tf8iYI3RtM3txt9wdcPjX7
         nPSLKapXPw+1zPRUMMeUJ6rwlf6UcuonJDv4r/gtngQ68AECiEhcdeKdqNDl9eYrFWyA
         kfP9LIWCxc6Qv+FQTKG9Fa2gaNz03PcHtXCpZMf8yzMf8FTBearTcij9pUvnMBcFEiUh
         o1S1RLvWRfLHW9IsTZtLnyLqdLyWyoIB2yJS+76hfrcn5n6O2Z3i6Xk2nVzLG8ZdfSXe
         +B6rRTvFqMWkDE5t/WAscl64k2QNaCpcdbxtVt9rWyy0Zw1i8tlw221rzLsx2DcaTpH1
         izAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u3Vl2YonkvOYDA6jRZxCIzAEsp4XqnPy49dyUCWeUhw=;
        b=fOsCzfnkNK3Q2boOUXgTLQ50C7hctnzAr2A+r0MoT+axrwcTB71tUMMCmRGVJcgkKo
         yQGPpx9G3Q6R1SVz/34Ket34sFtapPcB++KOQ2WvMiOqnKaSxMssC7bt5Uz/bG3ok6fz
         7dKZECYnQOtSLtVIo0zfagGNagjcR26f/uMgQKdMwqRApcHz247lCKvYRKJLtLM3I8YM
         9+CCFgbUKWblTBM8PDd0nEUKkOvGmu1vNn6ZEyIjLAuAxDg7lDiN61IcKdUE3brHF2xO
         fKZN229wR4TcfLc/e+WJBNFu4o8gEsr5aDXRhktokrm1V1+YO+hhvnL3N3b7ThmnNSsg
         upRg==
X-Gm-Message-State: AOAM530Pl8h/T/CE/C0ZrgTzZgb2T6VnEpOfYE0hC/nGTBC/OcZj5N3L
        nO/CR/LO0KJr4Pja7k/N56wlpNo3zHto6EHJOlLyRQ==
X-Google-Smtp-Source: ABdhPJzZbMYc8rNqtS+x5MsLSOM214YCxsldfS4ikM/3e23KhhqATYZEycu1r5eKZLj4tj7gihGY+N3OoRfPmOFx554=
X-Received: by 2002:a92:680b:: with SMTP id d11mr15715110ilc.287.1607699217420;
 Fri, 11 Dec 2020 07:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20201210132315.5785-1-brgl@bgdev.pl> <20201210135627.GH4077@smile.fi.intel.com>
 <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com>
 <20201211143129.GR4077@smile.fi.intel.com> <CAMRc=Md8p-JbyM4fQzFry7_7gHwcDy9CE0NRH_6vWPuVfj-Opg@mail.gmail.com>
 <20201211145852.GU4077@smile.fi.intel.com>
In-Reply-To: <20201211145852.GU4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Dec 2020 16:06:46 +0100
Message-ID: <CAMRc=Mf8acnAMEAfH=Z9W=fRaDj47UBg9uB0jL_ATN_1QFRqeQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for v2.0
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 3:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 11, 2020 at 03:33:41PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 11, 2020 at 3:30 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Dec 11, 2020 at 09:38:44AM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Dec 10, 2020 at 2:55 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > One side note, though. Are you already plan to support autotools-2.70?
> > > >
> > > > Isn't it already supported? 2.69 is the minimum version, 2.70 should just work.
> > >
> > > Have you read an article on LWN about changes [1]? There are a lot of
> > > incompatibilities (note between 2.69 and 2.70 _8_ years passed).
> > >
> > > [1]: https://lwn.net/Articles/839395/
> >
> > How will distros handle the incompatibilities? I don't think all
> > projects - many no longer even supported - will suddenly switch to new
> > autoconf.
>
> It's PITA for distributions. Last time I remember that nice jump from 2.13 to 2.50.
> However, 2.69 should be closer to 2.70. I believe the distributions will patch
> all broken packages one-by-one. I think there is no need to keep two autoconf
> packages together in this case, but who knows, it might be a last resort.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Ok, so responding to your question: I'll upgrade to 2.70 once it's necessary. :)

Bart
