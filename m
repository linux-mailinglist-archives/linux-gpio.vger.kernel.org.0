Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D451746F324
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 19:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhLISgZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 13:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhLISgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 13:36:25 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C59C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 10:32:51 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id e3so22809837edu.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 10:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ITrA8LG5Uu2KySXeqGyooYpxinj3+NqaK3J0IQKHMm8=;
        b=FcQXa4v/rr0/5AxV8sphkAbDKywPvSZthCzaThWzfFTyAIYpm6S4ZaNVgKE345sHzX
         yui+qxyhu5g+3B3XVzj7bm48NrQxM5AN0UN6Xr7eswPEu8TqqGH6De4phm3ex8vch+VK
         4N3qW0UcxNmicyfUoYFgJtlflw+IwnlHGlMG6crp9KTSrZ+PIgsf6Zjmata4zyhAOS/G
         zaUqEVd1sznHecNkCmfaw/IrvGiHIQt9QIFTrH5T12ETOvsWUlMMB8Dfio599qbT+DuG
         sMv6ECeQG9xv7MQW77NOb7xM6xsJM9gtm1yOW3/SA7f+YGniZIxczXgbmlpZxsDoQgh3
         f2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITrA8LG5Uu2KySXeqGyooYpxinj3+NqaK3J0IQKHMm8=;
        b=ZwIrThYe/Z3vyb1ttJxy1W7IkqaKBYi+fZVx2WkAjGQpZ3XzIBQfTgnOwCs4tVMxgi
         ghgQiwKAhmChHm9zdjabaMo+xBu0+JnMl8yVh56QtdJdcEoxWfOfuoE3xB9C7l19+tdv
         9UiZLAcwm5OXasnTmIx5HuHUr7mNdMoMIDFO1ZYP18TLRyTtvT6BOFQbMroxIXgrUD2Q
         Tz9LOJQkvOJKDbM3ifsjT9+A3YHEDVuggeHiYeO20NmlLFoMa9IeG3Yd956bzAmWzK2w
         PwCILgbBCBrySJEm3oy46qYEYlCwkpzo5wSaOOY0c5VWHG4jKHFf/IiBPcoTD042GkAm
         NUNw==
X-Gm-Message-State: AOAM530YRLNuGgLJhIQSu1snmk7umOH8vOiWX7b6t6ZYVm2tCXutky5V
        hG4vxl6YQAdfRUitVu8Bz/EV7Rtjmea6XIXG8PUI3g==
X-Google-Smtp-Source: ABdhPJyb7tOtNBiZPcBpDOZz1LnRioCgIUq0ERB/3KQvv2DZLc0casnHgThta0fVgX3dUjtAB1RVQHoQFadU3kFUyEM=
X-Received: by 2002:a50:e611:: with SMTP id y17mr31825129edm.270.1639074769822;
 Thu, 09 Dec 2021 10:32:49 -0800 (PST)
MIME-Version: 1.0
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
 <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
In-Reply-To: <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Dec 2021 19:32:39 +0100
Message-ID: <CAMRc=McUV3-Afhd3yipDfvcEQijqDxf3cXr9egdKAgPt0nv5RA@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 9, 2021 at 4:17 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Dec 9, 2021 at 5:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> > and hence we get redefinition errors during build as <linux/ioctl.h>,
> > included via <uapi/gpio.h>, defines them again.
> >
> > Fix this by undefining the macros between both the includes, document it
> > all in musl-compat.h as well.
>
> Is it only me who wonders why it should be fixed here?
>
> --
> With Best Regards,
> Andy Shevchenko

No, I'm wondering the same. I see these musl compat issues being
"fixed" in half the embedded linux projects. Looks to me musl
introduces these issues, doesn't it? Any reason for it? Can it be
fixed in the library?

Bart
