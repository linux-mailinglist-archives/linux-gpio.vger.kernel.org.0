Return-Path: <linux-gpio+bounces-10555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7C989EDC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B1B1C21A14
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 09:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F8418A6CD;
	Mon, 30 Sep 2024 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RRJOUvzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8F18A922;
	Mon, 30 Sep 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727690149; cv=none; b=ALYI2I0Uf6HjGYYEy5QvXbYLHVha/RZpuSlg+xCUpVr7gVteJIS/hHjfVahMGKrZFbr/wkIVqf0HBgNa7yb8dmrXszaSpKNO4TNsULhqUGpLkOjXR210Y9cfaQjxqIknfSq59pq9myl0vRlfKraisMR9bViNpQE3zSmEohRJMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727690149; c=relaxed/simple;
	bh=eznE8iaIyvpWxVm1s8pg4O+PApWejE/1A5HpNtfm8wU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YM9xPLxdVHO/aLRiWx+nijkJNrCzm1mG347I4NTiaeznVWpLEfP+CliIPpDmrbZAPYt7eVtnnt5RvV3om10BNZsfQWTb0axKWHSem2N1Ujy08CI6D9C/oGBA5x8rWEmcZnHiBiEuVX2VUJTL8WGeGn3KVSoqDUzc6OHlkaneJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RRJOUvzq; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690148; x=1759226148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eznE8iaIyvpWxVm1s8pg4O+PApWejE/1A5HpNtfm8wU=;
  b=RRJOUvzqL8PDMj2H5m9mPbnuu+SVzGlHfuewqWHnSqxEggN8LrB8RNOo
   Rhsj/lzqk5kR/NTMnbaKYdMi3w8LGOZ/IGqaxPbc0hQPlIl9fWBusOLCY
   eXmqDv1PsgrKuveF/pn52X/cyuZKHBNAJ1erA5x0G4t/v6XvnTxBv1be4
   aOX7rArxzr6J+FHQcI4a+AinejuGc0G949vZk4nOB6WV3wvN3gguLYBup
   ZJPhNMM9pcYERM2AGzCsmfaPxUIqlJF5gesdPYd5hkqidriMKFG2hlOEB
   4OB3nvFzBYS5q/q+vBWnWDwUMFL3QYafdl+zh9aUB5Lx/7EgZwmz3/IYX
   A==;
X-CSE-ConnectionGUID: VDfGPtv3TTmpuSmsWgS4Xg==
X-CSE-MsgGUID: Swqj+S/cTSOJb/XURGQBiQ==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="263420163"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:10 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:08 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 05/20] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
Date: Mon, 30 Sep 2024 10:54:34 +0100
Message-ID: <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX GPIO is compatible with mpfs-gpio controller, just add fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml        | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..febe8c2cd70d 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,10 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-gpio
-          - microchip,coregpio-rtl-v3
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
+      - items:
+          - enum:
+              - microchip,mpfs-gpio
+              - microchip,coregpio-rtl-v3
 
   reg:
     maxItems: 1
@@ -69,7 +73,8 @@ allOf:
       properties:
         compatible:
           contains:
-            const: microchip,mpfs-gpio
+            enum:
+              - microchip,mpfs-gpio
     then:
       required:
         - interrupts
-- 
2.30.2


