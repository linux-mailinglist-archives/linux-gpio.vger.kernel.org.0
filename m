Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7B945055F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Nov 2021 14:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhKON25 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Nov 2021 08:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbhKON2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Nov 2021 08:28:34 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CA3C061202
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 05:25:35 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id x15so71910615edv.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x6SA1RRfPRQsyPoxGMHruqyhNm/ud8FtPEsb7q99xAA=;
        b=HsTLOFEHoVqdXzo2g9yYpRz3UHtI7vR6zXlVLrnfleNah5CX6l3Oj2fXz2YhS0id2i
         Vi0yZiNiQgz8v3OHGlMItd4JY7+XmfCX6mTiHICp1eCimqLgfbL5EA/AcLCJHJZmVFuI
         VtJDZXuSLTtE50Wl76NGyauY9WiP4OWTYZW9oJsofjFap8MqCwNNtLJ4gdhLpR+Q3GF/
         vCOZP9nbUeUP7pxXG/Nfg7HVlwYBdlyqilCE2tF7PyAHZc4Fui3XZoHsRxwV2aJjHMHK
         li8rZWPJOoAFC3NEkQU1fmMXdy54f3Dy5xEdh7/KiuqgJBe/CRPLxs7JMiKnvVDUg+bV
         gu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x6SA1RRfPRQsyPoxGMHruqyhNm/ud8FtPEsb7q99xAA=;
        b=J9QusxC/YQS3wX+j/+Sb3USzlWuLWVi3BaIPCDcOVEmHJWYf1LCbOSh7bkSYVPrIWY
         TC/+v0d+DsnAxgl0oUtZ6jTIC89vdbNIgfmTNZKhOJ9YQX1yLmh4Ex1a0+V0HpqQK3qu
         OICw4ZqXYPhltteRZLxdw+q7OABVUEKcn0iUJ/A52pKSYlMw6hcfIFFQ5QVrShXoRDbo
         pBd+ya8s7BxqQby29eXinR+ElCXjGu7AWUGI1IU/tSbtY2gsjaR8klxFpyQmBB904iXB
         UpGyBghhg+rWR1hLBTOOz2CbpsNsdoPHrUTtywBh1kdxbp2XtLOlQkfa3qD4Kb5iJ4sp
         iqSg==
X-Gm-Message-State: AOAM530mtJGfE1wxEuOfz0kC9Xh+G8AihAzaWMWsLdUD2TVzKkQmVGvF
        cdVezrey075nqaBctlw4F2U0eFVZmygGQbysE5YkDA==
X-Google-Smtp-Source: ABdhPJyaC521tT2BTB8Z5L9QDooodl4iPZm2LpVpGe626jrcmpdc+jZsnaeDMKL14AYvz/H5qbzuqPgs9WbCslaAVqk=
X-Received: by 2002:a17:907:1deb:: with SMTP id og43mr48620799ejc.189.1636982733866;
 Mon, 15 Nov 2021 05:25:33 -0800 (PST)
MIME-Version: 1.0
References: <1636344232-56537-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1636344232-56537-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Nov 2021 14:25:23 +0100
Message-ID: <CAMRc=Mess=fKf7ez=0eAAzG8e7iwCC4CJgQorzVDu7LBBPOXbw@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: virtio: remove unneeded semicolon
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Enrico Weigelt <info@metux.net>, Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 8, 2021 at 5:04 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./drivers/gpio/gpio-virtio.c:437:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index aeec4bf..84f96b7 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -434,7 +434,7 @@ static void virtio_gpio_event_vq(struct virtqueue *vq)
>                 ret = generic_handle_domain_irq(vgpio->gc.irq.domain, gpio);
>                 if (ret)
>                         dev_err(dev, "failed to handle interrupt: %d\n", ret);
> -       };
> +       }
>  }
>
>  static void virtio_gpio_request_vq(struct virtqueue *vq)
> --
> 1.8.3.1
>

Queued for fixes, thanks!

Bart
