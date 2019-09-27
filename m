Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62825C0DD5
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Sep 2019 00:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfI0WLP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 18:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbfI0WLP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Sep 2019 18:11:15 -0400
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 406BA217D9;
        Fri, 27 Sep 2019 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569622274;
        bh=58COh0a9lzNayEkOKvFt70ACnycq2rNmRYv95pg9O+E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=euo5fT1PzNI/vG5JFBL0XIchph3OiWMQyRqCIIKhen+P6P5GT0SD4pVnbUFI4Ny51
         LNc31rhB6/z213+UpEzIrGX7KFG2bUabffhMmTiUyxUijt7dGHLbWyK0TQ2eAw8pI4
         IxYqOEbncqCaeWJKq0JpdWSe9stdSkNuNjCjcMeo=
Received: by mail-wm1-f53.google.com with SMTP id 3so6990486wmi.3;
        Fri, 27 Sep 2019 15:11:14 -0700 (PDT)
X-Gm-Message-State: APjAAAUHwPU9LxgwJQI/f9oY4wdLbtjVLvMqnDjZlflGLf55O5yz2xUq
        GuUvILjkMxcj04rGVyUm2z85JqDJeyMOcdlctm8=
X-Google-Smtp-Source: APXvYqz4VPgxhyHSxGNoezNefD7iHVu009KTZ47zBxC7f6LvK3X27cb5VbS/erEUJho47dJVp84sRMs0XE3SU7xDXyM=
X-Received: by 2002:a05:600c:1103:: with SMTP id b3mr9005703wma.3.1569622272786;
 Fri, 27 Sep 2019 15:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <1569560532-1886-1-git-send-email-light.hsieh@mediatek.com> <1569560532-1886-5-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1569560532-1886-5-git-send-email-light.hsieh@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 27 Sep 2019 15:11:00 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpdVJ1=hSGiUxi9i+FSDtB9g2Qk22NmMoe660a8hCvU-Q@mail.gmail.com>
Message-ID: <CAGp9LzpdVJ1=hSGiUxi9i+FSDtB9g2Qk22NmMoe660a8hCvU-Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: mediatek: Add support for pin
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

Hi,

On Thu, Sep 26, 2019 at 10:02 PM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> Add support for pin configuration dump via catting
> /sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.
> pinctrl framework had already support such dump. This patch implement the
> operation function pointer to fullfill this dump.
>

Here are missing tags too.

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 88 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.h | 30 +++++++++++
>  2 files changed, 118 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 2a47c45..f531908 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -538,12 +538,99 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
>         return 0;
>  }
>
> +int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field)
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
> +ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> +       unsigned int gpio, char *buf, unsigned int bufLen)
> +{
> +       const struct mtk_pin_desc *desc;
> +       int pinmux, pullup, pullen, r1 = -1, r0 = -1, len = 0;

Sort the variable declarations in reverse xmas tree order.

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
> @@ -640,6 +727,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
>         .pin_config_get = mtk_pinconf_get,
>         .pin_config_group_get   = mtk_pconf_group_get,
>         .pin_config_group_set   = mtk_pconf_group_set,
> +       .is_generic = true,
>  };
>
>  static struct pinctrl_desc mtk_desc = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
> index 3d43771..d73f4b6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
> @@ -60,6 +60,36 @@
>  int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc);
>
> +int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field);
> +
> +#define mtk_pctrl_get_pinmux(hw, gpio)                 \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_MODE)
> +
> +/* MTK HW use 0 as input, 1 for output
> + * This interface is for get direct register value,
> + * so don't reverse
> + */

The comment should be removed since that is not really matched with the context.

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
> +       unsigned int gpio, char *buf, unsigned int bufLen);
> +

Currently, these above functions are not being referred by other users
outside the file so stay them visible inside the file until there are
explicit users present.

>  extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
>
>  #endif /* __PINCTRL_PARIS_H */
> --
> 1.8.1.1.dirty
>
