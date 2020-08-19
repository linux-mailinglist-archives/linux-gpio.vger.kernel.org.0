Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB25124A64A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 20:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHSSuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 14:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgHSSug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 14:50:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA354C061757;
        Wed, 19 Aug 2020 11:50:36 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so11847244pgf.0;
        Wed, 19 Aug 2020 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKUSdz5ggJgCypvtvcoqf17QPlT56IKgrCYcfygaIN8=;
        b=R7KYxRkk71vLqZDlr39ocA+2OcxdE0vDd8Tj8OVtAPw7SX/ewu8C/4QQFDGAR+b57v
         OVcbkV6Fs5gGVrJLPFpPSs9FyKHcgIECnDATyhPNJC49qyfmV/6bWOJ1NRwpKVU9Rkj/
         DI4osLbC2V50gbrSmgY7+XOplCo4ehHkvTai3l8z9ycX81bNOQAGrMEP1lMZb2oG8tu8
         j/W+rfwMiXaTYKd32wJAXlB/8T7SySab3v4xtXnYmWBMJpwZpXl18JajmuYxKgZtqaq8
         3mR9dVZGeulmGkTppTpWRA33QnU78xUc5MF1Y9yvDtUThNjDpVMQCvQvJntcyu4q4tXm
         l8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKUSdz5ggJgCypvtvcoqf17QPlT56IKgrCYcfygaIN8=;
        b=MJq/3ExoEvNg84rESRaAA7PiAOKcX4iUq0tnoilmQyWO+RKqs90u3EtQfJ2wT63KBi
         QQQ9XeFhD222fPSC4/sJWXKY6KtXk/KuVCm3EFgXhu/yzRb2fytBuNSbLAbfMXs6dNYw
         GKBrHtsQ7/8vIIC211s3wx+V+eb+LVD236EcKnFzfzJHZhFlIOhqzINQowCGrHqgFbXj
         Msop+bv2tpSb6uu3BEKOeSL0lP7Ili2q5dhgEoF+xaM61yEybhwgLLb2F1FAQ7K5msxW
         eQeGPyfil3s8DqZjGV0Fcho+0AWj23wT+mlLEDAIIIK/tygQK50WmdgGPnFeIhyiKKbf
         i9SA==
X-Gm-Message-State: AOAM533SDc23xYA54cgs2Lsc879eNWMo5foi1QrthYB2TYVMFutvtZM4
        BaKQNqbPUNxUYo00ZyCVltqHPnNciTvRZ39yhT4=
X-Google-Smtp-Source: ABdhPJyuiEsn1JK6nAvJdb0jwvTaK4WDrHiuuH7K+3u8kFAw0ttV27uqoXwuzhjKL0T+613XCm8a3SOn3811MvIfX8U=
X-Received: by 2002:a63:9dc2:: with SMTP id i185mr295542pgd.203.1597863036114;
 Wed, 19 Aug 2020 11:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200721144832.750728-1-abanoubsameh@protonmail.com>
 <CAHp75VdFvAYR+z8c6R2J9Q2JK-WpHS4LU_-cWvsOa2g8+Gfk9w@mail.gmail.com> <CAMpxmJVW0yXdVVxYYiNjHw5XsKx+cyb6hV7KTeOQBxgFJWWx4w@mail.gmail.com>
In-Reply-To: <CAMpxmJVW0yXdVVxYYiNjHw5XsKx+cyb6hV7KTeOQBxgFJWWx4w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Aug 2020 21:50:19 +0300
Message-ID: <CAHp75Vfc_5rS+MOL=WtvEpQ45RT5tHXe4aUiH1oMJn4Re4q3gg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-crystalcove.c: changed every 'unsigned' to
 'unsigned int'
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Abanoub Sameh <abanoubsameh8@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 19, 2020 at 8:56 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Tue, Jul 21, 2020 at 6:05 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Tue, Jul 21, 2020 at 5:49 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
> > >
> > > Changed 'unsigned' to 'unsigned int'.
> > > This makes the code more uniform, and compliant with the kernel coding style.
> >
> > In all patches you wrongly added 'gpio-' and '.c' parts. Also you
> > missed the version of the patches (I have told you about) and
> > changelog.
> >
> > No need to resend, I fixed that this time for you. Be careful in the future.

> I was going through pending patches and noticed those from Abanoub:
> are you also the maintainer for gpio-crystalcove and gpio-msic? The
> MAINTAINERS entry for Intel GPIO drivers doesn't include those - do
> you want me to send a patch that adds them?

Hmm...
https://elixir.bootlin.com/linux/latest/source/MAINTAINERS#L8833


-- 
With Best Regards,
Andy Shevchenko
