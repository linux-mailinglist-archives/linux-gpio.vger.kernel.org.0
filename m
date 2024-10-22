Return-Path: <linux-gpio+bounces-11777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CC9AB723
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 21:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C88B1C23510
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 19:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226091C242D;
	Tue, 22 Oct 2024 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eheElm0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280A81AB6;
	Tue, 22 Oct 2024 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626407; cv=none; b=Tq8BMifd8P6WWBj6txSI3G7tFcTnJl1ALU5URpzcPxJ5fOMvPezFJa2MUbw3ETk6yhhKSQks6xxZTDxAZhZ1w0hA7BHIvr2gQYodECaB8uN9qsVq/Su/1fEVEUPmt0YA1N4g6KJOJ6iuC77EmYoOBI7o+4OQ/3o1lTtsIAcIhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626407; c=relaxed/simple;
	bh=xgCAkp2cXlJrXVJuQaJcljC1h3oUwo3HLyJtG3Wc9fU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=di5/efBj8C7Piwg8opC/7pQ5xGMD+UzoefqPjN7ZSgTcmbJgm1Rf7U/WCqoCjOPPEvC8GRLpPa0NUQDq7/cSF9zjJbQnL/3KCozjpkOLLi4YMbdDcsQJPRFT2EeTF9SAZeCY8XzXAE8V0nZqrPbQM2GiQtYzoisEZ+AIDQqAvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eheElm0P; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso559716a12.3;
        Tue, 22 Oct 2024 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729626406; x=1730231206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNMKPRLTZSqktMFCDKnHLu4HsLUfGwfmdd2zIKbXRBM=;
        b=eheElm0POcVucv9XGBEOpQNO8E1xjBQCrl+nW7P/8yEgQSr8Nfj3psiwizztypUAoG
         74ewWTymtJHEPghJ/jyMASJiZih/oJsm0475Bx1biZsA7jLaYGB8IiQRlH4mTKnPv9Vs
         gqrlX2Yym4XITgBVKLc3DHb71/MFIl0b8kqBz030NFashXnjKlIFgAdPbyxvmHV+SbLc
         EZx6q7oMvv3q/443rSxTm/wXgT2fOl0jLakljrcO/FqrYgZiw2ctP/vtVDZs2VJCR8sB
         9I2Lcwh747hIwYFOGqqUmmYDCmHvSa0dOxxrVVr4PCRvb8pdCPShN0yqu6tSWnYm+JwB
         J6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626406; x=1730231206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNMKPRLTZSqktMFCDKnHLu4HsLUfGwfmdd2zIKbXRBM=;
        b=as07w0R6v+3pMDbzJzwbDpxszY/B7jUMeNBcHB0W9/rVUvB34pdBeYTPybEQjTWr+E
         2hBhp9QgYJhb7uK7BgxFXlMXpXeU/ALWqcWkIqcNA9MjFUAbhbjLACFJCRROZHObM7FG
         dT6GN8VePpMhgQck0FHwoWR8iUm0ErzbLVg7Thz2p8r/1ePwcU/B/SHICT4ubK5joCvd
         QDPqyRBDBpHW8JZDwjqBHGzEp2ToizMkF49fovT37lTZINJUIc+8yFUtZOmyXt6fd4JY
         sSuMkx1HUMdv1vDNgvMH51NwT9KgOfUIMcdJixCD5HjrwSTjSMEzr8HgDcY8lS04e8tQ
         z+9A==
X-Forwarded-Encrypted: i=1; AJvYcCWdA+Bq17zUlPVounrPI372LnDm6irqf1uU0twUzjmlhGKCvg97jyF20MjcKPNrpbVknHDVYZEyMxMPc+tI@vger.kernel.org, AJvYcCXcetE1H0rldgKUBtRDxHVsSJ93ATy10DAirXHaeIKfyyJH+tK3NOCs4CpofEGI3Qr7ykpd+2F66FMl@vger.kernel.org
X-Gm-Message-State: AOJu0Yywwk58iIWDZm7H62+BnO+AuzZ6edcER2/Js9D/uY/R/5bEPSw1
	AxuaAqjXnJlO0EbmToBKNrf+LlEc8yfbBVAzzSfgFeEcoHKKBcn2o74ZPw==
X-Google-Smtp-Source: AGHT+IE7goCW5Ok0ask0dp0wzGG/+miRdyMdKQkhract29WSxK2DEgT1NvJp4Om+3AsifJ2VRBoziw==
X-Received: by 2002:a05:6a00:cc9:b0:71e:5a6a:94ca with SMTP id d2e1a72fcca58-72030b7c2f4mr522418b3a.19.1729626405563;
        Tue, 22 Oct 2024 12:46:45 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:229:10e9:fbeb:f79a:19dc:62a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1408989sm5087093b3a.213.2024.10.22.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:46:44 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: linus.walleij@linaro.org
Cc: brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] gpio: fix uninit-value in swnode_find_gpio
Date: Wed, 23 Oct 2024 01:16:24 +0530
Message-Id: <20241022194624.34223-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue detected by the Smatch tool:\

drivers/gpio/gpiolib-swnode.c:78 swnode_find_gpio() error:
uninitialized symbol 'ret'.

The issue occurs because the 'ret' variable may be used without
initialization if the for_each_gpio_property_name loop does not run.
This could lead to returning an undefined value, causing unpredictable
behavior.

Initialize 'ret' to -EINVAL before the loop to ensure the function
returns an error code if no properties are parsed, maintaining proper
error handling.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/gpio/gpiolib-swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 2b2dd7e92..51d2475c0 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -64,7 +64,7 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 	struct fwnode_reference_args args;
 	struct gpio_desc *desc;
 	char propname[32]; /* 32 is max size of property name */
-	int ret;
+	int ret = 0;
 
 	swnode = to_software_node(fwnode);
 	if (!swnode)
-- 
2.34.1


