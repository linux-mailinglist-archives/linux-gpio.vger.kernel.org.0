Return-Path: <linux-gpio+bounces-17324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9BA58237
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B72C16B8A7
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9121AC43A;
	Sun,  9 Mar 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcODyjO/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F021917ED;
	Sun,  9 Mar 2025 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510120; cv=none; b=YBo9nalgtXpSOOTjt27+ylK6aSbVCaQuxXjWE+qhuHKVWT3fJDCeaScJpcp3/kXJvq39sCY009pd3/zXkEG5nm0jBFJLULvgDvsa3G1OclmuT/PgKn0A0t4zjLrEIYCl7xbgKZviW9Xp1gIndgjnaUz9mDSuZtf6kMo8H8DDR0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510120; c=relaxed/simple;
	bh=HtLFBeCZH9nn41lolrrGB7cnQRuzm4PKv4E8Y+TUXz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqmi0ARwVrkYL/uWybF9Y1DXKv8P97KUkDSchl/J/zBodj25Rn9QvV7GAgTrKTuAA/t9Ygyv7coczD5DJht9QHU6ZpMJPBBfbf+pMI/c7WYwVMR24TxZSTT0bnE6slcdXveYIHsROaeGcFLI/Um6fuuYEazA/WzessReSwTpIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcODyjO/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf48293ad0so520363366b.0;
        Sun, 09 Mar 2025 00:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510117; x=1742114917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=PcODyjO/jvwhyqnlfxgidVLed+nTbh6WzxDR1O3auDDjJTg275g1Kt1/kA5x7eRvFn
         ml14nQhNdiYc4pVglRnVsSZrdnvYA7eO884XaPSTGYkddAnTYkl+zE7/I2wzPUldSdhw
         Nq2Mi6mCYEGchBHBEazuhBmP/d3wiRvLLCN7epaVCSulGDwXP2TWR5eSQNkManIS3yGM
         YrMzSNuOB+bsu8czWni5Y2PNI2Sg5J5JwdECVXLCY4aQCfFU3PGg1UnIU6es4ci6u741
         GEbW0OPKmLzK0w+wbjQ/CkDc4gUSZxzvUPVVOEvA20zWMA/VAWRLvdJ9mAEJKmSD4LyD
         1MPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510117; x=1742114917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=Ny0sx9gu5w68/VzT7R4T9niSjosgPZdMqxI516I0YRXAQ15Cb43m0NvIopDw8oRfpE
         O/fSviZYyNFagxzqSGoHtmepaPHpJKNj8iqRAzElLW3mVxRjahxio8nFs3APfSD6tfM+
         rOu8Uy32Q4283+Md+GwF20avhhCMCfTCgTmovNgiu6AJ2/ZRsA/OQAfDSWZzIK0mFP8n
         lkXJ/B7jSDzsyFHUHGAx43XztgGc1lon8M44K78sP+3TJMr3x8g/bgz1BmH1jjf7A4mr
         m5gMepd5L0l/SiIzL+0CCuAmTdOVGgE9cGTOwtCCYZ9sbJrdRgXnV7JJtVFP1a3b3eXi
         7c4A==
X-Forwarded-Encrypted: i=1; AJvYcCUS7xf08wWGspngvVfj39KQYMm7FRxKVGLYBdjIjSEJzYZHsZig/q2YZDm/xxs7liGTpDlAerk82gEH@vger.kernel.org, AJvYcCV8E9evd1xtmMBSVgXlVGn1PEJ7q8T5xaWJvdAe9sX6bGckyf7+PqrCWojM41hOmN96ftrRMzQ5Kslp+Hqo@vger.kernel.org, AJvYcCVurt7umJrMwnIc2EuP5OLZw23+OLTJyMepCibF7rsNKcpUPvmYJ1+TVGjjycSCqvREyc77dHVavvnAyw==@vger.kernel.org, AJvYcCWFLYmsK63p3tuLto9X4plMUBqnhyd9F5ZOs9NxsKtNnoQyH43M13ZNxHtF8DyLnvnFgHKVeTlQo/QSxHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyopQWkv0koMrjkn9Ug2mV8AeQk9QuHurCGzpvq9H8RFq8CTx0
	VUhXa9joJjteWazncoFNKNDtjXBdE2h0fA2JFKA3tbECThK1WMV1
X-Gm-Gg: ASbGnctQ+Tu08xGJeFyXeBgOOs9KH/J31OnExLZmux5vGxVLOy4aUQgXc0bsWWCczxw
	sAEFcfUc2aBRUZAl6/PhvXLlTrK1CE+vl0cKXs8c2SFqmKl2PvG+2oKIRv3/dsnKD9K8YjoPax3
	Rzt7lKouSrW5onywXb0S/8syttuVzYeuD1DUbsMtghqPHoHsS8gHOcbkETV0YaZMQ/em1WoYHRc
	UETqsPEXOpD2PINTo3u9dj2BU5wHOr4otJqtZ5VfyQP/vdQSPkFfkEZnRyEZO32rnzp9l+SQJTX
	niF2uvQzMZGeijl2sU+5JusXzcTVaPbE3PT4YJo5QNAWyjjuMezSISq3gw==
X-Google-Smtp-Source: AGHT+IGD8kViV//YVpWgVRhDxEU4994VL0wz2et/xPmoDQOHxpV67VDbfzsmYHx+eVCo0QhuL2340g==
X-Received: by 2002:a17:906:b20a:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac284db5ff9mr291074766b.31.1741510116313;
        Sun, 09 Mar 2025 00:48:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 04/16] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sun,  9 Mar 2025 10:47:56 +0200
Message-ID: <20250309084814.3114794-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
 .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
 MAINTAINERS                                   |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
new file mode 100644
index 000000000000..347e66a5320c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim GMSL2 Serializer Pinctrl
+
+maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
+
+allOf:
+  - $ref: /schemas/pinctrl/pincfg-node.yaml#
+  - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  function: true
+  pins: true
+  drive-open-drain: true
+  drive-push-pull: true
+  bias-disable: true
+  bias-pull-up: true
+  bias-pull-down: true
+  output-disable: true
+  output-enable: true
+  output-low: true
+  output-high: true
+  slew-rate: true
+  input-enable: true
+
+  maxim,jitter-compensation:
+    type: boolean
+    description: Enables jitter compensation.
+
+  maxim,gmsl-tx:
+    type: boolean
+    description: Enable transmitting pin value to GMSL link.
+
+  maxim,gmsl-rx:
+    type: boolean
+    description: Enable receiving pin value from GMSL link.
+
+  maxim,gmsl-tx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while transmitting value to GMSL link.
+      Default value matches the pin number.
+    minimum: 0
+    maximum: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    minimum: 0
+    maximum: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    minimum: 0
+    maximum: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index dd28cc397674..0a43582168a8 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -120,7 +120,21 @@ required:
   - reg
   - ports
 
-additionalProperties: false
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+      unevaluatedProperties: false
+
+    - type: object
+      additionalProperties:
+        type: object
+        allOf:
+          - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+        unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/i2c/i2c-atr.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 8f463ebca056..f8ffb7cff9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
 M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 F:	drivers/media/i2c/max96717.c
 
-- 
2.48.1


