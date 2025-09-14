Return-Path: <linux-gpio+bounces-26125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A19B56B7F
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 21:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762E5189A6EB
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 19:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871902DCF55;
	Sun, 14 Sep 2025 19:10:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from crab.ash.relay.mailchannels.net (crab.ash.relay.mailchannels.net [23.83.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E32627EC;
	Sun, 14 Sep 2025 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757877053; cv=pass; b=NYg7IJe19XCT0oM/yAKbOCPv0WiB8GrNPRgMCXvqfoM2ypYePteCXEcx1dl2S1ji+CecBq5a98Gyq79xmpFVYv52xAY+zVnWE8sDVSEJh+Xvk1LWfuqXMuh7cTUhfswvCT8JH0M7e3hLOzw0wUhY+9WUPbfMTuu9Nww/HhQh+gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757877053; c=relaxed/simple;
	bh=Mj612sausB489AL9apumdJe4+TfjcJJ3BuI9Qm3CSZw=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=PWDkMXnb1Fvelmdxc9yJ6gBtdBmFLyKR8qtL8GEUeO5mK5aDQh6AW8l5+zC3Ni4sSG6KI5mwTvpOhQAokjtFIHAgL+b2o1KOiYJqFkg1w4+3RvbkDjms1ITaobePdJnWk69v7VYbTE/eHDojfZTOHZhtvo3NqH94h7hNZjbRKoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EF3F472181D;
	Sun, 14 Sep 2025 18:34:59 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (trex-blue-0.trex.outbound.svc.cluster.local [100.107.4.38])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2BF4F7218C0;
	Sun, 14 Sep 2025 18:34:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874899; a=rsa-sha256;
	cv=none;
	b=VYxKBUa2uAzOXQKajRZzx7z8rrYTK9s5o7Qm3LOqtfLEgVXgX9db1goE1Uyg3WbtSPRVBb
	7t7PqHOnlTdx2iwXJ6gbNJsUcYfJWBMfql5ssLwlqqbICFwaKjqIDGEjAHMUWY3MstkLj7
	yHtkRTtPhz9UbUCEBgfYZlkWBZEmlWDaNzo63IWMrhD+/Z+GA+oQZSeyVucmPXJtpd6h+5
	eYqlcUr2T+2su3/X7B8FQiGL04ZVmdRVUHIfqMkfIcLix//4XDnE92L7jw98fxjflXGShQ
	PF/UV3lSKwd6UopXsekmFFEKDv0KLtXPdjrR51wJkX5P8R6cF1kKTAdVZWI/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIpzyA5eZVq179iWmG3EGYnCra7n1F2knIARhfCVGBU=;
	b=cE1D0xIBA8RielIUwdeZ09yBSTVlQHL3SwgSqhj9AIgOx/SzMdtqB6E+uq76yJJwuW3y5r
	YKHJF7MuFz5xBS9FFeS4qq0IoXa0Pye7dZ3IhEnb2SyEaVjvtO6lzIg6GTTnqm19l6KHCr
	7m3zoYZghzLiCWUizg5nioAJpCf47juza5J63lAJ2P2PWwBQZ251xXsfIKeqVcVHdFxVHK
	tIGLLG3Oj84O0xTHclF/BlRcOILQJY8lFx06kjwmgC7xbkOrGlBlR56D0amRSfk0TbBVw+
	Eg7z/IK+bCEzF7cdzcRTHac+zO1Pn7I5Za/dEarUNzLd42JHt2OxCpjgESZkZw==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-gz6f7;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Daffy-Scare: 3ccaec360de2ae5f_1757874899877_3340076219
X-MC-Loop-Signature: 1757874899877:2078259810
X-MC-Ingress-Time: 1757874899877
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.4.38 (trex/7.1.3);
	Sun, 14 Sep 2025 18:34:59 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfM5MlQzFK6mV;
	Sun, 14 Sep 2025 18:34:51 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 3/6] ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and
 gsbi12
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-3-84cadcd7c6e3@smankusors.com>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
In-Reply-To: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
 Shinjo Park <peremen@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=3532;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Mj612sausB489AL9apumdJe4+TfjcJJ3BuI9Qm3CSZw=;
 b=fwu7FNDtg03uwZvyq0rzsRqtkvznmwAS+KZBEYtCKILwIlSL7fgF55apW62OAybiVJT2xzKmF
 4a/eYz/l0BBALnQVQlgUORQG9seTvoydmVt+8XTdLNkeG/MbwRYUtpB
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:51 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70acf a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=bJSLwrWx7bq-Hrda4YgA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfFVrzbW8ErO3H6vdbQvUFTND/BI9tIdOVV0ENUwLlheIxJSmlaftXscFF4uPcmmorGrDkDx04Awtw05hAq/kZxbRFO/da2aH4uT7ooB61abMaO9HdiTr zWSFm1/NPgCFMdGsA2cGD4NuR8jFewsGsGPwmUXSb6CtjEgW48gpgz1d1nD74qlidQFWQ6rmG/JVAfu0oKz5JmGt0tKGZMSKkZ+Dy6CcpxlWb6+NBJ+CWABK ZEKiyoL2ShqdqNgJwr1jOdK5Dda/8kCn9hc2hfU3lAjvODm+e1m7Wpe8As/EIFbX7Jr03wmdabzkS5/WevYdimuS2QHkJkJdN3+9ar3uWyef8Kw424B69isD uC70BsUw+ReqhJD9Abzz/7/Lwc56olgP0oEk8VoqlSM6UMoWcX2uotrk8KEc/W4IR2TmFqMq4c965dCdhfdaTwuVGJOzQkRKEBwE4O5yz++I5XCe0hcW2FwE X26gGMKlb/BkQcyJ6dRM611EuO9OJkvu7pIsbHixVvH7s4OKrrEBjkFh1uAPpmuHV7KLOe05h2s4eDyTeIZebY05XDZh0Id11QMW5tilo42JL4SVEJCVd/UV iqi8eY5WtTU2SWn+Oj55wPmRFpHcuyXJRDrhP5IH3S9pODRVZ9urGyNYqpFyPZAEOUhMXYnCpsdDB43iCGVj2LDpTwGAo2X7ZGFgil7EE5jUhA==
X-AuthUser: linux@smankusors.com

These are present on msm8960 and are required for devices such as the
Sony Xperia SP, which has NFC wired to gsbi10 and various motion
sensors wired to gsbi12.

The nodes are added disabled by default.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 94 ++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 9bdde91375320343c51b8a402087830666abe8b6..69d0bdd327872f3ee35a60bc137ece5aedf2053a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -147,6 +147,42 @@ i2c3-pins {
 				};
 			};
 
+			i2c10_default_state: i2c10-default-state {
+				i2c10-pins {
+					pins = "gpio73", "gpio74";
+					function = "gsbi10";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c10_sleep_state: i2c10-sleep-state {
+				i2c10-pins {
+					pins = "gpio73", "gpio74";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
+			i2c12_default_state: i2c12-default-state {
+				i2c12-pins {
+					pins = "gpio44", "gpio45";
+					function = "gsbi12";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c12_sleep_state: i2c12-sleep-state {
+				i2c12-pins {
+					pins = "gpio44", "gpio45";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			sdcc3_default_state: sdcc3-default-state {
 				clk-pins {
 					pins = "sdc3_clk";
@@ -358,6 +394,35 @@ sdcc1bam: dma-controller@12402000 {
 			qcom,ee = <0>;
 		};
 
+		gsbi12: gsbi@12480000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x12480000 0x100>;
+			ranges;
+			cell-index = <12>;
+			clocks = <&gcc GSBI12_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi12_i2c: i2c@124a0000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x124a0000 0x1000>;
+				pinctrl-0 = <&i2c12_default_state>;
+				pinctrl-1 = <&i2c12_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI12_QUP_CLK>,
+					 <&gcc GSBI12_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		usb1: usb@12500000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0x12500000 0x200>,
@@ -495,6 +560,35 @@ gsbi8_serial: serial@1a040000 {
 			};
 		};
 
+		gsbi10: gsbi@1a200000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x1a200000 0x100>;
+			ranges;
+			cell-index = <10>;
+			clocks = <&gcc GSBI10_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi10_i2c: i2c@1a280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x1a280000 0x1000>;
+				pinctrl-0 = <&i2c10_default_state>;
+				pinctrl-1 = <&i2c10_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI10_QUP_CLK>,
+					 <&gcc GSBI10_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		tcsr: syscon@1a400000 {
 			compatible = "qcom,tcsr-msm8960", "syscon";
 			reg = <0x1a400000 0x100>;

-- 
2.34.1


