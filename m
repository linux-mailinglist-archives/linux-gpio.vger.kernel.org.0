Return-Path: <linux-gpio+bounces-26676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7FFBACC39
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EAB4192051A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Sep 2025 12:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AED2F8BEE;
	Tue, 30 Sep 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2/KjarR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694152F7AC4
	for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759233797; cv=none; b=ANY8s1zY0YTRlxiN15F4KZz4KNx55f7q8LXZLNZY45vVzWCnzoMQ2O/0BVnvkPnwBLyOMRNihzs+H8d+YYa2d7rUxXl9nM72hZ+wiyrkE25S6R0YmwvdKIXxiBfOezkheod53BR33GKlA7j3sLamWIsiLtFg2ywtl5LL/T2Q9FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759233797; c=relaxed/simple;
	bh=WImr9vrHfeY0y5MR5N5EtvVbHApD7DoSADT/apeR04M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYc1ZmRax/PN9fs+WeL4ku+Xph5dvQwEFlqTbjVhyB7jG8db173rFnnU0Y7dhv359SJbbe2LmGHo2xd4DEe1M1N37QRcQ9Qe2GjADOypGFLezBRgP71sk/HK0zMmtnFibUFh8x7RKHq1Ed4yNYH+tNqMdM28e/LkUKzB2sP+6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2/KjarR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-863fa984ef5so450572885a.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759233794; x=1759838594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddmYfQfm2yXMPyNgG+28VBDkVxJ3r5jLlSFHAdpo6HY=;
        b=u2/KjarR4QYfLX/O8isweEGlVinS+/8WwsBniWLVMXdc5ODxfNa9o+i8G8ZJWMelwE
         MYn0bSU/SrMAaYkvQmoFGKhGXXx/bvnyFCFgHEB2mz+Eub7LI1/Tz6Cu5RSKjllAhYIB
         fk5kmnl3N5ACwvVuGkViWP8AJjE/MM/ib0vpmR93y1tsgC64Eua7WBZ5Q0xiveH5IxLe
         U6JOvKE7hm6dHqU27sHxaUFWY8qQ6OzHqIoOCSLiBDi4TSzf1HNvZWZ8IFaAWCazvT0Y
         jyWQehvY1+ckBXXis1px84amUhxJGM9bVqkT13vR+Y76CivNidP8+0z9q6CoqJn+tW/p
         SLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233794; x=1759838594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddmYfQfm2yXMPyNgG+28VBDkVxJ3r5jLlSFHAdpo6HY=;
        b=YV9LTnw0tb/RsnVRYXWK9GmwiVoPmyFUXitSOILdDFYn6ZYruL2ZHj81Dmtx8wgr8E
         n221ZYo07AFlgyAXtnbJ/FoXBgy9VKYqAmIe8viBcP6OlWvQbrg0m+39ae0nVr3mAaQf
         QYLLt1mup5hoiTeaqTkvkYnh4qXqkAgv+niDyUDFPQ4VOEMINQPq6sWssuPLH7NRP9lm
         vTYT5o8QaTnNFYsiVmR5VALyOD6ixuKIAQBFJIprH3L64ENHECGx9vTMepgQDY8EbAZm
         zQMeMCLszYm52xwT1CCgPC8v97ripxV5qvtRb17zS3r0RLOU5vtN5XeVsSseB6iu1rp2
         0ogg==
X-Gm-Message-State: AOJu0YzVgCWmSuN5SX7TR1wyZDQIZnf7kc/UJp8sgZJ+BFxs7sXLtG3q
	C+ETVKk50TpOaju+oQnYOyl8XbBdXRpE3DtReSjdUDwKl4GLTiru4PY1+F77in4gnUlp5KL7tKa
	ZaH0K
X-Gm-Gg: ASbGncvcXgdDH/2jaR7yFQWz0DPs9v8R/yFBrDJTaJDiCW8o/Op8U27VFPYFm02gKul
	sMD32QlY5gz1vFr47uyy3TqGFd5TkPUICs3gCOnMGbTfTfQuMLhIkbV4sxLJlw7Cnu+T+rFZ8oP
	j0LS/kFb+EaccZa+oZ6nVtYGbKdUBWiFtQlfxS7k0lsoXeeiPuKuZyn+b1fthfFZDh5AGeVO7JD
	iu2Txc3CQxwkfMIYSSbXLVzEDIbxgZM9N9d9AUgVBgAN4uPy85faZD66ScxbkWyRiBMkyGKWrBE
	1F0/ph1Ht9wTN6iwv1my8mJn+NurCwdrMRUPZASX0fVsOYQCyKV/0Vf6Qun0y+CBq5MRU92XuA6
	J9m6ho6PyvxE98wLUn84o8tEpunn+1zwbFtrnv4EwRkH6/QOLW57VKHxsPgfgVmfb0LtL
X-Google-Smtp-Source: AGHT+IH+1Dw7zq01fKC2gdRDExcGzD1vCDjStkF1HEAMvgt7+JzEP/XtX0rGrrtTXaZ9mjSzPEmcfQ==
X-Received: by 2002:a05:620a:46ac:b0:85a:8fc6:5c27 with SMTP id af79cd13be357-85ae435bec0mr2811895885a.23.1759233794013;
        Tue, 30 Sep 2025 05:03:14 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm1020160885a.32.2025.09.30.05.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:03:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:02:51 +0200
Subject: [PATCH 4/6] pinctrl: bcm: bcmbca: Use a guarded mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-bcmbca-pinctrl-v1-4-73218459a094@linaro.org>
References: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
In-Reply-To: <20250930-bcmbca-pinctrl-v1-0-73218459a094@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

Let the scoped guard handle the mutex in this driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcmbca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcmbca.c b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
index b7b2552fd48227b2d318bb37f81a58e03656b954..dba25b453507300aa1435c2eb0326f5ef9694c0a 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcmbca.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcmbca.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl> */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
@@ -439,7 +440,7 @@ static int bcmbca_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 	group = group_desc->data;
 
-	mutex_lock(&bcmbca_pinctrl->mutex);
+	guard(mutex)(&bcmbca_pinctrl->mutex);
 	for (i = 0; i < group->num_pins; i++) {
 		u32 lsb = 0;
 
@@ -451,7 +452,6 @@ static int bcmbca_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 		writel(BCMBCA_TEST_PORT_CMD_LOAD_MUX_REG,
 		       bcmbca_pinctrl->base + BCMBCA_TEST_PORT_COMMAND);
 	}
-	mutex_unlock(&bcmbca_pinctrl->mutex);
 
 	return 0;
 }

-- 
2.51.0


