Return-Path: <linux-gpio+bounces-21494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B02AD83ED
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95736189A29F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 07:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8081528D8DE;
	Fri, 13 Jun 2025 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtlhvIw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F9228CF61
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 07:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798999; cv=none; b=n2D3+TB4ZRBPMjaYNi3TyIq6dDCmdwJTNTh0q42b6xAUDOEefajLCdqdYK/QGnSnm8r0mkEzO+RRZvOzYkZ7QGEO5ZkY/AkrslG+wX+vxkG5ubLbCd5LqeadWOVre45C/GmLJNQS2Lze82crhDe1NDaOZsiUVrEjNHuTA1X6Gqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798999; c=relaxed/simple;
	bh=uLqMD1ikwZk4jDZUwpPdjjE34o1A38fgA3R42TYK8w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIy+H8TGyJ78jdnlsXldBk36MhQBZrlm21I3bgiVj+unENTYDEkGogt0kAqJSz6Q0aZ+iySLbbG9OXeNddXftkNoM3r+aRMpToA1VVtzPcXJTgPBDvTCBJKMHIQC96KU3a+auIOo4llFw1R+GrhOt2jHRNBauXhxXhmKJzZhdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jtlhvIw5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb8b335so1514885e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 00:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749798994; x=1750403794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c+aX61jkwbmsT/oE3ldzclDSvOJeQY9LNH4JsyNxI8=;
        b=jtlhvIw50Mxx7a2/e7xe6bQmIi5WrjobeJWJP1h0/grQfYQGtjaL3AaM6rWwiCMm0r
         n34+ILb17ETcr9+83ksgClTmKntg8nH0KNWOdSu5EVPPW4Obx+kqGu6vSNw1CUiQZRTE
         UA/a4naG7Nv8V8hmvwGXAX4Sqr9/1RcEpg4egD/F5kxFv4j/3kHj9v1FqHuc7qVB4Gtq
         7U41LpDfTmAyvheToyHaYSHBDixsV0SysQCQxncRpBgDs2//ewkHsnvyf56b+zDv01FQ
         NYMArcXO1WtZPnpeEK1PIxsDUdNCgnGR5B/X+BA3nR6QJ+6q87MthiBuAuJD+rfx200t
         Dr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749798994; x=1750403794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c+aX61jkwbmsT/oE3ldzclDSvOJeQY9LNH4JsyNxI8=;
        b=fr6E4AJW4jFQuBOdNjNvDSfowS8W7702jKH+pP/2/glAhD8v6ZYJovqsn8xSRDGyGd
         qyhIcCI3cPF4P5ua60aPpRn4hzNdvOXpo8w3CXT9VeZUJrs2HFHra+Bov5nOdJPmce3R
         1XpbMVnd0XjHQdnk8VO1YVZMdjiQDbw93SeT3AifYy9zjk/jO5AMl6jxtJkR9ylsXz4n
         kJoqLo+BQDKBQfuAWudOr9CTbW7jKu9YmFGxf2Dd/1supn39YFpx+QEAa+JAE4XK1kgf
         iw3JVJw9MV0yqrppSM6YkFX1wIkxKs+pAVX+pHqPLfFCin8ndHeye68b6AmwHUsPdcm5
         XLCA==
X-Forwarded-Encrypted: i=1; AJvYcCWxQw8iy7tfQl5ah+EmwnAkN2r5SxD3UtDwyoCa32QV//LpRJH82vqxCOUtbYPJGd5ZUsmCk9Y0dnsw@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/gnLsqnTQtwM8Aogy0Kw0b/dawKRaXpwedNvSwmoc3XMPL12
	8ctY3RVqKdMEe68SYd27US1Sx5WqnMouL7/TR0a+93mrX6ddnLJj3DaAuVxoAzWKldE=
X-Gm-Gg: ASbGnctgKWu1WVQPqWIkWcp8KAWAAHEPFWhmeTZP8eZCmEcgDQmR9vg49uTJKz67VQw
	AthLi3h47RCnWfbqh2fEL2eS3vEjHg3tXI5WZKG53Yt3mSwWg1ckpzh/ALy88WyjiD5sUBtOM88
	HCZeWCcaOLIDthoGh4/vf1ibE7aL74xigBclKpGvPNa+GAlaNmBYCKAqsz9bTsatzzUNLfUtvhk
	+Fhvvwzm+OfpqBRy+UfbLePz7zepHBgBG8e/cd+ry8N42RO29VDzT4fqzkP6CxILm/kc90xaf+h
	ecf9Nk4JSi3aahp6mOVsOAL106yYBXpH1zsoT1XWbTNz5nJ36RTNni7lU+Pn28hdZEzTjy4ygw=
	=
X-Google-Smtp-Source: AGHT+IFNj98jwyXNQSYPoKhPA/7VYwqqMd3mGfUcA0Zg65b6bZ732T4TLtCrPhjPGhXTDHCYXrqdJw==
X-Received: by 2002:a05:600c:3d07:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-45334bb5396mr6765075e9.9.1749798994449;
        Fri, 13 Jun 2025 00:16:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54e71sm1438963f8f.1.2025.06.13.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: sloppy-logic-analyzer: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:28 +0200
Message-ID: <20250613071627.46687-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=uLqMD1ikwZk4jDZUwpPdjjE34o1A38fgA3R42TYK8w4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BLgF9K4JV8CHRk2dpoC2eYF2y3+yVWn/6qP
 WT2nDYGdJaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQSwAKCRDBN2bmhouD
 1zJaD/44p2svcOC+1wtktO2m6S1H1QYIXL+khF0ZpFd05UA8dFSZGo1EgpNpGYmRC7o940VftTo
 HrXGsydUYWDgtBODXNxmXBypMDi4W95D2EK1wPavgXQ2FbbK3cvhmwqWBsAAL+895tS0MPObMvH
 BK60MyTSEqDlPU9og9GNGVIRIP3fSc8yUT57JybzgpI1PnJWpbsvcnZKta1SunqLKxeZ9Pz+1l5
 dvlyL6XLEqmpqy7kIUXp/dA7TSu0z1yArOWzaFNEOXCtyCz9d1nZNziz/oTjQNPW/nEDVJH5xT5
 8wnlvkVi9Cc1EKEeCYXjawiztzHMcKsFFUzK7Tahjb719/NojmagcZ8cp1huGv/FsshkY5f06eM
 WBhKVkB+8xjwwCmzCpFCeTrA82CSxan+dIQ+E74M8J8ezufnjByvyb/zZrmOMKj9RPc5jXisAQe
 rz+hfx8md1EPau8FYV9BBmfmPJGWBFYxS8LQ/1F5e4mMgtuRMWg9o25/M4m+v5jpi/2mr7G4V8k
 HBuj/idLJNrO4dHDtzoEzIfz42bjhsc8thffLJg4Oh78PqFQa/vdP8WW9D4z1FBfpVT34WId/4x
 xFd5gZA3djwCOzLD9R49odRbCIy9MxnDJetHKAWOeOn6afur2UGdwWY46aZ5cKLRB497qeoKY3q bgsM64YsLWcdLlA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 8cf3b171c599..969dddd3d6fa 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -306,7 +306,7 @@ static void gpio_la_poll_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id gpio_la_poll_of_match[] = {
-	{ .compatible = GPIO_LA_NAME },
+	{ .compatible = "gpio-sloppy-logic-analyzer" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpio_la_poll_of_match);
-- 
2.45.2


