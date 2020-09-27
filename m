Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDF127A25C
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 20:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgI0SjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 14:39:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgI0SjP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 27 Sep 2020 14:39:15 -0400
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1736823A34;
        Sun, 27 Sep 2020 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601231955;
        bh=ufALKz1q13Sp1G9pTzVWJq9Q1h8p8JU3W/56CmJ0ZS0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kac0eHuFG0YFdPk3SGPh90/lS+yAQpBBt7wXoJ3mz352++AlzEiezW+UxtH+l9hYZ
         WiwLHpgSc3mCtciJ8aRaCwxSi7XhEjAkEZqF/8CBjN1AqREvjKrb3T3eTG12SqsCNe
         Lbe+Rrgl2SjkUtugP2IAg8oWAVS59mUHWAL0m9bc=
Received: by mail-io1-f48.google.com with SMTP id r9so8832589ioa.2;
        Sun, 27 Sep 2020 11:39:15 -0700 (PDT)
X-Gm-Message-State: AOAM531JIbXQxklxjK20Gfmw4r6/9xC9L39xn35kHMr+A+oj0760A/kj
        UWih0w9F2kDXd/KOMXozjAGC0jXsP4Qnf72/Lbc=
X-Google-Smtp-Source: ABdhPJz+78g3vvZjop19EkMo/szs1TmRRk+mu7AQEdXsiYi9+WwNrZpOgx8s3j8bVsqhIPaJiE+v57HiA1bMcpOHQv4=
X-Received: by 2002:a05:6638:d96:: with SMTP id l22mr6111864jaj.97.1601231954482;
 Sun, 27 Sep 2020 11:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
In-Reply-To: <20200921131056.92848-1-miaoqinglang@huawei.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Sun, 27 Sep 2020 11:39:03 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo0R=7diO62sWwfKFTn7WZFnFbE2aQDV8Yh8UZ4=bm8mA@mail.gmail.com>
Message-ID: <CAGp9Lzo0R=7diO62sWwfKFTn7WZFnFbE2aQDV8Yh8UZ4=bm8mA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2020 at 6:10 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> Simplify the return expression.
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2f3dfb56c..16bb15226 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -479,14 +479,8 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
>  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
>                                       const struct mtk_pin_desc *desc)
>  {
> -       int err;
> -
> -       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
> -                              MTK_DISABLE);
> -       if (err)
> -               return err;
> -
> -       return 0;
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
> +                               MTK_DISABLE);
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
>
> --
> 2.23.0
>
