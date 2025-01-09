Return-Path: <linux-gpio+bounces-14617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B60EBA070F5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 10:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567E2188A911
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B5C21506F;
	Thu,  9 Jan 2025 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="F0+lqWCi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1C2080C2
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jan 2025 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413698; cv=none; b=UbTjOxfndCloHHTNpXBBSfU+Wm/vbKCebSo3RSSEtNJc3jM2mwfmncF8O7KI/n9uMSvNZrLFL/TeMOS63FqAi1Dgw/9fG0YymH/B5m7ppGaRDcC8W4vcdMh6tXRWFud/ijGBL65WFYAGyk0IulZbCXz4AmkqQorwR7O6fnu8esM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413698; c=relaxed/simple;
	bh=0sZIgtv+cl3PjxKdZGyFZfPmJNrQN6QgI8Ejw0FZLMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cf+s2BI513wFoUYdDdkULaB223y5M0btESurhEmu2uC7Cl5+Ta92Zt1wrwcP/bh9WeOXq/sjiECGMll8bUae01usBrORDoxvKO/Wp1TUFOyeeuBohWLGiN4JKPuql/+WPwPmZmGhkdHDVQMHrwbxNbbqj5L/3PPuti8azvRTeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=F0+lqWCi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43623f0c574so5231785e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2025 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736413692; x=1737018492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DcRFUcqovUliypjUptmEP8CepSC3HfNizCbt+t31wfg=;
        b=F0+lqWCiwliRmY6WxvtOMSPYocVv4jkEaodhM5Q6Oz8rLiyczg1tL4ETzIQmcUxprw
         mOWzgEnws9rrTAeJbOoOgQIJfrrQDUp8oBe/GI3fRwa+a5fvorClVpBTTQF4Yc+u6KRv
         SRDZ4pUq8o3ce66Pvc2UU78Khj24sptqFQEIylzWdJATr7acn1ejuS3W9N76Sgl0AB6e
         4Cq37DPPGYIZMARsWC+Bcbq3993YMcuUTzGJskeYF+r84XbOSPXimiM7z56t0KdQ5Bi+
         x7QUxtyuqYr2Lc/4lTUAt9K8YwPjDSk6hTrdcDg/Yx2vayvTneWr+XJzxuHvj8i0Bkho
         /vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413692; x=1737018492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcRFUcqovUliypjUptmEP8CepSC3HfNizCbt+t31wfg=;
        b=pf2pZ+tlgLB5aWuIldArADHAokqXFy7Amf5QS9bTkaJ+NAYxDmPREk/++t1ZIcsXu8
         0G7ie6Aes7vsF9zNcva8zUczAqDBKERlUFyZ3LGuHUmIbyP7NygACALgYSwbsPkT4TcO
         xAI/EBniOQk0oFeZ17H7Gb1kOGskMJHIK3/C5vfDytcVkQsOmg2urBjfcv9eRb44FzB3
         Pe34C7L53dkiOh6n/UnMxTAOEAwMAmyuoMGyOjGJKQRzyBeCorZSk0/LIIcfql136sX9
         Bt9Lzw+qMb02RZAbJAFCz23PpVbNn6BrJwS3842/PsX4AtIzwp/u4nVsOXqehdA73D8V
         g0Qg==
X-Gm-Message-State: AOJu0YyYvCmIoth3LE22KEAoP7SIvMp1ghx3AlOjs4uZd1O+Df57r4fE
	h5XNUK4L5jCDbkqFEsLKPciHajfSzTVXlkxZOhdgWsYYkU0Lknbm6g8+Ml0qQKmxksZX8Hr38o4
	C
X-Gm-Gg: ASbGncu+NmLh/CJuaHF3qicr1RY03uhLNVPalHll43QIMHJsnvmN/c9OyDF0hSAeToZ
	I3W6ROq5oaUcH1WmegkOsVHy5aSHFhaoPkcE7Ukl5WkQACCxmf94YeBXzryn0iG55pCtt3H4qdA
	px1f3HWztumfU2eZ0ZZYVvVfvkeOpgr/JMrFbAbgyhuy+FYavEKHjJq9K+dhbZyoOotgin16HOF
	tWcpAT/NKibN1I6mcMd/5JPkReuvyKoa18HRYhXHS24c0FFuzij32qArN9t/sob0O2V9EHToB5Y
	Gxk7KtfXZWnWAi+sO5XaLuiovXzY+ZAc0i3ZYHGCg8NYMQ==
X-Google-Smtp-Source: AGHT+IHLKjGwRSzUUFHBhbLQJ/fLVnPnyVb+T5wkE6gEAHs9UQAKN3zX09BPGxrsdiUSotXyFzVm3w==
X-Received: by 2002:a05:600c:1d14:b0:436:5fc9:309d with SMTP id 5b1f17b1804b1-436e26f6d80mr57492895e9.30.1736413692059;
        Thu, 09 Jan 2025 01:08:12 -0800 (PST)
Received: from localhost (p200300f65f14c30058a71578dcf3a238.dip0.t-ipconnect.de. [2003:f6:5f14:c300:58a7:1578:dcf3:a238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89dfesm48419915e9.32.2025.01.09.01.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:08:11 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH v2] gpio: altera: Drop .mapped_irq from driver data
Date: Thu,  9 Jan 2025 10:08:03 +0100
Message-ID: <20250109090802.3763275-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=0sZIgtv+cl3PjxKdZGyFZfPmJNrQN6QgI8Ejw0FZLMY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnf5Hza1N+zs66eUmwPJ9F7RUU7DsfRIKpmcAtM qHFMlZwYzyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ3+R8wAKCRCPgPtYfRL+ TgEOB/0aKXtw+7u8+8awrXHh7h+MnnB20iBCDfmbZ+O8QPlLUq7eJt4BB+WEbp+rWC1jm41zU+S vi6ldDkTaM69nCNwytkbnicfuNjNXOlQdLKeZXlgLj+SxYwgDaEhx5JUjnCyE95UeTk0J9UGnrM KVNRR9HKjKDWUXhqmlRYlLgJ0CnWnkFMkI0CXVzqn4gwblSPqu2ZAELX2lOtkDOewXfnHfebjqO sxR2Izt4fV3UqQma/67sI/I6PjwVboYJpy08+sR6jAKW2DuP9SsR2OTcFfPeSstiTHvbJoM6aaJ cAOglDU2MraeMkZp8ae0KY8rehFMt+ZpMwCrc55jEuMhBYkI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct altera_gpio_chip::mapped_irq is only used in the driver's probe
function. So it's enough if mapped_irq is a local variable, and can be
dropped from driver data.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

changes since (implicit) v1, available at
https://lore.kernel.org/linux-gpio/20250108094851.3683769-2-u.kleine-koenig@baylibre.com:

 - Drop the kdoc entry for mapped_irq to please the kernel test robot

Best regards
Uwe

 drivers/gpio/gpio-altera.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 73e660c5e38a..17ab039c7413 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -32,14 +32,12 @@
 *			  will be blocked until the current one completes.
 * @interrupt_trigger	: specifies the hardware configured IRQ trigger type
 *			  (rising, falling, both, high)
-* @mapped_irq		: kernel mapped irq number.
 */
 struct altera_gpio_chip {
 	struct gpio_chip gc;
 	void __iomem *regs;
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
-	int mapped_irq;
 };
 
 static void altera_gpio_irq_unmask(struct irq_data *d)
@@ -235,6 +233,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
 	struct gpio_irq_chip *girq;
+	int mapped_irq;
 
 	altera_gc = devm_kzalloc(&pdev->dev, sizeof(*altera_gc), GFP_KERNEL);
 	if (!altera_gc)
@@ -271,8 +270,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(altera_gc->regs))
 		return dev_err_probe(dev, PTR_ERR(altera_gc->regs), "failed to ioremap memory resource\n");
 
-	altera_gc->mapped_irq = platform_get_irq_optional(pdev, 0);
-	if (altera_gc->mapped_irq < 0)
+	mapped_irq = platform_get_irq_optional(pdev, 0);
+	if (mapped_irq < 0)
 		goto skip_irq;
 
 	if (device_property_read_u32(dev, "altr,interrupt-type", &reg)) {
@@ -296,7 +295,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
-	girq->parents[0] = altera_gc->mapped_irq;
+	girq->parents[0] = mapped_irq;
 
 skip_irq:
 	ret = devm_gpiochip_add_data(dev, &altera_gc->gc, altera_gc);

base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
-- 
2.45.2


