Return-Path: <linux-gpio+bounces-24260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CAB223E1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 11:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4336E508280
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B905A2EAB6E;
	Tue, 12 Aug 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vNwr9Fg9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3932EB5A7
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992693; cv=none; b=jNOH9keZYdWH3aUKrKxkbPXCnswf27x9LOtztWHRhgu9P64/eYJMHg7dvBsvC8qb7CVlosojfDJb0yY46Rp39rqJ8yDNTQwqmFosjv6v7aXsUH7WSiGZpd24XyCZeL874zk3ESZsOiAam5OrRavqPZOh+KYGLVG5TyFJNsvUIFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992693; c=relaxed/simple;
	bh=vkpZBLTpaIui+7bJpSkDPzFmEy+B6nYwKDayQOON0kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlIZ1LTujJUxiSE8lzxwZXF/IvvuAKOxfSA7eSJBFgyxovDerTmtDycUESHaYmlacBAfU98I/mb7fn57PbBEHFfbtZUN17og1uWdtF+R589bh75fG2b0iIvwSeJ0Ry6sS1touhCHGvK93VAXfLHh27xd2u8ZFg7At/IrSduZx0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vNwr9Fg9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b8de193b60so2974087f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992690; x=1755597490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=vNwr9Fg9ASdJ2y7mf0SLtLU+niqidD1ROg6e47RQ5oFm+bbyOf1JbZdsFb653vi2LU
         BMngENUW/w56TLgK1+VxuTg/Myqt6Gz9wtZk2RNIBebicls5bPNwbhWNkNiC9TjUa7EQ
         zhpuuDchHrjjodRnN6N2feMFKLDATV5OAWv8gNLpO+Pm+U8mQnTybPsfpCjygncFnvSo
         3oAnTf8HWcVwwG87xAq2ERxIjtW2EPQvvA2vPlF219LYkOW9dy5AvyAG1aMU1SNMayK5
         VT1t/+VFTyvhet89Cw286MFqIVwN9/lZxxY9D61LK1zw5RjSIlh/oVJMXFBJ6QYtVaqw
         zvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992690; x=1755597490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knHQSjIWdfCUEPeYoPW7hFKkqoSdgZ12PWpZI20C2uk=;
        b=SPuRnttUdiuJ87ZPnPaGoNHce2WNbNOS4hFn/tjw51D6LTAto/wmOwpt/v74yVbyLf
         BFYIx32fNezHOGDe0YE0lL/RB7zfi+gcc0sjJ3PQH7OcM07j2OJlgM3n2VKPHRXlDCeU
         7IlWInXqEudcyNPPfcfkKPuBXPyF4v0D4tbR1pXckDd0A19m1Mib6H16cznspTySYp8b
         YCu4oBD1HZ6BSzM5pTA3Aq47iWeHVZAQUXJBGgqmnFWjxOzxyFgAcF/KWn+quvu+2LDR
         MsL1QIjEUPcP5XX9+dWZcvMH7gCxXNsczexwWaAwGEdwX7o+KRmSGoNMJI9WPIA1PEDw
         oPqw==
X-Gm-Message-State: AOJu0YzjJGggj+ADHi3ZzuHqQ1mZaUlqpzHV5Ynll5fC351yadlD6X8M
	uPdQvBP1sUmSYCgWK/XdCjipama/bmpOh1PwLfzv486X1YF3E5zLCQLNpJmL0Mf7OXE=
X-Gm-Gg: ASbGncuE8Tvj768DQWD3ae7UaprbJOl07AqjBGoduaJG+A8vreBOsQ3w7NXdcD4jwiE
	wB5weCp+8HEt72QPiso8f7dDYGTOkZGfvcrc7+xTNqu98y56fASdaq6nNC3pvif+nDoJS3bxD9U
	Z/MS4fSerPVEM5278HOG6VGv4nHDUwigWf0nyAHr12SwrmzyWjE/IB98HuN1/slj2hORKqky9ev
	0kjXP9DbQyWmEXx483iCboZl+aSWs4MM6vXUeWZwvlQKjoWdYefwQhFDOAV00k2WJA0Q7+nNRGB
	F7pFJMQNZ3IFHBpk/nDerhYLyR9tPcZ/n7VXwY6r06Wzt39MfpBAUANtAZwDCDup71NmvY5L08N
	7LApipeZvNKrCJg==
X-Google-Smtp-Source: AGHT+IH0M4qhHyixl1sHu6hz4NKhfeVB0xMfjQlXchVhABld6egJ7JJlOcxAZFgYJyv4JKK7t9p/Xw==
X-Received: by 2002:a05:6000:2911:b0:3b7:8d70:ed05 with SMTP id ffacd0b85a97d-3b910fdb8fcmr2680550f8f.5.1754992690144;
        Tue, 12 Aug 2025 02:58:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:57 +0200
Subject: [PATCH RESEND 02/14] gpio: generic: provide helpers for reading
 and writing registers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-2-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OZyZWSGy8uPs2UaDZUWXQTJ09CV/XrDYoRGt1dr0Y80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmVNtFfsvUL8cpCyXfyREmONGjZEbamoSN4
 XtnK4eTph6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cr9lEACr0Kaw3cWn9laijJ2cSbRn9TnZUAFO7gbdE3yAQS+HGT2kObHSadptmhX5Y8r0mGZ38rZ
 lAdzts2EpWHWskB68dYpDPYQ2YuZgYQMVHaC0PW7Z5bLkdR9ajiI8kCn/pTu4K41tnswkjuq4yS
 lSt/aOMsH+8sHJT/cEdoyK4ilN9AJqivJkCkXj0bipYhh30RzxPeogUrpBuNdaOXEADxQpRSdqb
 ZgXhtJE9IwgHrwuhRYTg8MiXiDwODsNm+UP8ztOlKuXL1fFatIA7jNwGYjT7InUND4XMcHXymgd
 MJn4853D+trN1ksjSlt13Uyhe6X9/JJBEm2WKeY2vvVQnFt55+0Ov0lIOkZbAoaGKNuPMQyTroR
 dj4GmT7Au8MQSBLtg5gdD318vEC2P+U2P+9KJMVEj5EpIupf1Y0nbwIulcjRil1oeJLnn51a0V9
 ExZeIfr5vNKmrZYaqV/yesPb9QmPSFioUNdaToJ/vfI+1T5kiUvIdxeFvRTf1vmnYeer3MN/16I
 ftCoPPU1lGwZkAoRYOklHyC6xl5hpyhID76HPkBxsO2mf7gXkxej+SUk/SCd3FxYqhBlqddQeqR
 3pDf5Xe5KVfIBUNfK6Gloeed0L6D71q6vbkpWuWIntJMkweYSLy+kaCxd7ovceaUTbxOUklPRZY
 w/JuvxlrocgR9ww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide helpers wrapping the read_reg() and write_reg() callbacks of the
generic GPIO API that are called directly by many users. This is done to
hide their implementation ahead of moving them into the separate generic
GPIO struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index 5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4..4c0626b53ec90388a034bc7797eefa53e7ea064e 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -100,6 +100,37 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 	return chip->gc.set(&chip->gc, offset, value);
 }
 
+/**
+ * gpio_generic_read_reg() - Read a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to read.
+ *
+ * Returns: value read from register.
+ */
+static inline unsigned long
+gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
+{
+	if (WARN_ON(!chip->gc.read_reg))
+		return 0;
+
+	return chip->gc.read_reg(reg);
+}
+
+/**
+ * gpio_generic_write_reg() - Write a register using the underlying callback.
+ * @chip: Generic GPIO chip to use.
+ * @reg: Register to write to.
+ * @val: New value to write.
+ */
+static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
+					  void __iomem *reg, unsigned long val)
+{
+	if (WARN_ON(!chip->gc.write_reg))
+		return;
+
+	chip->gc.write_reg(reg, val);
+}
+
 #define gpio_generic_chip_lock(gen_gc) \
 	raw_spin_lock(&(gen_gc)->gc.bgpio_lock)
 

-- 
2.48.1


