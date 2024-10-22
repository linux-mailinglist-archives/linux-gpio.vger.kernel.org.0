Return-Path: <linux-gpio+bounces-11768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C369AB331
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C9A1F26556
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06081C2330;
	Tue, 22 Oct 2024 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MUEZ6dY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55DE1BF80A;
	Tue, 22 Oct 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729612802; cv=none; b=mjCg/kDejk/+3hxP4YlxzeZlaIiDQppbXWfXMGna1fgBj2Qmk6LJAS84sBNXMuVusIkUeL1ZtsxPW4nCKG41A7UDFceqmJqikswPSsivQDsyn+ph72SK2Kbuf6olEx7A9qXgdY756Zze5xZdhkdUUS5cxaQMEFMDDOAFuFksvcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729612802; c=relaxed/simple;
	bh=+583dxmLq3tW754Kkw4o+cOFm9PYMZgtPNxMWUcdIaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3K7jrEW2feimM9YDyq+I7E/zXEd6Co+4HopRcyM4WWZZtvK1yQiw+eFG1toifWZvNZjEool1j+gJAzRB2Mcz+vLMCCSZxGR/9gYbJJ79AVg1/0xx/fUHeLLO8TwZ6yxZtG21irNO9Nff98eGkOWQTqC7ew3WW5KCDkny3pZQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MUEZ6dY2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBNiUP018501;
	Tue, 22 Oct 2024 17:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s+4tJKgU5xujLkFlGGZK8pWZQRZyTK+On7t7iOcSAk8=; b=MUEZ6dY20n5N+Pj4
	lVQGdHK217qmqCoEW+dlYYsQd4uMy529UtjSOiUYbKNNWzN8baHq2mKTrByV2RDe
	wM5KcZlXaJOn9HRMFDN8UxF4F5eM8kWxVHvbMx8fmRWsXGMBYCGAx++x7hWriSId
	D8dqUIzwpaX/4YGH7ryRpDvEv1U2SO6fHmwAeXwW1bD3YskN7wWT+Obdb0s97YCh
	i5hL6NmgOa+jrM5CPVC4OoGxCSsnNsAGiXhhEtQ9ZXIyODL1BohFwnK8kTefN9WI
	qh4doBjLCpfXINvjcI0kurRbVJcMS27+Y4hSwirtnHTqIX2Tq6yFlvz9+Lfr4/+b
	VGQLig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:59:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 037A140051;
	Tue, 22 Oct 2024 17:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2DB326E844;
	Tue, 22 Oct 2024 17:57:29 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:29 +0200
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
Subject: [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD mux function
Date: Tue, 22 Oct 2024 17:56:48 +0200
Message-ID: <20241022155658.1647350-5-antonio.borneo@foss.st.com>
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

Document the RSVD (Reserved) mux function, used to reserve pins
for a coprocessor not running Linux.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
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


