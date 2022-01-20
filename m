Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BC449491E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 09:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiATIHY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 03:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiATIHW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jan 2022 03:07:22 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4510CC061574
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 00:07:22 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b13so25319388edn.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 00:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woaO7V78My70o3rqLGWTSR9FtOghJlrwVnZXMxTRkSk=;
        b=IFLuHZnexJiQm8fZq0ARwF/crecN2qWLRbjHOcUfKmBhicoCik+Jb79hNuIC0YClYd
         xVvZ9t/u727NVJmivBOUjWkWHT93T4duNIBn4se01Cv8tKoqnyPVBWYrgy7VNMDfCKlo
         xss/FGwjH6pwhpEfPyiWu1v3cuVhBS/PlxvPJ4tJLqpQ/uflFO+cdpwv9BSMuS8RYwUh
         3mUwn+tsGXuRvHEewAPC8M3hdBO1JV3WTyd4zDSf5lnmzjL+Q3vAQqxv0i3goMy8KLIc
         vyfOL8XYrbxFdxOf+PUrgYW8ZlG9dcDaf5v+hkIklDSaCs5AGpx2iMj+spr0uJbjqIr4
         cyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woaO7V78My70o3rqLGWTSR9FtOghJlrwVnZXMxTRkSk=;
        b=Lx7EzDl6VRjOr0JHglXfKebEJuRUMvvO2yk+NajNeult/3eGgnaeJ3SbqibTTdxJiU
         wBs1QwTtPmoO2TMn8kTP8sgeAsbuZzzvsBm3y4Us3rYDWeH6MkZ/LbJrU4c7n2XbQ0Mc
         n+WlO3ziGM8AQyo8qF2XfGQZXLae88sGEvTnF+66uUQtlaTAD23QuMPIvC99XrpylSDg
         bAm3DffTz01aTzOUBR8h6iOcX80w9AxoDxhWqbTz+WDCxRgSdPvy3Z66CL/OJYHYPkhI
         MrQcopIWDK+3YKF9UQ4YEogrS6P99waPUaNdpQ7fs824K+rd8VxZPWbLlxEB46eR5iBl
         SqvA==
X-Gm-Message-State: AOAM532yXIKALtd1q5lxGjDe+HkvX3TR0i5cq1t8pOppHZNmcVwmaw8U
        bKJUdNfShZelEhCLolG3FcdJZHQiqjgL35BcDUO+Bg==
X-Google-Smtp-Source: ABdhPJyBoh2RFs1B8DGeSytYnFe5iCuVsXqYc2dhx84h5R8P31+AhkaRJbEpWKgEcRr5wiyCe0ZDD5hMd3ivDi5sxa8=
X-Received: by 2002:a17:906:274f:: with SMTP id a15mr27391935ejd.492.1642666040780;
 Thu, 20 Jan 2022 00:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20220119010432.65493-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220119010432.65493-1-yang.lee@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jan 2022 09:07:10 +0100
Message-ID: <CAMRc=MdNURpPtom_COQ9d7SPD5FabgLrO5iBvgXGo5-mUsiv1g@mail.gmail.com>
Subject: Re: [PATCH -next 1/2] gpio: idt3243x: Fix an ignored error return
 from platform_get_irq()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 19, 2022 at 2:04 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> The return from the call to platform_get_irq() is int, it can be
> a negative error code, however this is being assigned to an unsigned
> int variable 'parent_irq', so making 'parent_irq' an int.
>
> Eliminate the following coccicheck warning:
> ./drivers/gpio/gpio-idt3243x.c:167:6-16: WARNING: Unsigned expression
> compared with zero: parent_irq < 0
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 30fee1d7462a ("gpio: idt3243x: Fix IRQ check in idt_gpio_probe")
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-idt3243x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index 08493b05be2d..52b8b72ded77 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -132,7 +132,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct gpio_irq_chip *girq;
>         struct idt_gpio_ctrl *ctrl;
> -       unsigned int parent_irq;
> +       int parent_irq;
>         int ngpios;
>         int ret;
>
> --
> 2.20.1.7.g153144c
>

Queued for fixes, thanks!

Bart
