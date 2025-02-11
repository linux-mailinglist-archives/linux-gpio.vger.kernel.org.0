Return-Path: <linux-gpio+bounces-15772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF203A318B7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E223188A4C4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2265A26A081;
	Tue, 11 Feb 2025 22:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RV66N7hf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB024E4B0;
	Tue, 11 Feb 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313496; cv=none; b=Ttch2JxDFRNfWMu3N1Jm6KLD+bNZouXrrdQ6MmbdBqhKTGCJ28QI7ewGrVELhaWNbpy7uH2DeFlmp1apuyhADUmnkrAMH8KUzG6Q8SYEvT74EE2Jgu3PstoUgNHVFEgU7mB78su8z98pS+cBiICv6z+Oo/f/poAvpzM9Vq3812A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313496; c=relaxed/simple;
	bh=7WIpvq4/O65XfG23yjkfFRHrpE2QsTdNr67aJS/kJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obsNd+NpPrkA2Fqkme7tGqznI5QMVu0kLUl0vcEoDYUCqWgM8+udWHwtvbn00F/zG2XjN4bgU8zAnxTIgWyC5G0NI5mhkGgFRD/HR79sPpBPt7s5l6XdzUFDKYFtGJNJjDgpe3NpyD+5ehO+TiRjbNEOtgp0yBTy1oxgeaFzLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RV66N7hf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id AC609E453D;
	Tue, 11 Feb 2025 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAV0Qe0+FmS/ZCfAzMOGXS1xl5PRcB7p0GeHYLx+/po=;
	b=RV66N7hfkvH6zCsuwfzhvneBQwMTbrxHhAxzMPMawa4/cS3vZpI6TW/0GsHNzRGaZxIsHO
	Lad+YfMh6dLSXe8b0Vg9W2m1g8SuNzx3WXSImJFFnwmAOQBacDM6bDyDt4mAHSKj/Sbdxf
	0ZtuDWEpqImschE1lKsGikHl50XOz4qBlTVQWnYWyRusb5641D2KaBT+IQGZQ0LI8SYIfs
	RYAtCcCq9loisKrcte1fMezhj4yriIgXD/ueDoIAzS3g4aLc8ZsAVBmjfVuOGM14jcDbq6
	q1qjeRDEZJxL4ZgUMcylgRWhBD+WAKhkgu1flEq7wvfT/dXmTc6ft9KpMuoByw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:48 +0100
Subject: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Dang Huynh <danct12@riseup.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=2411;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ATKVPnPAnxLDqZY8gYpdG3Mfkq8Qieu8l9ptvDkctEI=;
 b=VYmy8NWOjhU4F35G/zQ5lbhNQ4T40R/uiaVRQnb8Cw4MaXrXA/jA1mhtKjV8TCIpaz6jQnnI/
 R6t2eenWVF9DbSj1LK1Sj41dow8VF4ks5hkTcliORMQY4AAekWJUfYo
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Dang Huynh <danct12@riseup.net>

It looks like both 8917 and 8937 are the same except for one pin
"wsa_reset".

Signed-off-by: Dang Huynh <danct12@riseup.net>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/pinctrl/qcom/Kconfig.msm       | 4 ++--
 drivers/pinctrl/qcom/pinctrl-msm8917.c | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 35f47660a56b1a730d7724fd5a4fb490da9c7880..a0d63a6725393496e034ca26d218265b7ba4b53f 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -138,10 +138,10 @@ config PINCTRL_MSM8916
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
 
 config PINCTRL_MSM8917
-	tristate "Qualcomm 8917 pin controller driver"
+	tristate "Qualcomm 8917/8937 pin controller driver"
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
-	  Qualcomm TLMM block found on the Qualcomm MSM8917 platform.
+	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
 
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8917.c b/drivers/pinctrl/qcom/pinctrl-msm8917.c
index cff137bb3b23fbbe2b2630a7cbbf9f46e39981e7..350636807b07d9ab0e207368de63837bc5fa5502 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8917.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8917.c
@@ -539,6 +539,7 @@ enum msm8917_functions {
 	msm_mux_webcam_standby,
 	msm_mux_wsa_io,
 	msm_mux_wsa_irq,
+	msm_mux_wsa_reset,
 	msm_mux__,
 };
 
@@ -1123,6 +1124,10 @@ static const char * const wsa_io_groups[] = {
 	"gpio94", "gpio95",
 };
 
+static const char * const wsa_reset_groups[] = {
+	"gpio96",
+};
+
 static const char * const blsp_spi8_groups[] = {
 	"gpio96", "gpio97", "gpio98", "gpio99",
 };
@@ -1378,6 +1383,7 @@ static const struct pinfunction msm8917_functions[] = {
 	MSM_PIN_FUNCTION(webcam_standby),
 	MSM_PIN_FUNCTION(wsa_io),
 	MSM_PIN_FUNCTION(wsa_irq),
+	MSM_PIN_FUNCTION(wsa_reset),
 };
 
 static const struct msm_pingroup msm8917_groups[] = {
@@ -1616,5 +1622,5 @@ static void __exit msm8917_pinctrl_exit(void)
 }
 module_exit(msm8917_pinctrl_exit);
 
-MODULE_DESCRIPTION("Qualcomm msm8917 pinctrl driver");
+MODULE_DESCRIPTION("Qualcomm msm8917/msm8937 pinctrl driver");
 MODULE_LICENSE("GPL");

-- 
2.48.1


