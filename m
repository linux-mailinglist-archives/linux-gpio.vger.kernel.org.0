Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784C540A402
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 04:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238260AbhINC7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 22:59:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19887 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238156AbhINC64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 22:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631588260; x=1663124260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=YYFw3BlcWh0C1EZu1ZanhGDL5SHOWe3x6GtNmiTMOVs=;
  b=KyWvvQoq1oDDJLheefa6MNOA1Yh2CoQbGt8dqPEr5bjzTMISv1MDKbvX
   TKMTw+gqciKpQRT+AgqltFonbq1TZ7rKRyfhcPgKoAix9nMZLWIk5m0Wa
   2SdKsekAT8HHjjesaH7wDPrLNuJFy/90pvBYvtgc/C+zR9q5TzM4OI1M5
   Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Sep 2021 19:57:40 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 19:57:39 -0700
Received: from hu-subbaram-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 13 Sep 2021 19:57:38 -0700
From:   Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Subbaraman Narayanamurthy" <quic_subbaram@quicinc.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: add support to enable/disable output
Date:   Mon, 13 Sep 2021 19:57:26 -0700
Message-ID: <1631588246-4811-3-git-send-email-quic_subbaram@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
References: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, if the GPIO is configured as output in the bootloader
and user changes the mode to input in HLOS, it would end up
getting configured as input/output. Functionally, this is fine;
however, there may be some requirements where the output needs
to be disabled so that it can be used only for input.

Add support to enable/disable output mode through "output-enable"
or "output-disable" pinctrl properties.

Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 98bf0e2..39a18aa 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2014, 2021, The Linux Foundation. All rights reserved.
  */
 
 #include <linux/gpio/driver.h>
@@ -424,6 +424,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = 1;
 		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		arg = pad->output_enabled;
+		break;
 	case PIN_CONFIG_OUTPUT:
 		arg = pad->out_value;
 		break;
@@ -503,6 +506,9 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_INPUT_ENABLE:
 			pad->input_enabled = arg ? true : false;
 			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			pad->output_enabled = arg ? true : false;
+			break;
 		case PIN_CONFIG_OUTPUT:
 			pad->output_enabled = true;
 			pad->out_value = arg;
-- 
2.7.4

