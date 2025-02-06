Return-Path: <linux-gpio+bounces-15473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A16A2AF4B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143F43A5526
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CDB19D897;
	Thu,  6 Feb 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP1QehCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D82199943;
	Thu,  6 Feb 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863973; cv=none; b=jfAHkbYIj/ps/nGRQ/+7Eme8L9TbOe8WX3GRs5V9SoTyTOin69lnoe+WO5XBr3RdBSrsU152enrbqRZbFFiUdT/w0HoNWTsiV/kIsu8/Otg4+vUcIwS0ooSRZKQAsmGJNdTisGVqEysuFMlwRtEV8QcSgaPXQcndTiZDPftAGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863973; c=relaxed/simple;
	bh=ovJm4j6SHLuDuaHzr21rDn835rvf8QGskDc9xQum3Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbA8Y7nw+I8jW0Ichc8HL64t4JPHybBHgywna3jDpml6UDFSWyw+Sn1Y+3RJoMVLayP5UjJ0qtGOER6pbRt2SoqvH8OiDBzI9D26elhpA3lcYESpR2XZazhQwEay9mxVz4J9PDeuTECwKE5+cWlQVAyCC1bcTj3GA+oypsDiB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP1QehCH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab698eae2d9so216713966b.0;
        Thu, 06 Feb 2025 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738863969; x=1739468769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkMsDoRO08lUjZHjBj1G6MqbNfCQFz6BCCmk32m907U=;
        b=TP1QehCHhwfVqHEx8MeiCkME08E9hn82rmlFlHHQOvJ65KU3fF7mosfWK9T2IrTRoY
         HHgp3qxgQL57JPNlF8mxXrkTJtmu6Wy3ogty6hVTtbVQQRbs04R3w1AeB2vP+i4R3NjZ
         kHAd8TPFb0JKYv/k+pt31978aImqjrWWpo3MSa/MMbI27cI9ifa6RWqL6ueatKDh+X2u
         PgRdSl96/JhWzO6p8Bba+CMjy4c5hbMfAxVrUa6hKqhzjKAjL+LofkSwLu5mnf3LbobE
         T1pSA9SjHKWfpmkXIvnOYbawDbMqx+ecdiAgqJwq/GOyzzKBy5BBcV7Pl8QBtUJEcDBG
         hVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863969; x=1739468769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkMsDoRO08lUjZHjBj1G6MqbNfCQFz6BCCmk32m907U=;
        b=ue1OR+A1RI441zsO/IU9yWo7hp41CZqz6VYwM1wlu/SoUdIf0882nSzAv4uN6N1bR3
         ZowO7c1rYf86RJ/2d1nLa7TA5vs9X+OKPs0gNrcR8cQM0VlFCGIeMtMUNd79ZBaTBfyz
         aT49rOzPvUz4W8GczxMO5BSI+GRnzxI3awwXjDyLbxHbvCPhQRj4bd7sPXGu0rB8YYXl
         FqTFI9v0gAQJYjq8m6gxXv2cC2TaHC5YvXyvmN8C7PNJxICGGAAlabacZpzseFA0PdVS
         ObwEliaH0wgu5o4hqF8a38HzxpN9VTbBWxt3QP2a9lHpcMmoegXmpbuJURmZUVoG74wP
         Mbdg==
X-Forwarded-Encrypted: i=1; AJvYcCU28V21GqeLIZPkNyXqyvHdiBV4Bn9pr8LIawMTCqgrdFelFsoILibl+Oi6LAtcGbXW6StXDbBAvd7DN/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/06K/qw0VyebyFXKcMk4BHSJgMXu7z4X2X8KCkA/dRzSFWOXU
	VhwDAkckhFCktYvu9O1cyElB11rpSc7ujAZU81yefoTk1UxO1x9c
X-Gm-Gg: ASbGncsDamm+bj0d3XnPvFKtPmGRU7VP1ZHsU7MXxn0TNTn6wYPdtS03NQpGo54fogw
	HgbSoEfbD/xTsOjFwzU4i4yKeEqz7f4FOIRq2OeZjI69hApGFmYbNak5dpxJ5nK1fk/rbrU+RRy
	O+wCXXtQydkDZ2T0BRM+SI2kBzrjAjW+WpYolmLc9GWfPlknOMpzSS1BuBMeygItubccP1Z6d2K
	AgjIG1jPRS7laBa70n3ARvNvYGePZku0g50iBHlJE172CRwtx5XhIonVd4Otyq1TMh1QYdvzamf
	J1/KN3ERMhSsWy13Eb5IeiLRHtXTg0N2uP0701CWVDz9NgTip2D6OxIG
X-Google-Smtp-Source: AGHT+IGc8hmMGDzbi0G/fvW9sBRYg6q5o2L5/Tc8kx9hnWYz5seKGV+N8E995p/KXWSRf3+U3tP77Q==
X-Received: by 2002:a17:906:f5a0:b0:aa6:aa8e:c89c with SMTP id a640c23a62f3a-ab75e2f2042mr921993366b.39.1738863968638;
        Thu, 06 Feb 2025 09:46:08 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fdb84esm128911066b.80.2025.02.06.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:46:08 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 06 Feb 2025 18:46:02 +0100
Subject: [PATCH v2 3/3] gpio: bcm-kona: Add missing newline to dev_err
 format string
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-kona-gpio-fixes-v2-3-409135eab780@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738863964; l=1019;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=ovJm4j6SHLuDuaHzr21rDn835rvf8QGskDc9xQum3Zw=;
 b=n4/yA1oXA6PpcFFUmnyLhQ/BpICotwIQ1rCL8CuSUfkLBG4rWMq3P2G+AAFJP6lhTtTcnfEQv
 0b+4IhA4cYeBsp3Fsdj6uw0j5iLOKMaD8WssfRaRUA9KxDiJYib25AI
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add a missing newline to the format string of the "Couldn't get IRQ
for bank..." error message.

Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpio/gpio-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 17f3f210fee9dbb5da3b26e1f86bf8f68089b1cd..64908f1a5e7f9b059a20217714c91ce9aab0c640 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -659,7 +659,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 		bank->irq = platform_get_irq(pdev, i);
 		bank->kona_gpio = kona_gpio;
 		if (bank->irq < 0) {
-			dev_err(dev, "Couldn't get IRQ for bank %d", i);
+			dev_err(dev, "Couldn't get IRQ for bank %d\n", i);
 			ret = -ENOENT;
 			goto err_irq_domain;
 		}

-- 
2.48.1


