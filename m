Return-Path: <linux-gpio+bounces-12093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F20A39B0208
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 709621F22BAD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2522038D1;
	Fri, 25 Oct 2024 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fIpZ17Db"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A3201026
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858756; cv=none; b=nlKkYAdNHubfxGRPoINf1hrd6gYtuhNcRKqk00kkRbshC0bO70D9LQwlJH4EjmPUrq+R1p5f3VAJcKiyuoqTVQGEaZenPQYnWp+hk/IB/7V6yNdvBI/PUGJmx5pntMJEMMUTg8bWoCsgdY6qh5mHlHuC4/gfgxf028YD43uLZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858756; c=relaxed/simple;
	bh=ucXTcWv3SDdUKBqteO9n5MiCHQdfV5w44hqJ3hUrcPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDUz4PdEw6urvr1cOoF9tw5XqYRCPV3+MLyBkn+U9xatB2ZFYBHWdMF9pEuxUnndnhPqvJbnn2YvNWxf2frqyEHHyAaVuVtqE8TgdKktCm3Oj3Ih0x05vay7txPsaDsDp7zMn7yYFJb3Bl+G0MMpfqzLbJ2exm2Yk9csvCI9WRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fIpZ17Db; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d518f9abcso1441997f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729858753; x=1730463553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9z8ObF8lj4HxEfABv+8v8eHlun6BED31VoMO6tTrEo0=;
        b=fIpZ17DbTFEQG7AAlf6WY0ZSYP9GqypNYcDuwxfXL8ber7O59dCkevXRhT97Jg7DnG
         fs1EGw7HBO/VOyaDjI5bp/sI8p+S4mCeVwRBd3p8I/xx8+JCAafr7/k/cHPiyW6X2mHq
         EhenJidliST8S1EyMveZKxj8g6hARvgRRbKtLJhZjNJ5L/t59uhtf2rCte+8p1AMyDYe
         zaXZqajPjFjh/DJK+tzVm5hfkGE99yoSiZ/AHrIXIXn/3yfDcvtCnlCG5Ev3D0UT0dfW
         hBhrH75+wHYFJNQkfVYipqNYiJsXQRnz7wzcn6bj2rIb2WmkO6J8EdRIYHw6LI4WQwNV
         0ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858753; x=1730463553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z8ObF8lj4HxEfABv+8v8eHlun6BED31VoMO6tTrEo0=;
        b=R6abq9mvENtXn3j26lERTuKr1z8kZsJA7tBGf0KzBSqRobYQc9MdmWrFfxOek8xvP0
         EM1CQ/3vzjrk4s1mvVWU8CTEVQxNsBbazPQkw3q9zY7o8E8aHe0q4C60J6pHsuTjf8HV
         yVXvUSBv1/wjEzqVUCHTzcWFO4S2CsDQDnirjcQRXeBMGDe+EsiKkRSUK2Sh1RgtCr8E
         3uFO3K718vFXeFi24iwvJ6aM99oIilGVNw0IgTvBhLEvh/WCSPErhkTp6l1X07fCOIVh
         vueU8LVTv2roBtUOBrDmKGwCWX//rkdYwKXcnTEH9YwQ098SNY/ACyPza2eVf+WMRcPe
         bN0w==
X-Gm-Message-State: AOJu0YxpHxZPTi5b9jp5DviOayxFWcp6cE+QSrTGv1DuO5zKYJgFNqtL
	Xgc++hwV1HgjokxFr226eQkKZ/R6RN93VuW1v4o/ac4ya9LbJOOD6SDp3NizaDM=
X-Google-Smtp-Source: AGHT+IFOlW1oseOey6MHCudKNj0cNLCjElZkafLvEvxvZHMGuGIjdc6ns3IEKegvlh/4OjaNMQ9gPQ==
X-Received: by 2002:adf:b197:0:b0:37d:808c:afe7 with SMTP id ffacd0b85a97d-3803ac96dc0mr3651472f8f.21.1729858753078;
        Fri, 25 Oct 2024 05:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm1388966f8f.5.2024.10.25.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Oct 2024 14:18:54 +0200
Subject: [PATCH v2 4/5] gpio: sysfs: emit chardev line-state events on
 active-low changes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-gpio-notify-sysfs-v2-4-5bd1b1b0b3e6@linaro.org>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
In-Reply-To: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ljWZ3loS3czmAqluVtTLT5KchD/gdIkhFYlUHezArh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnG4y8+1rcZHwMmA93rD3cL9ExCW+W5LxpxwUtr
 zPvSEcRC/qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxuMvAAKCRARpy6gFHHX
 cj/9EADUC/6urE8ZlLzxj7+vG2z6DSOM7KvkCmv3QFPPF+MJUUx5UOeT9vS+/od4u9nZ7tlrlGc
 tcEuQySSshmJynMTrpUerU5mGxO7vMvlkUunI/2pLuaNBNNfvRkmogyqMHYADUxGHFm7LqdPd1o
 e7eAYll3U8kQn8t/caw7e3V5oGpCOWd/tEOfHL4NX4vRzG6uSgYYyOCIe+GrItfwsSIjgWCmZJy
 z7PpXAgdPkNj38odn94iv/1jSZUQIC3/7ZFxIguBChMip092EuWG4jZr1paSYEYfxo+E3a0f4YB
 h4jptlb/Ubr8bupvQr/hN+t4S96ObAJDcmjvEu/cfS1qIRbtDe1upKlftzzg/mOFhWlcXT5OQnX
 G0qqT2q3QxNpEyRYARTI4/QcM4StSrzdTgV3EQf5Zd0C2HhmOLqCg68cnqKiX/Nds3ih7krDS9r
 Em3GGFVmZeW4Q5OdfnwxvPPboGtdjkRYk8GMGLCf532HFLE6CjTtkWluoXz98uwjXZqUgn79/PQ
 iBQPYWFCtoUuWUPl78+ElLhDYv4yR3Q5Wb/G4s3O5bDhd6V8gH1kYRQeN/5u/T9GwmOfOVJQCa1
 CFX3sK6S7RvyLVwnP/Iv7p44TNcfwK58yAh3Vmy/MPldmsPBJto6XhLL3nwYZP0FbPP5z4lUrod
 eaC6qF93XSApnhQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The sysfs active_low attribute doesn't go through the usual paths so it
doesn't emit the line-state event. Add the missing call to
gpiod_line_state_notify() to gpio_sysfs_set_active_low().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index de3ed75b097e..cc5c51ca9478 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -306,6 +306,8 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
 		status = gpio_sysfs_request_irq(dev, flags);
 	}
 
+	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
+
 	return status;
 }
 

-- 
2.45.2


