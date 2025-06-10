Return-Path: <linux-gpio+bounces-21253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C1AD3D67
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB87A3AC5FC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D830243969;
	Tue, 10 Jun 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="yxXbp0Mw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804AF230BF5;
	Tue, 10 Jun 2025 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569096; cv=none; b=XfQ4VYeL5MeKUPOtoPSpWWQ3ZXRVoY1+NixSU2B302SNJKm0i2w4brI3sx39thyAWfjEymDoJfIOZA7VViGQYV69CuGBXY5L+K4lQSkeHHfjaToIqukNqIHsBwnFCVrRgvLLapPSYGf6LeixNog7YaXlGkhhES8gyhBGVh7VwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569096; c=relaxed/simple;
	bh=djeR04w/75lWxkApA8z7LUOUKkq030Zmb0bpaqVQ+Yc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLeRVP9i4H4NAtddH/1kcOXQphFlsR3rLXIJnMxs0S1iKPYiUfm+FSKFVN8B8sFlOsWkg+nuvOlUuvAmxa+rK7cFj2+dC7N5LjW6X6UH6D/n7+X7r07KeOlQihYbaJN/VCi53MWT9eCtpuG4+ybYcVRAp9arZnpVMMrsS1GiM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=yxXbp0Mw; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLF7D010719;
	Tue, 10 Jun 2025 17:24:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PV6mynfuvv42D/ePAoYQa09aeqeL9wkOTzavUKrfpmo=; b=yxXbp0MwRqkezWKJ
	ghM1nwfNNx/HR2jk1frQY0dGqtCYxDMUHc9yWPAVyTnMIZYEcjLEyPIO0JSkvslw
	aX1bFJLXMisqBYo59e3qAhC8Uvbo3XvBGGLp7iuanIOprPfdf9MrnS5tGtllLm1t
	+Zzvq5SKzdRn92qVaBLqx5PStMIipZ/iW3sAh4yuTlz/weKLo8uQiK13jsN5RUx1
	SbHSWHFrcuPq9DA4pcccp2z8UvVP5h712Oy/T9JxtFP3MYslpUzycwhIOyBBWaCE
	f+b+9RzUhe5hcO4yx4e90g7KAKiX4vzh9SpWRC5W/Eh0iwkQcW3SdHK1dhIPN+xd
	nGFexQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y053dsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D6634004B;
	Tue, 10 Jun 2025 17:23:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF1CFB79BAE;
	Tue, 10 Jun 2025 17:23:13 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:13 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v2 2/5] dt-bindings: pinctrl: stm32: Add RSVD mux function
Date: Tue, 10 Jun 2025 17:23:06 +0200
Message-ID: <20250610152309.299438-3-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

Document the RSVD (Reserved) mux function, used to reserve pins
for a coprocessor not running Linux.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
 include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index a28d77748095a..5d17d6487ae9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -160,9 +160,13 @@ patternProperties:
               * ...
               * 16 : Alternate Function 15
               * 17 : Analog
+              * 18 : Reserved
               To simplify the usage, macro is available to generate "pinmux" field.
               This macro is available here:
                 - include/dt-bindings/pinctrl/stm32-pinfunc.h
+              Setting the pinmux's function to the Reserved (RSVD) value is used to inform
+              the driver that it shall not apply the mux setting. This can be used to
+              reserve some pins, for example to a co-processor not running Linux.
               Some examples of using macro:
                /* GPIO A9 set as alternate function 2 */
                ... {
@@ -176,6 +180,10 @@ patternProperties:
                ... {
                           pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
                };
+               /* GPIO A9 reserved for co-processor */
+               ... {
+                          pinmux = <STM32_PINMUX('A', 9, RSVD)>;
+               };
 
           bias-disable:
             type: boolean
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index 28ad0235086a6..af3fd388329a0 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -26,6 +26,7 @@
 #define AF14	0xf
 #define AF15	0x10
 #define ANALOG	0x11
+#define RSVD	0x12
 
 /* define Pins number*/
 #define PIN_NO(port, line)	(((port) - 'A') * 0x10 + (line))
-- 
2.34.1


