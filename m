Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E44345E3D1
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 01:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhKZA6l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 19:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244362AbhKZA4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 19:56:41 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F0AC061759
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:53:25 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id x1-20020a4aea01000000b002c296d82604so2572160ood.9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kl1q9RBtm0+fgAQSPfLwF1XTAdCjMeTW+yoWGPnzQok=;
        b=q8wprTGMuIf1pcUGLSzC/+q0bZCFuUZEpgEaPCUyRf+vSeRwqZ3rITN7yb/rSRpP5X
         vVEcojkxIZT+MH6f1eX+pVqJCkjKGKVavZpz5ag4lB5aU+oSyc37mvYXf3g8rKzuWNuF
         g/6R5cx63gf1dj0FFlhu+aVykMTe4k9A1u0OGUO499I23v718O4LRVRCOEap2lP9QjOH
         pnbZvvZgfqo9j9gNbiOePu3IyVr2mLRVHDbI5xhvEXaqmeHflVQKkjzHBQwaNZeY+84u
         TmNB3Kv9N4k1UJVmfKrbywpEuSBdocxr7oRTiknQliEVbhBwFvH+SiaViBN1aR2ufSzz
         fpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kl1q9RBtm0+fgAQSPfLwF1XTAdCjMeTW+yoWGPnzQok=;
        b=CXsvmWrkppnsQlvcrMVy3p5ifv4UjrJbtR6Z9AkdLfvJDB6p3HrbP9EL8u2P6c1ugM
         y2zXKgEr/IvsxWA8CxdugcTjAxf4w7+CSBdbXUy0mjStFoE2g/ROdPv1kOUB1vpX8NmQ
         ltW06ZYfAMpI7tsIrCFyep26WJDCFnuJ1ztafuWevENuu3Ur2LnOokG9IdVGilzbMNyr
         ySBZ3IjMOtHauziEzABjeZHed6xoy4qj9Rgff8vQaoxWuebIQuLvKmiA4zemMwvNLucF
         obTMdIhVohpDYR55dRYNbFVbwNs3kAeRoJoowF/RFX7ZUW2aXQ5rBkKe2zvwwHXEO2xM
         IOFw==
X-Gm-Message-State: AOAM531l2e4KSHXilXCq/R397Lgd2Hz5nu2piz1CVxTX1Ue03cPEPHGz
        vmq02IaCzlT1uAQHeYoZ9DcDU5/EEysse9ts1izRtCCZ8v04hw==
X-Google-Smtp-Source: ABdhPJx10wgXn0nvU7r1CN2+qYXKqWuaJwNqE6GsZkIEOq1avo77vdWyoQb3UMdj/7aLTbb0MMVOBuNJp1ixjNrIFNg=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr4749738oot.84.1637888005008;
 Thu, 25 Nov 2021 16:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20211121165642.27883-1-joey.gouly@arm.com> <CACRpkdbbj_PapRXYv61Dt8369_qqQx97t3o=FyFUY7s1ThytMA@mail.gmail.com>
In-Reply-To: <CACRpkdbbj_PapRXYv61Dt8369_qqQx97t3o=FyFUY7s1ThytMA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 01:53:13 +0100
Message-ID: <CACRpkdZO=8efvoVnSE_Oc26grv-UWNzN97f-SoUjm-jGG7AFzA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: apple: misc fixes from post-commit review
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 22, 2021 at 1:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> I tried to apply this on the pinctrl tree based on v5.16-rc1, have you tested
> this?
>
> It didn't work for me :(

Still doesn't work. Please try on top of this branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

This happens:
$ git am --signoff
./v2_20211121_joey_gouly_pinctrl_apple_misc_fixes_from_post_commit_review.mbx
Applying: pinctrl: apple: fix some formatting issues
error: patch failed: drivers/pinctrl/pinctrl-apple-gpio.c:249
error: drivers/pinctrl/pinctrl-apple-gpio.c: patch does not apply
Patch failed at 0001 pinctrl: apple: fix some formatting issues
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".

Trying manually:
$ patch -p1 < ./v2_20211121_joey_gouly_pinctrl_apple_misc_fixes_from_post_commit_review.mbx
patching file drivers/pinctrl/pinctrl-apple-gpio.c
Hunk #9 succeeded at 243 with fuzz 1.
Hunk #10 FAILED at 269.
Hunk #12 FAILED at 299.
2 out of 13 hunks FAILED -- saving rejects to file
drivers/pinctrl/pinctrl-apple-gpio.c.rej

What am I doing wrong?

Yours,
Linus Walleij
