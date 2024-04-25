Return-Path: <linux-gpio+bounces-5860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F38B25EB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 18:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 586601F217D4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F200814D29C;
	Thu, 25 Apr 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="py0150OJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821814C5BD
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714061033; cv=none; b=s8hsN6Glu/B8Gn7PhykXbCFbq+i3zs32CBaRVbwX19LWlirr6gWk3GLt+aq2lFvF8czIkht6FpeetQzbRreh3Hfhd1f/K+KdKNhnuzk1f/hgtjzGgqM+E+CIinaae9aVB11pn6N49InZoxSS0oMfAcsADXgx5/F4qF+GWmCvRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714061033; c=relaxed/simple;
	bh=2oqcmNS3jd8d2/9WZaZaIujWbPFQr6kvI2pAa+x+YxA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=USf6AxVp0078DwRBCwwnioVS6Fmg1faZYK6n+SSsTnfbdjFLJfUpPakxTuCVdX3eQGA7BdxNGID/H2KsmOqFF8mM6iouxhBk//+H7yTW+l2epNYSN/i3cBjLnAIkTTtTCO5aFhbfvZlhL+ZAs56Ub3+LvOCVGEXwLDtrJ8dzlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=py0150OJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso1787023e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714061030; x=1714665830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90o4FgSL+CeIO1gyLTC5XITGjfeMRvZ6Pyb1+yyX+Xg=;
        b=py0150OJutXqulUaeKnhAW9xaT2b0NaYvrgJY9bN+os8z/Odw/lX3mqnN5VMJDFy4k
         R3QMNI7MaikB5/suno5zKVBzJqokUcD8/8K/9ECpoNf0XWAEOtBsWM07Qx3AnkjUkI2Z
         TUAQMrWHDll4hhPHi9X2rEu+CzUsbTdzNPzA0t4CGLh4UXKW8457gwKJLdc7qBvV1Jy4
         rPmjjfFzd32/vNp6XBTPW9sWRb3cFQjvfUJifNh0lMN7XsWn5dnC4EQdC2w/w+VMETve
         04rfBWCeLtnSt7TrNGqXQWwMuG/ZnKNBWr6GCpdEu4CaEzEflVt9Ib12YSIgCEJTM+5G
         Z3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714061030; x=1714665830;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90o4FgSL+CeIO1gyLTC5XITGjfeMRvZ6Pyb1+yyX+Xg=;
        b=jnS2WQO0ctnnE9KtCUqCUovP2izBDUgYeQdXLqP6Ik23iZL5LfjMr93YGHOpwJ3Gva
         GmNQ6h3apbq3ryuJt/Up3wB4vizgdGeX/hRLKqokjSFj2ZVsb8iXdX73wM354k6xcuPn
         96gnDEopxzJFo6uDdFHTnRBhbZGNEHxiHAZKE+W9M+6RW2l1AKoZ/NzUbzJEGae/BSv9
         GRZNlj87UFzvffS/XJF7xEkgwJOvA2ozddGVXylsZj2uzHpHiO3YH6xACNOV2FfJW4K3
         xAJUkv69T37fUXyGTWq/kcOt5QDa6RM6zUcvAIvnK8SuU2yZHaDEmcpvW8H589N247Ub
         IFog==
X-Forwarded-Encrypted: i=1; AJvYcCVwgUnoJmWNID7UZCJEMU8Vgkvcait+CpAii2cP80K24aDsvT/efCClasl8r5TWJeVYFnE4eiHEo2nNn7jU7FjCQjNXHeMhiMmBBw==
X-Gm-Message-State: AOJu0YxJ3qWDtHjbGC7OFFCXiwntKnNxH/eADmHXhnjI3CBZNP7SXfEB
	kKLj0rzk8PhUdDUD7h02NYy41ARO/hwJKym89OzPZt7hXik1QdaO2bT8G28nDSA=
X-Google-Smtp-Source: AGHT+IH4W0cQvppH7SQIIXB9y9gkfeZnnN7nZLtEwV9kMHM6f50E3eDdLoX2AavWUT9QZExL/niKeA==
X-Received: by 2002:ac2:5edd:0:b0:51b:4b94:a956 with SMTP id d29-20020ac25edd000000b0051b4b94a956mr5436845lfq.21.1714061029915;
        Thu, 25 Apr 2024 09:03:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id mm10-20020a170906cc4a00b00a58a44a4419sm1329562ejb.57.2024.04.25.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 09:03:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] clock support for Samsung Exynos pin controller
 (Google Tensor gs101)
Date: Thu, 25 Apr 2024 17:03:30 +0100
Message-Id: <20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANJ+KmYC/x3MTQqEMAxA4atI1gba+jfMVcSFxqhhnCqNiiDe3
 eLyW7x3gXIQVvgmFwQ+RGXxETZNgKbWj4zSR4MzLje5K1Dbv+5+xFU8bWHGbleaF/qhLSy5rK/
 KT2kg5mvgQc53XTf3/QAY9rBvagAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This series enables clock support on the Samsung Exynos pin controller
driver.

This is required on Socs like Google Tensor gs101, which implement
fine-grained clock control / gating, and as such a running bus clock is
required for register access to work.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      pinctrl: samsung: support a bus clock

 .../bindings/pinctrl/samsung,pinctrl.yaml          |  17 ++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 111 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  74 ++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 4 files changed, 204 insertions(+)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240425-samsung-pinctrl-busclock-151c23d76860

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


