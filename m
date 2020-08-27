Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B213F254ED9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgH0TkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0TkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 15:40:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA48BC061264;
        Thu, 27 Aug 2020 12:40:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y206so4283042pfb.10;
        Thu, 27 Aug 2020 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NNNdt/4IjrgeOPMBhjOnJXYG1tUOBVWjd9cyVGLK4Nk=;
        b=LbdSMOENXvFM9Vf8hMQa1ALOjAVqgPlRFgCgAzQErHfM/ZWavrBZ0jLg3IfENhqGI6
         fAxGkQyDyPfFBQoQ/aQS0jCiMsS9kjiseaKHJc1Omx+li9hsqFGQcngFD8nVyweKMW6M
         7uUdyX3+djuVN3TlXt68eCbNxpa3ZvppO1E7B71QrFBu34zRZoSpt2AVZM9UJdxJFVBr
         iu2D6pM4Ijhe3nQRHK8JY7J1K4wVPC5gnAgRlEryBtqCv1BIamlzQBFP2/KVjgtf5R11
         jbfMJ5wCMmHLevsNsE0Rhm6D0BuPk1/9LPAtgv23S8ipSXAvBUoS+BYjAc+w8grWMFTY
         vK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NNNdt/4IjrgeOPMBhjOnJXYG1tUOBVWjd9cyVGLK4Nk=;
        b=GAUHazf/r6vLV6A/n6GIiHoqwFWbS1QRDtoNGRZOQQWNiiV636VM4sj1vjhTF8f+4b
         EyYlRi4QYUCCdHTnPBCtgU29X2OZAhggiybMF/0B1IInA0nJDxPiaYbjj03P/WUuqqZd
         nYa/sVYoDotJSkLooca6hWVJAuYLsg4MscsxC+kdN9B4DdkT7dyrqYR92zhGrjRK5CQe
         RmD3kZ+F/kdVb8lHqYE+Tr+j0DY42RlpPzZNxdrKlToZcBgpgZqc1zeGiTm+MGDp1LjV
         xcmtdEfvVY3ICFi3JugrDWPhseHN3q6Zczath5AwCQnMCL+3wPPBtzSv+1MSTPVKkEo7
         6jyQ==
X-Gm-Message-State: AOAM531u0rPbmtM+N2zBRL8WoJDPd9WUsYqIacRCVJ0NaZ3Yz9aAzDe9
        WRnvUEjpYuESED0kJExJBeTeThJaxUo7Px7au/4=
X-Google-Smtp-Source: ABdhPJzgixu1vjkCNUr2jBeexjL3Lla0KqgLVgu2GOiUo2aGg+shPIPNzlSqdusuUrrHVo6T8NYqCpbdRKbtzA3DXTE=
X-Received: by 2002:a63:c543:: with SMTP id g3mr8366423pgd.203.1598557173833;
 Thu, 27 Aug 2020 12:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-5-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-5-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 22:39:17 +0300
Message-ID: <CAHp75VfAn8oCqgXOWhsixZSs4FTkDACP3+3CgDdmQkPKQJg1aw@mail.gmail.com>
Subject: Re: [PATCH v3 04/27] Input: pwm-vibra - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 9:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/misc/pwm-vibra.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
> index 81e777a04b88..45c4f6a02177 100644
> --- a/drivers/input/misc/pwm-vibra.c
> +++ b/drivers/input/misc/pwm-vibra.c
> @@ -134,22 +134,14 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> -       err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->vcc))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
> +                                    "Failed to request regulator\n");
>
>         vibrator->pwm = devm_pwm_get(&pdev->dev, "enable");
> -       err = PTR_ERR_OR_ZERO(vibrator->pwm);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main pwm: %d",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->pwm))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->pwm),
> +                                    "Failed to request main pwm\n");
>
>         INIT_WORK(&vibrator->play_work, pwm_vibrator_play_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
