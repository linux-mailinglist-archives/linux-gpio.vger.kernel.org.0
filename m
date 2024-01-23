Return-Path: <linux-gpio+bounces-2439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CEA83892B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 09:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72241F27F91
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFF85BAE3;
	Tue, 23 Jan 2024 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY10ZFkS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386845A78C
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998917; cv=none; b=oURq4o155OmloflG6A1z1GdvlORA9o45fpTiSmmIFkIJVQiJMy3+6MlgD7A7LmKkBI7wgCfNX+iDM6c6Yenn9x0MQyLzeFCccd9H8po4f/CRzTNJLM0UhzZTACGcSttEOaStix2YYg0eXMDqEWigoq6hZ70GRyNc3K5BwTUliPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998917; c=relaxed/simple;
	bh=kWqtesvHjoSkng0XcFoXgTex3TV+vC9xmsJIv0b0Rx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pJGUpUogYZPDioxacu/J0Jkz/2lki298PSlycLkmxCYLu9tKH4RWVqXZWxrnzdeSeLEmosAfCyD7g7EiOKmcDXwe0DKBVDUMEeGNev2BgEQN37waIWoJZVGvtixlmsBYJwmp7FTB5WpojdfS5pOGrmvSZ6FNzJI+noo7fkyGtjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lY10ZFkS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e87d07c07so51378605e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 00:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998914; x=1706603714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdfFrklpfzHBV16Dhq98a7qVy1esOltm6odDyiqYZd0=;
        b=lY10ZFkSr64GM1PZTEqyK6Mh6IaepPFy6wRzD9oc6Oc5ifV4zZ6x/xFXLKhg0w0BNn
         ZkhNJxRhi37DluF5BIEgibFBOM4WP1La7rjC1iTwwxj9t6QKJNpse0RCczlzykEIHsVm
         E9Fqba0H+yfWds9WYSKxsOujg8EygAnfSFmLsGalMBJ4bpm/bz2MMr7bR+y0ECMuSrpA
         hOcez4pgB5K1GD/SHBTfQhMasUzhPbmRaqCvW/dd2acJ493NSaRKCqnY3IC08KkxcEYm
         zYU6dMCLfbZu3/vMNP7LA8fTXDCEByiP51z4B/5zNyA5qFpCquDoXt/l+Ieq6BkHyR/H
         okEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998914; x=1706603714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdfFrklpfzHBV16Dhq98a7qVy1esOltm6odDyiqYZd0=;
        b=TCebz3CBYvS8pWm3MHZgn6YHSfE+aTfHwV1Tw7VKERsd5yfoyFYJ8OvVU/wc5vnAuc
         0Z1maHxDHLR7/+ZATOjamahT1VOFjeRkrL8kH/eVsPm6xdbA7zNJmB2PQHT42uQNtXup
         PzHaF0qZOZhevwFF+aHL8vFw+S8ecKDcIXS4vgCbI3eYURsqDKhlhe69ftY6wSOG4ZTb
         y9QNGjWrjiavCaF67muqXlDfNTm5FPdKIHwgwS6Nk7DYuci3tIoirvjXgmkIm6mPbh6I
         b/p3OTo1MSiRZE49qt1xKnaIhYcSxj9Zsd2NFssChEMrhAKSmv4gi6pzZn5xuwNDMoPa
         zO8g==
X-Gm-Message-State: AOJu0YwPDS+odJ5V5rQLgNX2gFp5MgWak6Le41Lp8URtRPXmDV586HMP
	nUL5yqpEkMJdCuyRD8iwp+pdGjXyZA49NxDfK+c3YME8Gov3VHrypq1vXbZ86wk=
X-Google-Smtp-Source: AGHT+IF9LMj2Y7QXHww2dLQc2dx1tE4yQOn/mCe9OD4aOrfDghJAioHG7cXnf0wusg59QKpSBEfY1w==
X-Received: by 2002:a05:600c:2247:b0:40e:4576:53f7 with SMTP id a7-20020a05600c224700b0040e457653f7mr330077wmm.49.1705998914494;
        Tue, 23 Jan 2024 00:35:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id iv11-20020a05600c548b00b0040d8ff79fd8sm41778732wmb.7.2024.01.23.00.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:35:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: amlogic: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 09:35:11 +0100
Message-Id: <20240123083511.21063-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regular expression used to match the unit address part should not allow
non-hex numbers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml   | 2 +-
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml      | 2 +-
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml    | 2 +-
 .../bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml          | 2 +-
 .../bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index c7df4cd34197..d9e0b2c48e84 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -24,7 +24,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
index 0942ea60c6cd..108719bde0d0 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
@@ -21,7 +21,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
index e3c8bde30559..dc277f2e2edf 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
@@ -21,7 +21,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index c1b03147e8ec..add83c676327 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -29,7 +29,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index 4ec85b8248fa..412bbcc276f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -29,7 +29,7 @@ required:
   - compatible
 
 patternProperties:
-  "^bank@[0-9a-z]+$":
+  "^bank@[0-9a-f]+$":
     $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
 
     unevaluatedProperties: false
-- 
2.34.1


