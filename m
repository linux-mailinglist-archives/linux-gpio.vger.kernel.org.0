Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87C576EB2A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbjHCNts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbjHCNta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:49:30 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E8E134
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:49:25 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-4863f6ffed5so375053e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070564; x=1691675364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FTnkuiyw6oyXLfkeT6q4OKZmgI44rWYNxEVcdGfXdg=;
        b=Zmx7X77YzbCpIb2UJwbwfAC+lZoCywITcC2dp3R+nozh2lC64AV3AAsVmZh6aNrL11
         NfcjippJknGfH0gHOi7cvRjH8Y0xuAa7PWvXn2F6NGBniAz5FLmjwWKCTwmuf9zwf+vx
         CoC0RkV7MrzL+sPHW5I4TLpI2jUVXz38Sv0rMyZzU3hbmdOO+99fpoW5Q7DwrNdKmYy3
         vPSP179HDUKwJUcemHdBiNA7C5DQCeS6DVj7VEfs6vOwI1wAAq8RWSDVCuvmCV2rBokz
         75R7UZTXxGnMa8XxXNbzgg5da06+V7UN5x+7nqGhuroEO9y71SfRKFwhIY/Ts4e83N6L
         VDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070564; x=1691675364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FTnkuiyw6oyXLfkeT6q4OKZmgI44rWYNxEVcdGfXdg=;
        b=ciVZKCTXNZCf494LHW12kO2VOiCuBup1QTiWJ4e5fymgOa5rfixZfDqXlKQxKv+5jW
         xiZ36bK8yay+jBUfgsr+GsP3QizFnjCQUAG7JytC+KrcaU5LdXxeSjYXhslM+eTiUCBp
         BVl0D8PrKIDfhK40Uybd1XJWAUNbVCZJGKKsK3azAEOZRcSa6g61ytLVDLPrAv88lkZu
         Uw0wvqliCKdq3muAj56L6MWascD15x0PDng4THbrgvar1m2gCBnL2vZ4AGI1/A3kowKo
         vkAOD7FJocL4wMkRxj51Te520hkVi9cpMKuFuMoSlRhujMahaikQR+RVKHzNXW+ou8wc
         51eQ==
X-Gm-Message-State: AOJu0YywO5S+2iUZKsqeciiFKP0UmwfSJVIeLri40XweN72BmtGqLY/J
        qf+aU+ztCZbnMDVVa8G+V9nO44u+20kf4+4Sz5x90wCstR3oaNlACvpEmQ==
X-Google-Smtp-Source: AGHT+IFSEwm7LD44G6C1nF7AB2mKR93w0HAivZKZJg9fXi8/xQChQJ7RGMiK4sjtcAJrP7vdFm9CvWWoD8/x5fdOhvA=
X-Received: by 2002:a1f:4cc5:0:b0:487:1774:405e with SMTP id
 z188-20020a1f4cc5000000b004871774405emr79241vka.11.1691070564266; Thu, 03 Aug
 2023 06:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230801204606.9738-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801204606.9738-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:49:13 +0200
Message-ID: <CAMRc=MfAAHtv-jjW_u0OWX_byho+QY+khPKTuW8iRjmKX3S6Qg@mail.gmail.com>
Subject: Re: [PATCH] gpio: zevio: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
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

On Tue, Aug 1, 2023 at 10:46=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.=
com> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-zevio.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
> index f0f571b323f2..2de61337ad3b 100644
> --- a/drivers/gpio/gpio-zevio.c
> +++ b/drivers/gpio/gpio-zevio.c
> @@ -176,8 +176,6 @@ static int zevio_gpio_probe(struct platform_device *p=
dev)
>         if (!controller)
>                 return -ENOMEM;
>
> -       platform_set_drvdata(pdev, controller);
> -
>         /* Copy our reference */
>         controller->chip =3D zevio_gpio_chip;
>         controller->chip.parent =3D &pdev->dev;
> --
> 2.34.1
>

Applied, thanks!

Bart
