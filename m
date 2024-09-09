Return-Path: <linux-gpio+bounces-9912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96649715FA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E638B25D20
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302D21B6539;
	Mon,  9 Sep 2024 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef4tANVC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C81B5EAD;
	Mon,  9 Sep 2024 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879657; cv=none; b=KRcYHUIlkPcmwc/r6mPmdhMl3BbxmzpAOrIkSIvXID/Zms1Igkf7AKQJgdKYgJNR7y6apSD5gf/s3GmT+5UpesUMOyee9a4oGU/5Xd9RNiQP2Pf789vzQBftRrp8llRBCP6u7rF4LhUnBrIULb90KZHp7CNLIEkB2gsacfJQDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879657; c=relaxed/simple;
	bh=/Ruh32dQtV6C6tPWdAdXoTd28+iuhF5xcHCs657ajK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DY2BPAKVjZy79DrplGIgALxXtHDsHuuijvUjIr/fYkXhjFw2B97vWKAWi/LDRxfVdc156wbqPkxrOYFDhfzL6sd9EzdXRiuMTHVZntzMgD1LgWFJaGYXXiBoNDDPkOyTGalkOnUIbgz4+rlBnp45nzhsmZ3gZHToHtMRoSgyss8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef4tANVC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso10022332a12.0;
        Mon, 09 Sep 2024 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879654; x=1726484454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mchOkTk5Az/RlZsBiRAPflqmETPo/14771bmRbvFbew=;
        b=Ef4tANVCCcFW6ZqgdVMXo0tQgFWdGGjeyhWhRf0B4/uSQzkQW1MGqTJGQRAnhzaHo4
         hKePaS94D8yGvOLe7y33wJSci7XqJwdWw8aLGiIFHsctPIUNQZaIEnM1/RlKV9+P47Iu
         vMWWeY67pJfuzhjMiprzGLxJyLSWtZ6/1QNLFXiRmS3DnXAlZ+T0hI0f52pmKiwuKFfg
         KL9deV3tnWC0GqUyzgk0MPt8ZHqXdRVsq7irqoVPI+EOLpLpaBzZkH7MlOiAqG7TxXPr
         gr5iwlkU1j7V/7sZhHh6WW3M42FOpl1b0/Swthzb3MCmpPA3EYQnBG9gE3UIZLiaFt2u
         Drww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879654; x=1726484454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mchOkTk5Az/RlZsBiRAPflqmETPo/14771bmRbvFbew=;
        b=vfFHr9D4faqRBE8EXQHs38EBt62nhaBya1SFcAbCix2mbzpsBfU7nVy0Oqc1LLMfq1
         /ebXFM5YSFRMYnkstsIMKNJLCA7F8iHqQe9/TFbjknESG4siYF/iWdQ/40LZgWFP3WeF
         L06yp8+DZHblblpGUkGHy3BqQ09d+kKIpfyayFWAbE59bdTvarfl1qH8GSHD7AAg4gQ1
         8lvuv43MxUu2EN2FFVk189Ky0Z3S/Y2JzaOg3SdqGAQv2OukGbSR9WNj5oWruPLwd3xA
         +1rkZXXP8VkFHNytS+PWpxSPVD24LK5O9WsMFeHSG9ZzWSVA4Kl2Y9BassyfS1WYOYae
         5APg==
X-Forwarded-Encrypted: i=1; AJvYcCVY0tj0I4b/imK5nqItodE5pf5kHb80i6H68gxulm2VCReXtT2CpvrVsXmJjfaEyxSk0qNTtTpXv0ubP55O@vger.kernel.org, AJvYcCVenD9nwwdeWwi+hKPSJ0IOAmlkPRBeWPH5mdeVDFT3sDRWHnDFV0DgWA7ZKcrVK6XeSDcMqI7//dBh@vger.kernel.org, AJvYcCWNqeWbh7KHPxvRkoMGQPc37MDPI8SrF616Vb9CXv397imIEUoUjTt36ZYX6sJQxUZJOFTfYGU6W9FqMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhmTPAgac7iKIGY8INpm7qCBgZt4FtGMq3MOl1LdYhCZMz6re
	LDv1RmS7f55yEWJ3lHr6NeyFD5Vwj3al9QgTa6tC9hEbBcDBtB4K
X-Google-Smtp-Source: AGHT+IGOk/uy3VobagAV9wWMpeab+0vAPZ4INBsF5y2B+qEz/pBYjwGcKEX/0LTe32xymOWC1K27pA==
X-Received: by 2002:a17:907:3f83:b0:a86:91a5:4d09 with SMTP id a640c23a62f3a-a8a863f2ea5mr1203162566b.26.1725879653640;
        Mon, 09 Sep 2024 04:00:53 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:53 -0700 (PDT)
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
Subject: [PATCH v4 03/10] soc: samsung: exynos-chipid: add exynos8895 SoC support
Date: Mon,  9 Sep 2024 14:00:10 +0300
Message-Id: <20240909110017.419960-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
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


