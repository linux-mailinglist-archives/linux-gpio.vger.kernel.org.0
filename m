Return-Path: <linux-gpio+bounces-11500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F19A1B87
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 09:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAD21F21FC4
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 07:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27E31C233C;
	Thu, 17 Oct 2024 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AI3dUY6A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3517965E
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149533; cv=none; b=fUbjyBxyKYCdue07gt/jmKIfQXFDHxLc+FjgmyejBnfArAIel+Op2TEhK9Gz9sLLssEUZ+Qi8JnJmM94dd6MRJ72q1OeggxTbNNmO6DKkc/f1g4+woN8Gu0klL1d5MQRkecDsZFFPnF6ZqWOrSQffHk3IH/eYJIudWHw+ZC0nQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149533; c=relaxed/simple;
	bh=/Tz1uytEncQnKCf7BKQ90W3CEgzElwthsc+wGhHdK74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6GakD49TZxELne/NbCCdOMO7UTa9eUxVWzxBnly7rUlcylDJknBHEcFsYkJAhCWgBNjVUqr4U84b2H2YO8/7t4bTOypCnysaN5Plznyr7vi+I7+9Ca8zNu5lq/bvpWMbTQVbewB8PgmQz2sfighJOyFRqmgmX+m6hqE0lge1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AI3dUY6A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43140cadeaaso6355645e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729149529; x=1729754329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIBoDfKZ9ZFh7nc2E5XumESAmUlmdkgbuDNAD1t4zKw=;
        b=AI3dUY6A9wGDp574LFsGDoLdvoMfBJgtokOQC+UTmEe8wWbu2HZ8RCxQw0/XDW68te
         uoKlKXJixygKd9yAkd4BmuVqlQYlScyfIOYl8eC3nckhaiMRz15/cOXfGl5eLfRYrbVM
         s9N3WVMYrCM0UpqPr545Vp5xTWuCHOT/iaFGr3oZ/Qw2k5EbhLrGCALsHb9cvPhNEebu
         kk6O1aNoZN82gvZRfcoCPE0Nq0BknfgE3BnpIW/287EBnvYtdVEYuMGrM7MEF7pn6Ek5
         fr8yXS3426GABDfkzrnBA4kBnATfY/9HKt4gDwmOtUvsxeGf4MS8bB1KUyulpDVRlg09
         AUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729149529; x=1729754329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIBoDfKZ9ZFh7nc2E5XumESAmUlmdkgbuDNAD1t4zKw=;
        b=iizIILXUMq0kGsZYoVaQYxZAbkKLrQSqxF6FtWjplAGUbFYnK5gd+uwhHonkWWNhQi
         cS6fDQO9F5CCctoR9aAUYN324oY8kZRbwuILWVse1ojnISQM152Ri+f8FiuhhR4SxPYS
         XiHyiI8DKU0Rizcag8ZJOo1qmEV+e8IF92ZQB3nIEOktmtmo6lKQgTl1D2FVBLA7Oryx
         jE8vlrvyxjkYfRfV+CTqOd/WL6FWdTF938ucjVHs+ZUnNa29syRHn3qokxTX7mZ1eXH8
         JAfjyPOO1ERzUH6dWRCc+NB29NH/pC9y99Om/aEXGm6Hk770IEBXIz1q/kCJNGGgP5mX
         a3ug==
X-Gm-Message-State: AOJu0YxuJ0RNinOm/jWTwe4QKLlWykjWvTVwOJmR75SRy74DnYFrimjV
	ompSuZXIPczBd0547IAIDMaJUjD+9U/NoV34DVODBauFtY8zoIzN9mREI3MfpKV2lLmzJJjh09g
	D
X-Google-Smtp-Source: AGHT+IGUlLk/+ncFHSYy87g44/sa5uyyc3oBygZBL+N9jKSBArzvjJFb5Cd/yp87TDD2urtIeulqzQ==
X-Received: by 2002:a05:600c:44c7:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-43151e527d7mr36278995e9.14.1729149528802;
        Thu, 17 Oct 2024 00:18:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87d56sm6367887f8f.43.2024.10.17.00.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:18:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] MAINTAINERS: add a keyword entry for the GPIO subsystem
Date: Thu, 17 Oct 2024 09:18:35 +0200
Message-ID: <20241017071835.19069-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Every now and then - despite being clearly documented as deprecated -
the legacy GPIO API is being used in some new drivers in the kernel. Add
a keyword pattern matching the unwanted functions so that I get Cc'ed
anytime they're being used and get the chance to object.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fae25c425f41..ec9f98ab6872 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9808,6 +9808,7 @@ F:	include/dt-bindings/gpio/
 F:	include/linux/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/of_gpio.h
+K:	(devm_)?gpio_(request|free|direction|get|set)
 
 GPIO UAPI
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
-- 
2.43.0


