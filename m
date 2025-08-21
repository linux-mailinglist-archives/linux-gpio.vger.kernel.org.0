Return-Path: <linux-gpio+bounces-24772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AB9B3032B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 21:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A36C5A140C
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 19:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D48327E041;
	Thu, 21 Aug 2025 19:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaIU+YFQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3354F1EA65;
	Thu, 21 Aug 2025 19:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755805656; cv=none; b=KrnSuYxwfQ847yhfW//+BEyd8kKGx0EqMUsX/GO7FIUVnDz2tULAmJp0q1svJnTBOBJDn5/+8LlxHkaunzH+08lu0ot3hcoL037LF1N8LAK3zg0g4sZP7v8zDz/FqCCdM4ShhZg2FHLQOAy4Rf3/+ScplJdyr4t9ngY7R4YFVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755805656; c=relaxed/simple;
	bh=CoGv8RcpoVG47YjNA1FVRXLasWqQUk8AV1MmIH1kGPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cOLRh27IJ1PzTNOs393M6pihCfK8dZMG1cCOdIEBVzh2n3s0UOVLG7zP8z2+Z667ffXGUVx0uE1KbL/b5Ztuylp13UBuBU8251otRLJwLjQUloCYKPwCVpcxHrOILK8PoWOrGKyc3tn1hMZ1b8tm9yylSqOMPLP6nsM6PZW+kG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaIU+YFQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so10299105e9.1;
        Thu, 21 Aug 2025 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755805652; x=1756410452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk2MyQWIpVgT0DryeqZ1mPWw+HywqmfDV8FUlVIzj7A=;
        b=iaIU+YFQGaLzstasIvVPHawjZKjoc3AnIn+KB+s7Gdt87QFQOkSDQniG1HLf0JlpZD
         ha4J/sozZGtlAi9fGfHDgqC/ZyP0+yl5gkAxUFtiuFxkoCLFCAXYc2s6anXdUBoNVFUG
         u4MYoTOChwE0cqB2oGNOXnaAVNI2N7A9T4ND4xP5wHaV2MPcQL6Rer+VjJlsBKbGjnPL
         tbjc0ER609DEGQSH4YbCVQum26BaI+GJC75GKahiDhhlkz8yk++Wk9FjfBRLsHnIM9Sl
         G3DiD+Ygux9mWl9RwIP5MI5JpmHywMRfn0LSKyNMOKoUic5vfz1wPhRnRsP5bQ3Fqkb3
         GwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755805652; x=1756410452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk2MyQWIpVgT0DryeqZ1mPWw+HywqmfDV8FUlVIzj7A=;
        b=emnYsJPTRu8k3TKGHueL5C58NPQ5qVTWJh2EtsCZXhD8v1Bjwxj/Sklfahfnlq8W1R
         UXJWM0vEik0RYrFOJT7UO57UIkGzpv0o03MZh2kDW2ibDRq61To2AFFTX0oBwpG6crjz
         RamZe+mD75OGob3KzinDbZ9zBEBR6mEQl2TLhbIr4lZNPaNMzz4MMef1ZzMxxI6J8Sl+
         XFVLmVq+J5H/CnjW0jCMwB17kr9Fu1CZNCSn8QLYaIGiCYpIghqsG0wPtkDbFBfIGtkA
         A5BQ2sPIJsB+Xfq/vAjYPqsEVnVcpI3/jMzqYv2x1frMXsGAa2bl0NaOQpIY5dWIdi89
         HnTw==
X-Forwarded-Encrypted: i=1; AJvYcCVqgBzrjI1zjTc/nYqcKyULPcsfTAyCmxTA7yqiQ6LSk/HGDRJnmZxRW48x/XG5y+SdJuk1niK/GE0Z@vger.kernel.org, AJvYcCXNmyedeDQjyPoWSW7ENhkqRMyP9thWYRRqF3iJAWiiwLk1vgBBXGq/Kl3iS08Ehwb8OrOWV7nXXa44rTeN@vger.kernel.org, AJvYcCXPDlG2ILHGghX/SBAXKgSq7jIDEthqjZautL/l/OU5LJEHmtF5G/i7j/Nlw68dEjlcjTTcT+eYNRBKCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl6N3XSwHrhxItLKEBKe7d5SgN5RfLC3MMRV9HCWEnlDFTdzwo
	0tMEr7V2iXfDe79WtT9q6j33e2ykhRmMotpaRh5IevTRt5SWqYIC4Js=
X-Gm-Gg: ASbGncuXTQsPxbhdPB46XweilTwe/3jHxEMC7PL8BvraBPllcCW6/LpHp9d3CQ+L+jK
	x7/cGQNi7LRu3Gc8Jf5DZpGdLxbkzf7Wayjo8qmmTAkraIAgzY5F/U1Wm5s21cqgo8kzZn51ZML
	G/ml/ruYxgh/Fg9f3mvQACyJyoOOhc3mFThXL9uVU/diUmqfzGF4DA6+Ge+UznYq/EskgKqUkiz
	z29ZPwJW86qTZ3bPU3PvOE/f3ymoYfN5bAZ/uATG7v4D7YIqzlTKjFAYGWPcJhmRhYbZ3q2kh1t
	8wmlcDJjw0vTBQNRIfdPcH8XvU8F6Wby8LjacsGzvZ+0n4Fgyd1Va/bSL/Vl9lX0rCfOm+2w/o/
	tw9q8Su0oUqRV+5dpXCm6py4GfcXkaX374YIK10sLqFm5xGo=
X-Google-Smtp-Source: AGHT+IEWs4m9FMp9lKhy3iv5a6XxAf8a4fji+2hVLLN5otIwqyq2NwPhIa893WoTFWcYdRCNexE8kA==
X-Received: by 2002:a5d:5f8c:0:b0:3b7:8d70:dac5 with SMTP id ffacd0b85a97d-3c5da83b60fmr168731f8f.2.1755805652254;
        Thu, 21 Aug 2025 12:47:32 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:142f:8982:f293:902e:d51a:6b6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4c218c62asm3698218f8f.64.2025.08.21.12.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 12:47:31 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	peter.ujfalusi@gmail.com,
	lee@kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5] dt-bindings: gpio: ti,twl4030: Correct the schema $id path
Date: Thu, 21 Aug 2025 21:47:10 +0200
Message-Id: <20250821194710.16043-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The $id for a binding should match its file path. The ti,twl4030-gpio
binding is located in the gpio/ subdirectory but was missing this from
its $id.

Correct the path to follow the standard convention.

Fixes: 842dcff8e2d6 ("dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema")

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v5:
 - No changes, only added 'Fixes' tag.

Changes in v4:
 - No changes.
 - This patch is split from larger series per maintainer feedback.
 - v3 link:
    https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Changes in v3:
 - This patch was added to the patch series in v3.
---
 Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
index 5e3e199fd..96d50d14c 100644
--- a/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
+$id: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: TI TWL4030 GPIO controller
-- 
2.39.5


