Return-Path: <linux-gpio+bounces-18418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966CA7F5DD
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB71C3B338A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDD4263C95;
	Tue,  8 Apr 2025 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oyTNfoQa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302122627E9
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096686; cv=none; b=u01bgQNoF4YvpmAQgkqZIW0+OA3helSEisL4JueDKOdiGq49f83QcEW/umd+SCUvtZhqnIFEtFklmEVIqvpCz6uyNwmPJK+OfEDDfaiAdCaPPef2aPyMjppgqmR0FY7EGhjbNbrF/I+OdgZbrUdMwwHGH35As0aPemRZqkftfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096686; c=relaxed/simple;
	bh=1pHaIND2KYP7IQR016ZtHvkE+J/KYHTFCXPcGNsWjjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q09SAYBnPt5ObVBU91gn4kL7vvj7c1tBUZlfGrh0eySRs4ZpuvD17SMrf5DytCouJ/hbg5YyBaCMn7TXTiaWO/JyYbTRdhJk+BNPVdMDWecCBAFwJhFjA98Wa0n3zq0jiu8QNJaFSPj0CVRPC3MIDUZ9dNX/RQzwKwY/9UtNMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oyTNfoQa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so51229055e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096683; x=1744701483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=oyTNfoQasWqkpKFFgStR5lp1UIsFGowc9BTa3OAGslNhVssOg4RyDXmgnYwWHUIY04
         TSAeS3+mZl33harPH41KAiTWUn133iEW+TnaPM6Lee421IfBtuawtCNlDOvDnEdbd+a/
         XiCvtcHbSegL7qp65z8awfFuMoIxHWhtsl9dP8gdy8P24gImwEyXpIxOAS+vp5ZfDHTf
         L4CIZNz8ozTGP83wdQ/1ynDu1rJ0F88H3CPDek8LVb2sKC+RyLlhKdQd7UelSQBEf2Gn
         +MHd+A0vIugLv1QYBxXH7L4RCItqgYVgo5C990ePOek6r3ppa4H5c8/E10P2YOsNnkJG
         scsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096683; x=1744701483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=okPglHuTd5r+E1xs5UgtKyPZFPbgySzpemRVdQ5PHTnFdDBtF/qiW/k/BjOwCCQMS1
         4h4DVjcYsC3m7PuFNszEvy+SzBfB9vGh/mRoOwSRuiKMbOLRsEygW3GgsZYnKnwFWDOK
         q2yARA5RwgbDDBENMbICO4iEvWEx3bjnhP0zER6Zh0iVLCtFE6N4p78Lf2Uq41zDRswD
         OR6ZrPotlDzskTPqcNwErTi4oK+zB002uWpgUEhy8zibW5G3spDTSnEM0JDOzEUMqFxo
         xkt4Lmvb/pT+zIhJqHFAWzJJ3p+pcWm599Zx1fbQKc1WHlxM9GyZvSfTPVth/uj2oYxz
         79Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU3K/8ae78dXICPjWhC9kMh03VcX7AyI+tfkKP16BG3Z13J1i0183mLUvTLE6McFi15bHXv9iru2v6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GjX9SFH1gDXn4PtPmCIb4M0O/fKHj0vgZn89h/o10v3bX1c3
	cMqV/8BTjQvXS6bUZln1uJMwuPFwdFtewzlQLzxbuHtBYTKYpN0w2/v74rube/4=
X-Gm-Gg: ASbGnctdyHJvLvPws9HNgOK51vyfRta+nig5layTxpljoYfrtP013dsAMfCLyUUa1HO
	eJj5t9s8mB9ixdLoZm6J4h/NeGFqlaJZppOs0Djwxlb+5TM2J/xnHVl7xQqONXxHoIfeWY4hzQH
	9CrgdQ7w9xMwkmGRSpzRBaxmdQ5IuW8d/M9KR4wmmkltUO1Na/UIOvoE4foA0bRZzMBv1VCJDTC
	M4dg7LQgHy+2o92P+tywOT+0DN4jKvXAtsF4fceC3H/TWk8mPi0RySmj0xUMVfX3wiKMWmiKJot
	awXgd87wcYjzE92tswc6QH3vi1XC+rhQAxx95A==
X-Google-Smtp-Source: AGHT+IHzySH+p8lRsbpEKp8XdjRw3BmN8WdHjMLgCKHMXaLLom4rGv3xsF4growXW8khurtrZ60whA==
X-Received: by 2002:a05:6000:1846:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39cb36b298fmr15212511f8f.5.1744096677281;
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:44 +0200
Subject: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YmzRn8TzGA6hsDQ4Ls1ViAlvgo7b9jMn9Wlo//Y9vfE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a3aI8tyRJWFB0j50+lYKjuGbu/ifeaeFQ/
 4M0t4m17MyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnJ4EACh4EPB2PiBQrpFxrQpn3I5/hHOewyCLs6D3bGW26OisrbJ6BrXg5SN88KZnurmvDHsuP3
 MvwP+6leXhNTitXtnj5TQxtJin6NVZ0Al8MJyd9xwa21k8YTlRMm7rgA4Vx9CNvjDV9gf5XOdBF
 o3JYv1QhJr/SgcdkDr5Ox/diUgdt5Z+bjO2zMLW0i90TN8XxW/blNaWT5xnj070aBbwHIva6E+l
 v1y1VlHp/I4MrpZmV4MtqxBFHCOAQZEOd+itR+n/S8LP50+qens7NAVqfZhfaQQ7KSmLbRKJpm5
 kiG1CDXKTkVqJunSULnVtRahqu1J6ZcmwDJeXTo5PtKQZiFIlUHRjOs60Av24wdhwd+FY4ptQOp
 pU+EYeQcKSLcEMkga3AqSlN+IrU5XJAo9Y4FLczzGc6/9kTe7Y/MLq04J3fmVsp5KDuJR98aytJ
 6m/1/sJrIyiE38hKgq9Ta2I/s9/NjynRehGmP87FTcRsCV1bnl97G4/o6CZtPg/knk7WmCFCogS
 WBIkWDQrNxAYw16mjSeY+350vXO3jYh+7OIbRVqdjqYiZKSAy9A2h4HULcXVra+fEX2z6ALsNmI
 gsWEWEJpEXYy62lnL9J9OTf1+ihsnQZFt0jOnnge9cZzyJTQW7bhCj2GDkVkcgK5wezSQQbuork
 C6IVZWbEkEfQnFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the sx150x modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..94eb41bb9cf2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -541,7 +541,7 @@ config PINCTRL_STMFX
 
 config PINCTRL_SX150X
 	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on I2C=y
+	depends on I2C=y || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF

-- 
2.45.2


