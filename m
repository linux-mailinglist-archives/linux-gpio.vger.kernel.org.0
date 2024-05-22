Return-Path: <linux-gpio+bounces-6544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD38CBAD2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 07:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CB521F224D2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2024 05:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A55A77113;
	Wed, 22 May 2024 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YHETBpWS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B375813
	for <linux-gpio@vger.kernel.org>; Wed, 22 May 2024 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716357294; cv=none; b=XdxH1OZKrvMzqIPqMqXrl8lgcl/R042kNLriqwB/gTymcZ7g/zXH1axCA5olvYSTKsJyy6QfQWrpvsoldBCGDdGfCkcH/PwsW46R72oBWBTxML58WbDGcjniIngbdc0tqywpPBv/l3+l+P3ZE/y1C+deHQp0brcO7GtP8s/4nZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716357294; c=relaxed/simple;
	bh=7EZzhmNV67X8aCMBM+0ECzyFQGItKr3UmrDu29BtlxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gs5M3kviR5exiXjynv0u9oEVncEzW7yQmsQXyArjtTLidOTzEAhVsGD5smsdhIVshAPV2oHky3RrPV4th33YCOu6kr+teufX/wSWPQfYWmxzomI7+WNMnmXLjEigdJW4MBmoCeOAVFTJwG0rwm09HZR+TYobhdqkRyU1+5doavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YHETBpWS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4202dd90dcfso4222685e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 22:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1716357289; x=1716962089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5Ef9nBQSYhDomv1/1h6E+yKGEz7b/E/OzEO4/4KPwI=;
        b=YHETBpWS7/gxQbw6ZtDpDUGixy90tEwVHeJne2FoBStxH08BNtqKHDAPgHFlA6COtn
         ejpnJdJUABMyUJubUW0I3y03Eom4itRAXDzV42alNrLH2VDuwQtJhV2RxdbZN/OQLsQI
         ZpeTKHRgq3whnTLjEKe52yFqcPba/nRQ574IdMtsYD0w2KBecD6ZlE7+9aVH8t+VbNPk
         Pjw8TgXyvUa+XElMsmNR0d67NxbyLK39j3+UohineizaIkY7tcFAOK4oXiB5MwEhORdB
         1FfIUB2IoXdXozeOvj3ekTmixAv3/vX2IszGwfYp3EJKluDMQ1nNk0LM+fP1iUd/MieE
         TNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716357289; x=1716962089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5Ef9nBQSYhDomv1/1h6E+yKGEz7b/E/OzEO4/4KPwI=;
        b=KfMLGdsUE/oW89XctfbegiXzrs8bYZUffWdfUvBjTOmRbV7lWTEtpalb9F9sGgmuuQ
         d+bYRfJmqyWymZ9HRIZXhCBO1b4YSP0ksvCu82INnSj6jCBl72E+LLZAzmHnIsENqtZG
         je9vSXSx5O01k3phpQcp6SMJ9p9cNJ1BQtmI4FkDWen+eYxE1bcG3Pk3WWcl5Uqfp91o
         TfME0DbEq0AdMYLfLNqb/oB1ii5qKzOToEC4fqoAGdD7B9Kls2IM81YO8Fu5jH7CBJGd
         B2PjA4BHK0F/IH0bOU9b7sil4PJD8smF0eh0TlEUjdb3xqs+1LW+u0iBXHAkIS2h8GXU
         uMAA==
X-Forwarded-Encrypted: i=1; AJvYcCW7ysS5qSdSFBtxGyMBCfZ4lBcyOInuMk9oRyYTatnBBy3O1b5yvOXz6UhpZ4na6P2Y0tBBdz4HZ4FLYsP9dekdJcOwBTnQ8Mg4bw==
X-Gm-Message-State: AOJu0Yyf5R7bDrlarx8dKzlLaeQ5ActAZcZuvXoM4merDLBHddS0c47e
	wcS3R/am4Tme5XxJVA8J8xzaOFQUxSwvOcdOdxj4EzrrJ1HOkitT1Zr6cmbVPI8=
X-Google-Smtp-Source: AGHT+IE1oVCwdvNgx4NOCy9IfBYjOPPqLJm+kp/C3JyYqhQINpS7WEkTXmfiinPack4CkKVQR5SYeQ==
X-Received: by 2002:a05:600c:1c95:b0:41f:e87b:45c2 with SMTP id 5b1f17b1804b1-420fd225b5amr8749115e9.0.1716357289538;
        Tue, 21 May 2024 22:54:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm475726705e9.28.2024.05.21.22.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 22:54:49 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}
Date: Wed, 22 May 2024 08:54:21 +0300
Message-Id: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
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

Fixes: 02cd2d3be1c3 ("pinctrl: renesas: rzg2l: Configure the interrupt type on resume")
Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/all/131999629.KQPSlr0Zke@bagend
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- use proper commit id in "Fixes" section
- s/use/Use in patch title

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


