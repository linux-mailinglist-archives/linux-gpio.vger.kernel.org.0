Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF1E254EC0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgH0Tgs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgH0Tgs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 15:36:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A051C061264;
        Thu, 27 Aug 2020 12:36:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls14so3126459pjb.3;
        Thu, 27 Aug 2020 12:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ke5yyqqtl8us0ow8oEZVTNWbvOyB/nHqrjexBTWQnvA=;
        b=YpIanO7zFbItXLB7EaPN8bX+JDw32avJcuxnnDdI8RenvwGApz79MPkWlV+VZStUmp
         jdbD352fFm7O99X6u1nNSDC6oMi37hQeLeV1AvrpBPBt4ZFez++eiUsiQyHkPIqR6QUm
         txg+MqbWo1S/KYeoy2IRwZtG28dCCyrTfaLkU/g3x/tLOMCRsUY6AC6ZiOC5EsEUtoeV
         g3uRsRonaNcd5Vt8CTouOei/6kZvi4AwSUKAAXxdcNc0Wi3sQ811TRDG+xFYR0wYoNt/
         NouIZ939qAN9TEiUlNF8440L1ph4zVTzP0eIxxfHpDBcuqubZJMo8Io3WqX34CQymBU3
         kiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ke5yyqqtl8us0ow8oEZVTNWbvOyB/nHqrjexBTWQnvA=;
        b=YnO+FKehftDkbGLbAPO5cOOooEWpmx5IU39kn8uBr/jOj7J664Zeq6rVqlEJjO9zLj
         /VPPMcNF8Beyn/kXtEmA9JwAIC3ZjV1H+xCXGBaCjwQNGBS8dVuK+s7Ff+nBAH7F0M5h
         49QwjPI4Y07wYXkEvSiMnFS84MZp0f7ZuGIZO3EkaQ5O6y263Q3gq11hXGGnAVXilRGs
         g5vRkpiIpa5XFcJYauhHu7cwYFbWAdKt/eMyHhILK2Gn0qzGn+K3lT39C7eKr07oewx1
         olMIMYq8NF8zmFepWlJQkGD5tdjmsLj4e3aop8alCKuK1qIrysGN9QxyWVOrA7ct5ezH
         Fa+g==
X-Gm-Message-State: AOAM533E3chxELR4G+RyY0A81Qf9hxjsBe0B6oPJF8zibjTCIRbS+yyE
        ESiZw0xaO0sgV/gMA+4A8acNaubOOXFKuWeqMRY=
X-Google-Smtp-Source: ABdhPJyYZeRTQpQ9QXlOyza2ROrAzb0tXRZL6K3ZZ9+7+uei4M2kCgIieIeLEOWP+hSDa5/wO+lGXUxjpNUqnNOLJAA=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id kb11mr327752pjb.181.1598557007584;
 Thu, 27 Aug 2020 12:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-3-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-3-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 22:36:31 +0300
Message-ID: <CAHp75VfFMv9kMi0skDmNVm2kdqh+PvvXJOeZzePuPfvLpGNiHQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/27] Input: gpio-vibra - Simplify with dev_err_probe()
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
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/misc/gpio-vibra.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
> index f79f75595dd7..13c69f173620 100644
> --- a/drivers/input/misc/gpio-vibra.c
> +++ b/drivers/input/misc/gpio-vibra.c
> @@ -113,22 +113,14 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> -       err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->vcc))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
> +                                    "Failed to request regulator\n");
>
>         vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> -       err = PTR_ERR_OR_ZERO(vibrator->gpio);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->gpio))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->gpio),
> +                                    "Failed to request main gpio\n");
>
>         INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
