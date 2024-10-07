Return-Path: <linux-gpio+bounces-10951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619E992BF6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98B81F231DB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 12:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F91D3565;
	Mon,  7 Oct 2024 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TDhxZrji"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9F1D2B25
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304792; cv=none; b=iCu2SRLlwoC55jqigSSENqXQS0dvOWJFDS5quLuAHZgMYu/6BuKZns1XiMPzvQNRE9zCuw2sdn6YczqUEF7G1e7HNP/LJEjD4ETRQldr/B5zsct0M1fwdw8f7AyNGXEK1+bSv1sFfIxlgiKzioWhwfhnRMCF80ZqZhg7uZ5TRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304792; c=relaxed/simple;
	bh=Vng6Rnm8WZ0QEcMErGHsHitJT99zYtF15IooAdGsAnE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPWnLH4kSfvWpqM5lXJmoftGYi2fTBJERUxgbFH97hQHHQx/RlarPoDyxhQ20ys5ZzubODUrhG3cIU1OykYoxhMdK58NDzpUtmHTB5HfRSgAyX59wnF4fTk5bcvBjBtg1SjaDP1Bte5SoLwXuBzWlMSt/p+MB8gAExUebY7/B9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TDhxZrji; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so9588619a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 05:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728304789; x=1728909589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuhcTT207BoYyeeg1rSml1YhvWxOKliW74hU35I85Z4=;
        b=TDhxZrji15G+EdBBfGzo2BYYL7rRz9aTIdYe5bC37tEFJ/RdBJ/oRvuy+/AjPX6cj4
         SlCtGZG3GnuY5QD6iLtYpNXrKqVd/APYsclClVtagHLyhRnI576uuLbDTwVqsGipjzLU
         iBFopuDRYi94rmow8weIyh97LMTXdbpmEbPWDLVfryRAUxCu7TGWan0ILUaOsCvHXCxo
         YQQvHuKE0+fYPqbjnT8jOgB0GCPRaWERxnypbQUMnlJCJqaxwRlagN40zzA2uODCRBpO
         HCSPnzc2aLJQqP4zyqdr718G3pmEOLpNpSg3qcEiCQbmnS6XBTKR+aoUtQE9812CCOph
         yf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728304789; x=1728909589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuhcTT207BoYyeeg1rSml1YhvWxOKliW74hU35I85Z4=;
        b=KUrhx7RTIe5aVbZTbe+enGcnADAH/WU6JiQhA0hlHmsXlC4Bk5wBv0ZY+qTi4+w9ol
         b+3RPFjshEuroDFSvLpH/4yuvJqtxC79cS4f1SDbTPzbId9A3ic0WN7SLHqMNWYLEp/D
         xJyLtBpz0HdCpM9h0JG6IyZsmK1zbmKZ2/vIeX4QrsBTrRLCH2nDzkB4sE/W+tp5dqbx
         mxLzcv/VTGHmAcjUoP3efSf6fz7MPoc5V84gEqOreRtYK65YQ72iBJSJczVOV7UX6Voe
         /HqGEH3rxZiQoPgevQ4aF+katFjo4BaULeAypkB80VAbcBU8EmLtubkV/MBBBAM1Hoyo
         QnSg==
X-Forwarded-Encrypted: i=1; AJvYcCVoHqciDf7x6ueMOLA6yntD08nFtOf71wXbCGgwkEesTGSbD/w2fqKaa4gaBEgJqm4IETmUNTpqzO9a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6t4J22GwUOaO/AJeBV6uhz1h+ldXeECs/j+38b22P6J9uEk4D
	Snf5ipbfVkFuN1nyWc2cnODkTU0zxJpTR8lgEvyKUoEkrY3dTfUTCbsqB2qI0rM=
X-Google-Smtp-Source: AGHT+IH4uJtWnmjaVwPOlrjtEv7DLcKyM5zoEla9wX4MrKe8D3yYuCSnyyFIX1r9/Ssik+roi9jduA==
X-Received: by 2002:a05:6402:43c4:b0:5c4:1c89:6e36 with SMTP id 4fb4d7f45d1cf-5c8c0a8ae6amr16557075a12.19.1728304788892;
        Mon, 07 Oct 2024 05:39:48 -0700 (PDT)
Received: from localhost (host-87-21-212-62.retail.telecomitalia.it. [87.21.212.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05bd4e7sm3146971a12.47.2024.10.07.05.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:39:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 03/14] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Mon,  7 Oct 2024 14:39:46 +0200
Message-ID: <e1d6c72d9f41218e755b615b9a985db075ce9c28.1728300189.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1728300189.git.andrea.porta@suse.com>
References: <cover.1728300189.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Common YAML schema for devices that exports internal peripherals through
PCI BARs. The BARs are exposed as simple-buses through which the
peripherals can be accessed.

This is not intended to be used as a standalone binding, but should be
included by device specific bindings.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/pci/pci-ep-bus.yaml   | 69 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
new file mode 100644
index 000000000000..9d7a784b866a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for PCI MFD endpoints with peripherals addressable from BARs.
+
+maintainers:
+  - Andrea della Porta  <andrea.porta@suse.com>
+
+description:
+  Define a generic node representing a PCI endpoint which contains several sub-
+  peripherals. The peripherals can be accessed through one or more BARs.
+  This common schema is intended to be referenced from device tree bindings, and
+  does not represent a device tree binding by itself.
+
+properties:
+  "#address-cells":
+    const: 3
+
+  "#size-cells":
+    const: 2
+
+  ranges:
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 8
+      additionalItems: true
+      items:
+        - maximum: 5  # The BAR number
+        - const: 0
+        - const: 0
+
+patternProperties:
+  "^pci-ep-bus@[0-5]$":
+    $ref: '#/$defs/pci-ep-bus'
+    description:
+      One node for each BAR used by peripherals contained in the PCI endpoint.
+      Each node represent a bus on which peripherals are connected.
+      This allows for some segmentation, e.g. one peripheral is accessible
+      through BAR0 and another through BAR1, and you don't want the two
+      peripherals to be able to act on the other BAR. Alternatively, when
+      different peripherals need to share BARs, you can define only one node
+      and use 'ranges' property to map all the used BARs.
+
+required:
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
+
+$defs:
+  pci-ep-bus:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: simple-bus
+      dma-ranges: true
+      ranges: true
+      "#address-cells": true
+      "#size-cells": true
+    required:
+      - compatible
+      - ranges
+      - '#address-cells'
+      - '#size-cells'
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c55d12550246..ccf123b805c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3


