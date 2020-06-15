Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F1B1F910D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgFOII0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728782AbgFOIIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 04:08:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5CEC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:08:24 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id v79so14873459qkb.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VdhQIqsA76M/Q33FgsDVqlY0C8ahxL1l23f83ZhasWY=;
        b=BauVPoy18r5Ja+XGXEFsim5pmCPUyMhnejZLHUj0k3XMJEuNoeusyhSt4/yuE9zccG
         /bbwwKWRd5U9e7DFvXo94AmRf4ZT/Sy8wxIa0WqUfRIdtM8+3PxPIGgGZDZ7Vh3SYYbK
         K79hViEWQKSjAGTZ/Ra4lE4BEsK8uBrS9GI3U9a0dfPnICySLMuH3S5BDWKBR46JkaJk
         VP0TeeKtBrZBcj/NldzPmSJzP/jTu494o9ZUJD7RrE7c9+8B0VhY8elkze24uPHTjMTp
         mWDlHzyBYiTOY0Wx6vjSKjHBpUXURgi5a3Xra9YUnsmbCV5RRyd9E23zy6DQT/H2czPt
         G4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VdhQIqsA76M/Q33FgsDVqlY0C8ahxL1l23f83ZhasWY=;
        b=jAwbT7UBM6San+uI+2SfIi3AKZHhOQpwiC1WSPyglF+daqhn0hBpi1pQdjTDAc4D6f
         L14PRdcIgLFFxfVbqUMTySiWeRNn8FrFiAekZqU7jnh6tGWLLUYHuFZVs2/YBj8DxJGP
         2tc5Ee2EcKasmbM//wleoGmMIe+a7YvXjIoiX1kU06nJZX/CbTzzxz8MvktMEY4qt10z
         pT0Qz8werpGurLYIrXORwUOq4/Bc/mxiP7hmaucqndDWnS9dz4P6PIbnd5Q0q1KMh95T
         HLo62LPww0CBXLOHV9cDCzfm8HoMsQoJw1017K0VkwX1USefiNO3HwaEtQVDaUrXebuV
         sOEg==
X-Gm-Message-State: AOAM533YjFm+24izL79Za7fSdxyrAt+5Gng/8vv1n7kSwEoi4IiIMFXe
        uQrAOPSiSKdnonG8xAYcxhA0lYVTM0BYV3URWl4Oeg==
X-Google-Smtp-Source: ABdhPJyLaWl+p30tdGKH+xZMF+rsvnwvp/cxVLk6ifiZV+32iNbZddkugVBi585j6FMBjy19240oFpE00d8m/HcEsps=
X-Received: by 2002:a37:a643:: with SMTP id p64mr13171662qke.21.1592208503807;
 Mon, 15 Jun 2020 01:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <1591949145-17098-1-git-send-email-wangqing@vivo.com>
In-Reply-To: <1591949145-17098-1-git-send-email-wangqing@vivo.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 15 Jun 2020 10:08:13 +0200
Message-ID: <CAMpxmJVBKnRinJuh7scvUCV4gci3A_7p=LW9n5yhc+RC6aipbQ@mail.gmail.com>
Subject: Re: [PATCH] drivers\gpio: use kobj_to_dev
To:     Wang Qing <wangqing@vivo.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 12 cze 2020 o 10:05 Wang Qing <wangqing@vivo.com> napisa=C5=82(a):
>
> Use kobj_to_dev() API instead of container_of().
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 =3D> 100755 drivers/gpio/gpiolib-sysfs.c
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 23e3d33..82371fe
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -365,7 +365,7 @@ static DEVICE_ATTR_RW(active_low);
>  static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *a=
ttr,
>                                int n)
>  {
> -       struct device *dev =3D container_of(kobj, struct device, kobj);
> +       struct device *dev =3D kobj_to_dev(kobj);
>         struct gpiod_data *data =3D dev_get_drvdata(dev);
>         struct gpio_desc *desc =3D data->desc;
>         umode_t mode =3D attr->mode;
> --
> 2.7.4
>

Patch applied, thanks!

Bartosz
