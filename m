Return-Path: <linux-gpio+bounces-8245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28914933C6C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 13:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D435E282E3C
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42D817F4FD;
	Wed, 17 Jul 2024 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYmlONO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2963BBF1
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216283; cv=none; b=Ftn5ooH2vA08VzhOCQOSQg6tkRalqeoaH6lEgqjyGUcyh74y7IKAGWGjUyt0cR3BnWXNBzn0OavVd2V38pwH8i3BdlHxBt9OKRvSOF1TrAFvqmZc65FUh+LqwL6htW+/Hykf1FMyPjj2SEE+6d6WXfwebxd9b4HdRyAA873BpTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216283; c=relaxed/simple;
	bh=ILKUmaQG9KQlC6WL68YOR6O9XEyIOCMsN3lUg8ieuo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0ePJQY4/BPOtQtXh1j+0um1z7JsdwSk+zt0xTzT5B/R6NPHpOMzHoYXTXiXYSbLctckT3IpjHfQNW8k65/c2ZXQN50lX9YuhdhX/XB8VlcH7DeVagO8hYhtKEniP93LOc7C7VU1d+RkBjkLS4pqx0JWGAfSmj4+Us18+GAh06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYmlONO0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so94049431fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216280; x=1721821080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQZT6M6FcqQ2Li/Ber5DmgcsjI/eghY/46+HVQwLP8k=;
        b=iYmlONO0yyvMkKqlZe51LiEggM7PR0BZfuK+4AN09z2SM/8+zQxhSRjr8nVVpMGPpG
         TAASG8P5Gp8u0IL88WOFiArL4MitaygVg+CU34rAMhe28ikWD6IH2NYkhGVcw7W1B7gY
         WLA3QVFAIvEqX3Z7joW3Qj35EMwHPyo4ESl7nO8FNtexPZp80JTj0A5TZgOkQPd95luo
         vmJm2fUpbHaGDuHcnv+IhC3lZpG5Ql5IrXgaUBgR9B8/UXAKZRtkyUkl50IU/XUgfIuw
         x3vxNY9nT+dyZ/1ZbBf2QTh1eqlYGpXQ01xciuerkGmWYidRY2ZsLA9rELDk5iwSgOuo
         7yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216280; x=1721821080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQZT6M6FcqQ2Li/Ber5DmgcsjI/eghY/46+HVQwLP8k=;
        b=Xv4kjXDd3jm8KVlOr7KfdjALJ4JdbWd9V9TZCMUX8FPbbaC0BFJvmm9PhWN0/RNJe+
         Uq+8Wfd6X/jGEEZJu4IgVGycz821Y35zuEIRu7FFC5YL+Sh5nMvTHZLCD35Ih6V8L09J
         Kvb9X7r25Pw2MzKQkBfEKkXkVMvezFlPJXXwxiFikWkN8WvJhB0Jab82LmRM0Fgzx/9U
         RBkEl/Ow6FnKjGs8fXkE+2y89F/maSmrxOY3ghS8p99l+dDqNnortT1qg8VKTs4a7XOJ
         /K+Gw5E9LeuWN1RwIDspKIrOJVV8M3+nqZuA8Zlai/7l2K8VfYaW45A2N+HLK0StelXB
         5CnA==
X-Forwarded-Encrypted: i=1; AJvYcCX0JxOykAuQzOUeJPS1oxL6PXtted7Roqi6WnfKzhOVXosFAz4WxmiwhHrhoPDH0GBvPtv05Wu8KXau1jvn6Gs60XNXO9d+QNyhNQ==
X-Gm-Message-State: AOJu0YyllxIIdAv5omgNjLFgjuXjmNvwyeiOucQfsHo1d0aHG6SG/Cpp
	Ek6WK61A0+Gx3/NvYyWZS9Yn2pCOPqMQ63wDFbcJG2FABQdnOJS+
X-Google-Smtp-Source: AGHT+IE77woKCSfCHYxjYQQPz+Af69ZcmfSIxgOA2mc3sq8zSlDCwKc72Zwgc6ffE7yGdl+sQXWOJw==
X-Received: by 2002:a05:651c:3c7:b0:2ee:7255:5048 with SMTP id 38308e7fff4ca-2eefd158035mr9395511fa.48.1721216280027;
        Wed, 17 Jul 2024 04:38:00 -0700 (PDT)
Received: from localhost.localdomain ([67.218.244.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm165705635e9.41.2024.07.17.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:37:59 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH 3/4] lib: chip-info strings termination
Date: Wed, 17 Jul 2024 13:36:43 +0200
Message-ID: <275f51e932498959d57ebc5bf16adc90bb7b5967.1721039339.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721039339.git.ikerpedrosam@gmail.com>
References: <cover.1721039339.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() truncates the destination buffer if it isn't large enough to
hold the copy. Thus, let's terminate the strings with a NULL character
at the end.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 lib/chip-info.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 87fd9e7..2f2523e 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -57,7 +57,8 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 * GPIO device must have a name - don't bother checking this field. In
 	 * the worst case (would have to be a weird kernel bug) it'll be empty.
 	 */
-	strncpy(info->name, uapi_info->name, sizeof(info->name));
+	strncpy(info->name, uapi_info->name, sizeof(info->name) - 1);
+	info->name[sizeof(info->name) - 1] = '\0';
 
 	/*
 	 * The kernel sets the label of a GPIO device to "unknown" if it
@@ -66,8 +67,10 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 	 */
 	if (uapi_info->label[0] == '\0')
 		strncpy(info->label, "unknown", sizeof(info->label));
-	else
-		strncpy(info->label, uapi_info->label, sizeof(info->label));
+	else {
+		strncpy(info->label, uapi_info->label, sizeof(info->label) - 1);
+		info->label[sizeof(info->label) - 1] = '\0';
+	}
 
 	return info;
 }
-- 
2.45.2


