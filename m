Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34A9A76EB6B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbjHCOAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjHCOAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:00:12 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1839F2737
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:59:52 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4475615e245so354637137.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071191; x=1691675991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXejeogT44CvMRFZcVxAgJA+pWX/CMhrg1uL9d5DJmA=;
        b=JFvuVuQNyBApG4nYhdIEettjyn/Uh2VPJDZC1V3R+qH4LCnpq6+h+IcUzfc2a8dsjH
         B7JntkwQdukDeeNwuelogdLrU5fSXLYNnbZRm5PJaDrfNJ8/X4UZKHXPip7ZHruuD8H9
         pWKn5LdjXWNXBJHGvBsM6sLfnyVTFe4b19tHpvWbBGIODexdTdaURHisp7PI80LZXP+I
         5yMnZdfj5rDO2GQTK0CJvLn9S+qAqJjGXpwWRaOrx0BQy7Xrti5QqVhdKH2rOatcTj5v
         803AH/3LefeYhvTco3EPgq6pHmPMipDcfor4FaYE+YzTZ6R80d7JjM0DQ3eJSfkJvZ83
         E/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071191; x=1691675991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXejeogT44CvMRFZcVxAgJA+pWX/CMhrg1uL9d5DJmA=;
        b=TPUIzjTF/AttxjrHmH1oTYz8ZsjiDV+HgHY9GOp47dB4wS/7eqWw7yV5SIx96oyDNM
         Lq/1NApwo2zCdviZl11tE15ewfmEs9BvKdW/86ovWbm5UCHpvgsdjX33t8neiWC+hzHV
         OBK8BZt3VDolGmFUloXS2wPMDktvoCw58JmagQRtofDI7Es9Vj6L04wCUr32NbkXNJ8I
         ptcoZeebMyG7wXejsaYw1LxSLDmKMe48OfSYUSEgkSo0MOIWHJirZdRiy4ffM75ePNTA
         r+7fk11dh/pfVEcdf3CKfVzzuA9XeMLxWHR1XhB4khsdUxEeVoz2lvsX5v/1bCI6kInJ
         uT7A==
X-Gm-Message-State: ABy/qLbyTYfTyJa/hIyTuXVEi7+2XMYVcE1MnEMVfn5OAjZIgxCu2+hF
        xno+kJeM+o4GUwh0iQAAvqQrnYQqMHJBQwDxzZePjQ==
X-Google-Smtp-Source: APBJJlGiwWBcqCCTznw/AGEq56fGb1W20kRq7wKEmSI0RMGZxIEoD8DhW1gD8JvPF5jL2NBPz5aZ7GpxLiJUMvn9cOk=
X-Received: by 2002:a67:ef98:0:b0:444:230e:e1e0 with SMTP id
 r24-20020a67ef98000000b00444230ee1e0mr5107448vsp.29.1691071191051; Thu, 03
 Aug 2023 06:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230802034855.151866-1-wangzhu9@huawei.com>
In-Reply-To: <20230802034855.151866-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:59:40 +0200
Message-ID: <CAMRc=McAAUjGG+9Ab0GUGnEu_SP212XB_MB1C_EQPcN9pMemcA@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: raspberrypi-exp: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 5:49=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here, and __maybe_unused can also be removed.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr() in the commit message.
> ---
>  drivers/gpio/gpio-raspberrypi-exp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-rasp=
berrypi-exp.c
> index ecb0d3800dfe..9d1b95e429f1 100644
> --- a/drivers/gpio/gpio-raspberrypi-exp.c
> +++ b/drivers/gpio/gpio-raspberrypi-exp.c
> @@ -234,7 +234,7 @@ static int rpi_exp_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(dev, &rpi_gpio->gc, rpi_gpio);
>  }
>
> -static const struct of_device_id rpi_exp_gpio_ids[] __maybe_unused =3D {
> +static const struct of_device_id rpi_exp_gpio_ids[] =3D {
>         { .compatible =3D "raspberrypi,firmware-gpio" },
>         { }
>  };
> @@ -243,7 +243,7 @@ MODULE_DEVICE_TABLE(of, rpi_exp_gpio_ids);
>  static struct platform_driver rpi_exp_gpio_driver =3D {
>         .driver =3D {
>                 .name           =3D MODULE_NAME,
> -               .of_match_table =3D of_match_ptr(rpi_exp_gpio_ids),
> +               .of_match_table =3D rpi_exp_gpio_ids,
>         },
>         .probe  =3D rpi_exp_gpio_probe,
>  };
> --
> 2.17.1
>

Applied, thanks!

Bart
