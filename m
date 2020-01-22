Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36A5145CA5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2020 20:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgAVToK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jan 2020 14:44:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:41754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbgAVToK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jan 2020 14:44:10 -0500
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A13C52465B;
        Wed, 22 Jan 2020 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579722249;
        bh=ERAYXnLfEaikjmnspNdobkqN9VU5U20/NnieuVtLYiI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UKN5UFNsvo1rk35ewzqIHLkweANflqnSB76dxH3G3HwLtsrGzN2wFaJWixcUnN02h
         Dp9a/QGrOGKRXO6zuy5NjOPH8AHw0Lt+b/TykCTudjIQu95feQ62f8Sju1rf0hByvj
         NCv6UGMKNhI7BaVwcg2mTpvI9Lrpd9Xl+8RCWC2Y=
Received: by mail-il1-f174.google.com with SMTP id q15so308894ili.11;
        Wed, 22 Jan 2020 11:44:09 -0800 (PST)
X-Gm-Message-State: APjAAAWuT8askCUKEIQK8xRN8RAGb1nyC9yU+xmJlg9mqWtomOhs3THJ
        oX+c+x8n7cVeG+L4c/OhTUKGTYg1unNhIuCphaU=
X-Google-Smtp-Source: APXvYqwbugcYCElK+66aehWJICUHbHpOAEyrS9vEkHbUgvstAyzm+vwxWBNtbofhJ+VOdmu9iNh+vRs7H0P2c2SbXk8=
X-Received: by 2002:a92:cb10:: with SMTP id s16mr10093637ilo.176.1579722249065;
 Wed, 22 Jan 2020 11:44:09 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com> <1579675994-7001-6-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-6-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 22 Jan 2020 11:43:53 -0800
X-Gmail-Original-Message-ID: <CAGp9Lzox4EcO+WWEoLMshQDhH14644iTuAWA9XQc82JYfp-pqA@mail.gmail.com>
Message-ID: <CAGp9Lzox4EcO+WWEoLMshQDhH14644iTuAWA9XQc82JYfp-pqA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add support for pin
 configuration dump via debugfs.
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
> Add support for pin configuration dump via catting
> /sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.
> pinctrl framework had already support such dump. This patch implement the
> operation function pointer to fullfill this dump.
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 109 +++++++++++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.h |   3 +
>  2 files changed, 112 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 115ebc1..83bf29c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -539,12 +539,120 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
>         return 0;
>  }
>
> +static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field)
> +{
> +       const struct mtk_pin_desc *desc;
> +       int value, err;
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> +
> +       err = mtk_hw_get_value(hw, desc, field, &value);
> +       if (err)
> +               return err;
> +
> +       return value;
> +}
> +
> +#define mtk_pctrl_get_pinmux(hw, gpio)                 \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_MODE)
> +
> +#define mtk_pctrl_get_direction(hw, gpio)              \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DIR)
> +
> +#define mtk_pctrl_get_out(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DO)
> +
> +#define mtk_pctrl_get_in(hw, gpio)                     \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DI)
> +
> +#define mtk_pctrl_get_smt(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_SMT)
> +
> +#define mtk_pctrl_get_ies(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_IES)
> +
> +#define mtk_pctrl_get_driving(hw, gpio)                        \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
> +
> +ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> +       unsigned int gpio, char *buf, unsigned int bufLen)
> +{
> +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> +       const struct mtk_pin_desc *desc;
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> +       pinmux = mtk_pctrl_get_pinmux(hw, gpio);
> +       if (pinmux >= hw->soc->nfuncs)
> +               pinmux -= hw->soc->nfuncs;
> +
> +       mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> +       if (pullen == MTK_PUPD_SET_R1R0_00) {
> +               pullen = 0;
> +               r1 = 0;
> +               r0 = 0;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> +               pullen = 1;
> +               r1 = 0;
> +               r0 = 1;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> +               pullen = 1;
> +               r1 = 1;
> +               r0 = 0;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> +               pullen = 1;
> +               r1 = 1;
> +               r0 = 1;
> +       } else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
> +               pullen = 0;
> +       }
> +       len += snprintf(buf + len, bufLen - len,
> +                       "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
> +                       gpio,
> +                       pinmux,
> +                       mtk_pctrl_get_direction(hw, gpio),
> +                       mtk_pctrl_get_out(hw, gpio),
> +                       mtk_pctrl_get_in(hw, gpio),
> +                       mtk_pctrl_get_driving(hw, gpio),
> +                       mtk_pctrl_get_smt(hw, gpio),
> +                       mtk_pctrl_get_ies(hw, gpio),
> +                       pullen,
> +                       pullup);
> +
> +       if (r1 != -1) {
> +               len += snprintf(buf + len, bufLen - len, " (%1d %1d)\n",
> +                       r1, r0);
> +       } else {
> +               len += snprintf(buf + len, bufLen - len, "\n");
> +       }
> +
> +       return len;
> +}
> +
> +#define PIN_DBG_BUF_SZ 96
> +static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> +                         unsigned int gpio)
> +{
> +       struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
> +       char buf[PIN_DBG_BUF_SZ];
> +
> +       (void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);
> +
> +       seq_printf(s, "%s", buf);
> +}
> +
>  static const struct pinctrl_ops mtk_pctlops = {
>         .dt_node_to_map         = mtk_pctrl_dt_node_to_map,
>         .dt_free_map            = pinctrl_utils_free_map,
>         .get_groups_count       = mtk_pctrl_get_groups_count,
>         .get_group_name         = mtk_pctrl_get_group_name,
>         .get_group_pins         = mtk_pctrl_get_group_pins,
> +       .pin_dbg_show           = mtk_pctrl_dbg_show,
>  };
>
>  static int mtk_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
> @@ -641,6 +749,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
>         .pin_config_get = mtk_pinconf_get,
>         .pin_config_group_get   = mtk_pconf_group_get,
>         .pin_config_group_set   = mtk_pconf_group_set,
> +       .is_generic = true,
>  };
>
>  static struct pinctrl_desc mtk_desc = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
> index 3d43771..afb7650 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
> @@ -60,6 +60,9 @@
>  int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc);
>
> +ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> +       unsigned int gpio, char *buf, unsigned int bufLen);
> +
>  extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
>
>  #endif /* __PINCTRL_PARIS_H */
> --
> 1.8.1.1.dirty
