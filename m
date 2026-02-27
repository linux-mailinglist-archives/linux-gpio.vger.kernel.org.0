Return-Path: <linux-gpio+bounces-32334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBTsBi0TomnQywQAu9opvQ
	(envelope-from <linux-gpio+bounces-32334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:57:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BC1BE538
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1A29306966B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E57E47A0CD;
	Fri, 27 Feb 2026 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8kxxp+3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235523451CC
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229409; cv=none; b=VKXxBxIDkplFeloDqa4r+1Lnbq/JodvQyFPHJa6esw8sLX1eMwfuuGycCpUpeV6UiQBZ+pTH0NGcl+Mhpa4DzuO/SsgczcpXwppoN+MW9w3Mo2NOoV35z4MBSowmxf4rXzkbsqRn/MonXlz9hYlkT/aqeXH384yj36ENXBATNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229409; c=relaxed/simple;
	bh=GQDN1R2s9mM921F8hqC+JQetSAhVPiZawRGbiievuNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2w9daDDWnstHetadwYoB2yUXQ9qFyqIH7RN6wUSf2DeGx3ukwO5vLesilqfOBWCq4Nw7ZBPrCk1xIhmpIPnHXn+1df+wXgkMrGc+pljduiLzG4CzYAtDFZvzvN5ht3r59jF54Da6GU7YnOWGdMLdwqtbaLYxn/b7uYpgdXFrxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8kxxp+3; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64aea64bf15so2253949d50.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772229407; x=1772834207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/E4mXwswRGJTxuG0f6Dlg/ntBjWKWPl5F6qxEETdII=;
        b=a8kxxp+3mQs36q2WcTPuyJZvM5LR83EWWI77/h6QUcf4L/vOlG2edVn9tcPigWqp/y
         JoK3WNZPifxgqzeizEA83VD4V5HW72zjtCMBK3FYiBE1JVfKMGxHREBTGbEnp8p7TGCP
         ufh2HhZQ9q7X8y/pOuND+n1G1hiLs6EvXLABNSdLZ8firoagLpaXows2nq21n60Q/dGz
         WyWIS9WnCVUlRp+TkmnhyXrvuK/falfnGkWyzdsXHf0S9B1+6PFDbigROcagHF9rLv2d
         QP4bm7i1fx1tfXmAgisAyvEashz+VSFAvjLKnWoYrm4KJ9qmJJWF4kBbVOA3DduuuHxA
         CT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229407; x=1772834207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/E4mXwswRGJTxuG0f6Dlg/ntBjWKWPl5F6qxEETdII=;
        b=DQsmrtLfUReOFGZzQhkQF5P+CK73wyXIuyhVW+36692dMeDvkeIkEzd8ag6kAgRzDy
         2pVMR+5cOn1N6WkGHAA2rUwN2HCortVQFUCr+vM+exnWVmEuT8fw4ZqVOg1q5oTV0Zyh
         Ds8OHtzddsU6GhefyFXa5hW3mHQkpBl3JMriK5Ulq2I1HukIwz5+6LQgPTjrzhGVBtiL
         ksN5d772pnjJXf5ZPauDL/5U1XKWtMSq95hn1t1zIUBEakQ0ujUNzYxQfv0JiQ/pMyW1
         6ZFwPUZ5MgmE7YB4w9d2xnBURl9PcNGyGrKzxv+NPpMyvGzwQWJ+PEUdShWmgDwJjI8r
         Vm2g==
X-Forwarded-Encrypted: i=1; AJvYcCXe7O/s3eKXk8QTQaEd/wslGnr4CaBp/F6kSlPuOQz4vCyGwspV9bJhTrGbeG51lu3/Xes3GSdktXhA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2VNB/4kYV0hHarRWZhF+9/7Puj+oMicTuT3FXwdvQLuVV2mT
	Q3ecRsypWgQ+6NOJ+aTBAdbxPy4aHeYpjE8NvZ1FbZArqb5lVR/wrZNz4HcTapOW3nA=
X-Gm-Gg: ATEYQzwOlOYEcarLkQaRz2F3qQgZ3wLOXqF2j0ocG/vxA5vmPGkY0/RyIHfKCes1mbU
	uEG4fqL71pr5LLUkC80FGu5XMOSxA/RqcefP+3/110KV70oX34GSFXXHzqPWq17O4zsH3pvpUpm
	kRn5qt8sBiioTSyqW5egEvFogRDXRiMUygOGbo/iCz5zayBHnXVFvfA1UJu5yPV6lB78awWF3yT
	NrgW/GEd/a2xVPJa651ahRgWUfCQg5fnebMtfY4fGotYJycUPQfr1l3O4B4GfvmCpBKQz5yIusr
	IzAIlPiU38tY86rDi+8uyg7HxSJFM4Q4WrKR4m2FQy6GZptLlGFzFgQEeXYrGC2ttU97fYguVSb
	DDStfIx/wiu6ck1aD20zvmcZPrwD9Dwc0iytm0+VUmA5QybrPzFyqaUbUsAS1VX0yUWtooFkbbe
	rTZXONHYfcti3ld1XgAMQbBVoaYU1vsRjIh1BzCohkvDGsxclBKFMlO8zjg2gYbCP1IuiHtrsgW
	USTA9+e0lK8XIhBr9yMJG00
X-Received: by 2002:a53:e02f:0:b0:64a:d74f:2580 with SMTP id 956f58d0204a3-64cc2082d28mr2750707d50.1.1772229407133;
        Fri, 27 Feb 2026 13:56:47 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb75a1157sm2948509d50.6.2026.02.27.13.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:56:46 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 1/2] pinctrl: pinctrl-pic32: Fix resource leak
Date: Fri, 27 Feb 2026 15:56:23 -0600
Message-ID: <20260227215624.1094832-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227215624.1094832-1-ethantidmore06@gmail.com>
References: <20260227215624.1094832-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32334-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 907BC1BE538
X-Rspamd-Action: no action

Fix three possible resource leaks by using the devres version of
clk_prepare_enable(). Also, update error message accordingly.

Detected by Smatch:
drivers/pinctrl/pinctrl-pic32.c:2211 pic32_pinctrl_probe() warn:
'pctl->clk' from clk_prepare_enable() not released on lines: 2208.

drivers/pinctrl/pinctrl-pic32.c:2274 pic32_gpio_probe() warn:
'bank->clk' from clk_prepare_enable() not released on lines: 2264,2272.

Fixes: 2ba384e6c3810 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driver")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Use devres instead of manual cleanup.

 drivers/pinctrl/pinctrl-pic32.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index eb438c9d9667..d185fe48dc0d 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2174,16 +2174,10 @@ static int pic32_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctl->reg_base))
 		return PTR_ERR(pctl->reg_base);
 
-	pctl->clk = devm_clk_get(&pdev->dev, NULL);
+	pctl->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(pctl->clk)) {
 		ret = PTR_ERR(pctl->clk);
-		dev_err(&pdev->dev, "clk get failed\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(pctl->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed\n");
+		dev_err(&pdev->dev, "Failed to get and enable clock\n");
 		return ret;
 	}
 
@@ -2239,16 +2233,10 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	bank->clk = devm_clk_get(&pdev->dev, NULL);
+	bank->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(bank->clk)) {
 		ret = PTR_ERR(bank->clk);
-		dev_err(&pdev->dev, "clk get failed\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(bank->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed\n");
+		dev_err(&pdev->dev, "Failed to get and enable clock\n");
 		return ret;
 	}
 
-- 
2.53.0


