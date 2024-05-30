Return-Path: <linux-gpio+bounces-6966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5648D5132
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E451C22DB4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4014AEFD;
	Thu, 30 May 2024 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U79W2KKA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E164D11D;
	Thu, 30 May 2024 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090908; cv=none; b=QJyVYsym4diRJQzVc0bdxWcqjiG5KOIWqyh5UGgddtyclp1POEtDIuwt/0fmVvjgPXsH0uI8dabvWxUsF0W+8LaCBsG/e9ET3Tt81ckEmB73DNzmkTTGpLzzp9EHJhKdxcvKCsaNII/1dofC14N7uFMAT0jOtj+gJ9HU/Ge5k6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090908; c=relaxed/simple;
	bh=4OENx/LxivoFi1HZbszwtwrrZJBxkD55Rh2bRKyDcYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LdTl+2fYumRdgukvQRg0EWqfdxnAXRn0G/EVvH2iuzoBGtaLidwsVX21/sjy/P3OEqkvHUIyOkKpOa1p60uY+FJ25GIw3X+pzvecV/+aN/vdCt7Y91CRDc/tWivw9DmCl7oQVeVRv2JIUZall9suVmZrjfYAgFH48Z+t5gDrgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U79W2KKA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f62fae8c3cso2421365ad.3;
        Thu, 30 May 2024 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090906; x=1717695706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQTcKAwRR2CB7qe7k8+Z7X6rFlGpaxJQngY2sTBYIbo=;
        b=U79W2KKAvPRyZFIhQu0y9D3G/jMEl/I/v2HUCYQLUjS1nqTSolaNs4FUulCstZloV6
         89C2B3M1+FcJPe+CCvJfsbPctvMpmsLKyjATX65e8yrXbVZK3rlGjVGKtLIkVGZ+b/tw
         6/iHARUckUJZjNLwn7nJ+4Ypdrr0CZCR5eJl92NVXPkY31ax4bErNDveh+VOHr3elbhP
         SfaM2kP5gabVFXNKuVy6ceQFRNzpH31wYQtfJwJqdGtPLPPWCpmfYCChiWu53Wh4VVA3
         ZkBZybL5m6biONaHqaOfrVZgGsX/mJ+xMpEWnHQm7QBAz4XXf4Moj2SsDqCNFmwTquIK
         l7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090906; x=1717695706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQTcKAwRR2CB7qe7k8+Z7X6rFlGpaxJQngY2sTBYIbo=;
        b=U4GlO3uK1jqWc+lhAfH0cQ1rf/GVgqZfNbO289E1xLDbK9tVWybhBq4Ooz3yh7Rt9f
         jQdGnHNxHmSN5SjFpOqz8KFqJ0ukfSJlil+7f2rgH9FGUa0k1mcQWFcB55GKKM0Ra9YC
         hINMKaKedYd43p653dLwSWspVg5o1yHraqZ2aGfB63t+SvcTf9ylQ9npslm3ZNxnAvkx
         T+YCFVjIHgizQQKJE3lPQxivUBbm9TTxkKz4pkmtA6i7Er5f4JujqZwHCSxLS0AsWojl
         8BLK514B+KbJ6XWM4J0ZFbbHZK1P7a0j4QriNmMaZ/n27Xm0g2UMN/FTF/+QN+Gu8DvZ
         +/sg==
X-Forwarded-Encrypted: i=1; AJvYcCXPVsveiWPnOot/hCqLDh9bzDVxCs0nVV0VfFfaYW8WMZM7QvY+gDt/oPLJ7mGe00eY0QctwiVnJ+lcYA5WlOBOOXass+XX0gMf2OaplV6kmjSe7pH0kTfdaWkLIqkl+1gRoHM4QrQ33lu0LHJgYNRU/tlwwDIR/CHaRmLBhaXb/ZQv8gI=
X-Gm-Message-State: AOJu0Yz9l3kneJqshMdlcOPPkChKxHGiCLDXbRaAknez9jOAk578viEt
	ioEZwjINZGGcugZMw361NdO4AzSLBzjHsZ+IXNe0b2G9cnEZ/ydl
X-Google-Smtp-Source: AGHT+IGT/+Dx0zzG5wpCUOY69x3j0CHOVBROUy2MlwSdMlvSMPK1hZTLpvx2BhzABEx0AbQUoPgU1g==
X-Received: by 2002:a17:903:124d:b0:1f5:e796:f245 with SMTP id d9443c01a7336-1f6192f144fmr31466605ad.1.1717090905801;
        Thu, 30 May 2024 10:41:45 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:41:45 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document RZ/V2H(P) SoC
Date: Thu, 30 May 2024 18:38:43 +0100
Message-Id: <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Updated description for renesas,output-impedance property
- Updated commit description

RFC->v2
- Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
- Updated values for renesas,output-impedance
- Added bias properties
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 881e992adca3..957b9f7e7de5 100644
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
+          description: |
+            Output impedance for pins on the RZ/V2H(P) SoC. Values 0, 1, 2, and 3
+            correspond to register bit values that can be set in the PFC_IOLH_mn
+            register, which adjusts the drive strength value and is pin-dependent.
+          $ref: /schemas/types.yaml#/definitions/uint32
+          enum: [0, 1, 2, 3]
 
     - type: object
       additionalProperties:
-- 
2.34.1


