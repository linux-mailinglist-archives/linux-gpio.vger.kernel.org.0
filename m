Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE17A2D63B5
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 18:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392835AbgLJRgV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 12:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392834AbgLJRgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 12:36:11 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBBEC061794;
        Thu, 10 Dec 2020 09:35:31 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id r4so3122033pls.11;
        Thu, 10 Dec 2020 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=iImdlIciIZ18rKleGxMVRyMuly6mo3QaSkmEjKHVgUo=;
        b=vHS8VT/snfkz9jZxY7+ogKjNw8LV7Czk8Wp28AiIAr5s5AhPUJuSe8ift7bIoEQKhc
         RxQ1ZTUr+gO564zb2J/bQ0z86SCgKN0YVaUS/eBGl4dYVCuHmHa/PxvNX6UbC+NIzp92
         QoQ4fNaiEgcUddbbK5yl4zRbrKnskVlX+/ZpnraPpDdzrD0ggreTnJItvtF60v6zAwLI
         r/n1wqdOMYCbdTfhBjfKWNCYPuwYeoi0pN/9zB6NG4fxRGFnC6KZF/dNvyPk9S2/YbHE
         ur4e/4SRhnnIRhGJlBWT2C/iSQW3y+AWkmJ6ENEmHYsTLd1WjwSmWBwIGxIAfQs+g6iH
         NiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=iImdlIciIZ18rKleGxMVRyMuly6mo3QaSkmEjKHVgUo=;
        b=JiFDbvV+N/UvwfVt/3A7vGhkVs/eTtWl10fMfljXtHEJfPYtVfj2L333b5COfGHHql
         qWSyOcN7PzYsDm3G6YIHvTYWGLqNlx6e/8l2NW7VfBhPBxZA0QFbKDw6omCs6hNuC36t
         Jqo8PF2VRG2XQo+X9XFpsM+VStR8qdjaikNq2BSns1k+k2VhY/nbYaQ+IsY4OhmynoEG
         Xp/Xrv2hNUYfy/WJsPtRYPeBCFVobNCLLSuGy9aeIudi1tSFrgRITvOXDYneN/6mb7l+
         7NAhhhAWlEPCfmJaGM92cL6E5DskE/HL5B4GsXMmtjJgqwmJ5oOhlonaMoIuqnYacMxW
         BnqQ==
X-Gm-Message-State: AOAM5305eqhwYdBg/FTSkK0UdodZQBejfD5O+0ePwFsk5ekjB6DpRwWr
        Dh5z/yyMqlrX9nZkqu0Pxj8=
X-Google-Smtp-Source: ABdhPJxcxzbtUviPQgqLLg9tvJTp7B1fOrdSHSejaovv4gAGMgkM2kkPKtdSU54nxdCqFw7oFv/IRQ==
X-Received: by 2002:a17:902:a9c7:b029:d9:d985:55b1 with SMTP id b7-20020a170902a9c7b02900d9d98555b1mr7427949plr.59.1607621730749;
        Thu, 10 Dec 2020 09:35:30 -0800 (PST)
Received: from manjaro (ec2-18-183-72-58.ap-northeast-1.compute.amazonaws.com. [18.183.72.58])
        by smtp.gmail.com with ESMTPSA id h13sm4244859pjg.56.2020.12.10.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 09:35:30 -0800 (PST)
Date:   Fri, 11 Dec 2020 01:35:13 +0800
From:   Zhaoyu Liu <zackary.liu.pro@gmail.com>
To:     linus.walleij@linaro.org, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, s.hauer@pengutronix.de, linux-imx@nxp.com,
        andrew@lunn.ch, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        patrice.chotard@st.com, agross@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] pinctrl: remove empty lines in pinctrl subsystem
Message-ID: <X9JcUZCLh3WjV7Bw@manjaro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove all empty lines at the end of functions in pinctrl subsystem,
make the code neat.
Target files: grep -nwR -B1 ^} drivers/pinctrl/* | grep '[0-9]-$' | less

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>
---
Changelog:
v2:
- Fixed the same problem in all files in pinctrl subsystem.
v1:
- Remove the blank line in pinctrl_register().
---
 drivers/pinctrl/actions/pinctrl-owl.c         | 1 -
 drivers/pinctrl/core.c                        | 1 -
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 1 -
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c   | 1 -
 drivers/pinctrl/pinctrl-at91.c                | 1 -
 drivers/pinctrl/pinctrl-st.c                  | 1 -
 drivers/pinctrl/pinctrl-sx150x.c              | 1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c         | 1 -
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c       | 1 -
 drivers/pinctrl/renesas/pfc-r8a77950.c        | 1 -
 drivers/pinctrl/renesas/pfc-r8a77951.c        | 3 ---
 drivers/pinctrl/renesas/pfc-r8a7796.c         | 1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c        | 1 -
 13 files changed, 15 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 903a4baf3846..c8b3e396ea27 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -444,7 +444,6 @@ static int owl_group_config_get(struct pinctrl_dev *pctrldev,
 	*config = pinconf_to_config_packed(param, arg);
 
 	return ret;
-
 }
 
 static int owl_group_config_set(struct pinctrl_dev *pctrldev,
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..1f944685047b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2115,7 +2115,6 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 		return ERR_PTR(error);
 
 	return pctldev;
-
 }
 EXPORT_SYMBOL_GPL(pinctrl_register);
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 08d110078c43..70186448d2f4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -290,7 +290,6 @@ static const struct pinctrl_ops imx1_pctrl_ops = {
 	.pin_dbg_show = imx1_pin_dbg_show,
 	.dt_node_to_map = imx1_dt_node_to_map,
 	.dt_free_map = imx1_dt_free_map,
-
 };
 
 static int imx1_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 68894e9e05d2..5a68e242f6b3 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -188,7 +188,6 @@ static struct armada_37xx_pin_group armada_37xx_nb_groups[] = {
 	PIN_GRP_GPIO_2("led1_od", 12, 1, BIT(21), BIT(21), 0, "led"),
 	PIN_GRP_GPIO_2("led2_od", 13, 1, BIT(22), BIT(22), 0, "led"),
 	PIN_GRP_GPIO_2("led3_od", 14, 1, BIT(23), BIT(23), 0, "led"),
-
 };
 
 static struct armada_37xx_pin_group armada_37xx_sb_groups[] = {
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 72edc675431c..9015486e38c1 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -733,7 +733,6 @@ static const struct at91_pinctrl_mux_ops sam9x60_ops = {
 	.get_slewrate   = at91_mux_sam9x60_get_slewrate,
 	.set_slewrate   = at91_mux_sam9x60_set_slewrate,
 	.irq_type	= alt_gpio_irq_type,
-
 };
 
 static struct at91_pinctrl_mux_ops sama5d3_ops = {
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 7b8c7a0b13de..43d9e6c7fd81 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -541,7 +541,6 @@ static void st_pinconf_set_retime_packed(struct st_pinctrl *info,
 	st_regmap_field_bit_set_clear_pin(rt_p->delay_0, delay & 0x1, pin);
 	/* 2 bit delay, msb */
 	st_regmap_field_bit_set_clear_pin(rt_p->delay_1, delay & 0x2, pin);
-
 }
 
 static void st_pinconf_set_retime_dedicated(struct st_pinctrl *info,
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index c110f780407b..484a3b9e875c 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -443,7 +443,6 @@ static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 		sx150x_gpio_oscio_set(pctl, value);
 	else
 		__sx150x_gpio_set(pctl, offset, value);
-
 }
 
 static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 2834d2c1338c..c51793f6546f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1310,7 +1310,6 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
 	.ngpios = 151,
 	.wakeirq_map = sdm845_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sdm845_pdc_map),
-
 };
 
 static const struct msm_pinctrl_soc_data sdm845_acpi_pinctrl = {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 681d8dcf37e3..92e7f2602847 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -617,7 +617,6 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
 		}
 		break;
 	}
-
 }
 
 static void pm8xxx_mpp_dbg_show(struct seq_file *s, struct gpio_chip *chip)
diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index 04812e62f3a4..9d89da2319e5 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -1668,7 +1668,6 @@ static const unsigned int avb_mii_pins[] = {
 	PIN_AVB_RX_CTL, PIN_AVB_RXC, PIN_AVB_RD0,
 	PIN_AVB_RD1, PIN_AVB_RD2, PIN_AVB_RD3,
 	PIN_AVB_TXCREFCLK,
-
 };
 static const unsigned int avb_mii_mux[] = {
 	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
diff --git a/drivers/pinctrl/renesas/pfc-r8a77951.c b/drivers/pinctrl/renesas/pfc-r8a77951.c
index a94ebe0bf5d0..919120b4adf3 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77951.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77951.c
@@ -1727,7 +1727,6 @@ static const unsigned int avb_mii_pins[] = {
 	PIN_AVB_RX_CTL, PIN_AVB_RXC, PIN_AVB_RD0,
 	PIN_AVB_RD1, PIN_AVB_RD2, PIN_AVB_RD3,
 	PIN_AVB_TXCREFCLK,
-
 };
 static const unsigned int avb_mii_mux[] = {
 	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
@@ -4515,7 +4514,6 @@ static const struct {
 		SH_PFC_PIN_GROUP(drif3_data0_b),
 		SH_PFC_PIN_GROUP(drif3_data1_b),
 	}
-
 };
 
 static const char * const audio_clk_groups[] = {
@@ -5104,7 +5102,6 @@ static const struct {
 		SH_PFC_FUNCTION(drif2),
 		SH_PFC_FUNCTION(drif3),
 	}
-
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 55f0344a3d3e..904c78c6c638 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7796.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7796.c
@@ -1731,7 +1731,6 @@ static const unsigned int avb_mii_pins[] = {
 	PIN_AVB_RX_CTL, PIN_AVB_RXC, PIN_AVB_RD0,
 	PIN_AVB_RD1, PIN_AVB_RD2, PIN_AVB_RD3,
 	PIN_AVB_TXCREFCLK,
-
 };
 static const unsigned int avb_mii_mux[] = {
 	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
diff --git a/drivers/pinctrl/renesas/pfc-r8a77965.c b/drivers/pinctrl/renesas/pfc-r8a77965.c
index 7a50b9b69a7d..7db2b7f2ff67 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77965.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77965.c
@@ -1736,7 +1736,6 @@ static const unsigned int avb_mii_pins[] = {
 	PIN_AVB_RX_CTL, PIN_AVB_RXC, PIN_AVB_RD0,
 	PIN_AVB_RD1, PIN_AVB_RD2, PIN_AVB_RD3,
 	PIN_AVB_TXCREFCLK,
-
 };
 static const unsigned int avb_mii_mux[] = {
 	AVB_TX_CTL_MARK, AVB_TXC_MARK, AVB_TD0_MARK,
-- 
2.29.2

