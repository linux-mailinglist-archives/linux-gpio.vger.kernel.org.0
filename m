Return-Path: <linux-gpio+bounces-17294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3013A57CE5
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BF5516C0D8
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB35C2116F9;
	Sat,  8 Mar 2025 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmGXP7k3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED0D20FAA2;
	Sat,  8 Mar 2025 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458888; cv=none; b=p0FrWIKk4hcaleHSfIEosW4faH/IJTm7+BVg06xAH55lO6+scXyRPSocPcXEZay/Qs05judsXMDUinEDaUw4+FXRjlTvM7kWRsETpJBlHEQMARZ8Q9uTgy0v5Hhl2r4ZLspvyxG0zaA+rOFEV19us4vsZySmooltFZUN3h9fXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458888; c=relaxed/simple;
	bh=JcNX+Uwj8MrIGD510BeCEpEVIg+bwj5e+9GO+9IhS7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1Nrz9XO4uCUVWBUnu9g8BRA9snwyecnaVyn6aJopBKta1FIjy6IC8MBRUsNRP4ZWc9JJZuFJM4kx+W+KnT+nJarbO3Oov9rEDxn3qhvk4rRcg80DE8uMjQlxXb3D+DbeUVuOOTn7jI2QljvVnShnsaFDvsMluIEVSsc7Dz1KrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmGXP7k3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4248022a12.1;
        Sat, 08 Mar 2025 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458884; x=1742063684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=mmGXP7k3SZSDdVAdUpA4k6ONX6KpRfb2jojILfC/uuhu/zAPHxprcUNdUbuZ811Gl6
         Yg6npTW17Q2qwMndLf2mmkmdjKk9IfPy8jqyDb/s1qAXB+BnaPaUPUW/mHRfb4B+9Ua4
         Y47LLLkP36sEcurfG4UMwbgtkwgekFqohqA5ufZSN8dt9g6aCufz0QjPW84dT11W2B52
         u0hAMP+JvhS2rFT+b3CBQUFzsLz+GWlmIvWB9AUWzfFZur7zjvze8qcvYao1+ah3kzwC
         YVsOtvu15CxV8d2ZGXF6vhYC7d8opKBgF5xGzWn8D7sJ+CfCMU5EtZQRVpMhwFQ1NvK4
         7i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458884; x=1742063684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=bfcgwB1ITgYb8CXSMbchnKhQiym/AtUyHwsG1IkLnoD7IfXf9H7ZnkWEy1rISjfIPa
         kOKAtgUToU0dRIrGVxYKho1a+rb6bRUCcXntgkuC+0EwKVJprUnxgUwmCmDonLcMtw2B
         jfeNXH/esvd0OS8BKEf5dIbbC/3JJUR4eGIL6Eq5R0rbUWUXGsJeYWy2UrXcqDVdo7FQ
         bqRcD9Q05O41k/cC4KpT9Zz7F0zaFpJhLpM/9W9R51T2n80BS1B7R5Z3rfBZTqoyMxw5
         vkYtUPxLLTgj1jOPpRPHRzqhbj1po1IXEI78b4XZwTvxlLidDcVtHmnaTJIDayyEqkbT
         4lyw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3UqNMNXHLCionUTky6M0rajst/yskBtZBobDDdKpulqhC6ZuZu6aklEn3B5B3c7n6iqQIvh7uks2@vger.kernel.org, AJvYcCW/k5FHvd2sgvr06ImLsE7rBes9xJ4cGcVa2ByVt9ocFVddMCmDmI6CUnKV0zvN75kQZmXfUiX1DAaoh7SH@vger.kernel.org, AJvYcCWW8hWjALFdfKu0AsssxmKBR+RCXK/uJriWAQ41ChSvi/Ox1XdAU65vIGkN5QakwXtxWkdLlUNXA73Qdw==@vger.kernel.org, AJvYcCXXo+iOfu6BZoh27YuTjPy8GY1jDQIWyEmvvjCAKUh+koVBoSlPY7kWdcdFfFfS2GodF0Dq7ikF8MtBIDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcnd+cU/uNAMPZV/yVa2aKwCsukkX8tGGO8iMGDDgiRAk3VDaB
	2Vu5ygB6dgmSKc+eDtxPvyRlvWeQaZMvYMDVzHUHdi1qrkpgQCKB
X-Gm-Gg: ASbGncvjkrH56ACgJ3H+Sjio/YYe/sQKRc1DsjhQlKpRoObB8dWRZC2Q3QElyV3GaQY
	eux/zIyH+9rDCM/xWA0tR17B9/Lf010r3NP/Iusb4t4yNrpo4RvXf1C4cERDezzhkooNbHU4hVQ
	bFpnIMwbPAgtv34BVFXp3LGu2Qedkl4XHBakJA6pXsjdpiknFNqFyROBkEDElKjHt1eQrd+2GzW
	Yln+w0Fwp43YX/uFYhEbOBh5d4M2jnS0r690BPzaMls3Ae7vEfosOFmoJTUJhwbNdq2vbuxnn2d
	P69rcwS8Ew9Qcoms1yDtr+jZn2vZOSGkv8UcLaZQhdl4bGLmy5FmjiSP3A==
X-Google-Smtp-Source: AGHT+IFNSueh0kjG5Dw4oKrSBt0pxkCJRfwG8SDYdVUY+KWspoiw5fa0VzHeIZu860SzagBERe1Ohw==
X-Received: by 2002:a17:907:a4c7:b0:abf:6f95:22fc with SMTP id a640c23a62f3a-ac26cc768f8mr411691166b.28.1741458883641;
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sat,  8 Mar 2025 20:33:33 +0200
Message-ID: <20250308183410.3013996-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
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
index 000000000000..9480d3127643
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
+    min: 0
+    max: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    min: 0
+    max: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    min: 0
+    max: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 7d77cc9dcd96..20114c252e01 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -88,7 +88,21 @@ required:
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


