Return-Path: <linux-gpio+bounces-21957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89CAE2D8D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jun 2025 02:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B0018933E5
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Jun 2025 00:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915AF10F9;
	Sun, 22 Jun 2025 00:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOm3bnpR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BA42581;
	Sun, 22 Jun 2025 00:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750551159; cv=none; b=tMbn+AGeNE/fUsD8YEAMKIZtWvsgVxkDGUEUrdnuWX5x7Z3USW78i/55ziFRI3nKfDHPnYeo82s9dxH5e/natLM2hAIcwIBbTJmuskJTbs9YDgHeJmlEi/VFd7R2Ma7zohHcBG0jhGGTEXGf2qliOP/iP8m8d9hFL77Oaf2aFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750551159; c=relaxed/simple;
	bh=+LNGxBpCI6GP9TEYYN7G46vH2ihk00vTao2b3vDmTdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XO4caJFqBOrSo2HnaZElMMPmv/DGGxXQQWObdZ5T+7L4YoQHhWk909oypjeaNXmWXAz0sbiTVDhaIFj+CmM/bNcCGfToJ5teKNwcXnMMdeuov0j+3EBrRypB1+iAe/WJyMoWBgAvlaZkNQiteNrEo3r5zVIy2yTHoRWhqeWvR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOm3bnpR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23694cec0feso27814475ad.2;
        Sat, 21 Jun 2025 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750551156; x=1751155956; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha8RVzKFgvDKatVrH8hSX/WoEvJ4rCqR8rQ8LtdsioU=;
        b=ZOm3bnpRdah8/Ndi9KA1MFpqk1lOL64ZVl0reoqhbdhtH4+n+g0dQ+5bO6AyoMyFgV
         oF8NIG7b85yz5RBVBOB6HmhLd9AeGxkX8BRHHIEjGW8vDy0VUHacAZJ1PqCYneYb6+jB
         ia0byZLTP9wY5BzrIcP/7uO/Ki+KUc8ZfLKZsj/ER5cXOmdna1rj32Ui6NeJZcgicUXd
         L5i20IyAPo26fkF1CixE+dY592OxUtpf6LeXqUnfqKJ+fkaUD7iWMxmxrCgOt4lemDSC
         N0VzKOa4vILjEZ7Bf0y/RL31V4VUYTP/sTvF2nVH2qf6WF84laK1X3IzgF1o4fCpsHr+
         lh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750551156; x=1751155956;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha8RVzKFgvDKatVrH8hSX/WoEvJ4rCqR8rQ8LtdsioU=;
        b=E/r+b+ii5hjls/SRiB5ydYyUndsqA8RJVanqqNFJq20dqMWGqQ3rXiovUrHLDGLBMD
         34uVb5RixnBStJEuLjsclRLCpOKiN+UMqzSDkk1T4TFNQHgx20zQZEUrDHbV70OERdqq
         ELOqQaxS235l0NTPmusrs8nM9+EV1SdShMzKzxEgPZZEkhfIMMtsgGIWP0k75S3BWifU
         UNyvRN3HR6qctOs52EPBp+xbnW/jdCV9zE/ra3aFAXABeMGA5u+hd7cetw1gGXsBvZyi
         Mp08EuQ484XyF/QrmaRNqrsyQihMeJf9eq/VbaGZQdsrhhwXITyUGRxIzMcv6KO1U5gG
         EdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwmHL5Wpc9YO/lZ3NKhKQLBSTmo+biIqx3FTD6mMlEMntFfsaZpWsHKFU3fh8Rw8KVjQgMZtylO3xBbrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH30tr6cQYS99BwbVP4Jw4k5e0Dey7vkj8Je8IVeiU+H1BaGEN
	6cA3rPhELRL4p8PGxOPnWsclGYZCXON+9/aFPb26+2BYvLP29+vwpYoyTdZlRdzi
X-Gm-Gg: ASbGnctcWmxf4GGX2ZZ0TDSjbcNzO1GylxiOYpBgFpcx1xs9OvjNmg3cgqFyErQYBtC
	yh9nuWSyTXissrtx7tbxk+9i39Th18BTUSJKutA/vQbYHi5Njj/RvGZNxeFOS7sJUvgdKrEinls
	A/imZxiTWBqg6aY6wiLc6YAAyMWWV2V4OVcMJxGmaCtjPzfRvfLyWY1ukvViGy0fZ6f3x5rfWPd
	Qhb1G7zljMMJxpBlEQe2mOnVjKp1TGyQ8ZYPr87+n+d2rdkIHGJUtgfIAU+vFGt6KiS1P9ac94I
	ZMsI5ne/JQiowHQ7jYOljyEEPS94vNVVX7bylcuQDdwn8f6q0ZdTMt2yZEhj1BALAFB0jKt/ZFS
	64FbPKiNmAa7cmGTWxa49enwwZwadEQjWXl8nhUYf2Mg8DjPj
X-Google-Smtp-Source: AGHT+IE3L5vup/gATNjtPT36dd6btKt6pmuGAq5K3HwTh/z72FsSuvsU3UFYJTTxJO74W0LUEytE0A==
X-Received: by 2002:a17:903:1b66:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-237d96dfe41mr135237915ad.10.1750551156150;
        Sat, 21 Jun 2025 17:12:36 -0700 (PDT)
Received: from danv-Standard-PC-Q35-ICH9-2009 (75-164-251-97.ptld.qwest.net. [75.164.251.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f8261sm48602565ad.221.2025.06.21.17.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:12:35 -0700 (PDT)
Date: Sat, 21 Jun 2025 17:12:33 -0700
From: Daniel Sullivan <danieljsullivan7@gmail.com>
To: linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: ts5500: use new GPIO line value setter callbacks
Message-ID: <aFdKce3Go9iF4A6m@danv-Standard-PC-Q35-ICH9-2009>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Daniel Sullivan <danieljsullivan7@gmail.com>
---
 drivers/gpio/gpio-ts5500.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index 61cbec5c06a7..bb432ed73698 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -244,7 +244,7 @@ static int ts5500_gpio_output(struct gpio_chip *chip, unsigned offset, int val)
 	return 0;
 }
 
-static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 {
 	struct ts5500_priv *priv = gpiochip_get_data(chip);
 	const struct ts5500_dio line = priv->pinout[offset];
@@ -256,6 +256,8 @@ static void ts5500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	else
 		ts5500_clear_mask(line.value_mask, line.value_addr);
 	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
 }
 
 static int ts5500_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
@@ -338,7 +340,7 @@ static int ts5500_dio_probe(struct platform_device *pdev)
 	priv->gpio_chip.direction_input = ts5500_gpio_input;
 	priv->gpio_chip.direction_output = ts5500_gpio_output;
 	priv->gpio_chip.get = ts5500_gpio_get;
-	priv->gpio_chip.set = ts5500_gpio_set;
+	priv->gpio_chip.set_rv = ts5500_gpio_set;
 	priv->gpio_chip.to_irq = ts5500_gpio_to_irq;
 	priv->gpio_chip.base = -1;
 
-- 
2.43.0


