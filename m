Return-Path: <linux-gpio+bounces-10966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5292B992EB8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D813B1F2330F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8DF1D86D2;
	Mon,  7 Oct 2024 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APwCyNTZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5031D61A7
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310599; cv=none; b=TqArUBxqXtsJ2soXEKOjhtKe+JH9kcW3QXqO2+0LLnYptEDJLVKYIEjmf7yuGxXkI6m5BZFN2iAPDrACQTwxfjBmt1w/taxtt0lb1MClsnMAUI5WEBbYBIS5NKvJRWmxYMO1aO5ul936RuuV1AvUVl/S+HuypZoBAegVaXx8gcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310599; c=relaxed/simple;
	bh=h2FMnPogkHFfqhRz1WoByogMT7zBYzsPgXNwbf8hCeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5CY6JyiyElWuQS8vHcw6zRDQu9paou6EnNE+fUMDgr2LLhIn9Knd8uUWy2wqriElsvx1mulpoJ+gasWtRDddoqepHaqyTURmXhw51/V30pG5QeAD6i+lgiV0qmqgXGSAX80HJPFt6WNinVb6vOJJX7hlJktMC22mcHEQgDzys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APwCyNTZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso38974715e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310595; x=1728915395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hv0jab3jHBZJbnh7UjMMEKId2oSGlJ5cxQvLyyyW10=;
        b=APwCyNTZqhU+3LU+3zoUFbNLe40fU37QLq1JiC9FEgB/nPjBhoX9wYiDPZnG3qRRdr
         A92oU/iEApN80SKC5K2ZE/qFlBphxTVz/AeR5UaFcjX/cb0elZY6h6wvXOEoVammGcfN
         1i1eZlU1B7z6w3rOLDxw1dQcSZht9/WFME6XjioLeaQB63HYG59vbhd967WpA9nlmcTU
         XgAJY8k4RxdsYc55pMDhJyah/ipeKWvHjJfCzao9lRA5LmfXEqlez3+9ocx6ZSqkq+Fv
         zRIRcWLfM/9vkewreHWmLh7S11mobpnGK/noMxKc1uJInK3dfntqI26Q/sPVD+59KUgW
         HBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310595; x=1728915395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hv0jab3jHBZJbnh7UjMMEKId2oSGlJ5cxQvLyyyW10=;
        b=iyqr6X1lj9VHnNvXEpsOZTVL4Y+rVcT5aHkGq/ohFD39BsWQv4Peyn/dowDaL1QFAi
         s0E+Ro9StV1kBbcB1yXrQUrq6UNtqZzEWon1oAhZ97gZy4n0EBDl5z9loqDhTgvpkND0
         A0LrIQKaq9hnUxojO4tShKn2jF03iZvvg4UC2UQaX0Mi1iB3bcpL7eniqVH1jjwnDxNQ
         U3gSF7hImA/PmKLjdMCR+MnArEF4Se3wVBLju35qrTFY0McMwsLeHRZytMPu1hPOiLTU
         wWuWQyke2E6S8C/jlNyQp+Q0aOmflgFy8Y9fD2xud7+qirDnNw/CXE7s4xtIwuZsfu9Q
         Ohkg==
X-Gm-Message-State: AOJu0YxmlOFWVCnY3HMo6KXCaNbp1O7uEy3VmfuFmcYf+tHOAzQkyr77
	zS5ClrW3FnVdoKkudhZ7oHsqlxnhHlOUwBJI+P5p5I+LBfc1NQ2Pmmc5fYIw3XI=
X-Google-Smtp-Source: AGHT+IEBNwCj4Clmc9tQOoyaPHB9G6hxgmvRd98seccIp9L6ifABf/HO1+fqXZ4HQmKQwBQV2MyofQ==
X-Received: by 2002:a05:600c:524c:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-42f85aa32famr89848015e9.5.1728310594553;
        Mon, 07 Oct 2024 07:16:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20537sm94197965e9.15.2024.10.07.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:16:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:16:25 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-aobus:
 add reg for aobus pinctrl nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=h2FMnPogkHFfqhRz1WoByogMT7zBYzsPgXNwbf8hCeY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+1ALGxHIst8m4naWDBSpXsrpWWhY+q6boysoTva
 mUVfeTiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPtQAAKCRB33NvayMhJ0RGhEA
 DIrWLVjjoK19N2+puCqyHlFbu2KgFdoR87XjMzHDOoiiTUecXYSmRGw4l1jZEByQYnbwseieaxTU0M
 waJf58VQ4Ea1WpjJ9wgfr//kPXzk2frkIt0t7xFcMqPWdFyrXt3PqZRY8u6NBlT3loCPQ1yBzGx9Xy
 XYgZAqSKWpPKHGZ3iCqNGNV31X3m5qvBDwKM6GJZ3rqHEbuuaEfRUWni8ZKu6OyrReUotV0D2QKuf2
 ghiWFO7Ni2DjnILeP5jdZJzWJHJlfnpNl5Khxrp+sb8N0hxRqdCOlDCsAuYAyBC71sZ8SaMFeM5LaG
 fPXbB5dqpPyJeO7vte2ZuLFVJAsNLsPhQNwzl0mMItB4/W4APVTZDR20xLTDvb27pK5fe7hjQRdq5a
 M2N6Zf9Nu0+FhWvZO7iz/HP8qYCrqTnAb29HdnBcuN1Jx7yzC0Hqs5FLOTD28QNnyKDJ5RHFceytpz
 7MRtpz80cUvLwzrOvbRGrwnpOWHWoEko22SpMuS1Rb3fHCJ8zmF/efj14f27NnHDOanFynQNbUcFcx
 iMCIGo33bjvTvPlW569zqf3SJuM3s/NlAM/Q/2aVrkJrLUYg09IaqcXZyHyM+EvHJXU6fKKAHRxS9+
 c70jlbfYmpezaFexoFwS9Ca/qg2FtBm98t4OCGYQqY0CGwOWCZhg5kxhWwdg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
reg property for Meson8/b aobus pinctrl node was ommited, fix this to finally
pass all bindings checks.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..76c02c6af645 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -9,9 +9,6 @@ title: Amlogic Meson8 AOBUS pinmux controller
 maintainers:
   - Neil Armstrong <neil.armstrong@linaro.org>
 
-allOf:
-  - $ref: amlogic,meson-pinctrl-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -25,6 +22,25 @@ properties:
           - const: amlogic,meson8m2-aobus-pinctrl
           - const: amlogic,meson8-aobus-pinctrl
 
+  reg:
+    maxItems: 1
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8-aobus-pinctrl
+              - amlogic,meson8b-aobus-pinctrl
+    then:
+      required:
+        - reg
+    else:
+      properties:
+        reg: false
+
 required:
   - compatible
 

-- 
2.34.1


