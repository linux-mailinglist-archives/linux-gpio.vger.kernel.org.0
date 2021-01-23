Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4F93018BA
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 23:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbhAWWvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 17:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbhAWWvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 17:51:00 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86E0C061786
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 14:50:19 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o10so12595464lfl.13
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jan 2021 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FMoc4rlspXDa8RwRSPjCdNzMvT7gR3rZeQf96XBACU=;
        b=pbHIGHcB7/lNJJmV0AhwRirB26dYTxu3e31nG5k+1V883Fo3serpCHGlkQjvptzw5V
         jgt+5itvcsdHXwk6ot4vFnyGEHAS+ojZseTkdpm+/KgcJyCqR0wcd4X9ZzF9YqCBRWo5
         jHdgu/hAV9UMV1H6VqC/qljA6s23hMAvIDlLgLI9w+m0U/3080Pudx5ozHB/diXy/fHy
         NDPjNz61WrHQE+PBQnguw3uKznYeJeMWwQmKnoVxNNAV72/1GN4Ep8r43BVvGwvLPuP0
         FqVg19A3UAINYsplzs5ty+R5Nlf4DRxAqlrD8zNVOw1innEqLSKe3o3vd5CS2uBqCNDq
         PXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FMoc4rlspXDa8RwRSPjCdNzMvT7gR3rZeQf96XBACU=;
        b=j6giMdxCMJSTK1vKECH9XRjmo8csX/zb+dd80QyvpLD0+NbnOq2p1IKif4O48FV04R
         czdZt4jKOh4P1FhbipuHgyzoGgeIuLUDdIKwJ4Fh7/YceG3JFyRWeSwcIIl9wlEyQqxn
         x8pns45dAQwLnWfHii0B+r/8UnhQJRPPrPyPUMGohOCuz4nDCVj8ZLRE37m3UMhzuA7S
         Ew3GZst7MCd4W5EOMPDgv8dKfkz5mqw6c0HWbsLxZNVSog1GBbBTYzWAy6ScDpQktA4v
         oVfw4dLHQDKpIQ8w8Wn10YWnxUMeyY4SwXsAe1UohQDorwXmbG/UNxFRr+igwORqvlaH
         /bag==
X-Gm-Message-State: AOAM530PGb9Z4Azcc07w/aevlwpm2b1OfA47B3XvjfDEXv2F8vtY7Uxx
        nNGDqLBlQbQqFqrwoyXw8oyxJnc1idpWNYMN7FZouA==
X-Google-Smtp-Source: ABdhPJz7Cj86RdMSh12IrhlVXOFnQOdiRQMmkZvBPn+guW/2OITi8G0VXT9ofQRUB8w1pTsH++NbMzf6BCL3BQx5gEM=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr826516lfe.29.1611442218331;
 Sat, 23 Jan 2021 14:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com>
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 23 Jan 2021 23:50:07 +0100
Message-ID: <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> This small series adds modularization support to the gpio-tegra driver,
> i.e. driver now could be built as a loadable kernel module.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use debugfs_create_devm_seqfile()
>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>   gpio: tegra: Support building driver as a loadable module

As these three patches clearly make the kernel look better after
than before:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

However when we are doing this I would strongly encourage you
to also make a patch implementing remove() so you can insmod
rmmod the module at runtime.

Yours,
Linus Walleij
