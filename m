Return-Path: <linux-gpio+bounces-6515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9888CAF66
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D791C219D3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 13:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B37C09E;
	Tue, 21 May 2024 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeHjQhKs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF571B48;
	Tue, 21 May 2024 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716298135; cv=none; b=dWuvHPAQAn5PimbG1QO5qxdo6W/w27CBUzBbecU6Qi6FR8tcxRRtF3VzBvnlB1ffSGyw0P2la/ELzLZ7cNBCo7hEdv8ZGk5mSUJGZeMwK2sG8XBCK1V3gRYAybBC1D3Kt4Sr8e9avLpK8AYjSdad3aY3huex9A4TrOm53cxjDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716298135; c=relaxed/simple;
	bh=bhhIseOKYkrPJ3gVvF3Uffc2Hv1ibToMuP3KH5k/KJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=klSwa9fyGAvQ6MVHSzLAI2Wryw+3UhTHEUdwCwr3UfzsYtiw7ojh7bGQB0HHwAPkWMKhn4FJ+iBpSsqScpGHYdRBWqpCCNJTXhQMTbNb24HEJaqjYqR1WTDTpx9+2W9JVTz9QIIJ09nP7KQp6ru8tPU48d8TTQcKeX18VYkVBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeHjQhKs; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so6191885e87.2;
        Tue, 21 May 2024 06:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716298132; x=1716902932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/w0zAIX6ouScQAf5cgLuQs81uLGtkDo+ykpFxWom6c=;
        b=JeHjQhKs1UQApVqPAFa1aWKR15ZmLguNav+YDHvy9xastoCDdczDJgh33pYSmjpa9j
         kbQzypWtnP4M2DtrbY2l0QfZWz1w1bgTWjvDGE0hi4Xjzv8/La+nEUBQhXgFMkGKM3Vv
         2y69Eh5sP2U4908yJoWjBZgE0L+riBKpoqhphuWPSQ7krE2KmAOM7eqQ/PRTGehxMbZW
         L+o0W2LSNLP5BS8dDGx4G1MzHklXtnhP13fDRFGLKXlbHMiQdkNbjXPkrqcpRLZwos33
         WyIOhHw9tSb1DHpZ4lnGhjjUOJ3vjUEwNYj4KTmN7mwozKUnLEUFWVpmQTTj14sZcRdP
         BBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716298132; x=1716902932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/w0zAIX6ouScQAf5cgLuQs81uLGtkDo+ykpFxWom6c=;
        b=LaAgAhIIx+ydSUjqTrIt76esbUUkwbl0c/mbxAJuSeZxbfqa2uJuZoLLyzDQ9GmFZi
         YLUWq1UyhLrSMpisYKeUJV5hpIULGcx8VliWg4qZMBX0dgOKHn9MqK8rJEBBV7LNGWa5
         uWB159eanVimXq74Y9WuTQm6lp6ZnnEJydKg1htTeP3L95K+Az1R1n0ziAD0JDY91e53
         QkIXZZdnwFq7+jQ/7iRsqNVkKoFSzZeaM+eAzuvINMV0qXC///iV0TVUj9UQUtbsgTjp
         YapF9ELgsLl6Q/gzD3yZ6YRdJ9xepcyFVpvHBEthyzCwVbhmpfPz+XTTDqSAqKSHYS0b
         eugg==
X-Forwarded-Encrypted: i=1; AJvYcCU17TmtOZ+vT7u0a6tERV0j9v7D/CZ7lJo25AhSTD75Deq4+ssvYm6IPZkqhNa/u3Yvpe0+yRpNRaZkRFGWP1uJLNldcDCTJquNm4Z4ey2JMNVH0LDIK8IuHrqGOPdnPjj43Zy4RgsmLQ1o/kSnNHN7q0UjRClRn1QFJnHgubyQTe+1Biw=
X-Gm-Message-State: AOJu0YzW7Ce2pM7JmmCLBNdwrbLCpwQpYZdt6lRTR3nlOjBqgOqPU34l
	9A3GbeW+ho41aJn2zAJwTtO8loBJ7qqgYSaDD/QGpk51zsfPRENO
X-Google-Smtp-Source: AGHT+IH6t2gmm3PnDXJPRecS4mNvTJyigAQLF5t5oAmLFAR1xsyvlW5cI273UFhe0lIH43XoH7c9Vg==
X-Received: by 2002:a05:6512:2209:b0:51b:180a:7b7c with SMTP id 2adb3069b0e04-5220fb76cebmr26066994e87.3.1716298131913;
        Tue, 21 May 2024 06:28:51 -0700 (PDT)
Received: from pratik-IdeaPad.lan (customer-145-40-29-195.stosn.net. [145.40.29.195])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-521f38d38easm4639837e87.180.2024.05.21.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 06:28:51 -0700 (PDT)
From: Pratik Farkase <pratikfarkase94@gmail.com>
X-Google-Original-From: Pratik Farkase <pratik.farkase@wsisweden.com>
To: 
Cc: Pratik Farkase <pratik.farkase@wsisweden.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratik Farkase <pratikfarkase94@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema
Date: Tue, 21 May 2024 15:28:46 +0200
Message-Id: <20240521132849.34647-1-pratik.farkase@wsisweden.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zevio GPIO Controller from text to dtschema.

Signed-off-by: Pratik Farkase <pratik.farkase@wsisweden.com>
---
Changes in v3:
- Updated relative path filename to match actual path filename
- Added `interrupts` property
Changes in v2:
- Renamed file from `gpio-zevio.yaml` to `lsi,zevio-gpio.yaml`
- Fixed the space indentation in example
---
---
 .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 -------
 .../bindings/gpio/lsi,zevio-gpio.yaml         | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
deleted file mode 100644
index a37bd9ae2730..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Zevio GPIO controller
-
-Required properties:
-- compatible: Should be "lsi,zevio-gpio"
-- reg: Address and length of the register set for the device
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
-- gpio-controller: Marks the device node as a GPIO controller.
-
-Example:
-	gpio: gpio@90000000 {
-		compatible = "lsi,zevio-gpio";
-		reg = <0x90000000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
new file mode 100644
index 000000000000..37df0e6cfec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/lsi,zevio-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zevio GPIO controller
+
+maintainers:
+  - Pratik Farkase <pratikfarkase94@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: lsi,zevio-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpio@90000000 {
+        compatible = "lsi,zevio-gpio";
+        reg = <0x90000000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.34.1


