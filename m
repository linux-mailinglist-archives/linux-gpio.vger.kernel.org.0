Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC376FEE5C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 May 2023 11:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbjEKJIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 May 2023 05:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjEKJIW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2023 05:08:22 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCFB2110
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 02:08:21 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-44fdac26696so2644793e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683796100; x=1686388100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2RWFkOnrDLw/O/adql07M1PbPyuhWnz0SZO+oUNaXs=;
        b=TipL+YMZ5V9RAGljWWOgP4knVW35LAG20p5SJr1GSfODYf9DAXl3PRxmc/Ik3d9cyn
         IInwYV/hyYqXvCbBe2LqoSHBG2BaYGhlGtOAos0+L+0TKSr5T5+kr9K/XcOt8UjUkfpt
         cQnSPejHGYurY/wA++SJ/l7FSaQfMby9DvLThfjpyddxrrUkCO82Ja6WoR6WHTrBZErP
         4SBr90CDS4YAUqc7/yl87M/XPy6HyJv1Lnesxv+VdjUO0YCc6EaQVa+DZ2hvvfbkL/Hd
         eiemisxwIrtCWg1A2iPVYvbVxEMC/09zTEy4Y7ti2s6TsepfLIdwkunTCdkkmJ6EETsi
         CWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683796100; x=1686388100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2RWFkOnrDLw/O/adql07M1PbPyuhWnz0SZO+oUNaXs=;
        b=i6rYorplZcYG1p91On7EL9NqiVtCJ+7FY7c2fzDMJbW2pkDIqiW6DD/YEM9TL9xwAv
         sPrW4BakW058OEWZvTbuKM2NatfHCWtDMApHqCfzBjF3uR90HVR3t2bTPbSECV82e0OY
         lvJFzXAL3bdmsVPEZyLf0gUkMXH0HSxKuxYZGNB2V0Z6XiNZo6jXzFLQLNu7MS1apcjK
         jmqUj4CNZegT20gc7hZ9wqk8+XUhDaOnlb1Jym+P1cZ3JgIy2QNSsF5CUJ/YHGdBHdFB
         Qr3RojlkzdcGKIffO2LPbjRc8OQfodB28mMDdLv1xZVuMDkhtBPu78r8bTAeoYtmU92O
         n9qg==
X-Gm-Message-State: AC+VfDwFlQd2KmWQ5nkBO9iFWbo1WkCZcTDalYiALgXpc8sf+4MONx8f
        WxlVLnIRP0uPDxKxJfoJmoPa98p7HdwSNBDpiVMBZQ==
X-Google-Smtp-Source: ACHHUZ4EpvyMN+ez49NTv9SOmeDUgCo/lKkBwoAAJT3rC/nHIRjJcHZ51rB2RPP/sZTx5QZGp4EvrBnwGpwLX13ve5I=
X-Received: by 2002:a67:de92:0:b0:434:6ea9:2f21 with SMTP id
 r18-20020a67de92000000b004346ea92f21mr7695062vsk.5.1683796100600; Thu, 11 May
 2023 02:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230428060938.98198-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230428060938.98198-1-yang.lee@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 May 2023 11:08:09 +0200
Message-ID: <CAMRc=MdMm4hwSWV4PpzEVeXmAmTSRbLEODj4G_m4rR0rYUVNKA@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: ixp4xx: Use devm_platform_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linusw@kernel.org, kaloz@openwrt.org, khalasa@piap.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, Apr 28, 2023 at 8:09=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> Convert platform_get_resource(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource(), as this is exactly what this
> function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-ixp4xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 56656fb519f8..1e29de1671d4 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -199,7 +199,6 @@ static int ixp4xx_gpio_probe(struct platform_device *=
pdev)
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D dev->of_node;
>         struct irq_domain *parent;
> -       struct resource *res;
>         struct ixp4xx_gpio *g;
>         struct gpio_irq_chip *girq;
>         struct device_node *irq_parent;
> @@ -210,8 +209,7 @@ static int ixp4xx_gpio_probe(struct platform_device *=
pdev)
>                 return -ENOMEM;
>         g->dev =3D dev;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       g->base =3D devm_ioremap_resource(dev, res);
> +       g->base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(g->base))
>                 return PTR_ERR(g->base);
>
> --
> 2.20.1.7.g153144c
>

Applied, thanks!

Bart
