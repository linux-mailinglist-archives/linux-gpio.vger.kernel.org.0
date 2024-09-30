Return-Path: <linux-gpio+bounces-10558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE4989F6E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 12:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CE71F233E7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A00018CC0D;
	Mon, 30 Sep 2024 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bbEc9eV/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0218C35F
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727692331; cv=none; b=fn/XtQvWc7VEthPx2VPSk+ykoMyZlU5sl5WGFfJbL7Prv7RY4CX5HoUC/tLGOmrwMNRNvylepxgj9cnac0T5DbcTpUB+do5EymlIpEjbg8vcVIFN/LEQJKVDnrLpXQjDupZwFH90IJKu6CgRz5Yebfoau/exuZmisiXobef8yCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727692331; c=relaxed/simple;
	bh=5E6KTTiaOKc/2wVB8+QH9mI5osox+uyEdBEePOu4R7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYziUpeiQZFOG6TojfRuCp39/Aqg9FMl7SIEejom44H6QmIFVfe4rIYp12E7mKM3/1EV12r+bR0C31rEH33PFoVooQt0ifWZe/tch+KcnjryzIY++X4vHcyIJkhhxLaAEihoSRQQ+A6bOCgbMlR5budm1oaruucyOPL+TlEjE+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bbEc9eV/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so40213525e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727692328; x=1728297128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laT5Lrp2VC3fnoAmsJC3kBCiqkiMwP636Ixvur8jZe8=;
        b=bbEc9eV/7U1Px0+TV7uzYjRuxhjG61QeC2WCsHR2wKm9ZPrdWTxLC9w/j0qhBNv2c+
         OPqi+b0J2/oGUrFETtV/oKk+61E+kzIDKXhHn5CkNZh9ZGHZSTi0+7woxVw9wD3nLkeA
         obkpq8xQssQJeDuPbVsXVZSnkzTTA5+DPCIG624pw3UFxR6mylUJ3AQo7wkmv8lAF4Y7
         uHRIYf69FXGNsFjDSsqjWRylmK2wLVlMEAuAEbrQBypNqsDD6iSQnmlaMyM+C1mvCo57
         7Dezp4WgUWSwhbRVi1LGERjESXkGTbLm3oLP2Gh6HWXZCqr0aSK7kPUGVdRYpbrYKMMg
         gTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692328; x=1728297128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laT5Lrp2VC3fnoAmsJC3kBCiqkiMwP636Ixvur8jZe8=;
        b=jy8qs+dkD9Ww0lqVuAXShirjmkXtXdQPRE7jJmROVZu7pGA2kmxqSxjKIGPFOTFXhn
         tmB2ITsi3TVDxI0bZnAJOpY7015OBa2sLQEOWTmK2KiW4l+WjAQDq3noaIJs618WwqgO
         Qvdnu47p3TidX/8lc+IsPELAlGdK+7tgKf0V6dfAQmSr6sIF8/xOWtHyA90XbLp6+E46
         fMBuEFltYkqRicwkPqBDhmEt2vX1lOMI/AfX+NUSfQIDEwmXXxmfAFyCYqDIYyVFZnRB
         G1Ibr8MXFGIYTGRQhB/EcS7DTcSy/J2WPo6MqVUT0nmcobpSTNgc3+U0JAqB01Biza2n
         X/0w==
X-Gm-Message-State: AOJu0YyeDj7nEOdbfX1J5cKVnnQovUiyuDfNBxT4KRG8gcS2bWk0TXOs
	XcpqKNmhowGCVJdwrA1HlgonYM87qVeTHmTqeRfxRtE4J8zcEdhAYexdo43a2NAWIk64YxI/Bl9
	9
X-Google-Smtp-Source: AGHT+IHXW8upZaxGdmS5j+5vFJ2MR5/aTCr9eVUSyE0063qQAsrBbXctV5+mv/YiqGlFZoN4sus5IQ==
X-Received: by 2002:a05:600c:3541:b0:42c:c080:7954 with SMTP id 5b1f17b1804b1-42f5849fb09mr88579745e9.30.1727692327877;
        Mon, 30 Sep 2024 03:32:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5745696sm8633491f8f.106.2024.09.30.03.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:32:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] gpio: syscon: drop dependency on CONFIG_OF
Date: Mon, 30 Sep 2024 12:31:57 +0200
Message-ID: <20240930103157.49259-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930103157.49259-1-brgl@bgdev.pl>
References: <20240930103157.49259-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

MFD_SYSCON does not depend on OF and we now removed OF symbols from
gpio-syscon. Drop the Kconfig dependency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98722e814e81..643747da4475 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -681,7 +681,7 @@ config GPIO_STP_XWAY
 
 config GPIO_SYSCON
 	tristate "GPIO based on SYSCON"
-	depends on MFD_SYSCON && OF
+	depends on MFD_SYSCON
 	help
 	  Say yes here to support GPIO functionality though SYSCON driver.
 
-- 
2.43.0


