Return-Path: <linux-gpio+bounces-8128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC492BDEE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 17:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20E32833B9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 15:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA9C19CD10;
	Tue,  9 Jul 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OIhhdM2+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A6364AB
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537967; cv=none; b=DxW+/8xbgIqVCZK4HDER8OEkbPAdxNskZmse8YMyapOcZXGJxpAvOe6jzlTgx6VDeFRFQtH/gtH0i/CHqZCrBexn5bRq3Bpnbc0+6KXTcAEhCHVfDd+08fl7tYWVIaYVqwlP0zYU626TTHbX6hp0YHMtixZWYySvN8LLc6yystg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537967; c=relaxed/simple;
	bh=+9r+4NMvYbHvxkPuiPKkiOMBg8fjgOr0VIMCHhJ6zWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQ5cunMoZ4Pci4XEtkTj0Qw6gw5k2sSD4aaA2rUrOOxWcHyLAlqQiX33AkAiuzgvgov0rq87baCr9rrP7Vdr0L24ZQKcNXDkyj26FlfsFLISYatmIlJiw9p6/QMcUvSttyaPv/QZ8S5sf0H185LYZ4EDhJMONKjH+sSZnx0FmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OIhhdM2+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3678f36f154so2788281f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720537962; x=1721142762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDxRC/NgipoJ22mOoJFiie6SEQwWic07ikd+EFmNG4Y=;
        b=OIhhdM2+b50/LDdpIGQC3oklLT1aIcDYXOaMUAAhWVeNcjSuzLhszWXbqzz5Hy5MnM
         S/SbmbPav6khqsLn/AvHMXMJfLqHvNrrYrL86Nzi+o7+YdtOXbbNj9Ep9A78JdHFFGxX
         EnAHOUYstvt7t2hZeVx8FayxP37G8zijgzJa1/RyMm2lLq+cazIEJTxcPGvhb/QUXPuX
         g1iC+TsM+BrO5ff/IjQZU4SNsDkRJIOI9TDTZvcQHsVb1rSeZp5ZsjGAlwbTwmPXs4AI
         aDguWYaZZ1tLx8ygOKM2rMmuQrMzxXtsC5lgFS2Kr270/528DicCC1RivpLm75KIO8lW
         1O5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720537962; x=1721142762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDxRC/NgipoJ22mOoJFiie6SEQwWic07ikd+EFmNG4Y=;
        b=nrGhgzC+OTYA+ukdoKmehq+Q2azdOvCPqMm1CfVSWQ+eFKrX+F+kdoZM7JoH+WiGCZ
         WZHXOIOVJlDEJMxPD/YHU7F1355W68q7YWs+zhBdo5cGNdfCnqIl22QZBicfTdIaAMHH
         UCGMih1Y/Si2VTRJjLVWq3WuHW+py37Y/nhkg+SzgXK2iHbm2qu/P/M4cDjSXKL2U6Mc
         BnPC96sfia4jEWcaytV6nRIhkJZBWxCFeeydJlvzLVHsDb83kwhl1G44s78UmWI3Q3PU
         aZ63H+wRgXicKUGEnLDbO4xGXu7XUS21oHD6lP0T/qkB8T9lhxoXhF/ArY1nD8cRLzpP
         Hqkw==
X-Gm-Message-State: AOJu0YyQmCickxdTMjhYW6hQZtDqUGorIfayIXzOdu1RtBqy4aKW/Mhg
	ImUkXYnMDcwo3cr5RiH2seh2QQpxIPUEbr4Ymobgh+Dtvrl681h6Ft+fBh1lJzo=
X-Google-Smtp-Source: AGHT+IG0fX1i0Gqc64WSSgiaRye97wbl7EYey46tsHfUZVzHn7ae1jFaj4u5ZcE1YZBHbQ+Ah4o5mA==
X-Received: by 2002:a5d:6da9:0:b0:367:9224:9620 with SMTP id ffacd0b85a97d-367cea46892mr2490327f8f.3.1720537962092;
        Tue, 09 Jul 2024 08:12:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab11csm2796456f8f.102.2024.07.09.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:12:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: virtuser: actually use the "trimmed" local variable
Date: Tue,  9 Jul 2024 17:12:34 +0200
Message-ID: <20240709151235.90523-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This variable is set with the intention of being passed to the
subsequent strcmp() but something went wrong and it was left unused. Use
it now.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407092245.BPnW2mr6-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-virtuser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 2ac09c6a3763..0e0d55da4f01 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -406,12 +406,12 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 
 	trimmed = strim(buf);
 
-	if (strcmp(buf, "input") == 0) {
+	if (strcmp(trimmed, "input") == 0) {
 		dir = 1;
-	} else if (strcmp(buf, "output-high") == 0) {
+	} else if (strcmp(trimmed, "output-high") == 0) {
 		dir = 0;
 		val = 1;
-	} else if (strcmp(buf, "output-low") == 0) {
+	} else if (strcmp(trimmed, "output-low") == 0) {
 		dir = val = 0;
 	} else {
 		return -EINVAL;
-- 
2.43.0


