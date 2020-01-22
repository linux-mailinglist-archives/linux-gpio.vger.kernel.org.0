Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34D3145C9B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 20:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAVTnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 14:43:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:40520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725827AbgAVTnL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 14:43:11 -0500
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1F6C24656;
        Wed, 22 Jan 2020 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579722191;
        bh=A90BQl2RN2zbfyWz1gVKm18acKQthqJdIb4G83Hj8zw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OIts7Fe5sKuVNBOHwDMDngnIZ5ZZUdqywiV0gklD8cZ89LANd1gvTpVdvz7C/w572
         qPQw9nlzvENXfN2U6IpN2w6h3+eu8DGep0/3Je9DyKp1igtSJj4VFR/a02y4jEP+Pt
         wo4gGrYC6OzXA9ZNI/DQMn2+zq1irtB6/hHOMgO0=
Received: by mail-io1-f46.google.com with SMTP id d15so506068iog.3;
        Wed, 22 Jan 2020 11:43:10 -0800 (PST)
X-Gm-Message-State: APjAAAUCM7yCkyUW8QwosjnTs2fdYWBhOILA4oALqfzOrPfxp7IMEnIw
        AYozwZCb4EsrcGwg1gA1CxE8x2n4A01odaI0V3I=
X-Google-Smtp-Source: APXvYqzdEnlQiuzPtG5eVAR0sRe8hnTBInOwWTvmLS9vE8nNrXJp7n6ilt+ClJZ78Hhs87Zp1aVUE38mh90sY2c5KgA=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr8435332ioh.264.1579722190438;
 Wed, 22 Jan 2020 11:43:10 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com> <1579675994-7001-4-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-4-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 22 Jan 2020 11:42:59 -0800
X-Gmail-Original-Message-ID: <CAGp9LzpA3fGC8wHuEiJjkju1DLTt-3NJL7Q7SerxAP68B2pXZQ@mail.gmail.com>
Message-ID: <CAGp9LzpA3fGC8wHuEiJjkju1DLTt-3NJL7Q7SerxAP68B2pXZQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] pinctrl: mediatek: Refine mtk_pinconf_get()
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
> Correct cases for PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_SCHMITT_ENABLE,
> and PIN_CONFIG_OUTPUT_ENABLE -
> Use variable ret to receive value in mtk_hw_get_value() (instead of
> variable val) since pinconf_to_config_packed() at end of this function
> use variable ret to pack config value.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 40 ++++++++++++--------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 2f07500..d09a726 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -78,7 +78,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         u32 param = pinconf_to_config_param(*config);
> -       int val, val2, err, reg, ret = 1;
> +       int err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
>         if (pin >= hw->soc->npins) {
> @@ -107,17 +107,11 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>                         err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
> -               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &val);
> -               if (err)
> -                       return err;
> -
> -               if (!val)
> -                       return -EINVAL;
> -
> +               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
>                 break;
>         case PIN_CONFIG_INPUT_ENABLE:
>         case PIN_CONFIG_OUTPUT_ENABLE:
> -               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
> +               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
>                 if (err)
>                         goto out;
>                 /*     CONFIG     Current direction return value
> @@ -128,20 +122,22 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>                  *                     input        1 (= reverse HW value)
>                  */
>                 if (param == PIN_CONFIG_INPUT_ENABLE)
> -                       val = !val;
> +                       ret = !ret;
>
>                 break;
>         case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &val);
> +               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
>                 if (err)
> -                       return err;
> -
> -               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &val2);
> -               if (err)
> -                       return err;
> +                       goto out;
> +               /* return error when in output mode
> +                * because schmitt trigger only work in input mode
> +                */
> +               if (ret) {
> +                       err = -EINVAL;
> +                       goto out;
> +               }
>
> -               if (val || !val2)
> -                       return -EINVAL;
> +               err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
>
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> @@ -154,13 +150,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
>                        PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
> -
> -               err = mtk_hw_get_value(hw, desc, reg, &val);
> -               if (err)
> -                       return err;
> -
> -               ret = val;
> -
> +               err = mtk_hw_get_value(hw, desc, reg, &ret);
>                 break;
>         case MTK_PIN_CONFIG_PU_ADV:
>         case MTK_PIN_CONFIG_PD_ADV:
> --
> 1.8.1.1.dirty
