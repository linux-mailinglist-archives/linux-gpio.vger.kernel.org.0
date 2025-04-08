Return-Path: <linux-gpio+bounces-18432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DFA7F624
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B4E3BB5C3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32922263F23;
	Tue,  8 Apr 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="quGaDhoC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4802638B6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096881; cv=none; b=Ck9mxgL74LCLZuDjlLjxaqrrc0aM1Ys7EpCu4YijYROyXgSS9EIUWtatexNVdCPL1Lb3qTpa3o8PZ6q67Qq1bMfAzxTbqzhhmrO5+5+qXD4+agyfbHeyvxfSWS29YrphtUzbeimx6aHUQ+j0/KrmEBYcLtsFPdtjF8V9AzmWEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096881; c=relaxed/simple;
	bh=4s0EUcwB+s1Xq3ZkAByVjtUfgJ3yw9YYZaLLaWHs2rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWJUZhC9FwOgD5U+RLGn5h2u1+aRDD00Hr0nkD+qREDBCIAOoOJ3YdvcuKo1JMBzUmOxToGISirbJGbB/7rW9ircK0omuY8EuSMPj0fSvFO9/4/d6gZdkZFX3CCct/OLEGRd5QQdjp51CDvt7iHyku5BH8/C1kkNwCPP0m2Cgbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=quGaDhoC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so22912025e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096877; x=1744701677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvshZe5PSemjV/2XZOVRqNiaOz/McPkdhU5QyFybI6E=;
        b=quGaDhoCHE9RbEo1BVmtUoW/KmBnoNsw4d2HaTG0Qiywvn0htviUTe3C3zuk1GaFsK
         eHmjhxisq0udmrrIKbRbObXxQ/IbkSFsCWVz+g1LIzMy5FumT7CjKhbthO0CAgtH+zWf
         19VAqvoiVDwkroocVCqGV3683gAHp1k7lEPD0BXrPzqmOFkBoHWGqGE/1UkWcpw6zeDu
         doDzaLNoiwIZM1dNZkz2gFTMEXjN9yMfxYxAFmXG3PgQMHNy2MDdBKvf6E5umxoFoz0e
         T6tmmtbb1sySOwIaZkLFkBZCeJqzdLqh7ClE4PLCnRLQcdwtnnI/3I17BHUerpS3p0Va
         FoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096877; x=1744701677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvshZe5PSemjV/2XZOVRqNiaOz/McPkdhU5QyFybI6E=;
        b=L7SiWQGSai3RKKk7Pa2FqnvVM8rQHk5m6BagyA+8a0LLB+ALfmlqYtU2xFlnuzXurD
         Ts5NM8tDVdPLcOZsts2uKiEI8y39+Of8SXtivdoh2bza2dce6bWWFBFhwv/E83uxw3c5
         5lVvJ7Ljn2m39/dwYC0zIzNA8nOvGEP9b4MBy4ldT2jOBiak8hiIDOI1fCfcy1/sX8J0
         NwkXGjkV7+6JGL4zdefqW8dvmQ9lWFpzljikcoQSYvLfITu+Z6Cyt1sdetbPINWvTLis
         Qoq20M1T0W42VwNLf3336rucA8d7PF4EHJYb+4yikcc6gCCjG+5F0t/37IZq11sGHZNq
         CJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUWokS/YOzi/Ty1H+28qKfQA2s6mKsGcPGwdKdeE0zJPYbfj0hXg2OnrPFihGK80uPAz1rpcskL4g07@vger.kernel.org
X-Gm-Message-State: AOJu0YyPTwRoq2AKkg+TxJTQCjPC1bTH4N0Z2bFJ0mkUWyngc0xonYTC
	OQc064yGNOvoLegY1NhqBboHbVs8a1ut/18JZY9L6QGIlqrb4DUrOmJkgIqaXWvEybQg6Pf6DRN
	5r28=
X-Gm-Gg: ASbGnctTRB7UWvMyST07klVTTXJpqBVAG/LkmJMeWowW/V0wiYn4Zpuaibisco3YErW
	2/I9rZel9TAaxmXULvR3JgTnnvpc5htSjt0nXz9vMUo3tDxlpZjaOkW8HQ5nSOKxAfGF+6IlVMR
	dZTKrQ/k6xbUPJwyPIvTumWJy0wmm5qp3Q0LE33D4ZBTy/l7YCSru71jtihRnH1yZmTI3jEv/VG
	MUnzMmFxv+L2itUbNwi1bimkdbX8/h2W9lO6cPsXv3jI7ARw7PQVzxhcBzOyiVfl/LymKIz+xC9
	QDdlLRUcym/1mzoRCc1KsUivhuKX4/HE2MOXcw==
X-Google-Smtp-Source: AGHT+IGrW4uYgQjk5NoZkfCg5Q4JZQulnqw+Rx7LKQ7tq7TOQnOVz0pPCRyGYatMVBjG1AXtl+w6yw==
X-Received: by 2002:a05:600c:1553:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43ecf8d24dbmr138973775e9.15.1744096877570;
        Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:13 +0200
Subject: [PATCH 5/5] powerpc: 8xx/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-5-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j7/vT2sqk3w0eq9R3JA6vJfjNNyoaO3ADhKnGJw1wQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5nw+RlBM7GRxu/xO7Dk2MaKAuqw17eaEkTq
 XAGkLPLyfuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZwAKCRARpy6gFHHX
 ctefD/9qKiesq1chihFiqBhxfgS5v/Ytom4gLe+8YrTB+nRv7zmH8mj621N8fmJEbmW4PziTnaC
 vseQz//WwbagqW+fKFpYGuCiAkZXD4qUxW1vkLOhI7yt0C56r8TBtz4knXs3tTi/hqp2+ipJWgX
 UVXU9RFrMW0oUnHD2IwDauVEQbv9YoRr3gfIruX2Jfin+8P3yNoHLKEv3t5jQ6ewz8qH8LPwodY
 yCpL0ONxgxBy8fc7de+R6lduiUbdf3fPTwkoWK1QAkR/AUfy+Ni8/XAdJOIw2wdnWgDQRKYF+ER
 cjAWXp/TWSAgCAlZG3yKF1skJJOT6Blym2rjQZ8rrOSppsjkPKZnOeo9Y3x7TBzP7CViN/RA3HG
 bNyL9Ie92Cb4W4sSw51ovD0kquBZmhMSoS0kOhM3ojN36mrccJ80rNzoxdbyXSf7uUqH7/ntBXM
 NPh0rmGrYqwlSh+jhXcsZriiy46/LsMHpY7pQydNt7l8Wo9BGHg9SQAu2J4d4JxMtGb5l5R1UL0
 8/k2a6xn6UmqcZdk/PR6QWHHxARvz3jgR8F/ypWXfvC9nPns2Bf8mJStATofB5n1rDgOKeLvomB
 dV7fXkj7MYSi07D2C+6gI9xd+WtEvQT9lspoQyQEV0Q7eWLUuAeISFqApvAq7AhAWHdcwsXfXgV
 C2BzXkHLmqZ5Ogg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 1dc095ad48fc..7462c221115c 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -417,7 +417,7 @@ static void __cpm1_gpio16_set(struct cpm1_gpio16_chip *cpm1_gc, u16 pin_mask, in
 	out_be16(&iop->dat, cpm1_gc->cpdata);
 }
 
-static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct cpm1_gpio16_chip *cpm1_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -428,6 +428,8 @@ static void cpm1_gpio16_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm1_gpio16_set(cpm1_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm1_gpio16_to_irq(struct gpio_chip *gc, unsigned int gpio)
@@ -497,7 +499,7 @@ int cpm1_gpiochip_add16(struct device *dev)
 	gc->direction_input = cpm1_gpio16_dir_in;
 	gc->direction_output = cpm1_gpio16_dir_out;
 	gc->get = cpm1_gpio16_get;
-	gc->set = cpm1_gpio16_set;
+	gc->set_rv = cpm1_gpio16_set;
 	gc->to_irq = cpm1_gpio16_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
@@ -554,7 +556,7 @@ static void __cpm1_gpio32_set(struct cpm1_gpio32_chip *cpm1_gc, u32 pin_mask, in
 	out_be32(&iop->dat, cpm1_gc->cpdata);
 }
 
-static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct cpm1_gpio32_chip *cpm1_gc = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -565,6 +567,8 @@ static void cpm1_gpio32_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	__cpm1_gpio32_set(cpm1_gc, pin_mask, value);
 
 	spin_unlock_irqrestore(&cpm1_gc->lock, flags);
+
+	return 0;
 }
 
 static int cpm1_gpio32_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -618,7 +622,7 @@ int cpm1_gpiochip_add32(struct device *dev)
 	gc->direction_input = cpm1_gpio32_dir_in;
 	gc->direction_output = cpm1_gpio32_dir_out;
 	gc->get = cpm1_gpio32_get;
-	gc->set = cpm1_gpio32_set;
+	gc->set_rv = cpm1_gpio32_set;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 

-- 
2.45.2


