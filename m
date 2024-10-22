Return-Path: <linux-gpio+bounces-11764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA269AB323
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABCE11C2135F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6221BDA84;
	Tue, 22 Oct 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="CgBTAuIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD91BD4E5;
	Tue, 22 Oct 2024 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612798; cv=none; b=cnt4hquyQ3gEFPxOa8ak8uJm8jzUG1U9FIslAI+TqY/0uN13KpZE6V7aVTB8wQb5CEx2eCnS9rt0U5D1lW/7EVxPZ1v7LlCXTxyphxKhYipvMEMFqw4pDhEnG1H6VMLK23emVStFS4cwURaaZstB52yd/clC4NRHGvCzn8fRdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612798; c=relaxed/simple;
	bh=s3cOtDIgKl2UZAIIJ03V7UYYm0flB+To6IAD5aVTkSI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFlqfDKmctFLDkjaUIPflqZv2Vr3RY+/AE4sXqtc9ibkToHnL0rNSrRM7f78UniB/vZwVLw7m5QhjSAYtIPm93aMYqtqF+3nujyniVeOmOoW9EkbEL6zBCAjURhEXZDzzeGqJGGMl9Jjgz2eh15B1Rn1FBDpIAxdezNZ4+tqTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=CgBTAuIl; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MFFZ1j000777;
	Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mH466ITeHHX+vgZl8o4SmPtSbhyJZCD2fmPHFvd4rX4=; b=CgBTAuIljFwTbzPP
	GMtieHZkLVehqlOo6L2ZwYxmiVE172eqVh/vpEB1Ct+383ZMQqYMgBBV1Ijqvv8s
	R0DSv9R67bPY42vqgkM0J21OirhmAn1nZtfZy0+VSi0mNtwfhtiO0Yq3/C+TF1Pm
	jvUE7Ul5/ageua/vay1pv04P/4VQWNSczCaLilVEfeUEOW3BABkAT30wAYnR9KVG
	W0ZeKBzPDJvxbL4Jh2AiIWEyW5dj5Y06HRfMeJE7RjpwHxkSRlTZAkZt0W+d+9EW
	jL5PI+65M5p9l7PJ3BNK/95Yhjad+N+pcQIPO0lrYQjhZuX8I8x7fpTWAdPLU3SM
	N5iRIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42eehmr588-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1DEC540060;
	Tue, 22 Oct 2024 17:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83E8326E85D;
	Tue, 22 Oct 2024 17:57:31 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:31 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>,
        Amelie Delaunay
	<amelie.delaunay@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Cheick Traore <cheick.traore@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO synchronization parameters
Date: Tue, 22 Oct 2024 17:56:51 +0200
Message-ID: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

Support the following IO synchronization parameters:
- Delay (in ns)
- Delay path (input / output)
- Clock edge (single / double edge)
- Clock inversion
- Retiming

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 5d17d6487ae9c..9a7ecfea6eb5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -207,6 +207,54 @@ patternProperties:
               3: High speed
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
+          st,io-delay-path:
+            description: |
+              IO synchronization delay path location
+              0: Delay switched into the output path
+              1: Delay switched into the input path
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-clk-edge:
+            description: |
+              IO synchronization clock edge
+              0: Data single-edge (changing on rising or falling clock edge)
+              1: Data double-edge (changing on both clock edges)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-clk-type:
+            description: |
+              IO synchronization clock inversion
+              0: IO clocks not inverted. Data retimed to rising clock edge
+              1: IO clocks inverted. Data retimed to falling clock edge
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-retime:
+            description: |
+              IO synchronization data retime
+              0: Data not synchronized or retimed on clock edges
+              1: Data retimed to either rising or falling clock edge
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-delay:
+            description: |
+              IO synchronization delay applied to the input or output path
+              0: No delay
+              1: Delay 0.30 ns
+              2: Delay 0.50 ns
+              3: Delay 0.75 ns
+              4: Delay 1.00 ns
+              5: Delay 1.25 ns
+              6: Delay 1.50 ns
+              7: Delay 1.75 ns
+              8: Delay 2.00 ns
+              9: Delay 2.25 ns
+              10: Delay 2.50 ns
+              11: Delay 2.75 ns
+              12: Delay 3.00 ns
+              13: Delay 3.25 ns
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 13
 
         required:
           - pinmux
-- 
2.34.1


