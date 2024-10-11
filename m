Return-Path: <linux-gpio+bounces-11185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6561D99A351
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9021C21627
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF6A2178FE;
	Fri, 11 Oct 2024 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNkP+f7I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9BD218D92;
	Fri, 11 Oct 2024 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648382; cv=none; b=OROJ3C7vqfqHg/ijKQO6cEDtyoUcVTvRa0hr+oF0BAv+qRUs32AcugurPZLn3asqzhiVUNl65fGpSr/rr36YwtsZYeNXASrof4NyHZlxlMbG01/vvsPc36A/PaCu51ioI0GffNPG7bT0+bOthEQbGarn8tQ/LxDNKvTj5Z3PH54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648382; c=relaxed/simple;
	bh=9yhQf5rK0Nup5VcMqWJSYAl37nX8gIQ1jEVUtaFHrrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vod8ac6rmRXUULbvgVwk7YKBzNQ9EEpONy0UocUuB3O/DO72WD/zyKTnYPStE7Abuh5+yk3COcl4jOyQrDnsc0zrgPl2coKmvrkynJ2uT/9cjG+iCKsinbVRSK+wPpv8kdj6VQmmcMw7K0ZcOa7zYs+TK6cAQEay7lyvxw77ZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNkP+f7I; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9941a48ac8so246804066b.3;
        Fri, 11 Oct 2024 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648379; x=1729253179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPy/JaEQ+74CM7BsiYWdUowzUF5iiUzU6luFBpGHCd4=;
        b=NNkP+f7IZS7URqqR9TAVo4raavbRubeq1QuS7jCfoAprOUuB/pgioPU3VXfSfnZ+gG
         deo0UfmLaHA+8EDnEeDl6YQ9WKqQWinyD6cO7VDqUJCL2aovgvS+beZpJhqiCrFAHRCV
         q3VcjswGNhhtSZ/gesqmYSSoOUe5kRNzaaBuDDO0JQEAgcXXKe8SnNFq7gMXqHZTkKSh
         kio8uxCTgz0LM8M1wwEYt4v5LLXKNo3cucCQSrSfdB1xk9SlfRyZyd4OBm0LA7lNGkaj
         bqlqVK94vnZxN88TxLrNditbJumSLJdYuzcKL3H0AmGZxqJ+hGYXVuP5QQshC0oNGfUQ
         QVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648379; x=1729253179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPy/JaEQ+74CM7BsiYWdUowzUF5iiUzU6luFBpGHCd4=;
        b=nzP7inycekkX/Avgp7oXi2AqxTw4iMSMZGquDBBdyZ6Wi5J5V3D4NBucAsT0pXNNws
         3m/HfZ/9pSvB8a7nACVJ6vYw+QZyJ5VJ3EepE7Td0bo/TmhIRRbq8gpRpgGCbf3n0fON
         HUf/A8Eckv/Pp9QnbnS0qzWkkwgcbI4uDZVsb2m3ao9mxC4VEOUitCRIWDiAm8DVncso
         YTfIKWuOL4DR7nUtCL8PzYWpZGLvstld3VU6xOqfrUzlObz6PuubkIbIvIqoDbnIxNSo
         7E/MxqRaKtVY/j02b2kEbBK1AQqcPnNuq/4phOM2Q7DbWquC7KzP/3LWSTBvnUlTCqNU
         jPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIdtOn/DoWXpOj35LQVwJkkqtzx3q9qC9LGQID+K7/gA2HfHfjwX8n72BHuQ5Z2jq4JRCjR8HIKJf4vDs/@vger.kernel.org, AJvYcCWErR3zR3xoC1cgIHhfAdvt8TkeUI+NVKZUPpK0G53B90La+Nc2xZ5z+PXkhKlXyuAl0H04MV5ic4NCCQ==@vger.kernel.org, AJvYcCWGf/OPbZoq17vthld13x9TiyBN3fU4iKibuDR/4UjzXWr2LDwj08plxPdqFY4zCGfte+6SQsH3e4tl@vger.kernel.org
X-Gm-Message-State: AOJu0YytzVFqvsX/8kbjKV2Kb6mfgbhY2hri1N0K0X5PwQ2BS48oFo0x
	ybXZploUbj5KBtBmE9UOAVrbNXJLABturnBHi7Ibzk/kcZkKLAH/
X-Google-Smtp-Source: AGHT+IHL7ir630nJdNiKICbi8J/5EQ5uJqoVEV3o00M0P7xZFlkxzQf9s6O78G/qMtzdw43r7wVWrw==
X-Received: by 2002:a17:907:d847:b0:a99:4b63:f810 with SMTP id a640c23a62f3a-a99b9604801mr214567666b.46.1728648379448;
        Fri, 11 Oct 2024 05:06:19 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:18 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 7/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller
Date: Fri, 11 Oct 2024 15:03:52 +0300
Message-ID: <20241011120520.140318-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the pin controllers found on MediaTek MT6735 and
MT6735M SoCs. The pin controllers on those SoCs are generally
identical, with the only difference being the lack of MSDC2 pins
(198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 4bfbaebb790c3..814a534038665 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Andy Teng <andy.teng@mediatek.com>
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
+  - Yassine Oudjana <y.oudjana@protonmail.com>
 
 description:
   The MediaTek pin controller on MT6779 is used to control pin functions, pull
@@ -18,6 +19,8 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6735-pinctrl
+      - mediatek,mt6735m-pinctrl
       - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
@@ -62,6 +65,42 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
   - if:
       properties:
         compatible:
-- 
2.46.2


