Return-Path: <linux-gpio+bounces-7411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0703906638
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A061283D31
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB04613D24A;
	Thu, 13 Jun 2024 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esK08/mc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B613BC0D;
	Thu, 13 Jun 2024 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266236; cv=none; b=TNnNoRUWfn8eWEf5Zwkq1LakqLC0M75b1ccA88k72QGq7g5BJnS7emijBpT1GzViZIzgufdS8g5M4cAKl23aeeEw3oUo1yvcvLZZ8JH1USF2Q/uo/44WjeG3pHQ5OHkF8J5cu1T5hDRQR7KI+BPtL7Od87LvD3brXty3OY0fx+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266236; c=relaxed/simple;
	bh=wRuzi9Pcy2O35Z/Z8TVOkCVbK3LZwvFBU3RJco4GeqU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lY6Qbdee1us3jfIPargnrGwHzBCieLnJ8LGJe+JsjirTgP7lKxp3D5qlPUuAN5XvkxqL+BOG5EjXqdfB0r1oO3n6SHNV3LYtq25phlPIxqTMdXDHfciiqwCRCtoVh1SCCbbsDacTvc9cvHgia2ahI74V5EdfWdBqXSWJT8bNd0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esK08/mc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f700e4cb92so7033665ad.2;
        Thu, 13 Jun 2024 01:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718266234; x=1718871034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=esK08/mcTwHfTYrXZV5echUWP+KvBylwsuQeGdEEYInydi4qjA6RohrKjiyIcw83RW
         Lm/0o/zaBtuIRmcGGFYl9W3ljvpm8YS81mogH+redb/RJnjucvoHqNLBMAnAhgft5ecx
         zv1KWUiAm0tHk4OY9zjId8Yc0vWNT8QOrORzL2driPBymEJDcuT824EhMR2i1jaUM/UU
         vOw6amtve0FpsQv+a6DWSvj6b2IXFPvdTDb4IMPNtgiJuf2yI1OpEVJNmTj8ED+eM8Xw
         XcaasKSnA+zMQ+km0o9AYHmunHPhTGlTNzPy4qjVRb4eqLcIa2YFgvlv5HxpfymtDCrM
         Jhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266234; x=1718871034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=nn2NXsTGIqkoN0TUjuwj/wLik5qv3Ie3jmvYwr8TcCa1DEaPS5Ejq1YjUtvrkV5WnU
         drYHCYH8uKKNeDwNcq1rO0qsiEYvxitchQsliqeHyMVvGAF2QAqULwCMyyBdj6MIev57
         tqNq9zLX/VsNv6YlL5uRMOatJeON9Kmto9CsaAN8zc/ULAyxNWKTkjJqxC/KJLw778pj
         J0yxhzpuPg7Fvb/AAZ89KS86PieXDfLyQYnTg76dYzKJ9N5aJQEq2fRjDMKho2GIS57T
         Y8rHIo+gluL+TQdSIgZxN0yR1GPcJ5UnPUFto+0i/uB7KtnR0vxXVGXnPofldfgqk9gn
         mjZw==
X-Forwarded-Encrypted: i=1; AJvYcCVKqsnhVOwjdSzdFELuDuSwUps8dl1YS6en1/vsOl4woZYMNTesGVEdoa1scxB81DqQslzrMAOtcxcpldjLJflybr1PPVCg+PaGakN0fvJTK0nF+A6sjKfpZXpFDcE2V++yVSWQN/1PgA==
X-Gm-Message-State: AOJu0YzkndWX+KDtptg2M7H/2hD4MYfvxUnpgaP/CApUB95lWEeeeULN
	6FfGpDN7NIQurNG8gGNPmeLlES2A5Pxtq6xSeb3HSlzmmCxZMROw
X-Google-Smtp-Source: AGHT+IFLEywWphtgn3X1PQp/3zfnSwArZcK1HQZIowNQFjRIz2BcmZ5KhpvO9dq6/2QAxDHqyog4wA==
X-Received: by 2002:a17:902:ccc2:b0:1f7:2135:ce71 with SMTP id d9443c01a7336-1f83b566d82mr47972065ad.11.1718266234189;
        Thu, 13 Jun 2024 01:10:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e74c49sm7572965ad.104.2024.06.13.01.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 01:10:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 13 Jun 2024 16:07:25 +0800
Message-Id: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,
reducing the number of required pins.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 7938741136a2c..31e4e0b342a00 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
 
 FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26, F25,
 		E26);
-FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
+FUNC_DECL_2(RMII3, RMII3, NCSI3);
 
 #define F24 28
 SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
@@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
 
 FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
 		B24);
-FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
+FUNC_DECL_2(RMII4, RMII4, NCSI4);
 
 #define D22 40
 SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
@@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(MDIO2),
 	ASPEED_PINCTRL_GROUP(MDIO3),
 	ASPEED_PINCTRL_GROUP(MDIO4),
+	ASPEED_PINCTRL_GROUP(NCSI3),
+	ASPEED_PINCTRL_GROUP(NCSI4),
 	ASPEED_PINCTRL_GROUP(NCTS1),
 	ASPEED_PINCTRL_GROUP(NCTS2),
 	ASPEED_PINCTRL_GROUP(NCTS3),
-- 
2.31.1


