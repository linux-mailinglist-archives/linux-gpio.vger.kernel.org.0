Return-Path: <linux-gpio+bounces-8244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AC933C6B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 13:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0BB1F2120E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 11:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC7917F4F3;
	Wed, 17 Jul 2024 11:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRrPZK6c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717B17F399
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216282; cv=none; b=egY/EU7sM3fcUj0khoJJIgcqTWPcRGQScQk5DtmGTFicAoFzZiEhDTcvdIqyZpmEuotXGMBfIZitkJ5FLDq2xjzaoGx/FBH0xrLbPw16szzZ20LVRxlO8iJLLLUNh87UopiG1VoUitxkk4einlk/U9H4DjER+pMRRQd3KpbGTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216282; c=relaxed/simple;
	bh=enwmZmuv0L96caezA0J96IDUGnYyrKmPtVfarbKLP1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ya1/U1UhC7Obll24xNh/KL7YAWWMwSorgRAQr6WH6pj5QSNMhlM1Q+Pm4SeZpYbhRLhlvhacEG96Nl+fz0zYAilcuXmeIPde53PPWGLbsbEq/Z5irD7TgI4WS17rFp1kvPhuqElR2kERb6XLvK5SXzIoxdbL1dSz8HnwgI/TUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRrPZK6c; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4267345e746so46895705e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216279; x=1721821079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la8KaLTUQo/ZMk9KONJFFAg0PJ07uCvXL6Kih2dokyU=;
        b=cRrPZK6c/RS+Joh+8OnaCxnBsMNV8rmaIAeZ3j6xDtqvDVmY11rC2grqbm4YzD4qxE
         qbkmZHmAMFmQrYCgqQbbnZ349yhWlBvIyI8a1tpLIZ/X+XT2ESV09BBiAZujwLQA3nOz
         tEbUzA20wzwutETDjIY0NohhlFI68fcvgcU7jdymXyTiPbjlUCWTS9Pyoo7GRgyJlaBp
         R8Gt7vgFi298dX8EJI0hN3M94B5ZLoU7ZU5q0qM1Kd1QAk2zS4lAzfgAP1gbn1Mt+7yo
         ew9GFlap6S0mil4xC9KYu2zXO9WP7b6f/4OlXmValRm0uv20Sf6sbuSQT6O2wrX2yD38
         0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216279; x=1721821079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la8KaLTUQo/ZMk9KONJFFAg0PJ07uCvXL6Kih2dokyU=;
        b=DWDf+btgkLjIfSSQZuzvPwR6B6RhLvFAMvDUFmd9iOs9kcf+655yH/bXUQ2Qf5hDFa
         1/nrBJex4MGZ+T711NRc+QPhixITWFiVpf4E+GeQnaqWToNgHZfoDn6MortDeTVvEM06
         F2gpGOrKCvmzs9i6TKGLuLmqfjTVne+A9qNIaOYI66mtMFvMvtKL4FtSq1oxyLAzWw1S
         LXiDMCc/+uVqPv9BtGcvGriHKNe7AnIeL48p7l2OTFSReIuq99UMyk58kO1VqtfBJSmb
         KfGTcklemjqlIAhfSdvT4dGMbX2L2X/watjrFxSTnWCIj3HpkeYV/SR0q8rDRIPv3DdO
         z14Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMLQJ7aKzQ9g/FWMnXt08Spz5J4xHILn3aLqSVZW/mIzXHXAJ9I31H2m9iygm21x0oKNu0g1B/89lN1Eme50gXwWW5rXot2KGf/g==
X-Gm-Message-State: AOJu0YzKY0RxtzDUladp3Qada3fa6oF//Wbk6gKte9oSbmv5VeoE1kzi
	dwAcw+ABhFZbORBSBk6dVsL4V5yf/f4OrGHb3fOl3bIWVCZ8qjhx
X-Google-Smtp-Source: AGHT+IGk1j41e/17L4+jt8Koxf+RogPXySfxsiLPrLDRjfdxx8p3RLqxIV4IcL2R4z5xZxSPWQqpYA==
X-Received: by 2002:a05:600c:c08:b0:426:6f15:2e4d with SMTP id 5b1f17b1804b1-427c2cc27f0mr9100335e9.9.1721216278954;
        Wed, 17 Jul 2024 04:37:58 -0700 (PDT)
Received: from localhost.localdomain ([67.218.244.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm165705635e9.41.2024.07.17.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:37:58 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH 2/4] lib: line-info strings termination
Date: Wed, 17 Jul 2024 13:36:42 +0200
Message-ID: <d86be0c6c536429f515be080ea43cc7180396476.1721039339.git.ikerpedrosam@gmail.com>
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
 lib/line-info.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/line-info.c b/lib/line-info.c
index 9f53b04..2ded9ea 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -148,10 +148,12 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 	memset(info, 0, sizeof(*info));
 
 	info->offset = uapi_info->offset;
-	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
+	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE - 1);
+	info->name[GPIO_MAX_NAME_SIZE - 1] = '\0';
 
 	info->used = !!(uapi_info->flags & GPIO_V2_LINE_FLAG_USED);
-	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE);
+	strncpy(info->consumer, uapi_info->consumer, GPIO_MAX_NAME_SIZE - 1);
+	info->consumer[GPIO_MAX_NAME_SIZE - 1] = '\0';
 
 	if (uapi_info->flags & GPIO_V2_LINE_FLAG_OUTPUT)
 		info->direction = GPIOD_LINE_DIRECTION_OUTPUT;
-- 
2.45.2


