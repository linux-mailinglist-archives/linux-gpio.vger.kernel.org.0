Return-Path: <linux-gpio+bounces-22623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C5AF58B6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5F71C27546
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6094289349;
	Wed,  2 Jul 2025 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4MBy/DB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6D288C92;
	Wed,  2 Jul 2025 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462485; cv=none; b=nZ0+kHwb8OwjyEHqQ/rLA9Q9x8AuXAkd1Sd9JLACqvw/iHtDu3AqfnFH2Z5fR+X3D3UT8ZEM7qJsuT65q2ytTUQsLUwJN4AnIgYor1LSiWUJuRczAHUZ5OnwnN5vsUPL+O/rwlr0WAZVNoCcB6iG/fkCUmNxjnjThyl0oeDwOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462485; c=relaxed/simple;
	bh=ErbiQmBj6FNnOV7BCy10DaJ1fSc1GsI4D/uamtkaohM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1wimgbmJ2vQ8CTIFC9dzuRzmqENmeqC/G35BdRp7V0PNoGyr+NcB0TOnUWpj5+5uy3i0dqhXhV9728NkgMUSETJlVT+v7O3V3zFkmCcOB9Wkmavj+lT/y8IOWCRlkxqvqTCfUBsgb9CPaLnuw5ZZbQj04fCHk93jlRpfZnLGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4MBy/DB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so7491084a12.2;
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462482; x=1752067282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=F4MBy/DBc8lGL/yILD8lPKTdVWaD6LffcONoZyhGyX/QeQWr4DRN0vbNtmzbbgaZzA
         ZUj8QC4d/Wk++bY55ZHEG/8dYDjkK8QmM0ZWezMjm/CZpUFIGL1GRHFA4HdWCmjC38Ql
         eOUUnRR6yL1/nj9Lv51RpEMYbQvQctA137Cnca0uGggIWDqElJRzK+xJpHK3Brpdu2t0
         jE4qR4neDerFNSD+n2LFOiOds/yUFLfbnBmKmqsnwi30MWgqp/u8eVC6sqZT58sfYwaA
         UOxF1Jhg7bU0kFitFJFcQhIgLYi9MSLU/n3Qk5+kwGkoZ2vNU7qOrwQMvo9+cgFnoJu6
         +qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462482; x=1752067282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0CDggb+22rjwlKD7Gu+xnJm3wuYcuGX4gjvXqvIn0Y=;
        b=vfznXXgt07LP9i1u5uFCU9yua8/wK2EXOHNgMAxkHMtA8xC1uXidsye2FoDgTvGWZW
         sIcaFmDVLAlflF0WM8PLuGAakwpBQLpH10QpoRbceLmE5o9xjdbJ+CKq5STDZAvcjuVf
         A8q/GH/jWJX0bV33rKhilmmLJ1FilvNF2/ozrkKgd7+5/2C2gjIjYhME0nY4k+cgdtp9
         60qRoytbgcq4TMxkJGtQY1oG02zhMUABfxjnWgvFOsD8p+R9TbQpa9DHLIC5I4nKksAT
         ho5hD6PdaUaH2rnagt8o8NoXO7J4BJF9331mgR5acgFFUOBGM7UaiIIeJSoVHG9UEv7V
         maEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO6H9Me8ujhiCzBj5gCD6Sak60ar6/rOFru+y7/pH4TJgBo4B71dPHnBOIlOG2MFbSd0sHGmmrSKJk@vger.kernel.org, AJvYcCV11xiRnS4yOllMl89d7CUZFGvE1EI0fpm4gQe9CH3qopc5nYzeEzgoHgSR1Ug8/BlqjPfay6p3lpq9bgeD@vger.kernel.org, AJvYcCXLYqUjeuZVcXAphIoC+kyyKLkIrQPF7PDWvSd1Jrb3dbRllSZh8q1yPNEmR/QLfK9/aBW5+OYjvv4Njg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMzIPSyjE32OV/KLTe9Ek6ZUynqeQH/Cs7SaLCOCtSD93ky5kv
	4dMXRTQVMINNR7Vo7W2XXLWjWrul8SbxpK/T0vMimi+pHG2TRskwwTRR
X-Gm-Gg: ASbGncsSeP6jJ51e18TLKx8i5ldfOaxy2iuTw61nvu/FDcbJv7XvSvRu2ijdodJfuJz
	FlfX7OkfKk76uTgKDYT6Pqw3DJPV91b+48k39TKAk+ATfnGA/kbwcSKhYta/i3frIAPkY0iBWTi
	Yqv86iEBfUtSv/H88xqzpdSWgtQaRQdEk5KrSQo7g54Y2bnmz0kRGDQkCeGoIV2ORdRnJ/advoF
	mUi9Tuzv0QmhCcO/GAiMcbsTi2XggQMEwm6yaLQOFOh+DpI+v00SVQTth/rokL/yRypizTGbcqc
	mJx+Wk6SYTD0CKi6zE7UvMlQ5z5hkyTIEFvDstOqNdCQPBmACUtKHqTnrWnO8m3+EKcJaszAqa8
	=
X-Google-Smtp-Source: AGHT+IEwIV5Blqx17B9jiMC5uhIhf2/2xb+WOogVA9BwtlKTuRFKbLAhdj1v6eSRtnrWjGQF4goQWg==
X-Received: by 2002:a17:906:9f96:b0:ae0:bbd2:68d5 with SMTP id a640c23a62f3a-ae3c2a6c6bbmr270964366b.2.1751462481909;
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:21 -0700 (PDT)
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
Subject: [PATCH v5 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed,  2 Jul 2025 16:20:31 +0300
Message-ID: <20250702132104.1537926-6-demonsingur@gmail.com>
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f5..78ecbab8205a 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.0


