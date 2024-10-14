Return-Path: <linux-gpio+bounces-11302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F299C850
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 13:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43BB1C246F8
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A141A3BCB;
	Mon, 14 Oct 2024 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zCCgVU+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426419D07C
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904034; cv=none; b=g7BT11h7kBtHKxCZV+YjooFTEzBDuV4OHBwkttQw656eR4X5PmyPISHknhBZcjhfDAZ9ZLviydlo1LTAKbF3sHG9MmhdAphDdJq1/gHJOINnfIr/ai6b8MMlY4kfnNC5uLXAh8c9pbYmGef3lRk1wJ39WfhGVGwR+htaJrtyeoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904034; c=relaxed/simple;
	bh=FRJNE39drmMWbs0IJEPZYyCVdjsc/3sZuKjUOjlKPOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIIaiZiF2oQfw+1V/PQd7eQAcnvXrrv7iUURImnNaTHJILvbbVempq5QZT8X1p1n7AVEyyllOaEZpZIWx3iLQA+cR00/FKF6YnrlWREIwfEjEopXGAbONAeIdf8Eg9NdxYv+xFOSmqArIXWnpmpIfUTfrFNFF2rQ4HT8iTkD1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zCCgVU+8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43123368ea9so18243545e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728904030; x=1729508830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3zfwAAeS6R6LpKSeC3ngQNB0NDIv/4Dub3HhJxrUX0=;
        b=zCCgVU+8QWH41mwEq6qG3lCik91oljrrQUADtlrJ3xb9LdeJqrQGtjwdrjliPBJzmU
         PcpOmA4zLcCMRhdnOSGojZQSJxNxcBHQEEwVyMmE1Pmg1wFCJk63rmSF+xqaGoxwMzm+
         DmVyELjX2XsGTNnR7/Qn9M6o4HUrIJAGyyen4zEjwH7hk8HQb0Qwc6XS2m62eBopz59j
         pNmJhkvGbuBLp8ecWeiW0Gnp0I982Cc4NCAyWavjJrTHUuA7lnghue7n9riczUqSkHWq
         uLnU8Rs9i5xo58KSC3MC1dG/pb9bCMRtX5V439vBou36cZ3e0FK3tRams8DvJ5KIZBpJ
         apyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904030; x=1729508830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3zfwAAeS6R6LpKSeC3ngQNB0NDIv/4Dub3HhJxrUX0=;
        b=AFGq8MvmOTH29a2jRY7i/L21rnIQdpbHm6ZvaWCr8VO89YTfaMv8DQOnoGTJAqykoo
         KDDkjjiSV+sz9k9hTaltatjTGmjnj4h1u4mqKh3R9Kbc8JTaLbWLMwBycJWeekF6wlf9
         vZtRA0QyteIYkwNNcArwtN8arHuTxSz+deRHPzne+DoqD3bolUFIwyy7E3Zcai52/sz9
         FxDAkyyruBqHtLMBeK2zkxJmPGAfTFw7pqjEIxqH5JNdoyQILFkfJNbCI+oXS5CwhQdC
         CH73QobkO0Vjg9hcIHcB1eIIA2QB4CHXSoD3eyxTkJrdVj2lvnwU/NdTFPLT6d001n6h
         5YkA==
X-Gm-Message-State: AOJu0YyKWdFalDMrqLlDn1K9Thi2/jDyitN/4g0JWsMy0tXHiGDFdfLV
	88OefpZADpcjFIPd/VFeXfFtgDsjoQlUli0NIQAZcBksaAk+b8XgaLj+tkqR/qHMrEkg84aItHE
	N
X-Google-Smtp-Source: AGHT+IGNQzlFW+q7xQekPJFZISxrag4rk9tqYYjwVe92HkdmyDpQU2dlzSlkQT28wJJta12ueGo+TQ==
X-Received: by 2002:a05:600c:354e:b0:42f:8267:69e6 with SMTP id 5b1f17b1804b1-431255d4afcmr71161315e9.3.1728904030336;
        Mon, 14 Oct 2024 04:07:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf1f696sm149957735e9.5.2024.10.14.04.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:07:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: fold the Kconfig prompt into the option type for GPIO CDEV
Date: Mon, 14 Oct 2024 13:07:07 +0200
Message-ID: <20241014110707.101320-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The 'if !EXPERT' bit will work fine if it follows the 'bool "foobar"'
declaration. No need to have separate entries for it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bfa6b5a2c537..7f59e861de5b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -70,8 +70,7 @@ config GPIO_SYSFS
 	  ioctl() operations instead.
 
 config GPIO_CDEV
-	bool
-	prompt "Character device (/dev/gpiochipN) support" if EXPERT
+	bool "Character device (/dev/gpiochipN) support" if EXPERT
 	default y
 	help
 	  Say Y here to add the character device /dev/gpiochipN interface
-- 
2.43.0


