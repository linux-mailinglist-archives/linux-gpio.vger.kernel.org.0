Return-Path: <linux-gpio+bounces-8615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD094A3A3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7EB61C21053
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491301D172E;
	Wed,  7 Aug 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxRs8kPR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8011CCB31;
	Wed,  7 Aug 2024 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021759; cv=none; b=RRyNP8YyNr4V8hyj7YHLSZYB4VHyQ/w/nj+yrnhzey0JCH2h4bSJCAuc0CZA2jmo+fElqqQeNtdt9K0ABxh3u3nF1ek32Fa6yzmr85jtGd/o5ONLMG+8uH/kJ+Rjl0aXtnZ8wJCgakGEgHrXhGSxTLsplIKBQ/cAFqqWKPzDn+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021759; c=relaxed/simple;
	bh=vI0RIdSJ1znKAHvXqswxUlyowH7YZS3p7igsNCuLn0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eu5QJ+vEjmjp6hzZREG9tHXXNm4AnnNJb7MIMiklt2e5ERbtdmxJEb3Zu+vMwiW/NcdtGUBUQrdUnZHeaJVd/F0eElZOVcC13NJaXn78B1xkivrEj/U5amCmS65nK4UJ283S9ZbHmgCrAxrxf0qT3SQ38n0n+1WyzO1yJkjbY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxRs8kPR; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso15863491fa.2;
        Wed, 07 Aug 2024 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723021755; x=1723626555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxlRfq1HATSvQDl8g9hY9l8C4ar35ZDezyMHRtFeRHg=;
        b=HxRs8kPRV/vwPLzXl1NFboXVxtOYpgzAPoULeQaWrKc8sa7DbzmzvoiBoeHenzLeDf
         9X7kfk11heevSfXrWtQXn9jLiEXBboEjovkgFaHErlx1nD1UpynQ8DysM3LxgML32rS9
         Wp71f2AOmvs2XczaewuU9bCp+tisHm1fUzYRFqCE+lznQQPcQbLFCkIKOOej/yD635N7
         B/0O6IpTkjzKRWzgX0/Es/YFhz+CqsOC1faAxs5cNfWhYWmBksdQ5tSgCZdW3wUGXzv9
         5jxCyWb1OkSmoYCLe6zWOlUWsufmnst4RddsO+T0D2fKrxUxRgCtk+6kOcDjPRRsXqPI
         hwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021755; x=1723626555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxlRfq1HATSvQDl8g9hY9l8C4ar35ZDezyMHRtFeRHg=;
        b=paFQRMVRHRAEkeghb6qokhyvHItyxSoxQxvSVl1ilA5SwHXzZsxGBNble4KtB+rKMt
         gQxJV+K6BMX2v5+h4TPiUlcsBkVhD6M2DV9qukIHNZpBtaq3i1Jw/NE5FJtZlGs+okIb
         y3gHPsMCS22zrw+xlx/K5xqtV1b5Dmfxh6c9Bm4sEfzXyHcn9a907GjFkZ/vwwV41Tfg
         /j7ovGs/Y2pRM3I3zbv77eYGxsQ1JIIFwBCJJKlNIZsCkUJUSU1gl8I6COGEjRs4MF5Q
         E6CFbHBabznys50GcaShDfOmcmp8NjlC4b0gOdeSRMthCYckzbKeQ+FI0aR4edtArZqD
         1yUg==
X-Forwarded-Encrypted: i=1; AJvYcCW8dgQdnNYDzwlm6/0hVO56Ha5Ps/slnfewO32tErNqUK/ei3M6DIPKhpiqGyAgZt76NSnYMydU+ctdTodbnDaD3mTONOYU6Ia/7IhqkZ0/FAMmx7RpeGZQKQfDU1TvNPDm7/ASsxL+xobqcAjAtl5Ts7WcEqcV8nu38+9BoTWTqRZTMqg=
X-Gm-Message-State: AOJu0Yzlim0MQQZP0/cCFg1fjhYgPJrngff/557T2Nlljs2NMCLQcsE+
	SEl6TTheiA+Cxrjyzo2pNAPICPhaPRDuFyGimP6UC7xFVNGi2r0m
X-Google-Smtp-Source: AGHT+IEswZtq/7m7X5I0dzQSodMqJIkQ98Tj1xC2lHaUy2fSyxPi0oiv0jUwDqnr0oKz2LJCsGYJNw==
X-Received: by 2002:a2e:720a:0:b0:2ee:7dfe:d99c with SMTP id 38308e7fff4ca-2f15ab0c434mr128065641fa.31.1723021755339;
        Wed, 07 Aug 2024 02:09:15 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d37sm19860455e9.31.2024.08.07.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:09:14 -0700 (PDT)
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
Subject: [PATCH v2 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
Date: Wed,  7 Aug 2024 12:08:51 +0300
Message-Id: <20240807090858.356366-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
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
index b1118d377..2f794cee8 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -57,6 +57,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7420", 0xE7420000 },
 	/* Compatible with: samsung,exynos850-chipid */
 	{ "EXYNOS7885", 0xE7885000 },
+	{ "EXYNOS8895", 0xE8895000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },
-- 
2.34.1


