Return-Path: <linux-gpio+bounces-21869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD6AE0347
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61F21892531
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE3E227E83;
	Thu, 19 Jun 2025 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHmd9Quk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D383085A3
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331906; cv=none; b=dLFAaqFhU6odwRUVotM3RJ4No6dhjOrMnUoIqKauJOEmMX9nA+9YmQk4o4G/3uZgdjv6iPUuzZyl6cHXyZJXnELPOSpFr/tEJl776jFKFkT7ugVkhDQXsoTolgfVhbuS68D0CBemMhCrM+GjI+4d5Dd7/ozUV0bUR58KE4YkgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331906; c=relaxed/simple;
	bh=3xBT1L8I6TNRRff1Q5/u26yR0koFA81Rb/IbdPbqOko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DePZZMTRp4caVY8WXfaOrA6Gt+Ax1p4f2GYyjrGAsuItzhCip6RQMzz9TkDOjJZLLf9GWzACDsr68aKxDr9khxE9z3xf7r1u8rB1c2S7IhcyyySrAIDuEEsSPICNY4tCQ9yK0Clqi3w4vwBz1y4RUA25xAgM11UeAZp+n6inLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHmd9Quk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so335081f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750331903; x=1750936703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fvf7YFNk9hgZaIBMwH5Oxgd1wYDkkE9Dk+oH7pOxYY=;
        b=dHmd9Qukj2rlQ0RVAuHFBTa5dBcvxD5RgAbajYvcLqZ4PrRI+nkWJDduMkWO1Vl9lM
         q9uh+BrPhCHAv866weNiw+bzKpj3BPOj5Cue1LJyFLfimv0MJ4wZ9EnupsSCPsKLhPmo
         icAE3X2fVt0kXLa//nz8dxuVlCstrZzXOii2H13uA78J3KPrslw1tEOwVFNSJcG3O51X
         Owv/g+tZPsXF7pZsHwTG0dS19MN5wG2XTVZ0xdi0UBpvhylLBij/Mxfant7B6cypeGMG
         aN41MVbiweyIfWnj7jiNC+Jwvv0+8gUR+o7/l7m90fgjWAoGsG9sdcU+ELFeknh+V+ZC
         skIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331903; x=1750936703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fvf7YFNk9hgZaIBMwH5Oxgd1wYDkkE9Dk+oH7pOxYY=;
        b=OsUEsoQvatwz4u0UrB9MwuHfBWc8MzngGdaRqPjeWtKCBThVLnB2XCoSVWsxP8VtMy
         Pqt+vPttahdcuNrh4LZfDXoGpDDxJD8MfRc1MXfgdk1Gt2jIP58hhfQ/QyeXDQ5LOWnI
         UUIg0d0Xndqd58MjWYt8ADj15RgHKldfOgdZAZInDsEGmbIAPG1JCzhvQ9K888OEOoiT
         Jz7Ywr7B/e4uT8cyn5KZvqIePhOVo973XAX0RDqoryRqXcOXfME4snnqbl7gYaDOckdY
         VR21cDZ4+ojH9RyntvqA1ShvGpDOzY2nQdyhWWhr/bS19t+9WkIuwmt7blJDeI2qcz4H
         Wj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaw6QuCLEAFVpbNo4qe78A98Uq5W/iyEJC0kdXGScy9kHyTa5VcemL7V5sjqDOWDLseFSo0YPxPYlW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCd1GFXpIWtK/iV7pxTfyprckL+Mhja/klKlONnQaEjmYgg2m
	f9fXwxh1raDTNyIv+HFmUJqX3Y4isewxNlmlvbwle17dkN2JWtzC8sYBfGUR1R/mNPCVhGYMk8Q
	QmEVb
X-Gm-Gg: ASbGnct7k2+C9ClPwesWKvTPibkAeo6Le9KVwqhpl7y/yE6Z+7PL41Fu+5W/KOb66j1
	mcFI+HkwfYJwKoUsDTsCCx7gR813zp9NF1kg4ef5ChF18HNvWRoisTV06Vx03fGDBuvNk+No1OQ
	ZH5qMNYwYJqdnxU5cnyamhd6szlpJXvEi1H4nZWYbTvnB8OV4colAlQ/k+VJ09mzZ5cvcn6xey5
	3nZqAppyn+PIiGY6gYh+u8rOo1xb503XQV5WtvGnAbJ3fO3fc2pZFe2fShcA9kp0P6r3wf4r4qM
	2GXyAexM/biLfZ7a3O2ikVFlPlNWSeGNyxYQ+zC3YGuuNzM0wD/1/nH1hUzxMvEMmqmCUmetBrZ
	LWbVx3tId/W1/Yp1j
X-Google-Smtp-Source: AGHT+IEAqQjOcoAnpyzophi6mRFHajmHtj9QIjRFkm/NOIYibt3bAKSIyjkYnPLx3bhYlV5yilrOcA==
X-Received: by 2002:a05:6000:4024:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a5723a2907mr14065943f8f.13.1750331903200;
        Thu, 19 Jun 2025 04:18:23 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm25674375e9.26.2025.06.19.04.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:18:22 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 19 Jun 2025 12:18:15 +0100
Subject: [PATCH 1/2] pinctrl: samsung: rename exynosautov920_retention_data
 to no_retention_data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gs101-eint-mask-v1-1-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3xBT1L8I6TNRRff1Q5/u26yR0koFA81Rb/IbdPbqOko=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoU/H7wfYr2rXyNKdlg6SW6TglHvBZIDQC5oY73
 6RHG1SOE+SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaFPx+wAKCRDO6LjWAjRy
 uieOD/9Oz+JuAQTo4NeJIF0oxjINRvPiNiF3dnirauG3D/pn3bu1nOmbTdr56fq3OuS0bhKywRD
 wwo8uSmB4R/ojhYjn2uGlFMbqwiZACJFmjq1XyRbFpkERiZ1PUtSDkA+ARJFcOt907bF/p72x1+
 XJYR4oqki+UuzHp+eEJ0b6go7rI9gmIXUo3Mcksxm4/FkbetMCdbcNF3+m/pzqdcHgkPlinMQL4
 36rRZ4ggeeHUndmrJi+CbRGgG4SbZjwIeEJ6rTzPlULRTnRACUkOmSZkq2oS2ESHboV6p0Jf2GT
 yw4RK2dJlhc2QI6MNLH/rnNVRL4Ma45++M8EdAkOPXChF3b3PSlaNvPTCNeQSb25CI7WG7VwEVz
 dIc4aFRvUzE8MGd9eHvpPf9B1vdB0Uh8PQLjtbMqz+rOTmui/N5SUoVydOGZ5gaHcKTBWsGtXKW
 3HAWhJPR7rR5b9LC3VdENoWL+JgYR7Ir4xZX26ze0lBo6V2X3GVWBghTFVB/kHPfsRc5HCAxEVK
 jrdZTaB1y0iJ0midI3yuxCUagEqZAWwDyvKOEWhgEIVrXb541/Xb1SXrXxHSJoI9PqOeYduOlhn
 R2ppA+niNAaR7eBDnwN1MHn3dF2SMB/iCmW1i9+zujxzh7XaMYfORrv24Bmz5jxyRsTZrPyOTR8
 LZT5Dtlb7siS0Ow==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

To avoid having an exact copy of this struct for gs101 rename it and use it
for both SoCs for eint banks.

The purpose of this for exynosautov920 and gs101 is to obtain the PMU
syscon for writing the calculated WAKEUP_MASK register(s).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 9fd894729a7b87c3e144ff90921a1cadbde93d3d..5fe7c4b9f7bd424f396082f1b1b16bfb65f26cdf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1405,7 +1405,7 @@ static const struct samsung_pin_bank_data exynosautov920_pin_banks7[] = {
 	EXYNOSV920_PIN_BANK_EINTG(8, 0x8000, "gpg1",  0x18, 0x24, 0x28),
 };
 
-static const struct samsung_retention_data exynosautov920_retention_data __initconst = {
+static const struct samsung_retention_data no_retention_data __initconst = {
 	.regs	 = NULL,
 	.nr_regs = 0,
 	.value	 = 0,
@@ -1421,7 +1421,7 @@ static const struct samsung_pin_ctrl exynosautov920_pin_ctrl[] = {
 		.eint_wkup_init	= exynos_eint_wkup_init,
 		.suspend	= exynosautov920_pinctrl_suspend,
 		.resume		= exynosautov920_pinctrl_resume,
-		.retention_data	= &exynosautov920_retention_data,
+		.retention_data	= &no_retention_data,
 	}, {
 		/* pin-controller instance 1 AUD data */
 		.pin_banks	= exynosautov920_pin_banks1,
@@ -1764,6 +1764,7 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.suspend	= gs101_pinctrl_suspend,
 		.resume		= gs101_pinctrl_resume,
+		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
 		.pin_banks	= gs101_pin_far_alive,
@@ -1771,6 +1772,7 @@ static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
 		.eint_wkup_init = exynos_eint_wkup_init,
 		.suspend	= gs101_pinctrl_suspend,
 		.resume		= gs101_pinctrl_resume,
+		.retention_data = &no_retention_data,
 	}, {
 		/* pin banks of gs101 pin-controller (GSACORE) */
 		.pin_banks	= gs101_pin_gsacore,

-- 
2.50.0.rc2.701.gf1e915cc24-goog


