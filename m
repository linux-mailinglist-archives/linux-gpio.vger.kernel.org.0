Return-Path: <linux-gpio+bounces-11071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB8995453
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 18:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8076F1F26859
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 16:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C991E0DD6;
	Tue,  8 Oct 2024 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mujLMFrF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19838DD6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404661; cv=none; b=oAwjdihplAGmbLt0XuEIZYaQrCJ98n0Vn6oUpLsObTLEVrNXm/r60EFcOyD/09nUJygqZFxHwOckoBCknS9Xfx6ICOLpY3NEjnPpONnYtZFSHMcp7GSx2PC19aVgF92u373FE3O2DfdSikpkBDi9/DHLnciocbLVY+WZG25JsyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404661; c=relaxed/simple;
	bh=SSgw/HFCjykWJ98o7NgPWnIMHSrIrjTN5JQKiXgDLPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+5Vmk3XVyQmKELSQ3lzx52xPqLUsUb0ywq6IAA+f1J4j2gzVHUOr3SzjsVvbKS6GFcDKm9HafFgyVZQsREGo/4skKicSlpMOBDlDqaJ80V8HQNLVKZzvIRFK6Z4oIZbnWB0H5ai3j2vyXtSx6ef10AvzD4EhiXNbQeoZShxU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mujLMFrF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso3705056f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728404658; x=1729009458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dQTZ6PWXQWLnBzwYGJ0A8egdGgNwWh+SgQtoRU7MTs=;
        b=mujLMFrFQWj+gDlmphJCaiXKOMAhsgNyfP5x73WasdeU4YIw0+Q0DwCtAQdfEx5f67
         xXoSUrdqdLuNOz6fxL8oydB5/J0/+1DAD+9jeMLNlVWZCmzIv7EEhLEDTEaDi3H9t8qK
         Cm6AvuH7B+uYh6fJK3ToaxJ2HsSfE+mZH+2BD5FYZVseh9IpnvIqLlabUcqlEO987BPi
         wy7wUf7mIpAW0ouHOIOfoC2DNtqjmr4ifXm62jFICkcOQpeE0Yc30MhT42V5sGvulbGx
         uLfQctX0qaG0GYRUozoJRPgTie+77thRUaE+cPwO7DwORvIYjE2Ml36I1zH53Sgx6WZA
         P8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728404658; x=1729009458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dQTZ6PWXQWLnBzwYGJ0A8egdGgNwWh+SgQtoRU7MTs=;
        b=AO/Fd1KTQVCGXm3z+5mfYvIFImgnlHlbU5Bq0eIuOLotmc1+1aFOpfMze9uMwOTNF4
         0LMBh9p9+3eh7468G71wE42d/UxU0RhiMRY4XldlhY8oHiqXH7j9WeGwEU6fLaYPK+go
         5YWZlszJ0+jEtWGfOQ5vrXbLl44DjNiOd9CoJJDlzNqyNbZUyglssOLrj82dZvxGEOoD
         lE5EKX9YPjAMRmGLKSOoDB3dZ1l7RTSzjtsqjlKkRfp6oHYEMQvpKrak3HtgnH4wvPtf
         x8PCDex7djnxa55p80LN16366lPxeH52wy67pdwZ1u+tOUUDRCrYgyLwbSQt38j12YPE
         8XKQ==
X-Gm-Message-State: AOJu0Yy/4Z0fY/qHfH7qHd2j7GKSjLbHxDX2sv+J+MERGEAvtY7Y6i6X
	PhXg8yxPkKjMcMTQzV0VSfz3xEnPs8dzuOANAq8mVSYrqa5aNLUgxqnFPkmN+8M=
X-Google-Smtp-Source: AGHT+IFKWuGS2j7T2Y6DPtavHrmcZeuX5fkh1xoeaKV7G1uzQqgv6Vm7SN7h8ZYyvNt22xTsCo4nZA==
X-Received: by 2002:adf:e891:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-37d0e74982cmr9094993f8f.19.1728404658334;
        Tue, 08 Oct 2024 09:24:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691ba45sm8451841f8f.44.2024.10.08.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:24:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: ljca: use devm_mutex_init() to simplify the error path and remove()
Date: Tue,  8 Oct 2024 18:24:16 +0200
Message-ID: <20241008162416.85111-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Destroying the mutexes is done at the end of remove() so switching to
devres does not constitute a functional change. Use devm_mutex_init()
and remove repetitions of mutex_destroy().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ljca.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index dfec9fbfc7a9..d67b912d884d 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -420,8 +420,14 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 	if (!ljca_gpio->connect_mode)
 		return -ENOMEM;
 
-	mutex_init(&ljca_gpio->irq_lock);
-	mutex_init(&ljca_gpio->trans_lock);
+	ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->trans_lock);
+	if (ret)
+		return ret;
+
 	ljca_gpio->gc.direction_input = ljca_gpio_direction_input;
 	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
 	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
@@ -453,11 +459,8 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 
 	INIT_WORK(&ljca_gpio->work, ljca_gpio_async);
 	ret = gpiochip_add_data(&ljca_gpio->gc, ljca_gpio);
-	if (ret) {
+	if (ret)
 		ljca_unregister_event_cb(ljca);
-		mutex_destroy(&ljca_gpio->irq_lock);
-		mutex_destroy(&ljca_gpio->trans_lock);
-	}
 
 	return ret;
 }
@@ -469,8 +472,6 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 	gpiochip_remove(&ljca_gpio->gc);
 	ljca_unregister_event_cb(ljca_gpio->ljca);
 	cancel_work_sync(&ljca_gpio->work);
-	mutex_destroy(&ljca_gpio->irq_lock);
-	mutex_destroy(&ljca_gpio->trans_lock);
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-- 
2.43.0


