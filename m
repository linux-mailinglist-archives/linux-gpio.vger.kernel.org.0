Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7BBE9DD5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 15:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfJ3Ou5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 10:50:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36398 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJ3Ou5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 10:50:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id v19so1760283pfm.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=kUX+QB+n6uPsMbBuXUFFDaJg5lKGQ/rdJhKtAOQxM68=;
        b=bNgUZU71v+0fmmNO32iK5sG8ShIFzxEVanGouBgUUl1TWyrYV9O7bG3dlDm8YLckH4
         d+aygtJELB/eg5oR8mSOvB/gHvYdLip5dMSYcpm4ZFmdvQ9c11yC9alSFajCI0d29EH6
         lsn085FJbQRp1w/1MosfnmNAbXjWAU5xYDf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=kUX+QB+n6uPsMbBuXUFFDaJg5lKGQ/rdJhKtAOQxM68=;
        b=iuvehfweL/NjG4F6Y+yOACiq0NHl+vZllsGnlmUuPLfcUYCAwl6R3dcBL9vtcc4FFU
         VlsvNGKAN5jREymYzeAnDLPZl9B14XuhrKgyczqGSgYFF525AOfCVgJAi3iZMfz9oHoh
         lz43wH/zWprD0A0rQwwvt19gEFIuAvpUpJwQl/L3gag6evZFzYn3GQzTIhMHX5hhOiNw
         Znb/M2+XLf1cB3OSi1x2JHCIuBk8A6BwexgZojFPV/rRGm8ruWR7LeM2mJir6n/ZJcYE
         6o0UG1Sj62EIAlZnbLIjbd7SB9q90rYVRIzgaLnrDfuk7sm8lec9TssCNMKSbxUchQBz
         JCxA==
X-Gm-Message-State: APjAAAVBFnenQ2LZ9wUsgMIzdgyDVdQzKju1qW+b3HMQQW40otOhF5mt
        FTFR0y1hWUyH85VCJFeeue9SPw==
X-Google-Smtp-Source: APXvYqzbFFg5OC6TJ9lnqjvMpIqFnf7mzbiND6t96bWdmgGcpqetszJAYKhFjob6bIjnEsoSQ7lghA==
X-Received: by 2002:a63:3442:: with SMTP id b63mr8798587pga.264.1572447055787;
        Wed, 30 Oct 2019 07:50:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s11sm2394909pjp.26.2019.10.30.07.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:50:55 -0700 (PDT)
Message-ID: <5db9a34f.1c69fb81.23dfc.7ea5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org> <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 09/11] pinctrl: qcom-wcd934x: Add support to wcd934x pinctrl driver.
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org,
        robh@kernel.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
User-Agent: alot/0.8.1
Date:   Wed, 30 Oct 2019 07:50:54 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Srinivas Kandagatla (2019-10-29 04:26:58)
> From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
>=20
> This patch adds support to wcd934x pinctrl block found in
> WCD9340/WC9341 Audio codecs.
>=20
> [Srini: multiple cleanups to the code]

This goes after the author signoff and before yours. Can you add more
details too?

> Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/pinctrl/qcom/Kconfig                |   7 +
>  drivers/pinctrl/qcom/Makefile               |   1 +
>  drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
>  3 files changed, 373 insertions(+)
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
>=20
> diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctr=
l/qcom/pinctrl-wcd934x-gpio.c
> new file mode 100644
> index 000000000000..1aff88d0bcb3
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <linux/module.h>
> +#include <linux/gpio.h>
> +#include <linux/interrupt.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +
> +#define WCD_REG_DIR_CTL_OFFSET 0x42
> +#define WCD_REG_VAL_CTL_OFFSET 0x43
> +#define WCD_GPIO_PULL_UP       1
> +#define WCD_GPIO_PULL_DOWN     2
> +#define WCD_GPIO_BIAS_DISABLE  3
> +#define WCD_GPIO_STRING_LEN    20
> +#define WCD934X_NPINS          5
> +
> +/**
> + * struct wcd_gpio_pad - keep current GPIO settings
> + * @offset: offset of gpio.
> + * @is_valid: Set to false, when GPIO in high Z state.
> + * @value: value of a pin
> + * @output_enabled: Set to true if GPIO is output and false if it is inp=
ut
> + * @pullup: Constant current which flow through GPIO output buffer.
> + * @strength: Drive strength of a pin
> + */
> +struct wcd_gpio_pad {
> +       u16  offset;
> +       bool is_valid;
> +       bool value;
> +       bool output_enabled;
> +       unsigned int pullup;
> +       unsigned int strength;
> +};
> +
> +struct wcd_gpio_priv {
> +       struct device *dev;
> +       struct regmap *map;
> +       struct pinctrl_dev *ctrl;
> +       struct gpio_chip chip;
> +};
> +
> +static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
> +                        struct wcd_gpio_pad *pad, unsigned int addr)
> +{
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(priv_data->map, addr, &val);
> +       if (ret < 0)
> +               dev_err(priv_data->dev, "%s: read 0x%x failed\n",
> +                       __func__, addr);
> +       else
> +               ret =3D (val >> pad->offset);
> +
> +       return ret;
> +}
> +
> +static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
> +                         struct wcd_gpio_pad *pad, unsigned int addr,
> +                         unsigned int val)
> +{
> +       int ret;
> +
> +       ret =3D regmap_update_bits(priv_data->map, addr, (1 << pad->offse=
t),
> +                                val << pad->offset);
> +       if (ret < 0)
> +               dev_err(priv_data->dev, "write 0x%x failed\n", addr);

Is there value in these error messages? Also, use %#x to get '0x'.

> +
> +       return ret;
> +}
[...]
> +
> +static int wcd_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct pinctrl_pin_desc *pindesc;
> +       struct pinctrl_desc *pctrldesc;
> +       struct wcd_gpio_pad *pad, *pads;
> +       struct wcd_gpio_priv *priv_data;
> +       u32 npins =3D WCD934X_NPINS;
> +       char **name;
> +       int i;
> +
> +       priv_data =3D devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
> +       if (!priv_data)
> +               return -ENOMEM;
> +
> +       priv_data->dev =3D dev;
> +       priv_data->map =3D dev_get_regmap(dev->parent, NULL);
> +       if (!priv_data->map) {
> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
> +               return  -EINVAL;
> +       }
> +
> +       pindesc =3D devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL=
);
> +       if (!pindesc)
> +               return -ENOMEM;
> +
> +       pads =3D devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
> +       if (!pads)
> +               return -ENOMEM;

Is it possible to put the pad struct around the pindesc struct? It's
sort of sad that we have to allocate a chunk of memory twice for the
pindesc and the pads when we could either use container_of() on the
pindesc or just point the pindesc driver data member to the container
structure for the qcom specific bits.

> +
> +       pctrldesc =3D devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
> +       if (!pctrldesc)
> +               return -ENOMEM;
> +
> +       pctrldesc->pctlops =3D &wcd_pinctrl_ops;
> +       pctrldesc->confops =3D &wcd_pinconf_ops;
> +       pctrldesc->owner =3D THIS_MODULE;
> +       pctrldesc->name =3D dev_name(dev);
> +       pctrldesc->pins =3D pindesc;
> +       pctrldesc->npins =3D npins;
> +
> +       name =3D devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
> +       if (!name)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < npins; i++, pindesc++) {
> +               name[i] =3D devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STR=
ING_LEN,
> +                                      GFP_KERNEL);
> +               if (!name[i])
> +                       return -ENOMEM;
> +
> +               pad =3D &pads[i];
> +               pindesc->drv_data =3D pad;
> +               pindesc->number =3D i;
> +               snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i=
+1));
> +               pindesc->name =3D name[i];

Why not use devm_kasprintf()? The 'name' array is also unnecessary?

> +               pad->offset =3D i;
> +               pad->is_valid  =3D true;
> +       }
> +
> +       priv_data->chip =3D wcd_gpio_chip;
> +       priv_data->chip.parent =3D dev;
> +       priv_data->chip.base =3D -1;
> +       priv_data->chip.ngpio =3D npins;
> +       priv_data->chip.label =3D dev_name(dev);
> +       priv_data->chip.of_gpio_n_cells =3D 2;
> +       priv_data->chip.can_sleep =3D false;
> +       platform_set_drvdata(pdev, priv_data);
> +
> +       priv_data->ctrl =3D devm_pinctrl_register(dev, pctrldesc, priv_da=
ta);
> +       if (IS_ERR(priv_data->ctrl)) {
> +               dev_err(dev, "%s: failed to register to pinctrl\n", __fun=
c__);
> +               return PTR_ERR(priv_data->ctrl);
> +       }
> +
> +       return gpiochip_add_data(&priv_data->chip, priv_data);

WHy not use devm_gpiochip_add_data()?

> +}
> +
> +static int wcd_pinctrl_remove(struct platform_device *pdev)
> +{
> +       struct wcd_gpio_priv *priv_data =3D platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&priv_data->chip);
> +
> +       return 0;

And drop this function?

> +}
> +
> +static const struct of_device_id wcd_pinctrl_of_match[] =3D {
> +       { .compatible =3D "qcom,wcd9340-pinctrl" },
> +       { .compatible =3D "qcom,wcd9341-pinctrl" },
> +       { },

Nitpick: Drop the comma on the sentinel.

> +};
> +
> +MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);

Nitpick: Drop the newline between device table and match table.

