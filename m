Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FFD47A0B7
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Dec 2021 14:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbhLSNsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Dec 2021 08:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbhLSNsv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Dec 2021 08:48:51 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EC4C06173E
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 05:48:50 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e3so27621675edu.4
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDw8C0oiQt8krM7GPl59F/SHmEkDcuvz/QP/KiGHzGc=;
        b=tDq3jJ0Jfjv8roeqADo2cS65CRt1dPQigjxyfk9BrR4WFccgqyTkjbJ0da4Z9Mdtb6
         wEyiQETEG6qJ3wGHzbXQcQtsp/CSVWGm2Jj8w+v8lIUZ1TGJZUiSYSbWzzct6R/vdaKS
         h3bLapiirIA8xg2x/QLX5ubCks0y0f2maBRgbwDxR0aVyNBG2zoqkirJ1G8pG4UXdgqi
         fAn9CBg1kVz/zGMYu/xt6JUxJJ0dA9VFdPrBQRwRbanuKgN2fkjXaLcwwgzrTvvvS1uj
         Y4DeI0Z8G+3KnVQBQWzvdcUVhdOtAD/2bZe1qu+SU23LeTv1aATkay4zQhEFRykw4Mi5
         X0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDw8C0oiQt8krM7GPl59F/SHmEkDcuvz/QP/KiGHzGc=;
        b=rTt9OCxB/fs934UN1gZ0HApLVf7d/q43zAlenrWiCN8CddAJZ5Juk0tEEef7HFpNnp
         5rQIRDcH/NbHj4sXshGbUjfe4dMYv8H5e7/pl60x5K/ztZmd58v1J/BmhrW5z5xOCvX8
         PBsmE7s4gE9FvDLXuvI6GwURdR8mHrqcjClJpJqTykuDH0d78lwGzc8XXDJLLzt7yV49
         75rgCfu0g5I9ytFl0kzLj8tvS34iK3JXpip783iZ5WuQpJ6qwrZ5hVhcvEkfuleaXRqP
         xeyjvyI3XMXaukXlryDEPwCNCreSlYezrUPL4ABYhu1VPdLzEF562XIA7KpyCHNV2SX0
         WvQA==
X-Gm-Message-State: AOAM532HjDoLk/KT8cEL4sNNrzkiXKwZmioDIJ0O/P4mKAemMmTD/bYu
        TpKYCHoPeRhKd+SDczOWAaAUOGyFje4EmYlwJlS2QQ==
X-Google-Smtp-Source: ABdhPJzRohxotF39Bs+wpTjUL/P/dXK8VIR3E96T8ZEEXKcZ19/PnOSHQCC5M5ao7RmwWjnw+f+CBnuXdx+VvzpqGKc=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr11474208edd.365.1639921729252;
 Sun, 19 Dec 2021 05:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20211218152712.2832502-1-trix@redhat.com>
In-Reply-To: <20211218152712.2832502-1-trix@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 19 Dec 2021 14:48:38 +0100
Message-ID: <CAMRc=Md5xqpu1vkipN+boN-=SnC4MOkHz=Cj3UnGnvr_Qv+21g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix uninitialized ret variable
To:     trix@redhat.com
Cc:     Linus Walleij <linus.walleij@linaro.org>, nathan@kernel.org,
        ndesaulniers@google.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 18, 2021 at 4:27 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Building with clang returns this error:
>
> gpio-sim.c:889:7: error: variable 'ret' is uninitialized
>   when used here
>
> ret should be the status of the call to
> gpio_sim_make_bank_swnode stored in bank->swnode.
>
> Fixes: 83960fcf4818 ("gpio: sim: new testing module")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpio/gpio-sim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index ef6145f51c8ae..bef00dcc4dc8f 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -886,7 +886,8 @@ static int gpio_sim_device_activate_unlocked(struct gpio_sim_device *dev)
>
>         list_for_each_entry(bank, &dev->bank_list, siblings) {
>                 bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
> -               if (ret) {
> +               if (IS_ERR(bank->swnode)) {
> +                       ret = PTR_ERR(bank->swnode);
>                         gpio_sim_remove_swnode_recursive(swnode);
>                         return ret;
>                 }
> --
> 2.26.3
>

Applied, thanks!

Bart
