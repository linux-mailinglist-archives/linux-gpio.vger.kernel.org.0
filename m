Return-Path: <linux-gpio+bounces-11827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101C9AC1CD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFF39B21C62
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE5D15B119;
	Wed, 23 Oct 2024 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSIIW/u/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECE15A848
	for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672560; cv=none; b=Bpve6V4Zr0AS8bulLe3ekRe5zrUCcJaxIt4vybWI2qUZJXDW8MG/wyc8srQuGmC1A0irRCAMDLCpTNBNTCrUdahxCy7prOdgLa5tn1RRFwJWdWcbD/nWhAf9eP5qOsgORnEr3jA31tC8pTi2V863hgfZG7qNDGnrj3juHpfTUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672560; c=relaxed/simple;
	bh=XANjDqllGmT7dZD62JTbxNbSLbnFk78EEE3Fi0qytB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+zWHZWLIZOae7qJcrRUtX2A9sx0Yu25CbrXDsnthL9g2EDEyQP57XO6zks7yKrmB1lrY732/j+Vcwa6OxHKDtH4/C4BdCO7HK9m/xtWE9Sq+pni/zUUXuCc+4lsNH8hUza275kHua6LTsvTTELcN7Qx+qO5rWRMyWM7i77pA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSIIW/u/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d51055097so4780546f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672557; x=1730277357; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4seAZLeLBao+DULFomE/haJsRyhT59WrLGt3SlbZ7o=;
        b=vSIIW/u/qTlmnv7yorcsVTR83ovEOTzX72z9osFIk7dTCZ67lzuVelpFCvqh7AgpO+
         zq7mjH47j+0zDS0nzyldaAH4WOLP2NS+i/UYq9icSytiVe47Nma3v24kE31YUW7UCpcb
         gjUnqYhxtCdQOZ0d8YNiMv2wcODmsHrBpAjBj3ydjJk1gCXU4vcUuSp0hvCOBuP89Th4
         G1r/1Rhs0EpbtB8UQCFerCgLJpwX7RUjC6Qsnvqd9wkwqp4nUgW2mRPgLxux0s5ThtBJ
         FcgqMy5+iRk2+KxE+WGj0aE0r6KGEgUnvbeGDWRk6zjJqCxyvtEcpL0Fbuq+3Mt5paxy
         vgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672557; x=1730277357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4seAZLeLBao+DULFomE/haJsRyhT59WrLGt3SlbZ7o=;
        b=vEOAYWavIq1uxenpaV49hfrI3o1UDEF1YkZ188ntwYhfz3W47lNs9lCZQMxAIuR3GY
         Zl+5btxecGOUNnW5/s/C/Kq1oW+yNnLMcnwsoeZcjubdUKku5S0sF09qDPGc9z2gceGq
         oyghSkGd2cMis+NSk++eCu+ykYwhvaJoMPZIFaSs5II8SriT0uFkF08uDrI4jvgg/TSw
         LJk9n8by49weOzvCpaYHYiW+LeZUP61WmRAZcx2Sy0RCxm4M1S2ik7iDeIhATILp9P4h
         50vgjFyIGhTFu776ioaqO8lCSc+3bwfQRkrOGyUbsB27pnXqZ6v8Pl0YXQWhBk6xjKs5
         h14A==
X-Forwarded-Encrypted: i=1; AJvYcCUKPUoyaFA4Ypc9Pz4LnpxdVnUsxq3SszWXutuAKcuC63T67iXs6Rt7pvOcattSlqHrmSsvfESKAZvz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7WBs+I+Ge3FN4xIWjxv5ex1j+6CFkF5jRVVpPuDHgFL7v3m5
	UK2l90dlgJrWXql12nPZCEjvtEuz3OBp8r7Vbu+FE8MsW8jygrL/6fA2YXl/Jag=
X-Google-Smtp-Source: AGHT+IGmggNRvQKAbAwZYa2Tm9b8tKfGWsofERa1h409m9EsubrlrhCiuo5ez/BbwM2CoYy92SzKew==
X-Received: by 2002:a5d:55cc:0:b0:37d:4e80:516 with SMTP id ffacd0b85a97d-37efcf1fe4cmr1093598f8f.34.1729672557127;
        Wed, 23 Oct 2024 01:35:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a583edsm8359536f8f.49.2024.10.23.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:35:56 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:35:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: mb86s7x: remove some dead code in mb86s70_gpio_to_irq()
Message-ID: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_irq() function never returns zero so delete this check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I have written more about the history of platform_get_irq() on my blog:
https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

 drivers/gpio/gpio-mb86s7x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7efc9fc6f4cd..7ee891ef6905 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -145,8 +145,6 @@ static int mb86s70_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 		irq = platform_get_irq(to_platform_device(gc->parent), index);
 		if (irq < 0)
 			return irq;
-		if (irq == 0)
-			break;
 		if (irq_get_irq_data(irq)->hwirq == offset)
 			return irq;
 	}
-- 
2.45.2


