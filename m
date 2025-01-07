Return-Path: <linux-gpio+bounces-14555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE2A03C4F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9560F7A2E13
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 10:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7DC1E5702;
	Tue,  7 Jan 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFF7t3f9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EB318CC15;
	Tue,  7 Jan 2025 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245664; cv=none; b=tpN1pziPO0Z47lasD51pQDe3O+3S7ylDdfPNnR+awLFdXUpzVxK7XkerWBaRMwDhbBMxMC7RNpnHMxyj+mRV8t58uJ/5jI5LlP6s2K0L2ZotrWRop4ReESMnsQN5uH6SWlxC4O22vAt7nsXAiug/9PHlGB5xm5RmOlME1d+k5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245664; c=relaxed/simple;
	bh=WFwqvebnZYlvsfnAdjKMymi8RO+WtWQ4eYvHixG+Mr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tI9RlEHGCTvxWkERXPnbX3MM1K3WXnZSD7ctZvM02PIcrWTiVhtyUEvy8ud8/XMeLn5ZCBcf8hoefppUzL1Shs32/7VOCXOLoAmWPBA8o1fZqxuQekPFjUMAT1TgQUDWwoCzP4j9rYcKVgBb4k0/ia/2YVWl7Xsl5AqccE1x0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFF7t3f9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so160238245e9.3;
        Tue, 07 Jan 2025 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736245661; x=1736850461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RthZf+Uz2a/aybK3jFTrvjOQ/8cZLncHw/Zh8UUF4SE=;
        b=cFF7t3f9KwYL31iuJucU4+g5ff1AA938rNK1wY/gdJjt/c8IL6GoKKled4mtPsFend
         qYqSyUrnDMl0v8G8BWcLWe7W+iw1nh82HOAYr9+6FdKi1usUoaoOcT0ipEYtBy82lOA5
         wMei6ebJoyi+IbUTtVJtp5GwExEYDKpvF/R/3klN4TEmf6mWyPrEaNmlW0OAs/SXHaRd
         VWAsHa1hnTXoFDID2TFEY+hwOINWzPRLlwaRC8EW++gC7MVvabslJFp7e9UqQJ6AyWZy
         VOfgC2u5D5/i9KhdcTqBZiVf14ioIpyOUWtFDX+xJdvB3RWLUpq+wiUl1wKrw4vPc8BP
         m3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736245661; x=1736850461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RthZf+Uz2a/aybK3jFTrvjOQ/8cZLncHw/Zh8UUF4SE=;
        b=OefV3+OlM2QrSVXzmIVcPiFZe8bQc/8+Q6LJwR2wYgTF8zrH8zrWTQVNCr01islbyw
         IkNpTbsmXdrGJc1yAhg055lFkmDUti/vH50laYItpz2eohs0aNHNLW0SvHG1+eu8DVmp
         TrTqLbj8aJTm1CHI+hKpyuYOmJZJqsrkMgDPWOswsGl5u1TJM9TZJk1ZWye3YjnmyXY1
         0lOEDPrhLnVcuP0RgcwPkf8tZcj4B1twsxjK2PGuUdkBHcKSo1FkqdA9PyC9RDIOFvpI
         lKMXiGAKumtQJSZu9L0LJaHoQvmaye4BRXB6fB3X1f/9TmGk4d1TikUS0E9Usm3qzbJ6
         6C2w==
X-Forwarded-Encrypted: i=1; AJvYcCUxtr/DbPA+NPG7SQMnfj1hjA7fOZPEL/Qq0L/fMHJ6MBSYDk+g131OZZKfHlUrIo8HXpg+vPSSotKz@vger.kernel.org, AJvYcCVhun2i4Xv6fGgyrsTHbLLJpB9NrZYnhK4yr8nm6zgxYVN0eZrt+1kcUWXZAZmI8D8MWtiWGPjWc1Ut9onv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4riyZcu14YYlvW5ISDx0tArl3Lem0kqBc5hb9b3CZ7DQHvmdb
	Df733dQTJenzdpPt3z6vEp5AQ0UYll5yqernS99X9Pbxo1DjrgwtwwvV2w==
X-Gm-Gg: ASbGncsIa3OF6WYSCir311wj4Z1sHe6/3lq3umNTvV2J4Q9JILsGZ2Q6GAt9rnfHE7Q
	vp3RrsCzIMvZMGoxd/2KvGo3VVrVDFoFcyt2H+3gpk/0TAE4MxoCgzQ8Titlu699vV1Upq2b22z
	Pz5Hr95SGxCzc2bD9btK/npFdQV/ktBFmvC7O/TL5YR4HGTxhkekUYllRL3PL49lQjwNabKoS9a
	3T9AmdM7sDZlpMcP/wt59/FoGwj0AbHV06zY60t8fQIQLnF8/c=
X-Google-Smtp-Source: AGHT+IHpcs5/Y6QnrWi8/KARfuNk84e9i8ep1cettj2dvIpLDM42rTItbwajOsfb5XJoHiRsHxFSDA==
X-Received: by 2002:a05:600c:548e:b0:434:f753:600f with SMTP id 5b1f17b1804b1-436686473c2mr522918005e9.19.1736245660584;
        Tue, 07 Jan 2025 02:27:40 -0800 (PST)
Received: from skynet.lan ([213.99.223.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3d5sm598711065e9.5.2025.01.07.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:27:39 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jonas.gorski@gmail.com,
	kylehendrydev@gmail.com,
	florian.fainelli@broadcom.com,
	linus.walleij@linaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 1/2] gpio: regmap: add request/free gpio_chip functions
Date: Tue,  7 Jan 2025 11:27:34 +0100
Message-Id: <20250107102735.317446-2-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107102735.317446-1-noltari@gmail.com>
References: <20250107102735.317446-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow configuring gpio_chip request/free functions when creating a gpio-regmap.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/gpio/gpio-regmap.c  | 2 ++
 include/linux/gpio/regmap.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 71684dee2ca5..32ec85b41653 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -261,6 +261,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->names = config->names;
 	chip->label = config->label ?: dev_name(config->parent);
 	chip->can_sleep = regmap_might_sleep(config->regmap);
+	chip->request = config->request;
+	chip->free = config->free;
 
 	chip->get = gpio_regmap_get;
 	if (gpio->reg_set_base && gpio->reg_clr_base)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index a9f7b7faf57b..cd4ea9661eea 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -5,6 +5,7 @@
 
 struct device;
 struct fwnode_handle;
+struct gpio_chip;
 struct gpio_regmap;
 struct irq_domain;
 struct regmap;
@@ -82,6 +83,9 @@ struct gpio_regmap_config {
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
 
+	int (*request)(struct gpio_chip *chip, unsigned int offset);
+	void (*free)(struct gpio_chip *chip, unsigned int offset);
+
 	void *drvdata;
 };
 
-- 
2.39.5


