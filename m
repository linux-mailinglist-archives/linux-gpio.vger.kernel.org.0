Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95757B4BE9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 08:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbjJBG6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 02:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJBG6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 02:58:42 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E679F
        for <linux-gpio@vger.kernel.org>; Sun,  1 Oct 2023 23:58:40 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49ab6c1869dso1980239e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Oct 2023 23:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696229919; x=1696834719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLfeARTORgLBysRQqnaQlLhdkoVVzIDcrKSOLJC5eqo=;
        b=sakMH8ZtxS5ZAGYzKfLRG8mFPna/of8Jwl0NnGgiIqw4/CaXT1OprqJPGzYnPGXKNV
         Uml9zHAZRR8TtwyghmgXOTCGiL4u1UfDvTZso9JIIYx4/LyQu2Rler6oSRMcnxpPadvL
         FynPNl4oITdFnFc3Wm6XDj+QqUWZOV5rQxC8P/vg1GSmISdyhM5SZpDJ7C92fiFVeKwl
         EICRz3C0Z/Fe0QsAK0pbSRfMEVQl0D3TsTvYPUTlc4yNsengsIyN1tU5pR+GH7ZEA6b2
         nD3rj+pElVD+dP7c6mFJCt0fMfDctSdX5PCdV183BhJYT7avpzj+xtbce5xAzGzCLnU9
         15Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696229919; x=1696834719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLfeARTORgLBysRQqnaQlLhdkoVVzIDcrKSOLJC5eqo=;
        b=pTTAjltojCRsi/DfzdIGgBZGfyzcsWz9dqawVOK41/EOYqoHeh34I5fkYvyaiPbX/T
         fNcVMmL7ybdfyR8Xw5gKS9O0gsJAdBvCD3x89AAcDyHF44W3S7+EIsgtak794sw5sztl
         bLi10EmxCOaH2gK/xDXsrdYwiIqNjmGp09+0jjbBvKT5NgMjY2i6936jToFuL1ZqVKxx
         b0Fzc1zhKhO5TulU14tknHus3hDyn6bVlmyvXc8Ky9P9j+KFk1pzSKQRs7/jcCNx8u9r
         Jrh5j60LcszcQ9f2PuJBuG+6Ig20rwAZ0omddzie0EpVAZp5niHPc3JnyIcnRB39lmxi
         3DqQ==
X-Gm-Message-State: AOJu0Ywi+529zSsRFVkasBBJ6f8GiKft5jOt6+q+d/ybopQYLKcocDgL
        GIf8/DrRKTr18MsyLm14O3hw4zQ6IfFwUiRy3MRLCw==
X-Google-Smtp-Source: AGHT+IHUBD+zxGITBFn48InW0XjEc/8YcFuRkD/Pn6LyVgmNIoEXW+YLMRV3q1jTYKQIikphaoA+FvafVys2p/lkBd4=
X-Received: by 2002:a05:6122:12f3:b0:496:2d54:e6f0 with SMTP id
 k19-20020a05612212f300b004962d54e6f0mr4549958vkp.6.1696229919654; Sun, 01 Oct
 2023 23:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-gpio-pca953x-maple-v1-1-d7960eac3d07@kernel.org>
In-Reply-To: <20230929-gpio-pca953x-maple-v1-1-d7960eac3d07@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 08:58:28 +0200
Message-ID: <CAMRc=MfPe=LUttjzGNTZocu4nCpEV7Va28wZWnTGAeZmajMdFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Convert to use maple tree register cache
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 2:24=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpio/gpio-pca953x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index bdd50a78e414..528ccb59b52a 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -414,7 +414,7 @@ static const struct regmap_config pca953x_i2c_regmap =
=3D {
>         .volatile_reg =3D pca953x_volatile_register,
>
>         .disable_locking =3D true,
> -       .cache_type =3D REGCACHE_RBTREE,
> +       .cache_type =3D REGCACHE_MAPLE,
>         .max_register =3D 0x7f,
>  };
>
> @@ -430,7 +430,7 @@ static const struct regmap_config pca953x_ai_i2c_regm=
ap =3D {
>         .volatile_reg =3D pca953x_volatile_register,
>
>         .disable_locking =3D true,
> -       .cache_type =3D REGCACHE_RBTREE,
> +       .cache_type =3D REGCACHE_MAPLE,
>         .max_register =3D 0x7f,
>  };
>
>
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230929-gpio-pca953x-maple-b39b99cd90db
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

Applied, thanks!

Bart
