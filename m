Return-Path: <linux-gpio+bounces-24578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41620B2CF1F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 00:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1B3583DF4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 22:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003FC353372;
	Tue, 19 Aug 2025 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ3KS+9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F24353346;
	Tue, 19 Aug 2025 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755641517; cv=none; b=V6YdNoX+6EeSNXT8LfRWJBwnv2u9IL0pq7hJzFnGMhHpNmkAh9wjQr5U9awEOcEf6bN53ROtdMlpLc1rnP4CYUCwHTXHcd3pxOoUeNX5qztg5Udel9sAPdx0ovJe3s5EsJru0nx5rtCTTx5d3i1bGB54guyDONyHKFlD4h15K6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755641517; c=relaxed/simple;
	bh=kYEvO72qwKAcgrTjw0m7kGc9zYNpF5QkLDN1F7vM59M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JA8HzZ6z3mHyEaueOWqCSVrmHFN59LC8cOZn+460hjo0ER+8zUBN4rYD0KjddzNTphR05e9WKqdiQZKA4wIollRbJj7zZe/epMjL//2t3P5zYoAQ46NRv5gFMVLt6//sSwjhM03ZypV5/31ES92OgoTy5lNU/uhfn0E4Cq926G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ3KS+9h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b004954so42906045e9.0;
        Tue, 19 Aug 2025 15:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755641513; x=1756246313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K35SvQhw00YjEa/o8MaVe7A+urCu90afaTwYqbkOP6I=;
        b=IJ3KS+9hFhwNvqOubgLS4D7UZqb2DDQmMe0JB1esojn6tMqoCoSrpjVP+qZteca4UD
         IQpx1Emuz8RYvse+DGU72Ofr1kiI5vvFs1jr8+i1CjDYIcrwP74yn19LoM0RKdIIN21P
         tROuFmcdeZYhCc7pBRNMmPyxH4B8WVWyJA59hvIdzmrGOQXWOhSKJvFPw/4M6jdWRycL
         uaceEtGFbBzvB/5KHBvSwBBeUUYDTkmLAEDlepcmTsVlGu2/Gly2VGBmqyrAJx8f14Yg
         +dhwRpHUBWCFBT9f3NPMEwdxvlIJd+fkn6uFslbrHQ9bAFzrzTO7+IrgY3dAORp+M5w6
         lohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755641513; x=1756246313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K35SvQhw00YjEa/o8MaVe7A+urCu90afaTwYqbkOP6I=;
        b=XXfwR6x3bMDzVVTXMQIeKjhjTUHDokRKncumvEg//nNCGhYpxd7df1eMttn8ZR505Y
         95amEvc4JxZqkIeOwzVY6OTfYf+ns8PrO+faz9wHSjmBm+Bkw5YyPZbV+sUR9guHkVBh
         3GcQmy0koTzDbO0tkNSee9R2Gc3PqA3prF/JOxWGCsdGw7SuXs2jvTnXEq7pJFqKE9yJ
         3bymlR+of1jMr8D4W04YMo5Jw72Sp18UbixjeKXFaHjfSu+iXNss92nHQx69WC/N0WQO
         tHYiTA23tVjG0l1kFUuAgolBjr9VaCbgM+6KlcSgdMT4EdC4jKUQv6m9WPtPEIFEpL/z
         qR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBs6Q84zA7PH4UxgRUg+Y0/WJ1mdaYkxVbYCfz7ncNny9I8mmz923tbNK+3ai0jsl4mi55FCLxahwi5A==@vger.kernel.org, AJvYcCVLQ5AxMdsF4IpMZxM04IyU/ROldLmXuMq3jGRR4rR1QemXuFmelNYcmsFam6UazAZQf4l5co+00IgN@vger.kernel.org, AJvYcCXII4gC3JOi3YJYbEsZhmGMn9Lkalzq0gbTjx/0KghZiaRWtuTWkazxYSsYvq8dRGS1y6Kwp50MAg6K2lTS@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKWtT5YJF/FD29M3JPxaZ7WUtvraO4PnWHbSJFHc35hamwmGP
	gvmkFDdi2+9XEEUmMForfR6PYJU4bE9dqN4vZTEfWo2bRVv3aCQ+dFhVgxng
X-Gm-Gg: ASbGncsmQlD8b8Tfwd0XGpRPKZiOKQj9PBVBQ1Qtxcl4at6a78oJPqWsIZfmIagQtPI
	S73ttvw6KJeSKQLxi4oKixYTFB359f2U1REpl+OuPf2YYmdHhUOGoP1+DQbwTnXptpTES5X190X
	0zL1pq8S7fL8Lw8CeFAhXTtLWS2Z+PHQSoYIJYn1SNK8Izu8XTpeojebgB5WZPJluje4SVEop4X
	wHELS1vRVCsXx19u2/fwuj/ATgm+eXgyY2r59JmfprCy3cg1MLVUxfTHr5ncyog/1WxAeY1JFCI
	1EAyL3pAPTySJ0KKt2NFPKhpkWSFNRrnsijG5+3Z3wCcCTeczm0M1waMTtfyZGjXr4Qz6jRxENu
	BkUuAQUP3KWiNS8Xb91u1vNVbAm0MUkHDdUx62upXNEqbkC0=
X-Google-Smtp-Source: AGHT+IFn0OLLqP/S61PjcsImiOsgF1HcBK9jbpGZOKFooDXzboGlVyWdLc7HcawB/Ew+vRFm/h1qIQ==
X-Received: by 2002:a5d:5f53:0:b0:3b9:1635:c13 with SMTP id ffacd0b85a97d-3c32de52722mr310399f8f.16.1755641510343;
        Tue, 19 Aug 2025 15:11:50 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:216f:2f7a:74c6:177a:3b99:868c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c6b14csm3804085e9.25.2025.08.19.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 15:11:49 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] dt-bindings: gpio: ti,twl4030: Correct the schema $id path
Date: Wed, 20 Aug 2025 00:11:26 +0200
Message-Id: <20250819221126.144968-1-jihed.chaibi.dev@gmail.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
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


