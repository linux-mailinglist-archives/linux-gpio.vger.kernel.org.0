Return-Path: <linux-gpio+bounces-21564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE0AD94DD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 20:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63AC11E4A98
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 18:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7C236453;
	Fri, 13 Jun 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XZy4Us3r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5A231837
	for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840970; cv=none; b=ZKC/8ubsxb7FpCBPLFnryyBcZjLQ7NV2aYZcr7lhkIvEwAmjGnMeC1GWVvDs6EWeYQ6y4/RV+3oaZMSAbuKz0YioCFZmbzJi7NIcUPY5O8ZA16K7vaDCkiLByGf+cZZ/xsP1XTh6Sd9mkXWUayuLkNXvBF3kmGmksuDp8DFMMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840970; c=relaxed/simple;
	bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5ZP7WdB4fTYRI3qtW11Vx2hEls0uw19BDDuLZbmBNObN9k/IUKyNAHLfZ0wgnH8eJydN4srdriu9oU2gZLwOQq4yPt7cap0fNS9j/rC4A6uEVkmNZZ8rKlhijrhOhdPMvn0H6xT9YNFhcxe8r8koLIfVdayVnpDCBcoG+EOYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XZy4Us3r; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60d63174f05so704504eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840967; x=1750445767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=XZy4Us3rETpdOs8rSguyLgEueKNrF7UXsBDyQq63PQewHEzDg45E9sj5vF2AdZNVye
         wNn6sr44diTYkKGU9j3PupDfpj/vXWVFVIYmDZyrWuhr6h8GIn5d3EISdPHvLBF/YRUu
         6kMqj4FOv6TCkfBMG/0Y9t9BEf30vouDSm5eE6jCZYrAk0/BqxX5UUrTHwGRnwQeQS9O
         KiAJqjguwWEmVf8v5/DyEvkzGEZRQ5HerAuA81Ov6cxn8x1qSFAbwxAqIDkHcgyqjpPI
         fbC2VETmrowmW2HjsULKu+AEUL1Zi1T+RWFfnMJ/Egf5seRyl6gAiLpKIeZqZpUBtd+N
         e1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840967; x=1750445767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=kzpye7dL+GIUtBgwWalkK14pttD4kjX/uixbedO3euy52PM8vTKlgEDfhtWsG7MvQA
         K/QfBMIxdCVVocPlkWDKn8B7rq7EF+7jL9RWTcXigrSJ2DMAsu0ZAutxvGKMeacBO9ZZ
         lyDAqGHMXF2wz466nOgvp+KTsrSkpAMPkDGdOWVrFUORX5pqXNCN1M8BS9UAX5DCurET
         DNB+PHtqDibA9VDiPZS9RkFknFg/FgLyps1TDxFHdnq/pHl8UN//InM5UrQ0ryvzDAIq
         Itca8ipVoatgZJQQnZKfbdKysHWqZJeycLngyyp5YxK/MAMbBuPxwxZTZT/X19JRDoJj
         /XUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxUgZtkaQAFseeE1X4p9IbwbTZ8U4V6KhloNsvZsU7Gj29Ximm/cm3NLD+W0oCN4942blIKaLST55G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6a6g7o1NK3Orc0Yvr6j77hOydB9OEbsdJ3g4c3h2igFyIu7Ul
	70o6togUe7s9dGSyCfoktyA9W8oeYjuGBdY/1JBdGjYu5cBhjd/0Dpd6eglZsQkRtL0P+gFQZS5
	Znuhk
X-Gm-Gg: ASbGncuX5mKtzYU7lvfKxbJaavFYT6Ab7YTsiDWglbdH43eE17yfWw0jikyKpDefTmO
	TPweyPd3h9C3kgCeFHAb1e1+jtiJ2a22o7MMd+70YRIyStWFEV274jPDrA0ixGVvQSUvREw2svv
	kVrRXepv/jMC9tw43XZSV78Am1uNRrsVdfvtfb65H30LjQzIP4OPoxbrRFhar6hJgjCnLiVF9v3
	rNsLYAIHm38YV6QrlVLCIOxOXfb4ihtQeRelswfpjvUZR17ghMSwlU/4+iJYhD1ymN8Y7edMnEk
	1jrGvSdneBs3ZX7nILkjCJf+xj4wShmNXOpnw3F+0f92+X/NAFxTF/A6tJhBk/VpNAo=
X-Google-Smtp-Source: AGHT+IHIDNuqhtDyrUFqLqhDihe2otHFXjR2z0Uj0/IxHd8WHsBb5KQ/hfkoGSBN5gTvsdjyeJ771A==
X-Received: by 2002:a05:6820:2220:b0:60b:d6f1:7c50 with SMTP id 006d021491bc7-61110dfc503mr554725eaf.0.1749840967556;
        Fri, 13 Jun 2025 11:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:28 -0500
Subject: [PATCH v5 1/3] bus: ts-nbus: validate ts,data-gpios array size
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-1-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQuTsVQSh+FA+OKrMbq7r95SDLAKurmzl6n4
 eF3OJTvep2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0LgAKCRDCzCAB/wGP
 wLf/CACNf5sXMZSBwHrR52sDXKkT4pw+mfyzKQkTvQU/RNoOzSFHeNzl3etvgs8aItFSQTCaZDH
 +Kn1nNY/N/mbvJKdZpsMAD/LgP5aR3hLOcp+IfbZ1pzhZj3uMQ8XXf0VVGzRhEVhy/z/sIzJZpi
 bA2KUclSU5ndPJZS96FRk+LAbirsKK97ExHRQFZFC8xgl0II20W/hPiGtdgs5A/1YeGynRLaomM
 3s9oScLTVwynnmJT4qlp0I2iFLDFrL1qz65UzoUG3nUabTPNVmjHfYqNSOsYfzXW8bfZemySSAD
 ZfmCDJLVCIdbBRkoiY/FfEcScqIm2bvrZwi+vSvvOwjU54BE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add validation of ts,data-gpios array size during probe. The driver
later hard-codes 8 as the size of the array when using it, so we should
be validating that the array is actually that big to prevent possible
out of bounds accesses.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index 2328c48b9b1260e805c631f2aa7379d620084537..d3ee102a13893c83c50e41f7298821f4d7ae3487 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -48,6 +48,10 @@ static int ts_nbus_init_pdata(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->data),
 				     "failed to retrieve ts,data-gpio from dts\n");
 
+	if (ts_nbus->data->ndescs != 8)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid number of ts,data-gpios\n");
+
 	ts_nbus->csn = devm_gpiod_get(&pdev->dev, "ts,csn", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts_nbus->csn))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->csn),

-- 
2.43.0


