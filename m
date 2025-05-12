Return-Path: <linux-gpio+bounces-19979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74680AB4622
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A67294647A2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C2529A32D;
	Mon, 12 May 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHzSV7+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349EE29A31E;
	Mon, 12 May 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085339; cv=none; b=fXpVEj2PZArYRM36cPTVWv3vk5+fABQW47LR9enmNE5dtsRjeJFyOvdNCSKqM2YkaIXhPXfo7WVDUgMQGc7BbWEv6nj32o9kv3/TXCx3AsD2M3gFGnDP5m+551EDlOoJ3gtKRDL2mU3mDvZzxncF2xjcEMpLG6VSUqLZJut1/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085339; c=relaxed/simple;
	bh=TVTa1or90A2EcNKApNpwgoujqc65zgifofFMkE9RT6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V28bKHbwSQxxz2M8Odp9LyBGWCtwftSQZ/aqEpWDNka54q6eSSz+8Clu1NKN2dtHqepf3nXXmu+fz+MCq/rFxRz/1/w0QU997/oec9REAjJN6cEUbqbZOkgXVnjaADpZnTQJdF0ybSSbG5T1WFiz7ICkNPAnO1z7/v5mo/TUPcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHzSV7+r; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad220f139adso607423066b.1;
        Mon, 12 May 2025 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085335; x=1747690135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=BHzSV7+ra2+HrAq1Ac56v5bLxAYHm+PzbWq5ikv6ZBfnM1sfEjqd5tqhtwdvXNoNvV
         GfA3iospfalrgaJKNb7iacIFsU9q9314V9Dzv0csA2gc1v9UktgiIb5QsS6zTfPncO/E
         R4F1DSFDnAFCf34LzstI7c5ULi97PIkne2QOl6t443LK/hx1apyYFUS/aLJoJY/rK+jX
         JIuvAYvpJ/gSbUzXK9P/IKq+4nr1S96Ska5MvF3V7xBD1RgCl6fdKFQc6P/xdlB86eHL
         GT66Lh1iixgrrXhup7euSsQxL8ryNK/vkoG+LswrTqKc1Nx9qdkxuskajxL6NzFu7cmB
         32Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085335; x=1747690135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=wXVe0G6veAhC2oLkiTUls4Y7wz6d7qOQiCYEUd39y1LmAWRdDOE6fgBOMf3RVxb7kQ
         6hqCgLGKeLfx/4RXAVcOnTxwv+Lu6stJbEI64OGn1BYqYqAvkIdpNl092iOjymW5npMq
         PD+InzZW7lfBj4tJxh1IDcQN7J3eNp2YWNg+fMx+6BwHnyTEANAVlg8VXjDSS4yTe4Q8
         BqJmelJtvFLjgE+WVV1dggcqUFh3vLxalSeXUm8fDPxbNaxEWQ15sX408nZ7VOEmadu3
         gb47NLkIORnqei7Kd5QXtd4FEMT/oPjlwdhbotJPLzRQFIsX3s48UYdW7MEA/PA9kunX
         q2OA==
X-Forwarded-Encrypted: i=1; AJvYcCUknmWt2NDrFLT/EarA+oiUMlDAJlUjifLH8PEmSLxL8YmmWCtBPeDVjRA9MfkOrYy1lyTEvBWk3i2BNg==@vger.kernel.org, AJvYcCV4RLndD6RO5gIHY/tnmgJq4NHieVz04VCMhN/782e2Cas7o4mC3hu+mXLPyTV/v/biKPBBZNfsZ0+v@vger.kernel.org, AJvYcCWIl87X6VbBKMg1/4tvFwDVbfWrcwluvpoghURLfKsH7I+Ex8a27WJxqI+Sfik4nan3aa15OL20mqCk4h4U@vger.kernel.org, AJvYcCWUM0yfh/xZCTG0Ssx2vAsvglhQMTP3EOHn55FZwX4Ai1GdKTyEGYpzWWbpzF/ftbVeuUYqsTVefx4Aefs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQX+mWSqyWdLiNLBpgMcXNJZOv3VzL4gvjgekZ+XkbEdGK8w4
	BtW3I3UaRTPL7OcUxyuTvfvoEn4SjT1THulp65AK7hKEoIcAu38b
X-Gm-Gg: ASbGncumVIU/lIPJfp7DmcVnaw0R/B9Mqr3939DFliiDcQOX8Nk3VkBGZnxl+JPrHlc
	w50S1R11Z698PlAbGT6Tng6ZlIQG2u27UE5RV5DKZ1jlx9Z8mhniM/YTI66PGYonS83rukTHBjJ
	sk02nC7qetDPGN7//QL2R574jurlHFSZNC9sNSH7LFRkiGosMaByK66lcJgIr+rd3LG7dBTLZkS
	Eq9oOixLn+ZR8VPvik9Zdt09WBDFbHVI1502w34SZvjP0rROSFCtJstLwVwcPaGhEeZ6BDpKyPZ
	7ssUZ7Ai9qHiBkjY4DnrwxyjlcQIlyVrUNOtVwE0WwsOqo4XxSgcMjXeciEuZBSdJYIrSkBJmw=
	=
X-Google-Smtp-Source: AGHT+IGZYGO25xeU+0WuvzEPqbhgDfa90J56T8yELtvmAfLXs700qoIgre4bbS1rcOkKIGUXxI87lA==
X-Received: by 2002:a17:907:c316:b0:ad2:52c3:2088 with SMTP id a640c23a62f3a-ad252c322f8mr489370366b.25.1747085335042;
        Mon, 12 May 2025 14:28:55 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:54 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 03/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Tue, 13 May 2025 00:28:12 +0300
Message-ID: <20250512212832.3674722-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
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
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
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
2.49.0


