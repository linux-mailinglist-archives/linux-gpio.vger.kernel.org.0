Return-Path: <linux-gpio+bounces-12071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F69B012C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5A4284347
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452FD2038B3;
	Fri, 25 Oct 2024 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SI23ypkK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1E2022EE;
	Fri, 25 Oct 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855517; cv=none; b=kGVbh6zMyTacrOa+vnyITJFi3U4oM7Do3FH6MCiz2AgiGLJS0XXYVpRe1K5IlIUpjp7qiVv9h8T+byoMaCEgAplDdWx9JZa6ct5zjfa0s2J4DcPZjXkAM9SlkMej+rNZfUTJp3XMv6REiGFDI2RUXMUBgoxg31f2R/GKb6O06TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855517; c=relaxed/simple;
	bh=J11BKakW41EeIWO3xm1R87buOc94o8CAHWbow97U0+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7WqaK3sulBC4T5trTqFVUpoQe3IBNHpxese7wiKJr4Z1cCYhjLjZIg5RA0ZdHO9DBJrnnkhDVbSXASZkozxUsO0/sQHuR1eQLCmwLm2Nhs3DYnk+ryiqhBqTELYApSoTomQvEzTlRqqDiwbkKEtAcXPVp9tJV16+sG2qPhGBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SI23ypkK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3199419e87.2;
        Fri, 25 Oct 2024 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855513; x=1730460313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rq3hiE5NWT6GmSCtEliWrqDO8oFD5BU4/6ZWd5GCBSc=;
        b=SI23ypkK0hH4HgglKIyxDZsaUlww01H5C9+eQW/WX31K+YlFSmwOgEgwTyo1URJ0Ir
         oIVP6t/gbS+FWz77YkP7eJp9iyLz0/4fS+jhbeykCnPvQeJJR9AG4GbsQnFHXwPBPwCN
         uJWUsbZMuoTtVnELlf7vqZLIq3w7v9ctPKq19t91wjxIjZVG4fEllvEytqAEREkyT1G/
         rO1NMyAGYFh+W2DiwVUmzVgJ0616QB2WTfj43AhZoBW5K7j/LDoTv2+ujoYbcmaB2QzB
         XgvNl8/kIrRqnIRaEJY80ZJdlvGUbalxhKNjQpogs8sMfkXzmuaMqpcC8iHVNxr4WLCY
         G5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855513; x=1730460313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq3hiE5NWT6GmSCtEliWrqDO8oFD5BU4/6ZWd5GCBSc=;
        b=BeOfQk+d6LGmvN4g9Z1tD4BqlLWooJWxchDyILyiLkB7T+mmTerD5LEivM3Mz82vAJ
         msiS3g55xz87gXN8so858qsBlBS+MRnrl8WUR+XTOCM9bWGbk7Dh7/rmpqPLIesswp+4
         aKzfRw24ehTOMAAJyYokSCIdnDv7uZdHwYafosgVI/vYvL80GKzITWm8HO4l//T044Wg
         cuAjraRzHFQt7G/7G3xfhpe/1DNHFhYmwkDGWAge15oN2K538gSSNwMavHpflvPclZ7I
         62YxH3ePx8Q37Zej1Czy5LnL5gW2W0QMz4i0tYeuxIKp3t1hJMDStg9X55KF/s8bPZ5y
         F6ew==
X-Forwarded-Encrypted: i=1; AJvYcCUAPg7Lh6XxT9GM7C4mX9+Ppg1b7Y+aQvePEw+LvAelKvdByUjN5UQu+Vl1himIeV/kHKxR6dHA2Vy93Kr5vvxSAjQ=@vger.kernel.org, AJvYcCWZfuxdObKsNvr0tKA6dD3IgTc7Xrsv0FLU0OtLFgaBP5G4UrnoEtw9n+i5C8evJ0wgxxPYklzJJkP2fvhd@vger.kernel.org, AJvYcCXXkllwJTPSRc92UznKXauLDXG5rtQO1JLKaET0zBsity9uQfPp201kn6GTJGL7NMEq4gvvCnURpoey@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGxYDO+/W8yRETo1iFIx9smNSN07ZPoxluv8Rm+oMsCf1ofOk
	RfBwVG9tRKmzYMBr2KNfQtbJqgN877sDTQWc/ueYf4LEtcjntSdPNljbtA==
X-Google-Smtp-Source: AGHT+IFRRU3fNnzxh5RyfMXe5uw/ibOQCtbNygyevVciL04O2/qAsYZUB5c62adLaw3ixad+jFJ92g==
X-Received: by 2002:a05:6512:3993:b0:539:89a8:600f with SMTP id 2adb3069b0e04-53b1a33d250mr8904868e87.23.1729855512554;
        Fri, 25 Oct 2024 04:25:12 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:12 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:50 +0300
Subject: [PATCH v2 03/12] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-3-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1041;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=J11BKakW41EeIWO3xm1R87buOc94o8CAHWbow97U0+Y=;
 b=8Q9xi5rnFYrKFAl6oJ5fQ+KHXAWj47BsMmvGMPCB1rygrMfgVWqg5ms3ZfQ63+gekZHuUx7a0
 6+3aVw+80HHCkghT86ZdZWoLr66AZEUcf6SAOm0EOT7l+QpFFlg4UMZ
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


