Return-Path: <linux-gpio+bounces-26155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2BB57424
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 11:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D3727A186E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BE32E9EC0;
	Mon, 15 Sep 2025 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fAo2iTxR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96F1F4701
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927418; cv=none; b=V9cIhPWZSksnreDoMuFk0Oqeh3xcH9RZcbNBImWxmrQ0IjCulgIRwIyCgx2RYIN1xN6XXVU9AZTSOU4+eHNoMKl+dBErV+U1YlF5DKp94FuX7o8Cv3u7KHWlJrVUq1NYQMuS6k6Eix1KzsAMO70llqPI5HrU9GckKvdlNpiWLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927418; c=relaxed/simple;
	bh=uiQSyjJBLeC/MEWWFA0joFafr04ol6ZutVaTfVfNm1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJdIdGa8lchau5KsJME3AaRYszTp3ADQI+eAZnEjZT11WCdg2lVWzweyNmpnZTy3qrsDxTIwRDbB4AHA67wBRLB0RzLe748vsYeTSo8ukXa6c25pADtyqceRS8rYaz0Kn72r/r+OV+/E79GQ73fozTcDjxtaNBrmjY0t7Vj1XMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fAo2iTxR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2747134f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757927413; x=1758532213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gC48CuIPVAUpIaPPbdHqCEynXZPl0UGj9pzUZ/ahgw=;
        b=fAo2iTxRWbc/36BZFYDH4zxOzrnY4vmIOGc7cqviboGCYYT6xtZXZLaHZiu/1fQHVm
         z/pJ9k8993OiP/l3Nv9W0sWG1jnDqAC+XHpFiM6CRFf3BitysgGGj35j6pxr7OHA0TJN
         h8tUx44aOkn9gnlqLZi7g1wmuNtwnp/wyNi7vRbU8YXNqf5tMohzWrQ6MOzV0o51VIZN
         Gyb8YgUTC6Vi0BLoKkV3BHW5Ibe2oD2In7mK1R8KyNk2CTqMxjQS2fdm5a1IqU2ajxsh
         nz+UCLt5F9b1fYXB+6Ql9OkYHcHN1rjn0ECxLOU/niRfySqK03qrYEhPqdeXAsdoKwmL
         1CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757927413; x=1758532213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gC48CuIPVAUpIaPPbdHqCEynXZPl0UGj9pzUZ/ahgw=;
        b=ogTVyCx1kHW0j0Xcxf5Y8qJTI83fZTPoTkc3iHLstsMSPd9V8FD4yCfZ4JPO3M5VZd
         dW7j7n0V9Fuxx3g2DKG/serxZ5f3QdGHoyFPsvITjitHbD39mC+GV7KciMV3JXjHUeRP
         VeMQ9AwaUu7i0+JhR7x+Z7MavVcdqofMgK+zTUWog8xD57gUR6zRpM+aPvU2LJu+QBZ5
         kmXdY3Lw8TwdnE6na+UG2zvQ96q6ErkSLtSM1bPY2z6hWNaMCFT16thWkqsuEOcTiAcm
         205LkJy3lswVkNTNIqaYlMdgZA937A7snxgNPcD2UqWJcWODmmNxZ+dwuZA72YIB1Fgc
         GRuw==
X-Forwarded-Encrypted: i=1; AJvYcCVrddO9HsFOzEl3JJxNxNCYuFW0niOAS8mkDzWeloP18JIDxWv4LRXLY7UlP+pTVne8jP4EnQcxh+nx@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+dqIws58Nsn6BtKupBK1q74gUg+6+3Bw/nBpbIKlB/UOHFr8
	7f/rmtmfyEJUPky6t/vlmuMSkq+6YMw/jo84LWSBvnqktKHt1dLhzTx8TkNWNEhsH1U=
X-Gm-Gg: ASbGncsuM5Q6gLz8t6OW+RE3xSxzyoTbScd//GULlayzTLVn0/89Vk9Yx7k4jNMvFI9
	lmK+vMI5RmV03b+2oQ5wZVK2KiYJhmuMRWbjoE3XEoD9t27+sri2POVzp9PqfIDzl7jXmIfjd6a
	VJ/zR+v4SPJnobZ7/AlPabOZHPl1DUD7Yz6TGFl3juzayfNAvZIkGWT5pjJw6rirmxNs57lC7zA
	MT1JnMRBXexO70rpcWCEyX27LQUUKM0r2HyXigAR6TFmKpGBZUBG5hmanpma/T4YIjny3ESI/AT
	2i0U9GRTVCh3YfszUEh5aCe5hSR3kztwTrSF5ofY1tjVPHMWk1wEPdcMQUydpKGYSqsq1LK7rgZ
	cqPRAee2TBScNxWa9cse3bk8=
X-Google-Smtp-Source: AGHT+IF8U9aFuvgybHAns+BSiaqZ/+CjA5sBe4WvlLdR4faa+ocFyZhcYRT82b5ZorzzOtUHEBT2UQ==
X-Received: by 2002:a05:6000:430c:b0:3e9:d34c:17a0 with SMTP id ffacd0b85a97d-3e9d34c1a24mr3494142f8f.34.1757927413116;
        Mon, 15 Sep 2025 02:10:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7ea7:8025:6711:b617])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e04cf2870sm90201145e9.1.2025.09.15.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:10:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: nomadik: fix the debugfs helper stub
Date: Mon, 15 Sep 2025 11:10:07 +0200
Message-ID: <20250915091007.28438-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
in debugfs callbacks") failed to also update the stub of the debugfs
helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.

Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509132232.12viPUPB-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/gpio-nomadik.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/gpio/gpio-nomadik.h b/include/linux/gpio/gpio-nomadik.h
index 7ba53b499e16..592a774a53cd 100644
--- a/include/linux/gpio/gpio-nomadik.h
+++ b/include/linux/gpio/gpio-nomadik.h
@@ -268,8 +268,7 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
 					 struct pinctrl_dev *pctldev,
 					 struct gpio_chip *chip,
-					 unsigned int offset,
-					 unsigned int gpio)
+					 unsigned int offset)
 {
 }
 
-- 
2.48.1


