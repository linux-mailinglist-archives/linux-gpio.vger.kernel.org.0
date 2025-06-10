Return-Path: <linux-gpio+bounces-21251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9EAD3D18
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 17:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D74B1785CF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4242E23A9B1;
	Tue, 10 Jun 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eKXRLLuG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641291F03C7;
	Tue, 10 Jun 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568857; cv=none; b=SPkz3CT7+96sPrtbIixkvb2PXFsJQVPz3WYFcnEJT+tM4iU3ASN9ifhVEtvngnhiE9yTl8A8AGM9wz2i7OuRUm0VTk5D+eDPMmBcuha+mXpIeAEfP+unmngQysluZltFE3ryfAyuVbr14tCtywUGUHaLvDfKC3ogAzYfDWuErDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568857; c=relaxed/simple;
	bh=cyPwXUOsCqtXLic90dMMlNKmMSOKR5wptLkmHu2OR/E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOqkL5cB989bgyo1qU8sXiDbxVhvrjTMZkZcSisLw3elwkroXEqGll2Ht3xg3vwCG7VtAt4dCXSKFYce3WGhTIp0i7yOFBNmfW3z7ZX7obrHdiNj3Kwu5RRyrqIna/6UJ5EPk8tsomQLUuklwuQCu0qJFGUJ2BBImChFEzoti1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eKXRLLuG; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDXT012933;
	Tue, 10 Jun 2025 17:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iRwS5y+6+ListVV+cfmEY7D708flMTRs7UfPH9JgUtw=; b=eKXRLLuGCrKmGZba
	f3drpZSQ8KTejJTI2ufpHGpLXRJvFdVGLQH7A7h7glW3ReNXfiRkt943FaD5v+Ym
	686+XG5YoPs/hIyM9OOt9KuSA5qjMjIPfPnJ136WYhP6KiXOAfzksczto2yukHtq
	pgT6Z9stXRKsxaTHHJO96/es/1ApxoNaKzby0aUP2PaJELFhLvtdj7kSdmqvkex3
	fXJuPVPwPM8hXMpSTZXkE8NFrODJxAcTU367iFX0+87C5/pvA0SrT/MEhSimdHW5
	yhfXe76a114n+iXP0qyROXNR8J3d/Z8SoUhUvK7l7lxCBUMDR2Bg1DCrss7SIg/g
	cc+YlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume54a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84A894004F;
	Tue, 10 Jun 2025 17:19:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBE9EB74DC7;
	Tue, 10 Jun 2025 17:18:44 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:44 +0200
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
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing blank lines
Date: Tue, 10 Jun 2025 17:18:37 +0200
Message-ID: <20250610151837.299244-6-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610151837.299244-1-antonio.borneo@foss.st.com>
References: <20250610151837.299244-1-antonio.borneo@foss.st.com>
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

Separate the properties through a blank line.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 5d17d6487ae9c..961161c2ab62b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -32,13 +32,16 @@ properties:
 
   '#address-cells':
     const: 1
+
   '#size-cells':
     const: 1
 
   ranges: true
+
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     deprecated: true
+
   hwlocks: true
 
   interrupts:
@@ -67,22 +70,29 @@ patternProperties:
     additionalProperties: false
     properties:
       gpio-controller: true
+
       '#gpio-cells':
         const: 2
+
       interrupt-controller: true
       '#interrupt-cells':
         const: 2
 
       reg:
         maxItems: 1
+
       clocks:
         maxItems: 1
+
       resets:
         maxItems: 1
+
       gpio-line-names: true
+
       gpio-ranges:
         minItems: 1
         maxItems: 16
+
       ngpios:
         description:
           Number of available gpios in a bank.
@@ -187,18 +197,25 @@ patternProperties:
 
           bias-disable:
             type: boolean
+
           bias-pull-down:
             type: boolean
+
           bias-pull-up:
             type: boolean
+
           drive-push-pull:
             type: boolean
+
           drive-open-drain:
             type: boolean
+
           output-low:
             type: boolean
+
           output-high:
             type: boolean
+
           slew-rate:
             description: |
               0: Low speed
-- 
2.34.1


