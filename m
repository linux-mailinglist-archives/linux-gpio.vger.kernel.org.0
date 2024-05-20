Return-Path: <linux-gpio+bounces-6469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA08C9938
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 09:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9EE1B2140E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 07:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6662E1B27D;
	Mon, 20 May 2024 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VWy2YJrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09E41862F
	for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716189648; cv=none; b=Yp1nsnGqAS0lPc8Wo/Pqx+hZV/p9vsk1jcQ7btyS79jvaporhrqDRbQddnBh6bWpO9G6z34O5BWxjOUm2L+wAET0RHZfKedl4uuzG2U2ppwFyHLD/wM2g4Fx7dBLu3YfWeMYGSch91DyFynCH7WVeq5xHF7xeLf/gHY31Q5nb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716189648; c=relaxed/simple;
	bh=gqIAUbUBH0zrLm1kxTzRh/nI+40++QuEy6cZC2eVlCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oV4n3+RVfHBNKjez3NqeoXaMlOgsxD070sRcIdlU8KmQvKbpmcSqBvT0w1jv3yQhj4qBJ0Ps2HgzUQj6l1ARM9bR/aHqFM0ozBYnDlTHnXYB3Q21MiOflAtZFIdvNx6fbLn0lZDhifxP6npVgScKhwRUWjPeabFKpNni2hDAB0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VWy2YJrD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f57713684so4958878e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2024 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1716189644; x=1716794444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZBUhRNFLDmCI2ChcjlpR99DNWg+Cc8ceERhi6tF0ro=;
        b=VWy2YJrDkuo5GTVgOdg3Di5KaEVvjlYbz2ISbYzR7L1lfW5h/AHaNR9xwse942g3t2
         JRDGY8pHIeC+pOkmqHyJKsP1LlsDJacUrZzENQ/hIVQp19xFYZYnelUWkfRPefrG077k
         FU0uc0LwopogE9cT1f2MgXqG3vGqiVjJrwR9ZHQVbMTxPSsuqCy8/FgF3TvqkkioeVMm
         H31gFXNPKPL72foU0fP1OTDvlx1aCoUzUXgwwC5jjajdCVBs7x7Di4st0o2kFUHClGWR
         +tiITXY1fyOXz3PgjJf9XuH6U4Ra1KuOzbuY7/QmVHgXVcjt+1RqwrnmcEKSHlo1j9Lm
         yqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716189644; x=1716794444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZBUhRNFLDmCI2ChcjlpR99DNWg+Cc8ceERhi6tF0ro=;
        b=OAVHd7TY4bqll+7AOwzjpXEQVIFjfKyTFsBYe7/+HSuPC63Ug3CvWonNuAdHH0y06E
         Lm3g67/gTeQxiRT8Jyq9a9n89hpJxb4KPghtF3coys+LMEGglJfqZVs8CJZoymbOPbR+
         bLdfINxNceTElm7O2cKmQGwvel8UIl0OOmetV693kElcr8yexmT1djPvMKHuiTRZr4t9
         DYPWBrWLLwmFWyVxpHZaHBD1ODRunLe8Iq/hW2jiA/tTN/SXFYV+ZQFhnWIh+e/8OT1g
         616/ikzUMZTQsLihnB8ekI0x9QKoXCC+gRRDE8WpaagOd9XzqYgejdrnt0OBY1DtMPkr
         UZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVwyj8D/pA2QNvyEzapYNPmDCz0e4ap16CU96fiHiybaCswYx8CJYjKDS61KpriWdarLIZqaIzSacB8QGVqbWCYmQqX953xO11DNg==
X-Gm-Message-State: AOJu0YxLZdi62lZ+VHY3I38iYRGe3ddnyNllBGIZj+8ozSy6y8RsMxQq
	0L7WjAwnLc+KaXmckn7pZcj3mQzYyJZFvK2U3+f9pqOQULpGyLi+/FZeJh1DDY8=
X-Google-Smtp-Source: AGHT+IGTMldOTJK/Mk84R/2R/3qaWKsKo9JQiM+f1Bi56FP9zReRBJfFHH+CDVcKkrFNNmSxx9oDag==
X-Received: by 2002:a05:6512:3091:b0:51e:f1a6:ac39 with SMTP id 2adb3069b0e04-5220fa71b46mr23227383e87.12.1716189643948;
        Mon, 20 May 2024 00:20:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccfe1277sm398943205e9.42.2024.05.20.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:20:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	didi.debian@cknow.org,
	efault@gmx.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-rt-users@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: use spin_{lock,unlock}_irq{save,restore}
Date: Mon, 20 May 2024 10:20:33 +0300
Message-Id: <20240520072033.228049-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On PREEMPT_RT kernels the spinlock_t maps to an rtmutex. Using
raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() on
&pctrl->lock.rlock breaks the PREEMPT_RT builds. To fix this use
spin_lock_irqsave()/spin_unlock_irqrestore() on &pctrl->lock.

Fixes: e1fd1f9f457b ("pinctrl: renesas: rzg2l: Configure the interrupt type on resume")
Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 20425afc6b33..78f947a8e26e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2069,11 +2069,11 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 		 * This has to be atomically executed to protect against a concurrent
 		 * interrupt.
 		 */
-		raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
+		spin_lock_irqsave(&pctrl->lock, flags);
 		ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
 		if (!ret && !irqd_irq_disabled(data))
 			rzg2l_gpio_irq_enable(data);
-		raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
+		spin_unlock_irqrestore(&pctrl->lock, flags);
 
 		if (ret)
 			dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
-- 
2.39.2


