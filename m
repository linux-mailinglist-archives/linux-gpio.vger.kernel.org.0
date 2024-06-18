Return-Path: <linux-gpio+bounces-7518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409890CA3B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1C9290535
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452A71A08C3;
	Tue, 18 Jun 2024 11:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CETyuQjA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93D1A08A9
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709512; cv=none; b=sQsImovNa4OeYkEq8hSPEamYWbnp2ufAtfl+MoAIQVJhDuAHzNjrNZ9MILHEqa80L98bI37f//Q994o7UecmFbftXCTgb9/6KVOfyDfo2KRjQLtZRHtfJutBgzbDgmNGCuJfFAqOZEtHBKCH16wdihlAH0IJR9fhPRw0T31+5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709512; c=relaxed/simple;
	bh=VpwLSXxd2so5RpDUPQQbRIpAOvy+lMCNE16WaIXiuXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gel3YEfy99QoN09uBxav3EGqFsZgGUFFgXj9wYkwwz1ykpUil96qAmY5CY2OJLaYca9YM1hPrMfcHXe3Ry/aEbMlxRYLbHubNowCAfjuOynzBwo/pq8+3wsOY3R/ipV3OzkDYXC/pcue9yjukmHeLPZn1iX/30vUP4XvWoIORUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CETyuQjA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ec3c0dada3so1598341fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718709508; x=1719314308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAlYx/JuM0nLXWPnb4Hl0KlsCS/vpWurWGlHz9NapmM=;
        b=CETyuQjAxCV/2ihW6z8lGioKPMvlz6+f3nToboCBa0dnC2NR/wGpprrm2AOG9Bf/9+
         sLe9xcFIZwmE7krb8rHSSCyGyprLCBMqJrfiwgbzLe7PgjeU9IdnzHrW0v7oG/v8x4e1
         EunzRkTqsj24x/pEykntig73daQCQoXsIek5Tajep+LNuLxOyvamxNo5mqAdIJDGztqu
         YyBohwrh4cojJcdzfeugNr7YghNgngFGvg/2oXmTv0PnANt7As1+6AsW11GW4qYVKioD
         4/9mjbzT3D3QaQz9mBIyH7nHRyUkR3yFTcodJ6zSRgM3G2GfCGd1ZBfaj2TkqM/mC1mp
         LLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709508; x=1719314308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAlYx/JuM0nLXWPnb4Hl0KlsCS/vpWurWGlHz9NapmM=;
        b=sP5pK+o57BHHqKklWtMugAiosdNrCvI5hhw/O4ej3kgE/XBounpIDNWDiokWdw4Ct4
         u1Hyx8qzyHAXWCcZfV7CloML28SL0OpjRLJObVZ1OxJEoIiwKMybZUXwRRXeoxI+/Caj
         Fw7ioAmY2n748XDgpvQSTajXoG271gHXb1wAvmY0DeMlJXdWf23POyZfrPbSQN2/6Yox
         45+RmcLxyJ/RbHRsFJCKQJLFCLzscjgHpi0OsjDixkcZ3RGv9r3ueI+kSEtPZ39+XJxU
         Cy7bHsql6eU5rJQaf15BfPmgjzfYiaSzkfOG2NuEGKLfDvx8nsj/suHu/7fIeaB2fCbE
         fRtQ==
X-Gm-Message-State: AOJu0YwNY3i4jr1nQqktWtvXpjJZq/JRRcpk7dhMr61uzFOswHEIHxr7
	Xuj5wFzYixs5cSdacee433ePkqt+hxSrxKXXKAnTdLO43ueuGeYIJoe+lfklH0RLRZ0MDtkdY3h
	3
X-Google-Smtp-Source: AGHT+IE9A08bBC7d6Sk1JmiWrXwfKAgU+YUKuiR8b7sOFmkrRIqZM7JKEf2GvjkTRTYxJ41G4x7yyA==
X-Received: by 2002:a2e:9dda:0:b0:2eb:fda7:e366 with SMTP id 38308e7fff4ca-2ec0e601058mr92996301fa.39.1718709507530;
        Tue, 18 Jun 2024 04:18:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:4028:a105:7678:4219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-423b67b3037sm111434235e9.47.2024.06.18.04.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 04:18:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Support Opensource <support.opensource@diasemi.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH RFT] pinctrl: da9062: replace gpiochip_get_desc() with gpio_device_get_desc()
Date: Tue, 18 Jun 2024 13:18:24 +0200
Message-ID: <20240618111824.15593-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to finally confine the unsafe gpiochip_get_desc() to
drivers/gpio/, let's convert this driver to using the safer alternative
that takes the gpio_device as argument.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-da9062.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 22e3cd2cc963..6f44a13b90ce 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -139,7 +139,7 @@ static int da9062_gpio_direction_input(struct gpio_chip *gc,
 {
 	struct da9062_pctl *pctl = gpiochip_get_data(gc);
 	struct regmap *regmap = pctl->da9062->regmap;
-	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
+	struct gpio_desc *desc = gpio_device_get_desc(gc->gpiodev, offset);
 	unsigned int gpi_type;
 	int ret;
 
-- 
2.43.0


