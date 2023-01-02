Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B7865ADD8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jan 2023 09:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjABID7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Jan 2023 03:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjABID7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2023 03:03:59 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED41F25DB
        for <linux-gpio@vger.kernel.org>; Mon,  2 Jan 2023 00:03:56 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id d14so4579031uak.12
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jan 2023 00:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh/OtqhzqgxkEWMSIJrQyOpjIevZLZpcytM4epGbWYI=;
        b=ArbOzplzY7yuTzvluvxkQU6wlDkT6Y8/eVWELenT52H70gnmjuCgC98QZa+5tFwhmZ
         BAom+RYNPaia/QFpz4sRTQRLZrj+iHC6kDQqnZ3cFvJLZ8yHG0tuWhlXIVb1yo7O8WBW
         Y7uSSGrSG/ewouLx2watzkLm4pouiDBn/LFkkHRD6OZLIiuMqn0Ez4g9O5tn1zegaJX7
         xUXPt0kbB5OQ9KCmopWp5RVeA8sphOwgPJt4TSRCnTb8f2lkhQdV8Y74ntQEpQ35x/bk
         qGjIcDp3eFUZiz7AqWY54iVRrPjY6G5EH55wbGtb5tVoqThryvpVEMvn1zWhY/BEaQbt
         SMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zh/OtqhzqgxkEWMSIJrQyOpjIevZLZpcytM4epGbWYI=;
        b=Ib487SAPYaxgbetLZp+iBroi8gnbfftSEjkSHLr1SZb2tpfbmIhC3K1mrKie/XR7L6
         0CsMP043XC9F0R26utKyqdgvHbvvdZ30UhnX6FSuDx4lLiUcERiUYayo2UsbEwchR5Nt
         hgmW99JvMobFjJswdPz5wu9OHkJTskGfQ8PkqjGMCfpwZ52hqhvBrgj02Z7K18wEG58j
         4uO7eaKpryXWJ2Z0YdelquJgGzEiHUmF6JR1Q778IiB6WMDh4Rfi+vgD4pPyo5zJAjDf
         ADnaG8NUK9zIuK1mzQPriVWiIzDD0rvfJ7+rd0oqdLWYYH8IJDsT0qCOsn/huvmUt0zX
         BW3g==
X-Gm-Message-State: AFqh2kprrk9kxqvtEnUdxRB5qCNgFFY0o+G8ZPQNIXCjjWiQdehECQGf
        8IRvatz5Njf1o26kLNZKnjow4dYwEEC0dCoCu+iSK6CqCLvDhw==
X-Google-Smtp-Source: AMrXdXuTKF/gMt4v4lS2C1DEu0HG8zfvlCfsf1zx+DSu1lKo3KlbXWfOQV/99tUFlUaWe5GCPRSKQp2E8t6bwb6ZG6A=
X-Received: by 2002:ab0:20a9:0:b0:440:bc8a:7555 with SMTP id
 y9-20020ab020a9000000b00440bc8a7555mr3756853ual.112.1672646636068; Mon, 02
 Jan 2023 00:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20221220090248.1134214-1-haibo.chen@nxp.com>
In-Reply-To: <20221220090248.1134214-1-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Jan 2023 09:03:45 +0100
Message-ID: <CAMRc=MdW5OfHPy5hmJddV65C8-eqeQSt4dd_p=03jBNR65vrAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: vf610: connect GPIO label to dev name
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, stefan@agner.ch,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 20, 2022 at 10:02 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Current GPIO label is fixed, so can't distinguish different GPIO
> controllers through labels. Use dev name instead.
>
> Fixes: 7f2691a19627 ("gpio: vf610: add gpiolib/IRQ chip driver for Vybrid")
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 9db42f6a2043..a429176673e7 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -304,7 +304,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
>
>         gc = &port->gc;
>         gc->parent = dev;
> -       gc->label = "vf610-gpio";
> +       gc->label = dev_name(dev);
>         gc->ngpio = VF610_GPIO_PER_PORT;
>         gc->base = of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
>
> --
> 2.34.1
>

I applied this one, please fix patch 2/2 and resend on its own.

Bartosz
