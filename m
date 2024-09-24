Return-Path: <linux-gpio+bounces-10404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C69848E7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 17:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E731F23B18
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935441AB513;
	Tue, 24 Sep 2024 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byCAmQTd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B311B85D5;
	Tue, 24 Sep 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727193410; cv=none; b=WkbpH5v4OC280hcFYSeSZQeUF+rBC8li0/5UGwHO16STB9lOu9OMvjcOAfzoDPKtOgOfrJh6sYLX7r9o5VE/o32YPqrRn39JY1hli2lIW0ibB9upZc96jcA48ZCyQ9MPy8Nqeq2qeSe1QT1uyJ/qU8jD59c5/Vbhl4Ki3+/Q7gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727193410; c=relaxed/simple;
	bh=KYqzbrWNHwBSLs5MhGf6ardXq0bF3PUs+mentcC2f2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J4y6+zI6Bbo+wzRtFsqhNMHkuDJEXVvYI3WVKWM4f82biYqo1UaIb/uVJq0a1BPCA1DpEJnf49+9zDmRKOd+wnSk/PQmf2j15GNhX87nrG4D3ujxwCvBKFfrqSJgg8SXVRFU3oZfbHDXuc6utHzFG3s77YOivkqhglhK6mVYMCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byCAmQTd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2055136b612so69123575ad.0;
        Tue, 24 Sep 2024 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727193408; x=1727798208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2+i3EAm7MnJBVbC6zFovlymq9xkslWJme6r8uRwJY0=;
        b=byCAmQTdVesC5szzjJVVNnxaNWGqzNpzIlBqOWXtq/zmjQWoFboXruP2/unIbf7ZXS
         OFc05ZOaLxd336CNRaPwubCD9jYo7pQD/7O/UI+QvsY64dy3wGh0jEo7fjcoIpwMPT3D
         sIKgDORj5h1VaWw/CkrrYRolsFaATACoSVut15BiCU2wGjC6YALwoaAUTA5tttUvHWlh
         4r+SgoY7TkKXTwfsxHlL9WAQ4DMBHb+rnW8tPomh5oZftsfVr2z/JrQflXGeOY0/RP0r
         UOziye5IOtiUCOXaeMndWTceZqjuaVFY03G00s8odpjKNkEfQprR2cFierKsl0/2iW7W
         t+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727193408; x=1727798208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2+i3EAm7MnJBVbC6zFovlymq9xkslWJme6r8uRwJY0=;
        b=xS1+wJeiGtFNgKYQSNf5ZhmoHSOn2DDnWZxrEEfYGIV25hEn+VUMR2S7SLOrm68V7h
         9clN3ZdKnSLAxRZSCr6+6UzrxzZGZ+7kvCfY18X+GmdAlx4lDTLhZeMDQIg12qkyT7FO
         hjmyey4i0RoUKT6gRjJ74J3X6AEYW5pdm4dlbEuDr6RUc5CjK6NVE0liY/kT5wMifsJ0
         qzyzilUbWRodGV+NfcxzTKW/TgWeSXHv06MbuahWPiXnP1cqxoHBFjNFSSQZtMBHVXag
         P6Oz1xJxS7FGEN+KL3TeialMcZmGwgHEKg3TGvOWhF3wdgjpGpfm4WN/24RRRYVweFBW
         WOeg==
X-Forwarded-Encrypted: i=1; AJvYcCXv+fCqBTFGp9tSd4YxwsXjQRSrxxf68yuE30BnQ6u6qt9HgQfa9rVsYZN5P6g+PcvLEc9tGYVdL8a9@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcsorI7BXgY3FeVvXL4jeUJilGYSl1saSrIjQlh+LUGUsVwmD
	+Dz0kv1lQMEU42kZmoSXHJIIYl4hH4e3EImLrlAl+zxaoItJRR7oGjypyrTk
X-Google-Smtp-Source: AGHT+IGPTW108ZUC2Attto/ASYesd/TLsOC2Q3UAB92D+DipXuow8ZVs0qxwjF6zvMIYMEXaLD2ctg==
X-Received: by 2002:a17:902:ea12:b0:206:b618:1da8 with SMTP id d9443c01a7336-208d97f0cb5mr235710545ad.17.1727193408157;
        Tue, 24 Sep 2024 08:56:48 -0700 (PDT)
Received: from rigel.home.arpa (194-223-190-55.tpgi.com.au. [194.223.190.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af16df843sm11919375ad.14.2024.09.24.08.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:56:47 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpiolib: cdev: Fix reference to linereq_set_config_unlocked()
Date: Tue, 24 Sep 2024 23:56:24 +0800
Message-Id: <20240924155624.230130-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the change to cleanup.h guards, linereq_set_config_unlocked() was
collapsed into linereq_set_config(), but documentation referencing it
was not updated to reflect that change.

Update the reference to linereq_set_config().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5aac59de0d76..366c8c5a2e62 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -450,7 +450,7 @@ struct line {
 	 * The flags for the active edge detector configuration.
 	 *
 	 * edflags is set by linereq_create(), linereq_free(), and
-	 * linereq_set_config_unlocked(), which are themselves mutually
+	 * linereq_set_config(), which are themselves mutually
 	 * exclusive, and is accessed by edge_irq_thread(),
 	 * process_hw_ts_thread() and debounce_work_func(),
 	 * which can all live with a slightly stale value.
-- 
2.39.5


