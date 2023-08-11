Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943237791B2
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjHKOVF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 10:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjHKOVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 10:21:04 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECED12709
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:21:03 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48719ca1b3dso785183e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691763663; x=1692368463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQng/hRo3S30Mxt8z7DZS4O6mVqACPu6LumofMm+Vmk=;
        b=osOhofguygoBMgF/n98pSgcj8+YgL8cMIvfUKTtJH2T6eT5CnBwDFROVviiRIzAwQA
         u5XScutDkrV8/v6uvL147doCcmDOsxDksJHxWc7lGJOEQ6BXsHbXXX5oa71pQfFofpoe
         lLJNBN6iAurKGvlrf8KG2aCntS3/yEthc1TXZy/3SGDaJhLOG2j9/HD3OpRAfyd4bs+S
         BxrU33lsCCPn4LhKb1DW+q7pO/ic6r7dOrx08d2YSpp3igRD02/eIM8haMPyNDJqti92
         Uha01MKbfVhiwgZSUx1NFALWmE00nLqA70SmjSQWBx4Xijz3XovtaCOjrozj/YuoilVR
         nIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691763663; x=1692368463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQng/hRo3S30Mxt8z7DZS4O6mVqACPu6LumofMm+Vmk=;
        b=IqIKbr8qmYqGh3PF8Qn6mR/7zJLPLz8mEhgRd7cXHcPS37NJ8+hM0JnlmVKF2Fc948
         /sRScS1E0dwjUvaKzwc1l8LjtJ0ib/ezkBiH3CJEI5erefaHNSn+l/4/SGXS9Cw/NGh7
         eo///WelRR7xqt43XTT0p9aH1DBldxaCE2SiHuQtyTuSImpfz8t3voB8WHHRxIxgEJg6
         uW1e0rOiJHSq/C/y7oz3hlchAaB6JpMFDGRoDziB76DZjTrZzUUwzT4ncJsY2OWfWAFk
         FFsO7j1VtM1HTCY0scNsPj2BfByo75xTfyy4I5Z5cWmruD0Z5xbUCTLms1tjR6tLYsmX
         TkNg==
X-Gm-Message-State: AOJu0YzR6kQaug6Ui982JiKkzdfkh5f0wXR9ty3xyTxuTBJ9tWwBtVt7
        H4LxhLL4p3g7ixZVFgzK32eQJIPauCy/XG+gWdbir9cED4gGREnh1Tk=
X-Google-Smtp-Source: AGHT+IEa5U46ipufvHjb6BQME08e5uq0HIveM2QdbEcn8haHEINqOHLNuQXsAithgiLeeqGKHtosefHdSmmsdSTF3II=
X-Received: by 2002:a67:ea58:0:b0:430:e0:ac2e with SMTP id r24-20020a67ea58000000b0043000e0ac2emr1868082vso.15.1691763663053;
 Fri, 11 Aug 2023 07:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230810130600.25616-1-coolrrsh@gmail.com>
In-Reply-To: <20230810130600.25616-1-coolrrsh@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 16:20:52 +0200
Message-ID: <CAMRc=Md4K1KwXiC69QqK_Kk02+4vEiu2Leir9OT4hy=jSzaXpA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
To:     coolrrsh@gmail.com
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 3:06=E2=80=AFPM <coolrrsh@gmail.com> wrote:
>
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>
> Use of macro ARRAY_SIZE to calculate array size minimizes
> the redundant code and improves code reusability.
> This fixes warnings reported by Coccinelle:
> drivers/gpio/gpio-imx-scu.c:106:32-33: WARNING: Use ARRAY_SIZE
>
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
> v1->v2
> ARRAY_SIZE calculates array length, so changed
> gc->ngpio =3D ARRAY_SIZE(scu_rsrc_arr)/sizeof(unsigned int) to
> gc->ngpio =3D ARRAY_SIZE(scu_rsrc_arr)
>
> v2->v3
> added linux/kernel.h containing ARRAY_SIZE definition
>
> ---
>  drivers/gpio/gpio-imx-scu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
> index e190bde5397d..13baf465aedf 100644
> --- a/drivers/gpio/gpio-imx-scu.c
> +++ b/drivers/gpio/gpio-imx-scu.c
> @@ -6,6 +6,7 @@
>   * to control the PIN resources on SCU domain.
>   */
>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/platform_device.h>
> @@ -103,7 +104,7 @@ static int imx_scu_gpio_probe(struct platform_device =
*pdev)
>         gc =3D &priv->chip;
>         gc->base =3D -1;
>         gc->parent =3D dev;
> -       gc->ngpio =3D sizeof(scu_rsrc_arr)/sizeof(unsigned int);
> +       gc->ngpio =3D ARRAY_SIZE(scu_rsrc_arr);
>         gc->label =3D dev_name(dev);
>         gc->get =3D imx_scu_gpio_get;
>         gc->set =3D imx_scu_gpio_set;
> --
> 2.25.1
>

The commit title should be "gpio: imx-scu: ..."

I fixed it and applied.

Bart
