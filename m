Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC8D712742
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 15:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237174AbjEZNM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 09:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243546AbjEZNM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 09:12:58 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E58B19C
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 06:12:56 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-457026417ffso194876e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 May 2023 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685106775; x=1687698775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8WfNbYjQtdKqhbV501fe9vtrkDkYbanF3BpFOEvVck=;
        b=yqyG72qta2r79hHfhtKEsQGBuGunOd35hSHz3b0TCfsYaXQgZCOckNAVlNJDtbrYfi
         iz9PEu7wdR8yxVI34ERSDlsTQQ/b0VzVMUiai3M+FOhRGKQcNnwCkPsCZi2ArY7YHWZZ
         l4FiCmMvHZq15vh7o2fZWLASXG4TauDaD/ACnV5Pshwckf8j5l5K59DQXfTMbCsvUDUw
         L20+aSIKQ/FGUh30jFY/222nBmCER4n/Vtx2CDBnFfQn1b6fomH+LziDAay4hK9W/esn
         1XVrUM8U8d2D+ffLeLJEvXa9vOvVBHCbmFUvF+8Jh3sOkjWia1MVsF37y99P3WXi2AT1
         wLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106775; x=1687698775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8WfNbYjQtdKqhbV501fe9vtrkDkYbanF3BpFOEvVck=;
        b=FG38ISySr7g9WlFdOP6V92DfaTBXikpqOuos2pb4yUA1enJ0ncOofTloIipprBuVrN
         QAfwYOuJq+skU8YJ5yHzs6ktPmFioFodCzesB3Jo6beyfBLT7RlvZEKMweddBoafVTUr
         Y3BBinxW5caCzwmO0Brtr7CKue/BdTyTcP13OKJ9f3XuODTUU65m4+DNGz1VexnEtjD4
         z92EAK0yCQw0lboHNjSQ7yuYPR3WPO/QTgLRZLtvxklzot8Dx26cWD6U8cKrqM6HUfKL
         E10tjzRLlJtvw92r9gDj4R5W6GeAItUnVtqNILxW/dIavirmbiXydD+WOrzwUHFYcKwy
         DFlA==
X-Gm-Message-State: AC+VfDx2r+kx2coauvW9xsd5UCnyIQ+L/GWNazOUQwb3ZfnwmxBBefRk
        7ZN6ruQGlfB7a+xNhlBlOUle68DFPDUcisqqFaZYAg==
X-Google-Smtp-Source: ACHHUZ7xMhW0TO6j+s+yWfOAQ6PkrQZ+ULvXzzoNL2XvhjJ7iDF1cU25FIR94NStKsLdlLqb+WLgnQ/p80rTKuiTH4g=
X-Received: by 2002:a05:6102:3019:b0:439:e3c:8ef8 with SMTP id
 s25-20020a056102301900b004390e3c8ef8mr426513vsa.28.1685106775067; Fri, 26 May
 2023 06:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230506085928.933737-1-haibo.chen@nxp.com> <20230506085928.933737-2-haibo.chen@nxp.com>
In-Reply-To: <20230506085928.933737-2-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 26 May 2023 15:12:44 +0200
Message-ID: <CAMRc=Mc7xq5Psgx8VxkvydS+3bQZKfR6FHOKrifc1uH6p7H6Gw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mxc: switch to dynamic allocat GPIO base
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        christophe.leroy@csgroup.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 6, 2023 at 10:56=E2=80=AFAM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> gpiolib want to get completely rid of static gpiobase allocation,
> so switch to dynamic allocat GPIO base, also can avoid warning
> message:
>
> [    1.529974] gpio gpiochip0: Static allocation of GPIO base
> is deprecated, use dynamic allocation.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 9d0cec4b82a3..abc129a88a62 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -462,8 +462,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         port->gc.request =3D gpiochip_generic_request;
>         port->gc.free =3D gpiochip_generic_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
> -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
> -                                            pdev->id * 32;
> +       port->gc.base =3D -1;
>
>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
> --
> 2.34.1
>

This is not the first time we're seeing someone submit this fix[1].

Unfortunately it's been brought to our attention that this breaks
existing user-space scripts that rely on fixed GPIO numbering in
sysfs.

Bart

[1] https://lore.kernel.org/lkml/CACRpkdYV3mHNYvBg1nf+12Q2XZH_g4iTrA2YB1SVQ=
=3DROriRRgg@mail.gmail.com/T/
