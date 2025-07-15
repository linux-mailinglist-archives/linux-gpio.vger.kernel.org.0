Return-Path: <linux-gpio+bounces-23304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C68B063B0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5911E1AA7777
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 16:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB57269AFB;
	Tue, 15 Jul 2025 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZyPA/cy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A925DB0D
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595226; cv=none; b=XFt1PqluXqq3+msd1ZXK0JGMdb7ZpFZPKUj18eDSct3AnpGCvlYeV+pNEJhUn6BgQOhkr5uneWDDKftFBT6A3SBpsaGvXIKidMcGvyZLsbD16pBx46V3CPI2ALjQRnopm3+uy+KVBblfrXdOV4RzDQ44XXJBQY3onNRCODEuF5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595226; c=relaxed/simple;
	bh=FwKGIknOxh+BYltp8SEk1LfHTMUv5L9w2TSo790jjZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qfIAj8sVuIyagbbxuMAWKetXiFlpDWuOb1tls8av5u5cAXXvxbV/nsHn+ve7w1wk12zKfC+Kr3TAV3r0IBUfXRB9LvBKfsd7gjr3OYbTlmmt6C7mNTxVRJBAbXVPiEOkkBKqwWf6+rMmf0iHP4s6azFQTTmCHdpDIVaxvOeCZ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZyPA/cy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so885082966b.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752595222; x=1753200022; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aId3DDFPGB+h3w+ON2qqdC58+WHMZoja6dA/P+9SekE=;
        b=iZyPA/cydMewOA+GtDKICPh5g9lijnMCOw1JgUETou7Qhx7NscwzV0+3PeQsWIkq28
         Ia7sNszKkTbQBhrPZ6FazqWBB/zr/Tc0nwSc+rcgYiW8ECBrpbF9GOBdqjCncukNbQa7
         U8Jwlq6MxMj+aQewiyL5r2DFbH/K3JU456UqqoDWZQl9gR04YifiC2TRon5NJfvovJrT
         Xrbt5WTw+8j+69pTl4rRrFfyqBODNz2pDhreo/6MRTXLPjCejsD5rFJCD8Exe9jBTLhl
         NKeXA/iy+CX8vAgWzqS4/TUEUqlPZbwArXbe9KkbfhNamY38ZnrJ06BbaPycE++hHG51
         xTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595222; x=1753200022;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aId3DDFPGB+h3w+ON2qqdC58+WHMZoja6dA/P+9SekE=;
        b=ESnJgJZagpCQyRIY5UlZX5cmirwFYHIyuYrgTur7SZu8C3uvTmCp6nDNlKGNX7XNPL
         mLDOvS12IbAqvvnNuY85DvcDj4M+nPUBXDs9TWaXcizW3aUibHk5RKWk4DghNs75b1HP
         5xvN8BNZbyQBN8FMnk1qHjuYquAXForoDrmY3nxTkhjDxILdB+YEpHDkNUOnYnrRU79G
         hzFXhZIDg5wTJOMNkjhwOMebu0DQwFZ8xDV/ezWmBQ9GZp5HihV9YfEZMkYOXzmk5kEg
         egHKGyGMFYDeYoYAHacWvIpJF8ge44OhYHZrFwhhDs3o0xlIATo51GZcOkh6GrRwHfXK
         lyFg==
X-Forwarded-Encrypted: i=1; AJvYcCWmCYqdG6DziReiAguMIRMBTJq5XAdw1sDcF5TD6ngCJf1UyZMfu6Q/0iVR6HygLN9a5z1XMFpXMlY+@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/gyOqlAb0Lw9P2x3UIT2IPG8EvZmfZfZ2G+oA0T6VIoiKbOX
	nqsV2lx3q/EdyKsOmzcgNzJMYegyJIIH4iYSgsnyKi2q1W+IX6V8J9m0uZNvCM0rzuY=
X-Gm-Gg: ASbGncsYk8X/q7jbw/57Pjn9saaQ4ScS0MN/Wawo13RO4k85WMcsGB3Br85vxWIDhRQ
	Qf7SqpsEnhNsllrC8QU3pqDYgFp1NhShZWHK3oLeVkNypKoHq86loeDWJZUFEN0MmMkBWZvhCF9
	7d0PowBZzbQZ5jrt9HybU2oVvi5OOXZAbDaFpKTIa/fVIVoxdV4kcdcyXXIX3e69Zt3sFgsYYNG
	QQ2azFdit4HpjyMjZqRgAkkjUEk98dKOvUIvGbVkt9Q8Uf/y68o+3cxPbSYHPB6UE2SL9d041Mo
	eymUGmi9oP0oLIEDkf08ZeCZy+Qi47TNHdKBqbD04LxJqpYXU+YCQc8uQMNQZGuhuY0pmGkK8DH
	jqDSAV5huKL2mUp6qRXQ5eGfBrJiBD4/BqnQM4UnAStb/O3jDuYmgXtGx7sKaPqLL3vqxZds7QZ
	lfmO7+pA==
X-Google-Smtp-Source: AGHT+IG51AKX9vFVkuBm1+00mt3i3tOzwFI86M/7QAJodoZVtCy6p4XzXzhIC5eR6zzOJKjCXuCpUw==
X-Received: by 2002:a17:907:7241:b0:ad8:9257:573a with SMTP id a640c23a62f3a-ae9c99825b2mr1392666b.5.1752595222422;
        Tue, 15 Jul 2025 09:00:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7f15803sm1024949166b.70.2025.07.15.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:00:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 15 Jul 2025 17:00:20 +0100
Subject: [PATCH] gpiolib: devres: release GPIOs in devm_gpiod_put_array()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250715-gpiolib-devres-put-array-fix-v1-1-970d82a8c887@linaro.org>
X-B4-Tracking: v=1; b=H4sIABN7dmgC/x3MQQqEMAxA0atI1gZapTrMVcRFNVEDoiVVUcS7W
 1y+v/g3RFbhCP/sBuVDoqxLgs0z6Ce/jIxCyVCYwpnaOhyDrLN0SHwoRwz7hl7VXzjIiVR1ZeX
 Ik7E/SIugnPK3b9rneQEFZRBUbgAAAA==
X-Change-ID: 20250715-gpiolib-devres-put-array-fix-d6b365dad018
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

devm_gpiod_put_array() is meant to undo the effects of
devm_gpiod_get_array() - in particular, it should release the GPIOs
contained in the array acquired with the latter. It is meant to be the
resource-managed version of gpiod_put_array(), and it should behave
similar to the non-array version devm_gpiod_put().

Since commit d1d52c6622a6 ("gpiolib: devres: Finish the conversion to
use devm_add_action()") it doesn't do that anymore, it just removes the
devres action and frees associated memory, but it doesn't actually
release the GPIOs.

Fix by switching from devm_remove_action() to devm_release_action(),
which will in addition invoke the action to release the GPIOs.

Fixes: d1d52c6622a6 ("gpiolib: devres: Finish the conversion to use devm_add_action()")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 4d5f83b17624eed04039b94ca6d095fea293e5cc..72422c5db3641e5609759e82ac2ab532fab81783 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -319,7 +319,7 @@ EXPORT_SYMBOL_GPL(devm_gpiod_unhinge);
  */
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
 {
-	devm_remove_action(dev, devm_gpiod_release_array, descs);
+	devm_release_action(dev, devm_gpiod_release_array, descs);
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 

---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250715-gpiolib-devres-put-array-fix-d6b365dad018

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


