Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DD7365116
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 05:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhDTDsZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 23:48:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhDTDsZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Apr 2021 23:48:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88EAD613B4;
        Tue, 20 Apr 2021 03:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618890474;
        bh=u5wPhL7Ene2VdmBvCDyRNlC2PWZ8+C9tJOnEa861pDY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vQF3+NV/L20k4H/VkmU59owGFRZtRE8Frf27nST/aViXOdbrm1oPx7Tz1ZzWW4S1F
         s3R5xJOvjV781uCDFsM4UDu/IenrDw9TY7pphBUdpexG87VdY2DHm34XzCR2HLqku2
         P+elRgNGG0IEsnTcofDtHuOZUbMhfAUB7NxQljyZQGDus/IMOi+xPFqZ3wfzZw2ARD
         iRn/74YDSJt8oM3g1l8+9WhgRwzXDXAafIfkgZzlyEXnbo+E+GQtsGA0J3jUF7Ua7r
         9dJ4GmHMp8co2Z6lOuDkeK5yVbbWRVrztbrUfRjhoigJdvazX4K1Lv8dFdIGOncnLj
         1Lkc4YWyjpSVw==
Received: by mail-ed1-f53.google.com with SMTP id z5so6778709edr.11;
        Mon, 19 Apr 2021 20:47:54 -0700 (PDT)
X-Gm-Message-State: AOAM531Rh0hbQUgcAHs0gnDzXQF7w8ZcVK5lZbmjI3y+TKF/JXKqgyXm
        D3eqtSaMr92CDjkZ+kk4PccorJYUKSCCOE/7GrQ=
X-Google-Smtp-Source: ABdhPJzbjU7jOrcMXgf5wS+UarAeT2b6g7MZ2uy1tkRai7qsw4N1ya/Nrh3tKlx1ENX8XLkHHcYsR0TBN4a3ho35o5A=
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr8049415edr.319.1618890473085;
 Mon, 19 Apr 2021 20:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com> <20210413055702.27535-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-4-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Mon, 19 Apr 2021 20:47:42 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzr22hShK5F2qcPNH3yXxGZx=DUmoa0r8d6Fn=c-U2=j0g@mail.gmail.com>
Message-ID: <CAGp9Lzr22hShK5F2qcPNH3yXxGZx=DUmoa0r8d6Fn=c-U2=j0g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: add drive for I2C related pins on MT8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com,
        =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= 
        <eddie.huang@mediatek.com>, jg_poxu@mediatek.com,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>,
        seiya.wang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides the advanced drive raw data setting version
> for I2C used pins on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  5 +++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index 063f164d7c9b..a7500e18bb1d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -760,6 +760,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
>         PIN_FIELD_BASE(143, 143, 1, 0x020, 0x10, 24, 3),
>  };
>
> +static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
> +       PIN_FIELD_BASE(8, 8, 4, 0x020, 0x10, 15, 3),
> +       PIN_FIELD_BASE(9, 9, 4, 0x020, 0x10, 0, 3),
> +       PIN_FIELD_BASE(10, 10, 4, 0x020, 0x10, 18, 3),
> +       PIN_FIELD_BASE(11, 11, 4, 0x020, 0x10, 3, 3),
> +       PIN_FIELD_BASE(12, 12, 4, 0x020, 0x10, 21, 3),
> +       PIN_FIELD_BASE(13, 13, 4, 0x020, 0x10, 6, 3),
> +       PIN_FIELD_BASE(14, 14, 4, 0x020, 0x10, 24, 3),
> +       PIN_FIELD_BASE(15, 15, 4, 0x020, 0x10, 9, 3),
> +       PIN_FIELD_BASE(16, 16, 4, 0x020, 0x10, 27, 3),
> +       PIN_FIELD_BASE(17, 17, 4, 0x020, 0x10, 12, 3),
> +       PIN_FIELD_BASE(29, 29, 2, 0x020, 0x10, 0, 3),
> +       PIN_FIELD_BASE(30, 30, 2, 0x020, 0x10, 3, 3),
> +       PIN_FIELD_BASE(34, 34, 1, 0x040, 0x10, 0, 3),
> +       PIN_FIELD_BASE(35, 35, 1, 0x040, 0x10, 3, 3),
> +       PIN_FIELD_BASE(44, 44, 1, 0x040, 0x10, 6, 3),
> +       PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
> +};
> +
>  static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
>         [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
> @@ -773,6 +792,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8195_pin_pupd_range),
>         [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
>         [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
> +       [PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
>  };
>
>  static const char * const mt8195_pinctrl_register_base_names[] = {
> @@ -801,6 +821,8 @@ static const struct mtk_pin_soc mt8195_data = {
>         .bias_get_combo = mtk_pinconf_bias_get_combo,
>         .drive_set = mtk_pinconf_drive_set_rev1,
>         .drive_get = mtk_pinconf_drive_get_rev1,
> +       .adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +       .adv_drive_set = mtk_pinconf_adv_drive_set_raw,
>  };
>
>  static const struct of_device_id mt8195_pinctrl_of_match[] = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 72f17f26acd8..2b51f4a9b860 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -1027,6 +1027,20 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
>
> +int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, arg);
> +}
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set_raw);
> +
> +int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 *val)
> +{
> +       return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, val);
> +}
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get_raw);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
>  MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index e2aae285b5fc..fd5ce9c5dcbd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -66,6 +66,7 @@ enum {
>         PINCTRL_PIN_REG_DRV_EN,
>         PINCTRL_PIN_REG_DRV_E0,
>         PINCTRL_PIN_REG_DRV_E1,
> +       PINCTRL_PIN_REG_DRV_ADV,
>         PINCTRL_PIN_REG_MAX,
>  };
>
> @@ -314,6 +315,10 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, u32 arg);
>  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, u32 *val);
> +int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 *val);
>
>  bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
>  #endif /* __PINCTRL_MTK_COMMON_V2_H */
> --
> 2.18.0
>
