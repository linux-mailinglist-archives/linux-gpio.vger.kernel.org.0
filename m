Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EFE1F74F3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 10:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgFLIAY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 04:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgFLIAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 04:00:24 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0D5C03E96F
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2020 01:00:24 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k22so6494549qtm.6
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2020 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xYHnyazKvcx6oiktPL+KRZOzioT3qEIvMI6fjShgXbs=;
        b=BG27RaLl7FuvmC5qU5wo4ULsee1aMeqmd1sslVReRMtYPxsWHNUm5OoERRNwakoEzm
         709bwkfolIi6KCsVjA3qsZO+nCd1OUyh5rZQX8Cji3wYlvwi9hDo/WNQhpQpJIP7QhVl
         x+JF95YyyQuzmDBorBxn5M84Xi/aPS2P3H+/xNBbL2aUhEZQRdMIA+qR28Vo3BoBbOyk
         94YxGuprV2rGTnhMWpNxb2xHOkhGnpb9OCf0nWyUsdBcNUxqji94F+f/KTBazXuUIIwT
         EKFj00jyu7zKFEVrD9fgUw5Hv9w83a2BuC++knBLuhnGBUXg4QIk7Gs2fZitZXhS3r68
         1Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xYHnyazKvcx6oiktPL+KRZOzioT3qEIvMI6fjShgXbs=;
        b=h3UxcxqW5M5eUfJVap7UW9i5XSFT/3/uN777avN0VfzoEACsLAy6ARoRxhzwKSQ9Z0
         uRHBf6LidJIATu/oXeG8kpQA5yuEdbHplPYghqsE5JiNv7efF7ziyNqOOqET8knO6YQv
         tg3no3LgToEZOG0kOvhJVtpQctM3YLSbUbO+c7+Th4N7pK829dRvM2K18uF3rs9W/Z6k
         JPZh0sTJ3aMWHeEMv2OenUMmfxcjVFE85Pmna4XixtlD3D0F46goFWZSHeLy9OVH/8U/
         M/k0F957UOwyxt7NnI7bHGK2l4l2lA85XGzlKq2ZDX/JzD6pQZXF4Ex3XEhqzS8VH8lu
         JNMQ==
X-Gm-Message-State: AOAM530ZEkv7/EHGj3d3kjmz9iel1Wtd6llboookjmgKp042wcTWRvpm
        qwX+v1JNAqpgtyC/rGvDsJMGydBQu3OuAXx3MckZCg==
X-Google-Smtp-Source: ABdhPJwJ3Spmc+G/ols3thU5v7DezP+CeZxDjbS74NAReXP2ceQRu6iqs8rn4ci7iLABCMQCd0ppK3jldKhvR/2HMqo=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr1812691qtr.197.1591948823593;
 Fri, 12 Jun 2020 01:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200612045034.27425-1-warthog618@gmail.com> <20200612045034.27425-3-warthog618@gmail.com>
In-Reply-To: <20200612045034.27425-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Jun 2020 10:00:12 +0200
Message-ID: <CAMpxmJUUd2+1A-3UJF+UOU5PYs33t7E3otYaO9GUTcXAT+VoNQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: fix file comment
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 12 cze 2020 o 06:51 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Replace file comment carried over from gpiolib.c with one more
> appropriate for gpiolib-cdev.c.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 58011ba88a1d..17d5541d76a0 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -25,11 +25,10 @@
>  #include "gpiolib.h"
>  #include "gpiolib-cdev.h"
>
> -/* Implementation infrastructure for GPIO interfaces.
> +/* Character device interface to GPIO.
>   *
> - * The GPIO programming interface allows for inlining speed-critical
> - * get/set operations for common cases, so that access to SOC-integrated
> - * GPIOs can sometimes cost only an instruction or two per bit.
> + * The GPIO character device, /dev/gpiochipN, provides userspace an
> + * interface to gpiolib GPIOs via ioctl()s.
>   */
>
>  /*
> --
> 2.27.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
