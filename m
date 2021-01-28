Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C95A307E60
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 19:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhA1SqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 13:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbhA1Sm0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 13:42:26 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AACABC061573;
        Thu, 28 Jan 2021 10:41:45 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id s24so5680735wmj.0;
        Thu, 28 Jan 2021 10:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IeQk9Bm5UHRTKeS6UO8qKp6fU92/FzG/Ja1mgTxLr/g=;
        b=f9PSDkn4r+FpnxeZSoYeL4NHDYtFAcyjzFI4e6WZRjwQA0/x3w4kgwhT9PRw8W5tS6
         UE5NMWgtmD7/3JSKGA9MU4SNSGCM43aaiP3CWfBBwMV2cM2TzBN6T1ow65ztCkLe2Oeg
         Om1qmk1CofznNOVmyCW+ClT+dZNdib2REsCbwilcLlnPpCkA+t6TFLJV77u2gLRmPkrJ
         6q60mTQZUBglktPVOc+141lSbBdoFtICTYcEXiRUbSXh4C+7v2hNtLHqcABay93IuBgx
         WKbWBfvgVzxmg+kB+gomc89UfpZ54YK2TWT69xRtrNtJOxj2ZQOWPLTfsDRWxE8UDzb9
         buNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IeQk9Bm5UHRTKeS6UO8qKp6fU92/FzG/Ja1mgTxLr/g=;
        b=Xlh6bj+8tev6oHnK9tudA87jsvbrXYmnVqMG+pV+qNfsY2/MykXzde3wVd0BBYySNL
         /s53vOxVlgXNfqG54YwLTCnMHFU7s4X/g9o87IIrX1qxhMKIPj0WN66NZa8/W5xV2din
         xS5wmzznut4KavoAJ4s0agGS1s1YJY/bGc30/cJ9NNEGsMBdcXCi2xi5ZheiSdnNrOP3
         3GtvKg8owe9HpGApXa1NcotMpelSkYp0ef5gXQ07Eem5VhikoM7TbGbIu+/uqPtyXskZ
         IvOnYoBtbyFtKFIqqGaDo4mrihvhDewv2rniOqu5KN6Thlt+WnrtZEe9krAoxCAQBMJg
         SzXw==
X-Gm-Message-State: AOAM531rTBe6DPvE6cgmLtLsJVDLG3vAeeBFIz2Hrdw35Cy1wsRtw/sh
        zZssak1FBR0SJnfWCKvYQNQ=
X-Google-Smtp-Source: ABdhPJwKEqtsLdnSZd5ExGb+mla7qwP7gvmwItzDK60Op/TOUH2pp2IrYI+NjBWkxsFspxe42N4vEw==
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr593147wmj.20.1611859304521;
        Thu, 28 Jan 2021 10:41:44 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id 36sm8217645wrj.97.2021.01.28.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:41:43 -0800 (PST)
Message-ID: <9f9fa52ea829c0d09d186c45f93aa165ecc18a12.camel@gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: ep93xx: drop to_irq binding
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 19:41:43 +0100
In-Reply-To: <20210128122123.25341-5-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-5-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Thu, 2021-01-28 at 15:21 +0300, Nikita Shubin wrote:
> As ->to_irq is redefined in gpiochip_add_irqchip, having it defined
> in
> driver is useless, so let's drop it.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index dc88115e34da..ee1cb3b894db 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -337,11 +337,6 @@ static int ep93xx_gpio_set_config(struct
> gpio_chip *gc, unsigned offset,
>         return 0;
>  }
>  
> -static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned
> offset)
> -{
> -       return EP93XX_GPIO_F_IRQ_BASE + offset;
> -}
> -
>  static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
>  {
>         int i;
> @@ -429,7 +424,6 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 }
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_level_irq;
> -               gc->to_irq = ep93xx_gpio_f_to_irq;
>                 girq->first = EP93XX_GPIO_F_IRQ_BASE;
>         }
>  

-- 
Alexander Sverdlin.


