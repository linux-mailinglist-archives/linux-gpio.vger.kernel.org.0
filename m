Return-Path: <linux-gpio+bounces-25221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D18B3CA7C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 13:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D345E5804AE
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 11:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180EF26F445;
	Sat, 30 Aug 2025 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aI1QjPud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23011E47A3
	for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552626; cv=none; b=kPqs/zddwYTA7Bcg32rFkW2sqeSEeAibZXXdFxZ4rjtGIc75dkN4voUdPLN7ru88y+DXhIQayjl/+vkMJxgm1NKaGalvpZeauxDM6vgJo4Zd9HfhuVfgjoeeyZKJpAH3hK35gKBRwEYPe5l3jMHWM2wqTMf37A4uJhirm7CO2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552626; c=relaxed/simple;
	bh=E0gq6DxSh3Mfd2fh/IwMmACtaozlVHjrWxf6F/SWbtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlDQgds3fgpa2guZkkTVjAo/PS0m0eQL2fQaUzObJ8SBtsVW5HNT2C8KtPESlC1GvuKZFogSTU7wX+hZ9fei41hlkn+RwV26bM2WXPhECUHHA+JW7b1dZlL8dFUIOi28BBVADUfMQkHYjCA7HxKfm3aHE4n+OTYEYjQx/sArLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aI1QjPud; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cad8d2a3eso402011a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552623; x=1757157423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=aI1QjPudCyTq/xp8gEd7LybOkLQdjMZLCtxKRkFu9OdIrvN3HPg6YuapnlTkY/JFcl
         b2gdu48tNSSSoc9vnKEfnGla+Xw3c2R75c+XV3q5oAK9WFP8gzb6u5aoZ0h9wxP99XVj
         Z5v9mARDEe9aNdV9wk7tg7Kwu3O1sE0A5QE/kz82IIB6WmNxmyotCtIj9075zK3k7o8F
         iI1XveOLoMjeoGvDFSi1jVnnNyZPVhCMFL9lkShc5rsUtZC/0zPvws+rGBw5N2DEO4k8
         GwJ0WRWOtf1koZB0WXvpDERsDdD23E/JHvoakWhnzMUUS4gqOMJ+gQ7EEXddNmEjp1ZD
         Wn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552623; x=1757157423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrtE3Q82QK6+GBZEOdbY1kXklQMDVX/x3b7hwZm2YeA=;
        b=Pr3mIt5gd7YbMA3sYwwqk30ijh+rU+MRFQ3jBkamNWBlFcDcnBYekRy+MvhccIoMxc
         311KGcIHm2eNuxgAProSfGSY5lQvSH/+2/lbm+gVySl19QTLAWEdZV6h1STBXZfDwUqA
         2D+FNH36MdRm2KX8Xel2ah8q0IblrCeSK4BYMrVc6XzaIH+cZ1pPzefRsZ3E0Vvnf3++
         wj8LCLGRF4yw1IX8bVYTfqOIHlEvLGJPY4yV6AlH/YPT/1Hlky/Skcms0YG7Xhk0PcCy
         TKjVFDgy+AiPKoHzE4PGCgZYIf+fq4gmZ4GAcmTu3dy3Kpu+l8weka9D6tMA5/VzhoQO
         pmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbcbRDavNrVHaX2HC3T5egJcDFf+E7kOwzkry3O7Boz0mmY4R5GY3KPKo2xeXsUnOzE0eT0KSkOJZU@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJZD9rPNcsZzxdIaGWMFAXvK7wU64MrHJE/1RvcoFomVIPFLE
	joHSbHu8RJhhojAFYepDC3863RVJ4toFtlpVsFewY6jkoz1JLki2h/EVsShBQ4U4bJ0=
X-Gm-Gg: ASbGnctscLiogLacsC7hy5IQYiZfv/5DaxCxUc8dtDryjD3rex+QjvsfBlL7iZiBdqE
	x3NV09F1rAVzDCq5EW5TyZ3q07NAe4rnZkUbkCj5kx9YngrCyVm4HwWdRuK5T3riHrORPluAYSH
	r3+C3nqzB8zsFUm7AgoTLCpZASzeJREXlpnNrQ7hZ7icmWt6Qe/YtDXTFclm3SquEgyGgNLT3Uf
	/5Q3FBZFGoUYmz+09vt1oz81S8B0fTvOva6jOiReuH3H22Ee4+JZ/tOsPM9/u25zss+qbUdAcGv
	oyA7PlwLLf/VDV7TUt9DMXRjp1TGdBtp0aZXAdHdl3c9oUGRdld/dEPaz3F+dbIs1NB5CoIrVKv
	jQh73fd5gbcgDlEF59ADO907EVno7mY9n5nHtuweUS7cUm0velQMlvXg=
X-Google-Smtp-Source: AGHT+IFmornV4ZdIWfTm9SgoE8/HBXaeK1TDUM0EwCR7nq5XRu9/CMvRo+RGrgPCIIEx2ABNZ1/nTQ==
X-Received: by 2002:a17:907:60d4:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-aff0377c96emr287174666b.0.1756552623239;
        Sat, 30 Aug 2025 04:17:03 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0236d310casm117780166b.44.2025.08.30.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:17:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: samsung: Drop unused S3C24xx driver data
Date: Sat, 30 Aug 2025 13:16:58 +0200
Message-ID: <20250830111657.126190-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=E0gq6DxSh3Mfd2fh/IwMmACtaozlVHjrWxf6F/SWbtI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBost2pee9d1wG5IpSYQufkayn0uDTUfoHK4Aojm
 OXjHWzf67CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLdqQAKCRDBN2bmhouD
 17DuD/sHmEpQOmJ+f3J11DHtrw0RH+Din6o+TGdXSZkDpyWNmfyR3Xbulz29+2OQ9GyJ5fnIEGH
 OLRyAgwoUVLWTc07Fjl+bEhfalWAR2p8AhxQF0SRmS3m2ufITSQ5KdAwimM/8W6Bw5PGfLvrhL2
 KC4E83y8qrf7Krj6osG0+HAEW8S1TqGswumOelaNzFH/sWoBWgovhA3ypaBGd867OQy9UnrCtkG
 8pTI4zK8UteCTyGOw7Gfgdtr4jGfMQEMoaXg8GDKHwvtJNgRd4EyLrW6vTtHi5gbTY5/5fsOH2A
 wUUAFzC5Ao8fwf62Rkk2NDtC/DObwKKj0hWv0LIfjNx6dgoJ2hvW4Y9puHX20m4FMHiLI8tU/AT
 6V5/uEJ6ZNJKoU0IG2kh0AU+rjLyxKGrJZr0YQEFdr61FXzNau5KyvXFyrfjPn3Z9YxEg1hrpq4
 9nHiBgQknrqncCa9akOgrJtcvM74QO5ypeMcZY2vw5YFmbsBjHPTk1TLEk1cnsM1UHziIBaH9O8
 scmcmclkkmZGx9YwJqpsq7HDUGXYxBXnyiDrRQUh/oa6QMOkCSdjOYyRUQHKWg23Zwtxzyww0Oo
 KOnEucRZFZvUrDPek+tDpT5WPFVH6xlgcf4RC6f2XkkGTQK9v7N7OsY/IyEBYjtGbt+utUqtSnO owzZc9hxRnRPe3A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Drop unused declarations after S3C24xx SoC family removal in the commit
61b7f8920b17 ("ARM: s3c: remove all s3c24xx support").

Fixes: 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 1cabcbe1401a..a51aee8c5f89 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -402,10 +402,6 @@ extern const struct samsung_pinctrl_of_match_data exynosautov920_of_data;
 extern const struct samsung_pinctrl_of_match_data fsd_of_data;
 extern const struct samsung_pinctrl_of_match_data gs101_of_data;
 extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2440_of_data;
-extern const struct samsung_pinctrl_of_match_data s3c2450_of_data;
 extern const struct samsung_pinctrl_of_match_data s5pv210_of_data;
 
 #endif /* __PINCTRL_SAMSUNG_H */
-- 
2.48.1


