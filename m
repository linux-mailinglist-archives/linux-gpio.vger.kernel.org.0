Return-Path: <linux-gpio+bounces-14186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3DB9FB9BB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 117BA7A1BCC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 06:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8163B17BB32;
	Tue, 24 Dec 2024 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Pom6JTnG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FBD1632DF
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020905; cv=none; b=m5gBpQilpYoPG33BX90LjUmAdFLFg1cXRqhjq0B4QBllgoH6JKaSF0HwMweXGSwBaeQLAn2SC/n/fh2VZ9u89l6sM6KoSDT+B90BdsynJ7x+BHYtPM+Qjx3HTzOZII5gSfdstXJZZp5mzpszC9no9ktAFuoYERWdjCS3AKU3xno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020905; c=relaxed/simple;
	bh=mWlR0OxQrvSUFNUtPMcxJKvGUyR3rD+rrQEear9gnso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtJ7MA0TGoi7RwTwGHH1SwgHn2HkHSgMeIOx/mnO6QYG3YVUYcF6p3WgHZCnipBTmBiKKUsrRXtYoE3e+650QeY6ZgQ2ph3sYmS5c2rdV3tVMd2nVQL4isZEXU2UI05vfyjniiRYj+8V7S2j/lC9f1Z+fCWt8klM94J+HiHBrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Pom6JTnG; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 665673F8D9
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1735020510;
	bh=J7bcT4SjPneUM9tLI8tVI4MMK9t1QaJRrnEAS0MFCK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Pom6JTnGWWC7HMeMmCcxZGOnkfVW3s3Ll98b0L9K8MfychNUxrFM/Ifi3wdClqaaP
	 H6wcGhiHlPKjj0Qu0Cg2bIvLLWv/57s9Xn+kPZMPhApeB7dMj9RFDuUAt9sHpmb4ds
	 xvkhje5keU04er1b35dFm6bhAIia1GsCbnmnPjLPcnrV7j3wXdb47UapVNitjmkfw9
	 0SYXZoNUex1teSjors9pNeTgujJcGfaTGFkEYt3cBwKIgWEjmvQb7nsVguRSgvT7s1
	 OQBviCdg0Scp98isdZ1CbQavGZf0+uTRs3NOsI5zZfmW00blCVq7W1HZoS+oagx9ys
	 PP6lU2l9PMBJQ==
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216311faa51so43845405ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Dec 2024 22:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735020508; x=1735625308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7bcT4SjPneUM9tLI8tVI4MMK9t1QaJRrnEAS0MFCK0=;
        b=gYhdhBfwMJg8vgxn7Ulfkn0YHrNzWoXI3YUy0HAeCqlWfqbuEc83ZL8NA4PGq95q74
         uQZ2FvQEAWV3hXQ9D1Rjwu1ZUcvCn+jVGSSraErCmD4+i0U2EvKRzb6S/k/bQO7P/z+W
         TJuckx5xceDq9UkrIxr7pP213lCj1ARPt20tvlrH3n+aOeLczZJKJzif8ut5anpzimgC
         K/n5FSivBZxVVncVuygRItCOX4qj7oRSUEbIedYqKDe89Qjc0A5ZxdAiC3Mmbxck3nLg
         mdVDl6bEpISpjHFBYKUBMSbdJ37VMx47znqMDG80Nv+tZX8RVBPhimIVeLAHx8olLc2p
         6GNQ==
X-Gm-Message-State: AOJu0YxOKvwy6Z6W9g3FvIQtiZycKg4fPZiWpBDGgoDOjHEFBeAM8lPY
	oTUCfremZYo2nfZv5pLuEsBoYWM/n3hRp2GIqL/9JWsS4bOgN3K3cUDU4iyd8FK8Uv64+uQviFl
	8OJbvb3g2AkpjJIlIHBDCWQyRScs4ti/LKhi+nxplZ5QNU3M66ylo3j0V+wbh1bFJAZS1Okm56/
	6jd9F3ZrA=
X-Gm-Gg: ASbGnct+eu66C8wo3338WkhYHogxrv9GLtPh4w9NbOMRj3ykuTj37LwZzpWpSe7fW1S
	soAEW2V49NO0EfCZTGXDqJ0HJF7wSBEgyPTCfu8uxUgHAgcldKgJQ05NNdJZV/kn1kghl/QgZyT
	AAGRiF6RriYq193pWkd6obwhneIuDh6SGwwz1UeK/DDnCrWpSLnNG7if1vFdxmix5E0OskAavPM
	uMVup9q1IbmVWgIhSnId+7u7J1YvMnnsMR8lv4FhsLY3cJ6f7859BtSEg==
X-Received: by 2002:a17:902:f643:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-219e6d599famr267049215ad.19.1735020508139;
        Mon, 23 Dec 2024 22:08:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLN1UqghuGICJDVgUY2gGTq2Ksry/nt4WmM/Ul1mkB0GEW6R7/cUrqNpweSDb4QJBSIZM/4g==
X-Received: by 2002:a17:902:f643:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-219e6d599famr267048945ad.19.1735020507861;
        Mon, 23 Dec 2024 22:08:27 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:7315:8eec:aecb:29a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02a8csm82262235ad.269.2024.12.23.22.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:08:27 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] gpio: virtuser: fix missing lookup table cleanup on probe failure
Date: Tue, 24 Dec 2024 15:08:16 +0900
Message-ID: <20241224060819.1492472-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224060819.1492472-1-koichiro.den@canonical.com>
References: <20241224060819.1492472-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a virtuser device is created via configfs and the probe fails due
to an incorrect lookup table, the table is not removed. This prevents
subsequent probe attempts from succeeding, even if the issue is
corrected, unless the device is released.

Ensure the lookup table is removed whenever the probe fails.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-virtuser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 91b6352c957c..a81e15a4b807 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1509,6 +1509,7 @@ gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
 	if (!dev->driver_bound) {
 		platform_device_unregister(pdev);
 		fwnode_remove_software_node(swnode);
+		gpiod_remove_lookup_table(dev->lookup_table);
 		return -ENXIO;
 	}
 
-- 
2.43.0


