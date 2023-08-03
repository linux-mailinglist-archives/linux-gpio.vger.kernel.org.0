Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0EB76EB45
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbjHCNy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbjHCNy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:54:57 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120D01B9
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:54:55 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4475fc33c8dso446901137.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070894; x=1691675694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uQN7/KwWqPjsCOJwGq03huiDgrGr+nhV1Dq/vEWsZg=;
        b=y1lFjZo0xm+Nrtpp8kvy2yRk0n/ApYj3oh5kqwakGtnxWqPW8Fs05G5klUPt+1z2D3
         luUeqXFnJkbNyWzvj2MGn3z/3ConPf9Jve3W8trpejci+rTO6YRN5r4RmxQIkbEkgtSi
         AjmtQZAwGwqUsvzL3chtXCY9v7w9lk/itbERl/LvbGXTUab7U/Ur1IEc9amHvo9Sse4M
         1y+HaC8G/XHStXllvFFiNYCl2zlmsV7KLxWD8I7LI7Mgke/Dxs3Ko3AcnoEFIBVhKL9n
         +lgRPq9ry1ujizQmOgkghO2ciE3drjVoHLm7G+dY5ZovHGUI2WLG8uXokctJpb3Z6jBR
         1vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070894; x=1691675694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uQN7/KwWqPjsCOJwGq03huiDgrGr+nhV1Dq/vEWsZg=;
        b=liPA89mSYr5093AxhpfDIE6WunoIafbhowVKvgTwjBDDdghZSJzh3i/9na78To9Gxn
         WspUEMTTqHTnIbVeWjs7N9rqA8zhXHJfvLO7jPopV94M+KfKZ4N2ZfwJS0qUbMm35gCs
         j0PC5KY0rq08I3NtsjfhVZeAx3rhGuz06dpkUfaCz8iPYvS/d6eFW5m6PDeBK/k+fdln
         ElsUXfK9PQ2L9KtH56UAwgjvx8goc9PQVHfPcf3jjAy/y6uuyLNXTUHpbHLRFFwwxAzG
         1sessmIpCCW4nJaMiWzGqoFX+qtEQk40VaeZkDv1Odl7oHMzMJeXc40cN3nQsLA+Vn8X
         uI7Q==
X-Gm-Message-State: ABy/qLbgAw3IhGwiEstYzTUldFw7e/qr/5mZVZnvh/VTCSnIHsE0OgCr
        WhFpQY3vnqe7UZJosu32veX1QvGaSNAIzYSa/sb+Y2DMqNaqHV5YLNUoHQ==
X-Google-Smtp-Source: APBJJlGQcaPjbAsFH0PfXoeKpF1IHSL6wfCzP30Tx1JoLJOlUp4Xk0N+VgiW6k53QSkiJJb0Joo46cUftKE+222gnKk=
X-Received: by 2002:a67:be04:0:b0:447:4fbe:1802 with SMTP id
 x4-20020a67be04000000b004474fbe1802mr5768691vsq.17.1691070894093; Thu, 03 Aug
 2023 06:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230803033937.3051756-1-ruanjinjie@huawei.com>
In-Reply-To: <20230803033937.3051756-1-ruanjinjie@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:54:40 +0200
Message-ID: <CAMRc=MddzFkEP0fOfkSnfwP1=iTmmO0XSgbVNGafGxQqkSiyjQ@mail.gmail.com>
Subject: Re: [PATCH -next RESEND] gpio: ftgpio010: Do not check for 0 return
 after calling platform_get_irq()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
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

On Thu, Aug 3, 2023 at 5:40=E2=80=AFAM Ruan Jinjie <ruanjinjie@huawei.com> =
wrote:
>
> Since commit a85a6c86c25b ("driver core: platform: Clarify that IRQ 0
> is invalid"), there is no possible for platform_get_irq() to return 0.
>
> And the return value of platform_get_irq() is more sensible
> to show the error reason.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/gpio/gpio-ftgpio010.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.=
c
> index 31e26072f6ae..5ce59dcf02e3 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -250,8 +250,8 @@ static int ftgpio_gpio_probe(struct platform_device *=
pdev)
>                 return PTR_ERR(g->base);
>
>         irq =3D platform_get_irq(pdev, 0);
> -       if (irq <=3D 0)
> -               return irq ? irq : -EINVAL;
> +       if (irq < 0)
> +               return irq;
>
>         g->clk =3D devm_clk_get(dev, NULL);
>         if (!IS_ERR(g->clk)) {
> --
> 2.34.1
>

Applied, thanks!

Bart
