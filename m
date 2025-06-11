Return-Path: <linux-gpio+bounces-21412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D5AD5FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0573A9150
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C55234971;
	Wed, 11 Jun 2025 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oFwMEtql"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15D221F1C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673128; cv=none; b=ZRusqrzUhbHcvCA9rH8qsI5tptU8jE89lJQB8sOoY+BFcXg+5nFFzRg9l7hivcDAT5wcp2e62i0yao8kUHs+NqO55oYXeTd6qmnIb1J/kB7KBFDfdpVkdu+10BjEGvuRNDQzFY5jMb+4ONGsIZXTMLy+ivZKuWWukKQqtZ9c1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673128; c=relaxed/simple;
	bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FEQP6vM68nSEXY0kcBbCxEI2ZqWhUbRJyfMgUnWiLCFKgbeNWos7XZjztIz6ybIYJQl95mvHVDuSTSVd8JK9sPJGphZfcwwOtofDW8i45Muhe72g2xVLDrK9QAnHiLKBoeUndjWG3sToEQ8qkVaeAItOPGT6X2zVWvtMsKx0Xls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oFwMEtql; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40a6692b75cso86574b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673125; x=1750277925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=oFwMEtqlRpNqTTZ5sjbllSJABMS1/oibEGQnhutCATmy/qbRK59YDixZykQ6qvdWjH
         IXBF7ChHnfx7G/lIB7F0aD2jpPglQjywhLz11rkX9ndcoN+ErZhhJLOLtVm7obpEpftd
         9I3Ud3l7gCqq39LL9kNbpSMfcRU+bXE2FyOn7uz0d75SRbp7yXtAGKrHsODqojlTF9Ib
         0OEiim4MPGZIaMmV2CGdOCWfH7O45W/S/DCoCHjXLR0Xr+c/YaVG/vUati3omiVjOkSZ
         0oPesABgRQlS5PTO9d9alpA8DSZTTz7pAafNUSXjT9DneDgcmiqh+4wFrW61gUM8ZLHj
         2yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673125; x=1750277925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=neL/KiwO3k+lIneBuEY+JZLZ2jWRpBdLIPDRdfuZOLZMEYA9+t+SmyOMrumXi2/dV2
         8EgNzXVSkBqOqf3htx/yT8SAlyCmLnd/bMbRyQERdro8XLcrG2bpF03N8cZ1Bpg0j7lg
         eqqUKAaTPEHxH/yx6WchZAcvI2l/qJjkNK/g3k1IygFFF1DFmazfoftY0zvkaPEI1zVq
         VBj6OoWBo0sqwQNR9X6JRjOYoPaOJl3m43/bqIFJDyewUXT2nDqJZpSct9MVTxUXwmgI
         yNdrLaCchC6Z9NwGA9sve6pTNQVDuPB/pZo+zLUsKxgju/DHYGigs3XP7hFGbq83uqtX
         VGjw==
X-Forwarded-Encrypted: i=1; AJvYcCWS+7VKPtxXu8QBOulnOUMZf/G8Mr0gXItutfh0WDkYILE9LLxJ9vRNe0rfMiF6Ki8cBuJVlhTH+MfT@vger.kernel.org
X-Gm-Message-State: AOJu0YyHUoXE1f0Gthpn/jxman5ItYgaGGTwtsnyncQcJs693/+iAcS0
	pzVUOhw3R7Gnl7LMjMNoCN4HXoNzJKa/RQZE34475eR6rW01w53EsFRbU6VbKPgWMuJN79Sl9vC
	kyWFC
X-Gm-Gg: ASbGncui+V+WHf9j68UhlYzwkEpIuA0NXWKqaVSB6je8Zvxiq+FURKPxhKfoAONhsi6
	dmbSxvcftIsTslPO0m/cPXD1tpdocGahvW6fbaULhGtVDuh0xHHyNXJ2+B9C4GdfVpvLhU5KFYP
	W2ECQ2qxuKYBuskihQN23s7NfbI8D0irBc2PWn8HiPD5GGq/NqMdUSvYsgNa6Jm+X9lspesRatO
	HxI5e1/MNhJGuvbNPEI/jKOD2loeoD3Pi0SeQHJhQAus1HnHKqPgTJxeTVa267CiJs3vHTDqtJm
	Cz8py/UMXsG0tSiaL/NfxNka0JZ7Sh4XedXL6mwzsGeeCs+ih8oxET/NMfcQlJTKG44d
X-Google-Smtp-Source: AGHT+IG+yB4PjXqGam/mFmbhtOtlvWHnGRv/5k7WflE47rsgegPrEoGN/DZYNDmhGQv2uSn8xCKNlA==
X-Received: by 2002:a05:6808:2021:b0:403:2a0d:428b with SMTP id 5614622812f47-40a66af403emr374548b6e.39.1749673125624;
        Wed, 11 Jun 2025 13:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:09 -0500
Subject: [PATCH v4 1/3] bus: ts-nbus: validate ts,data-gpios array size
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-1-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSLaTcGiZbGvyVCGhUPWDMAFdGGlhKp9QYAq
 w/8u/EwnpqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkiwAKCRDCzCAB/wGP
 wFJ8CACa6UjbtPBARyaIgkjAgp72QK4ZU1HZKfzr8KtlLr5R/CB6QnsNyw4TZMvcAWz1R8miGwK
 rnOoKrQzw+aGBFMT3k/vjRj/Ehsvsfu4W7bFWztvUhRK/1qwRLzvCYaCuNLRC5RYiyIC6MJzcM5
 1GKb1EeWt2KZ3wrqA+7OC6UAhPVG7td3ZBG9Md3rkDtHX/buSAFTEANFbH6uZ9+x3Q/6aiS1Wh+
 IVJDljCJ+oaaoVCOqFqVCre6Zn23FWfV5glFDG1hsak0No0f8a5Boidw1BqPCpQnkk/vGRFklwS
 Gr37dNhGA4ZAKQJhX5AnkMka5GObju10gyRpBCOMz+gcGOl/
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


