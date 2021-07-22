Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B86E3D2EF2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 23:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhGVUfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 16:35:51 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:18053 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231747AbhGVUfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Jul 2021 16:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988585; x=1658524585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6zOtxzK0SvEBwDx41Sq8+UntB+PqRhBZVtb+Sd6CmM=;
  b=elUa8F0HV9gK5iLccOS9GMouO5XcaEUMgkJ1J4ZSs+U2Y+oko6GivR9A
   1qeqATw2gYQD4cc9LmE5sWOLik1YaBQQg5JEbeZCMN6MLEMt5WiMjoF/Y
   ezQe7518+4BQpBTj2oL889e3Hm7j9NR7yf3/JPjI0+6zfJ1byw/kcHNe6
   Q=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jul 2021 14:16:25 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:16:25 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:16:24 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <olof@lixom.net>, <soc@kernel.org>, <linus.walleij@linaro.org>,
        <sboyd@codeaurora.org>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 3/3] ARM: dts: qcom: sdx65: Add pincontrol node
Date:   Thu, 22 Jul 2021 14:16:03 -0700
Message-ID: <728983e44148367ab5d6ba2c66420b1e37df72b7.1626987430.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626987430.git.quic_vamslank@quicinc.com>
References: <cover.1626987430.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

This commit adds pincontrol node to SDX65 dts.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 arch/arm/boot/dts/qcom-sdx65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index fb240213cc35..db269c73c0e9 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -79,6 +79,18 @@ blsp1_uart3: serial@831000 {
 			status = "disabled";
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sdx65-tlmm";
+			reg = <0xf100000 0x300000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <2>;
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx65-pdc", "qcom,pdc";
 			reg = <0xb210000 0x10000>;
-- 
2.32.0

