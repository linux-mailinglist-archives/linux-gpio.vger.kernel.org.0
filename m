Return-Path: <linux-gpio+bounces-7002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835B8D618B
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 14:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED4CEB2472C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 12:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C88115748B;
	Fri, 31 May 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dx16CZzo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981D53E2B;
	Fri, 31 May 2024 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157901; cv=none; b=tyxWj4JVew1N7ST2yxzS/7NCj5kFDCkcR5iAwrJhUu0S0dhZLBR30euMDOQhrFHVecJAR77p+YvMu1+xC82of8CszM0wMDRT6ehYDUgvj4W0gwEgdtb/JUP528lEEjiPrzPko9pM9/JRe2weIvXSA1n9qADZ2z7KHKBL5iJzttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157901; c=relaxed/simple;
	bh=72+twdy4AxOnOPyDRjYOgaYzHoulDPP6vRPlQqXns+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a5AaKB5RREz6Ti2y9dvix5VOdokjJnaX6tFNMS4sCQGuRCMT3itbIu9KcqZjBEsCwKVKknCWQxio8DhN2gfvVOY2hmsq5qwb6Mt8YjnAkB623STUHsE3/uNUmWjkCZDygiNfIFZO8AKTtjYjDob8cvascWRmON15XYGI5rPybXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dx16CZzo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f8e9876117so122631b3a.1;
        Fri, 31 May 2024 05:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717157899; x=1717762699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36JkXqEuAbW7QUbf4OJMhQCdmtv1HnbYTLnjYfq4N6k=;
        b=dx16CZzomdJ2q0oGwcQ8XBoouh+es/BukmxqRWI01njPM/xRJb/IV3X+Q2wpAPdh/d
         w6J5VRxK+Q29u42LCfQJwuFnEWmTlI/j7VdqOYA4kGnaOgJSRtQeoRr9wXC4wTeW6kaL
         VYotYMyy3wCh/fa8hJQuvBDl4VrZYF9PyShmKrjbYPVwkh3agkF7jSe7ru8lVdqeG5wS
         o4aZKuXX57ePyb3FwZpkdNZ2xEmJ4lAe6jmWAFfPHgsKmiQ8kjkMz9qVkyRndXaRnq2G
         OFzu9Zuccjt7uEowf9oORiQhCrSIz+I1Cr55bvniEDiAaqXSVh7by09dY8fwkhjiYVdZ
         wrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717157899; x=1717762699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36JkXqEuAbW7QUbf4OJMhQCdmtv1HnbYTLnjYfq4N6k=;
        b=tretorPphsJd60WoajSqhuNKQjG50NC3eY4apo++OfKArQ7NrJckgi9ZSSPXOmQ1cV
         /keI0c4qsXHAHd2pfIfVOz3dtjoDqs+AR+jHcYiXbPX8ddWu/Zm0hPUrRIsxT9hV3mvW
         d2VsP0H2xHGg33e+EgLUemnyxHsVGXPWhFJxy101EkJsR9me+u8/QgLogYBmYkACSrXi
         sqe5B2e9tNGpB0TSHSwVGxCclC6CSuYApTqFBYBM1mNLKj+OUqxV+qMp65IFR4oc/Uf8
         SNdpQbo6e8HF3VMBkO4BEBW2Uk+a8So/toWKHxulVbNyAf6pe7XG1eD3m7QNwtRXGKm9
         oUwg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8kJtpsg5DXCfUMWhl9vFwt/HQk6jA8RGGxoiEOjaBR1YstMyh7XWgOPHL7TFQsZi2yJb8d7qH0Bi/S3HPpCwoYQlIjrggUMbI/byL6RwnaRx7UxvC0smQMtmW/YBfXmXrPoX1bU=
X-Gm-Message-State: AOJu0YzG+0DT+kq3DqyTpYW4XZOipGn6z08rskitgcwe9vHqtBCCRBSD
	Q4357m6qrPnhRY6acs8yFrMQSnxYD/aV91vblE2PLFaX0WoqAHyg
X-Google-Smtp-Source: AGHT+IHUNzKCyjwY004jSeyhKW9qvTJ4GzAdj3tYR/MPERjmNnCyxOzoB1SzCdPL+FLvip50QZ/Hhw==
X-Received: by 2002:a17:902:db0d:b0:1f2:f73c:c442 with SMTP id d9443c01a7336-1f63695ef71mr18592235ad.0.1717157899280;
        Fri, 31 May 2024 05:18:19 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7c3c:8970:23ae:7bcd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e8ad6sm14918425ad.185.2024.05.31.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 05:18:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: brgl@bgdev.pl
Cc: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] gpio: pca953x: Add support for TI TCA9535 variant
Date: Fri, 31 May 2024 09:18:00 -0300
Message-Id: <20240531121801.2161154-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the TI TCA9535 variant.

The NXP PCA9535 is already supported by the driver.

TCA9535 supports lower voltage operation (down to 1.65V VCC)
compared to PCA (down to 2.3V VCC).

From a software perspective, these models are equivalent as they
have the same register map.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 77a2812f2974..1f2bc29cb15e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1313,6 +1313,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
+	{ .compatible = "ti,tca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca9539", .data = OF_953X(16, PCA_INT), },
 
-- 
2.34.1


