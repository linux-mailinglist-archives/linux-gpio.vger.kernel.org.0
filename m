Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9852748CB8B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 20:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiALTJo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 14:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356570AbiALTJn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 14:09:43 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1DDC061748
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 11:09:43 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z22so13819505edd.12
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 11:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S0Bi+PWU2J4PuOPK6RgZxdh0OQGveZD1PdBvsl6+KPU=;
        b=TIlaOXnsdGNm15sqxJCKY5LqIYqszIlxboCLdApQ73MhYdu65t9R86g0zWelDUDQ1K
         0JsHoAejAK2zKwTz52pXsFfxkgB/+jYwb1f9ZJGBMW1/UfomXvFq04/pZLakvQc+5I0l
         /DLGay7ikSX1uDR4BqigoPmVj96TSQgtKx+BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0Bi+PWU2J4PuOPK6RgZxdh0OQGveZD1PdBvsl6+KPU=;
        b=d7R/OLV0qJ1NQ3+eq15I9AXBL08lfG8WHj5CuISN5/Gzklgeb2dxf721qi4F1w1S9I
         eq8ZSlQHbG3SCzuM5jrRU4MdTxUJR7a8US/s5UyuqW3yYDkznNjESeYeuSu4Jx5Rxc9r
         DcN3epdJ+hGZGc29f9dcAhNlMviY2Ftqv+Ag9V4KcLXSj5vwtt3vowYMam1ilwZbdSv/
         yil/s+d2a8jyHSBxsfp/Qwm3983bfkF4uxi8TgZYqVyKiz/zZr0aZO6z1SXSJHgqAeC/
         nI18K9KNtKrOZlrrCiefQVhglvtSRTkxM6xRcSR7JYqXHzA/VX6MY7/NNy46AMHGibFU
         bxSQ==
X-Gm-Message-State: AOAM533a+D4YYmpUFdnAACq1lexBXJahIJ8VQi4JhBw0uFW41M/ZMQtt
        6f6YtTlJedPcEP/TKR8hJEkx9fUUgS4bymPgyNY=
X-Google-Smtp-Source: ABdhPJzLEoS4bNGf0iybRHWw9AudCCa02j/B48xoESkd8cUmkkp1yrTdGHfUtMupUVG8EZJ5RNiv3A==
X-Received: by 2002:a17:907:7b8a:: with SMTP id ne10mr856962ejc.587.1642014581672;
        Wed, 12 Jan 2022 11:09:41 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id x20sm256514edd.28.2022.01.12.11.09.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:09:40 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso3454571wmj.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 11:09:40 -0800 (PST)
X-Received: by 2002:a05:600c:4c94:: with SMTP id g20mr8030335wmp.26.1642014579646;
 Wed, 12 Jan 2022 11:09:39 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdaVGwu=Bo5bxVQYZXD-k+x++SuOTApGoK2a_S-1M4Q+nQ@mail.gmail.com>
In-Reply-To: <CACRpkdaVGwu=Bo5bxVQYZXD-k+x++SuOTApGoK2a_S-1M4Q+nQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 12 Jan 2022 11:09:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=whcTsfaQWjNKP+DUSqfo+3rf1o8-N9CpjpogMhAxiJZ=Q@mail.gmail.com>
Message-ID: <CAHk-=whcTsfaQWjNKP+DUSqfo+3rf1o8-N9CpjpogMhAxiJZ=Q@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for v5.17
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 3:23 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> - There will be conflicts! Kconfig and Makefile conflicts due to
>   some RISC-V Starfive patches getting merged through the
>   SoC tree while we were tidying up the Kconfig and Makefile
>   (to avoid merge conflicts, heh) there is a resolution in linux-next
>   which was discussed and reviewed to be correct.

Whoever sorted the Makefile entries (yeah, it was Andy) isn't very good at it.

The broken sorting put CONFIG_PINCTRL_STMFX before CONFIG_PINCTRL_ST,
and I have no idea how you can sort that way.

I left the broken sorting in place, because changing the sort order in
the merge would just be even *more* confusing.

There may be other cases of that kind of oddity, I just happened to
notice that one because the 'starfive' thing ended up having that same
'st' beginning, and I went D'Oh when trying to make sure my merge kept
the ordering.

The sort order is fine in the Kconfig file. Maybe some odd sorting got
confused by the next non-letter character (either ')' after the config
name, or '.o' of the object file name).

Obviously not a big deal, but it's an oddity.

               Linus
