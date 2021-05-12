Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FD737BBC6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhELLaK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhELLaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:30:09 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D06C061574
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:29:01 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id h202so30230600ybg.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oYW19CtIYX5b303IOQcUpayuvfixsQxy2ywXap3Gdw8=;
        b=Wj0OwZiHkM6iRX5HATAPY4QjiL19CWgBhNUCmTbESC8KXGVWxuOQ4faOLt9qDhMruz
         ryQu0gae6t1zldbjD7Avs4M7FFVelazppGMwNove7SVFlkI7zQbAviqGnxdOqRi10zZQ
         h3pZ3s04LdoMze7oFWPOIr/YD0AvFTgw4+JiREWY9XuIAtae62ZFO2QU8iEinc86GgYS
         gc4pfVGhcDxegiHbqaZMI0P5lAWdfQbwuIvYDz5cG3nD7mDnI6xMks8ajyorINLak/80
         UzGKR5PPnbSHZRcHux+8Dwqo6vM9+jG65cpt6vCaOVKkkXWCfu4Isny2qWnIbbnOHAl3
         ly/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oYW19CtIYX5b303IOQcUpayuvfixsQxy2ywXap3Gdw8=;
        b=Rj9yCP6WJXz98qGYvFvNJVLSI91elQ/xULl1kCXcHUb50ARfGGH8S/8+oA690lTGMn
         TpG0mFZUmIE5HFbY00LdV7PBeTj5UCYJ+2TW9Rg7OoZZRw8ttkGS9o6hOitgs88CFJN4
         x4+79+J9vAMRLCRmex1RDG40eOrnvBGPAny6Q2RfzqFdAuTeAmVqsvz1WCQPMKf8tZDn
         wMWw8LCUKcYEi0cLkm1A/r1yIAG1fX3k/ieDt6vCwxxt/IEgoj+IqISJspIsaEImAEJL
         JekuZy/MizN4oOJAGmBoBYpTXnpd1CKDHkkUiMedHZrAQ+aCToD7BDUXnYE3uCR7kSWY
         nHyA==
X-Gm-Message-State: AOAM532Xa8g8CJ7PdwVMId20s9mgxYfwYnnVDaBrIEC6pBNjhGJKvrQ2
        pFIwSxlxk+N/kht5hWujrASVJfF3QQS1V4H4WE0F4w==
X-Google-Smtp-Source: ABdhPJwWtMZXoSwSYR+0ZdiTaVOc7tWGTRp9rkRLD3gw7rnAptbJhgCV5tVck4DFUGDCsMQj112BK3NUqSifyozJc/Y=
X-Received: by 2002:a25:cb96:: with SMTP id b144mr41691498ybg.312.1620818940410;
 Wed, 12 May 2021 04:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <1620789467-15227-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1620789467-15227-1-git-send-email-zou_wei@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 May 2021 13:28:49 +0200
Message-ID: <CAMpxmJX2dt1=_yW14df5tpEiRN0_LAgLdamNx+3d==CRxM6s8w@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: cadence: Add missing MODULE_DEVICE_TABLE
To:     Zou Wei <zou_wei@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 12, 2021 at 5:01 AM Zou Wei <zou_wei@huawei.com> wrote:
>
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpio/gpio-cadence.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
> index a4d3239..4ab3fcd 100644
> --- a/drivers/gpio/gpio-cadence.c
> +++ b/drivers/gpio/gpio-cadence.c
> @@ -278,6 +278,7 @@ static const struct of_device_id cdns_of_ids[] = {
>         { .compatible = "cdns,gpio-r1p02" },
>         { /* sentinel */ },
>  };
> +MODULE_DEVICE_TABLE(of, cdns_of_ids);
>
>  static struct platform_driver cdns_gpio_driver = {
>         .driver = {
> --
> 2.6.2
>

The tag should be just regular [PATCH] as this driver has been
upstream for a long time.

Applied for fixes, thanks!

Bartosz
