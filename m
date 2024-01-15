Return-Path: <linux-gpio+bounces-2224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560E82D83B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 12:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5DE9B2140D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030702BD00;
	Mon, 15 Jan 2024 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fs7qFyAc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908B219E1
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so3586115e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 03:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705317572; x=1705922372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx76/jbaxWjm0w8qVchMuNcfLc95YT5tigHwZtYMztc=;
        b=fs7qFyAcs2UW8xLHyCpVgFQFd3uTxpYAEZs6k5ni2/5gT5ATvwI/KGFg04yo32YVEo
         2Ou3OsPD1xNuowZNXFa5sLqzh6FsHX6d1HlFBWF7tgvoIhKVQawMXigZI9/OkWImIgX4
         WWnQRPvx/QCl4KUptCDTH7RvHW4aIG5+YmtnO3Xbgt/NHRP9BNryVnS9JbHsF+Gtoi9r
         fcv7bDFgNcaqEPryKCzIfqFmlhHnM8ddUMOg+BhDWenDZqYeb0KV+dyUinnoZ+wLhKrA
         1TmitWakoUTcDWDDpL/mNPX1+PT2f5REVgkDxGjWoj4wWzgqYk/qJZu/eqsj95fM50bp
         CtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705317572; x=1705922372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx76/jbaxWjm0w8qVchMuNcfLc95YT5tigHwZtYMztc=;
        b=eYkW6As7imr50Kw0WwmEFLFt6xxuwDPyct+f8jvHpXesJQJopdNdb1KyhwRf+af3x8
         hk8aYfpTliZipNffFFGIPrHlAdmUqxG7PcMgo5vcHq+zP5pFWQNI/Un2lhBpFAcvTiDy
         7l8X5GaOyG9GyfXG/PT9joYIt0ryZD5lgVlkxDncr0g/mV2xo6NPlKgJ4hGrHnV/OC0r
         UWcuG2E6Ah6DkobBbDhJTG60oJILJMJHvWj8QCF0IY1d2GbezLWsmddyf/AZ9P8N1AEY
         DoJ9ni3NevWtTRv1QQqxjCrCGIwgD7ee8+S8QleAx8ggne1HVt+T58Jugi1pU8hcTnWi
         cL1g==
X-Gm-Message-State: AOJu0YwzBV3555VnJQZ70IDuO8+Eexjlu9YZayGjD8mZSxYQquyYJ8AV
	MKbH5xE6pHD53gCXlLYaqjZNLrTHYBVS6A==
X-Google-Smtp-Source: AGHT+IG9BllDNvt7XNrskqaMVrP1n3AqSwkVUtTlOd9K5IY13GE3ZCIgT8Ux2RIjqbXUQF2fLcJ9OQ==
X-Received: by 2002:a05:600c:4ed0:b0:40e:4bef:e9f2 with SMTP id g16-20020a05600c4ed000b0040e4befe9f2mr2763466wmq.4.1705317572611;
        Mon, 15 Jan 2024 03:19:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b244:1a90:13e7:9f6f])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b0040e4733aecbsm15541146wmq.15.2024.01.15.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:19:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] README: mention the linux v5.10 requirement for libgpiod v2
Date: Mon, 15 Jan 2024 12:19:29 +0100
Message-Id: <20240115111929.28628-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240115111929.28628-1-brgl@bgdev.pl>
References: <20240115111929.28628-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Major version 2 of libgpiod requires linux kernel uAPI v2 to be available.
This was released in linux v5.10 so mention it in the README.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 632aab3..7680915 100644
--- a/README
+++ b/README
@@ -8,8 +8,10 @@ libgpiod
              character device (gpiod stands for GPIO device)
 
 Since linux 4.8 the GPIO sysfs interface is deprecated. User space should use
-the character device instead. This library encapsulates the ioctl calls and
-data structures behind a straightforward API.
+the character device instead. Version 2 of libgpiod requires the new GPIO
+character device uAPI to be available which was first released in linux v5.10.
+This library encapsulates the ioctl calls and data structures behind a
+straightforward API.
 
 RATIONALE
 ---------
-- 
2.40.1


