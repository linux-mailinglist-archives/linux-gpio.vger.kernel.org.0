Return-Path: <linux-gpio+bounces-21772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62355ADED59
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F983173A15
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309392E54D1;
	Wed, 18 Jun 2025 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jRWhYb71"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296427E1C0
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251738; cv=none; b=AdY7BEQuY9jNgDK0PjOKx8Ls8thZBqFyQJXSs+AHVV06SX0zbyY77F8TRLmozixfp9XFi70j/howOiGsN7tRzHXpq72kFO323+dXMi19+e3q50bueF9W9bjZmHFGFzwKC+8O7YPFCy1O7sp8UWU5kQE9x6DkRVy35SbSINAhaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251738; c=relaxed/simple;
	bh=GSMsqi9mIqLCsQJ4FsQ/aBe6k2Ec3MNCIfPAzIYK7ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9k6z+92GXoFYG8c+bhNPTgDRPMOf9I4SVPho3Kg8dBw4zLZxsxZevuwDoXYOJAZoLfiiYBsiFOGiXucLLkHLnu5t5n3sCcdNtH9sL+zVBvTY29fudXml1XbLGveHIdLyUEy/b8E9/wKn1cZuxcMEQap8/aLHymoTWrh/9b5rrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jRWhYb71; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so3988067f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251735; x=1750856535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=jRWhYb71K4GCutpelBJ5Ohp40xFGhixcuo/dRl1mbkX2QuykR41jZdmJdthx0jJa24
         i7KvEl05iw0XvkI0x8qrM//1Ubt6ciWNMPXd3jNcfN167KqPGJRjXxS/K3vhF2eEradL
         DL+5Nfpn4HOPi6/ug1xA5amvAOS+Tz/242BLRK6LLSlYnOxLqK7GF3YoXO7hXAzyXqWZ
         sPSVKP59i+TsLtYSifg5ySoJpKSmGIs/XxhFBtgO6qLCmXWw1CEhA/OsG7WCGwxMt7uG
         Tcq1Wn+1aQZRIbvTQC4aH1HLVRAm+FzXO0dm0RKzlVRNEHizhCog9u4GWvDz35s1oPFk
         5ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251735; x=1750856535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=wCtrzRs9Xp/estA1Gs2umFARbfkaFoi5iSv3Hm0QtmaFLDQfGerNCCye8AOY1MVIRY
         jfQORRGV724gfcObaFdCLn3W8XeibgmLNF6iAIsdSHzt1IV888oAExFnRUCgRwtazOG7
         zSUPfUkgT0oobRxYe5BcEK3sUiiFiUr8Q92gwfpmAQczTD4Yo1KjFFLq71cUDoSAU/NF
         A273VksHAHANQjKxG45RIri6Prv0NZKrIs3rvMhCQGGEUmtgPScxoJaAJurhhX4SDlA1
         ZqbJzWCK/WzYrL/3/LHRWlrqw0bhaV7kHIQeBmWTXpw4JFbcJszA2pQ4keMfRVBahvyC
         XtYg==
X-Forwarded-Encrypted: i=1; AJvYcCXhJCYMKRF1G3WzuXgp6Z10vPIa8itQOK2Kp0AQA3luJWjn5MUCNHZzF6AZVsfOdwPOeCoXhkT0zLXp@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeIVu/fpsZpLAzVLYhuDEF4PBFxqni+H2u7YWzjU39rUVDAAu
	1uARi174blOHPygEvNYvieyAEhU7kuK3uOfLUAr9KY6vb0ZqtbJ/7yeXDLE9A50x+cI=
X-Gm-Gg: ASbGnctZTPiFpfT7nyV+If3M2ArckUnb0ZKHRQW1H0ugcQHYAEDIO4z61WDG8k+V7rt
	1+lzCCzx74ABw856VXFqaR2LdqfHro9vLuN1+Ne7J7QKTaIL8p2rI7kRAuDvO3Zsf2UmtQZXRhE
	ieSu9i5A1gJ8K2j5i2L96Kbq9NITXNioKTfdQlXa3HoAil2JbbV1eTonwvrEQ3En1Xe9mO5gRQd
	nD/ogK1H/KHUEFI9ro8e8HHyouhXUWiV90/Aa5yieQBh+l806LxispWLyCTRvmawpKicitfGX4C
	T4K6J4FiOvj8ijH9VAFcKRSnJ1nTlF0F+UDnEgqvZ8NisjejxraHPm4=
X-Google-Smtp-Source: AGHT+IEhGYD8rPoQTR0NvIwKKBaqZP1caPoUwsbeD3e3vlQF0mkMGzzBTiVfbGBa/VJ+41wnK7MJUg==
X-Received: by 2002:adf:9c83:0:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3a579440d3cmr11204956f8f.16.1750251733814;
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:07 +0200
Subject: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TIwebD7wWsPr3/j9GB3hInJeu/m3jlEpiVULpw4XriU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjS9dqDSVf56sYvtxzf3Ws9zK0fSUjUmTabo
 KhnPcnNcHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 ch/ED/wNMcjqlojE5KBbR+JsUmiuDzwcVj6yuSnCRbCpxWsSXAMMlFMhO9zKtuf8vg0dymZ01Sq
 MC25JKpSkIzRvrNgYQLkqboSYhL9VJt09I3LleYYmPUarepFnaXytWA4Y65xSGFi1wOocDhjuwg
 MbryYqSN2rbASkUemBSu7xlw5Q14zu5aVDy5B14G5E2zlpQBmK7N38bTbmOYzOUmw1uT3iIJ8gE
 7ZgC8CQCCb3Wv1FFO7XQ8dbTQYRx8nYTmYIicwG03jOSuFMcbA3ut6cr6v7DbwaqczJmrdFiM9W
 e2pk1QPvT8AUQtpjhl5n7PJOCjvHfdR4RWPNSD8CP4ZktU5DWh0tlKuKOT3h4CK6Uaf2l6hpZAG
 o4AIl6BrOI9tlfq25/STr4+iwYZI8TXyaerb0jVBI/jca8jFcy6w82u6n9lUMwOv20Vbc0wWkfD
 tOA5thyYPx8dUWPiKNvYZ+MDx+bj6KR32pv/N+H+EB9b+FePtPGLV0wWG4t4WOZzJLoWTiJo8PJ
 6c4RMPk4zz4hDiAMYLjm0x11/on5zwI6Nk0yvxvrnA6QpBqV0jcfCEyoHmHwA9092qWAAmu81WE
 cguN5YUlVGfb2/iqqzVQw/7XDN7I7APpPpurpadJrcWtFB6Fo3f7AUfrl2WMh1Dh5q4DVBVy/BV
 PVnTLVUOLeIsk5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instances where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. The issue needs fixing locally as
well as in the already converted previously users of gpio-mmio.

Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 2 +-
 drivers/gpio/gpio-en7523.c    | 2 +-
 drivers/gpio/gpio-mmio.c      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
 	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 		return 0;
 	}
 
diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

-- 
2.48.1


