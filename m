Return-Path: <linux-gpio+bounces-11694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6009A53E1
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 13:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E336A2827B9
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 11:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7542A19146E;
	Sun, 20 Oct 2024 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCXuwLhm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C2AEEC5;
	Sun, 20 Oct 2024 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729425169; cv=none; b=Bbe4Snb0ez2UR5WkGXJdTh6wH17DUGUoe+OhKdtiPlRrTQyI2Hgj1pB5D68V5vNhJ26gnVuiyu5s6vjeyahXn0kT0P+vPnagjtl9rchB2ZhbSZJrF+sz3abf/hPNHcwo4bgfkk8pJ/NbfXUfrAvnFpgmPwbPZwdaBL3F1zlBkQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729425169; c=relaxed/simple;
	bh=8MiOJwfiJ92yVAKnvfp5h49FIL1sb7NglvBmIjvBojQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RXGF6qZcn0wc8IhIAaCefHv1eT7lTJ2CO4ZI/ySDwrIwp+JD8gHy4lEokpvlg0lNukyc+KE8RMQM790Sf7Q/ZAnzaISB5Ks+9mnTRYxuya81/pNMTzBkQ3Twr00v49Ov7Jx0mciPGn4LrkK53Y+tZ7S6JWPZ50yGa+t1p3PE44c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCXuwLhm; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so3025160a12.0;
        Sun, 20 Oct 2024 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729425167; x=1730029967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hCw4xCMhFxrS6vJuDpcSxXLwFEUseSZg0xkD0w8aNs=;
        b=WCXuwLhmgFBMCadiLlxHVP3RSB4EezTzwDLnMO2X8Oo8Iz6bdkR+fDs8b/6WqHLEwI
         +1uFydFHDn3P3nUfCqFylcJvo4r48EMJPS+GLZ9Fjr6FofenBhElMET4V+wjGjEK8uX0
         CEpFF+KG5314/29OdEPc1ZXQqbtc8LpIkNCeWV4iMG3JhB1dQKNWWnJhHGoK+Q5VNJLX
         q52ljzDBL/2/C6njToTrYvy3/SzSwNhnxzzJzfXav//BF123YEBvJdOR3tx7PyS6futW
         MLHHcbujDLW12vIjAOvizca0/EggfmyDosfx7iII0c0W+lTbNQDsmfd60U9WgKKQQisQ
         uk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729425167; x=1730029967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hCw4xCMhFxrS6vJuDpcSxXLwFEUseSZg0xkD0w8aNs=;
        b=od86tKV44+3lGS9DRn6NMPxcYaOsg/HllgsTlGThpC9y3Dst+tTluawImgQUSvtAy4
         oeEhxEQaDOgU+cSJ2pd06VwzjRpuwvWGGb0d5aUTo8HNw/DMVGyZK9gpFLDFhR/ABr1F
         GwpHdgErgxc9ow2f19cTbCtwJe/X5ruqy42/qOzazSpO6sSEbzSKtI61GXmA5HNQbZNE
         Eg68AtMCpiEuKBmZ5IPS8O8LIkk4Ma1wRF0o9b4D11xS1/kSMsihbQEx1MRsnFBXIg70
         iyGpXEG650AyxvzZQTweW7iilVD60YxNh+N+8N0od6Wq0Ke+vUBLPO7r9M+/6IMsYQwr
         nlzg==
X-Forwarded-Encrypted: i=1; AJvYcCXs3aUmDhCOjWuVEZBPQ7D8jI2iP2qX1Rahskg+jAD8UovoSKTyDBIzcizQfKVmSiYkbCqx7iidrrK3@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/5yPSQsXzdvECkRHfhpwvONjhWqVnzTyP86522dIte/OOEqg
	uVu2NNObD9WA5X9o/8zpWBtRjLQUgnzVrjOtHExm/yEC+Gj1CqEYLbKuCw==
X-Google-Smtp-Source: AGHT+IHrkEAnJ0+SGbjuAE5/Lk4JJhmY22Av6Z9F2vu3yOBmcgjTEueqo80Kp+8X9ucJHX6Jk4HwyA==
X-Received: by 2002:a17:90b:4c12:b0:2d8:a744:a81c with SMTP id 98e67ed59e1d1-2e3dc1d9a5cmr18527930a91.1.1729425166503;
        Sun, 20 Oct 2024 04:52:46 -0700 (PDT)
Received: from rigel.home.arpa (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed277sm1337960a91.39.2024.10.20.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 04:52:46 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: cdev: remove redundant store of debounce_period_us
Date: Sun, 20 Oct 2024 19:52:38 +0800
Message-Id: <20241020115238.170994-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debounce_setup() stores the debounce_period_us if the driver supports
debounce, but the debounce_period_us is also stored where debounce_setup()
is called, independent of whether the debounce is being perfomed by
hardware or software.

Remove the redundant storing of the debounce_period_us in
debounce_setup().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Based on gpio/for-next with v5 of your recent notify series.

 drivers/gpio/gpiolib-cdev.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 13d83675bf4f..0ec162b0ea04 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -929,10 +929,6 @@ static int debounce_setup(struct line *line, unsigned int debounce_period_us)
 	ret = gpio_do_set_config(line->desc,
 			pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE,
 						 debounce_period_us));
-	if (!ret) {
-		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
-		return ret;
-	}
 	if (ret != -ENOTSUPP)
 		return ret;
 

base-commit: 94fe8eced6e1448378bb368c9f14c9af510670d4
-- 
2.39.5


