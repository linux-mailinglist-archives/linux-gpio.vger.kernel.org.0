Return-Path: <linux-gpio+bounces-23474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C05B0A721
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0032A3AA86E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196062DFA3C;
	Fri, 18 Jul 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiQJuUw3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B52DECCD;
	Fri, 18 Jul 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852324; cv=none; b=i1xvmMN3JofAJIBWMA+tmOQGltiUNXJwbYyZZSL6kr8j/ZJonHcLFsRWu7/DnY8s4djsjimXzYjzwqqqsILtDQ4xVIuahCAOW/OdRRUpHLT1TJle5eFd8K5xr2dWcQZPd/pFKMosNvA29f8E/k6iMB3M3zoXopm5QMIT5tFVIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852324; c=relaxed/simple;
	bh=JfCjVDpNvj/yX5XnYKoO6JDnWfyHITSwgdVL+4kNl1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEhsBuu36d9qtkC31bDfg1TkfZu05TQjegSviJSEMF/aEkorXXCoQRQAhy6X28zJYn6W7vfSVMSPcm9haZ9+MN6gAptpPyXml+4VdWRjQEEbEJTGYXkbyhT2MazNqvr5/+Uh4rROz3ovZoA4KSk7KlySjTAvct1UvsGOf9N0tUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiQJuUw3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2008351f8f.0;
        Fri, 18 Jul 2025 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852321; x=1753457121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=eiQJuUw3QU/aFHiTIPVe5obSOLbirNp+p15vKEReL5UeZxTGZTLkLR4PtKHItqCMms
         louLMuXNm70AofQ0agwnNI13niYHPcGtTn4T6JE6IOlaSAgP3Zi55v0P08YdpOApV8Vd
         swNYbwGKaiBzECukP0/NMVUWJkO7qGGcw5Jx/hZLqOXTL6gAaOWHIW5ABOlyh2nD2pU9
         ZZw8nitzDQ+CWSG7YToHLZEuuRFw8Ua+K4yNIynQLnGAgcGou/5k1Fh1F5SEpwuirFcb
         XZTOrFPXn5az962CcJKso+NJ6J+oIqqo3ZzquzWyzlfvgW+Odc3x6i+SdloTv89AXk6j
         dYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852321; x=1753457121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2xY+2Dp3KHgbNVnY+ylp9yfgQzMwwh8U848dtuhZE=;
        b=X4e1ECsOiKRKnR5qa/olE6hDB6/9WACrFVUi9+6CcAqpLAmpxSqcA3SJiroycmU6Ox
         j9tMiAgcAytFssUv2YWrUum0QbrJZKNS2Hj4+67Ga00/q39GEL7mkpxCo3qDPO2gtPdr
         IDG51EPiE/BYlF1BbOjnviB+ijvHRWlrDiH7E6wJjbEtPVTDPCybS60mFlQQx/bQUNh5
         npIp3lazlnQqKI5kMplc554h+LTKZjVRmrDHuEkb/Oqv7iNYlHOdodrL1SnzJCDUW8CG
         MVvjMxJOejsvZMk/fMid1FjWoao5r2wzvkUQdlInfcJHGaDJ2KqBBbFzY4j8M/tU9dld
         am9g==
X-Forwarded-Encrypted: i=1; AJvYcCVvcblrciEN9zcwmG5kDJHo3WFWSNOH5eyBZtVpY6Oq6l+0ZBipliLqWgkHwG3qXWU27YqGsaSYJdBQsQ==@vger.kernel.org, AJvYcCWTYSm2IxKCGpHe22IP6WAx6SNGEMLLzNuJ2NaaTzCiasvGxoDR5Kkj8WNhb1aB73qe3X0FL056v6DG0czp@vger.kernel.org, AJvYcCWZAR6Sp8OWeNEx/8/AAwfy495y1UaqCOhgafn5vLl8va8vbbm2hml7YITIMF/qjDnWJqzhGKQN77xq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hFDt0GfGck4clkWbtZLNbliHV4bvPLzets31XhOQCQ4ynnUl
	LVNFjWFEkaVy8mAMyQUiM+vnWots4aYNv0hkzIb1m4S30qbkiOVlItoR
X-Gm-Gg: ASbGncvJ5FVgIv9hCceOMIeveddFoHbO7WnagjNA05zI3R5NfChw+wYQZQWLEpK0lYI
	KvhKl1/m2APZA0o8mzcp1m9L7LKJFrELaZ5RKpEeV2M6g+M+wzlmV27iVNuLYkZdoJ7aD0oKJN4
	eBO1KZ/+nxTJHA9F1tMy1JxfLi/M0sXLIbvIq2VuDWVOhzAzrv8JJ2TqRlVnFosT57544yBsiU5
	qSjQobhV0vXaXEb0LmMAVP+L8NjqG59jBa/0V2w1iYXLgFw+nw84r+D3OkuM+uBLn2vi2dmtpNs
	08PWc92O0copirDC8AjJGX2yzony8b3XHGhznlHAR02TYvNNXadaKjpkIhzU9SOLMH8Zj/n31k8
	YlmH4Q6GgZPypG0GIZdw7NzZR2HROswpmYZc=
X-Google-Smtp-Source: AGHT+IFosEa8A5/jx/kIbHSrM7rulfvNRKcdtZAvt/wouq2stq+zX6XaLcWYGLbx0MAHp8UNK5rpaQ==
X-Received: by 2002:a05:6000:4911:b0:3b5:db54:c68e with SMTP id ffacd0b85a97d-3b60dd4aa3dmr11399941f8f.9.1752852321306;
        Fri, 18 Jul 2025 08:25:21 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:20 -0700 (PDT)
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
Subject: [PATCH v7 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Fri, 18 Jul 2025 18:24:40 +0300
Message-ID: <20250718152500.2656391-5-demonsingur@gmail.com>
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683c..9afaa8a7a3f52 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,111 @@ required:
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
+          Rise and fall times represent the time needed for a GPIO to go
+          from 20% to 80% of VDDIO.
+          0 - Fastest
+              rise:  1.0ns @ 1.8V,  0.6ns @ 3.3V,
+              fall:  0.8ns @ 1.8V,  0.5ns @ 3.3V
+          1 - Fast
+              rise:  2.1ns @ 1.8V,  1.1ns @ 3.3V,
+              fall:  2.0ns @ 1.8V,  1.1ns @ 3.3V
+          2 - Slow
+              rise:  4.0ns @ 1.8V, 2.3ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
+          3 - Slowest
+              rise:  9.0ns @ 1.8V, 5.0ns @3.3V,
+              fall: 10.0ns @ 1.8V, 5.0ns @3.3V
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
+        description: |
+          Enables jitter compensation.
+          Jitter compensation is used to minimize the jitter of the
+          signals transmitted from the deserializer to the serializer
+          by adding a fixed delay to every transition on the serializer
+          side. This can be used for pulse generation where timing is
+          critical.
+
+      maxim,tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the serializer to
+          the deserializer using the specified identifier.
+        maximum: 31
+
+      maxim,rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable transmission of the pin state from the deserializer to
+          the serializer using the specified identifier.
+        maximum: 31
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
+                enum: [mfp2, mfp4]
+
 additionalProperties: false
 
 allOf:
-- 
2.50.1


