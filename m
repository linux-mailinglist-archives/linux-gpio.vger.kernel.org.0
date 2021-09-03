Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8840048B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Sep 2021 20:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350160AbhICSK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Sep 2021 14:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:47706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231747AbhICSK0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 3 Sep 2021 14:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB78561057;
        Fri,  3 Sep 2021 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630692565;
        bh=hqxm1jKVv3zVPfT2u8luecvuXVLTMkxK4v3UVKCS+x8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IVhNfjX4RzY0j17wJdL/tVWgXg72aE2MTSMq7hMJKJW/cTfo2cBNPPfqXzWNMQDU/
         fEMBlfkozH5Xy+OYy1rlPkn8P5HsSD1RdY/T1Ped5cgLocp2eqqzq8NwkelYNUYC6a
         LRK69QpFUHxcm5Y8Z2QJlns8sjzd6/bQ+9s+y4TssYlM9/YiGxOAVoFRcGHiL19RjG
         +OiklV3L8Lw1ThcjL1cWJA6ft1mimnX25G56CZMNKvh9X35BdUx8xDURXlV/3Xenx6
         trFoTC9UOvIYIogAXDWwYBvfHGY+ZZqh/cWHJR6p+r93iobRAR1zFFSpJldbH7tPnz
         S0p4BRNE70Pmw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1630574106-3394-2-git-send-email-skakit@codeaurora.org>
References: <1630574106-3394-1-git-send-email-skakit@codeaurora.org> <1630574106-3394-2-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V2 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Date:   Fri, 03 Sep 2021 11:09:24 -0700
Message-ID: <163069256450.405991.2176328404036039930@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting satya priya (2021-09-02 02:15:05)
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index 98bf0e2..dbae168 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2012-2014, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2014, 2016-2021 The Linux Foundation. All rights r=
eserved.
>   */
> =20
>  #include <linux/gpio/driver.h>
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/spmi.h>
>  #include <linux/types.h>
> =20
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -171,6 +172,8 @@ struct pmic_gpio_state {
>         struct pinctrl_dev *ctrl;
>         struct gpio_chip chip;
>         struct irq_chip irq;
> +       u8 usid;
> +       u8 pid_base;
>  };
> =20
>  static const struct pinconf_generic_params pmic_gpio_bindings[] =3D {
> @@ -949,12 +952,36 @@ static int pmic_gpio_child_to_parent_hwirq(struct g=
pio_chip *chip,
>                                            unsigned int *parent_hwirq,
>                                            unsigned int *parent_type)
>  {
> -       *parent_hwirq =3D child_hwirq + 0xc0;
> +       struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
> +
> +       *parent_hwirq =3D child_hwirq + state->pid_base;
>         *parent_type =3D child_type;
> =20
>         return 0;
>  }
> =20
> +static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
> +                                            unsigned int parent_hwirq,
> +                                            unsigned int parent_type)
> +{
> +       struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
> +       struct irq_fwspec *fwspec;
> +
> +       fwspec =3D kzalloc(sizeof(*fwspec), GFP_KERNEL);

The implementation of gpiochip_populate_parent_fwspec_fourcell() uses
kmalloc() here. Should we also do that? Presumably the fwspec will be
set with the important parts so this will save a memset call.

> +       if (!fwspec)
> +               return NULL;
> +
> +       fwspec->fwnode =3D chip->irq.parent_domain->fwnode;
> +
> +       fwspec->param_count =3D 4;
> +       fwspec->param[0] =3D state->usid;
> +       fwspec->param[1] =3D parent_hwirq;
> +       fwspec->param[2] =3D 0;

If the kzalloc stays, this can be dropped.

> +       fwspec->param[3] =3D parent_type;
> +
> +       return fwspec;
> +}
> +
>  static int pmic_gpio_probe(struct platform_device *pdev)
>  {
>         struct irq_domain *parent_domain;
