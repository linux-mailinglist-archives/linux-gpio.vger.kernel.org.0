Return-Path: <linux-gpio+bounces-20255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B0AB9A54
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 12:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7168B3AF57E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 10:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13750235066;
	Fri, 16 May 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sGl/Y0g3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DA422FF35
	for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392032; cv=none; b=WG4I0lgD4ZgT9lmgTnZPVcRIpig6iWYjWWYma5On7RM7CCsQhtYHMFnNtih0avc9rRvgPxvL4w/4d7f6+gtSaKkBHLXy1l0AaFsbFg3Td6Lfz94JZcZu0OX0ZWgyuaRxpoYxay2ntRT6GiLCGL4b+N9HmUEjewCT36LdTI5FsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392032; c=relaxed/simple;
	bh=fAilwiO7dEF17O9fXmgvqXjSp0ceiL5RFE6YjkH+XWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDIL47YHbUIeFiCfNTxNqYltwU0zzUJ5B2f+9+MEZymvC6w1u1zbdVCGGPg394kZKf/BI/PiW4mFuJmttd1TT98HrSVP2OhfQt5yQwQXxn3IGty6KavTzNC/RI7CR4qs7E5V/2egJEIyLp3CyE1V88niQbxrFYHOxe2q/O43neU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sGl/Y0g3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf848528aso15947295e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747392029; x=1747996829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/D6lYZls2BWjWpZt2g/sTx/5BxVlF4dtuEMmn0jBB0=;
        b=sGl/Y0g3SBdzgomtqh7aAIhIM9+2524vqHynVRriIf0dYgjq/bqsQyuPrc9y/Jn0A5
         PNOIiweLwX588EVl26TrVCGxcim47UqtICay3p7BcMvZmNfqSLCeU8EQI4leqdt01q2V
         xs7cHNb26jpnWTEbZaXXNaST4hlX9cQ6GPgpPZ1WUSItxllS4h1k90H8mBsqnYXKB5qG
         TnjVt2zoslckNDnj9XPd4a/RUbZzow0Yz9ICfvoqlfB7cIT1Y8rWluI0eoBslKDYrKZL
         gg40PMI+njZQ95jQcDepjpA2AgveCzBN8VTDZf90iQsnlgB12ZVYSFeOqatpfnUj7Eji
         pCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392029; x=1747996829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/D6lYZls2BWjWpZt2g/sTx/5BxVlF4dtuEMmn0jBB0=;
        b=MzgZ9j2hFhc20F/3XPAL4vbPNFY1cXwQ9B0aGOBEa9CLBHmZe9GsabERva64bP4VV6
         7EldkMmU387Y6D1WJj6W0wPEfmkQhOCNTvsYY1c1fll0fQm+PPmxLDVwfJssPcFOzFHl
         6H+Qo9dsN2k+MTXmKgJ96rqO6MRjzI7RZV13LM7MhT4yQtv0wLfkkNU98bZ4sKJo7ZIm
         TuRtzKKnCF3vWIAFnXOpF/gT1A2d075dvWip48DDsD53CtOGpHMYcWliYT2BCNUmNmfW
         ouqQ6+mYsTI+joky+SfF4aDu569VhpF0la5NjD0DROxrqHJMTLz6twFsEJy8HRripfwM
         mkzA==
X-Gm-Message-State: AOJu0YyQHJ/mi3M0Ri/EUr5eABS9jVLUVQIlAqlZXMcbun0cJOZCwjIR
	eRNmBemcT/AdjvB2bR+tmS30spmdBCQBFSP1C4c4HZGjBF0bwXPXwm/A1ybXpSloSAg=
X-Gm-Gg: ASbGncujbyqk9xd8PEiS4GxER2BLBdNPovVY3VXKNy6jIy0Ef3aI16GkdhmvwuLhVlk
	3/NElYVcCWBH1Zd5qFXJ6EmBPX+GOsubSokgx9QAcBabo/xkd6yuV+gxYw4W1k/Cl/btGUoHbp2
	kJwkQwW+fZ/Qbocfws5JKUr5S9UzxqOaPQUhJp5pSvBRUFJAuKpLnbkeapbV+r5jjGo0YEuaUK1
	rJ2NT5WUi3+NXrsAxaZKaq0OAo8eRvmaOE8Py38n+qf46mPfB/pj8mhTbliRwjdlDQA+xmTFOaA
	UM9mzc3Js4AAn9v7oFl9vyaaTLyqvIz7jkRiZvplYmggs9SPrnUNKLdgzorZAmAGp2ZsvJ3cs4a
	UMn5QkgMImbHi6RVLV7nT8cV7
X-Google-Smtp-Source: AGHT+IEkveirfZoVjmBNTeL1wlQxfdi/+yuj3FFTnYkHDey8ix0A99YrVgeOzmWXo2/MPNYmRSeKCg==
X-Received: by 2002:a05:600c:4ec6:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442fd950bd4mr25855615e9.11.1747392029382;
        Fri, 16 May 2025 03:40:29 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3369293sm104607025e9.6.2025.05.16.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:40:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Johan Hovold <johan@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: sysfs: add missing mutex_destroy()
Date: Fri, 16 May 2025 12:40:23 +0200
Message-ID: <20250516104023.20561-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We initialize the data->mutex in gpiod_export() but lack the
corresponding mutex_destroy() in gpiod_unexport() causing a resource
leak with mutex debugging enabled. Add the call right before kfreeing
the GPIO data.

Fixes: 6ffcb7971486 ("gpio: sysfs: use per-gpio locking")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4a3aa09dad9d..cd3381a4bc93 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -713,6 +713,7 @@ void gpiod_unexport(struct gpio_desc *desc)
 	}
 
 	put_device(dev);
+	mutex_destroy(&data->mutex);
 	kfree(data);
 }
 EXPORT_SYMBOL_GPL(gpiod_unexport);
-- 
2.45.2


