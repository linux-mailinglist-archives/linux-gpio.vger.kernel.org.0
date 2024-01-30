Return-Path: <linux-gpio+bounces-2753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B26B842566
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 13:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BDF282C10
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jan 2024 12:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F05786132;
	Tue, 30 Jan 2024 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wgFSpbwk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CEC7E573
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618936; cv=none; b=K9pm4TuAAAQbO6DOAIUXwktRrfaW1E9vEHEbB+KnFFSbQRif1ehq9aroGHYBc4sguw4CBj+E+7cxZIQpnE4Wt61a6FoQP0vlVVligEMb52qe3Ug6zzSTW3XsdDwr+aOaehetCcUMuBlL8zrFY9JjUopUgmRbUpg11Z3/pkYYg3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618936; c=relaxed/simple;
	bh=S/S9UlkjefltQgrEp3M5f/11AKo1XM9FdDOMZKtbq60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fSiq7QWilOByBBAH02cHmm1Kr95s/MKMbo/ylHJCbsiRpkh8h+jDJOe01WOmuL464pwLvklAJcOQXysZW+mogKMe2czRcLsHRzBou+0PQC34njyxE0ReWylmpmFXbz/U4jBGbeB7vT34SXKzub+HVcFh9BpspjAhhoYd1WzOFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wgFSpbwk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ae53eb5a8so1749827f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jan 2024 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706618933; x=1707223733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9yRKACq6Zf8ZvW2ea3mANAIDDLr8fldFns82V5nX1A=;
        b=wgFSpbwkSHnA8mqaaHJ7AHRJ05bw78v4GKWvArV0SlWAdAruKZfBQCyrQ+8+6VMJJu
         n2Aw4rpmwIwoMJoNq0ymAbmTZRAQoOpqWWm1OrOGpPpdI5Fa0G847U9LWSIRXnVijzKk
         bNaSU9VVQnsEtG+LIoCx18/e55U4lL7qutIlqohlUd5jUSYkr2segJR3vfsfH6rRjdnw
         RE9T23fvfexywTZ7ln+kzaKnoqd3G7sRFmcnzj3NXVtKY77cyGsd8jPuJLHH1t+GQLG/
         Nj3tSePOeLQVrfu1kDKdiuOyrBF1CARsw4FouFRiGM6FOV1pJzB6tz6B3tu8wkOhpWum
         OKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618933; x=1707223733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9yRKACq6Zf8ZvW2ea3mANAIDDLr8fldFns82V5nX1A=;
        b=vyWCOetEabKCGd+mNw6mQoLYckw+xPD0oRimgglEM1rwfTvOh+XEG4a8fZYgVbJb/D
         qUy1ORYvGcQGR//JB0TVUSjpjpKCeEiHC5F5xfxo/ltRerYRXH7p3gs2dXPZ29gCLCrR
         yd+kWIRPqUyPSat96O8eghdv+E+6hYZO4jEiAMrStlQS518UupdQKhoC7atzJJh8SC9O
         AwevArTH0t7DHcX4fc5EhQMNi7LBqcavEu//DoZjo4HmxIK7HKXFStbhrCy6JeRRjFwW
         /pU8wJrDEEPypRJkmQxSubxr25U68xH/RxM0Igj+Dqfkfzm1+I0zJRe1WcthbaUh4EV4
         zXuQ==
X-Gm-Message-State: AOJu0YzLsryAQ5jF009QsxoXabKnZHjrLPXI1b1HlJj4qIkRAs3GtrSK
	3BeVO8bUStcA4N3FFJRudGtQvz/45o6wZV6todjmSYr4VXcqyH8YpCQqiMIhiMo=
X-Google-Smtp-Source: AGHT+IFq2Sj2t60XDvla1vwwvYgm5Q6Ksyx2vxV8ANhxHcJ+3TUQ3o6Zn45a6XSfyiUWV3Pn2rO8gg==
X-Received: by 2002:a5d:4a05:0:b0:33a:e9d5:3fe4 with SMTP id m5-20020a5d4a05000000b0033ae9d53fe4mr4947789wrq.27.1706618933272;
        Tue, 30 Jan 2024 04:48:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:abc8:f77e:abeb:129c])
        by smtp.gmail.com with ESMTPSA id en8-20020a056000420800b0033940016d6esm6625337wrb.93.2024.01.30.04.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:48:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 15/22] gpio: cdev: don't access gdev->chip if it's not needed
Date: Tue, 30 Jan 2024 13:48:21 +0100
Message-Id: <20240130124828.14678-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130124828.14678-1-brgl@bgdev.pl>
References: <20240130124828.14678-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The variable holding the number of GPIO lines is duplicated in GPIO
device so read it instead of unnecessarily dereferencing the chip
pointer.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 8e37e3befa08..e993c6a7215a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2701,7 +2701,7 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	if (!cdev)
 		return -ENODEV;
 
-	cdev->watched_lines = bitmap_zalloc(gdev->chip->ngpio, GFP_KERNEL);
+	cdev->watched_lines = bitmap_zalloc(gdev->ngpio, GFP_KERNEL);
 	if (!cdev->watched_lines)
 		goto out_free_cdev;
 
-- 
2.40.1


