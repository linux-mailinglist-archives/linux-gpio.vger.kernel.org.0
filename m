Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FE811A3C2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 06:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfLKFYZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 00:24:25 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:38908
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbfLKFYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 00:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576041864;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=veLU7/lZerJDCVvtWTaA7PrEH1gc5h2qtJvMQiuxVLk=;
        b=B4wXYxLsLD3CJDYWlrQWGkDppDo1YePkz6f9ZJItnBpaQiAiYo6DxWlFQUtpJp1Z
        kD2TD+zwSRzoARJiWJ8bFGkWACc6Cq7h6ZPKDjUmjLQTI8KLx7LJ1ZHk24rOImQ0tCt
        6gtDdUL+JimWKtGshT72rUnmwQS2Xu1DXezFY15A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576041864;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=veLU7/lZerJDCVvtWTaA7PrEH1gc5h2qtJvMQiuxVLk=;
        b=JfD6t9/H+zU5EFzOcLzkag+YkU9os6D6Bxl+Co1ReGRh1hL+Tkbf94vu0e+ZzpXu
        +c+LVcCVYust+5YGDrOQ52eGEvdeVINhJo2KCxuxT7xZ6q5QrQkkG5+hjIIgW+P7ceH
        jEqSSQUi+dV4Ybd0C0oieTtfCRsK8vfdoxuvaeME=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2DDCFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions for sc7180
Date:   Wed, 11 Dec 2019 05:24:24 +0000
Message-ID: <0101016ef36a5d13-457e6678-2e83-494e-8494-1b0776d5b7e4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.11-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add new qup functions for qup02/04/11 and qup13 wherein multiple
functions (for i2c and uart) share the same pin. This allows users
to identify which specific qup function for the instance one needs
to use for the pin.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
index b5767ee..6ffeac9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
@@ -125,8 +125,9 @@ to specify in a pin configuration subnode:
 		    mi2s_1, mi2s_2, mss_lte, m_voc, pa_indicator, phase_flag,
 		    PLL_BIST, pll_bypassnl, pll_reset, prng_rosc, qdss,
 		    qdss_cti, qlink_enable, qlink_request, qspi_clk, qspi_cs,
-		    qspi_data, qup00, qup01, qup02, qup03, qup04, qup05,
-		    qup10, qup11, qup12, qup13, qup14, qup15, sdc1_tb,
+		    qspi_data, qup00, qup01, qup02_i2c, qup02_uart, qup03,
+		    qup04_i2c, qup04_uart, qup05, qup10, qup11_i2c, qup11_uart,
+		    qup12, qup13_i2c, qup13_uart, qup14, qup15, sdc1_tb,
 		    sdc2_tb, sd_write, sp_cmu, tgu_ch0, tgu_ch1, tgu_ch2,
 		    tgu_ch3, tsense_pwm1, tsense_pwm2, uim1, uim2, uim_batt,
 		    usb_phy, vfr_1, _V_GPIO, _V_PPS_IN, _V_PPS_OUT,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

