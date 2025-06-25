Return-Path: <linux-gpio+bounces-22174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791FAE7F8C
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A002B3B5CE0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF642D3206;
	Wed, 25 Jun 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3aTS51wL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6E2D0283
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847633; cv=none; b=KLXhSL5rwqt7DEPUX0Ktnvf+CNpiyxbe0NkmZLyWPUpTqmCEJNSUdzsqF1MY7iL+LJiY8juL7E5tIvT5IAUNg9nVOgFvy7C0deyT9WIoc0BjoUjAS3P8gzmaXDMjZ0p6pDlREqQrFbUMQg0fFYHdhyjHzuaDounumugScCaC4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847633; c=relaxed/simple;
	bh=PW+v0utVLGCc4tkDWP3j2dlPI/ydKBiUWmzZDvFg+uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojydpiMLjQD0qSSpJFTo7iDVgv6Rtf3jloGQMnjYwQDFQBZyk0au5cA3Lhj1YmbeZCCNTly9/sG9oyW+cuVdwWXeNA3TRuRf4hH2jw7bS3sszkqq8QcZEXG/5XNGCfrVDsQBEkRoI7RDuGJa41zhjFE2xTwstOR8pumE+Bf2PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3aTS51wL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so560762f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847630; x=1751452430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=3aTS51wLRuDwavNsZHNC2fJpMvgh71Ijs1luXo44nBqFPeh1uwFJOdpxfPZjfubKyl
         4MQtF/G+36z8DzWCLEwK8MvaZa+zlHqUTmU9GFka6MNEqMj7IDGU+Hp0ELY9w+1iDsK2
         Y2NxSTn7ZF6R/hubj6VyyD24md09HIE7zMyUFDmMHPlZs28p1s7eVxXQkWJDUz036eAt
         C7SS1p5naZYhbLFC982Bk5sYKb3xABywDe8FPdP5+dDtSld/6PIA2yqzRER0zE7hUIo7
         Bo8soofj6h0m/F52EZx7KfO127Mqb7QqabJo5mQQvVkIuShCY5G0sRWosQHbeB27wU2o
         86CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847630; x=1751452430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=BpiunggZA9ovEt+WRv0cGasz2KdC93eu8jFriRBgVrZMjlxMR6PMrzSzKUL9W5VlS2
         KGZGhAs3eJhfi3chK9YTKQvHweED9X0d0JLofSGU+A881hoSQeSizfq4nOlaTAhEDgTa
         a7sH9vedTvNBmQDiEOSEFWT0t3k4b9i1PSmSv2EtRKzkwRg1zKmMbydhlM5eKK3oh93C
         ihp/weX2R+wxhCc9d6QuWOQ2gn4F5mentbpriPiS7Qdnf7jb47sr7Cke7LQ3YOErJ2p4
         5mIGle2g4I1YAl9viAQcYkdDY6fItDwz48Nh1RWmLsnJmePQ/GVn3JVto95ZX80OZjZ2
         A7cA==
X-Forwarded-Encrypted: i=1; AJvYcCWTzGrXr+BaHOjTgg0C/JUiKi9NJsi9TnrvV1zNxA4ut5QWVfoRfnYzZiWSR4hPclnT7cywEf6ZFSIf@vger.kernel.org
X-Gm-Message-State: AOJu0YzT8BgdNsdWdpRxKZuFuV5CUqkC549xQx1+xs3QtKTJ4SlRTLEw
	F3Go+WuWVzx0xf8X6gKpxhk3CWKoHjeYGGTfgnieb8szqbdhQjQUxCsYHjsGxUY/8WPI/+0dsCn
	m4oONfAg=
X-Gm-Gg: ASbGncvIAMMKaLakzSNfv8gp/503acBqBwAcN+YN3K/1HAB7+o1Phtns6bO+WSxXnaD
	syRqi4aFzuJLnwN+iftQcr7R0cCxgz00J0xkycA1FPP8RgqeNrbdB6EHPOrEpqdSGCcSymj1+ra
	8MpgbUI5Bt3rDU/cADolx21JSbctQCDkEZDwtmBDlu1jPI8BZPZ8qMpS9PlzMuloTaXD0v4ANJ6
	sYbhrzfPhgz+YfPELUc4xCtcnGzq4wABAgW975i3GB2rXFAlt2OWMdPIvLVLrNGRC/UD6fiGP/O
	GVL/mRfCM7D/RCK+Q/sQR/KsmrjQFObTgyysq2I9C8qH3WKCvUh24HYM
X-Google-Smtp-Source: AGHT+IEwM2t1XefxZU8DghVTXKK8wSS63f829kSWALD3RIefh4AeNCC3TbqP+9rqackkafREvW4tyw==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id ffacd0b85a97d-3a6e7206d4fmr6033940f8f.22.1750847629787;
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:32 +0200
Subject: [PATCH 09/12] gpio: stp-xway: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-9-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iM77eXflH98tEqykW1k+5Ww0CPuJn4LOyCx2J1hnDc4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CAekDrQa+N2Lkq1WXdL06pphPPFEQKtl/A0
 icei1YT42+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 ckF3D/94LKQv+DwKv8kgiajCz0+LVB02vWQFLuawtrrCD3lT3mQR99okl12W8v4bFRqrQgkZbh6
 Mwxo9HqCfHrH9G1wPF88tIC0mVzVRDUcaMkkI/b4FaH2V+0uGdss9BLmJOKb1w4yxHpo1s6ud4Y
 nFa0ZFobojyWKWFqWgnrLBkO6Ee/kCKcHLOWs07yKRQSDbkiyhWoVo25QrzuqAUbBe5SZitOElx
 RP9QH+MV5jiCBF1T5PELubMo9gHJaztZHMs3/J/Cv2sgOu6GNRiU5PknjkdXY9Yr3ViaiGNVoq7
 KzUxVZLCCPxGNwMAtpYoCs8OazkrmTFJgeDdd8FaN+AUMRpzElDe5gMLKbxG4ywUxzqBDToLP9y
 ZBvBSYsWfXt7NVRv8ar/BcFa5+wl2NZu6mFOiME3DM19NoL++9oa2pQAWqa2l1pADddWStrecGL
 fjYRJasuaMjmEYDKKb9nnY7P+EqE9fMlUtwzCvldqXYcMGu6vfuiePHGLGUhvB76UPmHagMWnzu
 gdyb6iE/IAa2qwFBcjxH2dgglrcOhusiGNqea293LnB6a4b2QeAT87hOs9fiH7zhoAByf0Vuly5
 yFmAioTpLemDCiO4jMgJuQy02PedULImyNIjLmPw8V7RS2UW42vPkdfq9THCKWegBxq+langWnB
 lWhe1Qpcgf94OAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 5a6406d1f03aa75e82423f7c5740fdb3df42dd4b..fdda8de6ca366662aec1fccb475f0698fb478ef5 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -113,7 +113,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
  *
  * Set the shadow value and call ltq_ebu_apply.
  */
-static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int xway_stp_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
@@ -124,6 +124,8 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 	xway_stp_w32(chip->virt, chip->shadow, XWAY_STP_CPU0);
 	if (!chip->reserved)
 		xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
+
+	return 0;
 }
 
 /**
@@ -136,9 +138,7 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
  */
 static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	xway_stp_set(gc, gpio, val);
-
-	return 0;
+	return xway_stp_set(gc, gpio, val);
 }
 
 /**
@@ -249,7 +249,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.label = "stp-xway";
 	chip->gc.direction_output = xway_stp_dir_out;
 	chip->gc.get = xway_stp_get;
-	chip->gc.set = xway_stp_set;
+	chip->gc.set_rv = xway_stp_set;
 	chip->gc.request = xway_stp_request;
 	chip->gc.base = -1;
 	chip->gc.owner = THIS_MODULE;

-- 
2.48.1


