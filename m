Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0AE12B03C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 02:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfL0BdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 20:33:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:45970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbfL0BdT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Dec 2019 20:33:19 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7E912080D;
        Fri, 27 Dec 2019 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577410397;
        bh=5Yx3y9PHsdQln0iIJjCGPleS3otmhTjrs6Rx8bNhXJI=;
        h=In-Reply-To:References:From:To:Subject:Date:From;
        b=XI+Zisoxpm8SwwYJNDsvSQkTzHwpTwZsSfUEWofgzSM16z8W8FIw6ba4xmhq+xBK2
         fBHr9PUlNxRqckDZJeXlJj4ucC70RecitokBRLdysZ0XaCyun70yO9W/kHDpwt5w2v
         awLJaUtqmWgnr8E6hc2tLTjRoD90CRRlb9mflaOQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576752109-24497-6-git-send-email-sricharan@codeaurora.org>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org> <1576752109-24497-6-git-send-email-sricharan@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org,
        sivaprak@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH V2 5/7] clk: qcom: Add ipq6018 Global Clock Controller support
User-Agent: alot/0.8.1
Date:   Thu, 26 Dec 2019 17:33:16 -0800
Message-Id: <20191227013317.C7E912080D@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sricharan R (2019-12-19 02:41:47)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 3b33ef1..d0392f1 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -95,6 +95,14 @@ config IPQ_GCC_4019
>           Say Y if you want to use peripheral devices such as UART, SPI,
>           i2c, USB, SD/eMMC, etc.
> =20
> +config IPQ_GCC_6018
> +       tristate "IPQ6018 Global Clock Controller"
> +       help
> +         Support for global clock controller on ipq6018 devices.
> +         Say Y if you want to use peripheral devices such as UART, SPI,
> +         i2c, USB, SD/eMMC, etc. Select this for the root clock
> +         of ipq6018.

What is the root clock of ipq6018?

> +
>  config IPQ_GCC_806X
>         tristate "IPQ806x Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq601=
8.c
> new file mode 100644
> index 0000000..b6f0148
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -0,0 +1,4674 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +#include <dt-bindings/reset/qcom,gcc-ipq6018.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "reset.h"
> +
> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> +
> +enum {
> +       P_XO,
> +       P_BIAS_PLL,
> +       P_UNIPHY0_RX,
> +       P_UNIPHY0_TX,
> +       P_UNIPHY1_RX,
> +       P_BIAS_PLL_NSS_NOC,
> +       P_UNIPHY1_TX,
> +       P_PCIE20_PHY0_PIPE,
> +       P_USB3PHY_0_PIPE,
> +       P_GPLL0,
> +       P_GPLL0_DIV2,
> +       P_GPLL2,
> +       P_GPLL4,
> +       P_GPLL6,
> +       P_SLEEP_CLK,
> +       P_UBI32_PLL,
> +       P_NSS_CRYPTO_PLL,
> +       P_PI_SLEEP,
> +};
> +
> +static const struct clk_parent_data gcc_xo_gpll0_gpll0_out_main_div2[] =
=3D {
> +       { .fw_name =3D "xo", .name =3D "xo"},
> +       { .fw_name =3D "gpll0", .name =3D "gpll0"},
> +       { .fw_name =3D "gpll0_out_main_div2", .name =3D "gpll0_out_main_d=
iv2"},

Because we aren't migrating this from existing DT to new DT we should be
able to leave out .name in all these structs. That's the legacy fallback
mechanism used to migrate DT over to the new way.

> +};
> +
> +static const struct parent_map gcc_xo_gpll0_gpll0_out_main_div2_map[] =
=3D {
> +       { P_XO, 0 },
> +       { P_GPLL0, 1 },
> +       { P_GPLL0_DIV2, 4 },
> +};
> +
[...]
> +
> +static int gcc_ipq6018_probe(struct platform_device *pdev)
> +{
> +       int i, ret;
> +       struct regmap *regmap;
> +       struct clk *clk;
> +       struct device *dev =3D &pdev->dev;
> +
> +       regmap =3D qcom_cc_map(pdev, &gcc_ipq6018_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(gcc_ipq6018_hws); i++) {
> +               clk =3D devm_clk_register(&pdev->dev, gcc_ipq6018_hws[i]);
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
> +       }
> +
> +       clk_register_fixed_rate(dev, "pcie20_phy0_pipe_clk", NULL, 0, 250=
000000);

Why do we need to register this? Can it come from DT then? Also what if
it fails? And what if really_probe fails? Then we'll need to undo this
registration. Ideally this is created somewhere else.

> +
> +       /* Disable SW_COLLAPSE for USB0 GDSCR */
> +       regmap_update_bits(regmap, 0x3e078, BIT(0), 0x0);
> +       /* Enable SW_OVERRIDE for USB0 GDSCR */
> +       regmap_update_bits(regmap, 0x3e078, BIT(2), BIT(2));
> +       /* Disable SW_COLLAPSE for USB1 GDSCR */
> +       regmap_update_bits(regmap, 0x3f078, BIT(0), 0x0);
> +       /* Enable SW_OVERRIDE for USB1 GDSCR */
> +       regmap_update_bits(regmap, 0x3f078, BIT(2), BIT(2));
> +
> +       /* SW Workaround for UBI Huyara PLL */
> +       regmap_update_bits(regmap, 0x2501c, BIT(26), BIT(26));
> +
> +       clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_confi=
g);
> +
> +       clk_alpha_pll_configure(&nss_crypto_pll_main, regmap,
> +                               &nss_crypto_pll_config);
> +
> +       ret =3D qcom_cc_really_probe(pdev, &gcc_ipq6018_desc, regmap);
> +
> +       dev_dbg(&pdev->dev, "Registered ipq6018 clock provider");

Please remove this and just return the result of really_probe.

> +
> +       return ret;
> +}
