Return-Path: <linux-gpio+bounces-12405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF189B83F2
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 21:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB53D1F22DA7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082241CDA39;
	Thu, 31 Oct 2024 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b2hH9/9b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFF1C7B62
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404929; cv=none; b=g8GSFDbgrFoZMPW7GldJuzmcVB0LjZPCBAT0Vw7CLq8egewoICsj5Sj4irQQV80kZaIc5ZfU6OivOyzzh1U8VBbrMss9tzk9EIsY05zwSZ27+JES87CVQRKyys5OhNn7HqQdeqK5gPkMfilysoicxOfS9yv0Njx/Vq4TgLg3A/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404929; c=relaxed/simple;
	bh=LYpUIS6TNygS1bs1G3bDT7Wvnqt3+q3GyXXZY5PUn8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtAL/LdRgUwvi8BxQv92XtpqgsQE1vvvpiOyGv3iT/cHyEuaJcWcxEEtX49mTGA+OkCUaphUWcbUAAL/Jgm73Qps4NDrVR/+jCjje12BTL26FTFTlCPgiKP/PWEUfov1QFnhXxfUI+sDMnI/W5W55ZcLX6l6mE3RyJrSu7n7hEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b2hH9/9b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so896204f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 13:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730404926; x=1731009726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3+/PTENuc0Wqcd74grjNgAYyt4poP34aWyssLFyctE=;
        b=b2hH9/9bHcttljhh90MZfSQiZ32uxpV/1/zMXjivir3BoeFAKmxnty7jQqm395Pf7Z
         p7u/uQeaO8gxPx5TGo2d1CfegKJJhwgUVfEc+1LK0HKERE4rXQ+UFPejni8aAmVVrF5S
         HjWl+2RJ0F8fdTwL8Cy2uNi6JueGnFC6bJKoqQmavyyGHW92M/ASGWQXDUmmHmnl3lP1
         USuhnQnL5ZjC5hyg4mh3be0DQTvpGFv0VwlctD7Hx0J4jzO/0R90+w14y0muIefDHpRA
         ELBeEuzDstZAwXwQLudi8+Nz33B30zMElnzUHu5FJQ0eukFS2i8PxkvaER1sQgO5cxy4
         q2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404926; x=1731009726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3+/PTENuc0Wqcd74grjNgAYyt4poP34aWyssLFyctE=;
        b=gtifWx7RM83HGFNxHcIl/X519Y4pUvfnEm4impTi9GV5fte2/ZQR6q3FTv0YgrwSlz
         qRa31HCCMuuTM6v0wBlLyIBKlnRrnhoz8jJM9p+aV28t9FUy+1GdrqWnM2MQbtlK7epq
         o67D+4Z3+8eJ0TTDMR5zCx3iYVWqPBuW2GZOliwcThVFUTNmA3FSR4wtNX1XakUFccms
         /UMsW22BVtxPVUEh0muv2PcgSUF0HGfoITcEgY296Vy1lU5SyLCW6HddlSSigflO4VaX
         UFnPydPGF4RPL3QUx0NiZR7M5B+qRDSujKVO3ukBoo/LqZlBNk8YlCFePZoptYsyh9+z
         2OTg==
X-Gm-Message-State: AOJu0YwXxpQMh+5gRG0ZqL6h1AAGUlz42Xex0xPNPOaF8RIue5Q8Rqod
	DoHeJy0Dw3YAgI1Ow4N5Wzuatopo2YG8PnYdYrGD+ymIIILSuZzXURtvqbTY4Yg=
X-Google-Smtp-Source: AGHT+IEmggNr+FEuZkXM1x0nNEKjGuUO++8XIqYVMGPsMqKP5Nv3ooR/+gyU7rfS3q5Ho1x6/Ve5EA==
X-Received: by 2002:a5d:5482:0:b0:37c:d179:2f73 with SMTP id ffacd0b85a97d-381b70750d9mr5695759f8f.13.1730404926198;
        Thu, 31 Oct 2024 13:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm3003993f8f.115.2024.10.31.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:02:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 31 Oct 2024 21:01:54 +0100
Subject: [PATCH v4 4/5] gpio: sysfs: emit chardev line-state events on
 active-low changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-gpio-notify-sysfs-v4-4-142021c2195c@linaro.org>
References: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
In-Reply-To: <20241031-gpio-notify-sysfs-v4-0-142021c2195c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ddPywcbmdK3xi5YOlUy1LjF/4WaHOEFU26L5BClPYq4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnI+I3uiyYeJL4xbj/FYYWRgfQkObIqepxhrze8
 C3IRb8mG2CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZyPiNwAKCRARpy6gFHHX
 coElEACfsl0RNSaWVN1L4qPsEc6stxgG0y8cHF0NAGIWQF9vV42tAA0R2333wH5PCcOyHrOLiNi
 wdq4VWH67fJc+0cuD03CGjCuvzbxhTVJVoOfmBq6bz2s0yhrQhv+ECLW7EUQpKRudSSdsTRQYTQ
 4ysRMJasmvSovf4dJzg3dQhTmseA7/DkfKO9p5kV/JbG0py8zNC7F4Irh6EzfUnUD43g/xuEGHh
 PU2xcWRaB778XYg2kVqwaQDGNNlZivAuY739UJEOEQ9Y9jovRCVmlrwegJCDKmIXYsJ9LS9f4DT
 8+uUv/Ivr0Fim/I0uyri2ho+0cRFhn1tg8pWE69ff9mzAWvgr0BLHfoEjp1Y5VAeLVI4+iaOQbB
 sxs4c+EUNJkwD6eVrK3UDeTlqilbIOmdyW3AgEYxLyn3wiU+YO1bFxE04PwDot5xThs63u9Zan4
 CWymhAUd9onDw+s2/IQDLKSU0NOx5C44mCg3hjTwnP0T56pcpJG5lZ9wmI1ra79Mj5Vu7dPpz+1
 8kF4CsQJF62JKTmCie1i+afVjyAewuV+KGF8P4Rsvihu2d3etJFdYcVG0QUiMRr0ItuOqwt+Qvw
 x/VlDxmwS1b24B7zZFqh8TDE75T+lhVdU2i06rs6YF9DMzcwSzfFpmH1DG5pbBWq3pFGFGW/Rfu
 uAd7jsFyy03dTuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The sysfs active_low attribute doesn't go through the usual paths so it
doesn't emit the line-state event. Add the missing call to
gpiod_line_state_notify() to gpio_sysfs_set_active_low().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index dd5e850c9517..49a5aa89cafc 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -307,6 +307,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 		status = gpio_sysfs_request_irq(dev, flags);
 	}
 
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return status;
 }
 

-- 
2.45.2


