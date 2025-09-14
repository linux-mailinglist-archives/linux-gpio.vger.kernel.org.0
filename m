Return-Path: <linux-gpio+bounces-26122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA2EB56B4E
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC2016CCB3
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF062DFA26;
	Sun, 14 Sep 2025 18:35:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from coral.ash.relay.mailchannels.net (coral.ash.relay.mailchannels.net [23.83.222.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA912DF6E6;
	Sun, 14 Sep 2025 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757874915; cv=pass; b=BAwx8m7EFxQECesTnZy0GA2+BnCmQIUfKYqGJS13jr3e/aLQwb6G3hVazL54sv6CyLScqG3ZSvCkFF89zuJtW0FelqBBYoSmWf08Wjvl2nQ51G/REF8oj9nLk9znrjcrOLgfVKPAiibfE9c5NOQzI2MRZwxgh3UXezBxsqviccE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757874915; c=relaxed/simple;
	bh=LuyxDIeG18uZTnWSAmcaXg4Q2qo3EN2gIoK5D6h0jnM=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=MlhZYW1Vgvvs+xkd68ssbzggtC+74lD2TKEQ5XmKEzy0+j43VHEnfwI8hbDY1lOcPvrKMydp7kYkCb6MDC5z01rmNycE+48QcavuQFFTs3T+0HnCPi4yc7/iEtYEnnHu2F/MuuxrsdpCD1voHvWrm881ME4cIeLUEAUQTd6ruEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.222.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2C537941799;
	Sun, 14 Sep 2025 18:35:06 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-6-72.trex-nlb.outbound.svc.cluster.local [100.107.6.72])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 25FC69416F6;
	Sun, 14 Sep 2025 18:35:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874903; a=rsa-sha256;
	cv=none;
	b=0cKno/6IHXp3TePqYXmc881Td9xekIOmhklf+fDSF/UP7qflHs/8EUn0ZGi1UwoAQx4oY7
	xk+WlFOKOl1a0lzD+LAW7Y5sz2yRJkvxsE3fyUbFd18/TGGHKZdT7TXOvEKLIignTcj3Ef
	8kJzqUUUZ1m2x/9EvetpRhaijcI8qfRZ30EO3kz8f+lxzssKQFssqexjEYmE5xIpgIOueh
	HycHIW3KO+EKCC9jRFGEIhGEZoVwQYNiaIcy9mkbfHY9q+vRCDyzW3fgvLsd8LM1Ng5WBx
	LGmDSgxfvTV43aOtSQXY9nXLl0OZG0YHx9FnZFZ7QtDiRfTe6QqAqo9iNqV07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBucP5N1nj1+PWcUR1bm/pXvbeX2s9H66VZyFHoSBPg=;
	b=qsr4KS6zFGvwA7AcTCNSoFoZL0QfCFrzXhYmOST2sq3B3oGEDCHrOxu0KEdSvqT4nmkPl6
	ltTgCwJ9y2GKoGyG3hVgJqW91yPxUjeFEaiNLGz5INuhbbPWT5rOtFUkpeDnUBRRTji8wm
	onJZffih7mnsVoZI1wG0CgDSOpb+jnLSRWMmiYRmT48eDPGHqANgpbLo28/D+jUpO2kMI5
	zhnafpeGMTX9DDWAW1Elv7m6Kl5zHYQAN1utT9Q5UsDq0Y+Aeuj58k6F/dQUn2XOnsoA4F
	NzdpDxn8m4D4dE3mW3rl0qPlrvi/ibWHI47cjunJFGl6dpL2EcqCIg2aqONukQ==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-gz6f7;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Daffy-Left: 6e949b7752e36fb5_1757874906081_68458517
X-MC-Loop-Signature: 1757874906081:3531675214
X-MC-Ingress-Time: 1757874906081
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.6.72 (trex/7.1.3);
	Sun, 14 Sep 2025 18:35:06 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfR5qVhzFK6md;
	Sun, 14 Sep 2025 18:34:55 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 4/6] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and
 gsbi8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-4-84cadcd7c6e3@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=3187;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=LuyxDIeG18uZTnWSAmcaXg4Q2qo3EN2gIoK5D6h0jnM=;
 b=EF7/76CVfdnZWVej8VTevGWWNwP6UMW0MNTZCF9sX5bEjtvi4j0G9BJURAja8DUme6wO0eAil
 0Qwym2bE1rNAEy6mY73z/JTWTtYJ1Rw5do6xPax5hXLPFGrkPUdjyOd
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:55 +0000 (UTC)
X-CM-Envelope: MS4xfPyOnO2U+kGLunbVyjBowbn0OQgH7VH3pUn0dIuMknBQuDDjb1yRm8eDDN6vrqh+azVli0wupn+ga1ig/lxsZrSzmP4uknf7mEgVFQxbNF08GkjltvzL AXjr4hR9b4JZOispZqjzXG4J1+23RsjViqRVBDRlCcPJKH4MoslN4nHsWu9dkYSJEo6XNMpOVGoXiw7dQMPuOOCCLK//Y0pQioqU7Clcuyh/Ua2zgQRUkz2X iuTWCXFjFo6SNecR/n+MhAahsh25NuLQQ+8V1xoM7PcyC0JZI5YT2AlKMOuiMeyWlLPnZaeH6UZo4K+pvBgL4Q6vuJSK0TbcV7sY+SHFCfnrfCjtBWVPYeke OLessb7VO4gNszKyntkzTNGe75/7mPI2oBqQ3tZOXNnQFrjnJ17inQOQ2A50Lr3Ta3zXA6FFR76KlAZEwxipTUFZ1+k/Op7aqtv4V1xKhbiGixkR/OFE7vSk IBtYJfYzMP4h7+H855jJKvq6IP0uEPIBJbGfcqST4ics4srY9soAoGtHARTqkWRPe8Su6nKCYRMTIyI8onyQbUQXLQdMqJ2ha2F9UYrb+oMlK3tYEQotjz6a Edmx4iQTxYNX2gcscdebuTnvZtFN97hYzaq+sHuqtpMFCDvSqHpZf7vEWQIVa1X4yLuK+yeWRSFeCwFSLQE3KS9dFnBdsSwSXbFVNbhuS7BJgA==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70ad3 a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=wE2L2MWpTHJKsHsClTMA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

These are present on msm8960 and are required for devices such as the
Casio G'zOne, which has NFC wired to gsbi1 and audio amplifier wired to
gsbi8.

The nodes are added disabled by default.

Co-developed-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 69d0bdd327872f3ee35a60bc137ece5aedf2053a..7206a4eaabe36deabaf1ca946c837ff3bd330fdd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -129,6 +129,24 @@ msmgpio: pinctrl@800000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			i2c1_default_state: i2c1-default-state {
+				i2c1-pins {
+					pins = "gpio8", "gpio9";
+					function = "gsbi1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c1_sleep_state: i2c1-sleep-state {
+				i2c1-pins {
+					pins = "gpio8", "gpio9";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c3_default_state: i2c3-default-state {
 				i2c3-pins {
 					pins = "gpio16", "gpio17";
@@ -147,6 +165,24 @@ i2c3-pins {
 				};
 			};
 
+			i2c8_default_state: i2c8-default-state {
+				i2c8-pins {
+					pins = "gpio36", "gpio37";
+					function = "gsbi8";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c8_sleep_state: i2c8-sleep-state {
+				i2c8-pins {
+					pins = "gpio36", "gpio37";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
 			i2c10_default_state: i2c10-default-state {
 				i2c10-pins {
 					pins = "gpio73", "gpio74";
@@ -467,6 +503,22 @@ gsbi1: gsbi@16000000 {
 
 			status = "disabled";
 
+			gsbi1_i2c: i2c@16080000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				pinctrl-0 = <&i2c1_default_state>;
+				pinctrl-1 = <&i2c1_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI1_QUP_CLK>,
+					 <&gcc GSBI1_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
+
 			gsbi1_spi: spi@16080000 {
 				compatible = "qcom,spi-qup-v1.1.1";
 				reg = <0x16080000 0x1000>;
@@ -558,6 +610,22 @@ gsbi8_serial: serial@1a040000 {
 
 				status = "disabled";
 			};
+
+			gsbi8_i2c: i2c@1a080000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x1a080000 0x1000>;
+				pinctrl-0 = <&i2c8_default_state>;
+				pinctrl-1 = <&i2c8_sleep_state>;
+				pinctrl-names = "default", "sleep";
+				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_QUP_CLK>,
+					 <&gcc GSBI8_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		gsbi10: gsbi@1a200000 {

-- 
2.34.1


