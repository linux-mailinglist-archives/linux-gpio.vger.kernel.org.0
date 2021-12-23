Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EA947E62A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 17:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhLWQJ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 11:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhLWQJ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 11:09:26 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29C8C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:09:25 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id o20so23193404eds.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAWRTJ/Vj93VeXITSdxDCkG1NaXY20kZz97z8hvTV2A=;
        b=lzTtd0XAQGASGsI8HT0L6xI7sHKIWM0wpQphdu0pQ0zq5+DZ8xBKI8qn6NIdY/cSsm
         JMuSgjbl8zVr5NEqDVDGzXqGvJkt+5dnjm7tvvB3vp7l51aaU97pZy58jmPrZn4wXW0x
         cILb5AEdN8rElgnrmi4lv7CsWg1DrP+f8ku6q6e77qQcZJ894hMzrslaxA7QDNE7J0h3
         k90O13DxhVjEe39yQtOhfezOktKcFn4nOvWCr+oUAcKRCUUd8PMTVfhxHZPU/6cG2rfZ
         vbepAe+N2tt82KLPmDkNYbG5QoCgUlqvSqU4oKk5PpWYkfE+3FI6GEZWpmOHXy1bnvXJ
         AL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAWRTJ/Vj93VeXITSdxDCkG1NaXY20kZz97z8hvTV2A=;
        b=Ze134e9t2mIDnBtNCrbNzgKsrmtYeK7YkmnNmaso82lXBqhq/X84MIJw3aVuuyqe16
         DuQAY5Y4uAmdgE0vwrf0OnU3GoH2xIiTAbVUlxbVAyYO6SOua4ZtXSYLYxuKbfbDyomp
         Kh2KJbAGjgUxu9qzWP6Bk1IqZirKS182tk59Eg5d9gXg/iDR9IqIb3LeAqBxIWm99jGT
         6U9+gaO2uWdVsbTqa0HoABvZpXsCryU/8C3kwAqUrKjtiKB+u1xP4RrMiwbqqxAMQWnM
         QYoCAJ/PpJTwlU/FTusBFJJ9JFjXZQ4xOyHc9HalGKLbwtvXRbTTuYi84qgbNGl/ZvWg
         Isdg==
X-Gm-Message-State: AOAM532HM6mSCXItNRnqr+xeEnsMPDdm28G0+/YioZXZMODlVO2vhVFC
        Cug6NEpgPeMGZ795Gmh98PnjjjbnvLT1d6dCET2l6A==
X-Google-Smtp-Source: ABdhPJw4ZZf850jerNDYpWjONxPDhjw0UTMb62rjpJ7hddvU+uHiW/skylf/g82SITQP+P4RMMhUsvAX61g46kE++eM=
X-Received: by 2002:a50:9556:: with SMTP id v22mr2506487eda.69.1640275764209;
 Thu, 23 Dec 2021 08:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20211223131538.88768-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211223131538.88768-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Dec 2021 17:09:13 +0100
Message-ID: <CAMRc=McGmpcNd9ccq9qvAh8p9mYwhUDAsin=ttE_DS0v-Yurgg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: brcmstb: Use local variable to access OF node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 2:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We already have a local variable that contains a copy of OF node pointer.
> Use it instead of dereferencing it again from struct device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 176c264bb959..74ef89248867 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -704,7 +704,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>                 }
>
>                 gc->owner = THIS_MODULE;
> -               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", dev->of_node);
> +               gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
>                 if (!gc->label) {
>                         err = -ENOMEM;
>                         goto fail;
> --
> 2.34.1
>

Applied, thanks!

Bart
