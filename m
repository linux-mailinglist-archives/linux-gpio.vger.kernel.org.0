Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D331A70D77F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236154AbjEWIeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbjEWIdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:33:19 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3A82694
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:29:40 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-45701a8a1b3so1688316e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684830579; x=1687422579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILn21p3iZ6SH9K+Q+SIaeY3G2Mcp4yvUaAoc5C5tStU=;
        b=2J0fHnbfrRcsZzK2npGTKcC947Oxi0EKxXXqTryFytqM/KdAH7mmQzjXziTWKE4XL/
         /p4CsRETrbQTzVDW+xYCs0pYOOAE15B2b49/gJuYWis29SxGD049DasfOre7uY8j8AWb
         MJKJ3jv26G1zdwv0qpvt4lXcUIm9HKhDnp0di6CXCAoiJqbyawcrOneRatg4Ycz2RQCI
         Fsy+fKZuP4SOJKRVYpTOEjrD5mGHZYB6dgJmXp9uw3dNJTc6aiSHkv1PfGLeQrYVLfyp
         I0HtUI7J1vnTxOisHOF1vFO4ESa/pafBf8hqu0MaBw9tjoA4uqSMxGiw8xgcMRVcndz7
         m3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830579; x=1687422579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILn21p3iZ6SH9K+Q+SIaeY3G2Mcp4yvUaAoc5C5tStU=;
        b=SI51Qs8wenDE6xs38AtStyUfrrCISeDxo61ijljnXEP872jZrGYMEVMxOZlp4d87Zq
         F+Thf+MlFX9Uk3PwDVtXy27hE11469g8G4jvXHNvzoRwP4LPs2rV7t11QUOXqrfB2u3n
         fCDCgP/Fof4jbbH5kxFeXEi2A9vqtFhgHw4yrSzj1ihBvphanO41sRms+8VuMazlP9Dp
         VxpkT9m0G9jl0thvzLwFqs4NINLuTFltPdS78UlThjWzV/1PaD6vtT9Vjztd7/RN2nNT
         VV+TJf5iOPvPTHs2AOrRAqMGhm4JKTITEEle98Bi9C7PBO/ewuJcTRihkj66+3HLwpVH
         QQwA==
X-Gm-Message-State: AC+VfDwnx79VLjcdI67mCWSqWiNrOauyx/WLn4VVkOFANukh3tDQOpq0
        wkaXKtwpVIH9RjcgS8j4QpFox7NSqw0NPF2hTYmY/A==
X-Google-Smtp-Source: ACHHUZ7YKuSwrv0dWkaxm1I+dNkm97+KbpOtnb5BMYhmZ1vmG+hGVaj/tYJPg9kc1sbMWLiBy43AICYO3yKBeV6NVnM=
X-Received: by 2002:a1f:3f03:0:b0:453:8f1c:eb31 with SMTP id
 m3-20020a1f3f03000000b004538f1ceb31mr4017125vka.14.1684830579480; Tue, 23 May
 2023 01:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230519171611.6810-1-sensor1010@163.com>
In-Reply-To: <20230519171611.6810-1-sensor1010@163.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:29:28 +0200
Message-ID: <CAMRc=Mf9nLX1uSngiXB3dfbE7P6Ec093iRt90MVCa+1A15Zc4A@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpio : Remove redundant clearing of IRQ_TYPE_SENSE_MASK
To:     Lizhe <sensor1010@163.com>
Cc:     andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
        gregory.clement@bootlin.com, linux@armlinux.org.uk,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-gpio@vger.kernel.org
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

On Fri, May 19, 2023 at 7:17=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:
>
> Before executing microchip_sgpio_irq_set_type(),
> type has already been cleared IRQ_TYPE_SENSE_MASK, see __irq_set_trigger(=
).
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  arch/arm/plat-orion/gpio.c | 1 -
>  drivers/gpio/gpio-mvebu.c  | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
> index 595e9cb33c1d..863fa497b1a2 100644
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -364,7 +364,6 @@ static int gpio_irq_set_type(struct irq_data *d, u32 =
type)
>                 return -EINVAL;
>         }
>
> -       type &=3D IRQ_TYPE_SENSE_MASK;
>         if (type =3D=3D IRQ_TYPE_NONE)
>                 return -EINVAL;
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a68f682aec01..34fd007b0308 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -505,7 +505,6 @@ static int mvebu_gpio_irq_set_type(struct irq_data *d=
, unsigned int type)
>         if ((u & BIT(pin)) =3D=3D 0)
>                 return -EINVAL;
>
> -       type &=3D IRQ_TYPE_SENSE_MASK;
>         if (type =3D=3D IRQ_TYPE_NONE)
>                 return -EINVAL;
>
> --
> 2.34.1
>

Please split it into two patches. I can apply the second part but
arch/arm is beyond my jurisdiction.

While at it: is this platform even used at all? If so, then maybe we
could migrate this driver to drivers/gpio/?

Bart
