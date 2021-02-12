Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CB8319BF7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 10:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhBLJiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 04:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhBLJiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 04:38:18 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AF0C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:37:37 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j19so12150331lfr.12
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkQG1XwORvJeQny3T2q3qwq+3l4PlQt8nYKO7d6xMus=;
        b=vySTaqAeq8QfuWffEsQxhpwvET4VT2xrxtWRlCFKP/NoeusFFv5XShePxzCQod+MYr
         gVcBq9FppxrRLz52qfHZw26quVOmihqmU0OnI59qzWZiVSW8EndYFsZauFT755e+YCVU
         qAwb/FU0D+xXJBA711p/GdBkQBLXNDxUyE/DLWkwoAv4urJgTT+Kg7swkzFdRoDF2WYs
         CaUVv1VGsZkBMy9PJQSc7jGkf7ayPSQLH3KTNBgIv1JB95cfH+by/bSBE+Jykr2snTDV
         EhWRVfPMfy+/eTwk1KHdUNNkHrIl8Fg5rnlFm/1c+wueS+GDdYVLslz9RCcibJTMAvPt
         KjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkQG1XwORvJeQny3T2q3qwq+3l4PlQt8nYKO7d6xMus=;
        b=icSi17cSWQX5OHPQLgA4rP8qu9P/99OcVrENTGarqoGWy/GV4K80KtJ4ys16LcXGN6
         MhVwWR4xDN57T5xN/bCuH+mCCQd5Puz2snrhvmyvvotQ5ZIhYehucWvQoJQu/oVJArHr
         rFo0XGKfS9CvY9jRrVxQa6cnffI6Euz6gWJTqxmVRVSkqUCom3QtqB0q65pFHUj77zvV
         8pwpyTqNdFM5oxq90eQzC7hwP45GAqM3FR1vDnD/MahzPxRkj+6uAguiBx4VjLQ14LA9
         RwfgOcsEIYa5LQOCbCFhlX7i0laLW8w5qRimKANmlHpfmEBCwCXh/NPDWgnPjVo+x99W
         1YcQ==
X-Gm-Message-State: AOAM532lp0uDwbVXQwgu0oalntjv1sIcf6RN6/xQLI9Y6+AWvtnivH99
        dUidSWAeMgYPLS/nIPgMS0AxaoV14MSc9BerKeDO9Q==
X-Google-Smtp-Source: ABdhPJzfSMXafe7QDD8aIWgywYScz0nt1ibx1N1bfZA9Ifhpxa3+t2daf6p36bwgYGDhcAIbnuJuB55CCU1zK65sb8w=
X-Received: by 2002:a19:600e:: with SMTP id u14mr1109673lfb.465.1613122656181;
 Fri, 12 Feb 2021 01:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20210205020730.1746354-1-saravanak@google.com>
In-Reply-To: <20210205020730.1746354-1-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 10:37:25 +0100
Message-ID: <CACRpkdbWccPqqAxgPVAW0v3+6gdM9dK0EFiBsaUGgc88F1XvCg@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Don't probe gpio_device if it's not the
 primary device
To:     Saravana Kannan <saravanak@google.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 5, 2021 at 3:07 AM Saravana Kannan <saravanak@google.com> wrote:

> Dmitry reported[1] boot error messages caused by
> commit 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default").
>
> gpio-1022 (cpu-pwr-req-hog): hogged as input
> max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
> max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
> max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
> gpio_stub_drv gpiochip1: Error applying setting, reverse things back
> gpio_stub_drv: probe of gpiochip1 failed with error -22
>
> This happens because when we try to probe a device, driver core calls
> into pinctrl to set up the pins. However, if the GPIO DT node already
> has a proper device created and probed, trying to probe the gpio_device
> with a stub driver makes the pins be claimed twice. pinctrl doesn't like
> this and throws an error.
>
> So, this patch makes sure the gpio_stub_drv doesn't match with a
> gpio_device if it's not the primary device for the fwnode.
>
> [1] - https://lore.kernel.org/lkml/544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com/
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> Greg/Linus,
>
> This will need to go into driver-core because the Fixes is in
> driver-core too.

OK that seems to be the right solution. Maybe I would try to
explain the situation in the comment in gpio_bus_match
a bit more, but anyway:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
