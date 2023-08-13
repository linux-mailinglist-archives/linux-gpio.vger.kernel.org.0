Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F01577AAB4
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Aug 2023 21:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjHMTBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Aug 2023 15:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjHMTBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Aug 2023 15:01:01 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F64BF
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2023 12:01:03 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-487db6c9059so262040e0c.3
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2023 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691953262; x=1692558062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgpmyswtNhcGyVDdDZCscDLGQ5o4Sm8Hv5XfhwhR8eI=;
        b=upl0L0VKcMDfA1GwlHwmJutRFV/LIE0goy20U+GVcAEoT/HVG2ArrJv0WS1j97L+8q
         Sdgkcx6swHuE5oBGF6w85X0/UOMLCD3q1eVhi9/PE7g9MoJ1GtGlE5zT4WzZdhp0Mtq/
         kvTEVTQYMzgsvpacnHv5UI/fo9/vnpOpv9NiVEVgQXRtiAOfsjXpSOYkZ+P4bPUZZaak
         CN/pzG6WEZOgiSyGunZK1/vd+jC7Lk3PfrFZd0eG8lyMAaIonSg4vNJDD/5adbLWPrAQ
         VTy1ku2ls5abLTBiT8ccWz7hG1vY+8EOPkY8jYAyFoHywVHCTps6rPpynCYQEXbInNjS
         F0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953262; x=1692558062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgpmyswtNhcGyVDdDZCscDLGQ5o4Sm8Hv5XfhwhR8eI=;
        b=WQOHdguu/pgghe0MamaP7ffP3Dvz47i2w8K3mye+CpQXdXtlWsO7Y6QH6N8ZgQBZew
         +KAx5kZbiMjwZb2n95so5v0NltqeI8fnOdnVNqQotE0HyQ2Zw9P3Qlq6calewIyx1u57
         AYpOrH7fucnkPIjUanjAMNxz+2tVzGKGd+H0MOFjT2xc/yM0EO9k1thICxAoSqwEUslm
         ZG7oMLUR7g6udBI9c+OA5DTC3OMyEIVAa2I8/qltujcPaig789wvFiNO6O8cQB42AdLs
         mx8AqZNfAe57wAqmAedp0LWXYVlr29UZK0ycOGVkXIFi/0SKcLl+I4Rn6rZzK7aTeQ99
         LYwA==
X-Gm-Message-State: AOJu0YxJnNRFfUZpQpD2ybx+8hYnFvXqH0CG6l7V8PUqy7Eycwe4zsre
        Sr+xuI/7gAnmcvTfY5LkCuQ5hIlaOPoI75zL3mZsUpsrF3qvbBol/dY=
X-Google-Smtp-Source: AGHT+IGIbp7kzcOXFB8HlSBUeE1LyGxkGD4VBLpwOvl5355T5aKNY0a28w40qtLPWhqmuzK0x4uXggtUODoMPFE5gRc=
X-Received: by 2002:a67:f9d2:0:b0:447:77f5:66ba with SMTP id
 c18-20020a67f9d2000000b0044777f566bamr3928370vsq.35.1691953262613; Sun, 13
 Aug 2023 12:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230810093414.2398217-1-michael@walle.cc>
In-Reply-To: <20230810093414.2398217-1-michael@walle.cc>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 13 Aug 2023 21:00:51 +0200
Message-ID: <CAMRc=McF-18McEW8Rpon1Bh_9SJM3ZxAbSeiBbTqFEy_WQKmXg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add content regex for gpio-regmap
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 11:34=E2=80=AFAM Michael Walle <michael@walle.cc> w=
rote:
>
> Add a glob to get patches of the users of gpio-regmap, too.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20a0f7411efd..907f39825733 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8868,6 +8868,7 @@ R:        Michael Walle <michael@walle.cc>
>  S:     Maintained
>  F:     drivers/gpio/gpio-regmap.c
>  F:     include/linux/gpio/regmap.h
> +K:     (devm_)?gpio_regmap_(un)?register
>
>  GPIO SUBSYSTEM
>  M:     Linus Walleij <linus.walleij@linaro.org>
> --
> 2.39.2
>

Applied, thanks!

Bart
