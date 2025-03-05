Return-Path: <linux-gpio+bounces-17100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0BA4FBDB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C25116C838
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3255205E2B;
	Wed,  5 Mar 2025 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nYmC+BP7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6E201023
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170444; cv=none; b=ct1MIIGYSWYKUeCLcV9oTHhFYafh8wxF/7AUvtKMx0TcLuwb81MoKazcCiY9TJLR61fBB4qsxxVNnnPVcV2FPPYshoj0ch0/AvQWGlzchY49r04/5XPHqHRMR1no8OBhQ0PAYBblM2ZxsobmgVN7YAIUiZAvMPzMQ38VOQ04+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170444; c=relaxed/simple;
	bh=LHkL3KRuNaccS9Vjluq7eDHrzCRV9vjozDXsO9ZgV+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3iZ86dmsLl6Ph2qNDnX8JBrwuJ5N04sm8G5iy15HNM/pg16tU5b2rQZQGyz6V59W4jaNoAg6OjKNEIT5vq+3lUAI7GfojTf/JdRSZGnzxLvaixwOdbgGFQGgclxRdRljZfOWBxN1AvJ4JEfaFxQFPigkq9rxsfP/FkeNthNOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nYmC+BP7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bd732fd27so1744785e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 02:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741170440; x=1741775240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=nYmC+BP7w4WH460ckaprL5YKEhl7UwFGzh/QUcBNwvABAMXv/NIldeaUgTxIDj3UB1
         DnO7nQj7Wvc4QQAM/qoYiomSkFyAAaTxHeLKqbCoS3ZYIu7uCQ0JAi7BsaAyP3TenCQ/
         eTBLNXt7P77lbLwL6AYghVJKctUhHQolNXp/SDN0Vvw93eqisvqSgNXD5awD2br0tIMN
         uWjssKch+9HvUARyUPdpU4S8VPsGYHxCXCTwAQy7oIohhQbdopZ27w1zAVWx9QpTQ3Ud
         zHm6ckL0FOl/yCRQQp35ys9Yi/ovZa1/UpIU/z8SXZmsiptaKjgyvb0vVcIjQmpyurk2
         kWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170440; x=1741775240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCPKjpK6VO4lMEf73NVEG6/3JrmmaR4wPO/hIV6JAAc=;
        b=ZUrXUij5SfEK+Wh9dpSNfUVBTE+2ul4w4/q0erFNqh3ylmhINKPSpoin99qazzFuSz
         gMrEgPoqbdocfVlaGtQQcx9/heu8WCSKUcnECWTO12W1BruFAbmoZ6Via15KBIf+eJcN
         CiMB8KGRC8bZlyiwWjky8nIL1MOgLEOr+BqZWcOv0hzfigJwaONmHeXHJkP61KYcMKgQ
         99+R72Jx2t6TXeWPXEJS8fn+Nsk8fQZbSxuS/WmWXnqWJftYXGwAdX5Fxj0TdygBVgIh
         SRGiU+vnDUSRj3nBXaL38GlrWEzV8T1W/76Ry/S/1Oqf6ItNufCP+MxEAatIIl3emrCe
         g1Gw==
X-Gm-Message-State: AOJu0Yx7zNeck5tb94khtSSHhSEir2CiOB+Wj3VOZnzpiWSCiJZ1Ragd
	vlSejzSooF5unTQjDww6lKVQoo4L2uMoUJG55s1W/cd6DYpFH5XJdwTr2vMbOPI=
X-Gm-Gg: ASbGnctJem8Gvd/Z9h6UW6sMPa+3psEXFGWB2qtBnpueqJUdaUNFE5qKbB1uALAmkOj
	omxXgGVT+2OnpcdZLuhJIS+pTaXTegOEgWgyFjtYYV7XNTNkmESmY7F2S9zuBNuWT4XwUhw3Q6u
	r9r7a72bRuczol9k6Z1ey28XlC4No3EfC6h5xy4tzMYkp761+gXIwZGmYIT/dsLpjSJJeXujj5m
	axGfmWN/hRy/GgffHaw0ksT3m2r54+ThJL02bnizmTunPafswgh8OPVNWbtOL5pfigMNsMZByQG
	HEXU4rLQxX/OPr+A1TCHs1fV9cILwXMdQo0ZGe3loZtv
X-Google-Smtp-Source: AGHT+IHMvKES4+39p/GD/gutXcsrB/9GUV4+AbW8RNvVpOWUIzKEe0uSKYCHBVcKeGfHAgKJtsSHgg==
X-Received: by 2002:a05:600c:5120:b0:43b:c316:1fee with SMTP id 5b1f17b1804b1-43bd298f96fmr19612845e9.15.1741170439670;
        Wed, 05 Mar 2025 02:27:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485ddedsm20185004f8f.89.2025.03.05.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:27:18 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
Date: Wed,  5 Mar 2025 11:27:10 +0100
Message-ID: <20250305102710.52762-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The mutex initialized in probe() is never cleaned up. Use
devm_mutex_init() to destroy it automatically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 59fd555ff38d..67e867b04a02 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -9,6 +9,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -749,7 +750,10 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	pctrl->data = pctrl_data;
 	pctrl->dev = dev;
 	raw_spin_lock_init(&pctrl->lock);
-	mutex_init(&pctrl->mutex);
+
+	ret = devm_mutex_init(dev, &pctrl->mutex);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.45.2


