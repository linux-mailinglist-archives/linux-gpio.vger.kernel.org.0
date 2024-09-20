Return-Path: <linux-gpio+bounces-10321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B497D7B8
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 17:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC74287E42
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5C3181D00;
	Fri, 20 Sep 2024 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTspKijT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5B76026;
	Fri, 20 Sep 2024 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847124; cv=none; b=Qf5FGkFUaiDQeMyedZX/WKHKJ3qRxWkb8e230cTzr4r7ULkbfZFm1eHuKAmQQs2mET7Z6PU0y/FGPe9leY3C4WwL6ckM3vAS6vqTgNdZ6On3wBjSlMMWw/SUEJ+x0ZKrmVyK1asalZEydvB4G73GtgV8fvAAjMdOmNTN9+4BIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847124; c=relaxed/simple;
	bh=Vbr+qL+l9qgGtP9JjdPcKkgCw59+u/mbHPDbfem2cKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9rLR2Ar5q1lakkIlUmvQ6WzfchHFouA3kiQLVUA8pg2IDfASeWHh4eSIUUjIKVm2HZbykghx8DpvHTRTS77wCDGB7t20/uUwNg3tvoTHe8tTlqF14fJmjRBP9ZMrCg7R53ocdGkBkZ0lXALXHFkR1OQNoDkQQhZdDRCS32T2ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTspKijT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cafda818aso19964125e9.2;
        Fri, 20 Sep 2024 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726847121; x=1727451921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rZEHFg7e16eJD/BbJaGTYxJQBlSimzLkdBWE2FUz+w=;
        b=iTspKijTQzU0mrLRgKd7IxbyVYiLDPDg6P94Rj4T3Z0A3nzzmip2lZA7T8I6ptNPaU
         SMW03Olig1r9xCKmD0nKiXDFko26buZ12sKxpYU5BjnHym5Cl6bXFs83yQsq1T7/WTNP
         YyC0O9K+cAgzndc/IvRNW1p6746fyNImoRpvCESigIqKwVV7cJjwgm27uE6TOc2SVgko
         dCo+VW8Wotv60reFMAYXdFJtPGVzrWRN0kN9mtN68wBE+fItQg7rth0DtEgepJDoF13F
         lUMMgtu2nNaTEAzkhplyW66n3NqblGDOqfJetqiKbdj2/f/8WN0GXhb8YOBBlcTwMPgB
         C2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847121; x=1727451921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rZEHFg7e16eJD/BbJaGTYxJQBlSimzLkdBWE2FUz+w=;
        b=DiaYONPvCr4Uc+zyP12kEKMNAeZsMVAMtfZ3AQvRycNz4bkVQBMgkggAmpWGq58t2T
         IzX4nCXsi7rt0B0ZgJVs3GYwwn4B8i+bKTcPS3bhZmaEE32XnSGsatjr2+4tORqBGQz2
         AEXzJe3ZaD793k902HKkeVpcgvJTYqpKaWMkTeqDSdhy+fU073aCjf9j/W6wWlIF7lrC
         fSZauIzaPCbiVzObd+6HjMMm/ocJs26spzkQSo7NwsljDvWIN6rMCGL/D/MSbqDz6UaO
         RHLhqAup9K641qYZvVDWweZScs12Y345tyWPACKmr4nEJ10VhmKZnc5zRj2aMEaKbjtT
         TL8A==
X-Forwarded-Encrypted: i=1; AJvYcCWf6LQeHBw6iPlHlZ4xzZEQ1M3MLU4a6EQ7cs5eJEZ0jOPy5YBmYiUxn04YVDHI4329Ho6PeJserFAo@vger.kernel.org, AJvYcCWkwVJNjNXwh8GthX5Ls4Ebnvr7G/h8DhiOb3XsoZgXNQobgnKFaHAtLGIyqZjwJPzW95XBb5LTopdt1KMc@vger.kernel.org, AJvYcCXu/5ue7u7ptmFVqi8meCKeQczdaIE675Lre+irabeorOGXcEpsvLlZvXf0To/hsp4hfFGbmlVWxzV7rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsxUd+aDrurdUoeeG6bsUo8Dj5PgYbfZEiu7wxXVpp7d3FEI+
	6p7nieUvkr7rla9EUPD7FFfvm1CzIQdQODCWaTf77apwdLrMJJiK
X-Google-Smtp-Source: AGHT+IGWeXNIuIG9gYDvIgB/DnpHPdXOOE1VrSnd3E2Ga9eTS82mq04xru/wUMWY2I5i9AO3i/Ampg==
X-Received: by 2002:a5d:52c8:0:b0:374:c943:4c0f with SMTP id ffacd0b85a97d-37a42fd83a4mr1621330f8f.0.1726847120911;
        Fri, 20 Sep 2024 08:45:20 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm17772839f8f.115.2024.09.20.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:45:20 -0700 (PDT)
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
Subject: [PATCH v5 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
Date: Fri, 20 Sep 2024 18:45:01 +0300
Message-Id: <20240920154508.1618410-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EXYNOS8895 information to soc_ids tables. This SoC product id
is "0xE8895000".

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


