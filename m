Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D39827CE4A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgI2M7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgI2M7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:59:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ED9C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:59:30 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k13so4465196pfg.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXm+jAcwnov5k7aB5S4eSQ/k2WcVm16Wq4L3U81to9Y=;
        b=W0uonST0G2kF65OctiCBvt4oMviKl+AjgSc/UnIb7ZQ5WebW5NxcG2xVIQxzWv1Tgr
         0w83HIA9d9yX1XylAe3yIVeg0ZNKoxW5hpYa+qx3c5IeIABjmhSrY77lEPOvjU8Adr9W
         ysuM62pcgDFGCFQfh1hV84ORhlH0gUO8bUZ15Jyc223+jfNGYm2OPj9cey4RtH+YSDlt
         HZrmWWCLzzvvYguyp6J0cyB4mC5M82X48IyDQ5UGTBeDXqafKYeqzn4sDseg8vzqzCo+
         tXJcwkrJGirLUxZHhV3XsL45QjR3WctCJqKo2cHR7mxcweUIccSBOXv3mrsS8aHm6kGa
         6Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXm+jAcwnov5k7aB5S4eSQ/k2WcVm16Wq4L3U81to9Y=;
        b=QASmWl8hJin3blK9ahDLM/RCnvUcPSEOH7sHs/YDQoq85+ph0rqwR3ZVVECfUbV5Yd
         nZHP0ITPIS5ExV3s3/TZXoSW7dwKPdurdFkrfY/eol72VOdWjHMxhJlr6S73kGI6zVRU
         OZZSqNByzBm35MzHelQaPct9SL8bQNE25AgojcaAdfVvzuX/EeSj7ZlhPehafMY7qfI4
         kK837FjRpUUlr3QFnVMalreV1fcQ/Qn5MFAudabCFS9Zl/a3HgvCMzv1EzaAh+KiSS8f
         1rF9MMs686xDg9SxRE0Ap3tQEs6EagL1b8dWkotZi0/LCfFA7+Z6GGLJ6DJrWb0jl8Vf
         5yAg==
X-Gm-Message-State: AOAM530AkKlDl42kWGnuh1tdioVcQHLSHxdzli/3ayfllpbJG6uoQynq
        /XAN64RpyD1cJKkHOf3+bblm9Diuk2hlwW8s5FI=
X-Google-Smtp-Source: ABdhPJzhbozh1sqaCOSxKvQzhL4/i8HPHfbbnMD3Kq/NX3UpafbWXxESFKVCczBRU5XKsJZ8QEScURxP1lk5X59rDJw=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr4113538pfn.73.1601384369548; Tue, 29
 Sep 2020 05:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200925134943.12169-1-brgl@bgdev.pl> <CACRpkdYkk4Yt983NttG7kFZMkuwz=D4EjP_K8+t8qX5B-OSigA@mail.gmail.com>
In-Reply-To: <CACRpkdYkk4Yt983NttG7kFZMkuwz=D4EjP_K8+t8qX5B-OSigA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Sep 2020 15:59:11 +0300
Message-ID: <CAHp75VcNtbRB2WkGz=MwYZub5EV=sdB3pG8xG7p1WHGs1ez0sg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.9-rc7
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 3:00 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Sep 25, 2020 at 3:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > Here's another batch of fixes for this release cycle. Please pull.
>
> Pulled in, sorry for not being quicker and not even getting the first
> batch of fixes to Torvalds.

Maybe it's good, since you may add one more patch against pin control
Intel Tiger Lake. :-)

I have sent it as a part of the series. first for v5.9, while the rest
can survive even for v5.11. Up to you what to do with them :-)

-- 
With Best Regards,
Andy Shevchenko
