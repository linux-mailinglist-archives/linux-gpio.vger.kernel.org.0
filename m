Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA66C76EB1D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbjHCNtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjHCNsn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:48:43 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5139A3ABF
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:47:30 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4865c9f9d9bso1369748e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070449; x=1691675249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7qFNZbvxgKG/pfY+414xL5ZiFLKcO5iJ+7JnPY1dJ0=;
        b=46v6sODuFGuLTBNGZoqWdv3+za2sbTFewm9q1l0lTnB+g86wGO6TuGO/pfZ10C9AmB
         2NSMud/3VMy8xzPxUHBISukNd9qUR2N4PpuFPiBn95tXWOHq+ItOSaRr9P9IUdF3+KQ7
         ulnEuM21PA+PGOK6YXXTYeUi6SIkItkA7aw0cocwyNjfIqvFu7G0ZiU0xG5r261npbJP
         TIso/5HvzMUVOp4RtwS+i1PnN1SLSx3kqMu5nZS6kB8HwQ9osfiMTCwV+NvrR4BxbAx9
         dR5ygkvJPS84KhmyHUz3ud5WiIfeZlX769gy4JZLPHuYCmQXzh8fxjaV7EK4D3KKKQHz
         ncdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070449; x=1691675249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7qFNZbvxgKG/pfY+414xL5ZiFLKcO5iJ+7JnPY1dJ0=;
        b=TZYVrW/D26WEuxP+rlI3xFY8nNpGWXB3k0Ti3XmV8GoJOMlsF+eiq5FVS0BTOeuSlw
         NNtOLNHR7QFwlQgmdCj9NG9ugxEpVxwyCSS72u5JdBeCAIJvXgkqaKxvlEblcp9tx3m0
         xPoLDz6qIFZe5PfmHAqtiam+E+tw0E2FqcabCTdx/9rRymCgz/vXI7vMg0qtn0pY/mio
         plkMwCjCxdRi0K/03tYk/d9XYLM8PYU7s1M1V46RJQeD4Nfi/IWEqhQ6JctDf8Ji3qNs
         uIueKSk6cb4gKObJSODD3ag0wCmHTvAxQESh7G23BKlgWcpGffFqAI+XGUbd+RuVo996
         GUQA==
X-Gm-Message-State: ABy/qLbArCFWIacrwkyfrpOSSfs0hp4pluyR3yx+Tnt1mt9/XNRWL82k
        6man3wB4otfw49Dsc/5UNG8BVQ04FvAK2KhKQ5K335RTzLQaOKIoSDQ=
X-Google-Smtp-Source: APBJJlEW7QgXMaP6hNgSxspZLwMEVYePiMLubm3nRuwMgxqw+0ATUbGqvX0TrxmWCcS92cLTjbfneZWZQ9RE8nP/49c=
X-Received: by 2002:a05:6102:508a:b0:439:3e26:990e with SMTP id
 bl10-20020a056102508a00b004393e26990emr4507298vsb.6.1691070449442; Thu, 03
 Aug 2023 06:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230801074430.5179-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801074430.5179-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:47:17 +0200
Message-ID: <CAMRc=MdCmK4K-KNtnqzuSjgHu-Z1Aai2qAeXikp9mkdQJVuRFA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-gpio@vger.kernel.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
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

On Tue, Aug 1, 2023 at 9:44=E2=80=AFAM Andrei Coardos <aboutphysycs@gmail.c=
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
>  drivers/gpio/gpio-sifive.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c6a8d2374e31..0010f607a9ef 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -259,7 +259,6 @@ static int sifive_gpio_probe(struct platform_device *=
pdev)
>         girq->child_to_parent_hwirq =3D sifive_gpio_child_to_parent_hwirq=
;
>         girq->handler =3D handle_bad_irq;
>         girq->default_type =3D IRQ_TYPE_NONE;
> -       platform_set_drvdata(pdev, priv);
>
>         return gpiochip_add_data(&chip->gc, chip);
>  }
> --
> 2.34.1
>

This patch does not correspond with the code upstream. Please verify.

Bart
