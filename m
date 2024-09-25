Return-Path: <linux-gpio+bounces-10444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DC98640E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 17:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60AA1C26447
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 15:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1CD12B8B;
	Wed, 25 Sep 2024 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2ZX4C09"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAB1AAA5
	for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2024 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279231; cv=none; b=eboSJT0jTJsMhdWrv3FdWXTNd1VlRH+/bKr3sgYs4nVUZRi8SiotQcBZSmCLXBvkV9itIKVj1y4/VH2zCvLJZP+arjY9J+OLw4jSw52QsjdHviKeqiXRPeFWsVKF76+/B1aBI2/1GP7fDM75jkq4eypuro8zuqw8Ptyd0EGLlic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279231; c=relaxed/simple;
	bh=xR3Mv8NKmqFL7Fx5StTsNLnH19JCNYwJ1NuKu66nebI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3G1XZJq352uBHl/WWMnmAJHVxxZ8jMye+vby+/Q8uOAnFMj8XJHv0O13X3IUdYjQL5nwCn7FL7Lh8L9G2on+P1BHr4lzFRz/aSwfk25mjx+H99Is1F/pgHQVcjT4u+a/sWPtMRu5/Xjo2dpzyrhif4817iRtvAvacqOyaVOs24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2ZX4C09; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so790811b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Sep 2024 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727279229; x=1727884029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh2qUsq2sr/XIozaed/cryhLnmdubHA3nlm4djUlOpU=;
        b=b2ZX4C093W58oJTMzdS7AeOu3H+ODFnZWmpmExoTZ3GdavnBS6Cd5aBOcKp2gU5ELZ
         NGi4Lhm0Wdns8Iq+XlGpkpqSw6q/ceNpLsPXIRjF6LFv1wXtzqkQeJMBZQqPk6xTwNfl
         lTITbjfwgIrE3h0JxkdWXnzznJZD9TH6fJVEyjvNGRbbfkM6RJVB7iZIPrhK73XNTV4P
         VNnhrxwHe3k39KCKNbr7u4NGg2hkRPfjoXAQ++HctBt0eF9rvMz2mj4Kbsmvs8hmHWVi
         xG60fyYHdzdjKiiXTQBk0VavqAaU6gx1Y0STlC9j6cktOPLJQp1hnCGRPdoIGCWHC6Zp
         87ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279229; x=1727884029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh2qUsq2sr/XIozaed/cryhLnmdubHA3nlm4djUlOpU=;
        b=B82jA9QSnmx+KjoHup/NRRJFklVkZcPaFNoiHPA0/H693jE8tkhYSDwEA1YF3l7UuG
         SKojfjtMsMdUNpXwIANnVd9lOgmD6NbEeavMLlw2YXhU+DsseEylKc0mL5S75VXubKln
         KPtlL3Gn7bYITWYOyoMGfcDvDm4QC8nm8CUPm+4QMEwhXAnMBBQ7Ww0zpeY/Dtu4TiyE
         LVBVD4fqRkXeQM+O61g282yLdjQFs+8Zl+npb/ulPDBCU4FHGrcaCRPDLR1QE9ZhqwEi
         LCCQEvUEIMm6vQtZum6Xo15X3LUHAhVRh1LuCFEdalPDqGAdL/KB4njMZAyIlcPuSJGC
         M99A==
X-Forwarded-Encrypted: i=1; AJvYcCXZOwlX/h2Cp01J5Cn4c4Yrwi47YOoTIoefklFgd4+KCqorNh/KXdba+UPs/4KUbdL3UxAYQXczUU1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh/rR2MEVDs2+A9Ioe/qKj4NRgt9RHFr0eGGLHk0R9D8CTgLhC
	QoUUA6T/pwJIviktJ+xe2gaaoNSo7lvTHQnsAeEcLWRsYiJKdpsg
X-Google-Smtp-Source: AGHT+IFukVBZS2WHNxTGO5NAiw5ONdyx8xpyocyCkHx1Q2MlwfotRHI63yuYNzBdfZZ5l/H/gp+zVA==
X-Received: by 2002:a05:6a21:33a6:b0:1cf:3f39:c469 with SMTP id adf61e73a8af0-1d4ebe2733bmr118900637.2.1727279229205;
        Wed, 25 Sep 2024 08:47:09 -0700 (PDT)
Received: from Kuchus.. ([27.7.2.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c7b23dsm2891249a12.76.2024.09.25.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:47:08 -0700 (PDT)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: linus.walleij@linaro.org
Cc: brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Subject: [PATCH] Fix typos in GPIO TODO document
Date: Wed, 25 Sep 2024 21:16:57 +0530
Message-Id: <20240925154657.38704-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected minor typos in the GPIO TODO document:
- Fixed "ivolves" to "involves"
- Corrected "boardfiles" to "board files"

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---
 drivers/gpio/TODO | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 189c3abe7e79..942d1cd2bd3c 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -61,8 +61,8 @@ Work items:
 
 - Change all consumer drivers that #include <linux/of_gpio.h> to
   #include <linux/gpio/consumer.h> and stop doing custom parsing of the
-  GPIO lines from the device tree. This can be tricky and often ivolves
-  changing boardfiles, etc.
+  GPIO lines from the device tree. This can be tricky and often involves
+  changing board files, etc.
 
 - Pull semantics for legacy device tree (OF) GPIO lookups into
   gpiolib-of.c: in some cases subsystems are doing custom flags and
-- 
2.34.1


