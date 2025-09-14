Return-Path: <linux-gpio+bounces-26120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91105B56B46
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 20:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68449189C0E4
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 18:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68C22DF12F;
	Sun, 14 Sep 2025 18:35:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937381C5486;
	Sun, 14 Sep 2025 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757874906; cv=pass; b=fpTb6LtDO0BvR06hA3RQ0oGpjivdd7S4MC8QrQQe/yclC+MPP7jum19gpJQ+xmhfx//wxyuTcnfBsGI4bIxF6ZZz3lgDnxna4hDfuBI6OUZqf7bLrYsnX6nKbR8LBgUYfP3zi9/g2wGfIlridsiM8OriY1r9gDXXEHKfN5fii6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757874906; c=relaxed/simple;
	bh=r9EW8lsk7L1ZKaVLDs7YGy4q1WneZFW+VHsShdtd59Q=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=Y9a7bDyy2dw4VU+Z18/Fw3CcEMZDTpsR8n63uI8bNpEvwm0E3Xkgtd96yroGlSkOgRKKppgd+wstQNMlMzfiZ3jnjfiThTLEk4OhWb+4DrscBAWtOhc2uEOHt4JUzwa41C6VY1foGwDkvp5RvjnLrlkTe4Yql54Yo6zSglpDKbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0C74E900F81;
	Sun, 14 Sep 2025 18:34:58 +0000 (UTC)
Received: from uk-fast-smtpout10.hostinger.io (100-107-6-72.trex-nlb.outbound.svc.cluster.local [100.107.6.72])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 05767900FA8;
	Sun, 14 Sep 2025 18:34:52 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1757874895; a=rsa-sha256;
	cv=none;
	b=GRuWUgfS07T+QayZBsIWb1roVaGZCUZaNOAsw9dtvyKR9eN1hE1GdVqBfcMDfd9+BKC4i6
	HYPJsdEtVtE/o+f8uJFrX+fIQ9XV0nWS/1Z3Fgxn8ghzv4w5VJ0epYzDKrNzOdrY0B0Vce
	5qwQG44aXu3nvdHIbEe8C8scq6tVmaMpQpkMenpzgsP9YyQRMjibG8EUTcB3Q6o+u5hm3o
	9qxol6ow/QgAaEayN7dXoCiVxaV53+N/5CyPCkkihqAcnYW/XTmv/wqm5pBpEVmmsOqaXy
	Im8ce14grcTIHvywNhZZKuFF8udWXXKAeXOk7CcIETu7LFcZDeh5aA9zeU/NRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1757874895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YX2udSABX2OKTQjxQlMx6xUpyjumB9hyJa1HkptWZQ=;
	b=czXSoUMZkcKplYrzYhobuqS2uX+cqJcpLziNw6fnQTUenp9KIED4PcQaD0uS0MqHCKnM+1
	Zpv1eF4bRNPG4kbUHpDqdPcd1hemKnWUX69DDzTax2g/SEfrb09+jsCZjSaIPd5zcw9iIb
	IYV3Pl7Q6gjrvFtwxQMweWu1y6933gUTF6S5NPXGtd3K4FUCX6/17Ueu7OLkLSQfkL3fPc
	zUOBmB7g8IYNMKTuh81Wc/25COj02qHn7eq43dsuuDxpUC99oyZlfA/m39vUhVXyXAirm3
	2UjHI+zJbXS/QhUaP6E7GvDKbTooDo13ZC1W1pNr/MYP2ibASs9CdjeW1lU9og==
ARC-Authentication-Results: i=1;
	rspamd-54bcd779b6-gz6f7;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Troubled-Abiding: 7364522300eaa2ba_1757874897944_755572181
X-MC-Loop-Signature: 1757874897943:4142536531
X-MC-Ingress-Time: 1757874897943
Received: from uk-fast-smtpout10.hostinger.io (uk-fast-smtpout10.hostinger.io
 [145.14.155.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.6.72 (trex/7.1.3);
	Sun, 14 Sep 2025 18:34:57 +0000
Received: from [172.17.0.2] (unknown [110.138.220.153])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cPxfH4dYZzFK5MY;
	Sun, 14 Sep 2025 18:34:47 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 2/6] ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8960-reorder-v1-2-84cadcd7c6e3@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757874878; l=3742;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=r9EW8lsk7L1ZKaVLDs7YGy4q1WneZFW+VHsShdtd59Q=;
 b=+r511htSNB6QPsPCyYFWWkW1SuqUApXe6lqQcnTm3ciOkV5P4a78kpBxXdfihuE3W/Aw8UqlE
 Jku2Bid3uPZCF9hl65mGfaAzN47VURBAO3V4HyUlM1RLanA1zgshrIt
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 14 Sep 2025 18:34:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68c70acb a=3tJJDl7MZm1GcYeSp/W8Jw==:117 a=3tJJDl7MZm1GcYeSp/W8Jw==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=CxMuIbg76hbZoAQaLtoA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfJUN8rKxGAVxzeGLtQxP7+h1aJoyUDgrcHMRJkfyNmDmKrO1oYbnUi7kgj0cNQLXG86LRmPJntTSfyUUOL9/8mMSUKrsW0QstvuaH3OFu73CfdBI4Bmy a+9t7sxLDQTY3/RIz/GN9lBUmPTENRAzF4edY9vLNQnAxj0NtgZ5MA5D2KxUH2H3pECgiftzZRzlHcq/HKZaXAKcNDcaKo2EV84X8sBYZhZPbvx5lDWFxudc vwaCyxZdeFq3kgp9CpWXWGbhgAGU9M8XPdPVbxvde+E80Xk2FkNOuXTP6eeixhkZqmbfQrUB8Nq8phO2WNFKDDvMOVO3TJOVJe352uSOga2p/6Y+ZeqvG84F 6KUhGa+7RjC0G/fxHWXgXe3Kf9kaEgMEEOGfWXD2Xvd83gb/DJ1gMdCs0U0qubDgadrbppP3ZtrohRY4SvvmNZH/OVmUuEBn6DjBS/ue2Zn1cGfVf42XkP9s CSoRMY7N0QwfVq4c0aBKt2QAMwgKlDH9ulURWVl+egrotLEjbd7lUmRGwOpnLcu8nUzMu7Yu2sQfkWPrsVHBDfP0fi1eNTrc4l4aeZqd3E72PPH5txWL62G+ h5sWGbjJouw2euuaSCS+w8aq3aUzuI6p6pnPEjCYwa0606fTsesp3PS+2aKtZAfejvdx9+02FasXd893lPBprkzWUuyv592w/ti+YIyILhuc9Q==
X-AuthUser: linux@smankusors.com

Inline qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
SoCs embed their TLMM definitions directly, with only msm8960 and
apq8064 using a separate pins file. After this change, only apq8064
remains split.

This is a cosmetic change only, with no functional impact.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Tested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi | 59 ---------------------------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 57 +++++++++++++++++++++++++-
 2 files changed, 56 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
deleted file mode 100644
index 77fe5be24b36fbda83ba73034939db10db6ef4c8..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-&msmgpio {
-	i2c3_default_state: i2c3-default-state {
-		i2c3-pins {
-			pins = "gpio16", "gpio17";
-			function = "gsbi3";
-			drive-strength = <8>;
-			bias-disable;
-		};
-	};
-
-	i2c3_sleep_state: i2c3-sleep-state {
-		i2c3-pins {
-			pins = "gpio16", "gpio17";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-bus-hold;
-		};
-	};
-
-	sdcc3_default_state: sdcc3-default-state {
-		clk-pins {
-			pins = "sdc3_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "sdc3_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "sdc3_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	sdcc3_sleep_state: sdcc3-sleep-state {
-		clk-pins {
-			pins = "sdc3_clk";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "sdc3_cmd";
-			drive-strength = <2>;
-		};
-
-		data-pins {
-			pins = "sdc3_data";
-			drive-strength = <2>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 9a0c87fd6d4752f7ef3d91f480c48efc55a08e74..9bdde91375320343c51b8a402087830666abe8b6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -128,6 +128,62 @@ msmgpio: pinctrl@800000 {
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			i2c3_default_state: i2c3-default-state {
+				i2c3-pins {
+					pins = "gpio16", "gpio17";
+					function = "gsbi3";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			i2c3_sleep_state: i2c3-sleep-state {
+				i2c3-pins {
+					pins = "gpio16", "gpio17";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
+
+			sdcc3_default_state: sdcc3-default-state {
+				clk-pins {
+					pins = "sdc3_clk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc3_cmd";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc3_data";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			sdcc3_sleep_state: sdcc3-sleep-state {
+				clk-pins {
+					pins = "sdc3_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc3_cmd";
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc3_data";
+					drive-strength = <2>;
+				};
+			};
 		};
 
 		gcc: clock-controller@900000 {
@@ -526,4 +582,3 @@ vsdcc_fixed: vsdcc-regulator {
 		regulator-always-on;
 	};
 };
-#include "qcom-msm8960-pins.dtsi"

-- 
2.34.1


