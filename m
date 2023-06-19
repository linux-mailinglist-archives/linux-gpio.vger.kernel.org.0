Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5B573571F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 14:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjFSMpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 08:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjFSMos (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 08:44:48 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4451691
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:44:26 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-440b4b0147bso111101137.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687178665; x=1689770665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7CKBeX87YWHS9TvTpuZmP0rgiJkHHO7gYE8rYW2waw=;
        b=LpZI7AJLhjMRHWLyGrjvb6783louHBna0u3GvsrdlRHQT6ch0ZMlFHwYrj/Vmvqbl5
         +whNFsYRb2bkr1F9pY9CJprCxiHi8U7g19O15iCXHt7IlKl/gB4XqBck+kPOGFwZRgrZ
         K18XvyXfSJ1zvma4KxwmEp2MQAf2WtcZcR4eZXTaB1cybAfTQiitvODJaQbe8+PrxKkk
         o5Le82RBEKgAzAPQB1/X1fXqkPB4y01lGFYfUlLGuVNmgdEZtKwppQnJ9fyVELe8yGjk
         9TsflDEDXf34Q2O52hoFaCmWwsqSr+yWUhlpB5P+yGL9w2wJNd2Dxo4g+WK6SJ030SHH
         6IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687178665; x=1689770665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7CKBeX87YWHS9TvTpuZmP0rgiJkHHO7gYE8rYW2waw=;
        b=Au+fBYVMxTYn+jSAaN66ACxmgD1eEDQmJQNZkJkcx5N/TRiyY+7PyQfH9mHniAGmgT
         1A79+3FaRQSFM+67puEsMWwRvIlQr/M5Z2zQ7qtHTfKyDcT8Gr+0x2ypEEWWvABGf4VF
         3ByDxRwR689/EGIDtEYX7Y2wnTBi23FOS9ADbm++fwgCbQFJ4G6lA+1EgY9G3bBsHH1c
         WSRAEZCGPf0GEPkRR40qOwytMj440ku08yB4ml1+2mV/k3KFic8UhbC1or6Oddrzo6U3
         XCzsqpcfLV76hEwu+SqT4cnEm9qLtXW3dwuTWxJv3mmfi6m3dI/eluOA9DLlD/0eETwo
         vVSw==
X-Gm-Message-State: AC+VfDzqGPA5X4hATQW2qVjybEnTdjgJ9LCUpkDMQbdo8t2gwWTL90ao
        DRkyVZbH4PAhxsCfDfsji6JO7Z373I43+Jb/aWsjxw==
X-Google-Smtp-Source: ACHHUZ6JLEcVfllJN+8HU3wxqopA6udVFcyfWqpvoHDy/5/SREzTJHQroaNRAnsOiiFMXjJqUO3BpfsYsXjAIL8MSDE=
X-Received: by 2002:a67:f615:0:b0:43f:5eb2:8e9b with SMTP id
 k21-20020a67f615000000b0043f5eb28e9bmr1100501vso.27.1687178665371; Mon, 19
 Jun 2023 05:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230615162612.21487-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615162612.21487-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 14:44:14 +0200
Message-ID: <CAMRc=MeYmriM=2QibvAo92pgyxb15CCBbMZKFKdQwHSsu0Y4jw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: xra1403: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nandor Han <nandor.han@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 6:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The of_gpio.h is not and shouldn't be used in the GPIO drivers.
> Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-xra1403.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
> index 51d6119e1bb4..bbc06cdd9634 100644
> --- a/drivers/gpio/gpio-xra1403.c
> +++ b/drivers/gpio/gpio-xra1403.c
> @@ -11,7 +11,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/seq_file.h>
>  #include <linux/spi/spi.h>
>  #include <linux/regmap.h>
> --
> 2.40.0.1.gaa8946217a0b
>

Applied, thanks!

Bart
