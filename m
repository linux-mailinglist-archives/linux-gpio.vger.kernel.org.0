Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8CA553784
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 18:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353825AbiFUQMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jun 2022 12:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353786AbiFUQL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2022 12:11:59 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE2F2D1DE;
        Tue, 21 Jun 2022 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655827918; x=1687363918;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version;
  bh=yXhBuQLDnVrXG+WZgL5tFQLOmzl9EQE8WxEQQBAXkt4=;
  b=N9szCBUA0wfcwguM2do7MgCv1/h0NH7TMqzS4rj5jAwSe6+6C918MAIj
   2BGXSUdIZbs8YeJ+jGfiWWHDaiQVzFsfxL0wACnObi9KKhrGv4Zz+F1dr
   s0hTBVNSSCfNO5A38G4cg3ZUcHzkPyNcPdFxfVG2+tcV5Out5jlouIpVO
   I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jun 2022 09:11:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 09:11:57 -0700
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 09:11:56 -0700
Received: from srichara-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 21 Jun 2022 09:11:51 -0700
From:   Sricharan R <quic_srichara@quicinc.com>
To:     <quic_srichara@quicinc.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <quic_varada@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH V2 2/8] dt-bindings: arm64: ipq5018: Add binding descriptions for clock and reset
Date:   Tue, 21 Jun 2022 21:41:20 +0530
Message-ID: <20220621161126.15883-3-quic_srichara@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220621161126.15883-1-quic_srichara@quicinc.com>
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Varadarajan Narayanan <quic_varada@quicinc.com>

This patch adds support for the global clock controller found on
the IPQ5018 based devices.

Co-developed-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 .../bindings/clock/qcom,gcc-other.yaml        |   3 +
 include/dt-bindings/clock/qcom,gcc-ipq5018.h  | 188 ++++++++++++++++++
 include/dt-bindings/reset/qcom,gcc-ipq5018.h  | 122 ++++++++++++
 3 files changed, 313 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c45e0f85494..3852346dbcad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -29,6 +29,8 @@ description: |
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
   - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
+  - dt-bindings/clock/qcom,gcc-ipq5018.h
+  - dt-bindings/reset/qcom,gcc-ipq5018.h
 
 allOf:
   - $ref: "qcom,gcc.yaml#"
@@ -51,6 +53,7 @@ properties:
       - qcom,gcc-mdm9615
       - qcom,gcc-sdm630
       - qcom,gcc-sdm660
+      - qcom,gcc-ipq5018
 
 required:
   - compatible
diff --git a/include/dt-bindings/clock/qcom,gcc-ipq5018.h b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
new file mode 100644
index 000000000000..14916600e2a7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-ipq5018.h
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_IPQ_GCC_5018_H
+#define _DT_BINDINGS_CLOCK_IPQ_GCC_5018_H
+
+#define GPLL0_MAIN					0
+#define GPLL0						1
+#define GPLL2_MAIN					2
+#define GPLL2						3
+#define GPLL4_MAIN					4
+#define GPLL4						5
+#define UBI32_PLL_MAIN					6
+#define UBI32_PLL					7
+#define APSS_AHB_CLK_SRC				9
+#define APSS_AHB_POSTDIV_CLK_SRC			10
+#define APSS_AXI_CLK_SRC				11
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC			12
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC			13
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC			14
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC			15
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC			16
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC			17
+#define BLSP1_UART1_APPS_CLK_SRC			18
+#define BLSP1_UART2_APPS_CLK_SRC			19
+#define CRYPTO_CLK_SRC					20
+#define GCC_APSS_AHB_CLK				23
+#define GCC_APSS_AXI_CLK				24
+#define GCC_BLSP1_AHB_CLK				25
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK			26
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK			27
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK			28
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK			29
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK			30
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK			31
+#define GCC_BLSP1_UART1_APPS_CLK			33
+#define GCC_BLSP1_UART2_APPS_CLK			34
+#define GCC_BTSS_LPO_CLK				36
+#define GCC_CMN_BLK_AHB_CLK				40
+#define GCC_CMN_BLK_SYS_CLK				41
+#define GCC_CRYPTO_AHB_CLK				44
+#define GCC_CRYPTO_AXI_CLK				45
+#define GCC_CRYPTO_CLK					46
+#define GCC_CRYPTO_PPE_CLK				47
+#define GCC_DCC_CLK					48
+#define GCC_GEPHY_RX_CLK				53
+#define GCC_GEPHY_TX_CLK				54
+#define GCC_GMAC0_CFG_CLK				55
+#define GCC_GMAC0_PTP_CLK				56
+#define GCC_GMAC0_RX_CLK				57
+#define GCC_GMAC0_SYS_CLK				58
+#define GCC_GMAC0_TX_CLK				59
+#define GCC_GMAC1_CFG_CLK				60
+#define GCC_GMAC1_PTP_CLK				61
+#define GCC_GMAC1_RX_CLK				62
+#define GCC_GMAC1_SYS_CLK				63
+#define GCC_GMAC1_TX_CLK				64
+#define GCC_GP1_CLK					65
+#define GCC_GP2_CLK					66
+#define GCC_GP3_CLK					67
+#define GCC_LPASS_CORE_AXIM_CLK				69
+#define GCC_LPASS_SWAY_CLK				70
+#define GCC_MDIO0_AHB_CLK				71
+#define GCC_MDIO1_AHB_CLK				72
+#define GCC_PCIE0_AHB_CLK				74
+#define GCC_PCIE0_AUX_CLK				75
+#define GCC_PCIE0_AXI_M_CLK				76
+#define GCC_PCIE0_AXI_S_BRIDGE_CLK			77
+#define GCC_PCIE0_AXI_S_CLK				78
+#define GCC_PCIE1_AHB_CLK				79
+#define GCC_PCIE1_AUX_CLK				80
+#define GCC_PCIE1_AXI_M_CLK				81
+#define GCC_PCIE1_AXI_S_BRIDGE_CLK			82
+#define GCC_PCIE1_AXI_S_CLK				83
+#define GCC_PRNG_AHB_CLK				84
+#define GCC_Q6_AXIM_CLK					85
+#define GCC_Q6_AXIM2_CLK				86
+#define GCC_Q6_AXIS_CLK					87
+#define GCC_Q6_AHB_CLK					88
+#define GCC_Q6_AHB_S_CLK				89
+#define GCC_Q6_TSCTR_1TO2_CLK				90
+#define GCC_Q6SS_ATBM_CLK				91
+#define GCC_Q6SS_PCLKDBG_CLK				92
+#define GCC_Q6SS_TRIG_CLK				93
+#define GCC_QDSS_AT_CLK					94
+#define GCC_QDSS_CFG_AHB_CLK				95
+#define GCC_QDSS_DAP_AHB_CLK				96
+#define GCC_QDSS_DAP_CLK				97
+#define GCC_QDSS_ETR_USB_CLK				98
+#define GCC_QDSS_EUD_AT_CLK				99
+#define GCC_QDSS_STM_CLK				100
+#define GCC_QDSS_TRACECLKIN_CLK				101
+#define GCC_QDSS_TSCTR_DIV8_CLK				102
+#define GCC_QPIC_AHB_CLK				103
+#define GCC_QPIC_CLK					104
+#define GCC_QPIC_IO_MACRO_CLK				105
+#define GCC_SDCC1_AHB_CLK				107
+#define GCC_SDCC1_APPS_CLK				108
+#define GCC_SLEEP_CLK_SRC				109
+#define GCC_SNOC_GMAC0_AHB_CLK				110
+#define GCC_SNOC_GMAC0_AXI_CLK				111
+#define GCC_SNOC_GMAC1_AHB_CLK				112
+#define GCC_SNOC_GMAC1_AXI_CLK				113
+#define GCC_SNOC_LPASS_AXIM_CLK				114
+#define GCC_SNOC_LPASS_SWAY_CLK				115
+#define GCC_SNOC_UBI0_AXI_CLK				118
+#define GCC_SYS_NOC_PCIE0_AXI_CLK			119
+#define GCC_SYS_NOC_PCIE1_AXI_CLK			120
+#define GCC_SYS_NOC_QDSS_STM_AXI_CLK			121
+#define GCC_SYS_NOC_USB0_AXI_CLK			123
+#define GCC_SYS_NOC_WCSS_AHB_CLK			124
+#define GCC_UBI0_AXI_CLK				128
+#define GCC_UBI0_CFG_CLK				129
+#define GCC_UBI0_CORE_CLK				130
+#define GCC_UBI0_DBG_CLK				131
+#define GCC_UBI0_NC_AXI_CLK				132
+#define GCC_UBI0_UTCM_CLK				133
+#define GCC_UNIPHY_AHB_CLK				134
+#define GCC_UNIPHY_RX_CLK				135
+#define GCC_UNIPHY_SYS_CLK				136
+#define GCC_UNIPHY_TX_CLK				137
+#define GCC_USB0_AUX_CLK				138
+#define GCC_USB0_EUD_AT_CLK				139
+#define GCC_USB0_LFPS_CLK				140
+#define GCC_USB0_MASTER_CLK				141
+#define GCC_USB0_MOCK_UTMI_CLK				142
+#define GCC_USB0_PHY_CFG_AHB_CLK			143
+#define GCC_USB0_SLEEP_CLK				144
+#define GCC_WCSS_ACMT_CLK				145
+#define GCC_WCSS_AHB_S_CLK				146
+#define GCC_WCSS_AXI_M_CLK				147
+#define GCC_WCSS_AXI_S_CLK				148
+#define GCC_WCSS_DBG_IFC_APB_BDG_CLK			149
+#define GCC_WCSS_DBG_IFC_APB_CLK			150
+#define GCC_WCSS_DBG_IFC_ATB_BDG_CLK			151
+#define GCC_WCSS_DBG_IFC_ATB_CLK			152
+#define GCC_WCSS_DBG_IFC_DAPBUS_BDG_CLK			153
+#define GCC_WCSS_DBG_IFC_DAPBUS_CLK			154
+#define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			155
+#define GCC_WCSS_DBG_IFC_NTS_CLK			156
+#define GCC_WCSS_ECAHB_CLK				157
+#define GCC_XO_CLK					158
+#define GCC_XO_CLK_SRC					159
+#define GMAC0_RX_CLK_SRC				161
+#define GMAC0_TX_CLK_SRC				162
+#define GMAC1_RX_CLK_SRC				163
+#define GMAC1_TX_CLK_SRC				164
+#define GMAC_CLK_SRC					165
+#define GP1_CLK_SRC					166
+#define GP2_CLK_SRC					167
+#define GP3_CLK_SRC					168
+#define LPASS_AXIM_CLK_SRC				169
+#define LPASS_SWAY_CLK_SRC				170
+#define PCIE0_AUX_CLK_SRC				171
+#define PCIE0_AXI_CLK_SRC				172
+#define PCIE1_AUX_CLK_SRC				173
+#define PCIE1_AXI_CLK_SRC				174
+#define PCNOC_BFDCD_CLK_SRC				175
+#define Q6_AXI_CLK_SRC					176
+#define QDSS_AT_CLK_SRC					177
+#define QDSS_STM_CLK_SRC				178
+#define QDSS_TSCTR_CLK_SRC				179
+#define QDSS_TRACECLKIN_CLK_SRC				180
+#define QPIC_IO_MACRO_CLK_SRC				181
+#define SDCC1_APPS_CLK_SRC				182
+#define SYSTEM_NOC_BFDCD_CLK_SRC			184
+#define UBI0_AXI_CLK_SRC				185
+#define UBI0_CORE_CLK_SRC				186
+#define USB0_AUX_CLK_SRC				187
+#define USB0_LFPS_CLK_SRC				188
+#define USB0_MASTER_CLK_SRC				189
+#define USB0_MOCK_UTMI_CLK_SRC				190
+#define WCSS_AHB_CLK_SRC				191
+#define PCIE0_PIPE_CLK_SRC				192
+#define PCIE1_PIPE_CLK_SRC				193
+#define GCC_PCIE0_PIPE_CLK				194
+#define GCC_PCIE1_PIPE_CLK				195
+#define USB0_PIPE_CLK_SRC				196
+#define GCC_USB0_PIPE_CLK				197
+#define GMAC0_RX_DIV_CLK_SRC				198
+#define GMAC0_TX_DIV_CLK_SRC				199
+#define GMAC1_RX_DIV_CLK_SRC				200
+#define GMAC1_TX_DIV_CLK_SRC				201
+#define ADSS_PWM_CLK_SRC				202
+#define GCC_ADSS_PWM_CLK				203
+#endif
diff --git a/include/dt-bindings/reset/qcom,gcc-ipq5018.h b/include/dt-bindings/reset/qcom,gcc-ipq5018.h
new file mode 100644
index 000000000000..bdbc974cb6ea
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,gcc-ipq5018.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_IPQ_GCC_5018_H
+#define _DT_BINDINGS_RESET_IPQ_GCC_5018_H
+
+#define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR	0
+#define	GCC_BLSP1_BCR				1
+#define GCC_BLSP1_QUP1_BCR			2
+#define	GCC_BLSP1_QUP2_BCR			3
+#define	GCC_BLSP1_QUP3_BCR			4
+#define	GCC_BLSP1_UART1_BCR			5
+#define	GCC_BLSP1_UART2_BCR			6
+#define	GCC_BOOT_ROM_BCR			7
+#define	GCC_BTSS_BCR				8
+#define	GCC_CMN_BLK_BCR				9
+#define	GCC_CMN_LDO_BCR				10
+#define	GCC_CE_BCR				11
+#define	GCC_CRYPTO_BCR				12
+#define	GCC_DCC_BCR				13
+#define	GCC_DCD_BCR				14
+#define	GCC_DDRSS_BCR				15
+#define	GCC_EDPD_BCR				16
+#define	GCC_GEPHY_BCR				17
+#define	GCC_GEPHY_MDC_SW_ARES			18
+#define	GCC_GEPHY_DSP_HW_ARES			19
+#define	GCC_GEPHY_RX_ARES			20
+#define	GCC_GEPHY_TX_ARES			21
+#define	GCC_GMAC0_BCR				22
+#define	GCC_GMAC0_CFG_ARES			23
+#define	GCC_GMAC0_SYS_ARES			24
+#define	GCC_GMAC1_BCR				25
+#define	GCC_GMAC1_CFG_ARES			26
+#define	GCC_GMAC1_SYS_ARES			27
+#define	GCC_IMEM_BCR				28
+#define	GCC_LPASS_BCR				29
+#define	GCC_MDIO0_BCR				30
+#define	GCC_MDIO1_BCR				31
+#define	GCC_MPM_BCR				32
+#define	GCC_PCIE0_BCR				33
+#define	GCC_PCIE0_LINK_DOWN_BCR			34
+#define	GCC_PCIE0_PHY_BCR			35
+#define	GCC_PCIE0PHY_PHY_BCR			36
+#define	GCC_PCIE0_PIPE_ARES			37
+#define	GCC_PCIE0_SLEEP_ARES			38
+#define	GCC_PCIE0_CORE_STICKY_ARES		39
+#define	GCC_PCIE0_AXI_MASTER_ARES		40
+#define	GCC_PCIE0_AXI_SLAVE_ARES		41
+#define	GCC_PCIE0_AHB_ARES			42
+#define	GCC_PCIE0_AXI_MASTER_STICKY_ARES	43
+#define	GCC_PCIE0_AXI_SLAVE_STICKY_ARES		44
+#define	GCC_PCIE1_BCR				45
+#define	GCC_PCIE1_LINK_DOWN_BCR			46
+#define	GCC_PCIE1_PHY_BCR			47
+#define	GCC_PCIE1PHY_PHY_BCR			48
+#define	GCC_PCIE1_PIPE_ARES			49
+#define	GCC_PCIE1_SLEEP_ARES			50
+#define	GCC_PCIE1_CORE_STICKY_ARES		51
+#define	GCC_PCIE1_AXI_MASTER_ARES		52
+#define	GCC_PCIE1_AXI_SLAVE_ARES		53
+#define	GCC_PCIE1_AHB_ARES			54
+#define	GCC_PCIE1_AXI_MASTER_STICKY_ARES	55
+#define	GCC_PCIE1_AXI_SLAVE_STICKY_ARES		56
+#define	GCC_PCNOC_BCR				57
+#define	GCC_PCNOC_BUS_TIMEOUT0_BCR		58
+#define	GCC_PCNOC_BUS_TIMEOUT1_BCR		59
+#define	GCC_PCNOC_BUS_TIMEOUT2_BCR		60
+#define	GCC_PCNOC_BUS_TIMEOUT3_BCR		61
+#define	GCC_PCNOC_BUS_TIMEOUT4_BCR		62
+#define	GCC_PCNOC_BUS_TIMEOUT5_BCR		63
+#define	GCC_PCNOC_BUS_TIMEOUT6_BCR		64
+#define	GCC_PCNOC_BUS_TIMEOUT7_BCR		65
+#define	GCC_PCNOC_BUS_TIMEOUT8_BCR		66
+#define	GCC_PCNOC_BUS_TIMEOUT9_BCR		67
+#define	GCC_PCNOC_BUS_TIMEOUT10_BCR		68
+#define	GCC_PCNOC_BUS_TIMEOUT11_BCR		69
+#define	GCC_PRNG_BCR				70
+#define	GCC_Q6SS_DBG_ARES			71
+#define	GCC_Q6_AHB_S_ARES			72
+#define	GCC_Q6_AHB_ARES				73
+#define	GCC_Q6_AXIM2_ARES			74
+#define	GCC_Q6_AXIM_ARES			75
+#define	GCC_Q6_AXIS_ARES			76
+#define	GCC_QDSS_BCR				77
+#define	GCC_QPIC_BCR				78
+#define	GCC_QUSB2_0_PHY_BCR			79
+#define	GCC_SDCC1_BCR				80
+#define	GCC_SEC_CTRL_BCR			81
+#define	GCC_SPDM_BCR				82
+#define	GCC_SYSTEM_NOC_BCR			83
+#define	GCC_TCSR_BCR				84
+#define	GCC_TLMM_BCR				85
+#define	GCC_UBI0_AXI_ARES			86
+#define	GCC_UBI0_AHB_ARES			87
+#define	GCC_UBI0_NC_AXI_ARES			88
+#define	GCC_UBI0_DBG_ARES			89
+#define	GCC_UBI0_UTCM_ARES			90
+#define	GCC_UBI0_CORE_ARES			91
+#define	GCC_UBI32_BCR				92
+#define	GCC_UNIPHY_BCR				93
+#define	GCC_UNIPHY_AHB_ARES			94
+#define	GCC_UNIPHY_SYS_ARES			95
+#define	GCC_UNIPHY_RX_ARES			96
+#define	GCC_UNIPHY_TX_ARES			97
+#define	GCC_USB0_BCR				98
+#define	GCC_USB0_PHY_BCR			99
+#define	GCC_WCSS_BCR				100
+#define	GCC_WCSS_DBG_ARES			101
+#define	GCC_WCSS_ECAHB_ARES			102
+#define	GCC_WCSS_ACMT_ARES			103
+#define	GCC_WCSS_DBG_BDG_ARES			104
+#define	GCC_WCSS_AHB_S_ARES			105
+#define	GCC_WCSS_AXI_M_ARES			106
+#define	GCC_WCSS_AXI_S_ARES			107
+#define	GCC_WCSS_Q6_BCR				108
+#define	GCC_WCSSAON_RESET			109
+#define	GCC_UNIPHY_SOFT_RESET			110
+#define	GCC_GEPHY_MISC_ARES			111
+
+#endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

