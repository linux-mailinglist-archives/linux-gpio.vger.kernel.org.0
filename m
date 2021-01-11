Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791502F1783
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388506AbhAKOHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388499AbhAKOHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 09:07:21 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2C8C06179F
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:06:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id q22so24957689eja.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChF2yW7ONCcIUa1X3TAlUb8ZQsd8u4MyVM9KnqWA78Y=;
        b=L8Q45IjHDurPUhJe4lRsufIzusjupbic4iHYjFs33iHJ+EY+P0LrBVCjXitkbi+5zB
         QT3YxPrcS/nVeEuzRsznGVZjtgMP/VzMKLyz/Q7PUBNJaWvoIpqOxKYnLUY9lJWkvkyQ
         5TsRpt9maFMM+EZfkPoFRXqtZDAhCoYAF7A0PFJ5CVylOelKS07SGVyz//WXk2BAd0zE
         E7JjbpXFrnr7fSKcmvLsHCaz/6KHYws44s+lihDF9gJSp6wb/6u15caAzkKNcWN960AK
         o05ttj1EXF8WAWjtYvUABEyqy6KuteIfwu7s7sYYEBX8eXD5tGEyey5rA5h5KrJxgxSQ
         GxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChF2yW7ONCcIUa1X3TAlUb8ZQsd8u4MyVM9KnqWA78Y=;
        b=Mtm8Ld75F9STGtBV9fLvGgPiVPIqYujPU7P99LVOYEEcPUFUs0QgBTO6Wj0XlC7rGb
         GxdhuwqW1wgVNnq8mbiyCcbndg6vfhXXKk9jDMt3qHaXlSJGznaZLHPuKE2wCIn96cGi
         gAlQAHOIZg9Wj2ZuEJeEZlekt9KjQQi4ydAJAYHPMw1Y7x4rlwu8AKWXJvnHbGEJBqxv
         V9WbVwM3wOz0RWJiQE/Wjudpy4W84j/2TrwabCFxXnJ81nFscmBcIWcb/f/x6900vmSt
         5ECVJQtZvYEbKFwLyUGl4Wu1fpfY9fNEUyUh3x/wdeC+0Vc2uN8FXKz+OnhBr6q/wXCf
         0GDw==
X-Gm-Message-State: AOAM532rRTXleWsfnJxeMo5H16SFOXjKpEtRQivj0MykdCRt6vyxQYvO
        sdQb4kmxy4N0SxIyV4sgfSNyJiEoLmrJKxk0PE2RVQ==
X-Google-Smtp-Source: ABdhPJy2I7r4SOY0xR++yRJCn4ofKZm4H7u/sMVICaXpxu1zAMoaKm1OouUKzft+w1O2A7C6lL9Yk0eF1uvULd2RM6s=
X-Received: by 2002:a17:906:77dc:: with SMTP id m28mr10883043ejn.64.1610373999254;
 Mon, 11 Jan 2021 06:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
In-Reply-To: <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Jan 2021 15:06:28 +0100
Message-ID: <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 2:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > In order to avoid any problems with symbols missing from the host linux
> > kernel headers (for example: if current version of libgpiod supports
> > features that were added recently to the kernel but the host headers are
> > outdated and don't export required symbols) let's add the uapi header to
> > the repository and include it instead of the one in /usr/include/linux.
>
> I doubt this is a good decision. First of all if the host (or rather
> target, because host should not influence build of libgpiod) has

I meant the host as in: the machine on which you build and which
contains the headers for the target as well but I see what you mean.

> outdated header it may be for a reason (it runs old kernel).
> When you run new library on outdated kernel it might produce various
> of interesting errors (in general, I haven't investigated libgpiod
> case).
> On top of that you make a copy'n'paste source code which is against
> the Unix way.
>
> Sorry, but I'm in favour of dropping this one.
>

Cc: Thomas

This problem has been raised by the buildroot people when we started
requiring different versions of kernel headers to build v1.4 and v1.6.
It turns out most projects simply package the uapi headers together
with their sources (e.g. wpa_supplicant, libnl, iproute2) to avoid
complicated dependencies. It's true that now the library can fail at
runtime but I'm fine with that. Also: if we add new features between
two kernel versions, we still allow to build the new library version
except that these new features won't work on older kernels.

Bartosz
