Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9B2732B31
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 11:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243614AbjFPJM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 05:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjFPJMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 05:12:41 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171B23596
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:11:52 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-46e87ddd0f1so157612e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686906711; x=1689498711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oqvpHuky3o/OIEpfkiGgScVkGrIGuIy6RNzuijY+qs=;
        b=rUCLzO1b7gZ+tVZY2Ct4fdtj3f/CwHfzUlX8hvEakDwWDZvbkYuuBW6oM/wtCBjaqT
         8JjmJUJqclevQMtyFwyZR5ayCmUZX2L3hFVZq2wuItRX2vloqO5mpE8NVyrjS9coVhGV
         lNeGMv8u72nCBo2604qfV7Gor8nB5a8GcjHf9OhmEzd78EYAEXX4X6gJIRSe22YsIqcg
         DS1dDs+nKkfZKyjFFgEysbpRFdMi1pzxThFmlKQjv5U5VpNuaX4iBi8kwxU/Sf1hFEaP
         4UOVP03FGvupsRCS8HzwuFMfwYKOmKWiiT9/teQqlI0duu1AYQXDgfz3KWNkAus0pGyb
         5hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686906711; x=1689498711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oqvpHuky3o/OIEpfkiGgScVkGrIGuIy6RNzuijY+qs=;
        b=bZ9UPKrBwZ8WwiDteVKo8jC/lnB7wvqu/qifruDJWspBNENDolsGBMmBXo+R/WCQbs
         V2EoGE43qihiG7ldYvANIdMLVzmqFpGR+kMxtM+X4BY2SW2ZdJs46K2gqH5+bejl0mx5
         xUiNV7IWFlzCqn4hywOkvBSG/VNJ8qdDYPJgJEps/B+RW0aW67SEiMm++3gn8BzFWK3i
         YAXFOZXpBGYwpJ3PJaacP6n/tlR5KHjvZ3Fqw5epbnf3QrPrgsOzUz6b8YVdV/M7mqdI
         EZWtkcDCXWK9irhAixBrJ+sn5ZMgf411g8Xhsdyx6iFxulU4IROK3C9yVKIgJdLxetzz
         mQAw==
X-Gm-Message-State: AC+VfDzxqu9mYDkMjvMNKIXwme6YuuAcQSxYPxUi5KjPG5muhGq0vQpi
        XtE0MLdcJgG8TJkkU4lgTLQm3AVzdrZ1ubzgOpbhGk8pFchvEIWZ
X-Google-Smtp-Source: ACHHUZ5WPbVfg0vbv9rDKDvOk3h+oGuMTyDAnPBcoyCX3HySRPLHmIG9VA2BXI5ZQ+CPrJvQb/NXObIGmtkRGZ263IU=
X-Received: by 2002:a1f:5e07:0:b0:46e:97e8:f68c with SMTP id
 s7-20020a1f5e07000000b0046e97e8f68cmr1561546vkb.2.1686906711172; Fri, 16 Jun
 2023 02:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601230200.6128-1-msmulski2@gmail.com> <20230601230200.6128-2-msmulski2@gmail.com>
In-Reply-To: <20230601230200.6128-2-msmulski2@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jun 2023 11:11:40 +0200
Message-ID: <CAMRc=MePZW6NGjav1VcW1uDxfk0Zy=yypurPz8kmUkR8V0LMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mpc8xxx: latch GPIOs state on module load
 when configured as output
To:     msmulski2@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michal Smulski <michal.smulski@ooma.com>
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

On Fri, Jun 2, 2023 at 1:02=E2=80=AFAM <msmulski2@gmail.com> wrote:
>
> From: Michal Smulski <michal.smulski@ooma.com>
>
> Qoriq and related devices allow reading out state of GPIO set as output.
> However, currently on driver's init, all outputs are configured as driven
> low. So, any changes to GPIO confiuration will drive all pins (configured
> as output) as output-low.
> This patch latches state of output GPIOs before any GPIO configuration
> takes place. This preserves any output settings done prior to loading
> the driver (for example, by u-boot).
>
> Signed-off-by: Michal Smulski <michal.smulski@ooma.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 3eb08cd1fdc0..6340e738c912 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -375,8 +375,12 @@ static int mpc8xxx_probe(struct platform_device *pde=
v)
>         if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
> -           is_acpi_node(fwnode))
> +           is_acpi_node(fwnode)) {
>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +               /* Also, latch state of GPIOs configured as output by boo=
tloader. */
> +               gc->bgpio_data =3D gc->read_reg(mpc8xxx_gc->regs + GPIO_D=
AT) &
> +                       gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
> +       }
>
>         ret =3D devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
>         if (ret) {
> --
> 2.34.1
>

Applied, thanks!

Bart
