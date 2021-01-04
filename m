Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626AD2E9703
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbhADOSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADOSi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:18:38 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7F0C061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:17:58 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id i24so27471556edj.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S3YGJhKq0HHQGucgmozYpZHntxUmH5DmRwVgK8AwGuI=;
        b=v/GwiUgY4h1BjISOPH1/5Py5SLZxxMO5Oord6HX0IddfyiNTi/HqwkJ/9E7XmNPAdk
         nbcogLlSkct4rDD8cIGy4NXm3riFpNhQCuQsmhFgxIz1x6/Ug0ZUH1wL2ilZQ+V2DGsq
         vDgAaIaRXLLIweV9TmZ2EzpWIn53U8XhcyoPugzLudsGo+8Csx7Mlj1QDQL2i7TdNPAC
         CW4KqQCQ6ZhODerecqYLHs88o/K5mUew7G/Pt2zH+gy+MUA3HO39622EhjhhPXnVDGXp
         c1yGzJZb7wuOfOM55fOH/cEPA1eCXAJkcykuM7BnPFoP2MnbO6BkJnGLWk8p0cEbGr4p
         c+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S3YGJhKq0HHQGucgmozYpZHntxUmH5DmRwVgK8AwGuI=;
        b=P1IIhApDgKh14/vyuG4z/GiGUt6AyRe/Ag95n1ZkTwYyOS+FsdFxuQtrY98xLpEEMP
         z0vPswdOGqW/vmiU7hvD5D8W48/uy1/j/kcD+cdzsh2F3/uIROTgZ8jd1Qa667RgtB2a
         Cvy/bc2vD4t0KQUC8wyMtbVvjaaZcizRTrMHvdQAnrLXfD/k++bF7+iSnhR9hZnughre
         cO1lcGYd3U8weia2KPUjQqbYQa2WIWPzUSek7TFpaBKAYmH5sS+tGcVGBcvyki2GIzjk
         oI4ePQRlQ5n2dN1eRgUQ7+yFgAzvQBBwScmgmJRcTAOLfRTULrE1FBoYXC2ZhYilk1ZJ
         sTrA==
X-Gm-Message-State: AOAM530Srru4HIgiSWGohwi7NLf0knzKodk+HyT8wnkozsgq9bc8PnUB
        7o0UoKQr5VDd5jM+iXDdMfAMaWUzK5Wi3WfAhCOdAP7FqaM=
X-Google-Smtp-Source: ABdhPJwKAwnuVOSXfrGZtt7PjGMtlUob47gHSBwlgW4likWCOsuVJtIKI7KiyyrRrNAuyD7juRrBNmtE7FtcJZev5Qw=
X-Received: by 2002:a50:bac4:: with SMTP id x62mr69994137ede.59.1609769876975;
 Mon, 04 Jan 2021 06:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
 <20201224112203.7174-3-nikita.shubin@maquefel.me> <CACRpkdadUVHefag4d42BJiOraAmHrXDcK7gzjZrLXn371rMwOA@mail.gmail.com>
In-Reply-To: <CACRpkdadUVHefag4d42BJiOraAmHrXDcK7gzjZrLXn371rMwOA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 15:17:46 +0100
Message-ID: <CAMpxmJU-j93c8qUduehGKdHigswYcnAkhXKx8NmQjPqO7ibJjw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] gpio: ep93xx: drop to_irq binding
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 27, 2020 at 10:21 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Dec 24, 2020 at 12:22 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
>
> > As ->to_irq is redefined in gpiochip_add_irqchip, having it defined in
> > driver is useless, so let's drop it.
> >
> > Also i think it is worth to give a gentle warning in
> > gpiochip_add_irqchip, to prevent people relying on to_irq.
> >
> > For example
> >
> > WARN_ON_ONCE(gc->to_irq,
> > "to_irq is redefined in gpiochip_add_irqchip" \
> > "and you shouldn't rely on it\n");
> >
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Take out the suggestion in the commit message and implement it,
> but I think WARN_ON is too nasty, just use dev_err().
>
> Yours,
> Linus Walleij

This depends on patch 1/3 so I'll wait until you resend with issues addressed.

Bartosz
