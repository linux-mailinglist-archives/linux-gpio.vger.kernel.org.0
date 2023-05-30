Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFCBE71698B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 18:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjE3Qbu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 12:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbjE3Qb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 12:31:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF02412B
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:30:55 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af177f12a5so49571641fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685464251; x=1688056251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcWzOSDdDMsKZsoBkaN9THPCf/sY5/j/iNNge3pn9DM=;
        b=PAvv4eEcjomQIziSjKISkeFjcaM8bw2Cvt8O8Di39XulEe4tGDYa19ZifiYrMjLSwm
         x9t/MZLhg8mMRIuAx+f4y2AVfXDKj2o2WeHrn7ykVWftTANPOXyGyNRtZAnq1Y7i9EEI
         rQ/TKQlEPY1ERTmYOaqC9fyOFEZ0r1X+lS3tr9S+kugFULk5EiJdSrKW0iAQyOO2WHI3
         lA5IoM3Y/LfpvVqyZavH3MFbjJLbi0tu+aNYqoVB49bKPlKc6lBQz750yam20+BK8KGh
         Ahw/nNgm7uUXuEGk/7araBzzq6tXJwJtN1fOfmv8QmHTOV2SCdkrI2TRuXnul8BQo8Yw
         kr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685464251; x=1688056251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcWzOSDdDMsKZsoBkaN9THPCf/sY5/j/iNNge3pn9DM=;
        b=SPD1qfiv8JCJLS5Ltk9adrbdwkleKzkuTZZgGGOOd2p75xaOUtxVk0IteiqJ2RfqlL
         CpwzDrEdbknyXGBra/3lAG086X7pDwCKZ9bWy8bsuF/o3sZkwqlSMqi/dZXrTnvAS/we
         E1bGAVIxG1ge2ZO4Afi8myKxMEpZU/XYlkcNaHKdht5dokVwrD8+v1c7Ipq0DOkyuh5R
         uuJf+mR2bZ9QTWVXJyaGNraJS9jHc+IiLpN4hBOEvlpXeNuTGC+TT2lWYKxjj3d+TL3L
         E/eaQsHYRYm6hybCMp/aUu41yVIKtEHo7/Tq0HKJy/ibFwhERIENgeoDqd8nNPIF5zcJ
         Nl3g==
X-Gm-Message-State: AC+VfDwL5Ti3vgzFbfcsh741V0N7qGaWSveV1HaoGcrixVM4tFevQ8e8
        3BQj4/2X9kG+uR3eRlsNFQYjkymmN3nCOV3LZasKTQ==
X-Google-Smtp-Source: ACHHUZ48j4CTfutqy/48alHu0v+2BBwmvJtW8lx+Mk2Gi/WsVCOUmAS/c7SsVF23Cw5swC1SKumSRYNJEnYeVaiRC7w=
X-Received: by 2002:a2e:3e07:0:b0:2ad:ce08:7a33 with SMTP id
 l7-20020a2e3e07000000b002adce087a33mr1215492lja.22.1685464251616; Tue, 30 May
 2023 09:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230530162034.4004-1-sensor1010@163.com>
In-Reply-To: <20230530162034.4004-1-sensor1010@163.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 18:30:39 +0200
Message-ID: <CAMRc=MctKb=LUu+um=9ZTH-51keBczdpY_EiPVYN+kbWJzdrTQ@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 6:21=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:
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

What have you not understood about splitting this into two patches?

Bart

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
