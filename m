Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184AD404549
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Sep 2021 08:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350953AbhIIGDM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Sep 2021 02:03:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42881 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350876AbhIIGDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Sep 2021 02:03:12 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 08 Sep 2021 23:02:03 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Sep 2021 23:02:01 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 09 Sep 2021 11:31:44 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 397935460; Thu,  9 Sep 2021 11:31:43 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
Date:   Thu,  9 Sep 2021 11:31:28 +0530
Message-Id: <1631167288-27627-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631167288-27627-1-git-send-email-skakit@codeaurora.org>
References: <1631167288-27627-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pm7325 PMIC gpio support for vol+ on sc7280-idp.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - No changes.

Changes in V3:
 - Sorted the nodes alphabetically.

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 371a2a9..434c1c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -239,6 +239,26 @@
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&soc {
+	gpio_keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_vol_up_default>;
+
+		vol_up {
+			label = "volume_up";
+			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			gpio-key,wakeup;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
@@ -284,6 +304,17 @@
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
+&pm7325_gpios {
+	key_vol_up_default: key_vol_up_default {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+		qcom,drive-strength = <3>;
+	};
+};
+
 &qup_uart5_default {
 	tx {
 		pins = "gpio46";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

