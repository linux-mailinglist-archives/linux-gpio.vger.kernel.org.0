Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34F03FD75F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 12:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhIAKLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Sep 2021 06:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhIAKLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Sep 2021 06:11:11 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8437FC061575
        for <linux-gpio@vger.kernel.org>; Wed,  1 Sep 2021 03:10:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l18so3883042lji.12
        for <linux-gpio@vger.kernel.org>; Wed, 01 Sep 2021 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJRKO21/7XieULE7VWPcjH11lJFU0++JiRDyw3Tcqew=;
        b=YEBda+DM01sgsqOzBByJHbTMBN8iumCJxtDigvoKuFWke5PIMjPKdejddb8CwKEJha
         9x9kshlH7YYGJHz0aIUev9hF0IMWI2NyUDEc0kE3+/jgvtdGGfIZ+MijS1hMZgZ+cWMe
         CFhDlM2c93Jrluh1TFMtzyJ8DTnIGf4OlJmb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJRKO21/7XieULE7VWPcjH11lJFU0++JiRDyw3Tcqew=;
        b=X19Sst2aoo3TBbT811Owoj6VKQBuhYoNFNmR0UVCTOhklTxYQUvEEgFGSGLx1BG2wo
         4e387hUJYb6fs+oEaKoYCsbKvsf+3Wo1guZjx1mZF5Z86jPc0iQkFalU7DSaO8GZzSqQ
         uS0vcDKFtbvnrdRpPb6hkAKRroBFmvlMgdbFWD+qzvvQgQOStXtGEszYSEdnSjvJTmz7
         qQSxi4OJgHfRWp6rH3jwW/E0q5wsUCUYjigdrGVFTcTylhsXfiOY7GmS8xVG70gdUyHE
         7FAzJTWRyOQ/6JXaYsl5M5ekx+Q7ysLCQMic2/s1eXx6/P8OVlGZ50AKc+SD/m4gPC/D
         5T5A==
X-Gm-Message-State: AOAM532rpqnoBzu5/GwMyvtVr0Z8ZvHKNetvxPtySgf3wx6yxtp6eAHr
        NQ+C7obFrwBbq3CyQHBhe5aXzbpJL4on6ppdop4eXg==
X-Google-Smtp-Source: ABdhPJx4ln2LKZ1xyU4rgzS+icF46LoFOKDzotdOPxnhiGtHoHpmNKkvwgz1mStpFWSjaCeM+Da12slSQCdEABk78t8=
X-Received: by 2002:a2e:8546:: with SMTP id u6mr28953495ljj.185.1630491012645;
 Wed, 01 Sep 2021 03:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com> <20210830003603.31864-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210830003603.31864-5-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 1 Sep 2021 18:10:01 +0800
Message-ID: <CAGXv+5H5KnskzBYuqniBGQWBLriyFkBvVXEk1Cyg6XSmKMWP8w@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] pinctrl: mediatek: add rsel setting on MT8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Aug 30, 2021 at 8:37 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides rsel setting on MT8195

A bit more context, like what is rsel, would be nice.

>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 133 +++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 181 ++++++++++++++++--
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  35 +++-
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 ++-
>  drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
>  5 files changed, 348 insertions(+), 27 deletions(-)

Could you split this patch into two, so the common parts are in the first
patch, and the mt8195 specific changes are in the second?

>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index 892e79703f98..275b7ba4386d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -779,6 +779,135 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
>         PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
>  };
>
> +static const struct mtk_pin_field_calc mt8195_pin_rsel_range[] = {
> +       PIN_FIELD_BASE(8, 8, 4, 0x0c0, 0x10, 15, 3),
> +       PIN_FIELD_BASE(9, 9, 4, 0x0c0, 0x10, 0, 3),
> +       PIN_FIELD_BASE(10, 10, 4, 0x0c0, 0x10, 18, 3),
> +       PIN_FIELD_BASE(11, 11, 4, 0x0c0, 0x10, 3, 3),
> +       PIN_FIELD_BASE(12, 12, 4, 0x0c0, 0x10, 21, 3),
> +       PIN_FIELD_BASE(13, 13, 4, 0x0c0, 0x10, 6, 3),
> +       PIN_FIELD_BASE(14, 14, 4, 0x0c0, 0x10, 24, 3),
> +       PIN_FIELD_BASE(15, 15, 4, 0x0c0, 0x10, 9, 3),
> +       PIN_FIELD_BASE(16, 16, 4, 0x0c0, 0x10, 27, 3),
> +       PIN_FIELD_BASE(17, 17, 4, 0x0c0, 0x10, 12, 3),
> +       PIN_FIELD_BASE(29, 29, 2, 0x080, 0x10, 0, 3),
> +       PIN_FIELD_BASE(30, 30, 2, 0x080, 0x10, 3, 3),
> +       PIN_FIELD_BASE(34, 34, 1, 0x0e0, 0x10, 0, 3),
> +       PIN_FIELD_BASE(35, 35, 1, 0x0e0, 0x10, 3, 3),
> +       PIN_FIELD_BASE(44, 44, 1, 0x0e0, 0x10, 6, 3),
> +       PIN_FIELD_BASE(45, 45, 1, 0x0e0, 0x10, 9, 3),
> +};
> +
> +static const struct mtk_pin_rsel mt8195_pin_rsel_val_range[] = {
> +       PIN_RSEL(8, 17, 0x0, 75000, 75000),
> +       PIN_RSEL(8, 17, 0x1, 10000, 5000),
> +       PIN_RSEL(8, 17, 0x2, 5000, 75000),
> +       PIN_RSEL(8, 17, 0x3, 4000, 5000),
> +       PIN_RSEL(8, 17, 0x4, 3000, 75000),
> +       PIN_RSEL(8, 17, 0x5, 2000, 5000),
> +       PIN_RSEL(8, 17, 0x6, 1500, 75000),
> +       PIN_RSEL(8, 17, 0x7, 1000, 5000),
> +       PIN_RSEL(29, 30, 0x0, 75000, 75000),
> +       PIN_RSEL(29, 30, 0x1, 10000, 5000),
> +       PIN_RSEL(29, 30, 0x2, 5000, 75000),
> +       PIN_RSEL(29, 30, 0x3, 4000, 5000),
> +       PIN_RSEL(29, 30, 0x4, 3000, 75000),
> +       PIN_RSEL(29, 30, 0x5, 2000, 5000),
> +       PIN_RSEL(29, 30, 0x6, 1500, 75000),
> +       PIN_RSEL(29, 30, 0x7, 1000, 5000),
> +       PIN_RSEL(34, 35, 0x0, 75000, 75000),
> +       PIN_RSEL(34, 35, 0x1, 10000, 5000),
> +       PIN_RSEL(34, 35, 0x2, 5000, 75000),
> +       PIN_RSEL(34, 35, 0x3, 4000, 5000),
> +       PIN_RSEL(34, 35, 0x4, 3000, 75000),
> +       PIN_RSEL(34, 35, 0x5, 2000, 5000),
> +       PIN_RSEL(34, 35, 0x6, 1500, 75000),
> +       PIN_RSEL(34, 35, 0x7, 1000, 5000),
> +       PIN_RSEL(44, 45, 0x0, 75000, 75000),
> +       PIN_RSEL(44, 45, 0x1, 10000, 5000),
> +       PIN_RSEL(44, 45, 0x2, 5000, 75000),
> +       PIN_RSEL(44, 45, 0x3, 4000, 5000),
> +       PIN_RSEL(44, 45, 0x4, 3000, 75000),
> +       PIN_RSEL(44, 45, 0x5, 2000, 5000),
> +       PIN_RSEL(44, 45, 0x6, 1500, 75000),
> +       PIN_RSEL(44, 45, 0x7, 1000, 5000),
> +};
> +
> +static const unsigned int mt8195_pull_type[] = {
> +       MTK_PULL_PUPD_R1R0_TYPE /* 0 */, MTK_PULL_PUPD_R1R0_TYPE /* 1 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 2 */, MTK_PULL_PUPD_R1R0_TYPE /* 3 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 4 */, MTK_PULL_PUPD_R1R0_TYPE /* 5 */,
> +       MTK_PULL_PU_PD_TYPE /* 6 */, MTK_PULL_PU_PD_TYPE /* 7 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 8 */, MTK_PULL_PU_PD_RSEL_TYPE /* 9 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 10 */, MTK_PULL_PU_PD_RSEL_TYPE /* 11 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 12 */, MTK_PULL_PU_PD_RSEL_TYPE /* 13 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 14 */, MTK_PULL_PU_PD_RSEL_TYPE /* 15 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 16 */, MTK_PULL_PU_PD_RSEL_TYPE /* 17 */,
> +       MTK_PULL_PU_PD_TYPE /* 18 */, MTK_PULL_PU_PD_TYPE /* 19 */,
> +       MTK_PULL_PU_PD_TYPE /* 20 */, MTK_PULL_PU_PD_TYPE /* 21 */,
> +       MTK_PULL_PU_PD_TYPE /* 22 */, MTK_PULL_PU_PD_TYPE /* 23 */,
> +       MTK_PULL_PU_PD_TYPE /* 24 */, MTK_PULL_PU_PD_TYPE /* 25 */,
> +       MTK_PULL_PU_PD_TYPE /* 26 */, MTK_PULL_PU_PD_TYPE /* 27 */,
> +       MTK_PULL_PU_PD_TYPE /* 28 */, MTK_PULL_PU_PD_RSEL_TYPE /* 29 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 30 */, MTK_PULL_PU_PD_TYPE /* 31 */,
> +       MTK_PULL_PU_PD_TYPE /* 32 */, MTK_PULL_PU_PD_TYPE /* 33 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 34 */, MTK_PULL_PU_PD_RSEL_TYPE /* 35 */,
> +       MTK_PULL_PU_PD_TYPE /* 36 */, MTK_PULL_PU_PD_TYPE /* 37 */,
> +       MTK_PULL_PU_PD_TYPE /* 38 */, MTK_PULL_PU_PD_TYPE /* 39 */,
> +       MTK_PULL_PU_PD_TYPE /* 40 */, MTK_PULL_PU_PD_TYPE /* 41 */,
> +       MTK_PULL_PU_PD_TYPE /* 42 */, MTK_PULL_PU_PD_TYPE /* 43 */,
> +       MTK_PULL_PU_PD_RSEL_TYPE /* 44 */, MTK_PULL_PU_PD_RSEL_TYPE /* 45 */,
> +       MTK_PULL_PU_PD_TYPE /* 46 */, MTK_PULL_PU_PD_TYPE /* 47 */,
> +       MTK_PULL_PU_PD_TYPE /* 48 */, MTK_PULL_PU_PD_TYPE /* 49 */,
> +       MTK_PULL_PU_PD_TYPE /* 50 */, MTK_PULL_PU_PD_TYPE /* 51 */,
> +       MTK_PULL_PU_PD_TYPE /* 52 */, MTK_PULL_PU_PD_TYPE /* 53 */,
> +       MTK_PULL_PU_PD_TYPE /* 54 */, MTK_PULL_PU_PD_TYPE /* 55 */,
> +       MTK_PULL_PU_PD_TYPE /* 56 */, MTK_PULL_PU_PD_TYPE /* 57 */,
> +       MTK_PULL_PU_PD_TYPE /* 58 */, MTK_PULL_PU_PD_TYPE /* 59 */,
> +       MTK_PULL_PU_PD_TYPE /* 60 */, MTK_PULL_PU_PD_TYPE /* 61 */,
> +       MTK_PULL_PU_PD_TYPE /* 62 */, MTK_PULL_PU_PD_TYPE /* 63 */,
> +       MTK_PULL_PU_PD_TYPE /* 64 */, MTK_PULL_PU_PD_TYPE /* 65 */,
> +       MTK_PULL_PU_PD_TYPE /* 66 */, MTK_PULL_PU_PD_TYPE /* 67 */,
> +       MTK_PULL_PU_PD_TYPE /* 68 */, MTK_PULL_PU_PD_TYPE /* 69 */,
> +       MTK_PULL_PU_PD_TYPE /* 70 */, MTK_PULL_PU_PD_TYPE /* 71 */,
> +       MTK_PULL_PU_PD_TYPE /* 72 */, MTK_PULL_PU_PD_TYPE /* 73 */,
> +       MTK_PULL_PU_PD_TYPE /* 74 */, MTK_PULL_PU_PD_TYPE /* 75 */,
> +       MTK_PULL_PU_PD_TYPE /* 76 */, MTK_PULL_PUPD_R1R0_TYPE /* 77 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 78 */, MTK_PULL_PUPD_R1R0_TYPE /* 79 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 80 */, MTK_PULL_PUPD_R1R0_TYPE /* 81 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 82 */, MTK_PULL_PUPD_R1R0_TYPE /* 83 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 84 */, MTK_PULL_PUPD_R1R0_TYPE /* 85 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 86 */, MTK_PULL_PUPD_R1R0_TYPE /* 87 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 88 */, MTK_PULL_PUPD_R1R0_TYPE /* 89 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 90 */, MTK_PULL_PUPD_R1R0_TYPE /* 91 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 92 */, MTK_PULL_PUPD_R1R0_TYPE /* 93 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 94 */, MTK_PULL_PUPD_R1R0_TYPE /* 95 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 96 */, MTK_PULL_PU_PD_TYPE /* 97 */,
> +       MTK_PULL_PU_PD_TYPE /* 98 */, MTK_PULL_PU_PD_TYPE /* 99 */,
> +       MTK_PULL_PU_PD_TYPE /* 100 */, MTK_PULL_PU_PD_TYPE /* 101 */,
> +       MTK_PULL_PU_PD_TYPE /* 102 */, MTK_PULL_PU_PD_TYPE /* 103 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 104 */, MTK_PULL_PUPD_R1R0_TYPE /* 105 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 106 */, MTK_PULL_PUPD_R1R0_TYPE /* 107 */,
> +       MTK_PULL_PU_PD_TYPE /* 108 */, MTK_PULL_PU_PD_TYPE /* 109 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 110 */, MTK_PULL_PUPD_R1R0_TYPE /* 111 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 112 */, MTK_PULL_PUPD_R1R0_TYPE /* 113 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 114 */, MTK_PULL_PUPD_R1R0_TYPE /* 115 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 116 */, MTK_PULL_PUPD_R1R0_TYPE /* 117 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 118 */, MTK_PULL_PUPD_R1R0_TYPE /* 119 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 120 */, MTK_PULL_PUPD_R1R0_TYPE /* 121 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 122 */, MTK_PULL_PUPD_R1R0_TYPE /* 123 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 124 */, MTK_PULL_PUPD_R1R0_TYPE /* 125 */,
> +       MTK_PULL_PUPD_R1R0_TYPE /* 126 */, MTK_PULL_PUPD_R1R0_TYPE /* 127 */,
> +       MTK_PULL_PU_PD_TYPE /* 128 */, MTK_PULL_PU_PD_TYPE /* 129 */,
> +       MTK_PULL_PU_PD_TYPE /* 130 */, MTK_PULL_PU_PD_TYPE /* 131 */,
> +       MTK_PULL_PU_PD_TYPE /* 132 */, MTK_PULL_PU_PD_TYPE /* 133 */,
> +       MTK_PULL_PU_PD_TYPE /* 134 */, MTK_PULL_PU_PD_TYPE /* 135 */,
> +       MTK_PULL_PU_PD_TYPE /* 136 */, MTK_PULL_PU_PD_TYPE /* 137 */,
> +       MTK_PULL_PU_PD_TYPE /* 138 */, MTK_PULL_PU_PD_TYPE /* 139 */,
> +       MTK_PULL_PU_PD_TYPE /* 140 */, MTK_PULL_PU_PD_TYPE /* 141 */,
> +       MTK_PULL_PU_PD_TYPE /* 142 */, MTK_PULL_PU_PD_TYPE /* 143 */,
> +};
> +
>  static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
>         [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
> @@ -793,6 +922,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
>         [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
>         [PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
> +       [PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8195_pin_rsel_range),
>  };
>
>  static const char * const mt8195_pinctrl_register_base_names[] = {
> @@ -817,6 +947,9 @@ static const struct mtk_pin_soc mt8195_data = {
>         .gpio_m = 0,
>         .base_names = mt8195_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt8195_pinctrl_register_base_names),
> +       .pull_type = mt8195_pull_type,
> +       .pin_rsel = mt8195_pin_rsel_val_range,
> +       .npin_rsel = ARRAY_SIZE(mt8195_pin_rsel_val_range),
>         .bias_set_combo = mtk_pinconf_bias_set_combo,
>         .bias_get_combo = mtk_pinconf_bias_get_combo,
>         .drive_set = mtk_pinconf_drive_set_rev1,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 5b3b048725cc..b6a89d41f040 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -641,6 +641,9 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
>         } else if (arg == MTK_PUPD_SET_R1R0_11) {
>                 r0 = 1;
>                 r1 = 1;
> +       } else if (arg == MTK_ENABLE) {
> +               r0 = 1;
> +               r1 = 0;

This change does not seem related. This should be in a separate patch
and why and what this change is should be described in the commit log.
I assume this is to support "bias-pull-up" or "bias-pull-down" without
arguments on pins using R1R0?

>         } else {
>                 err = -EINVAL;
>                 goto out;
> @@ -661,6 +664,75 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
>         return err;
>  }
>
> +static int mtk_hw_pin_rsel_lookup(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc,
> +                                 u32 pullup, u32 arg, u32 *rsel_val)
> +{
> +       const struct mtk_pin_rsel *rsel;
> +       int check;
> +       bool found = false;
> +
> +       rsel = hw->soc->pin_rsel;
> +
> +       for (check = 0; check <= hw->soc->npin_rsel - 1; check++) {
> +               if (desc->number >= rsel[check].s_pin &&
> +                   desc->number <= rsel[check].e_pin) {
> +                       if (pullup) {
> +                               if (rsel[check].up_rsel == arg) {
> +                                       found = true;
> +                                       *rsel_val = rsel[check].rsel_index;
> +                                       break;
> +                               }
> +                       } else {
> +                               if (rsel[check].down_rsel == arg) {
> +                                       found = true;
> +                                       *rsel_val = rsel[check].rsel_index;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       }
> +
> +       if (!found) {
> +               dev_err(hw->dev, "Not support rsel value %d Ohm for pin = %d (%s)\n",
> +                       arg, desc->number, desc->name);
> +               return -EOPNOTSUPP;

I believe ENOTSUPP is the correct one. EOPNOTSUPP seems to be network related.

I also think it would make sense to differentiate between the pin not
supporting RSEL (return -ENOTSUPP) vs supporting RSEL but a resistor
value not in the table was requested (return -EINVAL). This might be
easier to do with the two-table design I mentioned.

> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
> +                                    const struct mtk_pin_desc *desc,
> +                                    u32 pullup, u32 arg)
> +{
> +       int err, rsel_val;
> +
> +       if (hw->soc->pin_rsel) {
> +               /* find pin rsel_index from pin_rsel array*/
> +               err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
> +               if (err)
> +                       goto out;
> +       } else {
> +               if (arg < MTK_PULL_SET_RSEL_000 ||
> +                   arg > MTK_PULL_SET_RSEL_111) {
> +                       err = -EINVAL;
> +                       goto out;
> +               }
> +
> +               rsel_val -= MTK_PULL_SET_RSEL_000;
> +       }

This is not structured correctly. Think about this: on a chip, say MT8195,
which has hw->soc->pin_rsel defined, but the device tree writer chose
to use the macros instead of SI unit values. This is exactly the scenario
you discussed privately with me.

This also fails the case where bias-pull-{up,down} is specified without
an argument, in which case arg == 1. This does seem to be covered by
falling back to just PU/PD, but it's not exactly obvious, especially
since we are skipping mtk_pinconf_bias_set_pu_pd() just below.

So you actually need to check for the magic values first, and if arg
doesn't match any of them, assume an SI unit argument and try to do
a lookup.

> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
> +
> +out:
> +       return err;
> +}
> +
>  static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
>                                 const struct mtk_pin_desc *desc,
>                                 u32 *pullup, u32 *enable)
> @@ -742,44 +814,117 @@ static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,

This hunk is somewhat whacky. I assume it's because you also fixed up
the indentation for mtk_pinconf_bias_set_combo(). While nice to do,
in this case it actually works against having an easy to read patch.

>         return err;
>  }
>
> -int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> -                               const struct mtk_pin_desc *desc,
> -                               u32 pullup, u32 arg)
> +static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
> +                                    const struct mtk_pin_desc *desc,
> +                                    u32 *pullup, u32 *enable)
>  {
> -       int err;
> +       int pu, pd, rsel, err;
>
> -       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
> -       if (!err)
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
> +       if (err)
>                 goto out;
>
> -       err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
> -       if (!err)
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
> +       if (err)
>                 goto out;
>
> -       err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);

Maybe this could reuse mtk_pinconf_bias_get_pu_pd(), much like on the `set`
side?

> +
> +       if (pu == 0 && pd == 0) {
> +               *pullup = 0;
> +               *enable = MTK_DISABLE;
> +       } else if (pu == 1 && pd == 0) {
> +               *pullup = 1;
> +               *enable = rsel + MTK_PULL_SET_RSEL_000;
> +       } else if (pu == 0 && pd == 1) {
> +               *pullup = 0;
> +               *enable = rsel + MTK_PULL_SET_RSEL_000;
> +       } else {
> +               err = -EINVAL;
> +               goto out;
> +       }
>
>  out:
>         return err;
>  }
> +
> +int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> +                              const struct mtk_pin_desc *desc,
> +                              u32 pullup, u32 arg)
> +{
> +       int err = -EOPNOTSUPP;
> +       bool try_all_type;
> +
> +       try_all_type = hw->soc->pull_type ? false : true;

Using ternary ops is discouraged. Maybe this could be structured like:

    u32 pull_type;

    if (hw->soc->pull_type)
            pull_type = hw->soc->pull_type[desc->number];
    else
            pull_type = MTK_PULL_TYPE_MASK;

That way you don't need to test `try_all_type` every time.

> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
> +               err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
> +               err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
> +               err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
> +                                                         pullup, arg);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE)) {
> +               err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
> +               if (err)
> +                       dev_err(hw->dev, "Invalid pull argument\n");

The "if (err)" could be moved outside the upper "if" block. That way
the code flow looks more consistent, plus we get an error message
regardless of the pull type supported.

> +       }
> +
> +       return err;
> +}
>  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
>
>  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc,
>                               u32 *pullup, u32 *enable)
>  {
> -       int err;
> +       int err = -EOPNOTSUPP;
> +       bool try_all_type;
>
> -       err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> -       if (!err)
> -               goto out;
> +       try_all_type = hw->soc->pull_type ? false : true;

Same here.

>
> -       err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
> -       if (!err)
> -               goto out;
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_RSEL_TYPE)) {
> +               err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PU_PD_TYPE)) {
> +               err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
>
> -       err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PULLSEL_TYPE)) {
> +               err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
> +                                                         pullup, enable);
> +               if (!err)
> +                       return err;
> +       }
> +
> +       if (try_all_type ||
> +           (hw->soc->pull_type[desc->number] & MTK_PULL_PUPD_R1R0_TYPE))
> +               err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
>
> -out:
>         return err;
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index a6f1bdb2083b..a3d73f153efe 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -17,6 +17,13 @@
>  #define MTK_ENABLE     1
>  #define MTK_PULLDOWN   0
>  #define MTK_PULLUP     1
> +#define MTK_PULL_PU_PD_TYPE            BIT(0)
> +#define MTK_PULL_PULLSEL_TYPE          BIT(1)
> +#define MTK_PULL_PUPD_R1R0_TYPE                BIT(2)
> +#define MTK_PULL_RSEL_TYPE             BIT(3)
> +#define MTK_PULL_PU_PD_RSEL_TYPE       (MTK_PULL_PU_PD_TYPE \
> +                                       | MTK_PULL_RSEL_TYPE)

MTK_PULL_RSEL_TYPE deserves a comment saying why it should not be used
on its own.

But since mtk_pinconf_bias_set_rsel() is already calling
mtk_pinconf_bias_set_pu_pd(), if the former function is reworked, then
the two types don't need to be combined for the fallback behavior.

> +
>
>  #define EINT_NA        U16_MAX
>  #define NO_EINT_SUPPORT        EINT_NA
> @@ -42,6 +49,14 @@
>         PIN_FIELD_CALC(_s_pin, _e_pin, 0, _s_addr, _x_addrs, _s_bit,    \
>                        _x_bits, 32, 1)
>
> +#define PIN_RSEL(_s_pin, _e_pin, _rsel_index, _up_resl, _down_rsel) {  \

                                                    ^ rsel?

> +               .s_pin = _s_pin,                                        \
> +               .e_pin = _e_pin,                                        \
> +               .rsel_index = _rsel_index,                              \
> +               .up_rsel = _up_resl,                                    \
> +               .down_rsel = _down_rsel,                                \
> +       }
> +
>  /* List these attributes which could be modified for the pin */
>  enum {
>         PINCTRL_PIN_REG_MODE,
> @@ -67,6 +82,7 @@ enum {
>         PINCTRL_PIN_REG_DRV_E0,
>         PINCTRL_PIN_REG_DRV_E1,
>         PINCTRL_PIN_REG_DRV_ADV,
> +       PINCTRL_PIN_REG_RSEL,
>         PINCTRL_PIN_REG_MAX,
>  };
>
> @@ -129,6 +145,21 @@ struct mtk_pin_field_calc {
>         u8  fixed;
>  };
>
> +/* struct mtk_pin_rsel - the structure that providing bias resistance selection.

                                               ^ provides

> + * @s_pin:             the start pin within the rsel range
> + * @e_pin:             the end pin within the rsel range
> + * @rsel_index:        the rsel bias resistance index
> + * @up_rsel:   the pullup rsel bias resistance value
> + * @down_rsel: the pulldown rsel bias resistance value
> + */
> +struct mtk_pin_rsel {
> +       u16 s_pin;
> +       u16 e_pin;
> +       u16 rsel_index;
> +       u32 up_rsel;
> +       u32 down_rsel;
> +};
> +

If it were up to me, I would split this into two layers, one for the
register value <-> resistor value mapping, lets call it "rsel table",
and the other for pin <-> "rsel table" mapping.

I assume most if not all pins that support rsel would have the same set
of resistor values, so that would trade a level of indirection for better
usage of space.

>  /* struct mtk_pin_reg_calc - the structure that holds all ranges used to
>   *                          determine which register the pin would make use of
>   *                          for certain pin attribute.
> @@ -206,6 +237,9 @@ struct mtk_pin_soc {
>         bool                            ies_present;
>         const char * const              *base_names;
>         unsigned int                    nbase_names;
> +       const unsigned int              *pull_type;
> +       const struct mtk_pin_rsel       *pin_rsel;
> +       unsigned int                    npin_rsel;
>
>         /* Specific pinconfig operations */
>         int (*bias_disable_set)(struct mtk_pinctrl *hw,
> @@ -237,7 +271,6 @@ struct mtk_pin_soc {
>                              const struct mtk_pin_desc *desc, u32 arg);
>         int (*adv_drive_get)(struct mtk_pinctrl *hw,
>                              const struct mtk_pin_desc *desc, u32 *val);
> -

Unrelated whitespace change. Please remove it.

>         /* Specific driver data */
>         void                            *driver_data;
>  };
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 85db2e4377f0..8990cfe47d72 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -577,9 +577,9 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
>         mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
>
>  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> -       unsigned int gpio, char *buf, unsigned int bufLen)
> +       unsigned int gpio, char *buf, unsigned int buf_len)

Unrelated change.

>  {
> -       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
>         const struct mtk_pin_desc *desc;
>
>         if (gpio >= hw->soc->npins)
> @@ -591,6 +591,8 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>                 pinmux -= hw->soc->nfuncs;
>
>         mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> +
> +       /* Case for: R1R0 */
>         if (pullen == MTK_PUPD_SET_R1R0_00) {
>                 pullen = 0;
>                 r1 = 0;
> @@ -607,10 +609,16 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>                 pullen = 1;
>                 r1 = 1;
>                 r0 = 1;
> -       } else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
> -               pullen = 0;
>         }
> -       len += scnprintf(buf + len, bufLen - len,
> +
> +       /* Case for: RSEL */
> +       if (pullen >= MTK_PULL_SET_RSEL_000 &&
> +           pullen <= MTK_PULL_SET_RSEL_111) {
> +               rsel = pullen - MTK_PULL_SET_RSEL_000;
> +               pullen = 1;
> +       }
> +
> +       len += scnprintf(buf + len, buf_len - len,

Unrelated change.

>                         "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
>                         gpio,
>                         pinmux,
> @@ -624,10 +632,12 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>                         pullup);
>
>         if (r1 != -1) {
> -               len += scnprintf(buf + len, bufLen - len, " (%1d %1d)\n",
> +               len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
>                         r1, r0);
> +       } else if (rsel != -1) {
> +               len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
>         } else {
> -               len += scnprintf(buf + len, bufLen - len, "\n");
> +               len += scnprintf(buf + len, buf_len - len, "\n");

Unrelated changes.

>         }
>
>         return len;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
> index afb7650fd25b..681267c0e1a4 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
> @@ -61,7 +61,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc);
>
>  ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> -       unsigned int gpio, char *buf, unsigned int bufLen);
> +       unsigned int gpio, char *buf, unsigned int buf_len);

Unrelated change.


Regards
ChenYu

>
>  extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
>
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
