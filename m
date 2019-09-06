Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05FF3AC0BB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 21:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731750AbfIFTqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 15:46:31 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36693 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfIFTqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 15:46:31 -0400
Received: by mail-qk1-f194.google.com with SMTP id s18so6880987qkj.3;
        Fri, 06 Sep 2019 12:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HsrQyq0fSQ6NSNordv4m3ugR52nxCtwTVlUHfUbQ0EI=;
        b=YUqGDAHkNC1LA/qFGmWHHXUhy7OgS3YOmBlvZmolATepPJ+zNPP5giD8aLLP0r1HSy
         dCIT7OwBod1u/izNfI3LKZz3oFN9Ng7NLUdiHIM6EygUgG1HoOPGQIsbpzL/NBCIsXWe
         0SyN6XKhfQ0GFs1PqfP+fXP/erND0Ab26Wvm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HsrQyq0fSQ6NSNordv4m3ugR52nxCtwTVlUHfUbQ0EI=;
        b=jUNy+oF0s5X1A74hi9z7MzEefVgDDaWYtDw5UXvIDErTJak7GLbC7qvgpPdmciNQRA
         0rTPd93SNSGe+EqRd0fv0S6Kh9WyFBGUytPQ6p5aOqovcKmSR3itj6A21YDizr/0PtcD
         7OuNopDVjPD4VvOmnaMExmcU++T51yTIpFBNGVgp6zTL/IZ1vMME8uYFSW/Jxj8r5MIt
         tFB7tHxWOw6JsEmB6IwVkj1t43spJEo8+pje2bHWekCl+0h7fhCgjCgN+mQ2bWO5+sJd
         36lX2hkXvXQE8DURFn5tGVAj4H380kSJpv1NSjGeJnb9xtKoM0VtdtMaLf5o0/effEfw
         MvPQ==
X-Gm-Message-State: APjAAAXd9iOKUVTRylVCKqjh8Cchv0RHUXFAgE6BkntIWaWG4N89rc9I
        ujey2Lf3V9avqCSV4yEwed4PmlbuXIWQJ0tRbqg=
X-Google-Smtp-Source: APXvYqwNq2ZlKzt+IPAsPeskkSnOA2qCbZo3zhZPKfOkyDsHGhfdMhr7xtW8vDKerDug2KA8rdNL44wm9pzUVYV04yc=
X-Received: by 2002:a37:f61e:: with SMTP id y30mr10837593qkj.208.1567799189999;
 Fri, 06 Sep 2019 12:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062623.13354-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062623.13354-1-rashmica.g@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 6 Sep 2019 19:46:18 +0000
Message-ID: <CACPK8XeAohB1qZsWHaxa0zEJM5jVhvV6PSj0fKajobC5HYbMtg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio/aspeed: Fix incorrect number of banks
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 Sep 2019 at 06:26, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> The current calculation for the number of GPIO banks is only correct if
> the number of GPIOs is a multiple of 32 (if there were 31 GPIOs we would
> currently say there are 0 banks, which is incorrect).
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.d.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..b83e23aecd18 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>         gpio->chip.base = -1;
>
>         /* Allocate a cache of the output registers */
> -       banks = gpio->config->nr_gpios >> 5;
> +       banks = DIV_ROUND_UP(gpio->config->nr_gpios, 32);
>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
