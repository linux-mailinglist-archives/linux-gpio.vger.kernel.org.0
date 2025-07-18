Return-Path: <linux-gpio+bounces-23478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD9B0A730
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0821C82804
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92312E11AE;
	Fri, 18 Jul 2025 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAarY2cL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E232E0B5C;
	Fri, 18 Jul 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852333; cv=none; b=eQyTkjz6AUPf/80z+AwEEOhN7k4DF7cp1aNAkFCthmEspjApbKfY95MlmldU+9+2Z9W3b2iYfAfjquyPCwbwdjlLDYcRztPeMnLUJB5er/9+J6B8KTUstAwwPCX1HRGjE55zH+6YgCwQLwhVppIcuyIgI6TsMQawary9jCfxycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852333; c=relaxed/simple;
	bh=jeuvs5sazyu7V8h/2z/SSmBL9wj/xBK/jonDHUZR3lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCJzhcDIyE4G3D2NoKHBW5wt9h4vmojBPdlvliLhw9cbC3ko4IVMaOk75tLHO1FP4EFNVZN9+x/1BlbNBzjkPnCZepS7m0MVSFyP0RigH60pvqq8ThAKO4llGSXJRubC05xfP8fd2Zm0oo3S6p/Nk+kB6Opl8MAVKpSnDsrvEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAarY2cL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so5293845e9.1;
        Fri, 18 Jul 2025 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852330; x=1753457130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=YAarY2cLSENaNlvAhkftzLupPSiVYcBAyEHX5qK+bXvI4cENu58IekjIGZbGJGY9vh
         oDxwOycpxP9/6FRTpGGRyHI4PTCYHIFxgaIGnoGUZ+he8cbPJ8g666wzfZsKTSR9VBeW
         kd02E/R4nat58NZbAPDPUmlymIgshTkZBSkp5cJxHUHf4jh9QqM3tu61olNncB6EPd/r
         Bs4c8WPU83Ny6IANao+a0V1U62epV5bbun8hXlSj7+SwIEszvYB9TxiaPE0MSX+9OaWo
         OqJQxi9bo6vgY2NLczsXnK1SN+0dKGseQt73c3yJu9Y5UYTgVRZKy7aJGZSFRVTFQmwR
         Ve8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852330; x=1753457130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=LzJENB2AV8Kam3DFE9EqXYKhv/PHQAbPg+b/44wOXTmPm65EeMkMlllowoSEzgdoym
         NDTkhH9A8xGfB3lUORxN7wEPtyMzozofzTONviStZn2KGwuAIYpYfV1mXu1NAo9tKgam
         RpCfphcXaaB4Q4J/7MYlvny3u+204S34fCGVBygUC6UazxRsbqQsDE6Uc1C/CVOxWEb8
         OQtIRPNUH7bqSI8bY05IvmkshSBotmZdwZeC54LKB68oHqzqZpSuXcvFLK3pIb+wD8/3
         GUMuN6pM47TE6HK63RjaCtCRLL5famg8SrSS8qMFVwSliDbvPSl5JUk2y9Jyc10jFzxD
         9RaA==
X-Forwarded-Encrypted: i=1; AJvYcCUj9HX8rw77iUsCBadz4FgIaZc02CnNM1QHFIX4TsfAb561ZZY0tuwfIRHolKj5qnBlFcKfL1o+jAozloEC@vger.kernel.org, AJvYcCUzi66JGUh9uuJDHfVgiLMtGVlJXZKp6H8ZOH76S1144lH3ltIT2iuejZjV/4v7vWP/PC+PZIBOyodK@vger.kernel.org, AJvYcCW0PJcJtZtTA2IXJ/fuwqF2BrtCCanSmRtDgGxr/rcqgDYMpneZLUGhS2zH3Gr+hpoeN/4Q83L2pR7QqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGUvDSAT+WDMfxmy7EA/9u59fgrbmtdFS1UJ/JLF/t/8cnP/8
	kkH+y2WA+4Z1cKPq9KYrREkyV3UpxWczeq22qnHHBup7bZ3aaxLNB4cxnta5IQ==
X-Gm-Gg: ASbGncvBK6VbU1SI7k5A/XW9tq0o1hie9NiZNitICsTNazvU4+UewFuETGi5/kfo6h4
	BgpOUyjW5D8WNNUD6EmsUo9Y3GaIygkI+NJoFJegYwy9jJUrQIYaOiArtU8YSPmUlhS4Gq8r8Nk
	WhVH6slvUr9J5V6Lgvy2pl6FrKTCxBEae4jQD9Q0ICVmTSkgVc48hm7j5K2TI7+OgDamGLgs7T8
	eohboUaj1rUvZYFUiH4M9H7H0fixt1WrenAJIgodIZdofvzQ2mnxp3Lel8+uxAUrgz4E9Of7Txw
	n6cnxoghf5+4bj34nwxJeSdSQkmSFOI7ty+LMVW3PYLv4WgthduZaQd/5KwCVMMMqVQTO5H/n2J
	4lWwUY9x3DH7CMgUkrtyyGYW+D4qhzrMNf6A=
X-Google-Smtp-Source: AGHT+IG1vbzbLCgOR5YDotqpNaL70yH20v5dT4HsVfcivIBx8URgZtxb/nuiF60kyvSNGOQRCG9opQ==
X-Received: by 2002:a05:600c:3f12:b0:456:1ab0:d566 with SMTP id 5b1f17b1804b1-456348cbdb0mr81643995e9.16.1752852330035;
        Fri, 18 Jul 2025 08:25:30 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Fri, 18 Jul 2025 18:24:44 +0300
Message-ID: <20250718152500.2656391-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b96..f712d7cfc35f5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.50.1


