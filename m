Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CD844B429
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 21:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244602AbhKIUpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 15:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242487AbhKIUpW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 15:45:22 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDE2C061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 12:42:36 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g91-20020a9d12e4000000b0055ae68cfc3dso531758otg.9
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kl+ING2vPVUw4dbwJiGjKtSToM+NyrnBy+El7nhO980=;
        b=zmf1V1KQjNkArcK6dsYU/c7ttlDWId9avUz5BsgLno0wJHjE+nzUw6OMH54Pj+TumU
         j01e23FYO8hn3Wk27ZB75YVIX5/gYGYkZqj1LIvqLDnGgADDGr6M7zzTqBjvsC0Lz9Mw
         h9EiMhbJXNs+4gpq3Ftu3Ad5M87ldeLiKXsyBOv8WdpxtbD1shQKhiitRoadIzxMJ8Ks
         Q1FpmIK1bwzRkO5AiXU14yXzdQG/wBdN3LtCIUDfnvMylDI03sqmIdM/HBZwkOqIBcb9
         2b/TWTng1GnNdtmH0DcniDEgHWD6TNZ54grLGfwl0qzqG93s+3qFgndgPjdFE+KlzjDO
         f7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kl+ING2vPVUw4dbwJiGjKtSToM+NyrnBy+El7nhO980=;
        b=1IhxTwgIr//xek4e8NaP3irQ7Vpdh1f6Jy3ebVcm7YTlcc3yiogUT7RJeaeO2tFG7G
         r0wFf9PBWnRv+ebJhHWc2In/Jyp7dSNmtmKB7ANuoSDkbPVwFQG+UUx0TtE2PWFKgiGl
         drnGCrUQLmKJ86019hp5CgfUI/q45kOOV1uceikP2pchqCv33CZs8u7wxAk0x2pJeo2K
         f+ES8ZjQSGmLusLSGUfsBOR3P0sBfafSoqwFEeGYQtXwpdnCM+cAhu3qDvQ86EoEiKCA
         OsBVLmb2iijsb5IUVzsH2SSADUVmn6TZIpuX7AwHr/jEc2ktE1Q1vDyokZx1rA4warZn
         xifQ==
X-Gm-Message-State: AOAM532gcrIwHH26lrNdP5RwrqmzWb/vZTI0odeQT740UyybG8zRXNCp
        qhI9LDBVLrJI2D2gY2MiUNaMwK6fiPolJ0AV8pwcKQ==
X-Google-Smtp-Source: ABdhPJzxPoRxDUD8SGDUt5PcErFvzEPCMZS6UV9UQDtuc0AL6W7X/9yWO2k1DBIvqVQZUNdpVTlOYATJQ3FyB40EqYQ=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr8564780otk.179.1636490555709;
 Tue, 09 Nov 2021 12:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-7-arnd@kernel.org>
 <YYpN3LzXz638l6FG@smile.fi.intel.com> <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
In-Reply-To: <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:42:24 +0100
Message-ID: <CACRpkdZaJQqwyosnXhaOc=mF5jJxaDKDKAQxJGJvQAWpU7MNQQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:50 AM Arnd Bergmann <arnd@kernel.org> wrote:

> I think the TODO list is in Linus' head,

Oh no, drivers/gpio/TODO

> but it would include all the files
> that use one of the interfaces in linux/gpio.h. I found about 350 of them,
> so there is little point in listing them one at a time. IIRC Linus is going
> through those one subsystem at a time.

Yeah but if it's just me I doubt that I will manage to do it by the
time I retire in 2037 or so... So the TODO is there to inspire others
to step in and help out.

> I also found that we have a ton of users of linux/of_gpio.h, which is
> somewhere inbetween the linux/gpio.h interface and the
> linux/gpio/consumer.h version.

This is also mentioned in the TODO.

Yours,
Linus Walleij
