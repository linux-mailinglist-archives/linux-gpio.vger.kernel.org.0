Return-Path: <linux-gpio+bounces-19538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D952AA6D6E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31DD467F74
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2868724C083;
	Fri,  2 May 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m9y6ksaw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE2246761
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176398; cv=none; b=XY/BKEWU0h64xjv7Zbw3RpWVvfwQHoMeGuFtlV2QhtWf0UfcRe4cCKD/ylnGA8cdya4LOZXbJFC1Vo7NfsmslVlODdVHtnFX4gd6cuu8IfnabRqFEMQOTfd2vfcr8AjotFoF0RctfQqZJOtdkvHViwl3tqze6shCo6BxP+t+TJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176398; c=relaxed/simple;
	bh=WHc7wn2J/YaeLrZRN4cvkbwcAb9iM7CUvj9xdwuFIIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aER5MqqYKj3Xvo9HvMixpZi+yNl8Yg5Y0CGhYuy7pfxE9trIUELj4j/qARC6p5TpsMuVH1dvOnTZcEgB68Xi5ITM5SY3nILfQ1S425QREaYKmbOk+pahb4yW1qQwAahMPP0nXqLFDDIi9GyiaXIR7W6jvkQmZNzyhvbKaSrKBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m9y6ksaw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso1249431f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176395; x=1746781195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=m9y6ksawFU1pi+PTc0vaDHGgZjsOJg1MeLpPC5LvqKoTi+oR+TXU+usP33xNoxWu5q
         0Mm8ORZ8mfrx17BAq6CyHzDUCAur7z9L2mEWXAXGpyJHUHhfvdwHeI0F4xgzox4YmlGV
         iLJRU9MTVOruVmxRSXdOf0Ghd8/+Q24fmkqQ5jbv3Ux3vYARkaEkYPWtT2RLBqIV+8oZ
         ITaTkzlRZmbNW47uzIciMjGfgpaSozPEdxjwF65khDyY3kZeMm/VpJ8WDeBrdCeylxb8
         gGXrh8mLSlVqCfWTo3ZPYDuEpHqD3ixHEZqqnrf7+k72FRBpW9STes15BB6XYh0s5lDo
         ZtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176395; x=1746781195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=dUCspc0Cn5bcMsBFsgqpiC2M0VvqD6slDQrR2GnvNgpltVcqHk/kwHX99XZNo9A1vu
         7QVncOQynmhOZfRux/nc91qOujB+5Du3FchM/uZpG6T7Te89gmIqOsJGXOP8kqOLnaV3
         2WSFU8TG39B0IAHGYNRSd+UGKc6Y8LMx2tnDCtvxMNGJ1/d3hcq/dH1HzDIb/+mELwOv
         WnnYiEnRQrX/f5qGv6lyAcKp1zXlEQmG4uElcRwc0XRbOzHcdjdMwqCKbEjHVqF26nGz
         30aT1Lme9vJOpx9QY9U2YQDUapd7hlUlIDsqmbMDXifNHFUdoKPx+m951BX4LQQ1dhsV
         xBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWh4mZoVYc4mCmNpSYplO4z5Om95Ce8KKbLZTfwkVlVlCqbk8pZQwWNVf3qwoVA/lBJt3fHW6lLdtyt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mIbgkw477uWTHTnuL/i/i8BtGxCNqXuQLj/uZJP9pOVuNyhH
	O4qj0h8IyYwGgsLUk+kkWEVhUk9dFEBU04L4AglFCyF115XCyQZGDqDSFGflTue5EYfIpaHEsFV
	BdE0=
X-Gm-Gg: ASbGnctVIK/mXUGKUUVfLuzVzEhFXDeswv5343tzMj706M+gyzKPb5uwd+k6ISd6lTr
	tJUb+UWCYVHFI6vUNDc/J/oQrxAvW6oyzwKSVisQ51czdNCx/cnRRxI+bjQpiIOJiU/Y9ENHTMR
	5phSJz6hOFiO/vWZqb4WRcTSwFINo21L4FdwJZzJp0FvQ+1stepvO9EbWk4vFz3U6fsj44ntBVS
	kumm9w2kWhANdZizXeN4YY+kitC+Uxudb5qCUKnqsbqRp3N34fZg7ZP7j2FR+qC8lsY8yBxJ1Rj
	Kyrbq51+7u/vvPcDFn58FvvpJjlJjBDgeVk=
X-Google-Smtp-Source: AGHT+IGnuPzW0KsZuoafr0ut25yVUAE58QEXlIHKEBz/4ug3rf9GaFjAL3GjFqvtw7oASpIUZZCL/w==
X-Received: by 2002:a05:6000:2ad:b0:3a0:7af3:be8f with SMTP id ffacd0b85a97d-3a099ad31cemr1489449f8f.5.1746176395349;
        Fri, 02 May 2025 01:59:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:50 +0200
Subject: [PATCH v2 4/5] powerpc: 52xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-4-488e43e325bf@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NUv/Cv/Ma42p5cVqxLaXY/iK8aY4ZJdMZfYarvprRRM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFEUTAydQAnqUBWcSczhRxoDxw1FtPObvJO
 Cps9EWCTzaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 ctNvEADegI0ahN7DjfRK70i+3mbHNjJm9hEqWx3KvwVKsoM5dD/Lkpn2urM861oMuobssDB/gcE
 DbA2cu+7NDPR0b+KaYiEU8JJ5BvmUpmTg09PVE/paQdwKat4HoV6icBYsyMHJI9ZZg9Vbo2EQav
 FoMnIzOGzWzbrqdUg6jyaaiQFMqhkbafZz1QVXvN2ZKuYbkwTLxLyq48nKWRTJUlsOTpmLY9kAv
 DCCAzdjB8yk8zEXXdAaEKLsoXZwjR6cwdBa54HDS6vPGP8iioKYpI0sOxcsxIAyX3woKy10zuGf
 tJuGP1S7Nw3/HmrBmtsVe1yTgdnQYY9te4AtsrBPo7A+Qe8FbkiUJcbbwG1qQc1sB0nO5kn5Cj2
 9o/m/6lcqCxlfcVcTenPlKMlyIMMVbJ9j9qV/gDFhDxnKHZwY4rtTo/8C3TcgqxobElqQuEK65O
 BIcVEJUqyvLGwd3JPg21ifkC8tQ++TuyrXzYGTnjdwm5bMWWkyKpOiC0W762gmVviUqRHG1x9aA
 zYw9pfUPGHaAQLTeDArAu40iBit+zJBYbkA3kfchXECSfhyTBGacRZZrgbfq/M55mbahzq1kFtA
 8gWJE/qAD8A2LLIlIugop7WeyKiehQIs2Ox+gKZA0/PxIaVU0RhyHAvi5AJDBvWuN7YMXvDSGik
 ecRAgo8SfaYFF9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 1ea591ec60833..c96af6b0eab42 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return (in_be32(&gpt->regs->status) >> 8) & 1;
 }
 
-static void
+static int
 mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 {
 	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
@@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 	raw_spin_lock_irqsave(&gpt->lock, flags);
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
 	raw_spin_unlock_irqrestore(&gpt->lock, flags);
+
+	return 0;
 }
 
 static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
 	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
 	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
 	gpt->gc.get = mpc52xx_gpt_gpio_get;
-	gpt->gc.set = mpc52xx_gpt_gpio_set;
+	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
 	gpt->gc.base = -1;
 	gpt->gc.parent = gpt->dev;
 

-- 
2.45.2


