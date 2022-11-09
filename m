Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C80A6230A8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 17:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiKIQza (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 11:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKIQzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 11:55:06 -0500
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1532982B;
        Wed,  9 Nov 2022 08:53:59 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A9EDNjR027347;
        Wed, 9 Nov 2022 10:53:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lxCGl1a6zaCL7VKNPPTYmoyWBCI5ub/E2lqYjtmMCeY=;
 b=nPmhvIaX5vb/SXUEP0/QKw1SplUStzlRNznXRR9axJD7/FgN3UXHjOXzmcdbYxxqkdXz
 XR7NNMWiXXmvXQsC21o3WBCWNtZjS6al6yhTbSXfcA+sK/rWcOIwRRFmP+nmTEj+yQqo
 v69WpIfipKrL07h3a+f+8z+iZ/LOIbXJ0S98j2vEiC02KA1ZnThjX6DeIawJjGKUKtdm
 ExTInYMOgSgkWXrCMYNPY+uOHEVnXeRUoO9a+mMDWt5q2l8v6xb/msW7RXY8tMILDKKt
 yYVotSYzum2A9kA1CJa7QPRL0MYy46PHKa+hwFl+6ueTWKBqn50muA60W6RuvlSbZ21p RQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pde7v-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Nov 2022 10:53:35 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:53:33 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via Frontend
 Transport; Wed, 9 Nov 2022 10:53:33 -0600
Received: from debianA11184.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.92])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AA088468;
        Wed,  9 Nov 2022 16:53:32 +0000 (UTC)
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
To:     <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <broonie@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 02/12] mfd: cs48l32: Add register definitions for Cirrus Logic CS48L31/32/33
Date:   Wed, 9 Nov 2022 16:53:21 +0000
Message-ID: <20221109165331.29332-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wLw80btBBqjG-oO8VRAQdprxYLo4Ym5D
X-Proofpoint-GUID: wLw80btBBqjG-oO8VRAQdprxYLo4Ym5D
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the register definitions for the CS48L31/32/33.

The CS48L31/32/33 audio codecs are multi-function devices
containing gpios, irq controller and regulators in addition
to the core audio functionality.

Signed-off-by: Piotr Stankiewicz <piotrs@opensource.cirrus.com>
Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/linux/mfd/cs48l32/registers.h | 509 ++++++++++++++++++++++++++
 1 file changed, 509 insertions(+)
 create mode 100644 include/linux/mfd/cs48l32/registers.h

diff --git a/include/linux/mfd/cs48l32/registers.h b/include/linux/mfd/cs48l32/registers.h
new file mode 100644
index 000000000000..b8125950d74c
--- /dev/null
+++ b/include/linux/mfd/cs48l32/registers.h
@@ -0,0 +1,509 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Register definitions for Cirrus Logic CS48L32
+ *
+ * Copyright (C) 2017-2018, 2020, 2022 Cirrus Logic, Inc. and
+ *               Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef CS48L32_REGISTERS_H
+#define CS48L32_REGISTERS_H
+
+/* Register Addresses. */
+#define CS48L32_DEVID				0x0
+#define CS48L32_REVID				0x4
+#define CS48L32_OTPID				0x10
+#define CS48L32_SFT_RESET			0x20
+#define CS48L32_CTRL_IF_DEBUG3			0xA8
+#define CS48L32_MCU_CTRL1			0x804
+#define CS48L32_GPIO1_CTRL1			0xc08
+#define CS48L32_GPIO16_CTRL1			0xc44
+#define CS48L32_OUTPUT_SYS_CLK			0x1020
+#define CS48L32_AUXPDM_CTRL			0x1044
+#define CS48L32_AUXPDM_CTRL2			0x105c
+#define CS48L32_CLOCK32K			0x1400
+#define CS48L32_SYSTEM_CLOCK1			0x1404
+#define CS48L32_SYSTEM_CLOCK2			0x1408
+#define CS48L32_SAMPLE_RATE1			0x1420
+#define CS48L32_SAMPLE_RATE2			0x1424
+#define CS48L32_SAMPLE_RATE3			0x1428
+#define CS48L32_SAMPLE_RATE4			0x142c
+#define CS48L32_DSP_CLOCK1			0x1510
+#define CS48L32_FLL1_CONTROL1			0x1c00
+#define CS48L32_FLL1_CONTROL5			0x1c10
+#define CS48L32_FLL1_CONTROL6			0x1c14
+#define CS48L32_FLL1_GPIO_CLOCK			0x1ca0
+#define CS48L32_CHARGE_PUMP1			0x2000
+#define CS48L32_LDO2_CTRL1			0x2408
+#define CS48L32_MICBIAS_CTRL1			0x2410
+#define CS48L32_MICBIAS_CTRL5			0x2418
+#define CS48L32_IRQ1_CTRL_AOD			0x2710
+#define CS48L32_AOD_PAD_CTRL			0x2718
+#define CS48L32_INPUT_CONTROL			0x4000
+#define CS48L32_INPUT_STATUS			0x4004
+#define CS48L32_INPUT_RATE_CONTROL		0x4008
+#define CS48L32_INPUT_CONTROL2			0x400c
+#define CS48L32_INPUT_CONTROL3			0x4014
+#define CS48L32_INPUT1_CONTROL1			0x4020
+#define CS48L32_IN1L_CONTROL1			0x4024
+#define CS48L32_IN1L_CONTROL2			0x4028
+#define CS48L32_IN1R_CONTROL1			0x4044
+#define CS48L32_IN1R_CONTROL2			0x4048
+#define CS48L32_INPUT2_CONTROL1			0x4060
+#define CS48L32_IN2L_CONTROL1			0x4064
+#define CS48L32_IN2L_CONTROL2			0x4068
+#define CS48L32_IN2R_CONTROL1			0x4084
+#define CS48L32_IN2R_CONTROL2			0x4088
+#define CS48L32_INPUT_HPF_CONTROL		0x4244
+#define CS48L32_INPUT_VOL_CONTROL		0x4248
+#define CS48L32_AUXPDM_CONTROL1			0x4300
+#define CS48L32_AUXPDM_CONTROL2			0x4304
+#define CS48L32_AUXPDM1_CONTROL1		0x4308
+#define CS48L32_AUXPDM2_CONTROL1		0x4310
+#define CS48L32_ADC1L_ANA_CONTROL1		0x4688
+#define CS48L32_ADC1R_ANA_CONTROL1		0x468c
+#define CS48L32_ASP1_ENABLES1			0x6000
+#define CS48L32_ASP1_DATA_CONTROL5		0x6040
+#define CS48L32_ASP2_ENABLES1			0x6080
+#define CS48L32_ASP2_DATA_CONTROL5		0x60c0
+#define CS48L32_ASP1TX1_INPUT1			0x8200
+#define CS48L32_ASP1TX2_INPUT1			0x8210
+#define CS48L32_ASP1TX3_INPUT1			0x8220
+#define CS48L32_ASP1TX4_INPUT1			0x8230
+#define CS48L32_ASP1TX5_INPUT1			0x8240
+#define CS48L32_ASP1TX6_INPUT1			0x8250
+#define CS48L32_ASP1TX7_INPUT1			0x8260
+#define CS48L32_ASP1TX8_INPUT1			0x8270
+#define CS48L32_ASP1TX8_INPUT4			0x827c
+#define CS48L32_ASP2TX1_INPUT1			0x8300
+#define CS48L32_ASP2TX2_INPUT1			0x8310
+#define CS48L32_ASP2TX3_INPUT1			0x8320
+#define CS48L32_ASP2TX4_INPUT1			0x8330
+#define CS48L32_ASP2TX4_INPUT4			0x833c
+#define CS48L32_ISRC1INT1_INPUT1		0x8980
+#define CS48L32_ISRC1INT2_INPUT1		0x8990
+#define CS48L32_ISRC1INT3_INPUT1		0x89a0
+#define CS48L32_ISRC1INT4_INPUT1		0x89b0
+#define CS48L32_ISRC1DEC1_INPUT1		0x89c0
+#define CS48L32_ISRC1DEC2_INPUT1		0x89d0
+#define CS48L32_ISRC1DEC3_INPUT1		0x89e0
+#define CS48L32_ISRC1DEC4_INPUT1		0x89f0
+#define CS48L32_ISRC2INT1_INPUT1		0x8a00
+#define CS48L32_ISRC2INT2_INPUT1		0x8a10
+#define CS48L32_ISRC2DEC1_INPUT1		0x8a40
+#define CS48L32_ISRC2DEC2_INPUT1		0x8a50
+#define CS48L32_ISRC3INT1_INPUT1		0x8a80
+#define CS48L32_ISRC3INT2_INPUT1		0x8a90
+#define CS48L32_ISRC3DEC1_INPUT1		0x8ac0
+#define CS48L32_ISRC3DEC2_INPUT1		0x8ad0
+#define CS48L32_EQ1_INPUT1			0x8b80
+#define CS48L32_EQ2_INPUT1			0x8b90
+#define CS48L32_EQ3_INPUT1			0x8ba0
+#define CS48L32_EQ4_INPUT1			0x8bb0
+#define CS48L32_EQ4_INPUT4			0x8bbc
+#define CS48L32_DRC1L_INPUT1			0x8c00
+#define CS48L32_DRC1R_INPUT1			0x8c10
+#define CS48L32_DRC1R_INPUT4			0x8c1c
+#define CS48L32_DRC2L_INPUT1			0x8c20
+#define CS48L32_DRC2R_INPUT1			0x8c30
+#define CS48L32_DRC2R_INPUT4			0x8c3c
+#define CS48L32_LHPF1_INPUT1			0x8c80
+#define CS48L32_LHPF1_INPUT4			0x8c8c
+#define CS48L32_LHPF2_INPUT1			0x8c90
+#define CS48L32_LHPF2_INPUT4			0x8c9c
+#define CS48L32_LHPF3_INPUT1			0x8ca0
+#define CS48L32_LHPF3_INPUT4			0x8cac
+#define CS48L32_LHPF4_INPUT1			0x8cb0
+#define CS48L32_LHPF4_INPUT4			0x8cbc
+#define CS48L32_DSP1RX1_INPUT1			0x9000
+#define CS48L32_DSP1RX2_INPUT1			0x9010
+#define CS48L32_DSP1RX3_INPUT1			0x9020
+#define CS48L32_DSP1RX4_INPUT1			0x9030
+#define CS48L32_DSP1RX5_INPUT1			0x9040
+#define CS48L32_DSP1RX6_INPUT1			0x9050
+#define CS48L32_DSP1RX7_INPUT1			0x9060
+#define CS48L32_DSP1RX8_INPUT1			0x9070
+#define CS48L32_DSP1RX8_INPUT4			0x907c
+#define CS48L32_ISRC1_CONTROL1			0xa400
+#define CS48L32_ISRC1_CONTROL2			0xa404
+#define CS48L32_ISRC2_CONTROL1			0xa510
+#define CS48L32_ISRC2_CONTROL2			0xa514
+#define CS48L32_ISRC3_CONTROL1			0xa620
+#define CS48L32_ISRC3_CONTROL2			0xa624
+#define CS48L32_FX_SAMPLE_RATE			0xa800
+#define CS48L32_EQ_CONTROL1			0xa808
+#define CS48L32_EQ_CONTROL2			0xa80c
+#define CS48L32_EQ1_GAIN1			0xa810
+#define CS48L32_EQ1_GAIN2			0xa814
+#define CS48L32_EQ1_BAND1_COEFF1		0xa818
+#define CS48L32_EQ1_BAND1_COEFF2		0xa81c
+#define CS48L32_EQ1_BAND1_PG			0xa820
+#define CS48L32_EQ1_BAND2_COEFF1		0xa824
+#define CS48L32_EQ1_BAND2_COEFF2		0xa828
+#define CS48L32_EQ1_BAND2_PG			0xa82c
+#define CS48L32_EQ1_BAND3_COEFF1		0xa830
+#define CS48L32_EQ1_BAND3_COEFF2		0xa834
+#define CS48L32_EQ1_BAND3_PG			0xa838
+#define CS48L32_EQ1_BAND4_COEFF1		0xa83c
+#define CS48L32_EQ1_BAND4_COEFF2		0xa840
+#define CS48L32_EQ1_BAND4_PG			0xa844
+#define CS48L32_EQ1_BAND5_COEFF1		0xa848
+#define CS48L32_EQ1_BAND5_PG			0xa850
+#define CS48L32_EQ2_GAIN1			0xa854
+#define CS48L32_EQ2_GAIN2			0xa858
+#define CS48L32_EQ2_BAND1_COEFF1		0xa85c
+#define CS48L32_EQ2_BAND1_COEFF2		0xa860
+#define CS48L32_EQ2_BAND1_PG			0xa864
+#define CS48L32_EQ2_BAND2_COEFF1		0xa868
+#define CS48L32_EQ2_BAND2_COEFF2		0xa86c
+#define CS48L32_EQ2_BAND2_PG			0xa870
+#define CS48L32_EQ2_BAND3_COEFF1		0xa874
+#define CS48L32_EQ2_BAND3_COEFF2		0xa878
+#define CS48L32_EQ2_BAND3_PG			0xa87c
+#define CS48L32_EQ2_BAND4_COEFF1		0xa880
+#define CS48L32_EQ2_BAND4_COEFF2		0xa884
+#define CS48L32_EQ2_BAND4_PG			0xa888
+#define CS48L32_EQ2_BAND5_COEFF1		0xa88c
+#define CS48L32_EQ2_BAND5_PG			0xa894
+#define CS48L32_EQ3_GAIN1			0xa898
+#define CS48L32_EQ3_GAIN2			0xa89c
+#define CS48L32_EQ3_BAND1_COEFF1		0xa8a0
+#define CS48L32_EQ3_BAND1_COEFF2		0xa8a4
+#define CS48L32_EQ3_BAND1_PG			0xa8a8
+#define CS48L32_EQ3_BAND2_COEFF1		0xa8ac
+#define CS48L32_EQ3_BAND2_COEFF2		0xa8b0
+#define CS48L32_EQ3_BAND2_PG			0xa8b4
+#define CS48L32_EQ3_BAND3_COEFF1		0xa8b8
+#define CS48L32_EQ3_BAND3_COEFF2		0xa8bc
+#define CS48L32_EQ3_BAND3_PG			0xa8c0
+#define CS48L32_EQ3_BAND4_COEFF1		0xa8c4
+#define CS48L32_EQ3_BAND4_COEFF2		0xa8c8
+#define CS48L32_EQ3_BAND4_PG			0xa8cc
+#define CS48L32_EQ3_BAND5_COEFF1		0xa8d0
+#define CS48L32_EQ3_BAND5_PG			0xa8d8
+#define CS48L32_EQ4_GAIN1			0xa8dc
+#define CS48L32_EQ4_GAIN2			0xa8e0
+#define CS48L32_EQ4_BAND1_COEFF1		0xa8e4
+#define CS48L32_EQ4_BAND1_COEFF2		0xa8e8
+#define CS48L32_EQ4_BAND1_PG			0xa8ec
+#define CS48L32_EQ4_BAND2_COEFF1		0xa8f0
+#define CS48L32_EQ4_BAND2_COEFF2		0xa8f4
+#define CS48L32_EQ4_BAND2_PG			0xa8f8
+#define CS48L32_EQ4_BAND3_COEFF1		0xa8fc
+#define CS48L32_EQ4_BAND3_COEFF2		0xa900
+#define CS48L32_EQ4_BAND3_PG			0xa904
+#define CS48L32_EQ4_BAND4_COEFF1		0xa908
+#define CS48L32_EQ4_BAND4_COEFF2		0xa90c
+#define CS48L32_EQ4_BAND4_PG			0xa910
+#define CS48L32_EQ4_BAND5_COEFF1		0xa914
+#define CS48L32_EQ4_BAND5_PG			0xa91c
+#define CS48L32_LHPF_CONTROL1			0xaa30
+#define CS48L32_LHPF_CONTROL2			0xaa34
+#define CS48L32_LHPF1_COEFF			0xaa38
+#define CS48L32_LHPF2_COEFF			0xaa3c
+#define CS48L32_LHPF3_COEFF			0xaa40
+#define CS48L32_LHPF4_COEFF			0xaa44
+#define CS48L32_DRC1_CONTROL1			0xab00
+#define CS48L32_DRC1_CONTROL4			0xab0c
+#define CS48L32_DRC2_CONTROL1			0xab14
+#define CS48L32_DRC2_CONTROL4			0xab20
+#define CS48L32_TONE_GENERATOR1			0xb000
+#define CS48L32_TONE_GENERATOR2			0xb004
+#define CS48L32_COMFORT_NOISE_GENERATOR		0xb400
+#define CS48L32_US_CONTROL			0xb800
+#define CS48L32_US1_CONTROL			0xb804
+#define CS48L32_US1_DET_CONTROL			0xb808
+#define CS48L32_US2_CONTROL			0xb814
+#define CS48L32_US2_DET_CONTROL			0xb818
+#define CS48L32_DSP1_XM_SRAM_IBUS_SETUP_0	0x1700c
+#define CS48L32_DSP1_XM_SRAM_IBUS_SETUP_1	0x17010
+#define CS48L32_DSP1_XM_SRAM_IBUS_SETUP_24	0x1706c
+#define CS48L32_DSP1_YM_SRAM_IBUS_SETUP_0	0x17070
+#define CS48L32_DSP1_YM_SRAM_IBUS_SETUP_1	0x17074
+#define CS48L32_DSP1_YM_SRAM_IBUS_SETUP_8	0x17090
+#define CS48L32_DSP1_PM_SRAM_IBUS_SETUP_0	0x17094
+#define CS48L32_DSP1_PM_SRAM_IBUS_SETUP_1	0x17098
+#define CS48L32_DSP1_PM_SRAM_IBUS_SETUP_7	0x170b0
+#define CS48L32_IRQ1_STATUS			0x18004
+#define CS48L32_IRQ1_EINT_1			0x18010
+#define CS48L32_IRQ1_EINT_2			0x18014
+#define CS48L32_IRQ1_EINT_5			0x18020
+#define CS48L32_IRQ1_EINT_6			0x18024
+#define CS48L32_IRQ1_EINT_7			0x18028
+#define CS48L32_IRQ1_EINT_9			0x18030
+#define CS48L32_IRQ1_EINT_11			0x18038
+#define CS48L32_IRQ1_STS_1			0x18090
+#define CS48L32_IRQ1_STS_6			0x180a4
+#define CS48L32_IRQ1_STS_11			0x180b8
+#define CS48L32_IRQ1_MASK_1			0x18110
+#define CS48L32_IRQ1_MASK_11			0x18138
+#define CS48L32_DSP1_XMEM_PACKED_0		0x2000000
+#define CS48L32_DSP1_XMEM_PACKED_147455		0x208fffc
+#define CS48L32_DSP1_SYS_INFO_ID		0x25e0000
+#define CS48L32_DSP1_AHBM_WINDOW_DEBUG_1	0x25e2044
+#define CS48L32_DSP1_XMEM_UNPACKED24_0		0x2800000
+#define CS48L32_DSP1_XMEM_UNPACKED24_196607	0x28bfffc
+#define CS48L32_DSP1_CLOCK_FREQ			0x2b80000
+#define CS48L32_DSP1_SAMPLE_RATE_TX8		0x2b802b8
+#define CS48L32_DSP1_SCRATCH1			0x2b805c0
+#define CS48L32_DSP1_SCRATCH4			0x2b805d8
+#define CS48L32_DSP1_CCM_CORE_CONTROL		0x2bc1000
+#define CS48L32_DSP1_STREAM_ARB_RESYNC_MSK1	0x2bc5a00
+#define CS48L32_DSP1_YMEM_PACKED_0		0x2c00000
+#define CS48L32_DSP1_YMEM_PACKED_49151		0x2c2fffc
+#define CS48L32_DSP1_YMEM_UNPACKED24_0		0x3400000
+#define CS48L32_DSP1_YMEM_UNPACKED24_65535	0x343fffc
+#define CS48L32_DSP1_PMEM_0			0x3800000
+#define CS48L32_DSP1_PMEM_71679			0x3845ffc
+
+/* (0x0) DEVID */
+#define CS48L32_DEVID_MASK			0x00ffffff
+#define CS48L32_DEVID_SHIFT				 0
+
+/* (0x4) REVID */
+#define CS48L32_AREVID_MASK			0x000000f0
+#define CS48L32_AREVID_SHIFT				 4
+#define CS48L32_MTLREVID_MASK			0x0000000f
+#define CS48L32_MTLREVID_SHIFT				 0
+
+/* (0x10) OTPID */
+#define CS48L32_OTPID_MASK			0x0000000f
+
+/* (0x0804) MCU_CTRL1 */
+#define CS48L32_MCU_STS_MASK			0x0000ff00
+#define CS48L32_MCU_STS_SHIFT				 8
+
+/* (0x1020) OUTPUT_SYS_CLK */
+#define CS48L32_OPCLK_EN_SHIFT				15
+#define CS48L32_OPCLK_DIV_MASK			0x000000f8
+#define CS48L32_OPCLK_DIV_SHIFT				 3
+#define CS48L32_OPCLK_SEL_MASK			0x00000007
+
+/* (0x105c) AUXPDM_CTRL2 */
+#define CS48L32_AUXPDMDAT2_SRC_SHIFT			 4
+#define CS48L32_AUXPDMDAT1_SRC_SHIFT			 0
+
+/* (0x1400) CLOCK32K */
+#define CS48L32_CLK_32K_EN_MASK			0x00000040
+#define CS48L32_CLK_32K_SRC_MASK		0x00000003
+
+/* (0x1404) SYSTEM_CLOCK1 */
+#define CS48L32_SYSCLK_FRAC_MASK		0x00008000
+#define CS48L32_SYSCLK_FREQ_MASK		0x00000700
+#define CS48L32_SYSCLK_FREQ_SHIFT			 8
+#define CS48L32_SYSCLK_EN_SHIFT				 6
+#define CS48L32_SYSCLK_SRC_MASK			0x0000001f
+#define CS48L32_SYSCLK_SRC_SHIFT			 0
+
+/* (0x1408) SYSTEM_CLOCK2 */
+#define CS48L32_SYSCLK_FREQ_STS_MASK		0x00000700
+#define CS48L32_SYSCLK_FREQ_STS_SHIFT			 8
+
+/* (0x1420) SAMPLE_RATE1 */
+#define CS48L32_SAMPLE_RATE_1_MASK		0x0000001f
+#define CS48L32_SAMPLE_RATE_1_SHIFT			 0
+
+/* (0x1510) DSP_CLOCK1 */
+#define CS48L32_DSP_CLK_FREQ_MASK		0xffff0000
+#define CS48L32_DSP_CLK_FREQ_SHIFT			16
+
+/* (0x1c00) FLL_CONTROL1 */
+#define CS48L32_FLL_CTRL_UPD_MASK		0x00000004
+#define CS48L32_FLL_HOLD_MASK			0x00000002
+#define CS48L32_FLL_EN_MASK			0x00000001
+
+/* (0x1c04) FLL_CONTROL2 */
+#define CS48L32_FLL_LOCKDET_THR_MASK		0xf0000000
+#define CS48L32_FLL_LOCKDET_THR_SHIFT			28
+#define CS48L32_FLL_LOCKDET_MASK		0x08000000
+#define CS48L32_FLL_PHASEDET_MASK		0x00400000
+#define CS48L32_FLL_PHASEDET_SHIFT			22
+#define CS48L32_FLL_REFCLK_DIV_MASK		0x00030000
+#define CS48L32_FLL_REFCLK_DIV_SHIFT			16
+#define CS48L32_FLL_REFCLK_SRC_MASK		0x0000f000
+#define CS48L32_FLL_REFCLK_SRC_SHIFT			12
+#define CS48L32_FLL_N_MASK			0x000003ff
+#define CS48L32_FLL_N_SHIFT				 0
+
+/* (0x1c08) FLL_CONTROL3 */
+#define CS48L32_FLL_LAMBDA_MASK			0xffff0000
+#define CS48L32_FLL_LAMBDA_SHIFT			16
+#define CS48L32_FLL_THETA_MASK			0x0000ffff
+#define CS48L32_FLL_THETA_SHIFT				 0
+
+/* (0x1c0c) FLL_CONTROL4 */
+#define CS48L32_FLL_FD_GAIN_COARSE_SHIFT		16
+#define CS48L32_FLL_HP_MASK			0x00003000
+#define CS48L32_FLL_HP_SHIFT				12
+#define CS48L32_FLL_FB_DIV_MASK			0x000003ff
+#define CS48L32_FLL_FB_DIV_SHIFT			 0
+
+/* (0x1c10) FLL_CONTROL5 */
+#define CS48L32_FLL_FRC_INTEG_UPD_MASK		0x00008000
+
+/* (0x2000) CHARGE_PUMP1 */
+#define CS48L32_CP2_BYPASS_MASK			0x00000002
+#define CS48L32_CP2_EN_MASK			0x00000001
+
+/* (0x2408) LDO2_CTRL1 */
+#define CS48L32_LDO2_VSEL_MASK			0x000007e0
+
+/* (0x2410) MICBIAS_CTRL1 */
+#define CS48L32_MICB1_EN_SHIFT				 0
+
+/* (0x2418) MICBIAS_CTRL5 */
+#define CS48L32_MICB1C_EN_SHIFT				 8
+#define CS48L32_MICB1B_EN_SHIFT				 4
+#define CS48L32_MICB1A_EN_SHIFT				 0
+
+/* (0x2710) IRQ1_CTRL_AOD */
+#define CS48L32_IRQ_POL_MASK			0x00000400
+
+/* (0x4000) INPUT_CONTROL */
+#define CS48L32_IN2L_EN_SHIFT				 3
+#define CS48L32_IN2R_EN_SHIFT				 2
+#define CS48L32_IN1L_EN_SHIFT				 1
+#define CS48L32_IN1R_EN_SHIFT				 0
+
+/* (0x400c) INPUT_CONTROL2 */
+#define CS48L32_PDM_FLLCLK_SRC_MASK		0x0000000f
+#define CS48L32_PDM_FLLCLK_SRC_SHIFT			 0
+
+/* (0x4014) INPUT_CONTROL3 */
+#define CS48L32_IN_VU				0x20000000
+#define CS48L32_IN_VU_MASK			0x20000000
+#define CS48L32_IN_VU_SHIFT				29
+#define CS48L32_IN_VU_WIDTH				 1
+
+/* (0x4020) INPUT1_CONTROL1 */
+#define CS48L32_IN1_OSR_SHIFT				16
+#define CS48L32_IN1_PDM_SUP_MASK		0x00000300
+#define CS48L32_IN1_PDM_SUP_SHIFT			 8
+#define CS48L32_IN1_MODE_SHIFT				 0
+
+/*
+ * (0x4024) IN1L_CONTROL1
+ * (0x4044) IN1R_CONTROL1
+ */
+#define CS48L32_INx_SRC_MASK			0x30000000
+#define CS48L32_INx_SRC_SHIFT				28
+#define CS48L32_INx_RATE_MASK			0x0000f800
+#define CS48L32_INx_RATE_SHIFT				11
+#define CS48L32_INx_HPF_SHIFT				 2
+#define CS48L32_INx_LP_MODE_SHIFT			 0
+
+/*
+ * (0x4028) IN1L_CONTROL2
+ * (0x4048) IN1R_CONTROL2
+ */
+#define CS48L32_INx_MUTE_MASK			0x10000000
+#define CS48L32_INx_VOL_SHIFT				16
+#define CS48L32_INx_PGA_VOL_SHIFT			 1
+
+/* (0x4244) INPUT_HPF_CONTROL */
+#define CS48L32_IN_HPF_CUT_SHIFT			 0
+
+/* (0x4248) INPUT_VOL_CONTROL */
+#define CS48L32_IN_VD_RAMP_SHIFT			 4
+#define CS48L32_IN_VI_RAMP_SHIFT			 0
+
+/* (0x4308) AUXPDM1_CONTROL1 */
+#define CS48L32_AUXPDM1_FREQ_SHIFT			16
+#define CS48L32_AUXPDM1_SRC_MASK		0x00000f00
+#define CS48L32_AUXPDM1_SRC_SHIFT			 8
+
+/* (0x4688) ADC1L_ANA_CONTROL1 */
+/* (0x468c) ADC1R_ANA_CONTROL1 */
+#define CS48L32_ADC1x_INT_ENA_FRC_MASK		0x00000002
+
+/* (0x6004) ASPn_CONTROL1 */
+#define CS48L32_ASP_RATE_MASK			0x00001f00
+#define CS48L32_ASP_RATE_SHIFT				 8
+#define CS48L32_ASP_BCLK_FREQ_MASK		0x0000003f
+
+/* (0x6008) ASPn_CONTROL2 */
+#define CS48L32_ASP_RX_WIDTH_MASK		0xff000000
+#define CS48L32_ASP_RX_WIDTH_SHIFT			24
+#define CS48L32_ASP_TX_WIDTH_MASK		0x00ff0000
+#define CS48L32_ASP_TX_WIDTH_SHIFT			16
+#define CS48L32_ASP_FMT_MASK			0x00000700
+#define CS48L32_ASP_FMT_SHIFT				 8
+#define CS48L32_ASP_BCLK_INV_MASK		0x00000040
+#define CS48L32_ASP_BCLK_MSTR_MASK		0x00000010
+#define CS48L32_ASP_FSYNC_INV_MASK		0x00000004
+#define CS48L32_ASP_FSYNC_MSTR_MASK		0x00000001
+
+/* (0x6030) ASPn_DATA_CONTROL1 */
+#define CS48L32_ASP_TX_WL_MASK			0x0000003f
+
+/* (0x6040) ASPn_DATA_CONTROL5 */
+#define CS48L32_ASP_RX_WL_MASK			0x0000003f
+
+/* (0x82xx - 0x90xx)  *_INPUT[1-4] */
+#define CS48L32_MIXER_VOL_MASK			0x00FE0000
+#define CS48L32_MIXER_VOL_SHIFT				17
+#define CS48L32_MIXER_VOL_WIDTH				 7
+#define CS48L32_MIXER_SRC_MASK			0x000001ff
+#define CS48L32_MIXER_SRC_SHIFT				 0
+#define CS48L32_MIXER_SRC_WIDTH				 9
+
+/* (0xa400) ISRC1_CONTROL1 */
+#define CS48L32_ISRC1_FSL_MASK			0xf8000000
+#define CS48L32_ISRC1_FSL_SHIFT				27
+#define CS48L32_ISRC1_FSH_MASK			0x0000f800
+#define CS48L32_ISRC1_FSH_SHIFT				11
+
+/* (0xa404) ISRC1_CONTROL2 */
+#define CS48L32_ISRC1_INT4_EN_SHIFT			11
+#define CS48L32_ISRC1_INT3_EN_SHIFT			10
+#define CS48L32_ISRC1_INT2_EN_SHIFT			 9
+#define CS48L32_ISRC1_INT1_EN_SHIFT			 8
+#define CS48L32_ISRC1_DEC4_EN_SHIFT			 3
+#define CS48L32_ISRC1_DEC3_EN_SHIFT			 2
+#define CS48L32_ISRC1_DEC2_EN_SHIFT			 1
+#define CS48L32_ISRC1_DEC1_EN_SHIFT			 0
+
+/* (0xa800) FX_SAMPLE_RATE */
+#define CS48L32_FX_RATE_MASK			0x0000f800
+#define CS48L32_FX_RATE_SHIFT				11
+
+/* (0xab00) DRC1_CONTROL1 */
+#define CS48L32_DRC1L_EN_SHIFT				 1
+#define CS48L32_DRC1R_EN_SHIFT				 0
+
+/* (0xb400) Comfort_Noise_Generator */
+#define CS48L32_NOISE_GEN_RATE_MASK		0x0000f800
+#define CS48L32_NOISE_GEN_RATE_SHIFT			11
+#define CS48L32_NOISE_GEN_EN_SHIFT			 5
+#define CS48L32_NOISE_GEN_GAIN_SHIFT			 0
+
+/* (0xb800) US_CONTROL */
+#define CS48L32_US1_DET_EN_SHIFT			 8
+
+/* (0xb804) US1_CONTROL */
+#define CS48L32_US1_RATE_MASK			0xf8000000
+#define CS48L32_US1_RATE_SHIFT				27
+#define CS48L32_US1_GAIN_SHIFT				12
+#define CS48L32_US1_SRC_MASK			0x00000f00
+#define CS48L32_US1_SRC_SHIFT				 8
+#define CS48L32_US1_FREQ_MASK			0x00000070
+#define CS48L32_US1_FREQ_SHIFT				 4
+
+/* (0xb808) US1_DET_CONTROL */
+#define CS48L32_US1_DET_DCY_SHIFT			28
+#define CS48L32_US1_DET_HOLD_SHIFT			24
+#define CS48L32_US1_DET_NUM_SHIFT			20
+#define CS48L32_US1_DET_THR_SHIFT			16
+#define CS48L32_US1_DET_LPF_CUT_SHIFT			 5
+#define CS48L32_US1_DET_LPF_SHIFT			 4
+
+/* (0x18004) IRQ1_STATUS */
+#define CS48L32_IRQ1_STS_MASK			0x00000001
+
+/* (0x18014) IRQ1_EINT_2 */
+#define CS48L32_BOOT_DONE_EINT1_MASK		0x00000008
+
+/* (0x180a4) IRQ1_STS_6 */
+#define CS48L32_FLL1_LOCK_STS1_MASK		0x00000001
+
+#endif
-- 
2.30.2

