Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773A276BD9C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 21:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjHATXJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 15:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbjHATXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 15:23:07 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098C99C
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 12:23:07 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-486c9cd3b5eso733007e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 12:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690917786; x=1691522586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5qbiuoW7FY1Jx1NT58baux4Ha/PPnVYdcYqYkl/li4=;
        b=0/wYQ0UB8WhlBVlFPYsXAHlkxtKwF4c4COjE9KShYMCPrHhoQDM4iotxhIuIcC6j6V
         t+CpiH+tjHsUSHp+HEpnglrrGYT5H7ATtzT2gryZ/B6KByLS/RtCh9ALzPl5Khyn6AWD
         4urSYN2DNNHV2Ej4RstC3D9XLn+pb0kLfHmqZJoIC0SVJaUodAuXdc+qUGiR7mudoedN
         S6Iv3cLS2RAqx7N+k/2QcnWqT6TR+sFXUOPT4yHQ1Jh9xlnFwq4qF9fWFnOhJLmVWt23
         Q6OpDeR96eIUV9AaC7mjcD6YR9Vh7/g3mRgxmH9gMIQMpEU2eAwsaAWkJQPit7tIOKv8
         XHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690917786; x=1691522586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5qbiuoW7FY1Jx1NT58baux4Ha/PPnVYdcYqYkl/li4=;
        b=VTOi/SdH+enDYx0ZSW1QF+WvtWalms9vgSHeThbloC7P4KjdUlK3uNhNgpHa91oJGS
         PiUxPLs++HPZmft2IqlX/5hxvf9gcsxkNngGFejYUuwbT2lK1KoNvPaqavLhT3vakisL
         ns07MLsLhP37pAPIyhKYWqgSa48lzhpNcVDVPlRC8dnZ0QjCHEvo3aNXTamvW1lCiAJf
         p9wrV1qSueuxVpJz2LZ4ainL8z4wmtl3ecB2A2xzjIWyXSiAPXTvHYnyxSjixK6iyKI1
         ThqOtkPrYo8EUNiheKLTIbBD8NinVGb1kLA4JDdK7eYAop+YxS0cI4uLjCLkLc71r6on
         jfwg==
X-Gm-Message-State: ABy/qLYd7Z80Dd/CSKT14X3gmrTBczWwcGpkD9uKsBb2OKx7K4R1rssI
        0KTB9KOLy1fu+/HDjqudAIHIRAfGMtK6SWrqpdnugw==
X-Google-Smtp-Source: APBJJlE9A79RjPxGyxdQanExKYAGP9vYl8XzpeJ/GbdbXVnGwzYssX4NBP6S91aDTahljkXaFnBgJr6IqjSlWy5B/WA=
X-Received: by 2002:a1f:6015:0:b0:481:388e:b903 with SMTP id
 u21-20020a1f6015000000b00481388eb903mr2409425vkb.10.1690917786128; Tue, 01
 Aug 2023 12:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230728175914.18088-1-aboutphysycs@gmail.com>
In-Reply-To: <20230728175914.18088-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Aug 2023 21:22:55 +0200
Message-ID: <CAMRc=McH3uv1LA3rz7NXpU26R=RwsQWb6fs_ngoWZJK+iv+-NQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: palmas: remove unnecessary call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2023 at 7:59=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.=
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
>  drivers/gpio/gpio-palmas.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
> index bac10c2faf56..dd8a287ff6d0 100644
> --- a/drivers/gpio/gpio-palmas.c
> +++ b/drivers/gpio/gpio-palmas.c
> @@ -184,7 +184,6 @@ static int palmas_gpio_probe(struct platform_device *=
pdev)
>                 return ret;
>         }
>
> -       platform_set_drvdata(pdev, palmas_gpio);
>         return ret;
>  }
>
> --
> 2.34.1
>

Applied, thanks!

Bartosz
