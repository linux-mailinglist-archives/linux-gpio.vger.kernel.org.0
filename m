Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0561A3ADB97
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jun 2021 22:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhFSULO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Jun 2021 16:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhFSULN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Jun 2021 16:11:13 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E729C061574
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jun 2021 13:09:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so2790654pjy.3
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jun 2021 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctcD4LQm2MWZhfE95ZjNctytDT0v4pHcjiI0HBiegwU=;
        b=kxzQ22bnZ6N8uOgyeoyNK4kcWMimTTPlul8fvwx8RO+R4pK5tY73gm0j8CE7AXVPuH
         JVL1Dd1NSKM1kBGN7QWsQyMZbeKe8QceMTISIjCy2YENUtT72nxeCBkKPP8FQKThj75f
         O3SSlNzxUnKJqSSD1CbNR7qBgkIwz/m0J2tkbPVcL6DQJUbHe+hWHPo6bQGH2T4Lr/AZ
         KtupM7RLEbmrBiYURrfc2WdsjUFVKqxhnpvpZa2HzRtyZByuF/CVPotxJWAetJIUX6da
         zyeljD/VYwc4T3bCcP9rGTLmHHUfaM+r4PwYG2PUJLj8GyWYtmXzvz5oMUCVoK5dwoHJ
         2bMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctcD4LQm2MWZhfE95ZjNctytDT0v4pHcjiI0HBiegwU=;
        b=bJMSDencMqw3i6nABXFpuJpWg3CrvyZ1ygx+nzXTRv0bgiqJvat53sfZyeSb+a9TcR
         n7dIMVy2s336eNRz7se8aSKmm9Ehy3mLZ39BbTMBBe1YMYemE6MhvU2KZA0+5+htfjFz
         SEhPIQy4XxgysEmymvzwCGtdHFYXaiZz0JJ6haVWx5BVXIkWV+k/YDDSz1+ie/Lgxen0
         vuRlkrkC9Ifrw3hAC5kqu9c/hJFU5ajCYvjddt6oH/RSb0eS5zBg8Vs/6wKLqhEYWIka
         caxAEUICO+D/q0AD5z0/nc4S62xDsNSmZjglgI0qD1YG5me56hdILLzp5uQB9G1UWfyw
         vcDw==
X-Gm-Message-State: AOAM530+Ykbwf72ByWWfJzYlOr4P0nj9GSecQVwpSzQuPaVBaEn80XSS
        8OohVq3TBSG1u5gwTS+3J8kfSPKsh6pDH4zg+cp8MkBo4Vyl77vJ
X-Google-Smtp-Source: ABdhPJy6EjTJLhpB8k6L3Qhun1l5H4Uu2gYb1bkectX4KMCMhGTH/9QA9DuSjLiGnV2fOgMQTDiTmibbBjxgjS8GpG8=
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id
 g10-20020a170902fe0ab029011d81c93adfmr10484092plj.0.1624133340700; Sat, 19
 Jun 2021 13:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624056311-6836-1-git-send-email-gabeknez@linux.microsoft.com>
 <20210619041144.GA15015@sol> <20210619174913.GA6966@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20210619174913.GA6966@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 19 Jun 2021 23:08:24 +0300
Message-ID: <CAHp75VdMCCYVoMpq6T91x-_TsXGPSjqWz3x0VxA+YZyf19OdtA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: zero padding during conversion to gpioline_info_changed
To:     Gabriel Knezek <gabeknez@linux.microsoft.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 19, 2021 at 8:49 PM Gabriel Knezek
<gabeknez@linux.microsoft.com> wrote:
> On Sat, Jun 19, 2021 at 12:11:44PM +0800, Kent Gibson wrote:
> > On Fri, Jun 18, 2021 at 03:45:11PM -0700, Gabriel Knezek wrote:
> >
> > Probably should've been [PATCH v2], despite the subject rename.
> >
> > And CC the maintainers (LinusW and Bart here) and past reviewers (Andy
> > and me).
> Sorry about that. When sending the revised patch, should I change it to v2?
> Or perhaps v3?

Yes, v3 with a changelog for each previous version.

...

> > > From: Gabriel Knezek <gabeknez@microsoft.com>
> > >
> >
> > A second From: header?  With a different address?
> > Perhaps you could pick one?
> > Neither git nor checkpatch.pl seem to mind, but it is odd.
>
> Apologies for that as well. git send-email doesn't play well with Exchange, so
> after talking to coworkers it turns out we have a separate email server for
> sending patches which I wasn't aware of before I sent the first one. :-/ Sorry
> for the confusion; I'll stick to the @linux address.

Don't forget to configure your Git accordingly (globally or per this project).
Note, you always can test this by doing

  git send-email --suppress-cc=all --to "Your Second <email@address>"

or so.

> > > Signed-off-by: Gabriel Knezek <gabeknez@microsoft.com>
> >
> > You should retain the Fixes tag from v1 - it is important to identify
> > where this patch will need to be backported to.
> > And include at least the first twelve characters of the SHA-1 [1].
>
> Oh shoot. Sorry about that as well. I need to make a checklist.

The checklist is already made for you:
https://www.kernel.org/doc/html/latest/process/submit-checklist.html

> Thanks for the link; I did read it before submitting the second patch,
> but I clearly missed that part.
>
> > Still good with this bit ;)

> Thanks for the kind help. I promise I'll update our wiki with these
> learnings so hopefully dealing with the next person from our team submitting
> a patch won't be so painful.


-- 
With Best Regards,
Andy Shevchenko
