Return-Path: <linux-gpio+bounces-12115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0389B0A11
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 18:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B016B220C4
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB7117DFE4;
	Fri, 25 Oct 2024 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FMhOSvhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEED21A4C6
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874221; cv=none; b=NARFs3RoNOS2ZiAnkfZ1pc3QminptGTLBqcGzPjUsztKqVHElYwX1Vj/IAqzTdM8FVnOSBPeiXlYFoAe2pxvy+7Rzdc3WI3MYz7XPsH4sCewClq4nOjKidZLv5IzDDQVvzgZjPtNaGh/yADoHynvbyn2hvJPj8lZSv+k2lwovUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874221; c=relaxed/simple;
	bh=z8ZYUyX3DegatEokaoi93YFQEe8PkLpJaLNX49odOSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOe8qNVAMxTbXwyudGzEaP34RwIfqMAQdZrDr0uOHd/0SHebLvuWMYo5V4ypIbAjskCZhEG+W7a+TncqfMY0eZVgzo0w+FFwCpD+VbpSP6W0jp3uFpE8GtO9MUWsba47SkyTtXFoLI25e4HTY//Stkar7PD9oEDRhN+mbGk2mjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FMhOSvhl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43169902057so21690035e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729874214; x=1730479014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lGkP35cJnTIdnyhY5sfY8yz0v3JRW7Q1yvNGRDERrg=;
        b=FMhOSvhlsLTVhZ/Xst9Vt3tIQ5wAK5a6fJxhe+EIy4Twncc7qW431xKNRbKTwSpOkb
         GrOfdWjWILmcawnAyBbW6i4NPpoXZH7/unkaHox0jT86HrCJWyRw01E+N1yQ99Omi4Q4
         UbspEw+E3AH9WujOBYhFqDZ/84btMlhKURSc96tXO2mSsrXZ0cS9fR4sRgxuw2WZ/bzb
         ibu1okQYdiTmc9xRxFMQZNTOj/gsJZERO9hCofv16isabiCdqNlbg3XUpK74p3ra/9Cm
         AnCSRS4AvlMgK4bwGCtG/tI2FJXB7QzSi+rzDYJX3pXaLp2A73vwfAogUOtBkmtdwME4
         o3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874214; x=1730479014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lGkP35cJnTIdnyhY5sfY8yz0v3JRW7Q1yvNGRDERrg=;
        b=NOqiumvq5aGM621eScxTzaG+T+AmPla+4kQY/Zi82MDVvAi0R057G9O9bO1vU3L1u6
         JP+OKWbUQvEzk7x36QoDFIx7CQcwbXvdDEGst9bk0GaYQa2WhVAQgtYEwgemjqS4WXDb
         8Mw1sXGOd+rud7l45p1F5LLwwoNLN9Vy3w5jBo80kQ3NaX3sAcEwdKzp9DbcnOvZAmpP
         1KDtTujI4ElmQhxefXo5IL0O2zv8E2spoy6kI4LcoDV2Lztm+hIpr4pmIfp4cjD7o8ii
         ivkPg4rN+T81w6wdyyeIIYsZOvprORApz6QeU5kv0xn71mNwT0HgRO9+MZPD3CtLeDqP
         aFkA==
X-Gm-Message-State: AOJu0Yxx7HYVQjoqTisxWymLlxmsvfrdNNllz5krs07g9Lo7975nrOlm
	Fa5gyqnnBK1NGpcyVXG6vZTr9EtPnQYJFfaZ7XDgwdqgH9sZD/gP++Vn8Npi32k=
X-Google-Smtp-Source: AGHT+IEVcCSB/+2gFz0T4Is6uvy0Nb64CEXaviScFcm3jz+lgW5p91JQltzJOKFrgHlsa8gdQwDoUQ==
X-Received: by 2002:a05:600c:3550:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-4318413f0ccmr90291625e9.12.1729874213802;
        Fri, 25 Oct 2024 09:36:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b92963sm1932967f8f.98.2024.10.25.09.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:36:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: of: drop dependency on HAS_IOMEM
Date: Fri, 25 Oct 2024 18:36:51 +0200
Message-ID: <20241025163651.54566-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit 2527ecc9195e9 ("gpio: Fix OF build problem on UM") added the
dependency on HAS_IOMEM to OF_GPIO to address a build-issue on UML (User
Mode Linux). It's no longer needed as now UM defines stubs for
ioremap() and iounmap() even with !HAS_IOMEM (and its emulation can also
be enabled on UM now). Let's remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e28efd5f9c17..27c18a1f76b8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -29,7 +29,6 @@ config GPIOLIB_FASTPATH_LIMIT
 config OF_GPIO
 	def_bool y
 	depends on OF
-	depends on HAS_IOMEM
 
 config GPIO_ACPI
 	def_bool y
-- 
2.45.2


