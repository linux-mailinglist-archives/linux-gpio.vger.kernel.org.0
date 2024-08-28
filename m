Return-Path: <linux-gpio+bounces-9256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217E962398
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 11:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8622D1C23E45
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A603167DAC;
	Wed, 28 Aug 2024 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNpDDIDg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654B7166F37
	for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2024 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837771; cv=none; b=XiBoO8kj0kLzwliHDUoz7cgSgyaBsa1XigX6rLCj78h3JsCH/5IRcPJyvMrYK74fjM+pvS5zL+szlzKCSgapDc4vdda5uJr0wWTuzqRujYnOGCodhWP0tOCZqTsXsJehz2tCnO/NNkkcGTK6tXBgshhVq84XD35arYx5aMNCqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837771; c=relaxed/simple;
	bh=kIOSKTwBhCJNE2xIsjLzrlpi4h7Kklqz+lUuDimv5hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmnpZyGAQ4LXubnrRCC2ylMy5MQYe2TG5/0T7Imy8LqOfG10KEg+0pXID7UWdJ8HFwhwigWrf/MQmwv+DMBLSjHS9K84eFzgdjOWKjcSAZTKgos+HJJ8zGfmepfVf8lRhqZ+j8GgDUS406jGpJUJbael4+X34A6L9g4wCtXi6Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNpDDIDg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280772333eso9255405e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837768; x=1725442568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=uNpDDIDgie9oXdHelEwah/xJEwmTXmBOsvtCfa+dv8Xkp4aSJ+ysaGH3j59FZUEf4d
         +wTokVCmAkqZaeRiWTWh1UeiC0MqAdtRsaBWuzYc6YImggWu5biVqgmE+WeTFlxsRGw1
         Ua4sQFrFWyoIXbIm4bFb/3vNVOpFUX2sNiteyfplX2iQeFC1UF0Su0lzQHw+h5RdZHwo
         qT6hQ53T6rA6KASN/jTMxSksr/F9pyJy5FJ4zup2skNIgouVJH/V2GoXjUYLkoTyuDKc
         JsreFFyPmie42ipY/aJApZa7j3dWTSc8ZQYNRb4h1m4/cMQxwMJWbPNr2UWZ7TTyiIaq
         FWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837768; x=1725442568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=fhpiYEiFYELvw/KhG3IO2jxY2F1P26FHFZWo2iCo7bMhyCojKNBpsQpIv7LNIJiPWg
         W6f1VzkOBvzYTQbD2GmYlP0dFFjXCakrpAyrFJ6H9mP+m+XitfmEzOzL6rAnonclKwOf
         m5cHspGFEHG5qmJ1BkQgLcWMUefpDAaJCvjEa9LiUcD4yiZoo+eb0BmZNwmhugkmJwAo
         9bLi2evmPnS7dzF1WMHMLkYul/ndHBRdoE5V85LYI+XmegirWh+GA54zyoqi3MiyTZbT
         4GDdA4iQ406g08bV9c2hOXFaiIdqHZG4yVrwalWEXnL7mVDtKf4W3aceLfbZMEbStexa
         F6Jw==
X-Gm-Message-State: AOJu0YzL7ZVjZXXfrhQyHHDFVsyXLo7GNZpiw6llgb6XtT0hWNkkbmHJ
	yThVHtATjydLaMLrrXvQXVGLoehPxQ3Iyw0jx4JZJ1cLdrPL1CehYIHwQEZ6XXE=
X-Google-Smtp-Source: AGHT+IEB05FnP91FMO0l2HovbTESQKRe9ADpJRmnFhcHlQ0GZzcE4pg5vT+W4mPVe8NOnL+reyup/A==
X-Received: by 2002:a05:600c:4445:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42acc8a55f3mr70030375e9.0.1724837767566;
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:57 +0200
Subject: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kIOSKTwBhCJNE2xIsjLzrlpi4h7Kklqz+lUuDimv5hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+BI3YnNLbD7GXCWVvb8IPUEsEVvnR7tGUMm
 fnaF2hkquWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vgQAKCRDBN2bmhouD
 1y4RD/4kIDO9WQFkJe5J0o3puadA1mzoZjLceOTI/W6erd4nCkfkBl8dLOOsbEnNLqQdlS3svLt
 b3P4G7aRcKvhJxZkobZptlNOGxppkpJd4FD0JishQcRytMjO/fFUk70suDUcJBRJ0DjQ4IE3yv5
 0Dt0Typ6dj/ifqw3Y4jRd52LsawOxWfBpSkKGHPgTmpup6nVCsERkF4TY4rweGSasxFVpcXGi9Z
 Pihlg1+DTXQBEfVDFWZe5VuBX3aArl6cHPi9AlV9O2WpvNe2wYaGA8adpUChHqGUS1OQPsJDzq1
 I6FIZS3LCjCEBlFHHuCkchxpWB/3/W7+YqSNfRrS0qby+OCzMH6F55BpTQIAxxtanAJlC62naDv
 9bbxHIppITRogk9zPZTsSeh9IDSbYJ8wFoySiHQ81VlDi1VAnmpPbU7FiQIU+KeLoSGx8woo4b1
 0h46g4jd+wRdqAcUUqgdJ3wexn8BHvEz90abuaSm2KWEDSE+h1iTJ3LNDFnXRszUItkoxtqiqH2
 3HBN5FzPcaPowWVB3iHDgzn7VG6mM25RfaH3NZmvaPkYxoi44gVBwDRhaYzlAkjGwrlCsY4IUh0
 7HhPxrhF21phN/6UOi0Q9FP+lyJaZyhaDn7H33i0AWS30xtf62ttknUHPWO1lQtxaI4DsOwnfr1
 qb+psbOCgQcoMgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

GPIO hog nodes should define type, otherwise "dummy-hog" boolean
properties would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
index 65b6970e42fb..b74fa81e7d05 100644
--- a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
+++ b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
@@ -28,6 +28,7 @@ properties:
 
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
     required:
       - gpio-hog
 

-- 
2.43.0


