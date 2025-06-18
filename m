Return-Path: <linux-gpio+bounces-21730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16483ADE7B2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12406189DB20
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650122877C6;
	Wed, 18 Jun 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEckdRCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63305286887;
	Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240780; cv=none; b=Y8SuGRZfNj6rkk9GQi9zzF0CSjYptDyvdGmewMCdF1MD7HGDIBumGiTBiqCBiFC2ezql1So5tcnjAlUGGAbe7MN97ME2xaMQroK8v3Uo/HXpHF/d9A+wPqSAaQ7Tgcja65Oc/MsUR5USba38wsnKq2iYs/QGjZE48lqm5fhFi8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240780; c=relaxed/simple;
	bh=BiOk7hVTh1ixk4r74A8SvY1QiZzDTb5HmWA7wk75IJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZ/AW80Rw6k+VsO7IlVkEsasrttnNEE94RubWPEYiZBZbG4T5R0wwdMTXhWZopYKqvdahjrqxJbOjq0xrPELxAy6KWoJ7qS2xGSdjFK0qAY158Z/wY3aFM/XUVden9jR4o01suSSqRaaqppRO1Zq0G00JbCeP7nufvACDNQ7yRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEckdRCh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso11691120a12.1;
        Wed, 18 Jun 2025 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240775; x=1750845575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=VEckdRCh+iPB8zRPjyEYggf4t8oz/kOmnd2GaEA2CBOCXaKcJ1dJKAuBWY5Td/JukL
         AWOI8fLmTCfFfcK92yrjvFPmSqWkTXh1LKyy2QfVB3jrFGIdxPsZpk427weRPRhxxvpU
         ozi29SZK6rQZMJHl1mHV+Xm0yCey0mIae60T3JKp75ShXuUpdeczwZmpVfS4fyTkpluf
         gJBjYVpHAgyweLN2SN8DjZ0spfXXe7oF8OgVRJRLztT1LmWNsmFSIe50Si3Y0TrDvlCI
         Y5+HaLNneyh4M68ZZ3i3zzXa0Z50wUiLPZiT+AzUuAZNF2dBladbFBnECzF9LLab7mDl
         rCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240775; x=1750845575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=fk0AfsDtJNwnfuLFCdrZacZ5f4ay8bnZHQAUUfgevfD46Td3tEkbX0ME+O9zTFRtw7
         XyqdptO74h5ulK0b/bml3H3UTVLHs+G4Qy4JydDUqUSRnN+El7pvRGnuneotRuP1DJMn
         45tZgA0XckKllj6+1kJMO0nmhCWZq619PPuewjIHgWYpqU7I9T9MFTJNqfvXYn7IeHap
         i8TP1PV0+YVXAdC7bPj7uT9aPW+RTu7t+cndyNfQQxs4qjRhOO/dVW/sKkd79/CPpfEA
         eiDHmppI9TTjszPgPImAfgN7DSdHQb0rOuYDaO21tElZMouXXoD7cWXjZFntstTQ8qMv
         9eOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGMb4nyQyXLrf4Oz5jVItCYhGcrzyHinuwFC3A2sUJZPtWEyp9wGoxIrv+A5M2z8abGkMES0oxKXimjGay@vger.kernel.org, AJvYcCUZOtrhWon5nD9R3AJSPcjqudSiKLyLcUR8TjDIa7AB2p5qQ1HD0v2RuvNYnnUo/cXvgvCjCw6Upb6yDA==@vger.kernel.org, AJvYcCVjPqwvpJ6s5aP/+3HahjPHBYcmrEWU3/sZX/oH7spvfCglxydEX7bgPaRw15xm0vmHRKOq4+yKTQHs@vger.kernel.org
X-Gm-Message-State: AOJu0YwvZET02HXe/XHJ9F+cA2CdeXfTfMwdMFz3ndjHXkt0VCtaoFzk
	KTEBMAyX7cdQ3tkafbLTugd3E1v2XjjLZoV3PtdMr29mUL777zSZr9dT
X-Gm-Gg: ASbGncv5coSC+P+oTvUs54OAQhIgGyVEhc6BcJUXyUn7muGzwXoPUoPr1+5VhJZGhEL
	r9yUTt/rOcVICPle1+Qo54bqRjHnAtU1kRTBVXItZorAlkWM8o2/mcNKsaQFedIU4zWEJhFFNEQ
	ahV86/P20MBEq4OvmW66wbKThj4RE1nVaZUAvsYn0WPu1G/haP94+RD5YDLDipxe544MVo+zQvq
	nwqHvGDgXvG11ECCQhivNDyv6K4hudf/6H+WHk2ne8iGCFsO1kchS4XlvSccrIRtiL1L7xhSzHo
	R0t58VryOEVYj8nZTxdcylBe9knI5fnVTKSPl203kJqjNJcy6/nANXI68L9b/EKmQE6syarT8hl
	ampC7aDv9Cw==
X-Google-Smtp-Source: AGHT+IF0O7yEFrSOOVfL1bKSJ2JPMdbGKHpONY0dvJ6BBwm5Ud3g1NaD5PYEDD7Z6R13gCb1KZocCQ==
X-Received: by 2002:a05:6402:278c:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-608d083806cmr16928493a12.7.1750240774425;
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 03/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:39 +0300
Message-ID: <20250618095858.2145209-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
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
+      '^i2c@[01]$':
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
@@ -99,6 +123,21 @@ required:
 
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
2.49.0


