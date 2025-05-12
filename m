Return-Path: <linux-gpio+bounces-19984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44DAB4636
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC338C0109
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF23A29ACDA;
	Mon, 12 May 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ycfgxwy5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFE029ACDC;
	Mon, 12 May 2025 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085350; cv=none; b=PUVStSAIEhDeTCa0r/HL4hJUpWvEX35zb04XrIjE0JC/qVcur7HGbtMkohxRGpR/tJQ6BTt6bqpUkxmlZDb14wu9rN0c6nC/x6I156/CHnLSUr+/LnrPlLt2OchkD5AN8VyuydG6TqejtbND4maRdnYQFAfMnNOIhisIApNgcUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085350; c=relaxed/simple;
	bh=WyGMjpUj8obLNMrXmKLMENsPQIYMOQWUtLABrhx5IJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFkn5DansOE6UlmVmNcOsudhwF1VbtySb3wLdBqDZ0QUto51PqJU0ptHu7EBZmtXq5H8rjT9xg/G+4UztF2V9a3KtysSdxszaaKLQo2Z9A6KCI4UEI1O+FelNkVKGX7hiWseRUbTZ7o4oV/GFDoioQx9uEEu5r590brOd8tAH7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ycfgxwy5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad4d5bb4d0eso53419766b.1;
        Mon, 12 May 2025 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085347; x=1747690147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=;
        b=Ycfgxwy54WrNMpFVs6tvFJCCBVtqZnDK35qVTf+8eZ9gp23AcxHkgLmz8O6F7pokbh
         vz010GRAj/P7tMLCRS4f+CSNjSAtlMUKb9axvYzqWzkgYiOlAWwDSTRKIhItOY5VMJAW
         LZzurI4SiH+Mk4vTlKUWxn0Xuoub4aO9GUF9NYRddh57pmdIi+bKPFua+L9EYykuKA6n
         1so3Drynvf68cfOGFDlCBTzm/PmBsqke86nnQ6MvweATPi4bqm0eR1D4I0nUphym+pSG
         kQS8p2LguOtrIfXtvcDVInHzPjhj7AgQqqm8BL8aJHY4zPTwtB1m1la9uHZXeV8Kxt3g
         4dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085347; x=1747690147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=;
        b=NDUOgNbfaX5QfoD7oUMe8lHcKP43Zu77OHm85YJmJLI2LHmpZeJmG/PedLmI+vRfSz
         cbumq6F1TmwpKEmr6NeiuZTfCZnawLjsCSxzP5qwhoG0Uw/DxnVjIyQ+ph0lvp25b/In
         5WrUj5kRK6xUV18Nl07hcciDvldZuemGsSUqbnqe1UTMPhpxnXkUFBYKGTu4b4QRZ+7Q
         Grwa+dImGip+tLuKaI+VdmbTTUgfvbO7QHu8kNZb1DwGGZZXYoC3O3/cWFkjzKWAG+DD
         jF5EW0vGME88gPz0aqXdpbL/zxxsjYgmqZIDEomY34v1Vvaj7nmr6bHgfwtoLHeXUUBp
         gOJw==
X-Forwarded-Encrypted: i=1; AJvYcCU+GUtDQ0d5swDfXz8Kbi8tDbzJjQq1NJzZ3HWiIrFeQbr4VnootRnbDRqat1wuFJ61tgD8wsg7v0pO@vger.kernel.org, AJvYcCUYQ/KIEfL4IeeZlPEWoHGpkPRHY08aO47J3CdQN/BXjdYOBbmtPJLL1+l+nORVAMLEhVhioeK5CSJO3vhL@vger.kernel.org, AJvYcCWIrH7FkI04nOLs48P8TdoJo/RHqTEgcSjnOfaAuFQ+fad8JIUg5dfL1HbJK8ytSYozngUE+3yF4+7nvQM=@vger.kernel.org, AJvYcCXktSFhpuzYN+YDwKwZUIGuGbfDtju3XNTN9YokmyXyBATTJDp0W1LUFDOCYaZ/SZ5D0rVcYUzfe66z3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8l48RAOVA6e3ibjEOkH+mnDi0YnGtcDaSzV84fqQG6OCYFoxf
	wgsCXMvHg+yqLUxsa4lBVuG19SpEhdJOQ06G+eSgqdiye3xmmhsP
X-Gm-Gg: ASbGnctj3uCR9JVRB/dGbZvxQIidIphV279ORTEvIz8x/PvdFpwtM68D73iArov+GCy
	r0BNgzOnM96LFAz6D3V8IGfoTl2aJ80cm16vkGjC0YkiHdOWyV8FFiwnFxxhvvSz4/Tw/NcLWzZ
	tekZ3rw9WbwhbaezJmCT8F/ikRZ3ZW13hwgfX8r9aN/vCvf+Kte3cUyl0YwnN7JgfJcHmAjzjsj
	uQf3Cyrfvt6K7JOIPoxsR82HrT8+ZS9IaTy7BLLHsZyg4LmwPvbkWmERv3DQM0CXgrZoZNaB0Be
	iLTi5Xde85KBFEPoQK745vPxgcHWZ6W/S3ai57R1/7yGeFRk6byZybyDJxSUz5U=
X-Google-Smtp-Source: AGHT+IE42f4BLApmux3jOg1v9yOr9Bg+zkJz218wqM9qOgB/ayDgOa+VoGiZd+V7j3Z0CtpmoqMeiQ==
X-Received: by 2002:a17:906:4796:b0:acb:5583:6fe4 with SMTP id a640c23a62f3a-ad218e4b962mr1475270466b.6.1747085347019;
        Mon, 12 May 2025 14:29:07 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:06 -0700 (PDT)
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
Subject: [PATCH v3 07/19] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Tue, 13 May 2025 00:28:16 +0300
Message-ID: <20250512212832.3674722-8-demonsingur@gmail.com>
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
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
2.49.0


