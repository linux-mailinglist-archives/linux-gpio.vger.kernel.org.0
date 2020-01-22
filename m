Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53ED4145C95
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 20:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgAVTlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 14:41:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:38330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgAVTlt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 14:41:49 -0500
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55FB62465A;
        Wed, 22 Jan 2020 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579722108;
        bh=e9Bx3cpa8c9tVIw9Lu1g7sNSWpGserqqeFYjYE4gSC4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LsNumBbK5m2fDieVpvj7b802xW7FYj1pkAa9ZrlPM7q4sKL2fQ9gMM5cSRkTpidum
         +okRbEgag0ntj4pH65vHTRkxQcpOWwo75vW/Ak1MLSTOIb440SwQklIc4JeGGypopq
         0tFTdhKTMBOFdkzc7S4WOeFYjERxBVMUJdmyVfis=
Received: by mail-io1-f48.google.com with SMTP id t26so427748ioi.13;
        Wed, 22 Jan 2020 11:41:48 -0800 (PST)
X-Gm-Message-State: APjAAAUPModunUzKPmQCU/qSe2v+dJP4tgHtRi8G+zG1xwAe3VUeYkH2
        w+sgC9XKYai03ayMNnm4aNxWnEPa1Tzn2wWOvqo=
X-Google-Smtp-Source: APXvYqzNhoo+FOYzF0plXSs0nQOgPxMnKRmuYNHa8geFuUFnPU9aCTgCGHogerFgIT+EU8u4QVRWiBJ9ZkOn2ZReuhc=
X-Received: by 2002:a5d:9d11:: with SMTP id j17mr988679ioj.83.1579722107745;
 Wed, 22 Jan 2020 11:41:47 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com> <1579675994-7001-2-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-2-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 22 Jan 2020 11:41:37 -0800
X-Gmail-Original-Message-ID: <CAGp9LzpuuOWuhK9GfKnQNrTxM_kH3c8vYBt154kGY8jy=5zc8g@mail.gmail.com>
Message-ID: <CAGp9LzpuuOWuhK9GfKnQNrTxM_kH3c8vYBt154kGY8jy=5zc8g@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] pinctrl: mediatek: Supporting driving setting
 without mapping current to register value
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 21, 2020 at 10:53 PM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> MediaTek's smartphone project actual usage does need to know current value
> (in mA) in procedure of finding the best driving setting.
> The steps in the procedure is like as follow:
>
> 1. set driving setting field in setting register as 0, measure waveform,
>    perform test, and etc.
> 2. set driving setting field in setting register as 1, measure waveform,
>    perform test, and etc.
> ...
> n. set driving setting field in setting register as n-1, measure
>    waveform, perform test, and etc.
> Check the results of steps 1~n and adopt the setting that get best result.
>
> This procedure does need to know the mapping between current to register
> value.
> Therefore, setting driving without mapping current is more practical for
> MediaTek's smartphone usage.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++--
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 12 ++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  5 +++++
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 32451e8..1212264 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1077,8 +1077,8 @@
>         .bias_disable_get = mtk_pinconf_bias_disable_get,
>         .bias_set = mtk_pinconf_bias_set,
>         .bias_get = mtk_pinconf_bias_get,
> -       .drive_set = mtk_pinconf_drive_set_rev1,
> -       .drive_get = mtk_pinconf_drive_get_rev1,
> +       .drive_set = mtk_pinconf_drive_set_raw,
> +       .drive_get = mtk_pinconf_drive_get_raw,
>         .adv_pull_get = mtk_pinconf_adv_pull_get,
>         .adv_pull_set = mtk_pinconf_adv_pull_set,
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index d63e05e..2247eae 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -608,6 +608,18 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> +}
> +
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val)
> +{
> +       return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> +}
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 1b7da42..75d0e07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -288,6 +288,11 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>                                const struct mtk_pin_desc *desc, int *val);
>
> +int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc, int *val);
> +
>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, bool pullup,
>                              u32 arg);
> --
> 1.8.1.1.dirty
