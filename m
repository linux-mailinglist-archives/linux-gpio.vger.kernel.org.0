Return-Path: <linux-gpio+bounces-12129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2519B165E
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 11:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065F51F226FE
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 09:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CEB18C928;
	Sat, 26 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEnrXjO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D613217F5E;
	Sat, 26 Oct 2024 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729933614; cv=none; b=DxKTjtF+aeTjr7zwptrbfAqNl1Jt+FQ97VXdSVV7k7tHzy7CEjPx5LIZmOcr+mJ565ZVyP2MZcSs4CBRuwRfQVgWd2iy2oZphmV/y/a4r90SOujEiJv/5OHuI4/zEzP5rCOLApD7mNbZWvtU3Y6MNL12wqnxOJrjUSglcpDJcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729933614; c=relaxed/simple;
	bh=+NdJghvBQWb+m4k98LeeMaXO0uTXKxNT9LDUfdciUW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFuRt8Ak5shkwf9S7Lf6KKGVMfWthdwMp26jZRRa644Xj7X2ffShb8dtRvNJgSzt+F1B3DmDAQGMr2sedhkHDyawxZ4TwWLuQ2fQZFPzyzWoqYwn0jbvMf8xVuHut92KGcg6Sc7j+Bvc5DLO6KLec5tIE8G8QpmWGYLLuUTtcaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEnrXjO7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso2667228b3a.0;
        Sat, 26 Oct 2024 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729933612; x=1730538412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrjhOjkgV4XOW6GCyrUwLgtOZKdpB85rZRvRDFwdJnE=;
        b=OEnrXjO7Rhihuj+VwONVUW9ZViG/sG5b3VpykIKWX+D+FjH0LS3vZeRN27bNbmjzFW
         ywelK0jmOrWiRCmSgB8ck8Ff5L3hYKxbAM3tqFUhCaPS2EDSOmJMw6S3S9UCUwxR1jIr
         be8fy37cGdgdlNALxL2ToK5MQXJgjQcgtMEQwuXHM+uThdWofK/O0MT6BQjxbMWGjty0
         4E5ALNKi4l/wARd1oetPGW2TnEgltKkGrnngmjS0560F+32MzZyUhHUGGoAOzsypNNx8
         Z4JDhj6z2FUjhFdjI5cM3dOVp377i+wPE6zTOWljHetrlaw7HWSwBvaXwGfr6ryteRZB
         3OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729933612; x=1730538412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrjhOjkgV4XOW6GCyrUwLgtOZKdpB85rZRvRDFwdJnE=;
        b=L1/pVqkJAV0GdGZdyDYIjtLotmZWzcujIyEh4bbbSpwq/0qzIIel6X5+yFNEPsFYrw
         RDn/59aXszym1GRbJK8bZGmKNUEdeAJPjEtrQhC48YknYK3rXkim+lEiZm0Ig2X+QV42
         sxqbocYWmxtdlwA9+YvvrBWlvYUVMsjBW2pOkulgSBXCfWWWcGwOsd8BS1rsLcDRSMms
         wISFPcbqbUuZN1jJYavlUIVx31sjDreZvU9KD/xLMRmsyBBUeaP2fWkj73ekn7IP/BAd
         WCXsM/fBSNhM6S6vzov9OglbGKGCeCelM/rJJwonBW+S8CrVyrwtWivlfy/Gel1Kppi0
         tGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcuylHEftxCQ7ewyqUdHjAZaNABGNSumeXP34HxpxJYPXY9EcNmyX9/J3bGn1YttHXcNacHXArF8vc@vger.kernel.org, AJvYcCVwgpcCETg89gWYvmZd1fsrfQuV/Ur6fiVXf3Xw2CEmbXZ5w7Xx5iqU0a7dEgrTUiIKSWTqBI9W0EUSbVlW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4M5/e63OYRjIf1ww7Oay4SySbU8Ie5e5LyvXFGGqnPFkBNRGZ
	AKkaQtRMIdm9gyKR6Cy70bSMPkkdIPpuHi+Y+xib0Zw0VcHsSi2LWjg/6g==
X-Google-Smtp-Source: AGHT+IFArO6Odcmdeq09iGp9ru/4OlQOeUXfOAR0+yIX2GE5juvf5MFAC6sTiHgevAG2BZt3G5LgVQ==
X-Received: by 2002:a05:6a00:1892:b0:71e:60d9:910d with SMTP id d2e1a72fcca58-72062f8f9a7mr3517237b3a.6.1729933612115;
        Sat, 26 Oct 2024 02:06:52 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:233:2700:4dc8:1441:1668:ab33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1fc16sm2361686b3a.161.2024.10.26.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 02:06:51 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: surajsonawane0215@gmail.com
Cc: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: fix uninit-value in swnode_find_gpio
Date: Sat, 26 Oct 2024 14:36:42 +0530
Message-Id: <20241026090642.28633-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022194624.34223-1-surajsonawane0215@gmail.com>
References: <20241022194624.34223-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue detected by the Smatch tool:

drivers/gpio/gpiolib-swnode.c:78 swnode_find_gpio() error:
uninitialized symbol 'ret'.

The issue occurs because the 'ret' variable may be used without
initialization if the for_each_gpio_property_name loop does not run.
This could lead to returning an undefined value, causing unpredictable
behavior.

Initialize 'ret' to 0 before the loop to ensure the function
returns an error code if no properties are parsed, maintaining proper
error handling.

Fixes: 9e4c6c1ad ("Merge tag 'io_uring-6.12-20241011' of git://git.kernel.dk/linux")
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
V1: https://lore.kernel.org/lkml/20241022194624.34223-1-surajsonawane0215@gmail.com/T/#u 
V2: Improved commit message.
V3: Add fixes tag.

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


