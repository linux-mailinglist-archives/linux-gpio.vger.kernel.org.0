Return-Path: <linux-gpio+bounces-12214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1519B2B68
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9E0280EDE
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1CD1D7E47;
	Mon, 28 Oct 2024 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIf4QfCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C231D61A4;
	Mon, 28 Oct 2024 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107385; cv=none; b=HKG4uD2yIzbjHOATXfApryEUDhZhYE4XOaOqJvg47I9MZVvCLrCrZ9XP/AZad9WSmJ1/C9W9bTB6vYhJjSHYQBNvwkA/tM2TsPbKg7ik3NMlr1ZpdQyFC1c1O6TpXZPx15vVwETxx9VOdOMgw24XL2PF77Um6KY93zSmlAg9Ypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107385; c=relaxed/simple;
	bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sngqLQUzBuBPZd30wngjsHisLKOLGYr2r+05n9q6+fzDfBJPfrcNt+Y0IIZwpIOk4LNPGnZLVXw+zv/Pu914Vq3bQzbpH7ywBsyHg4S5iOP8hMvWYy7wx6zWXQNEyrvdpHcor2wwKB9Ijwshbgz7qNPTHsvsQXjmmESVtZYgy/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIf4QfCy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e690479cso3852720e87.3;
        Mon, 28 Oct 2024 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107381; x=1730712181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=SIf4QfCyhYpk9en6DhCaXrq9xr2BrRf8Rp84FVRyepb3DrkSi05Wp6LWUqzQ/9ols4
         B1D1V7sd8Xr23bUr1hU+3BMm0P9Ij/xIIH5FmdI98yyEWAphOEZQDfa31rlcWVJgymhg
         bu5yQgx/WNFJkJ7ORHIYeDzKC7lQ9fq+jfv1Tus6pcuJjc2JaJ0XwXQevOC2uifARdag
         qRHaWK2i32TSoq9+2XkAa5TXmDVVIWx/B5WSrL6Xmc6s27IzIix3ao8EHDvlSsOgdf/t
         7Yj3U5+HiI/XoL1XRXIHKxbkM9uUykh+xQz61lFbX3SxKQDBSfZ1lu7fL9FiEpdeH2zc
         zx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107381; x=1730712181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=QS411mXSurpL9x+xvQo4WMfakYKZTZz+fJZlKxtTLugMiIeg4bO0PMD8k8IPzEIQJb
         TN9Hbd4ZrqEWL+ZRlwmIUzCIxCzmGhwXNnWSLbCfqzwqP95Tg2j4GC9mRtp9bxYv2u0F
         fzSJnZra2zYBLpdMEVYa4JyGWXKxnDsHwy1ZSoCT9q+YjDPcqcGGjM5Qdsu/+JWEDofw
         Ig9PQTu4bLcvD7zSq4q6p6Zw1VQiuGI2NfyVzTo6ZQ7dX9MmdGD8TwW5TBQc+R5mcEt+
         0z6k593WgNsUwgmA4Xyp5+cWIocMfQaebo465oExwGGsNIzRgtAo/Deox0juCQXTrMOL
         eqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVey6D2S8CiYvWxcu7uMjk2guTAwxYPdUyGsq1I9SXx4YndnqUGJh3qYaoVHsTYPago1p1RPpU7ykNI@vger.kernel.org, AJvYcCVvmM48KR08Nr0KDjChs4Wl8LYJrKRCZwGjfg+5xIzZrybWqBfDu7ZShNqPFKW5hwsoDePUjaN6ejMNkXMr8el0gGs=@vger.kernel.org, AJvYcCWqJ0TIxckH+9ZqFpYBZdYb9ESQ9lU512mQwCvLhYKsvgpvhXrF9rb6rTdP9qomY/NzEpzWxCu55vMwtkrB@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwOAln/SG9vjZ3VTCHycJ8ZO10WU5rA46ZEy0WLB5UXiaa9sS
	gdxGaQH1qvZKlR1FddWOweMFTKyu/z3Dz7GosX7vJUzROX5b+jO+
X-Google-Smtp-Source: AGHT+IEt083O6CT7AeEmqZollBJQYbaWxn/JpO0WvFxIhUiYyRXYkjBYaaUe1bqZgDhu1R3ZSUQKjQ==
X-Received: by 2002:a05:6512:124c:b0:539:8d2c:c01c with SMTP id 2adb3069b0e04-53b3491e0dfmr2664379e87.41.1730107381211;
        Mon, 28 Oct 2024 02:23:01 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:23:00 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:35 +0200
Subject: [PATCH v4 07/10] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-7-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=938;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
 b=f1vCIJ9anD7EW/S1jHqDde3L1h2YQMkMCv8esVK0ODs52bHlEJo+uZvBnxlE9r+4En0o2wM36
 HDV5y4csjghCKsEQGuTsT3hswbecYcvpcG1OGrMjTKXGGvfGgDeVZb7
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


