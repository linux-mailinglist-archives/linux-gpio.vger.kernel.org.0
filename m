Return-Path: <linux-gpio+bounces-14196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEEA9FBC8D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 11:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6E9161D2D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 10:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E791B4132;
	Tue, 24 Dec 2024 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UahONGdE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319C156F54;
	Tue, 24 Dec 2024 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735036615; cv=none; b=PEr2vZNz4kb5F2BBGJpTRVGs1Sp8DsmivUP7NnKOWY8KgRPxzLf347SrUxfe6CzXLRpkbCWVoCYMXckrj9poJHbYkU+/I53Nl72IMCm3umwEzLBU+DBhEYh9gmJ1E+IPV+A8Zrs6umt4+Y7IMFxaZA+O2c13TX+AQwjWhRutDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735036615; c=relaxed/simple;
	bh=dXQRhQVd1Zyosn15/gUbEta/P7NJqalhPImmU9urz+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gb5/JI8lf48IhgVAoC7Sh3vHpBSJCe3+dnVZG4qlAQp3DZVyr+TWYice/Redmrl8JkjoE273hxZ6hFSvJlzF9EclMz0e7k977iOmuQon+N5YlhtfDL94suzV5P9sfXwYvtVjZwnr7aqkRr3w3ihchOawYmk3dg3505bUebInQnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UahONGdE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862d161947so2420686f8f.3;
        Tue, 24 Dec 2024 02:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735036612; x=1735641412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMhk1A5we+Q0WqaTiBzTXNhUdePPFx1uKEyCWbVNvYc=;
        b=UahONGdExN2DP5PBiZ87j1+mGkDzwCd+MCQpZmUblrKP7GD0KfO4OV/GKtEfTO1sYK
         pH+O3hs+yDawgBghqREytfRP390tCBpz+65UNn6GkBDU2iptaRDiGcn1nKnPYpkd3P6X
         0zVyYKneAQ/sAcE/VjH0I7HWuyARq5PtnKMegYi8dZmpFXux+gaBjgnSsjPuOyR/xWxN
         RP1C9BDzN3NqeptC5oSsG5eB2Rs5niHvJoSbGuKVBPipP+k6qu88w4bfhTIponae1bt1
         gpUV23UfNa49ChxKv0ivW7QfFky1P30da1oXtQsNS0FVVVrHlWJhhivVT7Fuf2g6dgDh
         fgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735036612; x=1735641412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMhk1A5we+Q0WqaTiBzTXNhUdePPFx1uKEyCWbVNvYc=;
        b=btRSTKjTHUEx37dhjkiEkJmdS2tVqBjs7UEaMq1bUwXvN7mwvBDdqJz6RW8W2xFdh6
         m/cDdd2Ao9FpXD5R4SBkvIZQPd95+LaDjw6iz7msVP0dvjc1qTTEqlgKHl3ibs8U7Jro
         +1nitU/Nl1I5VSgWSRx0in3pH/aD/dSfNPutLktI7IeegBU6dfXrVXaTsFofys1UjBk/
         bOdQRBEsG+X3rHrNTNuVwLewIwk0RwRp6KT6hlaF7bGdhl1UPuG+AMK7PAFUP4e2D5OK
         QmBE6ayI4XOeRQHFCbGG2OUvddtktA8BQzwr28+DwYWADQQiKCuy0UJBtW0DmzaxKr7F
         gCIw==
X-Forwarded-Encrypted: i=1; AJvYcCVHVB9BqpG5+V+fo4vdtCQHh3nIKV69RT+IPj0tFJoUTpQdG+vPR4Iqt7ktLVoMBVXhtsD0DAuZpXFa@vger.kernel.org, AJvYcCXtcLMfobpgZfmtjLs1KKQ2YT3EaF+0+Mdt7kFCJbskk1e1IbXmjE8SiwRlPc7Xop8LBdifPZoTR1ZCl6PN@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZ5qOpBs+2cK9ou/rHf3nhKSpv1sOAgh/R/uVc6pFB2dqDkjp
	okaKt94cn3iBf/E0yr+jvP84miiyWBjHOiwUifpj2I+eg2/hRbLe
X-Gm-Gg: ASbGnctb0LTvTOtGESMAhgeg3r7sjorwh3VXs5dZZezH+8LeYUD4c6SPFEXxiNeIZAv
	NZLn9cN6bKQLaVX9lTUF2nNmqijrn8WPhaSpeqeSNnZdNpdoDTqTuYpEhY0y+72yNiTqhDFtbyr
	OhCPhYE5VV+HKOekEluViF9bHOmkGhpUmBXyGOQmHPxEnDdZINMAMYHxUBC8E4nuG8p/hyD7dPD
	iHXkaNnmD4NjYqjgTyxSACjy6eWinXEuukXXHZVbbJY9nJ4wVWI
X-Google-Smtp-Source: AGHT+IEbrRmLj2uKOuyl6xkrJtxDUC1KVwEPA3dNsbU/+R2F0ZKZu/sQbMNvRjB6t41GnHxO0mDDAQ==
X-Received: by 2002:a05:6000:4023:b0:385:f220:f788 with SMTP id ffacd0b85a97d-38a223fd77bmr14541441f8f.48.1735036611884;
        Tue, 24 Dec 2024 02:36:51 -0800 (PST)
Received: from skynet.lan ([213.99.205.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm13645138f8f.69.2024.12.24.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:36:51 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: linus.walleij@linaro.org,
	kylehendrydev@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v2] pinctrl: bcm63268: add gpio function
Date: Tue, 24 Dec 2024 11:36:45 +0100
Message-Id: <20241224103645.1709996-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241207223335.17535-1-kylehendrydev@gmail.com>
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kyle Hendry <kylehendrydev@gmail.com>

There is no guarantee that the bootloader will leave the pin configuration
in a known default state, so pinctrl needs to be explicitly set in some
cases. This patch adds a gpio function for drivers that need it, i.e.
gpio-leds.

Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm63268.c | 71 +++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63268.c b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
index 80c2fc55ffa2..a98f57e64d1e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63268.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63268.c
@@ -34,6 +34,7 @@
 #define  BCM63268_BASEMODE_VDSL_PHY_3	BIT(9) /* GPIOs 26/27 */
 
 enum bcm63268_pinctrl_reg {
+	BCM63268_NONE,
 	BCM63268_LEDCTRL,
 	BCM63268_MODE,
 	BCM63268_CTRL,
@@ -242,6 +243,61 @@ static struct pingroup bcm63268_groups[] = {
 	BCM_PIN_GROUP(vdsl_phy3_grp),
 };
 
+static const char * const gpio_groups[] = {
+	"gpio0",
+	"gpio1",
+	"gpio2",
+	"gpio3",
+	"gpio4",
+	"gpio5",
+	"gpio6",
+	"gpio7",
+	"gpio8",
+	"gpio9",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gpio15",
+	"gpio16",
+	"gpio17",
+	"gpio18",
+	"gpio19",
+	"gpio20",
+	"gpio21",
+	"gpio22",
+	"gpio23",
+	"gpio24",
+	"gpio25",
+	"gpio26",
+	"gpio27",
+	"gpio28",
+	"gpio29",
+	"gpio30",
+	"gpio31",
+	"gpio32",
+	"gpio33",
+	"gpio34",
+	"gpio35",
+	"gpio36",
+	"gpio37",
+	"gpio38",
+	"gpio39",
+	"gpio40",
+	"gpio41",
+	"gpio42",
+	"gpio43",
+	"gpio44",
+	"gpio45",
+	"gpio46",
+	"gpio47",
+	"gpio48",
+	"gpio49",
+	"gpio50",
+	"gpio51",
+};
+
 static const char * const led_groups[] = {
 	"gpio0",
 	"gpio1",
@@ -394,6 +450,14 @@ static const char * const vdsl_phy_override_3_groups[] = {
 	"vdsl_phy_override_3_grp",
 };
 
+#define BCM63268_GPIO_FUN(n)				\
+	{						\
+		.name = #n,				\
+		.groups = n##_groups,			\
+		.num_groups = ARRAY_SIZE(n##_groups),	\
+		.reg = BCM63268_NONE,			\
+	}
+
 #define BCM63268_LED_FUN(n)				\
 	{						\
 		.name = #n,				\
@@ -428,6 +492,7 @@ static const char * const vdsl_phy_override_3_groups[] = {
 	}
 
 static const struct bcm63268_function bcm63268_funcs[] = {
+	BCM63268_GPIO_FUN(gpio),
 	BCM63268_LED_FUN(led),
 	BCM63268_MODE_FUN(serial_led_clk),
 	BCM63268_MODE_FUN(serial_led_data),
@@ -542,6 +607,9 @@ static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		bcm63268_set_gpio(pc, pg->pins[i]);
 
 	switch (f->reg) {
+	case BCM63268_NONE:
+		reg = 0;
+		break;
 	case BCM63268_LEDCTRL:
 		reg = BCM63268_LED_REG;
 		mask = BIT(pg->pins[0]);
@@ -567,7 +635,8 @@ static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(pc->regs, reg, mask, val);
+	if (reg)
+		regmap_update_bits(pc->regs, reg, mask, val);
 
 	return 0;
 }
-- 
2.39.5


