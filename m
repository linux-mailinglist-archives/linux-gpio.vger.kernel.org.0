Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F4263DA65
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiK3QTV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiK3QTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:19:21 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0F72B603
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:19:18 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id n191so3835920vkf.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 08:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OteFkO9esJgmiZK8aK5d5h2QBFGFHGPbQU7z1FM6znY=;
        b=ZRWTpHaXdqQOoUxtB7/+E71lLZlsOKXo3ZSyzVyFQ1Nfy7dq6Gl/CSSPz/38x5r1qH
         HM1SEK0WHC0SLVtYCKM+E1FxeSki6a4tWkirN8F/WxkyyZl/wqQVCRWwTXPvt2g8Q4MU
         NF2NIb0+SFS/sVlN+2EOMMrOw2LuAIPJoK9P2SJpRoaysZkCanklJTns5f8/kC6Kl7LR
         fFB3I1rNR+mCnzRzlqvu/Z7G9o24/FyDkNu8PGiNOqjUZqZN52wLAPVtwK1gqTW/QaNc
         W2X/+obhEcWuXhBGrSGrb4cf7XvRCeg5TDGntpE305XnW52eRR43rIH2gnrasUnZzOof
         x2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OteFkO9esJgmiZK8aK5d5h2QBFGFHGPbQU7z1FM6znY=;
        b=KFzCqI02/KcaYGR7hwC1vbfXOxxdU8MlZx3T95toLRNItPhmTBsFlNLVn8ebENhUd4
         tyJVMpgb7M7CRJvrDPFgb4LVT702YXqplhCQYaz6x/3DX2yTrXHQBjKqXbTJf0B59n4n
         nAQykVaHkAfhT5lwpr4C0RS2jMCqlhoVO8z9nA0S0IiDcFC8eFWOLE0rOJ/JxcNaZQgx
         KU6kXafdcpajPBE1bN7OAPyMpf+3qB6QZrCbIttA8Z3No0qSlnMKF8vnGQuKQcOUUCea
         L+OBOe1+SBcBQew08BG1yey0y627/Km1CFHtNhb4FvGH1eMP6l50u9pLJ8Q1XLlZgorR
         AnbQ==
X-Gm-Message-State: ANoB5pkRilobppHvPydeVbmcertuIYG+Vc7R9vtZZm6U3J86uedlEe/Y
        O8tOFw3yoG0/jlznkHZscHTtoJpdwiOky9aRDzFPaA==
X-Google-Smtp-Source: AA0mqf6EwIh79YzPkSp9qoKap4Tr05mKhK0XLr8i+w+9v9S3OB/+HQRMjqmNkyNrGwuqGwjs8A/ndLIABER0oYkmjeM=
X-Received: by 2002:a1f:54c1:0:b0:3b7:65cc:8ebc with SMTP id
 i184-20020a1f54c1000000b003b765cc8ebcmr30490630vkb.5.1669825157074; Wed, 30
 Nov 2022 08:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20221122123508.112090-1-wangxiongfeng2@huawei.com>
In-Reply-To: <20221122123508.112090-1-wangxiongfeng2@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Nov 2022 17:19:06 +0100
Message-ID: <CAMRc=MddeOwcONCLyGP+aOn0c6hBuH0seWzYFA4KPVCzx81FOQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: amd8111: Fix PCI device reference count leak
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     linus.walleij@linaro.org, acourbot@nvidia.com,
        linux-gpio@vger.kernel.org, yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 1:17 PM Xiongfeng Wang
<wangxiongfeng2@huawei.com> wrote:
>
> for_each_pci_dev() is implemented by pci_get_device(). The comment of
> pci_get_device() says that it will increase the reference count for the
> returned pci_dev and also decrease the reference count for the input
> pci_dev @from if it is not NULL.
>
> If we break for_each_pci_dev() loop with pdev not NULL, we need to call
> pci_dev_put() to decrease the reference count. Add the missing
> pci_dev_put() after the 'out' label. Since pci_dev_put() can handle NULL
> input parameter, there is no problem for the 'Device not found' branch.
> For the normal path, add pci_dev_put() in amd_gpio_exit().
>
> Fixes: f942a7de047d ("gpio: add a driver for GPIO pins found on AMD-8111 south bridge chips")
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---
>  drivers/gpio/gpio-amd8111.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> index 14e6b3e64add..6f3ded619c8b 100644
> --- a/drivers/gpio/gpio-amd8111.c
> +++ b/drivers/gpio/gpio-amd8111.c
> @@ -226,7 +226,10 @@ static int __init amd_gpio_init(void)
>                 ioport_unmap(gp.pm);
>                 goto out;
>         }
> +       return 0;
> +
>  out:
> +       pci_dev_put(pdev);
>         return err;
>  }
>
> @@ -234,6 +237,7 @@ static void __exit amd_gpio_exit(void)
>  {
>         gpiochip_remove(&gp.chip);
>         ioport_unmap(gp.pm);
> +       pci_dev_put(gp.pdev);
>  }
>
>  module_init(amd_gpio_init);
> --
> 2.20.1
>

Applied for fixes, thanks!

Bart
