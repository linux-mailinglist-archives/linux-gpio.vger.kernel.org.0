Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4296227ADA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 10:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgGUIjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 04:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUIjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 04:39:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC49C061794;
        Tue, 21 Jul 2020 01:39:14 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t6so9960667plo.3;
        Tue, 21 Jul 2020 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=387HRZ+9jaUMXWYZOGG4GYSuYH+7TCpe8TgEbgSoPoA=;
        b=PdhCNST6yW+yOEGlBAAsWbK6y8RbUX/cHTtvIid2OPvGdHYQsoXcAFAK9idMFTwD8E
         o7wXhkptF/3aj53CeugMPfh5Uije4DQwQs/cF4N2+ne/IDFxU7VtlXHzwzv6rkGQQhdg
         gyDTGkb3654wYQj8hW1ZoLUjE+V8Qo7mi/M8rKmOa8aUzz1JbYH3owcMoj5yePy4LEFe
         cmpEyFYN6n/ghcrIh8Ljraunrzs3FB2ohC2Dg246GK54iiYFCgkYvhP08V6shar6s+jC
         FFZyAKe4xIduzCP+nMjGcLUTjtu3mdUdF3tLdicoXq9HQXYXvwzdgL1B9F7tyt8wGzVz
         jvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=387HRZ+9jaUMXWYZOGG4GYSuYH+7TCpe8TgEbgSoPoA=;
        b=VEdhGmfCWGnVpBOvBVjsLidgOQigVr1vfu9YFfRuY2rO4v6zSQemSpahm+NKk41guF
         Wj/arNSPGD2Kd8mSfCieDkbE/zH2/DFbSdxoNeLE6BDXn2YOqLYsB+U+nNegpCbvY2F6
         dTekn1SeDCjfEyFVQ3H4/Ayv+1l6BiiYm5T/60NxaNT8ycmJGOiAgwwZgAaZ0sxioES2
         WIa7PKoj/ZqBWGha3LUUeBXcQDQKUrGs1eJLBxnG4RSgZoaggUfertPc0PFOU8/ChtmJ
         lHCreT0F8obWkj8a3vX7AHPmb69JH6DGH03fgVmCP2l7c3ew//A/Xv4su2J4V428ilDE
         9xeQ==
X-Gm-Message-State: AOAM531CZcKqOFeSvKu5iGS72cWnQrNbRnuXQuSGv3a3LqI/XvLtiHwe
        8x8D87ASRy5l1KXDcNpdtMJrzwVrzfgB28W+CKM=
X-Google-Smtp-Source: ABdhPJydcpftKpZYAiQbjJ7+lEzoRdy9iyqMAcDQW82mzg+Fc82H7IWzM38p6tCxSuKzbSofLTnzO0P1iQ+0pFDVmXI=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr21471781plv.255.1595320754450;
 Tue, 21 Jul 2020 01:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200721080012.1329263-1-abanoubsameh@protonmail.com>
In-Reply-To: <20200721080012.1329263-1-abanoubsameh@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 11:38:57 +0300
Message-ID: <CAHp75VdfSNp-u7fvRPNBGp8JAvHwiRjFa9CXn0iQQ4=dQyZprg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fixed some coding style issues in the gpio files
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 11:01 AM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:

Thanks for the patch!

> This patch adds the word int to unsigned in more than 600 locations,
> (and changed one long int into int)
> I recompiled the files except some that had no make rules,
> and I can make another patch only for the files that did compile.
>
> If you want, I can split it into smaller ones. I don't think that this patch
> causes any problem, except maybe causing diff and patch to fail because
> of the number of lines changed, so maybe if you have any patches that
> need to be applied just apply them before you do that one.
>
> if the word int was intentionally left out, a sed command can be
> run, now that the code is more uniform, to change every instance of
> unsigned int to unsigned, and if you want I can supply a patch for that.
>
> I can also add more patches to fix the rest of the code style errors,
> that are stand alone or apply after this one.

'that is stand' or ?

For drivers I'm maintaining, please split on per driver basis (I will
show below which ones I have in mind).
For the rest you have to include relevant maintainers / designated reviewers.

...

>  drivers/gpio/gpio-crystalcove.c | 10 +++---
>  drivers/gpio/gpio-ich.c         | 26 +++++++-------
>  drivers/gpio/gpio-intel-mid.c   | 22 ++++++------
>  drivers/gpio/gpio-ml-ioh.c      | 10 +++---
>  drivers/gpio/gpio-msic.c        | 22 ++++++------
>  drivers/gpio/gpio-pch.c         | 10 +++---
>  drivers/gpio/gpio-sch.c         | 22 ++++++------

Above, please one patch per driver.

>  drivers/gpio/gpio-pca953x.c     | 12 +++----
>  drivers/gpio/gpio-dln2.c        | 28 +++++++--------
>  drivers/gpio/gpio-dwapb.c       |  6 ++--

This I prefer to see the same way, but I'm not a maintainer, so let
them speak up.

>  drivers/gpio/gpiolib-devres.c   | 16 ++++-----
>  drivers/gpio/gpiolib-legacy.c   |  6 ++--
>  drivers/gpio/gpiolib.c          | 26 +++++++-------

These perhaps should go in a separate patch with gpiolib: prefix.

-- 
With Best Regards,
Andy Shevchenko
