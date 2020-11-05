Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3A42A798D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 09:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbgKEIjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 03:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgKEIjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 03:39:51 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A19C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 00:39:51 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id u4so895978pgr.9
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 00:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PJqANW/D4IblfNphDRTs8fI5+NUHEvuxttHnliayJ2A=;
        b=scmOIk27+2KH2d43/KT0JfcS07f0ysqHsTn/HerZ8ji+H+DYnZ1Wklk1lUK8v+AMmp
         JcF+PO0d2TRf3wMcAa8XpVDBGC26tbERnJV96empEJh5OPxmj23Vkrc/uLN7Zqmw5cmA
         2nBtY7idAQwn9DULFgP6dpS5SkZIR5JPWG38q15bqpbE4es2i/PNSZ/ZE5y8Kbq303Yb
         /2/h+2iIpjEzjPaJQg409YEP+a6CMVX9QOo8G2PO3AAdhmagpot+Btv9Nj/3DTmzkNWz
         zsYTdv2aXwXHT607wD0Fd6Vy1DW4R9h9gz9Rw49MyBly3EkbBnQLhLb+tocl/J0rLaWM
         +JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJqANW/D4IblfNphDRTs8fI5+NUHEvuxttHnliayJ2A=;
        b=FdgryZFDf3GKBvW/e4Qq3OUd06fJTpWPMYicuTvdqci8juaqLWPl09sV9gPp2whLuO
         uwF84KubIY4jKZxIgic5Sw9TC8lw7KKu7LlBMTKemcRmiUoQbXMkZZRlWfW8OEugxZ1y
         ZyyA0zMURDM0yic+9A5Mh8Xq9fYJD/B9pLA8xEO3VZMonjiJO+crNidjFqBtuKzcg1cI
         NYgQ55L1KWvupwAdqVArRZO5VlXCoVOab6Wds2LWGa7hmAKTGR6q73OElkAhhS2FuyjH
         jUkdnSM7ZqihRcpG+Q6byqFeqoacUfuxmEnnBT9jOL2h/HQW6GbvAYtTiAfIs4+4OOmW
         DetQ==
X-Gm-Message-State: AOAM532B1ZQcJSF5TfQMj7RKF9kOUN/l2m6pJLUFa99lBwLVJdOZySSI
        6xTa/Uf6cFSQsWVVz8n1mdDh4UmMInqdYQ==
X-Google-Smtp-Source: ABdhPJzIzisIqwS97IpEcSLQyDuUlDWqVf2QWEwDvwjnPf2wBN72YUGl+V+OGDgRsGkanZSDZfThxA==
X-Received: by 2002:a17:90b:ec9:: with SMTP id gz9mr1397565pjb.105.1604565590806;
        Thu, 05 Nov 2020 00:39:50 -0800 (PST)
Received: from sol (106-69-171-141.dyn.iinet.net.au. [106.69.171.141])
        by smtp.gmail.com with ESMTPSA id w66sm578766pff.171.2020.11.05.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 00:39:50 -0800 (PST)
Date:   Thu, 5 Nov 2020 16:39:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Nicolas Schichan <nschichan@freebox.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: gpiolib sysfs access when CONFIG_GPIO_CDEV is not set
Message-ID: <20201105083945.GA23079@sol>
References: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 04, 2020 at 06:26:54PM +0100, Nicolas Schichan wrote:
> Hello,
> 
> Following an update to the 5.10-rc1 kernel, I found out that trying to
> export a GPIO using /sys/class/gpio/export fails with the kernel
> reporting a message in the kernel logs:
> 
> # echo 41 >/sys/class/gpio/export
> [   46.761394] kobject_add_internal failed for gpio (error: -2 parent:
> gpiochip2)
> sh: write error: No such file or directory
> #
> 
> I have tracked it to the fact that I have CONFIG_GPIO_CDEV is disabled in
> my kernel config: Enabling CONFIG_GPIO_CDEV made export work again.
> 

Hi Nicolas,

Thanks for the report and investigation.

Just checking - the CONFIG_GPIO_CDEV defaults to enabled, so you had
explicitly disabled it?

> Enabling CONFIG_GPIO_CDEV and commenting all the code in
> gpiolib_cdev_register() except the final "return 0;" made the issue
> appear again, leading me to think that the issue is related to
> something that is done cdev_device_add() must be done to fix the
> issue.
> 
> Looking at the code of cdev_device_add() I was able to determine that
> the device_add() call made there is required to get the gpiolib sysfs
> export to work again.
> 

So the sysfs init, and the remainder of gpiochip_setup_dev(), relies on the
cdev init to perform the device_add() - I missed that :(.

> In the end I have done this (which I won't even pretend is the proper
> way to fix this), and sysfs attributes are finally working without
> CONFIG_GPIO_CDEV:
> 

I'd prefer this dependency was made more explicit, so I'd be inclined to
relocate the ifdef CONFIG_GPIO_CDEV block from gpiolib-cdev.h into
gpiolib.c by adding helper functions that call either the
gpiolib_cdev_register/unregister or the device_add/del dependent on
CONFIG_GPIO_CDEV.

I'll try to get a patch out shortly.

Thanks,
Kent.

> diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
> index cb41dd757338..dd72bd0e4af4 100644
> --- a/drivers/gpio/gpiolib-cdev.h
> +++ b/drivers/gpio/gpiolib-cdev.h
> @@ -16,7 +16,7 @@ void gpiolib_cdev_unregister(struct gpio_device *gdev);
> 
>  static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
>  {
> -    return 0;
> +    return device_add(&gdev->dev);
>  }
> 
>  static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)
> 
> If this is the preferred solution I can send a proper patch.
> 
> Best Regards,
> 
> -- 
> Nicolas Schichan
