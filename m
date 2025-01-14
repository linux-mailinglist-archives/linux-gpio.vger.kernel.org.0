Return-Path: <linux-gpio+bounces-14767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD88A104BA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 11:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412DF1885442
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 10:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B5822DC48;
	Tue, 14 Jan 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGgJqv52"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6922DC25
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852160; cv=none; b=eq2Qe5CjGk0UJMcWa+HW1EX9EalE253rJDNGHJceDSyJhmnqW0LuFQPFBYijnfep+DZ23lVy/sk0jA2FAAp9iHYlQmVVdocdm9P3nD5fCGevNmIW2LTL15a7S4C8NhCrBthsAGSWcmuVxoq1pTh3uTPQi6WR5vFSlbU3OSJergE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852160; c=relaxed/simple;
	bh=1v6DstPxyD7TnEAYfKglbDRmrD9xorEGh9RdZ6oKpqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtLo3qvzUNAeT4YPDmhBBG4p2tghW5N9CA2bRQPA6x828QlG7GzixIKoS3exjmdP71JZV1tGrcMyaoenOysGPQrCF5TefNxmRM0FWz4JpThzNN0Vb0MZEAoRpVc/2MH/7UCZqUJmSSOa1jTC5jxJRT11sMzWBNd2dvg1EPhX2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGgJqv52; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab73e995b5so69150466b.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852157; x=1737456957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mH6fSABIQjQfrOs63h7SZKqORCSvRUauMFwjb1MJz8=;
        b=uGgJqv52UhMObE75Jc/fSZRsMgHItR0fFEOX1EIzJw/HKHrbpa3vyH+fEf+Vi9a75P
         amYch0rMb+SZam4X+Z4IUv9Sklrflb5k3Ls0MzhIgGoKfkRlT9HXtLIypiVDv2deDxk0
         Emhl69oDsAoC0/VMw76bPDqyjFyZK8PcrUjifYN4/AClH+OQh6U1coUAf4H1KPgwuoaW
         hLNkggiVBINCx8ljE2Hmmr+ZzsDilp3vEZ13N/6HQFjqg202u21KfeHWMe5qGQmiTCqP
         W23NnxodXGuRlwsflHCeuqoApKtZk2duZ2OdB7heODnHC/L9MpE8vPgx0JKFDzJR9qk+
         m+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852157; x=1737456957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mH6fSABIQjQfrOs63h7SZKqORCSvRUauMFwjb1MJz8=;
        b=WcXfXStZ23HN9W9bG9AOuAsV+pDC2wz6AtKgneL6horGiZHA1MAJl3m4r8B8fo4cDI
         ZQP4gvJa51uL57LcaFppZDqfswBHg+m/D1JJOHk0N63xV69DGsICPw96za5Wcc+3YzBi
         q7O1FT2gAqELo0+YrU6dWvhiV0u8aXTMBmYBxKLQl0VmDgoLwa9EmGt8p2nOHUjhnh2l
         zACccI4Ed4/mCZpBzF+/NlXnvYqT2frSVWZ+8NuocGQOv4btNzSl3wfLBO3QSPAYFqrH
         cQubu+mc8kRUVqgpITPlO3xFRFthYlZoWdOlOdsZw4q4aCmsEgjgN6QyZl67f7IAspIJ
         3bYA==
X-Forwarded-Encrypted: i=1; AJvYcCVuYRdM1ivIo0DISZqJJNnr5XjBg5PVO45EI/qregjxvdm/LLQZGAGCzxz+30Dlahzfa0N7Lg2lFJeL@vger.kernel.org
X-Gm-Message-State: AOJu0YyIxV5hr4LX5Pc3dcKW2gpeW2a7VC1rH54c+aUzAIvTExxYjtsr
	vQuzMbp/kiabzuPheu2tmA0a7NUNHN1TXSrChU3Urrb0t4A/LujMbLMVasSphHY=
X-Gm-Gg: ASbGncv+Oq3FpvviphMkso4XAC8yYU59U31gXCxGGA53KSLC3eafLV2hP2sGCe33eUs
	N+aPuHJR5/f8YRqd5mAqWPr6M/9YA9+qUMQ0K9DDBg29eymQeErBmybZaXMl3If7aby2wIqZMhg
	fE5XjEqQ4c7AjVQWjQI011STOUZ+rRYmaWu0rgYOSPoByEEKnRqCtBjwks+Ba7rNwGCK+H33mAI
	J3YRznpxEvHkl3TCkU+StDMkGfbkoOf4xPjSHBvGXI/J6kPCwfA+pcJ54Pp+fWfI7YP5iQ=
X-Google-Smtp-Source: AGHT+IHbCyEQI2NTIiulDjFObPlITRIekk3IlqsgCYsJ1jdC7IGpxwnbidGWvk7wts9bxMRn/G9I1g==
X-Received: by 2002:a17:907:72c7:b0:a9e:c430:713d with SMTP id a640c23a62f3a-ab2aa3fc05cmr848583766b.0.1736852156861;
        Tue, 14 Jan 2025 02:55:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564848sm608081066b.125.2025.01.14.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] gpio: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:55:53 +0100
Message-ID: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 3 ++-
 drivers/gpio/gpio-grgpio.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 491b529d25f8..ca3472977431 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -9,6 +9,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 enum gio_reg_index {
 	GIO_REG_ODEN = 0,
@@ -224,7 +225,7 @@ static int brcmstb_gpio_priv_set_wake(struct brcmstb_gpio_priv *priv,
 		ret = disable_irq_wake(priv->parent_wake_irq);
 	if (ret)
 		dev_err(&priv->pdev->dev, "failed to %s wake-up interrupt\n",
-				enable ? "enable" : "disable");
+			str_enable_disable(enable));
 	return ret;
 }
 
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 169f33c41c59..30a0522ae735 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GRGPIO_MAX_NGPIO 32
 
@@ -438,7 +439,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	}
 
 	dev_info(dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
-		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
+		 priv->regs, gc->base, gc->ngpio, str_on_off(priv->domain));
 
 	return 0;
 }
-- 
2.43.0


