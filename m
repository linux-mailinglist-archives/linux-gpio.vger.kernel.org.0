Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09EBA790CFB
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Sep 2023 19:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343727AbjICRCn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Sep 2023 13:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbjICRCm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Sep 2023 13:02:42 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651ED10A
        for <linux-gpio@vger.kernel.org>; Sun,  3 Sep 2023 10:02:37 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-79df12ff0f0so259821241.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 Sep 2023 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693760556; x=1694365356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChF7THDjn6nGJerOJ4K0rQrL8YxuU1sfo/4nzZ83Szw=;
        b=ssY9YCybjEOpEkxvjvrWW6Ej0D132JdC7acxvJXKoay6WGB5AkfIctL7Jq2UxzhB9o
         e4f+LQWLnp7RsMDqVFl7fn1FX6PpN3+pIPF87w2BPZ4Gli2Jxknefk1I+mWl0Z7cPiRu
         r0t2K452dxeR5eCHnH48qhCHZ6sSaZQUZLQkNkQdmzcZR6e0e4GIJKwi6FwvNcc0eSNK
         s2qiUqqBlCbxtBWKfFKd/9l+vZyq85NFGDPKsZmzt6CJDLPH+fuUWrexYZWkWD838Cz+
         Netv+F4Kz2uRlDFKaK1u0XdJUqZlgoszWjRahpxPlz6AtLkKcrXXYfOVOD/yeEetJ4vT
         U0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693760556; x=1694365356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChF7THDjn6nGJerOJ4K0rQrL8YxuU1sfo/4nzZ83Szw=;
        b=lasKqw74uxNm+p/Y5y3h1sjh2gd7t1jo6Bqxfppg1Fv+nzgi4757SENZAWPllYnI77
         K3d5PyNhTnurUoRceYD4YNzc98IJiZaey7PdEheIJCKJShqv3GwiuIksbTwkhYDKiuqn
         DzPWxhZFMq86Kel7UqNoWvHK+jYQGRDuhaAfAAuPuRi1hSGXnj9PEynpnjgFTSs5C3Vb
         +otnLSTZnqB6P5QlqeGtb8C/9yzbbhrsOphxRBNgjoX+75RPlU3gCgidQYbxxVhtahyb
         +zZ5mpVC0U77Cb25C9KwtsI+XffeIL3Cyu8/R3kiZg1Pp5cFqeoD78f1RvdiCTHChEGy
         E5pQ==
X-Gm-Message-State: AOJu0YztC17LV2Nukb8EIXAaaGs2hHQ2UbLwV5xlL1hdNQMFRpev+hLV
        2lwqzZqD14rJUAtlAB8ELUHsNkNK/BAWSTJAx7DVmQ==
X-Google-Smtp-Source: AGHT+IEZlUODYcfxuB5DATMcYGe4rC7+/g+41ydAjEzwpiDUTh/zY/v3GObLUY/j9wJey+nCZLQpZAu91JPo0cwy8s0=
X-Received: by 2002:a67:f5d8:0:b0:44d:63a3:4be4 with SMTP id
 t24-20020a67f5d8000000b0044d63a34be4mr7751365vso.29.1693760556472; Sun, 03
 Sep 2023 10:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <ceeda269bceee1c805f148bcbc628abc9d42601a.1693721348.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ceeda269bceee1c805f148bcbc628abc9d42601a.1693721348.git.christophe.jaillet@wanadoo.fr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 3 Sep 2023 19:02:25 +0200
Message-ID: <CAMRc=Meq+1z50=tXXt3MFAexRCmfSQ5rs6hT7311KRGO=q2RHQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linus.walleij@linaro.org, andy@kernel.org, galak@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
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

On Sun, Sep 3, 2023 at 8:13=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after a successful irq_domain_add_linear() call, it
> should be undone by a corresponding irq_domain_remove(), as already done
> in the remove function.
>
> Fixes: c6ce2b6bffe5 ("gpio: add TB10x GPIO driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpio/gpio-tb10x.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 78f8790168ae..f96d260a4a19 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -195,7 +195,7 @@ static int tb10x_gpio_probe(struct platform_device *p=
dev)
>                                 handle_edge_irq, IRQ_NOREQUEST, IRQ_NOPRO=
BE,
>                                 IRQ_GC_INIT_MASK_CACHE);
>                 if (ret)
> -                       return ret;
> +                       goto err_remove_domain;
>
>                 gc =3D tb10x_gpio->domain->gc->gc[0];
>                 gc->reg_base                         =3D tb10x_gpio->base=
;
> @@ -209,6 +209,10 @@ static int tb10x_gpio_probe(struct platform_device *=
pdev)
>         }
>
>         return 0;
> +
> +err_remove_domain:
> +       irq_domain_remove(tb10x_gpio->domain);
> +       return ret;
>  }
>
>  static int tb10x_gpio_remove(struct platform_device *pdev)
> --
> 2.34.1
>

That's not enough, you also need to dispose of all remaining mappings.
Please see drivers/gpio/gpiolib.c and how it handles the gpio_irq_chip
domain.

Bartosz
