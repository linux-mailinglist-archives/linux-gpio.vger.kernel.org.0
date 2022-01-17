Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BE2490955
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jan 2022 14:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbiAQNTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 08:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240177AbiAQNTU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jan 2022 08:19:20 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1A2C061574
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:19:19 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id g22so18965123edu.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 05:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WA6O0qeBhGhPwH/1DXGtARWpn1Ethl8enza48mvpDME=;
        b=7vC2x24eRoH0fBUdpLVkefTTwvqFXA2+RACJcTNHHK4vyWpYsNvPMQgCeHaxeph6ql
         Q+HlL2qY5gFdX8CpBwNpkV0g+PoXcD5y80UKqWJm5vey19fnOYUCsk4Yv5vk6CUkauW6
         Kwsbb6PJRF6JeWTDco1QGyjYouyO4WwFMFpiqiNJwBnL4FJAGYxe96kkIbLAq2E8J+YR
         5CPfURHfsApId5+ZmRQ8uwevuu3LzKu3gOna8Js9qJMMOeicJ+5pK4gc43xYYCq16Ta8
         nmDSeh0z9Q1YOvFhh57OzG3ZyKSztXIecIdaPYbrDZ6mSAMmzIWc6sE16/rE1Ia6yIqg
         st4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WA6O0qeBhGhPwH/1DXGtARWpn1Ethl8enza48mvpDME=;
        b=ucN3jYz35E+X4sQgqZqh43aaUYYGMrHp5YjY0TkEO7c9IS37WDE3jujgf4th+GRUFj
         zP4dyT8hha99B6c6yNrI/hErR5rBxf+Aj0mLCuSy1SsqpRsdBAtNBS+N2JCOSqMMeIni
         lBwXMyt2d/KziHS9jUXCKRCeE1pls129Tjv700H0F0PfaMKTvouXqaPTG2+ocfNAGdJi
         zdfBHzySGj/ZXoC4LMayB0oa4UV8+7RHOecYQJYOPt9AmBBtOS0L4XAKSoKSSsASM7jA
         SjqB6lMZtGN6q/pgxHNMxSK41Q1ackUe6V/QfchE1u7Wa+yOBBEt9tjrEfWk3dvCZu/Z
         1sBw==
X-Gm-Message-State: AOAM533TSz6l0deauAfWT7hnFca3UiQMzxUAv9tBXe2scaNoC457wTGT
        01FI1DXHn/F30OoaHa3Yb+Esty4WsV1KiAe9GOhhMA==
X-Google-Smtp-Source: ABdhPJwKeAG7GJeyJiPIuuiKwQjuKRUqemslYzsrPGDH9sdNKvixEeCA0L2AWM5kfq2h+f9Z+OQTjino+HtnnYR6140=
X-Received: by 2002:a17:906:c1d8:: with SMTP id bw24mr6273843ejb.286.1642425557886;
 Mon, 17 Jan 2022 05:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20220114064821.20200-1-linmq006@gmail.com>
In-Reply-To: <20220114064821.20200-1-linmq006@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Jan 2022 14:19:07 +0100
Message-ID: <CAMRc=Mcfoi+yRK7-AZehEPtT68_GPMmn1J7Kt4TzTTAMvL_u7Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Fix IRQ check in mpc8xxx_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ran Wang <ran.wang_1@nxp.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 14, 2022 at 7:48 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> platform_get_irq() returns negative error number instead 0 on failure.
> And the doc of platform_get_irq() provides a usage example:
>
>     int irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
>
> Fix the check of return value to catch errors correctly.
>
> Fixes: 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 70d6ae20b1da..01634c8d27b3 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -388,8 +388,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>         }
>
>         mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
> -       if (!mpc8xxx_gc->irqn)
> -               return 0;
> +       if (mpc8xxx_gc->irqn < 0)
> +               return mpc8xxx_gc->irqn;
>
>         mpc8xxx_gc->irq = irq_domain_create_linear(fwnode,
>                                                    MPC8XXX_GPIO_PINS,
> --
> 2.17.1
>

Queued for fixes, thanks!

Bart
