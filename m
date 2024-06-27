Return-Path: <linux-gpio+bounces-7761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBC91AA7D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 730D11C2425D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54349198E73;
	Thu, 27 Jun 2024 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C+GMefX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2213C821;
	Thu, 27 Jun 2024 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500789; cv=none; b=j0+SWqXT5sTiLoKX1rztbRtVft1Us4eShGdT6a2mUEf9oiAMWJ/7Vnc8aDIg40BLLRxQvSaajxNGUknQOgt+AHsQRsXHT7O3jwCXDL044HYw5+Wdc7MfoxxhXc9G5eHl4LW2QL44c3JMnx0f9noWQA9yYjjv3/Ou6bsDSo4Sz5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500789; c=relaxed/simple;
	bh=Q6CNiPkkdNu7gSD02dlZ4a+giT7+eN+yTgHoayf3dXY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KHOqfddMwRnou/NvSkJO6PvJuYNRp6uEbt6JdYCZ6MaRuTTIxBQo+ouF6AAGSr9WNkDyuiFat63Js3fYetnl+PobTWuZhIRTs5Ik1PKQdX7hPQCSewQcogMoEV9Udj8LP6eESWJ5uMypsfOIpIfblf1KNNxN+HWdP5KYuSATAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C+GMefX+; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RF6BXQ004455;
	Thu, 27 Jun 2024 10:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719500771;
	bh=AA7CCvsy3fGdZWB/58CmRJN2Df5l8paTg5EoWlnMJ1o=;
	h=From:To:CC:Subject:Date;
	b=C+GMefX+Z+LXjfKt1Xk5de2oyQNswMN6blN7w29ecMgukSinYs0STHdV1KIs9yg9E
	 a8F9Q5RS9lzVf//XQfH/TO8dWr3im+ac+2m3x8dKKKE3ouBFqKsF69Z1qThkfh/28w
	 7BMuyTSTR+c5pZImmYFI3RxuWkJpkOaI8HfsBis0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RF6Bgd033898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 10:06:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 10:06:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 10:06:11 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RF6BHV001943;
	Thu, 27 Jun 2024 10:06:11 -0500
From: Nishanth Menon <nm@ti.com>
To: Tony Lindgren <tony@atomide.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH V2] dt-bindings: pinctrl: pinctrl-single: Fix pinctrl-single,gpio-range description
Date: Thu, 27 Jun 2024 10:06:10 -0500
Message-ID: <20240627150610.469645-1-nm@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Texas Instruments, Inc.
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The binding is supposed to describe the properties of each element
of the pinctrl-single,gpio-range array entry, however when we use
"- items:" instead of "items:", it explicitly describes that there
is just a single entry in the array.

The pinctrl-single,gpio-range property should describe more than one
entry in the array. Fix the typo and adjust the alignment of the
description of the entries appropriately.

Fixes: 677a62482bd6 ("dt-bindings: pinctrl: Update pinctrl-single to use yaml")
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Symptom:
pinctrl-single,gpio-range = <&range 0 21 7>;
generates no warning
However,
pinctrl-single,gpio-range = <&range 0 21 7>, <&range 32 2 7>;
generates "is too long" warning.

This is just an attempt to fix the binding that is existing.

V1: https://lore.kernel.org/all/20240618165102.2380159-1-nm@ti.com/

Patch is based on next-20240626

 .../devicetree/bindings/pinctrl/pinctrl-single.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index c11495524dd2..4e7fd00d602a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -75,11 +75,11 @@ properties:
     description: Optional list of pin base, nr pins & gpio function
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - items:
-          - description: phandle of a gpio-range node
-          - description: pin base
-          - description: number of pins
-          - description: gpio function
+      items:
+        - description: phandle of a gpio-range node
+        - description: pin base
+        - description: number of pins
+        - description: gpio function
 
   '#gpio-range-cells':
     description: No longer needed, may exist in older files for gpio-ranges

base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
-- 
2.43.0


