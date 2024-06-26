Return-Path: <linux-gpio+bounces-7717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CC917DA8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F08B2105E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80529176AD3;
	Wed, 26 Jun 2024 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FL/1rLlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A2176ABF
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 10:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719397098; cv=none; b=QkfQM7rGfEP8Mb/B9SUNXGkbtlub0v/sHTWqKNdYi/ZtWnsGZ/W8vXku7vS12Ad6DizBFfaEdbBLQZms7Qc5aDr32cW1xhJL/odThKJratVhgbKbsu3LRFm/Zari6mXs7WhIKyJutEvXwR+xskR1uV/V23kKE+Gryqsbm74n3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719397098; c=relaxed/simple;
	bh=HxFLn3EKFP9/3frs9V6iy9Q1+ai79dM4oSUWkrspkNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBRbcSX49wnL5KIsMtBJDrpHp4Yi2v0Kz/rsr+Konrn9wM2pSdk8mRc7/3Op+77EgKc5LYiryvb4mHbOzrnTjJ/97zy87hufC7FuR66cJ0O/FGEJKmkRdKIFsmdmK5bs0cWC69Z9DHdodFtX6IOpmP6lbT73DKEvDl/Fdmw6X4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FL/1rLlN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so48599a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719397094; x=1720001894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bdjU3nE5ZipGzXPlrfx4tB5EjZjaLf/s1zAFQ4DTHQ=;
        b=FL/1rLlN4StONzTTMqTS41LTLU5ZQTKm9+rF3c0+VuLgHk5lnbGed4BtNRiYSASwC+
         kss4tFI1nBqblO7j2VR7x3C/FONV0as4aaMbL3Mb8qcT6DuYjjF+W1hKsMvMKwif1gU5
         uGCQlNbraj668ebjVaqBAOR/CzOVkh8PSvOOta2lAm2aD7tduKtC1OM27OluSx1cOmt5
         0M9ndOAlFoexzZY5Md2uKCRHAZy0X1CEI7AqNxHXlbRFk82I90ndUbrXQr5fdbdK5H3s
         QWzlC9L/Ct9UUINI2RU6rIcLCl9oP7k5NGMBW6fL12WbboOioNw8hZSNNKqsDGogm7AE
         uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397094; x=1720001894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bdjU3nE5ZipGzXPlrfx4tB5EjZjaLf/s1zAFQ4DTHQ=;
        b=TJ3jHRc6YVuF4ykAsIdmfUCNNb8NxPEGL8tdswadKDjAyLAwoUZSRmxqXRtf4mpN96
         hOfRQMRkQ1tZKBUxVHQ1bZKC16Ef9TYLnrzP1KPXFSqnF8QYAD6qteTlI6mjvwsMBQcP
         mhWyZPghwaexH/wFFW2y/q9FEqkjO9DEDGCscXDnsnrKS9UBuHolqRCtSsrgnc0Ey6f2
         2oSVddqvCncz58vjcLwCnkfqYKQVMU4XkVCR2OeJnjmZ1mFYJfVs0KLY8y4NZLDmMI53
         SiIIbprL2T50O+apcmIA6ue50FsCPLSRaoOuy6bn8XHeTjb/FI2sEK1W9zujEtLewvhs
         3e5A==
X-Forwarded-Encrypted: i=1; AJvYcCV4nUdM+TRUT3FsejJ1vB9y7C9Q6hX1Jc0BjwQt5pDvVNmv5ibMSpWUN8hl4FJZov5wGDcdmYvl85I84eJ7b3coseGkceGjICmO6w==
X-Gm-Message-State: AOJu0YxcZ6/dOp/A8LmvMoBZiBANsc8tA13g3zHBaFv0dwprZrxseMO0
	xwO/KlskjRN1Mr3XETMD6rmeXp8KeKZuKQuImv2Mbgvd34h7pEuQR1dVUuTYYus=
X-Google-Smtp-Source: AGHT+IFBNccWMI7NTYfI9iYETbbac/VKuBb+ZnQdRhtrnkDqFlLEVtbm0dPVcl4LOR3fqWpc0urpjg==
X-Received: by 2002:a05:6402:340d:b0:582:5195:3a7a with SMTP id 4fb4d7f45d1cf-58251957777mr3714663a12.35.1719397094033;
        Wed, 26 Jun 2024 03:18:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3053558esm6965474a12.64.2024.06.26.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:18:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from intel
Date: Wed, 26 Jun 2024 12:18:09 +0200
Message-ID: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emails to chuanhua.lei@intel.com, mallikarjunax.reddy@intel.com,
yixin.zhu@intel.com and vadivel.muruganx.ramuthevar@linux.intel.com
bounce with the same message:

  Your message wasn't delivered to Yixin.zhu@intel.com because the
  address couldn't be found or is unable to receive email.

The Intel LGM SoC was apparently part of Home Gateway division which was
acquired by Maxlinear, so switch maintenance of affected bindings to the
only known non-bouncing Maxlinear address: Rahul Tanwar.

I do not know if Rahul Tanwar or Maxlinear want to maintain the
bindings, so regardless of this change we should consider bindings
abandoned and probably drop soon.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml    | 2 +-
 Documentation/devicetree/bindings/dma/intel,ldma.yaml         | 3 +--
 Documentation/devicetree/bindings/leds/leds-lgm.yaml          | 3 +--
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml  | 2 +-
 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml | 2 +-
 Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml   | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml b/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
index 76609a390429..bd7f96515ab9 100644
--- a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
+++ b/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain SoC's Clock Controller(CGU)
 
 maintainers:
-  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |
   Lightning Mountain(LGM) SoC's Clock Generation Unit(CGU) driver provides
diff --git a/Documentation/devicetree/bindings/dma/intel,ldma.yaml b/Documentation/devicetree/bindings/dma/intel,ldma.yaml
index d6bb553a2c6f..af96d52922f6 100644
--- a/Documentation/devicetree/bindings/dma/intel,ldma.yaml
+++ b/Documentation/devicetree/bindings/dma/intel,ldma.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Lightning Mountain centralized DMA controllers.
 
 maintainers:
-  - chuanhua.lei@intel.com
-  - mallikarjunax.reddy@intel.com
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 allOf:
   - $ref: dma-controller.yaml#
diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
index 8b3b3bf1eaf2..4ea6cf0af836 100644
--- a/Documentation/devicetree/bindings/leds/leds-lgm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain (LGM) SoC LED Serial Shift Output (SSO) Controller driver
 
 maintainers:
-  - Zhu, Yi Xin <Yixin.zhu@intel.com>
-  - Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 07bc7e3efd3a..2582380bf657 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -10,7 +10,7 @@ allOf:
   - $ref: nand-controller.yaml
 
 maintainers:
-  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
index ca818f83579b..5af7e5f7e634 100644
--- a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain(LGM) eMMC PHY
 
 maintainers:
-  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |+
   Bindings for eMMC PHY on Intel's Lightning Mountain SoC, syscon
diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
index 653a12286637..823a5fabf749 100644
--- a/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel LGM USB PHY
 
 maintainers:
-  - Vadivel Murugan Ramuthevar <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..1cd19db1aa50 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain SoC pinmux & GPIO controller
 
 maintainers:
-  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |
   Pinmux & GPIO controller controls pin multiplexing & configuration including
-- 
2.43.0


