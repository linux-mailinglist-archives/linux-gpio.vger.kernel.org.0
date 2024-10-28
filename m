Return-Path: <linux-gpio+bounces-12213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5D9B2B65
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FCE6B2257C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B153D1B0F3B;
	Mon, 28 Oct 2024 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUX5CN6E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC881D5AB4;
	Mon, 28 Oct 2024 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107384; cv=none; b=uMmVebsoyMiCNGmTIAE4OSqje8Q3Qe3Al3rAj15BUZK/e6TDhsj7MvwqcEuj4ZT4SLTh6a3Jg9U8PseFVJHxo+o9KZ/b/anGYuCfI7PeTz7PzySeK73/kAmqM0XrEMuqaq7MqCDjGNnOYnV+UvgMY+8ej0wPMeTTZOZ3dq0gyow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107384; c=relaxed/simple;
	bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmBrjLx10fKsmdkV1XrUHRzXLzYAZsYxOEeGMJATSpHmPgrWMyUod3Q8hphpXEdmeEGBZOiEbkXRrXV2N353nrYnYV7RKA7dKCEcR0Mv6HR/ipMCZZgB4h8ghvZrBErrkDoB+3nX2YUNBQqMCZMkeKnIZGBbJ/3KaimQRlYRi7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUX5CN6E; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f72c913aso5080401e87.1;
        Mon, 28 Oct 2024 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107378; x=1730712178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=WUX5CN6EGbCfacOPv7NyHIWn59YIS3P8GlJ+NGENp4zj8hu2wrVYhw55y9T72COk8G
         0hRUW40esJXFBWAHW6Ol2QZyISuSVpInK/IQPLKHADZ8IhDp5hRw8dBSVws4FtemVxfT
         qJNLqK2XDndFFrjqteLEkpL//yQhHDxDaKzzxv8hclZIcPAgd4WTN3UxkfIIk8nOn76e
         UtZWkPYRXn86n/7jv52QxJF/lQUA9VXAAWvoO21BL75k3iXqqm1F/fJ9a4YhluHIfdgQ
         QM9tAu79LIZBTalt4pvLOrSXdP+rihrf6UgH5xqMiOwTLRodGUxzKg518CWoS2vfvCyt
         jE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107378; x=1730712178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=wYf76H9whEoFx1K/OmCDCI2h8Cg5KxKEU1Q0TEaPJNEKPPtvnWFQREcBWKbIMn0v6T
         9KgEcBtN4sacmu1vHaBu1JjdEwVsazxkVi3UbdUDtPfOW68vN8NTgewIV9gSqSZtwhx+
         IcXGh5Rno8ZDKCWShcIdZok6x4HAxGURiSFqETcdx+JBsCGo3CIj9qVAVlIT11gU1VBZ
         5jQ19fFn1rlhop9AThv5aUwR8VAjsZwrFIS/PxepauQknTwiV18qvzpA1Pg4Q99fZ4n1
         JX/tyVps3WTiDJagXYwForMpCnrdwHfjkpMtOt5BVdoK5SGOL/tSrSBu3+ANh0YLafyV
         jxRw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Z58BRtgEDAHQPNhoVkPCxJ9bRk/n6svyc1ql4fZL/NBkCGYkXKYvXnB1CCWEWhvWW7K+NJiORY2H@vger.kernel.org, AJvYcCV56rC/T9RoRMVtvmJfYukUExcmAaX/PYv//R699pO5AsI8tXx9o5iHAuzGLNVTjFcbDj9iz9p4TZfNlNXC@vger.kernel.org, AJvYcCX5BoXGK/bq7KQCxewg20oNrOW/pkCv2IRoaa2vj7/5WqRTW+TkuPJxAG4RlRrmbZ8c0m53fqb4VLFexb/+QQYT3gA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pATFCGdAOjOTcFCdkrmEEOe/dNvqi+arbjOy6H17MFmqRI91
	53etp7nP3Wb6b85wWHscEh8+WY2M4tka1t0eBMKohC4e79UDj+EAQ42mkw==
X-Google-Smtp-Source: AGHT+IGkef3HGo+qiSbkHHbqdccXE80ho2uJc7KuN9SzEldCCfuT107SCvwkHYC8p+RFSJWq/VtkVQ==
X-Received: by 2002:a05:6512:3e1f:b0:539:eb82:d45b with SMTP id 2adb3069b0e04-53b34c41d5amr2098232e87.56.1730107378267;
        Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:33 +0200
Subject: [PATCH v4 05/10] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-5-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1139;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
 b=BzqBkS/JjTAQgeZrbGmsIeoWOvNem3Z6/fZqBLEP25na3UUEyLPEvnDKuUEqkKr1n+Bvifgb8
 uet3RjHNxHTAFND4h/HaUpKSd0Dot7FUZ9cXaHzD2PFQcTUTcvlBb77
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add compatible for Samsung Exynos9810 PMU to the schema.
Like on other devices, it contains various registers related
to power management and other vital to SoC functions.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


