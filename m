Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321422C87F8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 16:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgK3P3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 10:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgK3P3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 10:29:12 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA0FC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 07:28:31 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id m19so16827279ejl.11
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGbjw3VgCVVCET8HkVpqbdL8nSTX7h3rpdcHZNixdkY=;
        b=1g9kv6r4mkEEmse4afUqm4ScOQmWSPlquFl/9CFDk+RwuEY+Mmy4IuyDUKPI2nzSkT
         +lpEF3iIqNWFppx3ma4KCh++jcoyarl5TBHULLwbmPKV6pykwNkSSYvdi4D8Wr60L4lr
         Jb/jOs5NvuMtYlxVlmz7gkOVh3oKiqoLTdNrRxdxhSmUfr/y0/TnEx3cunwUGf7V6/8g
         ENubR1hrsY3S1ZGaotS98VP4QI1FRravSW7/SG9lqVHfOMJZNAQoHEByhzmCsPnbFUy8
         lDtLTbnjFnB4eeL02i5D2nQQAGxK/LtonPbxMVRsiTkH6YvFYDjRhoBCfbX97emMlixP
         LZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGbjw3VgCVVCET8HkVpqbdL8nSTX7h3rpdcHZNixdkY=;
        b=Nca4mzDqsigCwDPXei9LfhgI+uxJwl6e1+rsDERC2s1lTSIAwmsLs41J3cI78kRe6i
         q0sL1y4QYd8Ns066rS6uvwDqaxJ3NJ3mO16pyTJqf2V6vpau9RrboybXeDhnbUvEr/Js
         AIbs8M8RRfhZWYAOdumfjsiP8Djx7gYMsmtSBFW76eRfdmiSoD1Lw89F60qRcQ5lHSXL
         hbzUsIJZQ5+VPkx6hs/WHi9BcJNM+fI3RLaXw5tzz5/MeraZM6jo2eVxKjM6bhb5jfZh
         XFfYoepf25sAxUbDawxtXrMdBF4wk1Q10NG+JqrUsw+J6QEKpxv79JXa05/CkKuNLY6t
         vzJg==
X-Gm-Message-State: AOAM533BdlkorM87pF20jI6p9qbzP1jZ2SBj3hzEC/n22r97I74cTiMx
        gPaN+BQ0DEwSt0NQbkgCRkk0gzw0119Fkf3qZ4jLuA==
X-Google-Smtp-Source: ABdhPJy4I/DDpA3eOSgQiWEbS/uDH+jiFrQnPjaI1etUWEdpFOWri9ryUAEVQtXfZ5XQOHaddQfbBc/MdsMzAFx2Pjo=
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr21071938ejr.429.1606750110520;
 Mon, 30 Nov 2020 07:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20201124030606.40588-1-zhengliang6@huawei.com>
In-Reply-To: <20201124030606.40588-1-zhengliang6@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Nov 2020 16:28:19 +0100
Message-ID: <CAMpxmJU0og39qAtvDgTdhK6OweE9G0wcunFVjprbfu7QaTbdgg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: arizona: disable pm_runtime in case of failure
To:     Zheng Liang <zhengliang6@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, wangli74@huawei.com,
        fangwei1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 3:08 AM Zheng Liang <zhengliang6@huawei.com> wrote:
>
> pm_runtime_enable will increase power disable depth. Thus a
> pairing decrement is needed on the error handling path to keep
> it balanced.
>
> Fixes:27a49ed17e224(gpio: arizona: Add support for GPIOs that)
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
> ---
>  drivers/gpio/gpio-arizona.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
> index 5bda38e0780f..2bc173c352ce 100644
> --- a/drivers/gpio/gpio-arizona.c
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -192,6 +192,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
>         ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
>                                      arizona_gpio);
>         if (ret < 0) {
> +               pm_runtime_disable(&pdev->dev);
>                 dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
>                         ret);
>                 return ret;
> --
> 2.17.1
>

Applied, thanks!

Bartosz
