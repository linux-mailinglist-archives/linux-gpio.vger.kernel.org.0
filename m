Return-Path: <linux-gpio+bounces-16064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF55A36DC1
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 12:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0CE1895979
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 11:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477321C84C5;
	Sat, 15 Feb 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoO/bo9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A291A23BA;
	Sat, 15 Feb 2025 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619191; cv=none; b=hftSU1YRvIKO5FS1NHZEF8eIz6zSlogd8y+gcslt3X4eq6FNBfn5X1TseFvDTXfQfodd87GoU7vmPd/VNYTzIaO9bKcZSoiIh6tfaACJaA94AlQC1HPcm8+S11Qnf6GZhGtmMdOe8MFhbwfcyeq1kXng6qeQCTRK1utR2WE3YIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619191; c=relaxed/simple;
	bh=kxrZnd9zUzE94UlbrUTj8ZudyO0RJY5GpD01ivIsldU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2tkvdI2SWfIHSMzGqhrm6N6ML/nLi8MoRok1dWSfhUjxjTkoFvp4Y0ymnyt+7jzUY3LG0q7Ioih+8g9e/uKxlvlSRLhZE++h4q6Wdifk1PY9BvDID5voB34FMp1EDCz2og8tL/tDKpBArR2CDyY1hYKnJD7o/vh7gKT2cVdrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoO/bo9h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a823036so30617715e9.0;
        Sat, 15 Feb 2025 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619188; x=1740223988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/quxB6BHlHDqC0i5JxTff+VNeJbi29B/IjgyVMrnZrc=;
        b=ZoO/bo9hZ/6kWRJr20ByI0UxvZXO/a0BXDJU3uoAS30ym+1C/zR947OlVNy+P4fSLR
         cWkeb/ztKzZTYXmAaPbiGEd3d9PMvaR7kRQ4zFCZyjnkT+cyHU4TlKITpQoBS7LV0B82
         N5RBrNnT2TJKow6YS8fVhEsOlNbKXYPUozrabeA82fSh5LXF8hVAMlCDR6vRdutFsN8Y
         FqpT7ifZZEd4BJFmwimhIvNA+vKe9kGaHRhZYhNUckspHvCkq7TADXyhJ34jyVxANIp0
         2f4KHRivTNw3VeEkCDpxc5Xri0II96xB/1SHEUPtROffeR7NxZ7yeUkMzvwC3SV1xCDI
         NqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619188; x=1740223988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/quxB6BHlHDqC0i5JxTff+VNeJbi29B/IjgyVMrnZrc=;
        b=c2nMM/k4jbKBunofk067GfP++yMRWbuw4/msCLnABUqG+Cx8YFHUBMe7wmYjM/Ezv+
         I/vL2X4Nq9JMklIwzXxpkajUbjX3lVeKVR4/izFaxQH62MDewnpX94TvIawLA/nR98hL
         17ycA23xOzwSd3ZwP+jeLKMVn10zX4EB2h+exz9gg0AWUe+p5tNZ/BOQ0fRhFA0M9R05
         Ak1q9syPh7RUdMVnQBYxZAESUjlahwxjZVC2nDrAz4fjQnU3sY5JSSRTAFmQ7ZanXNtk
         CPeDIlxuwv/ADS7ti6UGl+Y/OrJvUmaioojuIfcOQI26S26JIekk6MMGR+1rU4cworA8
         AwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHcjIZ7+CcnPNacG9gp4EYZMdgwt52bMSe4cO+iBape4893b38WGspIvSmaZjGNbJQLv5viKEiWlxtQg==@vger.kernel.org, AJvYcCVOjuCAMY9Pk97csPkwY56y1DFMWx22riHS1iOObpnFvp+ydDT2tSpvfCa34bh2ZBeojrfR8az4hLLRxsql@vger.kernel.org, AJvYcCWXfmWhxv7G8hGXi2nzQopnAxaTw04gYz+d2RCDwELQMKBuv265/5oNacqvNnhumccolUU5XuZgL7ce@vger.kernel.org, AJvYcCXFwEW0GB+HuyXxtcszcwSEvZ3FHjaIlMZ9cpEty2MQjjX3QNihdpNRZHg3ZXwxLRES5yNdNACCFMJGLfBMpBytjAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5mlm2n7dSjICPd9C3zRZHDlYpiLdaorS0fDVx4On3kEdl0S5
	UqDDLbflMa2ENbveBFa2X47Cu2fZHt/tRyLFwQDhtwap05odS436
X-Gm-Gg: ASbGncuSwu1MzebVWZGvYurNH9lwcVwiSAxbSHpqvCvbeIi9tuB7fYGjQ1i+8Pkkipu
	FLvmTMy2NreXfGAjRrx8FIYJoVIVBypyWZnc+HN7KoiDC/kbkiQroN746Xo/QyQQPaMQYaDa8r/
	mJw+wujM1m/Ei7Lnj/M06+bq7C2tEntv4EehEXfyvSmcM05dObggvK8K/SrcQD/osdqlR5sFIEx
	2TjxjSgSnxbNMrU01PpZ5tNYm7dGHiSp4cfDIbLgOSm2X6/GjyuEpBGEdd7m3qp6DFuWrkYXzDY
	jOHPya0Ako0QkUSB8yVrTK64hwOLcrsAzYG0hf4FjZwq8iOh4k7aZX0iTHnK7UjBSSQ=
X-Google-Smtp-Source: AGHT+IEP6aAh/Io2wIRKUzFE7varPmPkl8lIkBPxvX5iyzJD9r30P0SFXfObAZ7acHHQQFS0zDOKVA==
X-Received: by 2002:a05:600c:3583:b0:439:5b82:b9d7 with SMTP id 5b1f17b1804b1-4396e727076mr33086015e9.18.1739619187438;
        Sat, 15 Feb 2025 03:33:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: pinctrl: samsung: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:32:47 +0200
Message-ID: <20250215113248.159386-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 5296a9e4f..c3b82da0c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -42,6 +42,7 @@ properties:
       - samsung,s3c2450-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
+      - samsung,exynos2200-pinctrl
       - samsung,exynos3250-pinctrl
       - samsung,exynos4210-pinctrl
       - samsung,exynos4x12-pinctrl
-- 
2.43.0


