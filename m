Return-Path: <linux-gpio+bounces-2216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D846982D62C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7509F1F21AE3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 09:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF32AD308;
	Mon, 15 Jan 2024 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HxWYI/iD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13070F4E4
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3373bc6d625so7258175f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 01:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705311549; x=1705916349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx76/jbaxWjm0w8qVchMuNcfLc95YT5tigHwZtYMztc=;
        b=HxWYI/iDz43k//KgSBpNBH0g6wQPHGNeV0CZY9NIGKYqu9A4EDPe6fl+qbslISkd2y
         f1k1el8wdiIi8TsOtQTYuJiP3xWAnz5IXVC2Uuh2t11yUARbg6NO2rFSuLl6pnATvHLk
         JdE9iGmLYdESvUCeSAYo7Rb120Z+HN3y1Oo1TU1Vkb7qHeX1sTuNJrtLjwhzuqMWgHl4
         Wui+J6i48eHR8mLvPYsRgwtlnTRgZ3jIjrZu7Ur9uEYyVhzw8P87SqGHwMu+0Nmd4yQP
         c6sdNse4Lek7/yCLYIy8Pq9l/tkT8vcs2tvXKAV+L7EZEH+8q4spGlFL5o2y6dJ/EzRH
         Lvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311549; x=1705916349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx76/jbaxWjm0w8qVchMuNcfLc95YT5tigHwZtYMztc=;
        b=eBq9uIg7jTGo088FTLUW895F2X6POb/x+CrDaqYHl1TAbRv5OYEAtXuRCSo2Pblwtm
         dNGfDQhzu3TRN1aO5rJo8L9fcIGOnY//QeGcYPU/dXynSCbQNOYz3Fl7EeBNk26irGTH
         ImPu9GCnP4dyW1pKjnVLMZpM+MIT5aVnx1W/HPFXTt/W4SY/Yca+CEOkLG2YKwUYv8Uz
         hmZvSQame5nIoQ/fguCt2JLuYtOxZUXgsWIvi0Gn3gTpUm80VQ6zJjzEMebCq2MnicdY
         NnI1YGbdkPOCEpCHW/EVHNWTyg+9rcS0NrNULF7ENvSm4mTsTrvIvrM4r/roU+cksdyn
         GDTQ==
X-Gm-Message-State: AOJu0YwCLuM+Ezt/IPTnrqGaOJpEYnqrq9E3GCEq0k+/IwAPaEBoYSCV
	l7Kil4k+K1YSkf7jx3NX8G7qVfmpB3xUUg==
X-Google-Smtp-Source: AGHT+IHJImItcgBNf3i8IqqG4KzTehPsKZsy9J+DDkqlrUfeiwoql8UaUOInUjeDMVlAKZ7JpvZ3xg==
X-Received: by 2002:adf:f04c:0:b0:336:c010:bff4 with SMTP id t12-20020adff04c000000b00336c010bff4mr2580402wro.11.1705311549079;
        Mon, 15 Jan 2024 01:39:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b244:1a90:13e7:9f6f])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4cd2000000b0033740e109adsm11361087wrt.75.2024.01.15.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 01:39:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] README: mention the linux v5.10 requirement for libgpiod v2
Date: Mon, 15 Jan 2024 10:39:04 +0100
Message-Id: <20240115093904.9606-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240115093904.9606-1-brgl@bgdev.pl>
References: <20240115093904.9606-1-brgl@bgdev.pl>
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


