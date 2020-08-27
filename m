Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53573254EFF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgH0Toz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbgH0Toz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 15:44:55 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3E7C061264;
        Thu, 27 Aug 2020 12:44:54 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m34so4078771pgl.11;
        Thu, 27 Aug 2020 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNHVdsTXYC3wpdLaoIN+ttZuD9TkzPFpNA7QYNjRfwg=;
        b=k+f/FlyE/QHVsJBm3tH/yJMeqsG6wDl/zGApefmkd5AGeYAFv0rRUvjRq/tLwXZtn2
         kU4aB6waZZ+1TYd3NxK5toMkceumUUiixm5g0hV56w3Z+xrv2arQyMA4vzBO1W65ThWJ
         F9h61PZtSh3JShXFypZdRYvwlVGG2gELYtIlRoLDJOUaos6WjbuOKm51IzFmR9CO8Wz5
         +s20egSkAn9mknU1BDmobXGwlu+5TBkyZxrroFFSnED2A2PWNkZOTssevUDV9/QUDcuX
         74mAoBv+wZLfkBmTOi4PbssgkUp1EUJpvoIj9yipMs5qeJ/ztERUsiJQhS7hivP8XSmn
         eU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNHVdsTXYC3wpdLaoIN+ttZuD9TkzPFpNA7QYNjRfwg=;
        b=kN5Qlsk0sHpcFJ02U19Cuo2W+1IFIexN8NFkg6GeBfJwEuBMKYlHEKU7sWrTxeQpJo
         OT369S0MGIpJaC4qBAgzFAHALNdptoN8MmiaFi7+bRxAMCQZ2vfsyGOXeymRM/vTF+M5
         E3finiT/AutJ1aadzegTbO7MehrIDSBR6dMo4rlwSpbHQPf/3JRwk24INC/KEAh9zhqi
         9COhByfvKekJvHZ9WbUVWHOvjC41mEvTJpcsMrmVQnTGO/ZjfDTKXleoRZQpYFwWvHhq
         cZLu0TsL3E73q5nWdaj2XAJcZbiRDBbQjDoQPBeTPElectKLJDYFdBTvoSoxKrdH567S
         ib5w==
X-Gm-Message-State: AOAM532RfoDCG4TmBeEWIe7vfAki5PyJ8HySQY4XhljQQgFpMbxPXR/9
        Xa835rn54wN+E7/U9JT5rVjjbbSFrwDlPJzbEnY=
X-Google-Smtp-Source: ABdhPJy9rMOJJg95f08A/rhRr6Wh1/ONKqI4RrXCp3Z9TcyKNK0bNCOweJt5NuXMeF03quWXhjQJVDb53LjkIwajT/8=
X-Received: by 2002:a17:902:b194:: with SMTP id s20mr17766208plr.321.1598557494459;
 Thu, 27 Aug 2020 12:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-28-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-28-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 22:44:38 +0300
Message-ID: <CAHp75Ve5YgDNvtqFC8-zPgPQminR+57iWjGveaK-Ddxhj7FuWA@mail.gmail.com>
Subject: Re: [PATCH v3 27/27] Input: bu21029_ts - Use local 'client->dev'
 variable in probe()
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

On Thu, Aug 27, 2020 at 10:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> 'dev' is shorter and simpler than '&client->dev' and in few cases it
> allows to skip line wrapping. Probe function uses '&client->dev' a lot,
> so this improves readability slightly.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v2:
> 1. New patch
> ---
>  drivers/input/touchscreen/bu21029_ts.c | 37 +++++++++++---------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
> index 96c178b606dc..78e256254764 100644
> --- a/drivers/input/touchscreen/bu21029_ts.c
> +++ b/drivers/input/touchscreen/bu21029_ts.c
> @@ -334,6 +334,7 @@ static void bu21029_stop_chip(struct input_dev *dev)
>  static int bu21029_probe(struct i2c_client *client,
>                          const struct i2c_device_id *id)
>  {
> +       struct device *dev = &client->dev;
>         struct bu21029_ts_data *bu21029;
>         struct input_dev *in_dev;
>         int error;
> @@ -342,37 +343,33 @@ static int bu21029_probe(struct i2c_client *client,
>                                      I2C_FUNC_SMBUS_WRITE_BYTE |
>                                      I2C_FUNC_SMBUS_WRITE_BYTE_DATA |
>                                      I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
> -               dev_err(&client->dev,
> -                       "i2c functionality support is not sufficient\n");
> +               dev_err(dev, "i2c functionality support is not sufficient\n");
>                 return -EIO;
>         }
>
> -       bu21029 = devm_kzalloc(&client->dev, sizeof(*bu21029), GFP_KERNEL);
> +       bu21029 = devm_kzalloc(dev, sizeof(*bu21029), GFP_KERNEL);
>         if (!bu21029)
>                 return -ENOMEM;
>
> -       error = device_property_read_u32(&client->dev, "rohm,x-plate-ohms",
> -                                        &bu21029->x_plate_ohms);
> +       error = device_property_read_u32(dev, "rohm,x-plate-ohms", &bu21029->x_plate_ohms);
>         if (error) {
> -               dev_err(&client->dev,
> -                       "invalid 'x-plate-ohms' supplied: %d\n", error);
> +               dev_err(dev, "invalid 'x-plate-ohms' supplied: %d\n", error);
>                 return error;
>         }
>
> -       bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
> +       bu21029->vdd = devm_regulator_get(dev, "vdd");
>         if (IS_ERR(bu21029->vdd))
> -               return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
> +               return dev_err_probe(dev, PTR_ERR(bu21029->vdd),
>                                      "failed to acquire 'vdd' supply\n");
>
> -       bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
> -                                                      "reset", GPIOD_OUT_HIGH);
> +       bu21029->reset_gpios = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>         if (IS_ERR(bu21029->reset_gpios))
> -               return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
> +               return dev_err_probe(dev, PTR_ERR(bu21029->reset_gpios),
>                                      "failed to acquire 'reset' gpio\n");
>
> -       in_dev = devm_input_allocate_device(&client->dev);
> +       in_dev = devm_input_allocate_device(dev);
>         if (!in_dev) {
> -               dev_err(&client->dev, "unable to allocate input device\n");
> +               dev_err(dev, "unable to allocate input device\n");
>                 return -ENOMEM;
>         }
>
> @@ -394,19 +391,17 @@ static int bu21029_probe(struct i2c_client *client,
>         input_set_drvdata(in_dev, bu21029);
>
>         irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
> -       error = devm_request_threaded_irq(&client->dev, client->irq,
> -                                         NULL, bu21029_touch_soft_irq,
> -                                         IRQF_ONESHOT, DRIVER_NAME, bu21029);
> +       error = devm_request_threaded_irq(dev, client->irq, NULL,
> +                                         bu21029_touch_soft_irq, IRQF_ONESHOT,
> +                                         DRIVER_NAME, bu21029);
>         if (error) {
> -               dev_err(&client->dev,
> -                       "unable to request touch irq: %d\n", error);
> +               dev_err(dev, "unable to request touch irq: %d\n", error);
>                 return error;
>         }
>
>         error = input_register_device(in_dev);
>         if (error) {
> -               dev_err(&client->dev,
> -                       "unable to register input device: %d\n", error);
> +               dev_err(dev, "unable to register input device: %d\n", error);
>                 return error;
>         }
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
