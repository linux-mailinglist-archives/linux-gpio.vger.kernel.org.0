Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3EE724A652
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 20:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgHSSwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 14:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgHSSwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 14:52:17 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53361C061383
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 11:52:17 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g19so25815972ioh.8
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2020 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WB8mQxc0LogEyfIgqkmCRlvoxAmjS9EG+OsROE4agYE=;
        b=HvNODI/vfs1WqDwKJepV1SCGJDZW7J1gsTlnsRrWx/mS1F07j2GxfYJ4FmzrC43QOG
         CoDV4lBCeFhtkNUHQnvaFZHEE9g+wxOpwi2os8axiadx0sNy+3RcMeGiPWnjOvy13fys
         FUl6sbm7XmD5NXrz1Uls+I7OrNJ01WSwPx1xQFZVSrX7e07meaZIRYoPmZdrBjxyTeZs
         gobBGDOkKyOxcyplU0TG1eQY0RJ87SFUqzsabAKQlEojO9emfMqALJ9R6FkgcOQ+/3lh
         veJrXx9llSGLXZ8qcrAUj+pW7uetXCRXQXS2s6U9MsNTPrmqH6gJMKM0kpvpHBI6ZtCw
         NzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WB8mQxc0LogEyfIgqkmCRlvoxAmjS9EG+OsROE4agYE=;
        b=kt1XV9qKtQMft28AWyc9hisToKdVUyCqJ89AL0I0nNFMNP4XEaoRMv3pUTnAxZ5OEa
         YWajvqh/W/qMxf2t1kO+X6A72d1DDGCU/dH/jWS4fTZRa9Hd33lj3BhuOme5VR436AWE
         6hxeDyeW/IR536+b2GqlCKxzAQSR6LCqAaMhMWnmliQIO97vhYii3OY29i4I2ffYbZQ5
         8mTEjj23gJVhFqaiGcRpHAabdjON+MddFR3tYOB4i4ZiBZJgjRMWorRiO4qALOOd80le
         D/rJoU/iiDeHLQbj/rLpj8ep4CwyP9rgjAQciTMLKBMVNCsbxpgTNvqlmSV6uGVjF/0t
         Hl+w==
X-Gm-Message-State: AOAM532cD72xFG45nA88P5Sck6KTHdG9oXlyPTgzsKKGn90/HbR1M+Ql
        hFwirkPlOseMlhcSU2/ldlydu0seu2aLaAIH3DK9Cg==
X-Google-Smtp-Source: ABdhPJx3+grKblNX4zGHAmxtgPBoo3hFJoCA06Ve/pIwbZYE4zdvNve2aCmMxuYsnYiu63e+jgeqXglEy+PzwTK0P4w=
X-Received: by 2002:a6b:6c13:: with SMTP id a19mr21648139ioh.31.1597863136660;
 Wed, 19 Aug 2020 11:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200721144832.750728-1-abanoubsameh@protonmail.com>
 <CAHp75VdFvAYR+z8c6R2J9Q2JK-WpHS4LU_-cWvsOa2g8+Gfk9w@mail.gmail.com>
 <CAMpxmJVW0yXdVVxYYiNjHw5XsKx+cyb6hV7KTeOQBxgFJWWx4w@mail.gmail.com> <CAHp75Vfc_5rS+MOL=WtvEpQ45RT5tHXe4aUiH1oMJn4Re4q3gg@mail.gmail.com>
In-Reply-To: <CAHp75Vfc_5rS+MOL=WtvEpQ45RT5tHXe4aUiH1oMJn4Re4q3gg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 19 Aug 2020 20:52:05 +0200
Message-ID: <CAMRc=MeCOTPe5D8Ego4dAQD4-FVT7OWffORcdh5bUMrcvRqgJQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-crystalcove.c: changed every 'unsigned' to
 'unsigned int'
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 19, 2020 at 8:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Aug 19, 2020 at 8:56 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Tue, Jul 21, 2020 at 6:05 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Tue, Jul 21, 2020 at 5:49 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
> > > >
> > > > Changed 'unsigned' to 'unsigned int'.
> > > > This makes the code more uniform, and compliant with the kernel coding style.
> > >
> > > In all patches you wrongly added 'gpio-' and '.c' parts. Also you
> > > missed the version of the patches (I have told you about) and
> > > changelog.
> > >
> > > No need to resend, I fixed that this time for you. Be careful in the future.
>
> > I was going through pending patches and noticed those from Abanoub:
> > are you also the maintainer for gpio-crystalcove and gpio-msic? The
> > MAINTAINERS entry for Intel GPIO drivers doesn't include those - do
> > you want me to send a patch that adds them?
>
> Hmm...
> https://elixir.bootlin.com/linux/latest/source/MAINTAINERS#L8833
>

Ah, I was grepping with "crystalcove" and didn't find anything.
Strange I missed msic too though. Anyway: nevermind my email.

Bart
