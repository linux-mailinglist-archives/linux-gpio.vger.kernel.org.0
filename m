Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B26976EB0E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbjHCNpo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235117AbjHCNpV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:45:21 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B017D46B5
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:43:48 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-79a00f74a92so353439241.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070228; x=1691675028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcdtTw4dkel5J7XpneY7Xveaen65+k0rJwQXNomPT1Q=;
        b=YUx/Uk831P+5OMLZz9Ezcx9gqA+M4bfPCexEZuTXnfDhCo+Zm4LHxtbjh/LECMaV38
         WXKlX+HXKmyPDW3841NAIsdCs4jMP8peAqpq/dRPJIwYTKS34lf1fMck10sz6jbgkTVR
         W65DpN2d5s393vwqcr3nYCs2Av8EtvykozfWjNEB6CyKPsXjemWPrmxidVZh98TWo3ZO
         IQrA0DYa4Ypj9T8zGgYslYYjB/ARxfpz7vVthq9aPkFDBSJOUIg59sYtegKBqy0Yy8Tl
         kB/k1QUxbFhl+9IsYIou2kPUB2UKepG+7dmfSb5EcYsXBbtnplaWXp/XaJlkqodo5q7w
         zgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070228; x=1691675028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcdtTw4dkel5J7XpneY7Xveaen65+k0rJwQXNomPT1Q=;
        b=P5Vosu01KiP4n424qyd/TQ1OwNvaOlDK/L5sATPgJ33RkM6zNtJ+S+Hrvu7HFnV9X1
         56O2dE0hYhLXU8aNXzyskQt1/0ssyyZTANnkjHJh5LB0N4t51zuETkRFMBff2srFgf5A
         8GWKSuGVCCS6brJc3T6W2M9Seddw/YtN/atC0CsBu/oGjamsUN0VSd4GMJ/OlP3DMR0k
         tBxBmdjeRx3PzINOb8KyNkc/4OXHG4PFUALKSzHcfzE2mlLVl3PfRPA1yKwQGLCIxBws
         AxrS9KweBXwhOLf3sv/36GJYOizvMNTNPvR3wxkYu2Ae7nviTISNMSWWHUSFMyPnakK2
         fz6g==
X-Gm-Message-State: ABy/qLbEju8zvx5Hr0gV0eftsiCKmmDY817Y34aS83aXYRLz3YNAuH0B
        +c5aZXg+H3yl9cIF89zD5sW89xwsFrOaFyo0rQPjnQ==
X-Google-Smtp-Source: APBJJlE6DgfLE8ulxBo2wRraz26sn1daNLA3cL1gBrcHf6ZmlOp7zQpV46Wgmp6efS+6X1TrYnjp67ALFLhBzF+uhHo=
X-Received: by 2002:a67:f797:0:b0:447:4456:a1cb with SMTP id
 j23-20020a67f797000000b004474456a1cbmr6774531vso.25.1691070227847; Thu, 03
 Aug 2023 06:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230801072800.4130-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801072800.4130-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:43:36 +0200
Message-ID: <CAMRc=MdZg6vXj9gG27qRwry5qFhxKOW4W8W-UhQL7rjSwmiSYA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sch: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, andy@kernel.org,
        Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 1, 2023 at 9:28=E2=80=AFAM Andrei Coardos <aboutphysycs@gmail.c=
om> wrote:
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
>  drivers/gpio/gpio-sch.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
> index 8a83f7bf4382..e48392074e4b 100644
> --- a/drivers/gpio/gpio-sch.c
> +++ b/drivers/gpio/gpio-sch.c
> @@ -380,8 +380,6 @@ static int sch_gpio_probe(struct platform_device *pde=
v)
>                 return -ENODEV;
>         }
>
> -       platform_set_drvdata(pdev, sch);
> -
>         girq =3D &sch->chip.irq;
>         gpio_irq_chip_set_chip(girq, &sch_irqchip);
>         girq->num_parents =3D 0;
> --
> 2.34.1
>

Applied, thanks!

Bart
