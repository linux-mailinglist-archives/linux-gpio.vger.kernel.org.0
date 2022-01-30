Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5F4A331B
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346554AbiA3Bpj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbiA3Bpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:45:38 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A09C061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:45:38 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id w81so7542492ybg.12
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uw4/xNy31L60PeAYoaTx08lKgZC5rftRwUKjFGv8AkE=;
        b=tUz6yv4nnM13q3QRtGhfz5JZKmJDJKCJayFVMN1GWXxDf9wC149WSHKlV2b4fXAKz/
         6bp47C+2vjSYT/QW7roPZZEAYF+k3gK8EpryQEmXNG34XH5JXkPEBQRBoBNKftbDq9++
         ggArKcQeCwjVmyUR4jObgmEIfqIuDeIIYKKSkgwu3HKGa4ZS1kx3qDimG/Pk1rx8Bzm2
         4+eHpXQNvGYIbKUNbR6wxrDoXg6X/J290yRg5r5UlqRfxam9p8nSZGOcFBFz9/PwoCkb
         HGto3fPASTjXdu9+0kXDqzXA+37uvQG5Eborzf/e5q9g5qm4jiBb7HxKvlKl8Zt+t2Cz
         3GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uw4/xNy31L60PeAYoaTx08lKgZC5rftRwUKjFGv8AkE=;
        b=V4Eb2/2WenOgCKv2HIVsiXxjf3K9xuhZZN4V7c9x5KeAYYG+zVQUlDYsBP380qto3Q
         ZC+jaY3KQs05bCyH/JqE4E6mXNSru4qvOy04tmIPojbQM04NwIzvVR/BQXskTVBurg1x
         fEfwO+mHIegRuQmhLt/nK2Yx+MlRIYxExIvWBc0/QrOexOfSV+JX8TS/gSrMplO/V+9l
         5rWhXT+CekJs3DMOKFsyNzRAvbCkCMofdehlKjh+5SSXb6y4LqA/cKMd99lWqGIUFhqI
         8bqOdkGCPH9jiOYh6wq6KpNn/3YNiBTNzlXle1d1BaxisuOzAaREXvh0pe27pLj6MU4+
         fIzw==
X-Gm-Message-State: AOAM530590q3XI5Z/shQxZxO1Mx/G2YERUGDHuuE15UfCQmV9ZVlXeBA
        rktZwtiDOd9CkV6IXCuTb9YH4+4vTPZXiXV+Kv50zA==
X-Google-Smtp-Source: ABdhPJyMOAl+Cm7wCNxSKGxZQyHKCOAoCIjtYTDwACBI8b1zcj3xybi4lodeQQLAjtTz0wcBr+CaQ6N6NfMA0NwrOIc=
X-Received: by 2002:a25:5143:: with SMTP id f64mr23722825ybb.520.1643507137678;
 Sat, 29 Jan 2022 17:45:37 -0800 (PST)
MIME-Version: 1.0
References: <20220117062557.89568-1-julianbraha@gmail.com>
In-Reply-To: <20220117062557.89568-1-julianbraha@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:45:26 +0100
Message-ID: <CACRpkdbm_MgQ2+9HTBcXjh=ASgyT+baEMwi3qBfxfc6r7xZZLA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm63xx: fix unmet dependency on REGMAP for GPIO_REGMAP
To:     Julian Braha <julianbraha@gmail.com>
Cc:     jonas.gorski@gmail.com, noltari@gmail.com, f.fainelli@gmail.com,
        rdunlap@infradead.org, rafal@milecki.pl,
        linux-gpio@vger.kernel.org, fazilyildiran@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 17, 2022 at 7:25 AM Julian Braha <julianbraha@gmail.com> wrote:

> When PINCTRL_BCM63XX is selected,
> and REGMAP is not selected,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for GPIO_REGMAP
>   Depends on [n]: GPIOLIB [=y] && REGMAP [=n]
>   Selected by [y]:
>   - PINCTRL_BCM63XX [=y] && PINCTRL [=y]
>
> This is because PINCTRL_BCM63XX
> selects GPIO_REGMAP without selecting or depending on
> REGMAP, despite GPIO_REGMAP depending on REGMAP.
>
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig. Please advise
> if this is not the appropriate solution.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Patch applied.

Yours,
Linus Walleij
