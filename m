Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50568735724
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 14:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjFSMqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 08:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjFSMqI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 08:46:08 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D413E9
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:46:07 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4717a1d07fdso363722e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687178766; x=1689770766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeXj0XRmxJkhMzDEa0RW0GnXbzKNrynleouz0bB/HXs=;
        b=kB7uzqcL3a4UrpAckq6QwAXK4QA1lOuxNUwc3EC7e0At4W47ImySk1/5ghPXKGKQeu
         AT8WVDITFsOQAYMKTCBpaCtcfhp/vBvwlOlY0lWq4I6ZJIgUAsk4i+m0VawO5z+iMXyi
         M4cLdkjPRtpVNJJRDfuQfenoaDvyslLyvPwIOhR2EN1r6z5ZuAKYm7mucuuSmEA9Wfgw
         vQQrfIjtc9JUcu+Ax0uuWWrRSbtt9yvdwcAWhdYGdhlUUEDkHx28FD5FEoLeL1mBaY87
         OLkS+Xayb2ISPQtDoGsQDNWdmd0uwJMnW8btRtQJJLmDLyqwa0pALrOwBZRXJEgVjCrB
         5SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687178766; x=1689770766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeXj0XRmxJkhMzDEa0RW0GnXbzKNrynleouz0bB/HXs=;
        b=DDk20AYOc9T7f5MC3XTEjjNxVYGKqsdk58FU4q0/bftvTVfJb05TPRL9YTfOCJt2fN
         PxLaGEahxnpRGRzmxYl6X4tTSlC6g2C80xdUcupabyx4d1NC39sd3Rq0CaYemha83UQi
         Rf6VYvSvjpNoPXQEwe+0kVquaV5FRXakJcdqs080VIEmCFA8jXhkkID/weAhLvNZiPbh
         pIz2FHpz6ujlF6t8OB4CrgNgsLXk9TP6qRWly2GdPDqpLVfoR+qK1GH0CH/yGfNPOcF4
         THb9AYHpqJOYrPgCm7k0KE02ejrFyVGk8xIQtChA3d2GnaW0+yeQvkdBUtkary+OKpUE
         bsOA==
X-Gm-Message-State: AC+VfDxBHLMz2GSADjVPhDIYRiCUaXcF6MtkPwJwBdAQfhE78ZuhkYT1
        pe9a9uBadxCdUWFAPxfbnJEosbyiW4cs/o8c1Ov6Fw==
X-Google-Smtp-Source: ACHHUZ7GeLaP59fWXOaUs5eMlNC61ZGJ3dYv6uJ/4i6HbzzZwVqhg6xWaRnZAwvnpEslgLGiCeVGGqZzppCiK8xjXcM=
X-Received: by 2002:a1f:d643:0:b0:46e:9f33:adcf with SMTP id
 n64-20020a1fd643000000b0046e9f33adcfmr591169vkg.11.1687178766631; Mon, 19 Jun
 2023 05:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230615162519.21244-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615162519.21244-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 14:45:55 +0200
Message-ID: <CAMRc=Me_PtAO9EERaThvQy=8=4nHYBNbth5h5WH0Hz5=GFbF0w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: lpc18xx: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 6:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The of_gpio.h is not and shouldn't be used in the GPIO drivers.
> Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-lpc18xx.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
> index d711ae06747e..ed3f653a1dfc 100644
> --- a/drivers/gpio/gpio-lpc18xx.c
> +++ b/drivers/gpio/gpio-lpc18xx.c
> @@ -14,7 +14,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_irq.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> --
> 2.40.0.1.gaa8946217a0b
>

Applied, thanks!

Bart
