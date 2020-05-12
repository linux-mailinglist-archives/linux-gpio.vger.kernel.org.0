Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272801CFCAE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 19:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgELRz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 13:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgELRzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2020 13:55:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65121C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 10:55:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g4so14723071ljl.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bulAdEa0YtKfLDEvgJtXxjULACbMmllrhnt0TNqof4=;
        b=CWdQqBq1nuGjhJoclSNUa09Dolztaz1qyxLzybRgOWH7y6Ivq+vHLMs+I0nOQr1YiA
         uoujI+0guXsvOyLdafj1E2h+Zf6USlqbOJXX7UD0YJoir1Wy4RBNAnnV9Y3CI3Bgp2Uw
         AsIEhnHzYauu2pddTvUCz0gmyPah5iLyZepsNGIILsejF5o3R6JY5cAfkis56zOAJpk6
         9ri55ILWUPS510A6izprONAhGJKX0CLsIsNnkzX38ikEbtPpYognCa5YSKjWnHEOWBw7
         UUBnCe5svoHBKfW+O14ceTksj/JOIll6zDZCTuaDoXxPCsT4fhof5njy4pdAASe0IY15
         88Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bulAdEa0YtKfLDEvgJtXxjULACbMmllrhnt0TNqof4=;
        b=fKI2ssOtjBP/pC2llu2qDDfC7WmLPnLCN2TzUWS+KribM0ucnt0tUuVS9Z00som6nz
         FVCMf0ve+iKGPzpZ2iIBzQJuewVeW1uqR4TmqjvdxwWpZlpkKxmajuz6PRkE9h2GCNBN
         Jn06DD0jNddR4pgdwKNZ0zxw/SSs6eB919jkTA+o+uwMVxEG84/eqGRobANUjBE6oKpT
         pqw3UrIBeHakOfMjdAEhwMiVxLEQp3zRo9mGKwmSPwZDA2jg73ZLDbeDUufgWx6RCAOj
         RF5Yvlxws8e2d7kxh1dAZF5kFAcLZbsP6h7N5m3k+MiwVLSfRO5euCdDjkN5nqaiThJ2
         crIQ==
X-Gm-Message-State: AOAM531Cwc7ZlrdSY0ZMlBwmZT0aBpgJF0JtczhrJl+fb+C6g68MwJ2+
        Kzdr3tC0WS9tAi5AIV9Y1I64sMgjiwRsBpfFXFv1lewJ
X-Google-Smtp-Source: ABdhPJzZacOxTdIXmG/y1xsQxdbn3Gu8/UFKbgfmJOJX/ZNurJQYUVI8JZg3cgz/pPjpbuDDAZX5z8N5dh2UjcLF3g8=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr13942720ljo.168.1589306153711;
 Tue, 12 May 2020 10:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <CAMRc=MdwSpWkgLTHN+6cOdG7aBAWWYFBC4+tfSNtA2HgX6s_3A@mail.gmail.com>
 <B0E9AFA73AF60B42B6D323E0C4FEB06F01AFAC5A@dor-sms-xch01.digi.com>
 <20200430145844.GA28588@sol> <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
In-Reply-To: <CAMRc=Md5-OgNySDG+XHKow0YSzcZHNtWWPwbmd159fpWL8YAJA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 May 2020 19:55:42 +0200
Message-ID: <CACRpkdbZPhkzuUvwDnBWTvweBukQRcWx0w=2seQsVBEP8Fv_BA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "Bujanda, Hector" <Hector.Bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 4, 2020 at 12:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Ideally we'd have to introduce new versions of gpioevent_request,
> gpioline_request, gpioline_info and gpioevent_data structs - this time
> with enough additional padding and no alignment issues. Then we could
> add the debounce properly.

Hm that sounds massive. Is it really that bad?

> This would of course add a lot of cruft to the uAPI code. I'd start by
> moving it out of drivers/gpio/gpiolib.c into a new file:
> drivers/gpio/gpiolib-cdev.c. This way we'd have everything related to
> the character device in one place. It would make it easier to: a) add
> a config option for disabling it entirely and b) add a config option
> to disable the v1 of the ioctl()s.

Its good to break out for code maintenance no matter what we do
with it :)

I would however not make it in any way totally optional, because the
big win with the character device over the legacy sysfs is to always
be available.

> Linus: about the software-debounce you mentioned: do you think it
> somehow plugs the hole we identified here?

Hm, I don't quite understand what the hole is I guess...

Linus
