Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02ED2A800A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 14:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgKENxo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 08:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKENxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 08:53:43 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE95AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 05:53:41 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id m16so1648698ljo.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 05:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N9Zqvg7WZxUAVGMZvcOLT+Q/3cV0loMEtaVDCrciEcI=;
        b=YGsS+L0GJe38vGzMAAf/iqcef2czOsK8rhWfSZWSSD1qZEI02SM56Q2B9f7zHbzlIw
         ll4PLaTJ2DO2WgJ3wk9tJNf5jmCaRcp+xymoUVKcWxxTnIFo8u4HQW4YpyZ4uJRyycxV
         4EYD29gE9BfEm842RsafvdQITKg0lMbdr1L+y0XXMlNcd707Equ/ou9zX/UVuVXD3e0L
         c6fYtaNfnlY1ROam+844oEzfsGFEHzS+TM6S6Ba8XLjLyRo7nYWMq4rUQx743bKV67pT
         GoeTJWK0DB4UJHYe7IwzpY2uEFiqOvjHJJLXLEseoV2c5nsmZKk9ViR40MxwYCpY2OR+
         DTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N9Zqvg7WZxUAVGMZvcOLT+Q/3cV0loMEtaVDCrciEcI=;
        b=uN8lwpeLDuKPM5fyk1b8X283lr4/0ww4LGUQ8pDwzKQcNUYdQoMmO9/nojiDgMLwyQ
         kRYOBTNRAqiuObKN/Ibo0aGT0mPfDilQJh1uEiPz1xnritXdt6CCuxDG6UFui8yhyGHH
         31F8GpSPGfzG5FdFd9piOy8/UHjutGFZx9mYAxkhrMZ+zmlDo1TApp2cEIM2UUCSU4/a
         YRgFTbufruk4oSmkmfkijX4fceJN0Ee3dbMeLx/r3MMPFBHOPwssRIsCvLtcf54cwhB8
         G/3wPxiNRhLa7wd1iWFyZTQJQ2Eng+XX4m6IUdAx2HOd71G6nEz3vQJ7XsAsAaOH4Lai
         E4zg==
X-Gm-Message-State: AOAM532yUY6r5Z+s7gqhoYrE9AIbgv0aVoEY3Ct7KZKGhs1xL/7zq2as
        30byobwyWPMvlTloc3q3hflfXxdHaKfjj/QDY/cu4A==
X-Google-Smtp-Source: ABdhPJzrFA0RMW47oT1TZfT8vbCcm+x9sACMgF1v/Ljf5rP5DkwG2nhMBA54YnjxTHcR0D2HWpCkxtbA01Sq2vs/O6M=
X-Received: by 2002:a05:651c:1050:: with SMTP id x16mr1014859ljm.100.1604584420462;
 Thu, 05 Nov 2020 05:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20201028103921.22486-1-zhe.he@windriver.com>
In-Reply-To: <20201028103921.22486-1-zhe.he@windriver.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 14:53:29 +0100
Message-ID: <CACRpkdZOcObSgRDPtjxB69VeM1FEeSsPJ8SZ=RqWOT2fEN0ynw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Add missing #ifdef CONFIG_GPIOLIB
To:     He Zhe <zhe.he@windriver.com>, Chris Sorenson <csoren@isd.net>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 11:40 AM He Zhe <zhe.he@windriver.com> wrote:

> To fix the following build warnings when CONFIG_GPIOLIB=n.
>
> drivers/pinctrl/core.c:1607:20: warning: unused variable 'chip' [-Wunused-variable]
>  1608 |  struct gpio_chip *chip;
>       |                    ^~~~
> drivers/pinctrl/core.c:1606:15: warning: unused variable 'gpio_num' [-Wunused-variable]
>  1607 |  unsigned int gpio_num;
>       |               ^~~~~~~~
> drivers/pinctrl/core.c:1605:29: warning: unused variable 'range' [-Wunused-variable]
>  1606 |  struct pinctrl_gpio_range *range;
>       |                             ^~~~~
>
> Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> Signed-off-by: He Zhe <zhe.he@windriver.com>

Patch applied. I first applied a similar patch by Chris, but I realized
it ended up mixing code and declarations so I'll go for this one instead.

Yours,
Linus Walleij
