Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEA948C05E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 09:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348974AbiALIxp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 03:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238305AbiALIxp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jan 2022 03:53:45 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7404AC061748
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 00:53:44 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j11so5686711lfg.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 00:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QX44NtMzpgo+l2Ho0SHw53qmGi3kaH4gIg9bfUEaJf8=;
        b=GwrhxtFMs32fVtJhHB7d1TFxrETcq3mcE7NxamZu/6SOWSIdtZ4+Srz4LvEcSQmDB9
         LGFQ2vBPVGkMp3fk+4mJMplM1VhKxsHdEqD7JU4j3PciOrX6Zd64Jq9V2eEXn6NbELug
         K4bzHQ4527hYt4Ei4Xt8net4BaK/oZ4fiVvYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QX44NtMzpgo+l2Ho0SHw53qmGi3kaH4gIg9bfUEaJf8=;
        b=1JDP/V5+dURWsGhr2Nni4Aor2iQ5im4dCq33xI6BTe+gDcjEBJF7koAMWsmF/dD+nL
         E/7IpZKxXYMWBPo7wsWBhItLd+I7c8D21h6/dpfMkRWRlDU5aif2c5O9mlk83DSPr3qE
         Tb8mzheqPkuZYPKAzluhy0lJ3RsX7d1TY3msRb4VILeK1bvNEYp6NgLd5upczt3fYEBo
         qQgpr0X+z46AIaaNwG7m19Xo3G2vG0eTPJA3t947diDcVjSgp+ErbOJ37kRlL4XpgkLY
         tKdCbHCK60f6rI1isErNztdrxWI6qz78T3cNo9FVPfUYNJvas+VmfFpO3YtfWnY5cgI4
         kdUQ==
X-Gm-Message-State: AOAM530Z5vACXYKLrzvqqQOd/94JI+E0PM9j8bdydQ5XXuEtMY2EucqW
        R73BhBYfDXLhA0GBpT7Kwzdo2t+04cA81OZiCCQVaw==
X-Google-Smtp-Source: ABdhPJxEbYrAx/hnpV9Nn6yck1TYbHCWYGr7VZUmUHpP5vookcO09X5JJ9gm0O/ez/CfSZpUBOe1UT3KZO6sItHHMFc=
X-Received: by 2002:a2e:7f1a:: with SMTP id a26mr5747639ljd.414.1641977622599;
 Wed, 12 Jan 2022 00:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org> <20220111112244.1483783-8-wenst@chromium.org>
In-Reply-To: <20220111112244.1483783-8-wenst@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 12 Jan 2022 16:53:31 +0800
Message-ID: <CAGXv+5Gq0uH-eA799f1MRgzeUU9fsfi-Xz0XyW7ZJW==i_mcYg@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic PIN_CONFIG_DRIVE_STRENGTH_UA
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 7:23 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Some of the MediaTek chips that utilize the Paris pinctrl driver library
> support a lower drive strength (<= 1mA) than the standard drive strength
> settings (2~16 mA) on certain pins. This was previously supported by the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
>
> The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
> and can be readily described by the existing "drive-strength-microamp",
> which then gets parsed by the generic pinconf library into the parameter
> PIN_CONFIG_DRIVE_STRENGTH_UA.

So I am actually unsure how to implement support for this properly.
My intention was to map "mediatek,drive-strength-adv" to
"drive-strength-microamp". This implies using the advanced mode if
the property is present, and vice versa.

(Also unsure if such a binding would be acceptable.)

However the pin configs are passed in one-by-one within the driver, so
it doesn't seem viable to check for the absence of a certain parameter.
This might involve a bit more rewriting.

ChenYu

> Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> custom parameter around for backward compatibility.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>
> The indentation in the switch/case blocks is getting somewhat out of
> control. I also have some cleanup changes to reverse the logic of the
> if/break statements. Not sure if it should be done before or after this
> patch though.
>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 678c8aa33012..5a94903ae372 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
>         "func12", "func13", "func14", "func15",
>  };
>
> +/*
> + * This section supports converting to/from custom MTK_PIN_CONFIG_DRV_ADV
> + * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
> + *
> + * The custom value encodes three hardware bits as follows:
> + *
> + *   |           Bits           |
> + *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
> + *   ------------------------------------------------
> + *   |    x   |    x   |    0   | disabled, use standard drive strength
> + *   -------------------------------------
> + *   |    0   |    0   |    1   |  125 uA
> + *   |    0   |    1   |    1   |  250 uA
> + *   |    1   |    0   |    1   |  500 uA
> + *   |    1   |    1   |    1   | 1000 uA
> + */
> +static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
> +
> +static int mtk_drv_adv_to_uA(int val)
> +{
> +       /* This should never happen. */
> +       if (WARN_ON_ONCE(val < 0 || val > 7))
> +               return -EINVAL;
> +
> +       /* Bit 0 simply enables this hardware part */
> +       if (!(val & BIT(0)))
> +               return -EINVAL;
> +
> +       return mtk_drv_adv_uA[(val >> 1)];
> +}
> +
> +static int mtk_drv_uA_to_adv(int val)
> +{
> +       switch (val) {
> +       case 125:
> +               return 0x1;
> +       case 250:
> +               return 0x3;
> +       case 500:
> +               return 0x5;
> +       case 1000:
> +               return 0x7;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>                                           struct pinctrl_gpio_range *range,
>                                           unsigned int pin)
> @@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>                 break;
>         case PIN_CONFIG_DRIVE_STRENGTH:
> +               if (hw->soc->adv_drive_get) {
> +                       err = hw->soc->adv_drive_get(hw, desc, &ret);
> +                       if (!err) {
> +                               err = mtk_drv_adv_to_uA(ret);
> +                               if (err > 0) {
> +                                       /* PIN_CONFIG_DRIVE_STRENGTH_UA used */
> +                                       err = -EINVAL;
> +                                       break;
> +                               }
> +                       }
> +               }
> +
>                 if (hw->soc->drive_get)
>                         err = hw->soc->drive_get(hw, desc, &ret);
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +               if (hw->soc->adv_drive_get) {
> +                       err = hw->soc->adv_drive_get(hw, desc, &ret);
> +                       if (err)
> +                               break;
> +                       err = mtk_drv_adv_to_uA(ret);
> +                       if (err < 0)
> +                               break;
> +
> +                       ret = err;
> +                       err = 0;
> +               } else {
> +                       err = -ENOTSUPP;
> +               }
> +               break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> @@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +               if (hw->soc->adv_drive_set) {
> +                       err = mtk_drv_uA_to_adv(arg);
> +                       if (err < 0)
> +                               break;
> +                       err = hw->soc->adv_drive_set(hw, desc, err);
> +               } else {
> +                       err = -ENOTSUPP;
> +               }
> +               break;
>         case MTK_PIN_CONFIG_TDSEL:
>         case MTK_PIN_CONFIG_RDSEL:
>                 reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> --
> 2.34.1.575.g55b058a8bb-goog
>
