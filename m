Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FAD35973B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhDIIK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhDIIKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 04:10:55 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490EDC061760
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 01:10:41 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id e14so7234555ejz.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2YVthnjEf/a8GPOi8SrqVUE1vyVxElaU23WIQYqb2HU=;
        b=x/0c8Ccil2LJsxXwwB+e/85lG9nnTuQYOdZBaDebs2t+KZEvYo3zVbxW0Za5jhnKVz
         V/2deepKoQmyCQagA0AJK10gwd1SKf6D4A6wbwgpI+JX79sTWwUUwrqv6kI0hmDJnKHp
         QEHB5r2Hdgb38sFvdFqEN5e8Bt3fHjdHCvA1IzLsuGt9VAJt86DVirgVrnoiOFVcvr8n
         kn27zqdEU6T1DKivsyTDe8++WRNQiSLSBTvaWDAcS5fEY9pSCDwk/5IlM1PgFuYRX/SU
         gqTQIVUzfdjSllccfCrAB+JeM0HefnzM0x1JbtV3CF0EHUVXUK9Nvm/ONXStmpOMgCbN
         3NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2YVthnjEf/a8GPOi8SrqVUE1vyVxElaU23WIQYqb2HU=;
        b=QubcV8S5O6VTrtOjjKZByPx91acbNC1Ak31w7M6driTU4rvUygLRjjRr3FDEeci2py
         jSYYuQgWrdq6UeY6HJZImgyoY9VWa2JKH5pLM7vJpUnS61cNbt+0W7cqDrAfxF4+h6+Y
         bSDKrIUZvAWpVVhdHqQagsRge/gy6FQqtRof76wqz8RDEt6CG9BsIWUwTJvztITqJYbq
         codR64nMk+oDtp5dE1wYAMzM7MwW8erVfHUHBIoyD0ehtg/64UA1h5pvNxJXfL1rQkXS
         c1poi6fAs+vqw/yguqPO/cGrWYAFrG8/bj261exUOfRDbx2fexV0QTqe+eyztcQvRsQG
         gvEw==
X-Gm-Message-State: AOAM5324QlMrhjYh4dYhulrsbx4fjiF9W/OwW8sjAgCepCKfvBftBF5q
        +fZl+TR3Kjo5onVaLD1Otlx5b99vBblK0wPA8nXq7w==
X-Google-Smtp-Source: ABdhPJysFMEKbL+MDsFNOhdnzV0UPwuitsyOKi5Mukeueoq/WaW9+ctP8vakiL7x3WUfqFtXHGc4rgybxJ1EMfkdkhc=
X-Received: by 2002:a17:906:b20f:: with SMTP id p15mr11727815ejz.64.1617955840044;
 Fri, 09 Apr 2021 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210408155506.12636-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210408155506.12636-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Apr 2021 10:10:29 +0200
Message-ID: <CAMRc=MdPYxvwUtG2LhOkqGMj1fttnJ8jv+15GeoSqqkLKdmM8Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: sim: Initialize attribute allocated on the heap
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 6:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The attributes on the heap must be initialized before use.
> Neglecting that will produce an Oops in some configurations:
>
>   BUG: key ffff000800eba398 has not been registered!
>
> Initialize attribute allocated on the heap.
>
> Fixes: 3f0279eb9e37 ("gpio: sim: new testing module")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-sim.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index ea17289a869c..92493b98c51b 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -284,6 +284,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
>                 line_attr->offset = i;
>
>                 dev_attr = &line_attr->dev_attr;
> +               sysfs_attr_init(&dev_attr->attr);
>
>                 dev_attr->attr.name = devm_kasprintf(dev, GFP_KERNEL,
>                                                      "gpio%u", i);
> --
> 2.30.2
>

So writing tests really serves a purpose, heh? :)

Thanks for the patch and QA Andy and Naresh, patch applied.

Bartosz
