Return-Path: <linux-gpio+bounces-8058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C09282BF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07361C242A0
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEED132111;
	Fri,  5 Jul 2024 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HwJxUzx/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B80171BB
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720164801; cv=none; b=iev8VdGdauSipTzNGtrOhYOvXPb1wyJSrWUJAvEI76wmllWRSQDrm+NzjJ+Wp9Pt5ZgLC9Ugj2CbF718Bcn+7wdpCy6AHBPzkkKncAQV+nGgZUhxqmUUT69esBCQaBtk8eh+y6qqa+WkbQunL7H/ll/tHbBVkOZjNM4zfxMyTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720164801; c=relaxed/simple;
	bh=GdvMZuqvRdPtXPlnG6FP7GjWtS08m6a4ZRDCJQkhWuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orJA0IBI6WeghOh3ulNd3bcnbGIsCAwNRNnH3lm9fsuCL+Md/ZICxqz+YBL3W4/XsLZz1qmdRGPuIUvGGaCrcnFzZeHZBHNBAqbLvd4ica6wwGQ7Z+F6uQ9CU/r8uViPmS6x5MiKodV+SYt+Eq+I5EvITRG0Scdpe3tLju+rrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HwJxUzx/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea5765e75so530245e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720164797; x=1720769597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P629QoL6JEw5qhCtFXsHMJmOGKETN9og1NcpIJQBV0c=;
        b=HwJxUzx/OLOt3iicZMR59qrDKQ3tW4UYARUc3wG18XtAXjvDRjj0RJ9hD+BuVv9y7a
         TBq9cKpPe5pm+I7euSFEom2bq+bSuDV/TJRu9D5sqh/oPkaM+Hq7F8wvNIIt7BGDuRzl
         9Bjt2QFrM854eok2IDNBLB1sTQwLJxOtPYARHNTRS7LXGL8SZ9BO4aTN8wcOjBlVdUDa
         dLTgVmuFpriaU02DB8EGxwbAjHrleUdEshTP8XsaP6vWiy1l2AuTFi9xmJQd7nmSUGtB
         tWyJE0N8FQ6iYdt9r/fjlT+AylreEvsX/mUue7iy/vEYtGzud161dOkHTNM9iYutqtP2
         m1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720164797; x=1720769597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P629QoL6JEw5qhCtFXsHMJmOGKETN9og1NcpIJQBV0c=;
        b=D0Cc1aou/s66epS9W2CDmIZDaZD6gZcLFYUK0d6HarI5Yc3zQGAWM0GliTQd5BwZUC
         PKXtt0EpslYhLuxS3a6ISrlXpqAHKHTfzFz9RVWySLK3aL7kkH3Outjtg+QH2JvJf4TK
         3Z5It5HFxacfNTxhLJINkQLh35hbRAMQGmptNMkWbgEvo2ZzMiQs6i3hvdhn8rs4YTPg
         z516vhZOIw9gAzwUOMfmsqSiv/m8SM6B2sB2usxqEH2FgeIvhw3OAsj/6kC9JAzGbRuz
         PIbaI6Un0O09rDJ3JLhCNrNjqTp5iYNgxHEeNJ67cECYPcV8Kqh9yr2XBLYUEheKMrOq
         sioQ==
X-Gm-Message-State: AOJu0YzMiE1LeeBq9aDdYngLrxkVgy2gFYjP0lIimfklesm6DxaaI4CA
	D9p51l1ka29vc2d8XKfd6H2ODf0U1xN5do4MeZusW/wr9eh7098t8mtzBmOrNSQ=
X-Google-Smtp-Source: AGHT+IHcbK5bBHKN2myBg9RH1GwH5hUNF6u5lZL1SVzv12Vk4ZPm4+8j0w/QrZjSHwA1AvzwHipJhQ==
X-Received: by 2002:a19:ae12:0:b0:52e:93da:f921 with SMTP id 2adb3069b0e04-52ea062d7a8mr2447613e87.19.1720164797373;
        Fri, 05 Jul 2024 00:33:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426487c1c66sm22588075e9.0.2024.07.05.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:33:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2] README: list the development packages required to build the library
Date: Fri,  5 Jul 2024 09:33:14 +0200
Message-ID: <20240705073314.5728-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The error messages emitted by configure when either libtool, pkg-config
or autoconf-archive packages are missing on the host are not very clear
and seem to cause confusion among users building the project from
sources. List the required packages in the README.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes since v1:
- reword the part about missing libraries

 README | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/README b/README
index a6f24d1..a01cfc5 100644
--- a/README
+++ b/README
@@ -34,6 +34,11 @@ BUILDING
 This is a pretty standard autotools project. The core C library does not have
 any external dependencies other than the standard C library with GNU extensions.
 
+The build system requires autotools, autoconf-archive, libtool and pkg-config
+to be installed on the host system for the basic build. Development files for
+additional libraries may be required depending on selected options. The
+configure script will report any missing additional required dependencies.
+
 The command-line tools optionally depend on libedit for the interactive feature.
 
 To build the project (including command-line utilities) run:
-- 
2.43.0


