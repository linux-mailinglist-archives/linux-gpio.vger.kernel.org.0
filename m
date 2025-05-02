Return-Path: <linux-gpio+bounces-19539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64CAA6D71
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 137A2468027
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A50266EF9;
	Fri,  2 May 2025 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z9ZuIjRZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6AE24678B
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176400; cv=none; b=s7xrUT1cS/UzEHk1AgqLi5gpghxXkl8/dQj7ELZJF9x1gIJmSHVGITwUSHVMVKe9Uqzv3B2RG4cSbyPSPEg+GkWv+JHR/eoyK0dauIhenOayD3VsNzDnp43OEsN6bytwjXwI7PqJo8LpYNqBnFCi7uewm3MVTaSCfkOUw9XLpkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176400; c=relaxed/simple;
	bh=Egk/9E5ZxXweQ5hfkjs+LpwhSx/DNw0XG5a3yhVLRU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNabyo+MamPQBc91+f6G7e/Y/y8Dg7o/hyAHaGWg7KPM003mvwsoHtRXjJof+oNP7zTX/lnshAs6T0Lz8EFO1PNpw+PzrwRsb27S4G/Zjuui6qdSZFyebdJX9U3lI0g2AnH//6HY3Mly8eovhrjGN5c2giil9WWq5FZqFbEM0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z9ZuIjRZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac56756f6so1783535f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176396; x=1746781196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSI3W4dK/WwCbr7Lai4Hip7w1X1W5KMNJkBGonHTT7k=;
        b=z9ZuIjRZdtrqqXOjwFsvcZ2AcJnFgJN0jd3txiQeJkYa2fl8LlCs72DMSpODFLHQ2Y
         EQJThduEP6OVhifwmV0/ytl1MHQqYw7G160EYlWELGicuP8qISW2Ngwd5uRvhfKkdI6X
         eqUaJ7S+Lw3iuuev8YnVAQCTLUfnLR06AdhBuaOud6FIR8tPtD+g9Wp6sBCRqo5y2XGL
         VpWhX/2CO3pYhmP2abudGZrX+Q7NvfnnD2h+x2+QJT2KgtOXxJiqfhQ6BOxwxu83x8EU
         sLiklXxnPeXbmdDsYRS5kkqbtYl3LhLI1WhRmqAdCV94ogT5nhopCEj2oBwEfA3BNSRN
         Hm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176396; x=1746781196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSI3W4dK/WwCbr7Lai4Hip7w1X1W5KMNJkBGonHTT7k=;
        b=ge+5LySVEAvyQZdXxfk3KHFpXrZC/dbCkECb6pQxMSJHxCHFNsAIcRAsYxggNnWePF
         r943S6unArADD7/WguzGC+WpzzEfWN7WoTeIQIHN0dV5bQGyVYwK8FpM34gq9InA6uuj
         Ij0pBGjW/93dD47m7dzRQIEgTFs4lV8sONekhu2WkqUJbCn5QYjlF6xifdkkA+ootvEl
         PaLUUUpeO2Wrj0QmF8+0R3mGjc/4Jdxhpmk6ZhFzYi0kpL7VFbrYK7+dAgXv9tkDW5Er
         kNvjw+4R62lEZQ3/N7X7JlnT8jQmFhWRr+76fYPetVaMJXlKxwhMr1QPmJ4pUJLJY6mw
         XRgw==
X-Forwarded-Encrypted: i=1; AJvYcCX+RoG4TSMRjgBWDMCoYVIs4E0fL5gg6E3DX6geFmhkQBXK6SFKlCF2QHwiJZVws8h34Apv/l/1ughS@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwNbNXRKxNPLEQXLnLZZ6mB0FEcbuu7ZORLHlAuIwbINGxTXr
	xyvbEyVJcOq5hkIypvVbLwCtFpnYUbdZINnGj8pmYCPXuzns4uyJPLcE5R9H4UM7WKKevDrVH0Z
	AR1Y=
X-Gm-Gg: ASbGncsYV8R/ff/gjG+Jolmb01gNzRQq2m43Q/NeQndk8ElyAeW41gsHgiAs8mTRlzQ
	BtB8t6LZNN5zCo2Xt6o2Pj43my5y+tUPiTGNCAdvTD7yuthg/Uo58pfe6CpR0LEB/ND8rDDOlPo
	/LMa19t0WBkjg5vNraBrsh+FbizGF2EtWa840xPjslD+bUW8uuuUGIUZfQcr/uuH12kBgBZxBeY
	Qd5za03Gz4YwqFQfjZHZbxm6xNfe8pXSa1BGPG0FVVlruVTJpwTK1Ic4g6pXXW+ER6RB+6QVPCk
	SFnGNqf6/eByztSL1slKVrLnt1Yq2RY9Abc=
X-Google-Smtp-Source: AGHT+IGiehs+dD7NKpB0E1UYkHMJciB0IWOavCbaCxYmeUmt6Jp8ux4E08zw+1Zf98nIRF7Zf+GcJw==
X-Received: by 2002:a05:6000:40db:b0:39c:16a0:fef4 with SMTP id ffacd0b85a97d-3a099ad938amr1319909f8f.24.1746176396315;
        Fri, 02 May 2025 01:59:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:51 +0200
Subject: [PATCH v2 5/5] powerpc: 8xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-5-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2792;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9v+4cP+N9Ekqaku8fyOt8CZXpH5ZitQiy924EVCXv2U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFV/zBpGNUkKObJQaO/c0oYX+Tv8vDmyzil
 Ug9qJCMkCaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 cksyD/0X+tJgjUPnAxn6EKf2Z9j6fWFPc1+1uIKAzbRceI+1oKELBb+otB64CIoIihXVwVt+92J
 WeO19V0+Q29RtvslOqkQNdyaazX264hPpEVN8oz1ebZeYkL/64AqoDjaNARKDenLURsrj4U1/pU
 0kWP1TXJbkSzEF7AqAb61kqeUAUwZYly/MdL5dmZ22GLohEG0hswU5X+AdQNTKkE8ttWrDLa6UB
 kXHTvmo2g5VKATg+9ctmhcZVjPTh6V50TbHJjz6gIfiMm8MZ7fgq1nwUnPn3AZ9DmgVWUBSTr+G
 +4w1oBrnlQmLS6+E39xkCSdXzDf4mIsZvk+/hPGjJLuDDRUsq8/J72Ccaf4QdcBEFpu/cRvKqs+
 Yi7STBrE5AgPkb0Qi189KebD0770ZU3saX9T0465ZSptxEPKu6NQSEpNnQLkN0QtIXsdNwo+h0g
 dXwPYZFx8kfep4AaIUcQK7dyk1KxsYlXOX8LazI62jiefMNyZkSll17/le6ayiMq3T+XvP54Jjm
 CB18WGR6nLuckcRgDOrY5pEMBYi1OXrefhwoqGEP2fP0VRRNYKAwMeR08IBkQLSWiGoK+ac+KEY
 Zv9O1H0+iu013fq2RDlItUKlG11ZDRJEcxARbfWkfW86nInRiCQLl8ywo6Ao8toT9XekBZLcwKp
 IzoHr5MPIAiB0ig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # powerpc 8xx
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/8xx/cpm1.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 1dc095ad48fcf..7462c221115cb 100644
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


