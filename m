Return-Path: <linux-gpio+bounces-15471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1BA2AF3D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A21516641B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 17:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCBA195B1A;
	Thu,  6 Feb 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLGQIIR0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CF16DC3C;
	Thu,  6 Feb 2025 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863970; cv=none; b=dLBi9FaXPP/f6dfK99dRSjLTz7LL1+6qG6MLBxUHst10ih9yi3R3s3XrIEl8atoDKWQNkEfb+HZR5hqpxO7Fq+bmEMBCUPUVNZIIuULjfLFepVRq72Qgs+PQkcFQUp566RtcCWvA7xn7uOGRH1j/a+5wc7W2RlMAXZKgDDjEkOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863970; c=relaxed/simple;
	bh=e6z5hqNT0gQo54YOk9KBRWo9PEmYnElscPakpAmN8EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dt+gyDl54+r+kJ9q0xxw+elDFb4fbnZvVHMNgubvY8gkvXpPKcleMGXk2aRZcxLvTum5wP4cvUtAY+s4Qq7q4VXJExAJ8Y/vlvJ395iaVsYNr8LumHjeA5HqZes3ozqD6GoiRjzsY+CVyXvs2B1KJ8xj3yLWO+ZM3TvY5QoMOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLGQIIR0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso219985566b.1;
        Thu, 06 Feb 2025 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738863967; x=1739468767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nk48HT4gjguNHKE3jKZZPcvV2dSdPLlROj+zqkSuZCg=;
        b=BLGQIIR0FyeADBtVt2V6K97RnkWQOStkERl/2bwnR3fbicccYnWgqpO11rpl5IdIU4
         9W9oa6AqlVNsqPlohNFBmY3L2BNXic21BW1Oug3YbFVsr94PL5+KUT65eB4Xj/K/rpGN
         XaQQmJCn7MYMTNyvh72jEwQr6GmEJVOl71OWa2IttLm2s1bAcMIi+T2iiw7L9M+E/9Xu
         aCD5FvWPpxHxYzUNXaAfZ1pDpfCX3d7K5xG1DFuBFJyiAzGHZQSDUkM/kUXwReKr7v5N
         rDI/yrfC9DLiJmXJE0kAWqYu+XCOZE+js8NhZsfXLXD5eITH/muXP6wR53PZsZWwJfUW
         +yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863967; x=1739468767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk48HT4gjguNHKE3jKZZPcvV2dSdPLlROj+zqkSuZCg=;
        b=UyWgd4fGuhuAg9hrHgfYURqVgsmjnO9sO9i32amu1F5gndBdbkXX84qnalRIjBigEE
         p2cP46eGQ+ELzf0F6gEIMX3QgZrX1/Mn7h8s0kQ6r9wXU1DbUo6PnLlpLmZckfNNXRom
         mop3Mu8voRPjPikSqHHbSIBy2EO0TX6ZTDFs3QFQ/s9yKqQI9jZrS5t1Qrju7uq6jQ59
         r/sKbsYzP3uGd4o3fVfFO+a27nccb0IX1C88Cc+XNlT3DiKlh8jdEo058kQKbKbsajGL
         KsFrERCMV5I5UmLxoAD01yy+kY2xUpSg8aGR+rdz3U/rB9SwPYTAkf0Gc98actA9Hak3
         hbaA==
X-Forwarded-Encrypted: i=1; AJvYcCWXvFqBED2u1Y5dFWA4A/+bRNtoyCquM6MeqnD1c7e7Hz5+nJP+g/8nQwCy0daNsL1nWcaHk+Ov2L1wawY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofRoLJ43PgPpr14T0T4t6N0oj+pGleGDzNhkHRMi+h+YxveSe
	MUrVSel3hoxPOhZJpL4SLsf+HAir/clJFzrbSpd//2yNu1SPBonP
X-Gm-Gg: ASbGncsZucq9IGdZuafsJaAIbEMRBgbRiV42+fYE3AWschajDLhGt6KymQv0qzK2r9n
	fLgzJml9MdaL0Q500z+UTVX1jere16iyVPtNe7uVX02pjROIueZdY9Fym4Lg43VISkrXzOOQHZq
	xRXEBC0arH/SA+QjF71bH/hBWh1y4p6uv3OThT/yj8U7w0X2WIHS/3TTjtIsUJN9Xo3ioihVCvY
	1h7BJgjBicdPYybj/9zVwkwR82xJ/VUoUNgwWPg1pAwi9pyKRoC0fmVMOBQysKh+BXaxQf/IRTl
	wymXlvRa8PqN5eqgErpgdXr7ufoNX+wzqufTkrJXJ2wzREYt18OQhh0M
X-Google-Smtp-Source: AGHT+IGVLStKYlR/fHINkVGDHSf5uTZ2lLK3aqbkll8ENZkS7+ox49zJIb++sxTTf0Ls6FA15d85TQ==
X-Received: by 2002:a17:906:3b11:b0:ab7:6056:7a5d with SMTP id a640c23a62f3a-ab760567bb6mr674225166b.51.1738863966569;
        Thu, 06 Feb 2025 09:46:06 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fdb84esm128911066b.80.2025.02.06.09.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:46:06 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 06 Feb 2025 18:46:00 +0100
Subject: [PATCH v2 1/3] gpio: bcm-kona: Fix GPIO lock/unlock for banks
 above bank 0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-kona-gpio-fixes-v2-1-409135eab780@gmail.com>
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738863964; l=1942;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=e6z5hqNT0gQo54YOk9KBRWo9PEmYnElscPakpAmN8EY=;
 b=3KfhPg6RKL7fWUxqFtSosot5Cc73YlOOB48Qltb+kTrtUKUGnOY8WIFWSakl9k/unz4mxgEkY
 Tvueh+fn8bPDq9704MO+z+h9CmZ1gUElrj5zAFIImuYyv3ml7OUVNpu
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The GPIO lock/unlock functions clear/write a bit to the relevant
register for each bank. However, due to an oversight the bit that
was being written was based on the total GPIO number, not the index
of the GPIO within the relevant bank, causing it to fail for any
GPIO above 32 (thus any GPIO for banks above bank 0).

Fix lock/unlock for these banks by using the correct bit.

Fixes: bdb93c03c550 ("gpio: bcm281xx: Centralize register locking")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 5321ef98f4427d004e62f71d00df6d49bb465ddd..77bd4ec93a231472d7bc40db9d5db12d20bb1611 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -86,11 +86,12 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	u32 val;
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
+	int bit = GPIO_BIT(gpio);
 
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val |= BIT(gpio);
+	val |= BIT(bit);
 	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
 
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
@@ -102,11 +103,12 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 	u32 val;
 	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
+	int bit = GPIO_BIT(gpio);
 
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
-	val &= ~BIT(gpio);
+	val &= ~BIT(bit);
 	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
 
 	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);

-- 
2.48.1


