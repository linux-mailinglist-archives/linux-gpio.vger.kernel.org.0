Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E773F44F4D7
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 20:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhKMTYo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 14:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhKMTYo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Nov 2021 14:24:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDBEC061766
        for <linux-gpio@vger.kernel.org>; Sat, 13 Nov 2021 11:21:51 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id m14so52506785edd.0
        for <linux-gpio@vger.kernel.org>; Sat, 13 Nov 2021 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fyrc0Jx/YTzk9I5fBevhFcQeLAzAv709+pzi7k+3Xw8=;
        b=ps3vIMZw8ZSORmcOcfDDRCwaiWQgpQPKZGPQAQ4zZmxLRGGSn8Oj4qeuzdA5Lmqmwm
         8CHNuVI77+RQ77a3VjY1+6v/IoQ3g2saukipY5JVA2BMjvpP3RnhsNa786d96F0ADpfY
         78u2NUMmUb3/6Ccwh277PRWXBuVUvniGhUeHc2ksjbHmcy7xyWdfejSyFxP6nhDNiaSq
         mP2j68D3MOuKCB7MczTKmlYR8CZHoU/QLQMpTEy91/YX0naDuitxmm3peFA5OIgLfIrE
         LZE2nKfi0+n/uoTYTKaQyDe6XK6WED1h5KS8XuW3Na9LU3mfm7ACk0qoVyYH2yl2fYMK
         XGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fyrc0Jx/YTzk9I5fBevhFcQeLAzAv709+pzi7k+3Xw8=;
        b=wl1xRqM4cMFcAZ5n20RqvMR5FtbscP3pCD6VIo/4zyN9054fTsnps0123HaUgPeZmX
         OoJR6FwyPRVOGdQJlI4+LdS1Z7DM+4oSFcTYEq5YmM5ooe0vk5ECd8IPUjp60P3z0YMk
         rLzi4BF7kOghw7zH7PHgXg8tQsqNLPHo0KQ/ycdOlsQ0N7p82Ky6SnYRzYotCRzxaAzM
         8YNe6Uz9U3bNIJxmSZkpMwJMqOZoOGaKfTjn8UgAw82Wt7qS4MoT7ozuo9X6l+KwIQO0
         yzi8EOeVGVp7j1nXTKo3OeW5wGH220ZUISAa6WukFOdRG1Fop/JWtncnfQk0H9UA8Ocs
         epsA==
X-Gm-Message-State: AOAM532mSB0N0EFEzQsQFXvCGy1606dDcjPEyeG0yGDFdrGoWrsvNaJV
        83WGCr+AY8Tfn43DYroW65rS4ozluT7jKShN/WQ=
X-Google-Smtp-Source: ABdhPJxW2vs48Zrg5+/GGwaBznD9LK5Im321Hqg2gzBrUL/oIszyCtYpSVVNeD33LilvCnoDN5quYvPrIifk5RM3dS8=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr27917125eds.224.1636831309919;
 Sat, 13 Nov 2021 11:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20211113162944.22412-1-joey.gouly@arm.com>
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 Nov 2021 21:21:13 +0200
Message-ID: <CAHp75VdNqNZ625uWFoDX4jrztnv9wbk==KN2+jd_3G5fAYzVEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] pinctrl: apple: misc fixes from post-commit review
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 13, 2021 at 6:30 PM Joey Gouly <joey.gouly@arm.com> wrote:
>
> Hi all,
>
> Here's a series of small fixes that Andy made comments about, after the driver
> was already in the pinctrl tree.
>
> Most of the patches are only a few lines, apart from the first which is a
> whitespace only change.
>
> A branch can be found here:
>     https://gitlab.arm.com/linux-arm/jg-open/-/tree/pinctrl_apple_fixes_v1
>
> The branch is based on torvald's tree, with Sven's recent fix [1] cherry-picked.
> (pinctrl fixes branch didn't have Sven's commit yet)

Thank you for doing this!

One suggestion here is to put the Suggested-by tag where it's applicable.
Side note: usually we still file a commit message body even if it
almost duplicates the subject line.

WRT patch 1, it seems to me it has a  lot of different style changes
at once. Perhaps split it more?

> Thanks,
> Joey
>
> [1]
> https://lore.kernel.org/linux-gpio/CACRpkdZJVRn9zAC8t=_X=29+kWw2QPKBHd9wiX9C3ms+gte40w@mail.gmail.com/T/
>
> Joey Gouly (9):
>   pinctrl: apple: fix some formatting issues
>   pinctrl: apple: add missing bits.h header
>   pinctrl: apple: handle regmap_read errors
>   pinctrl: apple: make apple_gpio_get_direction more readable
>   pinctrl: apple: give error label a specific name
>   pinctrl: apple: remove gpio-controller check
>   pinctrl: apple: don't set gpio_chip.of_node
>   pinctrl: apple: use modulo rather than bitwise and
>   pinctrl: apple: return an error if pinmux is missing in the DT
>
>  drivers/pinctrl/pinctrl-apple-gpio.c | 103 ++++++++++++---------------
>  1 file changed, 46 insertions(+), 57 deletions(-)
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
