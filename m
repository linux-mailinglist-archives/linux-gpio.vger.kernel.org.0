Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D954F7B4BEB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 08:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbjJBG6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 02:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbjJBG6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 02:58:54 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EE6D7
        for <linux-gpio@vger.kernel.org>; Sun,  1 Oct 2023 23:58:52 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4525dd7f9d0so6368343137.3
        for <linux-gpio@vger.kernel.org>; Sun, 01 Oct 2023 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696229931; x=1696834731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4qziV8UF0SZXz3oB61dXR8DlPsKUiWHDmOG204EYoc=;
        b=1pVe3tMMGzJG7V3ocJCyxmJm2grbredP5qmhXsN1iirtOQ+3NLJEjd+xomlAZsXl5Q
         u/cotVuQmWH6n1psJPmlfqGHseyqI5Sywdnzrv8oxwf/7ZwJ7xp+H8hz6nI2HYdc4hBa
         PNUs5rgYBNwj45lS+NCGZ6/tsksYIe3/NaOrskmrDQGPfjkGqsQc9kgjjA1WxdmFls4u
         4/wJgzlo5pCmbDBtkq+WDgfK0rSbDyFrulfk0YRM02o5Hgj+FsxPWTyWS24jXz6miXBE
         LPYZ0lGCSM7IBGkA4yioyHUV509O+Bk7qWFiTxn8Fq1d3QtrICOb1rw53KW2/TQWF8Wb
         FNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696229931; x=1696834731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4qziV8UF0SZXz3oB61dXR8DlPsKUiWHDmOG204EYoc=;
        b=KxLcFF4u9IvX+qCGWxV7JqnLHCcki3UjT96WPNLE3uOSYwi6S8271YW0rOKv57eUBJ
         A30MJJzbq4fCv2agb2ImID7sbQ/BZ7+AfJUQ+Boa8QnbpuRG7W8wDPvUZoRLF0ctKT0v
         7EPSCKGs340Lq8vPGlCsv+GZlqsr5+1VFwOeYpWbgWB4Ow7hVMlPQxQioMxbhCx1Fg0s
         r4MoPcs3j7Hlmj/I7D6x95GozABs/LXXqP6MB7K8zGPE8VkPaM2Vq8XA87963j2lMJhe
         UEEpsEQjMrs4XghNKaKqm/DuDkwFre2uM1tF+0Eyyss+fXc6JHZ8RVI7ulV+uPFS+/DV
         kdcw==
X-Gm-Message-State: AOJu0YxOdZI759EcBILNnryJXn3rYnKmDwz6YtiYlvXuM0s0N4a8jwU6
        ZRYUFIt43nk7QCG0NlKCPVPiH/8cMRJ3kS86UDzjA8YeX01hTrDCav4=
X-Google-Smtp-Source: AGHT+IG3rs8zYl/JJw0tQ56R8pNc8Z4u7VsfcZANJKhvdcy3VGBf3DrVHIPL2bWY3jddy27oPmc/VgQeyI43E8zLL1E=
X-Received: by 2002:a67:bd1a:0:b0:454:701c:7717 with SMTP id
 y26-20020a67bd1a000000b00454701c7717mr6527449vsq.5.1696229931169; Sun, 01 Oct
 2023 23:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-gpio-fx16408-v1-1-7fdd3218f7d6@kernel.org>
In-Reply-To: <20230929-gpio-fx16408-v1-1-7fdd3218f7d6@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Oct 2023 08:58:40 +0200
Message-ID: <CAMRc=MdS4pjYhZ8AsYPa6-QMiPCocgsJ_aihL6iF3tvO8bc=sQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: fx6408: Convert to use maple tree register cache
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 29, 2023 at 4:11=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpio/gpio-fxl6408.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
> index c14b5cc5e519..991549888904 100644
> --- a/drivers/gpio/gpio-fxl6408.c
> +++ b/drivers/gpio/gpio-fxl6408.c
> @@ -84,7 +84,7 @@ static const struct regmap_config regmap =3D {
>         .rd_table =3D &rd_table,
>         .volatile_table =3D &volatile_table,
>
> -       .cache_type =3D REGCACHE_RBTREE,
> +       .cache_type =3D REGCACHE_MAPLE,
>         .num_reg_defaults_raw =3D FXL6408_REG_INT_STS + 1,
>  };
>
>
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230929-gpio-fx16408-476b144746bc
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

Applied, thanks!

Bart
