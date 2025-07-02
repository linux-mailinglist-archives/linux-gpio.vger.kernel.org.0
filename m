Return-Path: <linux-gpio+bounces-22627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82951AF58C3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8424A34D3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0343B28AB0B;
	Wed,  2 Jul 2025 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLXJPCPR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F828A71C;
	Wed,  2 Jul 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462494; cv=none; b=Nuy/5pYdCgX0YcJ/5/GF1F6xhhXGwpuqtuXpHNYJssbYSXNLyHpVr2G3M9bbHIvTbMNDu2Od9lfhs9wNMgneJFMtO8dT020GIYCl+m00qon755EBSGs41acauX2bJkdD5jUmHNZvlekupa7pBh2WmwJH1VRtw6fwzPGqbCtOZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462494; c=relaxed/simple;
	bh=26/x9bhCee1GLgPhFD7VmVBVe6ZIvMGCVPtFrfPwiwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDNt0+P4SJz8DdsWbjCrch+LFfG9LjQrzxZ6pGXMVLsNy42/dW5eacjHHu6lwjyi53txx/GsHdK0SMSBCjn2rKcv855GMx2c3QZL4xhJqhME0x0M7g2NQ8INJj7vap5xEeVBQTmJlF/X7AjkSrHqnNRgUlzfOQr063/ic32+jjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLXJPCPR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3b336e936so325678666b.3;
        Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462491; x=1752067291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=SLXJPCPRFFYGNTVoxZ/h9sDCdR3QKn9kOP1BPbUxqM3LtlMfBQKOfQ6g6nDGVOPFhC
         ybMapKzY5PhHutrDM0Xh+kZLVMjFaDI6lD0cvKOv7wMaa/EOq8D8W4pUXTacFmpsUzuF
         ctesAPRnBVplfz/5s2iQJg37n2lKIvWypqYLrYmTh+cS01P+AiLHK7C6KpD2gqTrlgq5
         24wCzTsAxiGM1tfS7HZfh4zDXONPPTIJj7aryPe1dm2CbiLqYgwtQ0LR18zz5eYAuVk6
         YazfqMVmQixmdVR4LnxwpjXkNVmD2cx7JQhSZdFvwlswwPWvB4xuNF52zyADjV5FKxFr
         Dlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462491; x=1752067291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=mNURxmiBr/tRoPRMzdqlt6dKRXefblSWrlIQPR9oMFhRuetYGuEb+2RK6D39jGQpee
         Ugbh+y2WNdj7qKMmPwS0TBKi6l0pOuHpODKf6a9XDRzJeNnvNJmSICoZ2S8TKr+IHgpb
         j9C0IHT9pC0JbajbXZOSjPAR58Utr9Mu+nmD4EKIr7Q5lshfs+0nnvhE9g4k0ZOY8Db+
         UqeMBykkg6HIPh74bLoc+XsSZHPR46Fg9UJONThnpE2pKiTDhdB2dzRMRm026jGc8hBN
         RR8EDeoXc2brhOrUTmooisNgzUPq6K+AL83SYPSSOlp2T9FHU2TYT51qt1tLUAT7zc0Q
         IJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtXk3OKEuY9f2SROH5HLEtGMjHStAuY/zWOeXKhuEG5+zBfgCuXE6gi6DVHnS/EEGXJRx3bhqgZ2scbQ==@vger.kernel.org, AJvYcCVeo+q1QsSuogOmAt9CfWN+TUgYpu24+I/fpMkxVeNEajzkE5yt6QWHENjM6/Z/JnTOA/dpvE3JqTkVl5TG@vger.kernel.org, AJvYcCWU80qh0AYngMt3oTnTlH9IpWU1SyJ9d2Z1nABZUoYp9p4p3rMP4xv9b51CZ8blh8lsKpng3KmHPZll@vger.kernel.org
X-Gm-Message-State: AOJu0YzNi0VQADE3ILuXLDiCEFJWY+GO9vSctb5bK5mg+bg7WiMs+el2
	EJilsIs8eanTDBbO1Xpuvc5bA2WzdNW5I7qxZbLazvsA7waEGrcOG7Nd
X-Gm-Gg: ASbGncsu4S+wFxs/pJ1ub9dIsw8zLQ8g9rZrottsydmCf0zN8ngSNVFmY6afI6c8bpG
	eBmOX75hu/HhKQ6bAlRGmXB+CsMxWLgZX4t3F0FEDwSZ8QTKleprHYi8ZeObprH5kzPYuwPtYTI
	Ps/daSECOoVqoqM5yRMGOJig8/9sPV0GgiRUXUjSoAL2Kcg8TbU65jGuaynbMRqBHlOtpuGHtj3
	7qB2LFIZpEdHeVZXOyd/F9TdP4hUulxZ8TlOg2I2tWvMbqEpBIx1Rk1LFP05pLWriCg9u1WIGgP
	rIZOdRb776ZXGcfydNEyjb374/5UUJQ+iWICCiI9SSDGy0s88WJM7peG7l8kF3Trp5+HlKgATHM
	=
X-Google-Smtp-Source: AGHT+IEVB4ll9itBxDfBnk9pldAGA6HiQ0uN0SNjS5Ea5oldB9uz1gq8sAy7mWtaLvGL1PJ7vmEutA==
X-Received: by 2002:a17:907:2dac:b0:ade:4339:9367 with SMTP id a640c23a62f3a-ae3c2aeee6emr283944866b.26.1751462491004;
        Wed, 02 Jul 2025 06:21:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
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
Subject: [PATCH v5 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:35 +0300
Message-ID: <20250702132104.1537926-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f..758c0223977d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
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
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.0


