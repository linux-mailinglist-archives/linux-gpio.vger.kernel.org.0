Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A0047C2B7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Dec 2021 16:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239250AbhLUPWf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 10:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235958AbhLUPWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 10:22:35 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2B7C061401
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 07:22:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j21so49031448edt.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXqZoCi6bFzrtVtfX7brMYS+xGEp73oZA5ti3zFyQHs=;
        b=Di2qnlX38KdMWngxFVbSDFQfjq/BigeQIN75VnyGhGL88sn2N8bWzoZt1G5JN20YyW
         6VOuVAfyh12OGwZx8fSN3MJEAofIXI/pBDvGad3HFaARAbuQQbanJx744HGNPiETjKyC
         //Px55seoFD5lqHAdUYxkE7M3giUf+znX0082+zbVRrNH8mGkWsPerV2w2SifpvAGuXE
         mf7nr65PcIWpvqxuqVQspyqB0hmBt7uqb+Q0P7OIBqECz2e5bnig3jYOTxRewml/fFHA
         yoMBz5UfCg8IQYGel2BTWfQjzNTeA3I4/+5q8hlHlx5/2R+QLUSwNhVSLWiBWP0Q4mO2
         s8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXqZoCi6bFzrtVtfX7brMYS+xGEp73oZA5ti3zFyQHs=;
        b=7Hb0fwBKi8ZwdMVGXGhkW/3Jq8zyRx6PfJOHtiMnJKECY8PBg+r43p+D+r9ciZLR98
         0NkjOBEheGexHf9/Jm0/zS4OJrog2wKZhgpMrVY2Ej6gnCihHTOJYMvkisMFiVJXNhB4
         6QYQk8CkOE5OfUsTc0Fiq6iIrJ9KSKXP8YRNIDDm9RAvUbEQw0BflphNYaZcZPDzvE62
         a/5rwGTjWNNsGTW2cmWKwBgOfVnhwjf6C2MxhFBegHYh+j9SCOVmikeohllYYWhCaygZ
         yNPeLyN7BXYmI/5DIkOatgrMksv2/xpcct91hkQ0IU9lcJa4sMY8Dp8jWAFy+lfm09z8
         vZxg==
X-Gm-Message-State: AOAM532lHQmyKFewGxDZsywAfFlRBMQJIIHUuII/+k27KmTKHQ2iYJyF
        YQNUPGgN7LhPuUSnw12hR4k2uKJ6uD2fUMnaPLi7/BuB5ws=
X-Google-Smtp-Source: ABdhPJxC8jMk+u361VafMW+SAgJhdjljhacITgcBclmQ37kVkk1G/wIdZPndCGxJ4zNkvuTNnXEIxtopJ73Hi1pUg/s=
X-Received: by 2002:a17:906:4c8f:: with SMTP id q15mr3197240eju.736.1640100153188;
 Tue, 21 Dec 2021 07:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20211221113825.334782-1-yangyingliang@huawei.com>
In-Reply-To: <20211221113825.334782-1-yangyingliang@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 21 Dec 2021 16:22:22 +0100
Message-ID: <CAMRc=Md7xfn5-XtbVs_sEWt7YtdzMF0eUCqUME4_W6Bxv4d84g@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: sim: add missing fwnode_handle_put() in gpio_sim_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 21, 2021 at 12:32 PM Yang Yingliang
<yangyingliang@huawei.com> wrote:
>
> Calling fwnode_handle_put() when break out of device_for_each_child_node(),
> or the device node reference will be leakd.
>
> Fixes: 83960fcf4818 ("gpio: sim: new testing module")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpio/gpio-sim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index ef6145f51c8a..520ee923b516 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -444,8 +444,10 @@ static int gpio_sim_probe(struct platform_device *pdev)
>
>         device_for_each_child_node(dev, swnode) {
>                 ret = gpio_sim_add_bank(swnode, dev);
> -               if (ret)
> +               if (ret) {
> +                       fwnode_handle_put(swnode);
>                         return ret;
> +               }
>         }
>
>         return 0;
> --
> 2.25.1
>

Applied, thanks!

Bart
