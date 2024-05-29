Return-Path: <linux-gpio+bounces-6847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47928D376F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592C71F2623E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71F1107A9;
	Wed, 29 May 2024 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIO25tVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F213ADA;
	Wed, 29 May 2024 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988843; cv=none; b=hcUCIshzk4Qu4cZOVyLME9sBmnDF5qblXaeTYgM/hlgtQkfCIFp3W9s32timGmVj9925rVxfo54bwz7kNYD0/suqqoyBNVhfKK3ORDZCozko7AkfOkqkrT/W/RmuLeia8m54+gtsp7wd3pp0QXdOpOW0FIWqM/unHRIMk6+BSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988843; c=relaxed/simple;
	bh=N6T5FDrbz5fe4Yp9861iorHBz9ZBlTICU/yU1f1AqKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yv6UK7prnXVbU+qKvB7vW+fd1S0BPEgzheZ1SbLoNd6PgQfucXhlZeOCAaA4vszwE5Qo8eWSgW3iwV7/2hLDbgz1Q3lwCXLb+qJDcvQVS5i6bUPh8IE0TWJpnrgOA5Lz8XePn+tOeENcB/LjnMsyp5FdHf/bwJyfDJJ5k/4hV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIO25tVo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-701b0b0be38so1688071b3a.0;
        Wed, 29 May 2024 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988841; x=1717593641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jYNZGuufvcnAd1nYnzFJWOOAgslXCStrEQYQHkxTy0=;
        b=IIO25tVoIo2a0xpU7fMUteWMHf562iovnqYmPo3jBdolcE2wFtDgkKORJ7Y9eXMQ7N
         NafTCx44xO4Pq391w3WNcgDGTE7daMUGXx9vk5ZZ+nmdt2JBMA1d0BGwR/I2lZ/q4PQ5
         JuwGO1WZPgkm5sgHGVxASpTI6KV5hbF/DUpRsAAbqRvKbLKqkAITHRTOb3W4nX2Um/Nj
         zIxiNSk3lNv2iGFZXCY+i7Sr7rofrDggurjZQsAoPqZJh5IYMZybeqfhfudxBAhmnaxx
         MPSnaSaDr2oHXlsR+K+ZZHU3KKUgZpvYRrhCHD/0jbfVB9dak304itJRIMe8wN/NTppz
         u1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988841; x=1717593641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jYNZGuufvcnAd1nYnzFJWOOAgslXCStrEQYQHkxTy0=;
        b=lhsdOxMMZjFKak3VZshJ4f67nicjffRNLnyCbjb0WaNUwBOVY7yQ79KMgROob8rWdv
         vM22iUdIEGptpQHyqFWLoKIbrUvSDWIP7gR/H7zWk/EbxFPe6zN2Jk/S3qM7HO9vkQ2c
         2dOhT/xVyvh22gvNtVj13ztqY9+ld3mNcTeH7gZ/lnA3qJECIZlZat2BpRe3T+guoNgL
         WNl3OIYvtMF5uCkN0lxQRVVr5LIHhII3U0aIrlwMvxuoOl+eRdgEkj5+7sXEb1Saf8pc
         YJg1z6l48fXlq3pzaqzbVBaG1tYiXo9/dbMRA5KN0qUGf2+0rM876rQUhE5ZsBmYVI/Q
         2CrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLn+L3/dt0c5pl8eGAlLIJnhMtuTAEDSFvkvxqbd2Y0KhKf9BwRMdfbu9Mn/zwKKQlKWXq/MrVtx2KSDsgjNm1c4W0TKSp/BmlXw==
X-Gm-Message-State: AOJu0Yy1SSkrHdx/9DhOVwCP/SkE+cWmyVClkRMHgGVaiLyqjTv9Q8Vu
	2LvgyXHs91n6FJ0efQBkYgV4R3OZjm4Rn6I0tH8SbYzofZR93K3bak8SSA==
X-Google-Smtp-Source: AGHT+IG7EEIFxhlMzFp785J0mllLtqrCV11rtj9I40DEOMCoddO1MKjYBD69W9ajszfw2I98boCVwg==
X-Received: by 2002:a05:6a00:1d8f:b0:6f6:7a47:3686 with SMTP id d2e1a72fcca58-6f8f35dac57mr18388674b3a.9.1716988841424;
        Wed, 29 May 2024 06:20:41 -0700 (PDT)
Received: from rigel.home.arpa (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1838sm9121844a12.46.2024.05.29.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:20:41 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 1/3] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 29 May 2024 21:19:51 +0800
Message-Id: <20240529131953.195777-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529131953.195777-1-warthog618@gmail.com>
References: <20240529131953.195777-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initialisation of the linereq events kfifo relies on the struct being
zeroed and a subsequent call to kfifo_alloc().  The call to kfifo_alloc()
is deferred until edge detection is first enabled for the linereq.  If the
kfifo is inadvertently accessed before the call to kfifo_alloc(), as was
the case in a recently discovered bug, it behaves as a FIFO of size 1 with
an element size of 0, so writes and reads to the kfifo appear successful
but copy no actual data.

As a defensive measure, initialise the kfifo with INIT_KFIFO() when the
events kfifo is constructed.  This initialises the kfifo element size
and zeroes its data pointer, so any inadvertant access prior to the
kfifo_alloc() call will trigger an oops.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9dad67ea2597..d4e47960cc98 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1774,6 +1774,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)

 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
--
2.39.2


