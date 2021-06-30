Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EA33B86EB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 18:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhF3QRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 12:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhF3QRR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 12:17:17 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6882DC061756;
        Wed, 30 Jun 2021 09:14:48 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x16so2864207pfa.13;
        Wed, 30 Jun 2021 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgAvMFP+qrxfjOSSdXRrrMLtbz84Nhwtu91bshNexkw=;
        b=Mm3FgkghzO+j1nGqCHtJiFFm3dZgDyQbN0FI5Hwgzq4XYxSBvsmCl9p5uigkj0/M7/
         E67LJnfBWZNq69WoZjq8Mi/Fb7OZXZn3tXGdtsYMpOeciRWx8Bqhmrcc5WM9Dda0p0GE
         M/4I5Rmejm71VcN/4d8y9bP6LbgNGkzNzlj3Iy8dxlaPUeFD8l8bmy3iYvlC041ASauY
         zUhCsFg1L7ZBT7BO1vjt14LPUOyAnsHT7jxGIQveOaRXh8Lg657CwFp+LQW9I6eU/9O5
         a3RBom3Qwn52WeO6skY8Qt8jMflDKyx73ApHX2BTtU4cqKH343yG7mqHtxzPB4qo8XTZ
         4D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgAvMFP+qrxfjOSSdXRrrMLtbz84Nhwtu91bshNexkw=;
        b=a+SWvS6yXv18LW6/qMPXNvqm6MDGVu+VWDNSSO4iJN7SoPmpog0uHaHxlZfMFzobtr
         kwQAOzpFvY0z8MmWAOPbi3IJeb3NxzLbRdror2Sn/SGY4U6bgY7TjUT+sFEnSMjkuoyZ
         UrrRgSfZQQgmmrobcjwWfjfQMf617Fz8b26Oj+4+JAnA1Q6m5yqgtZoAQe99oftWlRNS
         kFri+K80IuqZ9YPivSPezp1Cic8+2qrC0Xe9YnqXBguk0XpCiQOrtPWNmCLfi7JHJIwl
         x2aUg02wKMkE6W36d92P+S/EvoIeU1G59ARIcxJqqOFeF5Te0U1TdcjyXlkWudC9xMQq
         H7Tg==
X-Gm-Message-State: AOAM531uvpoHulgnCvc++HGt49xsealREQQf0xMHh4nbGBtyjtp4oOyM
        pzoo9SA1xcSPLJo1UJZoY3MlsCXlNbjyQsYTKyA=
X-Google-Smtp-Source: ABdhPJytB5yT0vt5F3GBmKifMbacxRb58zX1c5t5Rtnm5tmWBdT7IOSB7p6dqcaNxbFv0/31qZFbuc6YKCrBSqi3T44=
X-Received: by 2002:a05:6a00:2ad:b029:303:41fb:41d7 with SMTP id
 q13-20020a056a0002adb029030341fb41d7mr36321202pfs.7.1625069687894; Wed, 30
 Jun 2021 09:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vf+8t78NbYeCh+VLEAzcYJxDP9Pz7DPW_MC9D-K_Ff8uA@mail.gmail.com>
 <1624288089-15278-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1624288089-15278-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Jun 2021 19:14:10 +0300
Message-ID: <CAHp75VdkC4vcOnC37D4iDZs3g=2K=+iTsXZX=20CK2Og6WtgPA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 21, 2021 at 6:07 PM Akhil R <akhilrajeev@nvidia.com> wrote:

> >What about doing like
>
> >      gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> >      if (IS_ERR(gpio->secure))
> >              gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> >      if (IS_ERR(gpio->secure))
> >              return PTR_ERR(gpio->secure);
> >
> >and similar for gpio->base?
>
> Wouldn't this cause a redundant check if it had already succeeded in getting
> the resource by name? Also, could it happen that if the device tree is
> incorrect, then one of the resource is fetched by name and other by the index,
> which I guess, would mess things up. Just my random thoughts, not sure if it
> is valid enough.
>
> >Wouldn't the following be enough?
> >
> >-       gpio->intc.name = pdev->dev.of_node->name;
> >+       gpio->intc.name = devm_kasprintf(&pdev->dev, "%pfw",
> >dev_fwnode(&pdev->dev));
> >+       if (!gpio->intc.name)
> >+
>
> How about this way? I feel it would be right to add the OF functions conditionally.

Looks okay, although I have a question here.

> +   if (pdev->dev.of_node) {

Do we really need this check at all? If the OF-node is NULL then it
doesn't matter if other fields are filled or not, correct?

What you need is #ifdef CONFIG_OF_GPIO (IIRC the name correctly).

> +       gpio->gpio.of_node = pdev->dev.of_node;
> +       gpio->gpio.of_gpio_n_cells = 2;
> +       gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
> +   }
>
> +   gpio->intc.name = gpio->soc->name;

-- 
With Best Regards,
Andy Shevchenko
