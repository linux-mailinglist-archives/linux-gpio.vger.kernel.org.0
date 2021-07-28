Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBAF3D953D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 20:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhG1S1P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 14:27:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhG1S1O (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 14:27:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8712360F46;
        Wed, 28 Jul 2021 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627496832;
        bh=P7Nj61y10RxwtvDu8NSjNYumxT5Mu8ftk2gukjRAMpA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RtvVFUSN/PJopXn29kQL/ZCodQf6lPdbtlAQq5eOGXaHdYKTnAw7NQ3p2Kr8a3Nsq
         dFmVCUzbkdM1L9ol22nRp2rCSZqfBTCHUQoaOKnxm1eNFK4kW5j5u8ZI+W0wUX6EQo
         Zfy0zlnpbyhOudkVAQUMyGKUiIsNoDwxvSRt8tqm+m8Yv/CnZyfy7f5ohApS3yLIEJ
         H9ygJBb+kkk0am2jUnepTR4/GgSDOrbwKmKhT10hXpmR4zHXSyZYzi3ewvb1iAyOsi
         sB+PEX6ygpjA9pRwfqDVl1LLFj0ERle87t06SNXPw2pGhjTtedzf6Lr12gYEXcjFbJ
         B2QTzZ53/1/xw==
Received: by mail-ej1-f48.google.com with SMTP id ga41so6062213ejc.10;
        Wed, 28 Jul 2021 11:27:12 -0700 (PDT)
X-Gm-Message-State: AOAM531h5pq5vIcdOaC8iN5Zgvkr7Q5bQmgT0T1Ge0mWIqTrMC+FrDR7
        k8KxDwk4L+i7m5czUEEKj4xcVyJzgVx8lbaS7g8=
X-Google-Smtp-Source: ABdhPJwMW5TrgITkkwrO7xV+n72DQlxYsctwNVZtDNp+QCHzDRSCcI4DekRwXzXmKxU51+nQz47w8VSo+rzFf/tPNpE=
X-Received: by 2002:a17:906:c7c2:: with SMTP id dc2mr788351ejb.472.1627496831060;
 Wed, 28 Jul 2021 11:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com> <20210726071439.14248-5-sam.shih@mediatek.com>
In-Reply-To: <20210726071439.14248-5-sam.shih@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 28 Jul 2021 11:26:59 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqhseLhM=6aMxUJ2-YuU9sVk-u4gT=kem-o9RwXOAUwxA@mail.gmail.com>
Message-ID: <CAGp9LzqhseLhM=6aMxUJ2-YuU9sVk-u4gT=kem-o9RwXOAUwxA@mail.gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: mediatek: moore: use pin number in
 mtk_pin_desc instead of array index
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

 Hi Sam,

On Mon, Jul 26, 2021 at 12:17 AM Sam Shih <sam.shih@mediatek.com> wrote:
>
> Certain SoC are missing the middle part gpios in consecutive pins,
> it's better to use pin number in mtk_pin_desc instead of array index
> for the extensibility

Now the driver pin number has to be consistent with the array index
because the driver would use pin number as the array index to fetch
the pin descriptor.

For those missing GPIOs, we could just fill out .name in struct
mtk_pin_desc as NULL to indicate the pin is unavailable for users (pin
not ballout) on the certain SoC and then allow us to reuse all of the
pinctrl operations with minimal modification.

>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c | 61 ++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index 3a4a23c40a71..16206254ec3d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -35,6 +35,19 @@ static const struct pin_config_item mtk_conf_items[] = {
>  };
>  #endif
>
> +static int mtk_pin_desc_lookup(struct mtk_pinctrl *hw, int pin)
> +{
> +       int idx;
> +
> +       for (idx = 0 ; idx < hw->soc->npins ; idx++)
> +               if (hw->soc->pins[idx].number == pin)
> +                       break;
> +       if (idx < hw->soc->npins)
> +               return idx;
> +
> +       return -EINVAL;
> +}
> +
>  static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
>                               unsigned int selector, unsigned int group)
>  {
> @@ -74,6 +87,13 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
>

We can drop it and use the following snippet instead

desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];

/* !desc->name to show the pin is not ballout */
if (!desc->name)
         return -ENOTSUPP;

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
> @@ -87,6 +107,13 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
> @@ -102,6 +129,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>         int val, val2, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         switch (param) {
> @@ -217,6 +250,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>         u32 reg, param, arg;
>         int cfg, err = 0;
>
> +       err = mtk_pin_desc_lookup(hw, pin);
> +       if (err >= 0)
> +               pin = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>
>         for (cfg = 0; cfg < num_configs; cfg++) {
> @@ -434,6 +473,12 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       err = mtk_pin_desc_lookup(hw, gpio);
> +       if (err >= 0)
> +               gpio = err;
> +       else
> +               return err;
> +

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
>         err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -447,6 +492,15 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  {
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, gpio);
> +       if (err >= 0) {
> +               gpio = err;
> +       } else {
> +               dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
> +               return;
> +       }
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
> @@ -488,6 +542,13 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>         struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
>         u32 debounce;
> +       int err;
> +
> +       err = mtk_pin_desc_lookup(hw, offset);
> +       if (err >= 0)
> +               offset = err;
> +       else
> +               return err;
>

Ditto

>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>
> --
> 2.29.2
>
