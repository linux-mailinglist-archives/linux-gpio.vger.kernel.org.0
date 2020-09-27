Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F6B27A254
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 20:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgI0S35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 14:29:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbgI0S35 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 27 Sep 2020 14:29:57 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7F0C23A40
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601231396;
        bh=o48bCQ4LqnPM5NZOhjvfrMyLLYDLJHOdXNzF4bg4daE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TsX1Hi+BoejwOjfm6vB78EmSBSznYSnIX6+fONLn0XcJEGm7PMKvT+LBnw7ZMSbiT
         +glc7VNjN9S7i35txK9zyD8mRQb3r0nh5KJwQgf8LQO1vzQQLGuZbuYE0aCpwXi7xi
         4zS3ImXiEgYBqnLVckYr0RZ4g/6QqoFh+1HsaZFY=
Received: by mail-io1-f49.google.com with SMTP id z25so8741094iol.10
        for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2020 11:29:56 -0700 (PDT)
X-Gm-Message-State: AOAM533Qob11kF/FaFF4RKWUnhPXXlUX/Bzb03iOjoaES0LXOiT/10aQ
        4d6FRlTM5aHDIll7gyA/yFvZIA6HGdYSQles9tU=
X-Google-Smtp-Source: ABdhPJzO12pxlidI5kGU9QGUWbGi/ZljqhWOXRJgX4k9iI120oPZRWbZcGpjjYlWpvzsRjZnhzTlKTS6DH8cMcm6sbY=
X-Received: by 2002:a6b:b7cf:: with SMTP id h198mr4909784iof.55.1601231396068;
 Sun, 27 Sep 2020 11:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
In-Reply-To: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Sun, 27 Sep 2020 11:29:44 -0700
X-Gmail-Original-Message-ID: <CAGp9LzotAgyN0L9fKgodAuQ6ax5FLE=uiNj568=iHE4guJj5yw@mail.gmail.com>
Message-ID: <CAGp9LzotAgyN0L9fKgodAuQ6ax5FLE=uiNj568=iHE4guJj5yw@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: use devm_platform_ioremap_resource_byname()
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 11:39 PM Wang Xiaojun <wangxiaojun11@huawei.com> wrote:
>
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c         | 11 ++---------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  9 +--------
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 11 ++---------
>  3 files changed, 5 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index aa1068d2867f..5e00f93ac998 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -589,7 +589,6 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc)
>  {
>         struct pinctrl_pin_desc *pins;
> -       struct resource *res;
>         struct mtk_pinctrl *hw;
>         int err, i;
>
> @@ -612,14 +611,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
>                 return -ENOMEM;
>
>         for (i = 0; i < hw->soc->nbase_names; i++) {
> -               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                                                  hw->soc->base_names[i]);
> -               if (!res) {
> -                       dev_err(&pdev->dev, "missing IO resource\n");
> -                       return -ENXIO;
> -               }
> -
> -               hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> +                                               hw->soc->base_names[i]);
>                 if (IS_ERR(hw->base[i]))
>                         return PTR_ERR(hw->base[i]);
>         }
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2f3dfb56c3fa..e8622c7e117a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -354,7 +354,6 @@ static const struct mtk_eint_xt mtk_eint_xt = {
>  int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> -       struct resource *res;
>
>         if (!IS_ENABLED(CONFIG_EINT_MTK))
>                 return 0;
> @@ -366,13 +365,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>         if (!hw->eint)
>                 return -ENOMEM;
>
> -       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
> -       if (!res) {
> -               dev_err(&pdev->dev, "Unable to get eint resource\n");
> -               return -ENODEV;
> -       }
> -
> -       hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
> +       hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
>         if (IS_ERR(hw->eint->base))
>                 return PTR_ERR(hw->eint->base);
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index a23c18251965..623af4410b07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -940,7 +940,6 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>  {
>         struct pinctrl_pin_desc *pins;
>         struct mtk_pinctrl *hw;
> -       struct resource *res;
>         int err, i;
>
>         hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
> @@ -963,14 +962,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                 return -ENOMEM;
>
>         for (i = 0; i < hw->soc->nbase_names; i++) {
> -               res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -                                                  hw->soc->base_names[i]);
> -               if (!res) {
> -                       dev_err(&pdev->dev, "missing IO resource\n");
> -                       return -ENXIO;
> -               }
> -
> -               hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
> +               hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
> +                                       hw->soc->base_names[i]);
>                 if (IS_ERR(hw->base[i]))
>                         return PTR_ERR(hw->base[i]);
>         }
> --
> 2.25.1
>
