Return-Path: <linux-gpio+bounces-21634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED0ADA92D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B5EC7A5B51
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1BD20C005;
	Mon, 16 Jun 2025 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i59Pn6zZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D811FBE9B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058347; cv=none; b=BJrB9vd39vLpbypw3NQn7WrpcxJO13J1EJfM0Om046sxFYlO8sQicE3myfx7rtwXzOqJQO0Gn7Uo3ug8VCO4gisBzGtqQ3bWXlP7r0WlNDia9XVf2kUfbwiY3t9lMqb2tfPmlY9c7cO8K7886IvSgT632kwKz3S6qQVSKyqjgqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058347; c=relaxed/simple;
	bh=DmSMep/ln8oFNFSCxh+5YdfNVCHUYDbu+lN2rz8R7HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QclTZqGfh2It9OjbwXmQLyMBL61QwKCFTZvMSRWsJjSxpmfruOOU4G8pZpTXrv2uccoKbpW9haR2dJ06Duj53jr2+MiMCkV8pOyiH66cH2+/iF018JeGpKz2hIXOis/sD9wjRTRewwjKHoPSSkyXFgV1Y3fBB7v8WENpdYdTpT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i59Pn6zZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4530921461aso34214665e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058343; x=1750663143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=i59Pn6zZ8K3T195PwEDixWL2xnYuJA8l0NmfppiN27y+RHOjDlbl2/aTxSD6zg9KIZ
         3IdnsAhI2WU7ebeOd/c/33/5FBCs5v+abmA3ItrmQ3HdN4vwoEzG4kAXZJYjJC5rEEUo
         1REcq5kB6rHjZr7lKfs4J3a+B2J+lo0b2WlG2BMJi9nhm9M1pz75PMuHckp0tV6l1u2N
         9GNpFR3lvQ03sa3rH4f1UU9yiaIVsbUlfWGXvy+nVlOSv2t35AL19W0W+hW+X172C7HI
         8/CmIomR1JIcg0UjKGKQKc+dTtRUq1iyXaZDT5q/fw9YR3E3BhxnWUnC03QXyRxdp46J
         k9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058343; x=1750663143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=nIAOM6KkO2gndeqj0nltByWJVokX3DcCtqbLUxuu1fjsQHW6oxBrXJhzKWRTO8jOuI
         WruYp3h0VtuXAVFulaU3qhAVMcMXx0V2ACAF3e4Cq46+nLOVYChop9XB4s0IQgjGjICp
         iDkApfOYgl77yOcwgukJBn7ZX5x1BFknJ0nicRunimDCFwVS5IWAxVgHCLXJFVcTKCs0
         C7CTzXrjw3H4jFVl480VZZCPYjiXBps+JBqgsK76k9AUkXiSmJHiWNCILEPUcMfyoPRc
         RbUVcmcC7cFQC4eGrq0MgQnr6QYOl99LWv8JoHrD/uJNrCQydnn01Lu9JVgStLd/qBHD
         qzzg==
X-Forwarded-Encrypted: i=1; AJvYcCXC8wjSjzFBDy+cbFXQnwOAgoVQTIGlA4D16HHKJjVhgkdNwEvpk9JontsruRjH5k7ontN4XMISzzpT@vger.kernel.org
X-Gm-Message-State: AOJu0YwLac5XcraxSdDneJbg6p9cVKRpFvPN3kky+NwCbVFZmVZxsT8n
	zSsBFU2YpefD9GyzTonrXwWvdhNfbhvrtEvPQ7U8uMdrIzsRdkrBDYqQVr9QpMMHIuY=
X-Gm-Gg: ASbGncuh6DG3ewup7mlx5Xv1ecKEuf8wqGa1FE1eW6Scu5Kg3gMgnJ4E4sRrgtp/b5z
	3xAKn88WDbwguHPtLU2dcHQV5j+lP+spM8VtIynOAQfwFs2BXLgAhcDhCecEt/nAbXyL/5Qc8Y1
	z7XB3+uIuiDSn04enIdeyTqjwWl3lDIzyTayUmapTiYaWHGDGsAIj8UnmnBayCXSTYTTrHDvtNK
	1Blvs4pyuDFb/UM9yDyiAjC4OV6ZDu6UwHmmt1kTyVarWUQoyWZ9TbwGS6uOHdnGlwD63SG/hBv
	s/QFd6nEGSB62AQ6OeXtZjEwRPEuI4/Fx8SrjFkso3ONFOX5xx+OOyC7FDGHUYpfiFI=
X-Google-Smtp-Source: AGHT+IHsOWWrGw33KPO8FAEDWsN0OuiT7G9mdfWH0+bjyHnAr3r7fXuZ0wWs+hQ4SoAA8KJrWsqr+g==
X-Received: by 2002:a05:6000:2dc3:b0:3a5:39a0:2309 with SMTP id ffacd0b85a97d-3a572e586dbmr6519037f8f.55.1750058343179;
        Mon, 16 Jun 2025 00:19:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:53 +0200
Subject: [PATCH v2 4/7] media: i2c: ds90ub953: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-4-6825114f18b0@linaro.org>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6W1fcEZimkIBP6TJfRKXLMogRIa4qaWvK8I7PtSZn7U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VgMhj5jvqoi7RHW1ogviS+lBSZMCBRL1IgU
 fhHi2YCzj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYAAKCRARpy6gFHHX
 chRYEAC0YVhoYaRGsUXyymS2Gdmskk5QlVFH58KLAmS7lZGmGYU0f1/4OvnKyE0dFGKwkeae7UR
 Fodidlvcn2SXrq+AinKj6dU6pOut2HbxEngfhU537ilkg/JrbZGThhylcUEyYQg9Z/539kpyvch
 vp7wnxb9+YJDzwNq9VGOojja7kSKVQpE7wydot6qDFH9NqA2y34exbGtqA425vsayOpfgX5edJz
 CR4FNSC4fmOXx05+wbEreP6ERYJLL78CQ7XETvBs+bpIORhqCqBoc4cF7+HfnGlFn+SRFYuPLsI
 jK2X/H7FyNmp0VV/EhSDS4osL1uNkhYllX80GZXY1eNRe7tuWiTy402c8PYSUqRvVlYEExv26zP
 rqKEiecx3rl+dAF6oQ+jFs4B6APD8X1bkffqQ3ni1lxHcaSkGL8HoST52fEo2mekJEaNJ9AICMg
 o9ZFllhFG0Lt2xUA/uhKqO9+LxJwu1RnfBJUF7aINp1qoZWV6jYY8GicRRFrWzI1N4qzXyrPEcZ
 UOcMHXQVj0zLxLk+ENkmPBYnPZd5RuJkN0T5OAAqbhhy335uiWkGPgaNG3Ag+Kcp8tblD+xybyX
 8sL3BsgspUggCNsdYVwPZhwqiRCoAgUk2UkkAvA564N3jp22VOajWLxPVQXcutVDtogGGtTLla/
 tfjylgBhGmODGCQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub953.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 59bd92388845eedf64587289c7f7424ee570524a..242dbf6d48f3905c8908bbb06ede84e068e2f267 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -317,14 +317,13 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
 }
 
-static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
 
-	regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-			   UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-			   value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-				   0);
+	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				  value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
 }
 
 static int ub953_gpio_of_xlate(struct gpio_chip *gc,
@@ -362,7 +361,7 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->direction_input = ub953_gpio_direction_in;
 	gc->direction_output = ub953_gpio_direction_out;
 	gc->get = ub953_gpio_get;
-	gc->set = ub953_gpio_set;
+	gc->set_rv = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1


