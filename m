Return-Path: <linux-gpio+bounces-16674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A1A477F7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8CC188ECBD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 08:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF4F227BB5;
	Thu, 27 Feb 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r0t3kuyf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53680227599
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645475; cv=none; b=riOoTby6PiTIoQM9yrSGBkqsemdO6JCNuhGlj74O07m9JH3RzXPINun1xu4HuUJPrW9W5fBApKSzfETo5dZPlbHJx69sOvBlRRKicj/nyE96l9QvyNDmDa86hyXhsmSMcx3wHTEmj6sSExMuuJEp6xpPJknR7gMxsM38drol17g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645475; c=relaxed/simple;
	bh=VyvanoG9EB6jT8WPXjcXUuXsCY4dBM2vUzt/++4vy58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WL/JVQE1rTpK3Qd34x5FwnwhPbW+Uv2AIDE62mY0J7NHw914ZkICKJn+8UVcckmfxzxaSyKOTX7DNytuLLMKECK3jARZoEcpK9pndcs3lIjhLreNdzPlUGlcoZ9mPq+7IOLwjygnNiF7AGjbF03Tl2+2UvhkwsEsomUdd+rqYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r0t3kuyf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f31f7731fso306200f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 00:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740645471; x=1741250271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyFKRvTgmesITJ9EZpOfiEseCx+CHEh97TxyzvI4DpQ=;
        b=r0t3kuyfm2LiPNxSrD1NT5unnSvCnwVVy9Iu1B08+67SYYS0p8apCXtxkckylvEaqG
         KeG8vtdSsd5gnUdp6b8xQ8jn2hRiYwqtumT7Xoa6ic4jB+BrdX+xU+GUOoBCxjPpyn/y
         WqwLQcjjqoQTxV7xqCiqv7IW3ycDbJ6uTLgbYIGhEsywBe5BG35bNFAlr17MtKmoEAGT
         cudsqQpPhT9Dnkk58A8FTPWtWCpePxl9I/EpUF8W3yMsWQoZ8JBJmfG0z/JcA7yiW0pZ
         BIdtdTUoS/fJwPiP7rDCpD7sOJ/0JsNY5JfUyHpl0oxiflnggybYpNWTOqHCChwrtoZl
         NleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645471; x=1741250271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyFKRvTgmesITJ9EZpOfiEseCx+CHEh97TxyzvI4DpQ=;
        b=riUBh2VNcuJWpCzdFZEuMycmnOayK90HLiry7WqILzMRS5a4sAKKAxiTmHucxAPs8P
         8SeaclOUmZhtLtHopd/3I0Zuk6DA0N1TTCXpaKZiaE+39zh0xa/+3ODMHfvy2GekZiX0
         BJ3I89KVZC3QJMqkh8OuR0WcbvbxeVge0Q3BJkPCOEkJD+7P1D5TPF7V4F9WmN9plrM8
         T2OqTSBZUqXkcKig+abI6W3uJwoszbwGHL2KFGnEMnL+XFI9dAlsWvTgPLRUfZwwT4z7
         E5W+TBsQeRWmCdOmSRsdaDqID9eXGhKAVkX7Vfh741wsOsIrrsY7BZ0EhmAxlcpz/WC/
         hSeg==
X-Gm-Message-State: AOJu0Yw1t0lDH1hjSonIuQMHc7wHXf42qbl0GMR7jKF7/gaNn93o98FW
	SnTUPKRDDAFPtvJWVVsB+VeYkthnlKTXLyYN+kjla6ARNaMnJJ/qyyXXw+1qNcs=
X-Gm-Gg: ASbGncsqKw8C2n9CwvDWOdUsFF4/kpcVq+QCXEPHaKTxt3eb6YJ6JpuvFs5/vRCEN+y
	u8BDHcicfibSQAf+Fpcr7BFKp9T7y5jTPDeH162v6XIfrbMZFDLxzbtHhsbyt/l5irC/82EhMTY
	gGgT3B1kapjvx3k3HBix0iNzvBVHkF/4Uaqtm7RugODSbmemPJ9KsEk8W/KiypSOPZV3GmyzfCq
	QDbRltx477LykIckCc/WkKAYoIJy4uQL6TWSPmDLI4LlijL4GD9cB1fcIr6EI8gDErl6uCvkj2h
	4BzRVdt7PQwMLAprK7u6fULKBw==
X-Google-Smtp-Source: AGHT+IH2y5MhuV2XTnmtF9QJ4iKL3ex+HsM2rIi/yCxQS4yEoFBd/mjJsgO3qkVz5sd09XoviJATuw==
X-Received: by 2002:a05:6000:1a85:b0:38f:2403:8e98 with SMTP id ffacd0b85a97d-390d4f3c49cmr5302171f8f.20.1740645471647;
        Thu, 27 Feb 2025 00:37:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b50f:c403:bf52:2dbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e479608fsm1313765f8f.14.2025.02.27.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:37:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpiolib: deprecate gpio_chip::set and gpio_chip::set_multiple
Date: Thu, 27 Feb 2025 09:37:47 +0100
Message-ID: <20250227083748.22400-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have setter callbacks that allow us to indicate success or
failure using the integer return value. Deprecate the older callbacks so
that no new code is tempted to use them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a2a1b6434321..783897d94be8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -346,8 +346,8 @@ struct gpio_irq_chip {
  * @get: returns value for signal "offset", 0=low, 1=high, or negative error
  * @get_multiple: reads values for multiple signals defined by "mask" and
  *	stores them in "bits", returns 0 on success or negative error
- * @set: assigns output value for signal "offset"
- * @set_multiple: assigns output values for multiple signals defined by "mask"
+ * @set: **DEPRECATED** - please use set_rv() instead
+ * @set_multiple: **DEPRECATED** - please use set_multiple_rv() instead
  * @set_rv: assigns output value for signal "offset", returns 0 on success or
  *          negative error value
  * @set_multiple_rv: assigns output values for multiple signals defined by
-- 
2.45.2


