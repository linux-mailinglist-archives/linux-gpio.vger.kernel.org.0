Return-Path: <linux-gpio+bounces-22946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67EAFE027
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA84584382
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A47C26D4ED;
	Wed,  9 Jul 2025 06:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mDvs2YNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A326CE21
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043339; cv=none; b=Q8J7tpH6C9TNoPCziwcCs5cYYiRHsN7LvaUIxSztn8HzIknuZZ3f2qkz0eTiqn4PuWyoMlvT6k8etCiTJYmT4Coo8kLrV/cn1BsLoQch9GHgPBL4XsVfg/KoFEq6/soSVDOvPAtYD8QyOPAjPBHWEkmiPhTaXdmrojyFtc4tYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043339; c=relaxed/simple;
	bh=ouX9BrmDiqk6TCgMnk7v/OMLfLFu5PRPMH88du6gFZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXWMG2gpcKdmYztI7PYdDL1AHrzmTnnpB+9Km8AiuAqqTHkcOYjJaIvbvD5PkkHEBAsZPF5oHfn9vPnVVh/IoCS2M1+04PQmf/Je2t5AmIFieQ/5MBqAvKXfjueO9aNfaaqJ9hYelE2aJ53eW0bQho2JCnhrV9SGMNuc4BPrXYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mDvs2YNe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a510432236so3402846f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043336; x=1752648136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyTMiwPaXIFDdT9wyK9LGoJhG1Tf0x1zce8tP5zIQCI=;
        b=mDvs2YNe5UNPqHAUgt1SROWtduvLimN0KUHXG7nASWEQj2XmhzeH/ox5nnBa7CZiyN
         nvAdjgHmTedsy99I1N2TNfWHNUpTiPPKq/PFKrIY0q/EgfQR4URkhqJCMsTdWmX4TvcL
         t6smDA06k2WOcNub/zPuqnWC/DvY/4qtAoSyncZ+LQbZBKaTcabrd/IgtOk8vqZCOfub
         EI1gPbYlQ0QZtllp33Z5KFTGP0jvJyReTNfYzjiuTFOEKHblXZBk5jiCMmNsFHnY/f0+
         2QtL7d3tacSA5yXOw1g+sJ3ftVaGUk//LGWS7Izq1BwaoVlyruEJVQxWW7t3mYdpLWsT
         JeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043336; x=1752648136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyTMiwPaXIFDdT9wyK9LGoJhG1Tf0x1zce8tP5zIQCI=;
        b=vmAvYw6P02dpsHIBa18s+2zZCAv6TgdqgeSURO7FcFPfx9NnyPBaxpEBaAvXVQCRW8
         SyB+2XDfsafLDrSrrejcmBoxW5ErjiDrRtUES+41EXZ6zTf2dP9s28m5o5OR9iJQ/DKw
         TT3tmFvB+7Vm8lMyuFCKO9PU/+/E3x1Ogboj+RxtjpFWHlRWuPKqa9sW/svfrA727VYE
         egeAIJGuL78F/znPMUt4eoiQFhY0SBIlYewxIFnSNXP1R3YOCdLv7pFD8/isG89wvHmM
         9WHIxbRpE/2O/T4l0qkS/tuMAhdL4c89Fj+76Y9AMzYeFHXVJ/3cThCnZ0rctK6XmI3Q
         lAkA==
X-Gm-Message-State: AOJu0YzZ1Mhu84dgq/Levs/WnZ/hgPOrs24tMXZA44pAWZChhxR41wQd
	8hiQGbHoXjLBov4l7DA9Tv+oCv1IDF0KY9mahmpmFFdz8OJQ8SBAsVIZ2SG9lYNUNKg=
X-Gm-Gg: ASbGncvZ2USVWe3YJ8IF2+G+btgZAwE8TW8yqAX62fUTcXEIj9MHDzK1mD0O9jqO+pj
	PH8/X5Jir9tM9WX0SRyCsE6Qu6ZdZhdePVUX/slXvOfWF16Ll30QuSBzIHkezYGsPA8AN8WoNYg
	1D/wxhx0R2+eYu0iZ5dRSXhvZqutPoQK5+jKhdnoPKUuslIz9fE0RXa0uI2CDXWRHY2Ji1QScMb
	X97o9cmlclSZjSLcel+UATjST7k1lnZS6ZRAH23wZS28J9JunhqsWdzfENi1D+CPZgXqiGGqfhp
	N2aNY7VoRihJzBcwNDkiAQA40flmkqZIyi7kDCo2lBORPxucJzpbJ9WE
X-Google-Smtp-Source: AGHT+IGg7TNxjvLn1+O4R81Nlx59R/nNeBOpFRuu+g7ycDDNSE0Rc5+slCF1F8/fhz7WHbhW52wyuQ==
X-Received: by 2002:a05:6000:2305:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3b5e4513735mr899716f8f.24.1752043336357;
        Tue, 08 Jul 2025 23:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:39 +0200
Subject: [PATCH 02/19] gpio: wcd934x: check the return value of
 regmap_update_bits()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-2-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L8ZxQSAM9ifx3ERmIubAxxHUaqeVMMBoWCsBpWCjAR8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9BkyVTRpVtFgtzuqceZbIliD+pMfIv+5Avz
 WnfpHrLxc2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQQAKCRARpy6gFHHX
 ci9XEACMfKjaNR8nzMjem5gOkjsgPOsIqsqKsOjLId25TkdZs5SuKfJpGfYzUMLAyvdz6EzeKhz
 +BVO0NSAttg1SlZWbK1NRBDLb0gmVtLckJHFgKvroRfmC20CvR9RgbjYpste6qxY4MjaUcOSMCB
 PgcLmXylfywY/UbH0C+1kuRLo9WdGpRjlN+tciP8wX/WGGMSH0q2G2T1A2k6UpjqMvpjuid46jS
 qeT/eI0rQQJDKIebX575uDlUzAHDQr14n9PZdacfFZnbO6ULsxA73IoFScDMub0rBVux/Ef8hNB
 4h0aCJBcsLlzR0S71DTRKowvDGTO2YT/FJnbHbnCP+wgN7AxaFu1vE51nPM0DS/bEUxlhMEh2/K
 1pTA2fbGPGTsWbLu1m19ldLFvpnbi8yKMuNN7bUK8fQGXrmUnoAdZ31JQE5AiGf5XvLxFHahD3i
 kz7oJaxbi2lK6jAddcQYhhUHgc64j4g3itiO5aTLD8wm0RC/LJJGewpiHCmhF4c5Pq9vJEhyWJk
 DyAtPi8a+mVfMS4jOaiivSyUcJxbfj3SaV325zRHnLB+PlT7rS/AOqfHjdehW8/i4qyykTODAno
 PwahK+QW+f6E8ujYx2aLajZ8B6FeRKDJfOBWL7AP5iAVRxwg+xzCHD6lgFtOHkAiCdkH+7FV4bZ
 lyMAXxdaAag8xjw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

regmap_update_bits() can fail so check its return value in
wcd_gpio_direction_output() for consistency with the rest of the code
and propagate any errors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcd934x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 2bba27b13947f14459c32db4812f6451eddbbfe4..cfa7b0a50c8e339603bc5fc70a8d7354f3bc6486 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -46,9 +46,12 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 				     int val)
 {
 	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	int ret;
 
-	regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
-			   WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	ret = regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+				 WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+	if (ret)
+		return ret;
 
 	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
 				  WCD_PIN_MASK(pin),

-- 
2.48.1


