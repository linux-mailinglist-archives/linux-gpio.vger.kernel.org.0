Return-Path: <linux-gpio+bounces-13471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82C9E2FE7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 00:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7041E2834C5
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 23:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C718202F84;
	Tue,  3 Dec 2024 23:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1752C/t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7461455897;
	Tue,  3 Dec 2024 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733268838; cv=none; b=UpO2ZTk12VIiNy3oIRm6uDPhMMggGEmbuc32afs7vipzcCXApzpbWu2q2ujf8YPpY4c49JGXpW/wCVBZJgyUT10zuJ54UBwQZsI+Oa1uVtbH3IfhnMehqA/SkynSvS49dKuInFdVps3cSCEYreXtkQqXLIeRk+IbZUDCi+txL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733268838; c=relaxed/simple;
	bh=23b1ZGVdfwFrDv8H1WoVxUqqB5MIQmsaiBWfLBxd6hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V2ug5Hjl5wC4c59Gn3V1wUeh/qCO/dSQJavTMwm+vrLUog9CvqayLE5ni6jZ5mJIx07GedDf63vWXlaf66XymwK9Ae0CNPtToYkk+19SAd2KFzBp1YOt3KbzivEtcuMpcyPlG3IR89UPkZ5bh+1+Na1h3KXu5ZoDU+qyJMvmxgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1752C/t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so5495513b3a.0;
        Tue, 03 Dec 2024 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733268836; x=1733873636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jplALg4JiAwh3fPgDAk/lVd13WxepigZdut6GMlKTQQ=;
        b=h1752C/tCZEzxAA3YHu3r5XA+CWIGvt8bXw25kAoYkX8US81yIOH/0Xgsrr+ic0gzh
         uaFl62bodM+BlbiPIbeB6VqAQmQUHZa1mCdG4jOg3Cl0K20SU1sowRY+gJ0Ad4OxMDdg
         5uB0EfAKWRLnoy1zgiyoAN5yLZjKxnDSvLrR5sPZu30lmV165/FgbOT3A+gxjSlWGPM5
         0FvZKJLJ4jQtGtmCGY0kaymW7z6T9/2zXfgV1SyQuaMlt3qtcq9MDIKVot1pL0vTVvPu
         q6YTv7xWe1CUeOsJW6spJnK1eZtTICOrfkODobLrVVW6RhizTHqXTVQwvqRxLnbwHoda
         x01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733268836; x=1733873636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jplALg4JiAwh3fPgDAk/lVd13WxepigZdut6GMlKTQQ=;
        b=xHuKeLMfUZDTL4533Zr7N/mfQMjp0yxchzhcP1k8jMx19Xfb7BDepNLhSgi5xYmMLA
         jwMJ0OBoKaTha7upKx6K8oB2bTfyakTkqWbodHIa7bRC91KcD8sRiTXiNkH+Az4ZpGWB
         8KOqISZLSzfltVAzpCmREz1+bypvQeGrg6fzNQ//mgQT85K1dq9Z5ZTgummHyjLuYzdV
         DuYisKJMgl1M6FE8bO37N0+XkHyTzctmQshzRmIGXgluIX4WZV3B9Z10AMgpxmwdwzIk
         Wsco+FMckbyr6s6UFXqDBHz013JrpCzwM1vW3DLhE2AVTivRbcH+9JnDB6XlwNZswAsG
         maww==
X-Forwarded-Encrypted: i=1; AJvYcCWuArqVA4YqIQhRR2ppbs39pnD8H+ugWu3qkl0cs+y0gnwaCzwJfkhUJqRCglZXPDeB5DGU8XFT027lE8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkRDML7jmGTpwcDFo7RJ33xNB1V8sCgyU+jqfCc5s0M2LaPMVE
	szXQdriuuV4StrEFeNfJ9Fxv8ae+FscJQDxh7SSJ/AgkcPUrdLLdUiCjImu1+3Q=
X-Gm-Gg: ASbGncvR1pdRm8pcuSEIGGp/SxumV46CTIankc8LfAmnRP4hbiDD9sUIzrvojT6ZVbw
	arD+emzDI5d6z36LSp54FpWoUibRyefIC3yXKQC28a+ZSW4yR0FkBMBSD6wXEVBQs5IejleqcQR
	kejL1hHae9/fCe1ZEpNI/QqcoPOI4uqqjtmrNm5j64jKtdhNf8iZNyshE0KN1Qe62H303sv4Nze
	nNudsXtdTbD2a7GnVgs7pmYOA==
X-Google-Smtp-Source: AGHT+IEemUSIMxxd7GHqxTuF5vKs0XqrXU71EJ5JMBJ6zerMn4TImqsl5Vs2K+HGA7tP/ObQKD2yoQ==
X-Received: by 2002:a05:6a00:14d5:b0:71e:7d52:fa6d with SMTP id d2e1a72fcca58-7257fcc9e56mr5610834b3a.21.1733268836550;
        Tue, 03 Dec 2024 15:33:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fb9b9sm11402849b3a.109.2024.12.03.15.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:33:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: twl4030: use gpiochip_get_data
Date: Tue,  3 Dec 2024 15:33:54 -0800
Message-ID: <20241203233354.184404-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can pass the pointer in probe to gpiochip_add_data instead of using
dev_get_drvdata.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-twl6040.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index 6c3fbf382dba..b9171bf66168 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -22,7 +22,7 @@
 
 static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct twl6040 *twl6040 = dev_get_drvdata(chip->parent->parent);
+	struct twl6040 *twl6040 = gpiochip_get_data(chip);
 	int ret = 0;
 
 	ret = twl6040_reg_read(twl6040, TWL6040_REG_GPOCTL);
@@ -46,7 +46,7 @@ static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
 
 static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
 {
-	struct twl6040 *twl6040 = dev_get_drvdata(chip->parent->parent);
+	struct twl6040 *twl6040 = gpiochip_get_data(chip);
 	int ret;
 	u8 gpoctl;
 
@@ -91,7 +91,7 @@ static int gpo_twl6040_probe(struct platform_device *pdev)
 
 	twl6040gpo_chip.parent = &pdev->dev;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &twl6040gpo_chip, NULL);
+	ret = devm_gpiochip_add_data(&pdev->dev, &twl6040gpo_chip, twl6040);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
 		twl6040gpo_chip.ngpio = 0;
-- 
2.47.0


