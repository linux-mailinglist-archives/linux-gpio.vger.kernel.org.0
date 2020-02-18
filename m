Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EA5161E81
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 02:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgBRBZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 20:25:33 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33554 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgBRBZd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 20:25:33 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01I1POvY029003;
        Tue, 18 Feb 2020 10:25:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01I1POvY029003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581989125;
        bh=3MSw5JkyO/9OCsOPRafhwqlFQ7vR48exeqQSqYgqIIk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YWjMhh0RDcuF1rO+m3rS+CCSH36MMqHbRScYqqwvGFMku4Tq+v22CxsX/fM++yXyw
         1DHR6fMH6vHE1heRP/TFE/EXFFbvg9rRE6E6qb/6ZBx5OpdtdNwXGrT/vmdPq+hdqV
         +7dnSo43yaPKVv3+lBhpbcIJMWkjAvJTFaMoKNvwxvIHpNUMxB0mLcWEDRVu2noWpP
         BSi55H6OkKOQHkM1t4FXEEBnwuQQbfTdZRjx1OLWKeRVVK447bGPfq8fmZ4KvQBZDD
         KKh2OrmNwAV2g/99xnOY0M7g8n8yT6NXrHz7zH35sobirTwOt1XTVzuaxNHIFsrPf4
         QU1+QB3oo5eHA==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id g13so6873499uab.7;
        Mon, 17 Feb 2020 17:25:24 -0800 (PST)
X-Gm-Message-State: APjAAAVNZzb3Q+ZiVQpWa2XzDnRhhas7F/k8RZzRx5Xwu9/FZsS3D5Tr
        UkWI0Xn9jNQrVBaHpYWwZkMI0l5I2jat3a5JXDE=
X-Google-Smtp-Source: APXvYqyMjSb6Wor89MN0MqasMN0Ke1opsU3txiROIMZz+gj33FtHTfdKKQM+xuUZHJtMCoN2zBnUWZRVF3IUcxqLjh0=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr9271966uap.95.1581989123428;
 Mon, 17 Feb 2020 17:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20200217185437.GA20901@embeddedor>
In-Reply-To: <20200217185437.GA20901@embeddedor>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 18 Feb 2020 10:24:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6mKUnr5bJSNy7aVzcdS7tzsj1VEbbsFA2Y3_7vpUi2A@mail.gmail.com>
Message-ID: <CAK7LNAR6mKUnr5bJSNy7aVzcdS7tzsj1VEbbsFA2Y3_7vpUi2A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: uniphier: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 3:52 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


> ---
>  drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
> index 57babf31e320..ade348b49b31 100644
> --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
> +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
> @@ -29,7 +29,7 @@ struct uniphier_pinctrl_reg_region {
>         struct list_head node;
>         unsigned int base;
>         unsigned int nregs;
> -       u32 vals[0];
> +       u32 vals[];
>  };
>
>  struct uniphier_pinctrl_priv {
> --
> 2.25.0
>


-- 
Best Regards
Masahiro Yamada
