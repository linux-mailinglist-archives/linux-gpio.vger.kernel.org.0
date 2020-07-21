Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7312281A4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgGUOGJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgGUOGI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:06:08 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746DDC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:06:08 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so10293385ply.11
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFB5vh6AufGC6WpKoyAFXSI5EpOWIJYPxaUol5nZWAc=;
        b=gV5pJV4MkGJqTuKxhaCVAWyT0LCeSiMicMkR08WeOqX6QMxX6Z1JGOBvjI2HqVdWC1
         MXYBhUdx6amc4bHKXnqBglg64WcQecbxjEWE54hJ6hWZilsS5jhe4n1T+nQ3rxcwayIj
         f/teD19YX46LKcNs90AfxLLPrwdtAbvfB1bGud2adP5b6A6LSiaZSWONr33GODf+XmVP
         iEre/zOac4PRDSuz0b+CESSi25Xs86V1oJmEdn2/RxvXW7HtITZEEjGnu8xd/Qf/gMLg
         eUD3F1Js9RghCg4y01glYxkliLaqiKp1zZsNiHqJkH5sU7ygunAFYSW8GWa6DqgiZq7E
         z1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFB5vh6AufGC6WpKoyAFXSI5EpOWIJYPxaUol5nZWAc=;
        b=lrs4PyTmx5hTEh92QWP1JJrx+5pv9ygjsxXU4SHWND3bIC0P1lIJ3D98osTRtSSRPt
         PYAXoqsmwnUNXHmjJGkloqtbmS1DkKDCGr1AciMP3RDLkNcuzdZJqnUUVIm5iH/n5l+E
         kjhsrZSfF498SsXoBwzGmo0yepyWtXKPfdXQo+U/GGK2/NLIFFnAsC0ASmqYDUbbxWyv
         3BaTjFnL5Mb7t+j19v3duQO3ANjX1ALRsdgZIWpJ02pKYkjiM2T7WxwPwi6/ENct9T5Z
         Q67I0Fh9W77xe7hnVgcelvnYQFGSlYVStkt+pUGGy1R9pgCH0E+5iN7lVoWVcpBJeKfn
         +gFQ==
X-Gm-Message-State: AOAM5300Tg5NQ+8e2zqMNQ+Qm9nBof4x27rRH8UfIUeuCQ5hBcrgrpa9
        Zj1ZuCz+6YI5+75SkzvY7T84rIoX7TmSWVwju/o=
X-Google-Smtp-Source: ABdhPJy+ZfrbywABcQ6C4w1RNP4mdDkPBY5DjttHAxoLJr1ReztdyQ68aIw+tFkR7e5SKk9dkccNC3VUEnBMdWF9dmQ=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr5258576pjb.129.1595340367934;
 Tue, 21 Jul 2020 07:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200721131829.GA67334@black.fi.intel.com> <CACRpkdYcKKQNwk905J+mOAXY-hCx0Pku2wKikMccX6yqECT0Mw@mail.gmail.com>
In-Reply-To: <CACRpkdYcKKQNwk905J+mOAXY-hCx0Pku2wKikMccX6yqECT0Mw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 17:05:53 +0300
Message-ID: <CAHp75Ve=mck42XNbLY3d5w3saOdMkbQusLjEYuNgo5HOz=9iWw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 4:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jul 21, 2020 at 3:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > ARM/orion/gpio:
> >  -  Make use of for_each_requested_gpio()
> >
> > at91:
> >  -  Make use of for_each_requested_gpio()
> (...)
> > gpio:
> >  -  xra1403: Make use of for_each_requested_gpio()
> >  -  mvebu: Make use of for_each_requested_gpio()
>
> Are these dependent on this:
>
> > gpiolib:
> >  -  Introduce for_each_requested_gpio_in_range() macro
>
> Because if they only need for_each_requested_gpio()
> I could just merge it to the gpio tree, since I have merged
> the immutable branch for that into both trees. Then I'd
> prefer to have one pinctrl and one gpio pull request.
>
> However if they explicitly need for_each_requested_gpio_in_range()
> I say I can compromise and merge it all into pinctrl.

It uses usual practice, i.e. merge of immutable branches. The pin
control stuff is dependent on this immutable branch (first patch).

I would like to avoid rebasing and doing it differently.

P.S. It should be no-op from Git perspective.

-- 
With Best Regards,
Andy Shevchenko
