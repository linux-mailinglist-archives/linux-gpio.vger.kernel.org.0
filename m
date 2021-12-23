Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC01347E63B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 17:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349110AbhLWQPK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 11:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349131AbhLWQPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 11:15:03 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AC3C061759
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:15:03 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id b13so23278169edd.8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7vIhnilgSh+Fia1MLez8IlVcdelDNWzlS9+D9/jDYmE=;
        b=mpNud0kKzvR+WQ0gBFa5kVXhk7gulH24cYrsgD/5AhkGKPs+M/vEErjulnFUs6N4A5
         DQTSYiAAmncV8N9/HfeCWWV3wOT1zoTg4cyzCO/rBm+cIDzBHBNbT01fq30TcKvvsPSo
         pcyttAnrEF7653+uOBIeS6nMlCV789/lEIFT93UcWbkO2CFh5ZoaBsjOAdw3sMjYpLgY
         crFKrA5pVvE13NVOwdtz3aDkR0WZawwXvAbeRgHqCpakYKM5NxmfBsXe1Stas5jh5vSV
         WVjzwHZn/tKw7Jat9UXoeHkQ+FB8FforGzGTDIZ+qjltxs1EuNTfdzRsIQOcSDux+9hd
         GyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7vIhnilgSh+Fia1MLez8IlVcdelDNWzlS9+D9/jDYmE=;
        b=QYNYyW2wEZsShnZw3Fyf2TGiF4B+NbvxGD0HM6d6oaOaQGoaG6/FKVXntIHFc0j6sv
         Yr/mCldzxpoeTNdoBN1s5YRDRxS0MH2GXggKBXTRGo8Fj2u3irRhnW+I+aWsu4MooWBq
         QSe9I18HWH09/X/bTAAfoLxweCnFC84ZWnkDDiKYfnXt6odVqFsHuOXhtE5poR/bMiys
         DVmp4+usZdAJQCKfySVd1q4vTYbfzUpPmfQAntruteQ2CTMTfz5xtiaszCJx9OnHAVXH
         ZBkys7UFuq3C4lqS3G58yYZ0lCI5Hbmm49OLY/LeUiyxvQGFXs6rsf/NoeQNCnToFxK0
         0qjw==
X-Gm-Message-State: AOAM531thosZVOSTD87EnanM+lxhcE2IrDbt049Bdj7B7XfMo/mzCFXN
        8udSBP1V3Kt0eWtbFtLv5WgZFnEw37ZOFWwyiQkwYA==
X-Google-Smtp-Source: ABdhPJwYwGpkU4nU8vEiR/jvrZqHtdO6zYZ1DfYr7cVN1PStGTew60erncoMWe1J2wBUAQPAqvqaqzt66PNibkI8TtU=
X-Received: by 2002:aa7:dd59:: with SMTP id o25mr2597851edw.288.1640276101735;
 Thu, 23 Dec 2021 08:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20211223121606.67055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211223121606.67055-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Dec 2021 17:14:50 +0100
Message-ID: <CAMRc=McyA5n2vYLP1pSJYuy35AjGfugaM91JYxxmrmm0Lz_Q6A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: regmap: Switch to use fwnode instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 1:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-regmap.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 69c219742083..6383136cbe59 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -244,16 +244,12 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>
>         chip = &gpio->gpio_chip;
>         chip->parent = config->parent;
> +       chip->fwnode = config->fwnode;
>         chip->base = -1;
>         chip->ngpio = config->ngpio;
>         chip->names = config->names;
>         chip->label = config->label ?: dev_name(config->parent);
>
> -#if defined(CONFIG_OF_GPIO)
> -       /* gpiolib will use of_node of the parent if chip->of_node is NULL */
> -       chip->of_node = to_of_node(config->fwnode);
> -#endif /* CONFIG_OF_GPIO */
> -
>         /*
>          * If our regmap is fast_io we should probably set can_sleep to false.
>          * Right now, the regmap doesn't save this property, nor is there any
> --
> 2.34.1
>

Applied, thanks!

Bart
