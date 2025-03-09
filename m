Return-Path: <linux-gpio+bounces-17323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD9A58233
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C13D3AD5A6
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1AD1AA1C8;
	Sun,  9 Mar 2025 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9DbCEd2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D81A83F4;
	Sun,  9 Mar 2025 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510117; cv=none; b=d6R2Hkf/u9koqNAu8p/0+p27KBc4m1+ogmef68kwoXIF4/Y0bX3SSvXcxx9ua7YssHEjVvjxLDgEabqlTNvQ/Kqpc3xJIZJw8Fw4E6U07baWxIPTmqrQEAD4lK9AeHgPjljsZJm3WuUNLLNWOv1XrsDWerGtdUs6dxX1lO4NTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510117; c=relaxed/simple;
	bh=OhQYB9SpCW5H9sXdAUEdJKF1vtNpU1SdEIqDFNjZy/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVq17moMnJg4Imkclk0IT8ouOTQuUp3Bi5NYewvoeFk1YN3H4F3xSJIsol+fv3DPEkHEAYLKEjN9NmYoR4YD5YIw+9ZIw9rYNwcX22p+ZkQUjn2qb8vzpGkS5/N2DIFzBesdwb370Yp63ixHqTgi9WhPNGEmR+ptwir6MM/dFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9DbCEd2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf3d64849dso380915766b.3;
        Sun, 09 Mar 2025 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510114; x=1742114914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=D9DbCEd2alvytap+8a+S2zyJeJ9ILzzPQWUmzI6o0W2HbJUHtdMeuP/lFRdIOMy1Nn
         fw1ODFeqgYRlGc/Ye1N8VujclQCqQIRX32ELpgQiwB4vZblzFfFiv2TMhH/cw5JT8MDI
         rGQDw3ViEMaS+25vBLMTVXRZdvCRrpEjHL+AOZ+MWVdiD141FcjP7YICl7uuAlkmE5P3
         ODdeoN2adSJaJic0EkVF06ifSth1escPcIwLpVLaVomonY2t+g4Rv97S6o+aLOoqeljE
         /rO+EUsuKj44gkZEWAEIJeCccyFuTDnFKz+WcR1bCmE8s7pwPl7w8ql9N704avvi3y6H
         eV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510114; x=1742114914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj7QL9uAss+Ow9zk6InOH2HUb1Xra8s/78xy7RSYR54=;
        b=ArBU5HGsXzwLLnZQFo6LTN1bjf7EStWX/NEZSxnU9p1H2EtvUHNY69xtTJ3BlBiP73
         e0xEXO6hObviv3gxCp+sc/CoKpC/RE1iBqIb5wZmDIy859TYhSJe/SqIPOsH7qaiADpw
         ZwASJ5Jre9xvC3KGr33C4aAzGfstZdvY/Lje7UF6deQVaSFxOpSD+AZSmEy6ELw/iUeS
         2C0yOUk5teGTI/ug/bNIi3i+37jUxmi6JTjTzonIbGB2Mti9XeP9RvGLwSWcviD14vvL
         P5RYHvUzsXCiEuLC2AMY+eqqdW57KhT1h9WrluTR36hWsUkgPmu3G+QD4EXYV365payi
         BOmg==
X-Forwarded-Encrypted: i=1; AJvYcCUswVsoM0BsHXqEbcQxpZpN998ET23H9ITqdAEbh5Ekl+URRBd8UNfTr8a5qo73FQL2u5OQW8Vcbb4NWoYt@vger.kernel.org, AJvYcCV67KfmnGkUGmdaqVBatQJ4eP41AVXHvreLOWRZigAbUzbEGAA0g6VbLWP0FhCP9uwMtTkNOstJsuPO2h4=@vger.kernel.org, AJvYcCVzE7AzIzWQHsdXA9LaHUvYh3FnkL4QmfLR179P471cYrZD79+iAVfbEdgRLhUBgS3sFIJfkgvISuo7@vger.kernel.org, AJvYcCW6ey2JVyQY8+VpN/Znus75jbK6QGSUisXZ9M5IXxbjZ6MABDB3aB3d502lzmyJsnpM5OGQOayY4Hp69w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBWVh7YaiJ5pWkyQbvUfJij3EsSwp3NQrtw1YHmVAEz7Pq1HT
	vjw75o/aostogC2C3rGmo/sp8Vn2YDYamkHH6DNTOYrOefJPptEN
X-Gm-Gg: ASbGncu/AEczpXUJPvC9aCu6G0vMCJNsALzpBwXUkLzGAVxX3M5gwIV3D4vi8endvWp
	zf0OtH0C/t1zyVn2lLGenvrQOWBzT3x11k8BhdWutlVU00UsMCiAVuNUdkVxK0/cvFZ3yGBI8mJ
	XQY0Z05C4BD0RWGKW0cdV9oo6fSY0adGyqi9PJPAFH7BuNvQqvIngVvUiZKAW/TK19fiuq0nziL
	WMB9VYGcl73wlP52jjjNxfOJbac+SzoIkKvOw3dYsJ7bVShH7+CnBQVUroCFrwzRLQ0j30tPfTx
	w1F3VlbxhhTYr2QMJ8Cu4t2DR+5XD7RojqDLbbnYGMrgND1rprmo1Q/wqg==
X-Google-Smtp-Source: AGHT+IFm2koHNN7A12mxTDrUb8gVHG703Y2Y9Icivhx2dsCJHeZ/vLMfvZOA/IpeXYW5hItMXuZP+w==
X-Received: by 2002:a05:6402:268a:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e5e24688d1mr25168696a12.25.1741510113522;
        Sun, 09 Mar 2025 00:48:33 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:32 -0800 (PST)
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
Subject: [RFC PATCH v2 03/16] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sun,  9 Mar 2025 10:47:55 +0200
Message-ID: <20250309084814.3114794-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..dd28cc397674 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -91,6 +91,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@0':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -98,6 +122,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


