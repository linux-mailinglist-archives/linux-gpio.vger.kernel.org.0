Return-Path: <linux-gpio+bounces-16256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB0A3D5A1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6D507A4E12
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88581F0E2A;
	Thu, 20 Feb 2025 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mNqV0fLu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F21F03EE
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045439; cv=none; b=qicVGukSdmZCNCrCMdTi0RTGYQSNuMRvbV+UYmZr0uqdN1bGPI7usqEs06o8y/v7Q8Fs439LLFOJC6eNyc4fYeUadnyhBYUW189SRu3cuFZljAS58UPqdyk1jsRtf7xwWgC5NUGJIbBr1pqazHF4IE593MCHnoIbWPeFh+ZlGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045439; c=relaxed/simple;
	bh=/gqeqRwMs8CevwwaRvu7rMfOHz8FGAeaeJay3AIimak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UM4Bn1SG1YL5s53AXxfZF9qd5fxbx3EW2DUbiE8PJrjvJXKceavd1ESgA9/fXD1AgUUihxZ3WLBhQ90pNTaPTXfAyedFuhGrO7hW1qYi/SXXKUnEE3y108CnGj0ihG7Ck5TF9/tQKUTEyXCxT+yXbiyQPMmDMOS3Qcj14wDHVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mNqV0fLu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso4564945e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 01:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740045436; x=1740650236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePE6aVSyq82nNiteS0eDm4Murw6GeKSP9YRuA1+AOq4=;
        b=mNqV0fLuVu2L5+QXJoh2GuOOj6dnK1k0W/KI80AeBRCN7EfV/v29KcZzC7aS3NGi5g
         02GsEZLzfR1cDUH7vFqFyDIl/8o49E928FwZVOorLuc8KVVfJDifD9UFqQigN60P4hDZ
         J12zXzOhcUhKAUoaqbiWO9amXXxMy+uRJe7IpIhmt/Vg66yKdYlpYUiwWgFqJZi6LxJA
         oWyis+a8oqroRe7E0VaP1JCvnyRINAHmGHrAbgty0Cm3pMYIvsfZI5cds3k+bb6M6loQ
         nrH0mhrweh1v+z7SlIyc7HukEx2rLnNYpo0e3iTGSc18jZP2CkouI3qZ0EszG7JgQcYs
         LNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045436; x=1740650236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePE6aVSyq82nNiteS0eDm4Murw6GeKSP9YRuA1+AOq4=;
        b=sPToKWhOP1cL2qQRh/r5tFvv3+FWsIB8rVAQqL9Oyi0p5A804x3LkgKDEqaWEnEq8/
         unVXLliYvtTHa2nI12Oaw2FBtN6QdAsnPsYqUhI8PJZfy9LRJJ2L9OAHskq4t49eeRq0
         y9URKG/RKhLiFLoimxP/87FDc3lEBeK69UWIFbNydtX/bk/5aV3V4DVnKa8A3rL8Eap+
         luwR0ye04Sdz7+USEwLi4XPsk8bf1sJS1m0VboGNrUCdprYAccZa/d1aC9jDmYi3Mexi
         pznsvzH4tjNgQPzCXi2FdLiCtvYIM2FA0CJ6IY5+ieQgl1SdiMISrVayMDYHNEsJcYyy
         hYSw==
X-Gm-Message-State: AOJu0YxemWFWgNoIPzDxfSk62cXLncBm/hkOP0Ci++u8PSxcNkW05Rxb
	j60FdR5+gJFSL/1r3j47A1MpIwB7KW1OSVWUYU77HatblDtYIjfWIl8+JR7USQc=
X-Gm-Gg: ASbGncszC5PfTcad8vViNA0a2slJNvD0LDQNV9a4XMK8gSq3GWakXJP68bGUhq/2Vvm
	juiCAN3b0T2OapAx1zh03MEiYCa4fmWA8NT/uyhv35Hr7gIMpf1atK4jWJcTUoWNuSQlavtu4p3
	CsAiihNQJKcaaHSRxjFoWdfaldWHZWyKDCgF8v9FD2dcO1nnke9Sd56c/1aiAUa2KT4oWk1Y/hk
	MPM5Z2SLe7x3Y3bMvge7OOO9IajWz9KMUdAVb908T3Wr8ZkwjJXIX6p8ED9XMTT3iO4stxRyJqW
	eSUlISM=
X-Google-Smtp-Source: AGHT+IEJ18E0znCg/W6pI6SBZ6POwzntvKs5Wddj1jzrAx7EMhapZSXX+0+m/ezVaZFBdWbuk2I/Mg==
X-Received: by 2002:a05:6000:b07:b0:38f:2a5e:f169 with SMTP id ffacd0b85a97d-38f651405d3mr1047722f8f.37.1740045436112;
        Thu, 20 Feb 2025 01:57:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e2e4:418d:7462:9cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm20509174f8f.64.2025.02.20.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 01:57:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 10:56:58 +0100
Subject: [PATCH v2 01/15] leds: aw200xx: don't use return with
 gpiod_set_value() variants
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-gpio-set-retval-v2-1-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PIuGkhnXNIukoW+JQ2UdGjN/QTq1yPTYeOxQX3xtWd8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBntvx2ZKtP4FP+4pU3UV9J1oA5xxYaJP4wFaj6s
 eKwF6do6XaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ7b8dgAKCRARpy6gFHHX
 ctGWEADaiKjypEdiDNeOeEm1nP8JwKq7Occ+KYMcJrlW2mkA6sC+tG3lFxgXKdHHkra8cMdvmeE
 yKalq+0h/rNSkpMUJhlg1TMVaFucMWJSqvZca28OccapHZu24j3I4l/+A9kapSZvlk8n9/kC6o8
 N5AfP+VRR3Q+Zj4V5sq0NYLAuRHwQOx/oESmv8OFHwI5ihgB4rGXQh5Qhwp2JjitTiZDy8QAS6m
 frYj/XuUZXMo1yCr/uCgSgEyDvWe3vhZkRj48p+eivBPeibHsRXJaa9fTzutNFfdIfCna8TIZXJ
 g95pL2mCdWhrGWwIuj6jccIUSyV+twxjrXorYhRB4ZaDREF/hu1MD8mFRIp8PUxCk1T3Shhsdwj
 3IEcpvxalJHy8mckvNeOpQGqoL6bphxTTQbz0hKJfelAdbdNkph5Yvy93r08vg+YM9AxGJqlqQM
 TYOcyugVDZUc92iHjac5lV/rz5h2LjhYhDrCJ1ZE5rse9uhAoLfMpfWHLiIohS1N43NM5xr+atb
 ILkzVHghd/xo6/q40EF4GOhyVmDR2Xvenw+T4rH4zad2I3KlyVEbuNxwKFIc9kkTIEEySJVXARm
 DmO75+rvkfLQb5t648rPOARandd31y2oTkZE3B6z+Mi3r2sR2TPuLVSwoMaxf5LMTvA2ds/UyhC
 HngwkMA5k2QKIBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While gpiod_set_value() currently returns void, it will soon be converted
to return an integer instead. Don't do `return gpiod_set...`.

Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502121512.CmoMg9Q7-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 08cca128458c..fe223d363a5d 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -379,7 +379,7 @@ static void aw200xx_enable(const struct aw200xx *const chip)
 
 static void aw200xx_disable(const struct aw200xx *const chip)
 {
-	return gpiod_set_value_cansleep(chip->hwen, 0);
+	gpiod_set_value_cansleep(chip->hwen, 0);
 }
 
 static int aw200xx_probe_get_display_rows(struct device *dev,

-- 
2.45.2


