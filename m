Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A2F2DF479
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Dec 2020 09:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgLTIiX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Dec 2020 03:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgLTIiW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Dec 2020 03:38:22 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA9BC0613CF;
        Sun, 20 Dec 2020 00:37:42 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id l23so4680939pjg.1;
        Sun, 20 Dec 2020 00:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=kLcQrgRzEOoQzfR0hOTXdqAlREPIo4L73gUI38raIg4=;
        b=R7Y1z9b9QtkQcBr4pER+eUg01enSrwBWXrKt/nC9Xw0iO0dA6ckQs5NWfk/MkhIqPN
         MmeCMElm2PVrivyIZDxRA56BI7vWJIh/beM0Rue7OpTjFuivB0GT9AemL53dUhwRxGEU
         wIMrJfTdUhX1qRgq2NW+VoD8yH3tPosKcPbWP5YDQdWxndlMhRjN+sWnvbs34c0kKOOl
         6kFTRUNKhBO8YHHg+OOGLXVDbxSqHV2qsHZAAAyt46y77Z4BxTeara3GZ4j3s2AC4yq0
         QfsqMtOOmFoSNRf00Mcfi1ro+hKBKgXiaJe15edOBnEXW9VKHMsm4W9aq1+fLj3eKWcr
         NF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kLcQrgRzEOoQzfR0hOTXdqAlREPIo4L73gUI38raIg4=;
        b=SaGom//YlUcKBd1kMH47sI1sIq0A+kj27tOj2zVRy/OLslmCcYCdwYUtayilSUpPaX
         xKSDKyWYgT+BmcORZBgsMIu+Hqd5EtPG/xF2X83x6v/CJEomudwfWIhZ6BUVOW4TNNxm
         57l8hvyJt+qL3C9H8uHkeozkmvw22kSJjsXqNzSIWSRq6/uqXg/F0ykqCMZkErgSOCly
         q1QPpiWnqkeFaxjCDG5DCi8qQOaNDsloblgw5IMWzsd0TegP4wXY0KM6ebU/bBC0pH1G
         nkIrzzN5AyuO233f5+jTBL9WCyy1j6lj/5xAeVP2X2QellhjdHFdnmRDMPIXoasdF/Xu
         OQAw==
X-Gm-Message-State: AOAM533Vr9siUANHkTPyTtG3hd2vEkDs7heGrcD/UGQ6/7YZ8UWT+nUM
        oD8Ml2Ov9hNQzEAWQpmcG4Y=
X-Google-Smtp-Source: ABdhPJzWgP+tiZyYdRONzicryq4SnR/Nlgxpt7c1MNQ6CYgaz8PbEVvcKzuWFcgFqKSXToPYbHTcNg==
X-Received: by 2002:a17:90a:4e47:: with SMTP id t7mr12527833pjl.13.1608453461808;
        Sun, 20 Dec 2020 00:37:41 -0800 (PST)
Received: from manjaro ([185.211.49.69])
        by smtp.gmail.com with ESMTPSA id h18sm13038369pfo.172.2020.12.20.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 00:37:41 -0800 (PST)
From:   Zhaoyu Liu <zackary.liu.pro@gmail.com>
X-Google-Original-From: Zhaoyu Liu <zackaryliu@yeah.net>
Date:   Sun, 20 Dec 2020 16:37:19 +0800
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
Subject: [PATCH v3] pinctrl: remove empty lines in pinctrl subsystem
Message-ID: <X98NP6NFK1Afzrgd@manjaro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove all empty lines at the end of functions in pinctrl subsystem,
and make the code neat.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Zhaoyu Liu <zackaryliu@yeah.net>
---
Changelog:
v3:
- Rebuild the patch based on "devel" branch of linux-pinctrl.
- Delete "Target files" description from the commit message.
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
 drivers/pinctrl/renesas/pfc-r8a77951.c        | 1 -
 drivers/pinctrl/renesas/pfc-r8a7796.c         | 1 -
 drivers/pinctrl/renesas/pfc-r8a77965.c        | 1 -
 13 files changed, 13 deletions(-)

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
index 9fc4433fece4..7d3370289938 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2117,7 +2117,6 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
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
index 32b66b9999b8..32fe8caca70a 100644
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
index cf14420794c7..bdd605e41303 100644
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
diff --git a/drivers/pinctrl/renesas/pfc-r8a7796.c b/drivers/pinctrl/renesas/pfc-r8a7796.c
index 38d963561b5f..96b5b1509bb7 100644
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
index 92f231baff7d..f15e29383d9b 100644
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

