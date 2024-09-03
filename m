Return-Path: <linux-gpio+bounces-9642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7F969E1B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313A328526F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B842139C8;
	Tue,  3 Sep 2024 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK04jfb+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE41DAC50;
	Tue,  3 Sep 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367481; cv=none; b=girfkwZMg2cSOHtd9V2WaMdWL9UcjWLfwiuH8OyHcKemqXbycfP8Ol+H6s5Whh3Tc3NWnb8t0bfA1J7Sra33rtROJ4dk3muNdTqNQu9r2IXdiHz2wCc7W+HvHM+uhhXhyDHhHEasKlA6Abf8RAEgL/MfY/ei6dHmw6hcJ4iAf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367481; c=relaxed/simple;
	bh=/Ruh32dQtV6C6tPWdAdXoTd28+iuhF5xcHCs657ajK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IrpGH791Z2z8n2AtoFO8R8mnuoP+GZxTIljZMfL+s9dLouuRXqcC2sW/WIP5HBTF63HoYBqcJGyDCJyDVGzI6BtyP+fRa/oMTonl+cNcBSMRr6f+khD3nWhEUgXrmvalDF0Y731PZS9ynxiJsqM3tVER2m4JiWsc3v8LHwxLHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK04jfb+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343617fdddso9064843e87.0;
        Tue, 03 Sep 2024 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367478; x=1725972278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mchOkTk5Az/RlZsBiRAPflqmETPo/14771bmRbvFbew=;
        b=UK04jfb+yuNJ23rN2WUVEhW6HICoPk4ySEpMhbDheq7ize7R7eeP9zIYdeY6Cr1fCe
         hSoZebvxFhfh4Qb9DiBmPVDRcDttIpch+X60WmVJ3eiuT1HMkmy9O3lebGK+zqdPNc5D
         PBAJzChM+f/iMGZXBWrtgs36j4XUw7q7Wygz18xTslzRWT8A8I5LDpOSqu11kVaAGVLa
         w+qor9MJfRR4hocs9CLP8XbFDs2waQRvff6MkYvRUIyajGhXmHJm7qr6Ww0M5iOoljVo
         +09McMGSKBPRavso+GzJIJU5nIjRFqGHLtItl596EygCOpP6fxjWOui2Ahlvsf9788cU
         VS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367478; x=1725972278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mchOkTk5Az/RlZsBiRAPflqmETPo/14771bmRbvFbew=;
        b=VpOrAAIl8TYgWDp5eQE26c6Q04uxPc/h7MX2lM7UYE4I0OKt4+JZlSt2w1bICFvIAb
         5YAC6BSkuD4weBuOHkZ71OhbiYbfey85hzmelJOtrN6W9mBwqWQKo9YGo/V1bSbnBjGL
         1HE0lrCBLn9F4hNZUg5Yb4VZ1TXNGyTDGiRKzWQuRsKBQLQauTAH7/LCC2GO9o3EyGQZ
         5HATOs17/InB466W4Uyys2PtBCYdEiyQmFJv/mlWGFkMA2bjYyuAlAkZJe6veZl265jS
         XabAppBNRoiOouNPHMCNESZd6wXoBcWTHimKEfEiIom07whOum1fmsP7wAt9oHB2tkjd
         V29w==
X-Forwarded-Encrypted: i=1; AJvYcCUBpVdliNqS8qerv2jNIwNRv9mzHcudj8q3iRMfsxF3u1wXJP/cy2x5ROGwkgXNvSyIuTmzgeO9DvX3Ew==@vger.kernel.org, AJvYcCXYx8KJOdjXkS3LZgrSybtr3UGujc+II/OhdMvtVU4Oj4Eifxbap8WmnWmj6iNl8/l97qLoobGzBpXAvXyS@vger.kernel.org, AJvYcCXdxg05gicwKaKn0xlixd5qiYxnzk8zU7nTLvwWNfBs9u7an7eQJCP68iS0Zt3/7podU55/142FNXmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1YQbx3RCF/mpU0p/kKh3B50ABCTlw6qLhL/Okpzki+wX2qeq
	VoxZ5h4tnuakgos20W7k5gvf09jIhppMdaOLsNM1Z07odfOpGi23
X-Google-Smtp-Source: AGHT+IG64E1pMDrb8+tfxPYYMpB+Om0xzHbVLJbn21+++8CeZbRf7+akZlhm8KDxBv5WA5eKn+vOAw==
X-Received: by 2002:a05:6512:31cf:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-53546bfcc07mr12389696e87.51.1725367477971;
        Tue, 03 Sep 2024 05:44:37 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:37 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
Date: Tue,  3 Sep 2024 15:44:22 +0300
Message-Id: <20240903124429.107076-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EXYNOS8895 information to soc_ids tables. This SoC product id
is "0xE8895000".

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index b1118d377..9e00ac8de 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -58,6 +58,7 @@ static const struct exynos_soc_id {
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
+	{ "EXYNOS8895", 0xE8895000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
 };
-- 
2.34.1


