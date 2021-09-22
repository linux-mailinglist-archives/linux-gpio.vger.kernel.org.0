Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE6C4145EB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbhIVKPc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234962AbhIVKOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:14:37 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D67C061760
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:13:07 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id i132so8028799qke.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPqir3PMCwLRWbsWlxGfMxdAQoXzfybtd1FglQgtUWY=;
        b=alx+5Qy1dCxbC7RrEfBx2s1JD1j7w9ANmeUep0TEhejaus3kfnYOTmAwHYISpVueP7
         Y4FpqbmeXgU93zhIg8ATvzeabBQ7rIYQ1tbRS8LEcxByWiGMlR2v9IHZ18pvuwpO3m5X
         gl4Wy5oPukN22Qx+qDwAIJK+uTWimYhxQGToNL0TQV7a0FFpYYSOw4dvUnmZPYk+IH2C
         UyIQ/hpT4vWGCh6sYYgVomvI9IS85XqNSTE+A5SCvrabrXPVj25Zvl+yhsgCqJ2v7LQ3
         TVFpNl60tCec5p7M9rXo/YVywCZx78meMhDXkeVl3RqGZSXTd7bSvXVupRo28tDrlror
         oB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPqir3PMCwLRWbsWlxGfMxdAQoXzfybtd1FglQgtUWY=;
        b=QD20e0O08hTd2z44cEQW7t+viP0zK2uj/dxXZ6I+GncJkAC9RxI0FuQ3WXIqKGZe3m
         xnBEFX/ohNnFU7X9Najk7dDCnGeejN8UPEXfxocnkBU/dO7uG1oGTj4TMhBoWBUvSi1i
         RSyqRBacFFr+YgIZarKiugauJtZ7j763RljJa7WHy03NLxVB0yNaxPnBJnjAUgDfUBaK
         J4mPOwwL6DyJD72glBcyoEKOs8gep4+0wIbWfZ4piTl8EUSW10bp53P5RPOGXV/FhU/2
         Yu0+0IG1prf1yTaIbMLdDT1JGlxzg8uy+6jng+H8vIn99tsQJ/VypyAjMzIqErpXoeV6
         NlzA==
X-Gm-Message-State: AOAM533wy20R20XgJaE8ffPOUAEfdQdiW6M9i64LbN1ewFi87NJ5P5h6
        3JX/iR4bcmCilAxZEnQgmjJdUKEJGu4McfvxN/Qcsg==
X-Google-Smtp-Source: ABdhPJyDfQUHyYQZYQ+Jr8KoHaMGwJ/s4hJkk2YKHhk3qRqGjeBzU2EHfN2yR+bPUeF71OtnLZSmY3Re9GFhcobXNIw=
X-Received: by 2002:a25:32c4:: with SMTP id y187mr36435237yby.157.1632305586631;
 Wed, 22 Sep 2021 03:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210916164641.135008-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210916164641.135008-1-krzysztof.kozlowski@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 12:12:55 +0200
Message-ID: <CAMpxmJUbRu2WRWZoMyLUc=tr7Zp5juZWrTex9SRHDfzOXWmSBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: max77620: drop unneeded MODULE_ALIAS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 16, 2021 at 6:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The MODULE_DEVICE_TABLE already creates proper alias for platform
> driver.  Having another MODULE_ALIAS causes the alias to be duplicated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/gpio/gpio-max77620.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
> index 82b3a913005d..ebf9dea6546b 100644
> --- a/drivers/gpio/gpio-max77620.c
> +++ b/drivers/gpio/gpio-max77620.c
> @@ -365,5 +365,4 @@ module_platform_driver(max77620_gpio_driver);
>  MODULE_DESCRIPTION("GPIO interface for MAX77620 and MAX20024 PMIC");
>  MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
>  MODULE_AUTHOR("Chaitanya Bandi <bandik@nvidia.com>");
> -MODULE_ALIAS("platform:max77620-gpio");
>  MODULE_LICENSE("GPL v2");
> --
> 2.30.2
>

Applied, thanks!

Bart
