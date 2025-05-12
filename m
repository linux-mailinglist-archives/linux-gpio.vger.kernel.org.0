Return-Path: <linux-gpio+bounces-19985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF80AB463C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AE57173209
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC0129B760;
	Mon, 12 May 2025 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxOeJ/XM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C9129B215;
	Mon, 12 May 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085353; cv=none; b=JQOXpWxH/yZ4BTiVphuQiRy/0iTcLhebWEbYUSyVjKt6sYXfp3OmX/IiDqZ/0UghHCAW6kUcNanoNvgw2tOXZmM/0Xgr3H8y+0TiaINzTLe8aE3T90eSbhT6kvGee5njzbHX0SujSRDJCMG3xLny6kMAoRoEdTXrnREB8ackYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085353; c=relaxed/simple;
	bh=5+JO0vRYD+fNefwX+fbceUZ0uXE+29KVob5wwF7490I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thZvLMixpfgP48vngyGY+Bunn3mm2TKxbb/EMH/vyDULBx5bbEIPqm1ZxfyFKRe71NricvDr4kqDNldkajLz0dxBykEKXjR6t393O9n9azBa4v0rL5qnEFxh0LeesK9Uglz/h/hx2kKI1uSc9nTL04CtcyKYoQwF0Ya2ur36q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxOeJ/XM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fcac09313cso5655216a12.2;
        Mon, 12 May 2025 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085350; x=1747690150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=SxOeJ/XMd7B6IOBPic9BAoT1du2eLFe3NslZ8xYixXg4LE4AoFPbnpfvQG9JTiPXf7
         7X4M2vcMf+zBT2/kzUn2qg/5gwEDxiDYmXT8wKq3gLLf+UY0CEOVp+dWJmF8vE/T8pcW
         wkL0JXituh2544M3V0Ulkx7ewxyfBJPYi7zKpa6rv9KPvAATprUAcwcxKhRvcuE29/PB
         ebbH0Ogs2DRBSQ8KOuacWDfUKcMTC9oyuqzJ2ZNCAdgwnaDfY43Zphkg3IBWzUCsSSt7
         +GNmQUkUJM+xFHl08W/08vxg6Q7RS+6J9yguujKq2A8Kkgpn6xC44/KyhE3z484XqqdI
         FMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085350; x=1747690150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=skZMfFqVnS4KmF1QKfZybZn49B8Omm/ZE2IxEICmWaH+n2rYVHcpDUOb6RtaoAe6T0
         QZfKo1zTrOvvZBUIpXMV0sV/qLUfzEP2mxIMc2tUMdkHf87tI5dFjEwXRK+pVTg4yyPc
         e2GT8ciaGqDRTsfU4JSloep9Bpjta4SgqrgvI4CEkEkZVB4BErQNeN30DgTypu0p2Pid
         NUX6w2S9aCkyj1N9BVDXpUkM9TLkR+suIJs1t3vZ2pQBjG2GR9bjmmB2YnC8ZaOJm78k
         UYFxR1j8JUu+dtBUDdXu7eg9k9FkQeYueDzLPyT43aaMhZ5I7dGuweu8R23DDmcz/NM9
         HrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK71/s1YvFX8fR/DqeCjAodNsULxLh7t2z0TO3BNr7pEoOUh2uXabFXZJMaDFkDTA0bZUvkKfYX0UV3qI=@vger.kernel.org, AJvYcCUnIYHRp8JOBFVaYUlmWJj+91AYnZ0+BsJfIHlL5iNgAAVN1BfIWrhH25Fod+aLM+FtI+YQDTjgxksa@vger.kernel.org, AJvYcCX32XXTyKecgq/xPaBRgjWecyAMQvwDxk0jWfsIo80AjOeSQPiphfmFmFIPTdllAW0jpMsRRveW7KWie68d@vger.kernel.org, AJvYcCXNyy2WDjvXT+LSkid3I3OOmimLszjGZo2Fyeqkkdy790iXcxfWzAzEyZAhFkDB7a6Rmc4ydLyl7SeRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtArkPQC3UqNTTJ2LPzrrSuCuZK32nlfKj7euLo0Te04kRH5o
	OpHOnZhv+hW13JPCSHi8J2a2amZ9TqWWizvjJSjaUi5C/1aBJ/DO
X-Gm-Gg: ASbGnctNsun5wbaEN3KzZcE8x3fGbH6T60S2mhLjRKDqU0ya/AO2kA9KF1nsNEOKFc/
	klWBjYk7xSf3VejMBZV6mq3jqZmjL3SRMZnJa1iiIqed/MuSV02OKcD4yGgchywwQMz1dFGrByW
	EViZS7lvbP9ZlKu29XOoDHKHmD/xPwctJUm1aWKRBIex/kebGr4OseJwmb4EP/Mi9KSgx/jFUqP
	AwyHb9m4+pkN2WZTc9W7dlUXWiiFWG+PbX1ElIMUEAN4IwAQb2rD+yawqaf8ND/9kAC0LO5N2ab
	6Lpgxm8bw9bGC9hVhzX27mu1Ntm4ZDrKYW6M5eY/JDZq3X8mxWQ+BPxaJvaqyuY=
X-Google-Smtp-Source: AGHT+IFh9UpWB73Gif9/RG0hEasXz8yA7Q30IuXmnkfuwvL7LMAjJqRJGSW/yg1R6sWeJzfxK/H2Rg==
X-Received: by 2002:a17:907:1c17:b0:ad2:455e:6ec0 with SMTP id a640c23a62f3a-ad2455e72bdmr811477866b.20.1747085349950;
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
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
Subject: [PATCH v3 08/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:17 +0300
Message-ID: <20250512212832.3674722-9-demonsingur@gmail.com>
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
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
2.49.0


