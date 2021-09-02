Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1460D3FEB0A
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Sep 2021 11:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245096AbhIBJQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Sep 2021 05:16:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52448 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245013AbhIBJQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Sep 2021 05:16:29 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 02:15:30 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Sep 2021 02:15:29 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Sep 2021 14:45:09 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id A8B684FD2; Thu,  2 Sep 2021 14:45:08 +0530 (IST)
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
Subject: [PATCH V2 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
Date:   Thu,  2 Sep 2021 14:45:06 +0530
Message-Id: <1630574106-3394-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630574106-3394-1-git-send-email-skakit@codeaurora.org>
References: <1630574106-3394-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pm7325 PMIC gpio support for vol+ on sc7280-idp.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - No changes.

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 371a2a9..52bcbbc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -199,6 +199,37 @@
 	modem-init;
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
 &pmk8350_vadc {
 	pmk8350_die_temp {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

