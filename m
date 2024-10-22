Return-Path: <linux-gpio+bounces-11778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7EB9AB737
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 21:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEE931F24780
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 19:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D421C9DD5;
	Tue, 22 Oct 2024 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df5Hup4h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D0117C98;
	Tue, 22 Oct 2024 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626882; cv=none; b=YPC09Lvf8BHx0RSK8MgixlTapaiuX7UM1EwRK24+GWK7IlU3HZmstMSaqqQvzjK9ZBu3oA/+VQYmMeOjVR0YmWLzoKWJy6lo+NX3XBXamyKpOD4t4TI/0IMcobEhFPBzDVST6BYAWF7+gkH+CM7yn8CclJlj2AYBylgf2S3QvBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626882; c=relaxed/simple;
	bh=K30b+sYxbEXjSCVjGTQc74ndxLhOz3y5JuywHF3l2RM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PINoUPxmAEU5RYgIVGwiHmAI0PPGplGpPo0cRqaKR6vfEW3m9dvC2PupwG/hzp8bFQK3lfI6C6CR28XldjwwOmLPQI51stGGYHkBJXYp3yILlA462VAnzfEjYN5p0FPA1ElFBlOzse8PzzLJqfLM7gXvdy43oTy+xpCtj1FaXjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df5Hup4h; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e59746062fso2426958a91.2;
        Tue, 22 Oct 2024 12:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729626881; x=1730231681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOm5Y3dnpNU1VeViIpDaJWlrAwWq5S92KHm9xCyuRWA=;
        b=Df5Hup4hs7IYouyubvTIsRVlB3EMChW3uKMsPE7VBi6jVTR+E2RyxR9y39shVvHHf/
         zVx9D5Ig8V5kO2EfvCltnsPECV9oMdUU24uDV6qH+6PSW8hnialzxkg0CjdPxY7zyZl/
         QStmbnIG6ZiWNw8PWDJvcw6UUNBCMRuf74hlBYlm/70byVWXcblpJWpoONIOYd6tTh1u
         65Pmkz3NLCATgUEwa3EIn2UGkX8gXNEjsLz9ytA2G9EZVJLBqQ5mscSpRYwwsAQE5ohT
         reREmyp4qDhRF3XWtSNhO6kPLb5wXaLrlpO9Qw5bimCNITLsZU3z6aL20lbD8rBtAfB+
         BDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626881; x=1730231681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOm5Y3dnpNU1VeViIpDaJWlrAwWq5S92KHm9xCyuRWA=;
        b=loqB+PmChzVQZE6nOodZmtqfjvXy0uPulrkvrTDtzgcoO7Ai0YBh173T1OYwwrb8en
         rQHH9n9l7LoHND1gXWmDlB3GsbZDaZM+f8NoWEUGkN7Jsqtj7WDdJ5m/MrXgNE1aeuqU
         tBpC2eiWH6h86bjlTWbGmXn8hRUf6jxrUvpSn8raWn+SmVO87ezBhvezeF3mr9/uimaV
         YItyWVPWcyriwdIxCpoDh97o/ZpRfFwW7W3UDhaCY1yRCaHo7Bgdvs7/nlYvBGBThwLv
         ZDJa6fZZN7qk7dNSX/l6rZmVw+acU8duNFZ9/XfnQwywI9dF8mPLeyKFStvnpzIZHTC3
         alVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKvxqrwhIk0b0CXcGgW/DJ5BtJzWWpgFxNAEeqgsq6hn9zvys7/jq/ze4si9sSlf0QOkhPFf8ugDuBoO82@vger.kernel.org, AJvYcCWCUDvMzHeW66I/i3l/d2uLbyofikEVIM9cQHnHZeVXkYUPT80m4oEcwe3t0Uk3F+4TikrUcU6uKvvg@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpDiszgH9SeU1L61S5cjkO9cm8WfLJiTvqgiFcbb4oM0LjCp1
	KfqRT90boPXcJRfEU+LlU18PVtwEPjkNkVEDzBrilFVo6PL+aRbl
X-Google-Smtp-Source: AGHT+IEXJ2B3t9Es71LYWuLf6mNrB+V5SYlk2cWz1/1xvhYkVRYy/9Bb+c9e0UMqw74qqi8yCDonbQ==
X-Received: by 2002:a17:90a:6f83:b0:2e2:e8a9:a1d with SMTP id 98e67ed59e1d1-2e76b5b67b5mr93846a91.6.1729626880731;
        Tue, 22 Oct 2024 12:54:40 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:229:10e9:fbeb:f79a:19dc:62a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad3863bdsm6660569a91.26.2024.10.22.12.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:54:39 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: surajsonawane0215@gmail.com
Cc: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: fix uninit-value in swnode_find_gpio
Date: Wed, 23 Oct 2024 01:24:32 +0530
Message-Id: <20241022195432.35700-1-surajsonawane0215@gmail.com>
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

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
V1: https://lore.kernel.org/lkml/20241022194624.34223-1-surajsonawane0215@gmail.com/T/#u 
V2: Improved commit message.

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


