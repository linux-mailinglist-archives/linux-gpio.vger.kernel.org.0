Return-Path: <linux-gpio+bounces-21891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA1AE0BFF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 19:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71850188B0C2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D115428C000;
	Thu, 19 Jun 2025 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p5UVphOM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C71D9A5F
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 17:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354545; cv=none; b=LRTJMxIdVCOWyNtrL6u26rVTVk4LZfqD4XaUJ/Gz5FggFJcXETC5edA+zQ1+q7A678vmx457fCKxwQx3ehl/7OB0LssmQ6SiWJjqPtPF8G1pb1RD6eoYaF25cfgSdehIlW/z8pGCgTRc55/8SASglrpQSiKetmdGyF7a0yDV1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354545; c=relaxed/simple;
	bh=DIxRg08LQ4Wnf9yoZGtSsTUBAIMgxjQdUlAbMXiawLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsKEALp3SUMqgnhdrven1WM3DKzy9KYKFfM6g8MB9pk0wqIuno2AwVLqNMCkaFiwyP3d1r4mCjLHQLtvWRC7sa2sp+Q7GziSO1pK47mOxwLrwmmnjpsAzLpFeSbblh5RSk8Bx4iwKWprUsrwQOTQeJQ3PqPzP+2K7zvFMfGJymw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p5UVphOM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453636fa0ceso3387195e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750354542; x=1750959342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ToAOdTmq5s5XOCUlWw8XCgzHw+VGCfhPWa+zkrjEB4o=;
        b=p5UVphOM5qvx7XEOGeh9QXCNOtrTmr3eJ1gpRJu67ezCMM1sRJh9k3uDnuHOxhoPTw
         1Cj/BGNxLQBHHDPVc8rOVei+8NXKlYMLOYp7H4F5ZZYE0bYeTw5sMPMViaPU86ncRnCw
         NN6tFm4EQmxkI2inpZwEJidrQrY1qt5nIngdfJgx24d2vG/5214ZjS0qVJW4bkBW+xL0
         2ITPgTlTmcH/HOu9k75rC6TQKPQxL4nM+VJWFYPo8ADb4xZNuIA6lJ1uabUzbwZNaH7p
         nSqHyL1dmypBPnAnh4rLv4NXR3ZegPxgMvIvIrfrEnbO6suuT0DHtrQS24AFl+ea8/YI
         GGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750354542; x=1750959342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToAOdTmq5s5XOCUlWw8XCgzHw+VGCfhPWa+zkrjEB4o=;
        b=SAt5RiqfO+mfTLBKk0eFDSRVBcf2mWPhoM6kxHOngsYhEDsXGY2W/VZLGFe4SxkCxn
         qEJM4sA1ZLvDF9Otdf11WTuBfVuNGdHpENKhQPWznMqV7aUY0DhYKzQwxDS1Y4aGezcD
         cJH1J+/WVApC2wEhuCw8zmgHVkPQgHmRkw9iZQ6OyDgLfXymJiCh5s4T7vtopFHo0scV
         EhTVxu28oaN4sLm28lRgW58MTnjgHZPXp8BxBKe/rcvesg28CU8I1IoCa3vTNIidy6FV
         3yr5aiITkGBtHxHNXKCPXpSi4ymdJjRxxAHtBEruniLH1nrz9gxrErsVoDCWx192maSh
         E8BQ==
X-Gm-Message-State: AOJu0Yy4VjX4bza/vaBZP1b4YVWO7bQPPvZ076IM0wG2ALIB2ygddiux
	3AVolJvzIAdEqouFW9qs4pRC0QHdOCfpmP+znRrE/fe+IcXhUGKiBN20VxtkX2eX9U4=
X-Gm-Gg: ASbGncvpaYSsXy3ieTHLVQpj7RVsPJdTxmSAUI8bsHYT1AtmwGQR8sWqrxLG5iy3J4Z
	m9cYWci+fcbDQOYqH/gyn+Z88j4aMHpETD+tnnBaDTgoCFLqj/yXPmcLcQaOpnqoUL33tFJi4nq
	upZEdqNI2/pxgGHq+MX0NB/Gf3bN1YJ+ijaq0TFIrvVSmw4oEoJVKPE/LoZ9djM1N9uELjK2K2c
	nCEZxHU7tb+b5WMEEoCZ/5aoVrQ/OjkIc/ksN6d2x7DQ6DROEtAMgTS7zAbb3VzyC8kpRaiPeY0
	imkOwErJva7mXX/1FB+t13/0SxvYO2BwwUUCl0lQVLo3wO6rmsTuKI1HJZH3aSw=
X-Google-Smtp-Source: AGHT+IF616XQ9rBNp7YWYVBhGneXz5E6RZly2Cectt+D2w6ZUUlD4nbQ/o1uJeeix2qxHhBrt1B1Ww==
X-Received: by 2002:a05:600c:8b66:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-4533cb0c164mr183178165e9.24.1750354541541;
        Thu, 19 Jun 2025 10:35:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e741b43sm36311535e9.0.2025.06.19.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:35:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] pinctrl: aw9523: fix mutex unlock in error path
Date: Thu, 19 Jun 2025 19:35:37 +0200
Message-ID: <20250619173537.64298-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We must unlock the mutex *after* the `out` label or we'd trigger a
deadlock in error path.

Fixes: dffe286e2428 ("pinctrl: aw9523: use new GPIO line value setter callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-aw9523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index c84454038419..2935b2cceb03 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -652,9 +652,9 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 		if (ret)
 			goto out;
 	}
-	mutex_unlock(&awi->i2c_lock);
 
 out:
+	mutex_unlock(&awi->i2c_lock);
 	return ret;
 }
 
-- 
2.48.1


