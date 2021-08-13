Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5851A3EAF73
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 06:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhHME4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 00:56:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47348 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbhHME4k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 00:56:40 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 21:56:14 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 21:56:12 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Aug 2021 10:25:48 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 3E9B753FF; Fri, 13 Aug 2021 10:25:47 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
Date:   Fri, 13 Aug 2021 10:25:31 +0530
Message-Id: <1628830531-14648-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pm7325 PMIC gpio support for vol+ on sc7280-idp.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
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

