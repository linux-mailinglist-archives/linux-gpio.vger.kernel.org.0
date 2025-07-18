Return-Path: <linux-gpio+bounces-23473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74347B0A71D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975C55A82AE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D281F2DCF73;
	Fri, 18 Jul 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LA9d41z8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ECC2DECAF;
	Fri, 18 Jul 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852323; cv=none; b=V8QzSkyu46ZuG2cBQy6dNiVs0ArjiLDVTtyjf81/3poQV6A4fowoF442LZgNi0Wzp6o/JfZuEdnDsBdTnQKU9pEdM3sZz/ZIMNcEwVy9ps1MHvKMzI8A3poVlvdPGE2Csy8wZqAw7FKDW2hxciF9838gQZqz1O0wbxWBV0782kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852323; c=relaxed/simple;
	bh=hb2tD74FkJ4Z/oLY/veC6PvS/+Yzd0YGgxrh+Xy6/FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjhAxoU/HlhNp3plKscA9mo348b/9Y/pXDagODJ4xHHvyY3i22kh+fMElG7AXZxxxYhK4lgL2/0q0JInF41baKV5EjWwUdBM5sDlulhp2fJn7eXz0VBcU6/tYYCaKJaobjzDrCpz/FDPv++UUKrBGPk42ZAJ6lyL3/z4glarxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LA9d41z8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1383852f8f.2;
        Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852319; x=1753457119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=LA9d41z822EM20R+IoAffx+U0GYEcnYOFhzItp8u9J/iwPCoEkDHLYZ7brAX+6WOHI
         nJ1DyZvnFswk7kqlkBaUFpvb2/7/AMPY4SPHIXrEHEV2i0TVuDU30vzU75nyyGZjrVBz
         J1ibnJBptzit0K2mlNjAAm/VnRFZPE6oa2on5KwP6GcxznevoCC0ja1qY0lvNLyfYq6K
         FnyDfg2UpyD+HjkrVKnqsjqSs7md7hOa+oyemZ0IoRmyFPM/n53qsOypcvUIq0u2FzuG
         QzTL2xx4Iv6PfcNSwLgvRPUAGjFUZqpfbcHpb9kCWAWc7t2fVZLt9YUP2dBCtRUmMOkA
         PVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852319; x=1753457119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=l2Tp9z6it89zKPoljFZY2eW4vtyW/PX0K3bkuB+4yBJUts03ZIQCcZa+rNZXWnSDrv
         QxdIoldS+7CKMEMscFXcVaJi745GKIjjdXtC8sUozdNQcn+MvYLX49N4jBQYQLXTxDyx
         IHRJNGNAnjHUBVLlzCajlYsOpUoJkHH2g9EtWTNkquctygGEYy+/blt50NyhCp9u5Zuw
         ULtfNDkmmIS8BtNC1t0/UtvIG1st9WPo+RhmSieFR4xsJzCIx+0/W3XIV4r4xq87gUQM
         o0ZcqLU1mpWr2ytK/gmRcjP8/yuPNsbrj7IOnOwvvyYia6k8IIQYGu4657WVRqphKN8b
         FtRA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6VZv7LlmHZTTFlXzDS59QNyVWUaWMcVgrF45HWoIA6cYw6eek6IDzMtLj6cUYcQoOyhMFaMCVII9tvuc@vger.kernel.org, AJvYcCWdB6ygJjEnor5QrUBRVgb5OOUIqE4hvL6HZr9/qTDhSwHyjCLz0hTeiP15Kl20VySl3BuD31VrErCiqw==@vger.kernel.org, AJvYcCXgSz5inpFwp17AEmwdPhH9dVbTymaEhHHjofkx2CSzH1LnehqqDykJsdrVjE2Np8GrwSIDigvcXhu2@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUYWk89OvMRl1TVlIfPEIWIac6I3pzoKsJQsoMRoL+UQyd04B
	b6ITzQLjpBkSaulcJjM9LPl1fHw53Egpp/DsgkHuXDseyQr9Vd8+M6Nf
X-Gm-Gg: ASbGnctsfC67CrG6/Sh9Aj6OjjoMkpEeXDt93TAK+EHb9iK74xg12kIa1F+LN+CA9iy
	OUmu3R91rdfrO0X13Ue3ngjsFo+AjxA54cEepmADJFOJbGQIM0RI0V9QAVDbEO1x1hGPjiW73Yb
	U4CcucgWcbjPlCotdV4kUkrpRpAc8IvYJ/RXzfvnMt+SMq7NUEjx1ky82sjrfLB0FGZwYOLn6Mo
	AjtKbeZ6CSAkR4FqwaWehhOs65aRYPryyeC+NHqonqyIe5DdzoM9EZ8Jy8F06B8zqwpDfHkcBjZ
	2R5vAXnsJj7TySErAQSK7adk/4Nm0TokkxvtuwN6Um5KTUHaWjIH+a7xE8/CRzLzsKWzrosr5d+
	64GJXQvm3v7lK5sqb8eKKetxpG2V7+B7iQVt69hRjKSaEfw==
X-Google-Smtp-Source: AGHT+IEnZaN4T1aWyiMymnwtrHibVFWNCN2EyngNMlWV8/LXD9E/fE3pkx0haNIPm6wkD38CJG7rJw==
X-Received: by 2002:a05:6000:2c06:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b60ddc61d8mr8989086f8f.54.1752852319055;
        Fri, 18 Jul 2025 08:25:19 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Fri, 18 Jul 2025 18:24:39 +0300
Message-ID: <20250718152500.2656391-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
index 15ab37702a927..167c3dd50683c 100644
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
2.50.1


