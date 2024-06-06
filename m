Return-Path: <linux-gpio+bounces-7226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F28FE1A4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA06E1F2219F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 08:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A86A1465AF;
	Thu,  6 Jun 2024 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHH342ED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819F145B13;
	Thu,  6 Jun 2024 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663900; cv=none; b=uIJofzXkK4Q22cdqGM+4ujUFXjB0oMKceG9PTlObik6KDQCxwWY5ketKGIutv68lWpIYl20/KNHOyzK/Eo63wS5ckzdRHvNyFdj7txlEh7oOE5W0kciHe8RB29cR2C9A7W4v2ezPPcl8GNUMdfYjE1XNaTpEQzZLXQDGelNNz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663900; c=relaxed/simple;
	bh=olMsTt0E07IExOiEWWxYo5VlwenVYpNVSmvwdO7uYe8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LPDKuFK6CnRggRWSeiIXAVvTyOE05a7u3fPhP6KnTWHWWM+bQy+CPmO8pMul0sSMcK8temLFifBJbWNi6/z/PuiQJGQmPlPztEe8Wdw/9gQr0NJmLh+D+5DgxQouN6UUBuAZ7tT8HwsVyo+hnVDlHn2aQsrm/ZP6inedmGvrp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHH342ED; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35b6467754cso483549f8f.3;
        Thu, 06 Jun 2024 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663898; x=1718268698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mllGj07TyExdbGEWAEU/QQgVzOqr2piCK4whCFAxbs=;
        b=iHH342ED33f1VOrWDeEwrO7VSl+c6V2qq5y7LRIA0SRnuuMPH6R+19E++QcvfgHtQf
         N4qga3KklXymk7RFGMEBzIs53/iF7bxNMglyEhnMFculywKQgvWUykS4djQSzzrnE/bL
         r8guSGZhg1QJdZwqL4zqnZ+FOeQWmF1YxgntySyxD4hW6e2DP4EN8dTFSBxVzfSnHh7E
         xl1ScBlXXCm1CmoFxgn0Zd7q/RLAdDtQZznO87EqsKMEgz6b3CVTbnI6Xa1i582UEscV
         4SrU24JkUUs9VDiDetIhfyASIvScnSXhctoLNS5g8Q+z3dKNzxNYgpedwtoLsJj8PNiU
         Tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663898; x=1718268698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mllGj07TyExdbGEWAEU/QQgVzOqr2piCK4whCFAxbs=;
        b=HIazSisR91MAGKA2riVxcvMvDlKq8YyQ6fZU7b9kibY/vpWUeMQhpHaACwDHh1dmPY
         Go/hWo8hoWcuyEZl3A3TDxCvXIn+jdj3IAWQb5jWT/XylhQTQJGshdmqcu5stRHz2Mrx
         frv7MUc0YQbBXG1VykMJgE/sV3VPBqUNe7SPvMsVgVcS3Bdlf7gk7/E91GPp/iDZQAvH
         tPTI+w1lvy2APlNglla2EH00z/ANX+DWFXgrD0Y4AgE/U1Dkxwaq3EcoetChNSM6xEX2
         vRbRXbq4+eNfvko2wItozY/3dKi3bdzgkl/huhSjj9N92R2kuCBY0/skUIp09mtX7Q8I
         c6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUxyToCaoyNZ/a6sjNzQVGfXn6xw+HtX7dh3aRMO4E/A1NtL6hXTcRZuW+oo27iY/6pcpX5rFx+2Z9Pexreys9susXFUEUqp20UKhF4LUjM+fycS+3fgnr+sM0mjy9vu29Z8TXGjD3Ljai++91eUIXuxZd+UeQiC9KMO6PYss3nBFmkT8o=
X-Gm-Message-State: AOJu0Yx52ejlXtWlveVMtbOT60FkT+8JshNRH1iFeIeUFaRc7IbGhDMv
	YuDXak6eQv03L1pSSZgacff2dMVhsUBL6iG5KRRTr7IwebXRk5K8
X-Google-Smtp-Source: AGHT+IGtbmw8e09ZrB/ElqmFff5B2nsA8J/S0oplHnyKX/IDSc903euWdyLnHYpsrkdkNdDc6PzMMQ==
X-Received: by 2002:a5d:49c5:0:b0:354:c934:efa1 with SMTP id ffacd0b85a97d-35e8ef888camr3319737f8f.56.1717663897283;
        Thu, 06 Jun 2024 01:51:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d69c68sm986772f8f.61.2024.06.06.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:51:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4] dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
Date: Thu,  6 Jun 2024 09:51:33 +0100
Message-Id: <20240606085133.632307-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/V2H(P)
(R9A09G057) SoC. The RZ/V2H PFC varies slightly compared to the RZ/G2L
family:
- Additional bits need to be set during pinmuxing.
- The GPIO pin count is different.

Hence, a SoC-specific compatible string, 'renesas,r9a09g057-pinctrl', is
added for the RZ/V2H(P) SoC.

Also, add the 'renesas,output-impedance' property. The drive strength
setting on RZ/V2H(P) depends on the different power rails coming out from
the PMIC (connected via I2C). These power rails (required for drive
strength) can be 1.2V, 1.8V, or 3.3V.

Pins are grouped into 4 groups:

Group 1: Impedance
- 150/75/38/25 ohms (at 3.3V)
- 130/65/33/22 ohms (at 1.8V)

Group 2: Impedance
- 50/40/33/25 ohms (at 1.8V)

Group 3: Impedance
- 150/75/37.5/25 ohms (at 3.3V)
- 130/65/33/22 ohms (at 1.8V)

Group 4: Impedance
- 110/55/30/20 ohms (at 1.8V)
- 150/75/38/25 ohms (at 1.2V)

The 'renesas,output-impedance' property, as documented, can be
[0, 1, 2, 3], these correspond to register bit values that can
be set in the PFC_IOLH_mn register, which adjusts the drive
strength value and is pin-dependent.

As power rail information may not be available very early in the boot
process, the 'renesas,output-impedance' property is added instead of
reusing the 'output-impedance-ohms' property.

Also, allow bias-disable, bias-pull-down and bias-pull-up properties
as these can be used to configure the pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Sending just the binding patch of series [0] as reset of the patches have
been Reviewed.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v3->v4
- Added a conditional schema for ensuring the reset length
  is 2 for RZ/V2H and 3 otherwise
- Updated description for renesas,output-impedance property
- Dropped '|'

v2->v3
- Updated description for renesas,output-impedance property
- Updated commit description

RFC->v2
- Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
- Updated values for renesas,output-impedance
- Added bias properties
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 881e992adca3..56d90c8e1fa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and RZ/Five
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
+              - renesas,r9a09g057-pinctrl # RZ/V2H(P)
 
       - items:
           - enum:
@@ -66,10 +67,14 @@ properties:
     maxItems: 1
 
   resets:
-    items:
-      - description: GPIO_RSTN signal
-      - description: GPIO_PORT_RESETN signal
-      - description: GPIO_SPARE_RESETN signal
+    oneOf:
+      - items:
+          - description: GPIO_RSTN signal
+          - description: GPIO_PORT_RESETN signal
+          - description: GPIO_SPARE_RESETN signal
+      - items:
+          - description: PFC main reset
+          - description: Reset for the control register related to WDTUDFCA and WDTUDFFCM pins
 
 additionalProperties:
   anyOf:
@@ -111,6 +116,16 @@ additionalProperties:
         output-high: true
         output-low: true
         line-name: true
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+        renesas,output-impedance:
+          description:
+            Output impedance for pins on the RZ/V2H(P) SoC. The value provided by this
+            property corresponds to register bit values that can be set in the PFC_IOLH_mn
+            register, which adjusts the drive strength value and is pin-dependent.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 1, 2, 3]
 
     - type: object
       additionalProperties:
@@ -119,6 +134,20 @@ additionalProperties:
 allOf:
   - $ref: pinctrl.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-pinctrl
+    then:
+      properties:
+        resets:
+          maxItems: 2
+    else:
+      properties:
+        resets:
+          minItems: 3
+
 required:
   - compatible
   - reg
-- 
2.34.1


