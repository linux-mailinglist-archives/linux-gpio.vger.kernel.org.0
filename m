Return-Path: <linux-gpio+bounces-3397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF05857B2B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 12:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA9B1F219D4
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Feb 2024 11:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F68E5813B;
	Fri, 16 Feb 2024 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uRLKV7C1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CCE58203
	for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081715; cv=none; b=bSrUwa8ut3Qk3s1I2Y5A5LH85xi/xSJwlY34ng/QXA8uuC9pLt5W9GbyzGiFEbvLtERDu+XHp/iGGec1HUh4shWs/2Ga0wck6T7vMw1BXjUT+tsV0ImBYraBy76m2Po1n2mbY4FnPEIWsWARj5AmkXdIwq15BLpPOzj2XidG8ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081715; c=relaxed/simple;
	bh=OprIDaPfMCHTrZGtzB7FNvr1ioR2TZWLJ6gWaxHzNCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gt/1Hk0wklxH40j2ql1ACvco2YIteVaMK4kaCV8dEpVLbBbc464JGqyscy4xJF1avJcAi5xzt5xSMbQC92igWglKVtBFzhP0U7GPu3wziY2X4chLT4ggRZphlyQ+VT7joB8pDf8beFWBp6bxj8CHITB4kMbRqLnWzIhYkSniLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uRLKV7C1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412393ea2a0so3978575e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Feb 2024 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708081710; x=1708686510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EszBtn+jIheCOSLeYTHssTg9bKih2RCDj7mGXuxi30s=;
        b=uRLKV7C1tka+OPOtcefryDzYiwY8AZV/WjgELsxghjlQC+daxEERptABks3qUFTjbg
         MYJ+yY+jTRb0zi4wjco6i9Kb0GL3hPgbKSFy+QcQaygmZTEBHtxlI39BQ4K5748eYmy4
         s5Aru84a9GpwNe4QjK7F0zKB2hfxhdXzK66h2aXY4yjOEUSFXratBWJO+GcX+umkO7Nv
         jRtF6g6SaECsgAt6ne5ypBEXqosu1pVz2JE4LBEvr7wTPATdvhpCcU1SU9pjBLZ0QKGy
         E8TJSCRRq+EnpdNeiexxNN2taIPAyXbiOg6MUegAnJ0QN/A9EbWz+MQkEHoVmIwKI8LZ
         D9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081710; x=1708686510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EszBtn+jIheCOSLeYTHssTg9bKih2RCDj7mGXuxi30s=;
        b=mW2rJBDb9nLKN4IJkhAucce6mX7RSn7kGy1MzKs0oLQPFF5PWS+m5aXxAJF/05ZoRz
         OQtMc0pbxr2BNvcVMqXFBp5yyffS7N8tcDsVi3vd8UFWURebktxxVGqCFvPHk2F/2VrA
         u9gKN5UpOs9DZ8ai9mh0OtyQi5T3Qadvm1FTFVi0eTmbRzhtgIquf58wdsX+MNnuB353
         FYxcLSq/99XdxAcMRV6Gggz/yrYFxr8ktGqWNlIzcaYDmWIg4fs82xuKSZQuToTccEob
         rBJMkzbqXlv73EyL3aswkHSXR+T2FgD3vzHqoGLv9WXQ3/IZYS93RvduUqy8H4rZpRbW
         sxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsDRYX3eRQO4xsA5wwSscrLeeH6pgsH2mHSwDIHeEyBPA6/1SG1fKG50rTv8pwUGvhT110TSdPJ+renm9rRcOJefnZr71JEq/XOA==
X-Gm-Message-State: AOJu0Ywy7EA4S4cbUXRo9tUgHiy/bN6kBlrhLtiYK3yRhJzwWKwLozF9
	ELFNsrU+BWd7jCIHRZXN1G56epVuLq3ApSB9fn8v5X60uBpna1+H04M9hledOiQ=
X-Google-Smtp-Source: AGHT+IGL3+BGpCfUXj33fuIZnvOkJJ7Z9V9jcvb5acLLTv95N8YEYsCPGLn9NsotNVH3Oj0dvrdDZA==
X-Received: by 2002:a05:600c:4588:b0:411:e0f0:7a71 with SMTP id r8-20020a05600c458800b00411e0f07a71mr3655646wmo.33.1708081710360;
        Fri, 16 Feb 2024 03:08:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7758:12d:16:5f19])
        by smtp.gmail.com with ESMTPSA id fc13-20020a05600c524d00b00412157dc70bsm2033110wmb.30.2024.02.16.03.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:08:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.8-rc5
Date: Fri, 16 Feb 2024 12:08:27 +0100
Message-Id: <20240216110827.16793-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fixes from the GPIO tree for the next RC.

Thanks,
Bartosz

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.8-rc5

for you to fetch changes up to 2df8aa3cad407044f2febdbbdf220c6dae839c79:

  gpiolib: add gpio_device_get_label() stub for !GPIOLIB (2024-02-13 11:02:53 +0100)

----------------------------------------------------------------
gpio fixes for v6.8-rc5

- add missing stubs for functions that are not built with GPIOLIB disabled

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      gpiolib: add gpiod_to_gpio_device() stub for !GPIOLIB
      gpiolib: add gpio_device_get_base() stub for !GPIOLIB
      gpiolib: add gpio_device_get_label() stub for !GPIOLIB

 include/linux/gpio/driver.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

