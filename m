Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FB928D877
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 04:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbgJNC2E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 22:28:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJNC2E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Oct 2020 22:28:04 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D46721775;
        Wed, 14 Oct 2020 02:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602642482;
        bh=1DNgPEOQi50qtjP7yIrzdu1Z005RzZK+lWK5u9mPWMc=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Qegr2NcWTNrkJE35Hd24y+cH+6QoFYiJJf/xTflHjCeEEg2ocnI/0uMAlCyjKHBF7
         2su1zcpJOOvAGff5pFmuqPbZKTLXBbBHK0LiHf1Ce7sV/tCjE+3T1EywQ3kP6BfHAb
         0b043EvPISIh5Fs5zy8QO2xnwjH1biDd6/8OhHLA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1601270140-4306-4-git-send-email-varada@codeaurora.org>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org> <1601270140-4306-4-git-send-email-varada@codeaurora.org>
Subject: Re: [PATCH 3/7] clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        catalin.marinas@arm.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, nsekar@codeaurora.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        sricharan@codeaurora.org, varada@codeaurora.org, will@kernel.org
Date:   Tue, 13 Oct 2020 19:28:00 -0700
Message-ID: <160264248077.310579.3081678774406286664@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Varadarajan Narayanan (2020-09-27 22:15:36)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 0583273..d1a2504 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,14 @@ config IPQ_GCC_8074
>           i2c, USB, SD/eMMC, etc. Select this for the root clock
>           of ipq8074.
> =20
> +config IPQ_GCC_5018
> +       tristate "IPQ5018 Global Clock Controller"
> +       help
> +        Support for global clock controller on ipq5018 devices.
> +        Say Y if you want to use peripheral devices such as UART, SPI,
> +        i2c, USB, SD/eMMC, etc. Select this for the root clock
> +        of ipq5018.

What is the root clock of ipq5018? Please drop that last sentence.

> +
>  config MSM_GCC_8660
>         tristate "MSM8660 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq501=
8.c
> new file mode 100644
> index 00000000..9056386
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -0,0 +1,3833 @@
> +// SPDX-License-Identifier: GPL-2.0+
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

Why is this attached to dt-bindings? Please remove that newline above
and move this away from dt-bindings below.

> +#include <dt-bindings/clock/qcom,gcc-ipq5018.h>
> +#include <dt-bindings/reset/qcom,gcc-ipq5018.h>
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

This is in clk-rcg.h already.

> +
> +static const char * const gcc_usb3phy_0_cc_pipe_clk_xo[] =3D {
> +       "usb3phy_0_cc_pipe_clk",
> +       "xo",
> +};

All these names structures need to change, see next comment.

> +
> +static struct clk_rcg2 apss_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0x46000,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .freq_tbl =3D ftbl_apss_ahb_clk_src,
> +       .parent_map =3D gcc_xo_gpll0_gpll0_out_main_div2_map,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "apss_ahb_clk_src",
> +               .parent_names =3D gcc_xo_gpll0_gpll0_out_main_div2,
> +               .num_parents =3D 3,

Please migrate to the new way of specifying clks with clk_init_data::clk_pa=
rent_data

> +               .ops =3D &clk_rcg2_ops,
> +               .flags =3D CLK_IS_CRITICAL | CLK_IGNORE_UNUSED,

Why is it critical and ignore unused? Do you need this clk to be here at
all? Can we just enable it when this driver probes with a register write
and then ignore it from there on out?

> +       },
> +};
> +
> +static struct clk_regmap_div apss_ahb_postdiv_clk_src =3D {
> +       .reg =3D 0x46018,
> +       .shift =3D 4,
> +       .width =3D 4,
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "apss_ahb_postdiv_clk_src",
> +                       .parent_names =3D (const char *[]){
> +                               "apss_ahb_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_regmap_div_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch gcc_qdss_dap_clk =3D {
> +       .halt_reg =3D 0x29084,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29084,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qdss_dap_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "qdss_tsctr_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Whenever CLK_IS_CRITICAL is there please document why it is needed. And
if possible remove the clk structure and hit the clk on in driver probe
so we don't waste memory modeling something that never matters.
Typically that can only be done if nothing references this clk as a
parent or if we're willing to break the clk tree and ignore describing
parents. In this case it's a branch so probably nothing else is under it
so we can just turn it on during probe and stop caring.

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_qdss_cfg_ahb_clk =3D {
> +       .halt_reg =3D 0x29008,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qdss_cfg_ahb_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "pcnoc_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch gcc_qdss_stm_clk =3D {
> +       .halt_reg =3D 0x29044,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29044,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qdss_stm_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "qdss_stm_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSE=
D,

Why ignore unused? Probably should just be turned on somewhere else?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_qdss_traceclkin_clk =3D {
> +       .halt_reg =3D 0x29060,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29060,
[...]
> +
> +static int gcc_ipq5018_probe(struct platform_device *pdev)
> +{
> +       int i, ret;
> +       struct regmap *regmap;
> +       struct clk *clk;
> +       struct qcom_cc_desc ipq5018_desc =3D gcc_ipq5018_desc;
> +
> +       regmap =3D qcom_cc_map(pdev, &ipq5018_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(gcc_ipq5018_hws); i++) {
> +               clk =3D devm_clk_register(&pdev->dev, gcc_ipq5018_hws[i]);
> +               if (IS_ERR(clk))
> +                       return PTR_ERR(clk);
> +       }

We really need to move this into the qcom_cc_desc so it is part of
qcom_cc_really_probe()

> +       /*Gen2 PHY*/
> +       clk_register_fixed_rate(&pdev->dev, "pcie20_phy0_pipe_clk", NULL,
> +                                       CLK_IS_ROOT, 125000000);
> +       clk_register_fixed_rate(&pdev->dev, "pcie20_phy1_pipe_clk", NULL,
> +                                       CLK_IS_ROOT, 125000000);

These should be coming from some pcie phy and part of the DT binding as
a 'clocks' element that this device consumes.

> +
> +       clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_confi=
g);
> +
> +       ret =3D qcom_cc_really_probe(pdev, &ipq5018_desc, regmap);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register ipq5018 GCC clock=
s\n");
> +               return ret;
> +       }
> +
> +       dev_info(&pdev->dev, "Registered ipq5018 GCC clocks provider");

Please drop this noise.

> +
> +       return ret;
> +}
> +
> +static int gcc_ipq5018_remove(struct platform_device *pdev)
> +{
> +       return 0;
> +}
> +

If there isn't anything in the remove function it can be omitted.

> +static struct platform_driver gcc_ipq5018_driver =3D {
> +       .probe =3D gcc_ipq5018_probe,
> +       .remove =3D gcc_ipq5018_remove,
> +       .driver =3D {
> +               .name   =3D "qcom,gcc-ipq5018",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D gcc_ipq5018_match_table,
> +       },
> +};
> +
> +static int __init gcc_ipq5018_init(void)
> +{
> +       return platform_driver_register(&gcc_ipq5018_driver);
> +}
> +core_initcall(gcc_ipq5018_init);
> +
> +static void __exit gcc_ipq5018_exit(void)
> +{
> +       platform_driver_unregister(&gcc_ipq5018_driver);
> +}
> +module_exit(gcc_ipq5018_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ5018 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-ipq5018");

I think alias isn't needed anymore.

> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 03a5de5..31fde45 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -20,8 +20,8 @@
>  #define CLK_SET_PARENT_GATE    BIT(1) /* must be gated across re-parent =
*/
>  #define CLK_SET_RATE_PARENT    BIT(2) /* propagate rate change up one le=
vel */
>  #define CLK_IGNORE_UNUSED      BIT(3) /* do not gate even if unused */
> -                               /* unused */
> -                               /* unused */
> +#define CLK_IS_ROOT            BIT(4) /* root clk, has no parent */
> +#define CLK_IS_BASIC           BIT(5) /* Basic clk, can't do a to_clk_fo=
o() */

Please no. Drop this hunk.

>  #define CLK_GET_RATE_NOCACHE   BIT(6) /* do not use the cached clk rate =
*/
>  #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate chang=
e */
>  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk acc=
uracy */
