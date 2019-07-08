Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F0161F47
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 15:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730525AbfGHNGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 09:06:33 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37808 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731110AbfGHNGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jul 2019 09:06:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id y26so5328864qto.4;
        Mon, 08 Jul 2019 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KoMC8LXO5EEvOm3VOqkpDs92MU/5hTNIGOWZvmPTxTU=;
        b=V8CP2oM88CrqqxQemPWzixs304sty9d+wK6csQ+vtCaQYrekV5ZlstaBS7bOuqIr3l
         Mwd1CG1xU3lRAuuUZa3EHYCWeVkbAX8ZkuITw4GC4NG9Xq7nzWwhPIo5xk9Nk9Q0TWik
         Whi4alVNGxYYNv0WqGRb4kudphYuGaKL9TwzkL7Dxl5/jYZcKE0FlfmhfCKlZMKS8zco
         r+mVEFtqAtg/X22DdLEHbMhcIVjrqFoeCT1FgpFXmitMAMmwHvZhUNlQjmYgl38jcHpX
         RWj2en/j7DXVvckPefOzhnlgxVys2FUizC0RIliWrg/HeaUF8WoPjMcvbHf8VRfJESe4
         Mvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KoMC8LXO5EEvOm3VOqkpDs92MU/5hTNIGOWZvmPTxTU=;
        b=kvpLFGQ/NX7aTMNdyRcBTvwjE589GWHXnNEI9DFY7tygACampW+P4UQihzmY0EuUEN
         fls5KABEjGQKA0yuPGdqDErBN+6/fhSgYe3REO+iBFE7Ndo6XidYaYHf6q+A5JEs9YmA
         9XyFXYCNuDyQZkKxt/YNSNXc5k7pOfE9XMdthrQa51+W8h0WKRfhD9ePg93X5F3b0vvA
         nPvbKTsoWtdo5Koscx66URZXqYLGF5wNhG3yDF9RcwWS795wDS4ZyRleZgJLoxPMibm7
         HJIkEtbCz9vCkq81lAyUfXvXB1VSrQEvQUoqjceF5qGcb9q7PmpOd91HrdTyKOeALNNY
         4PwQ==
X-Gm-Message-State: APjAAAXjOKTKpdL+jD5Wadt4c2MF8NrAxvmlVI+UkuJEqm6Z9iv15+tm
        mZ+YAxSkx1RzNG1PAOWxtRXohvWb
X-Google-Smtp-Source: APXvYqyUD6Ax2FLlVZ70ZPrHkQ+xZWbVy2xkBrPkuZCL3SJk9Jo5tvbYwmHL51eyTi7DL+N3gvHSUQ==
X-Received: by 2002:ac8:1a9d:: with SMTP id x29mr14322373qtj.128.1562591190514;
        Mon, 08 Jul 2019 06:06:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id v28sm5436669qkj.11.2019.07.08.06.06.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 06:06:29 -0700 (PDT)
Subject: Re: [PATCH] gpio: tegra: fix debugfs compile error
To:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190708123843.3302581-1-arnd@arndb.de>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d30c122c-297e-3370-86d6-039388b48cea@gmail.com>
Date:   Mon, 8 Jul 2019 16:06:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708123843.3302581-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2019 15:38, Arnd Bergmann пишет:
> Without this header, some configurations now run into a build failure:
> 
> drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function 'debugfs_create_file'
>       [-Werror,-Wimplicit-function-declaration]
>         debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>         ^
> drivers/gpio/gpio-tegra.c:665:2: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
> drivers/gpio/gpio-tegra.c:666:9: error: use of undeclared identifier 'tegra_dbg_gpio_fops'
> 
> Remove the #ifdef here and let the compiler drop the unused
> functions itself when debugfs_create_file() is an empty inline
> function.
> 
> Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/gpio-tegra.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 59b99d8c3647..dbcecbe5f52f 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -9,6 +9,7 @@
>   *	Erik Gilling <konkers@google.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/irq.h>
> @@ -22,6 +23,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm.h>
> +#include <linux/seq_file.h>
>  
>  #define GPIO_BANK(x)		((x) >> 5)
>  #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
> @@ -508,10 +510,6 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>  }
>  #endif
>  
> -#ifdef CONFIG_DEBUG_FS
> -
> -#include <linux/debugfs.h>
> -#include <linux/seq_file.h>
>  
>  static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
>  {
> @@ -538,7 +536,6 @@ static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
>  }
>  
>  DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
> -#endif
>  
>  static const struct dev_pm_ops tegra_gpio_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
> 

The offending patch should be reverted already, please see [1].

[1] https://patchwork.ozlabs.org/patch/1128007/#2210871
