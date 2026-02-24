Return-Path: <linux-gpio+bounces-32151-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN07LRsKnmnkTAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32151-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:29:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57018C5FA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D717230500E7
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 20:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0193C25B1C7;
	Tue, 24 Feb 2026 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTYyx19f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAE5339866
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964949; cv=none; b=sPzOBHCQ7YAuBxsRaJXZjliSzfW6GWJ75weXstxRUWgciCtESQZytz31j5zGbSb44i9TWrLMk4rGSLxyVbsRcFRZEaIrAGgyg2i2pSPh8wvQOTytrsc+cbomQihu2bFNk+piwQDZ5qANEGTWTfYvZAN+qG/mex1CnsBrNiePbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964949; c=relaxed/simple;
	bh=aNgGjc/ynjknmWb3sc4QfqxFXQJoRo6cMq2PK6MPCgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BS/JTGge1Tuc+1Iyx1rz5nYH+mU3E1ENP/uug3s+LewUi/xJUlB/DFp1WaHZ5eAk/AxSJEJqGPqc00yOGBo3G201sMbaVBzES0ylhdICpqMN2e4Fh1XKPEyKWN+PRe2locPQK1JhLJ0U8UvEd2b4AcHP84zKkHOspgXfpxxFezI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTYyx19f; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79802e2c989so54352227b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 12:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771964947; x=1772569747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXgTcCR1bgY5alvoJz3PSXt2ZbxmiSSmjRzGDg8f9o0=;
        b=ZTYyx19fLKGMTYxUFDsni36A2nAeNEnLYIuby2JysPlD/86Dt7Y/l+h96F0/h9zLbH
         Zv25tVyCIKFGtkiNjO3y+ZcpU1vz3qB6fBMuwSaHSJh8myGi5FpxYg6p+vMmE/bzcly+
         qU4mIRivA7f7meIW2HYlLpbpvvtMoKxbXOpfL8BLLdG3Df1gGBRfO5jmR9tDxmP3+Guf
         0wkLWWLxX58eoSF3K9Ak+hF3vGrEDRn3k9zEHpNI/V1JNY0mCvSfxvEEf2dkWoUAFWfI
         JPmiVFRrhE9BDZi+1OL4/1Nkeceog3H/YqOoMS5qGsSFiJYslkqp4mE7ikYBxVHEjP+h
         ljyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771964947; x=1772569747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXgTcCR1bgY5alvoJz3PSXt2ZbxmiSSmjRzGDg8f9o0=;
        b=KPgZaZ+S4PO7sWkAJ913AND5wEiMFuMWAqp37aDW2ZwBokWYFkwsldRdCV+pdZWdOw
         dLZEgg140+haqR4QuSidG8tV3ZEFXA5mFR/dlXshWFWeVwNOcWQbZ7DC94ZV6rlWO1FZ
         rFkZ7TvZf+rlZ3MsM1sVmTzo9DOqlHGIidtVFAC475UEiKJAheZ/N3ZQfZIkNzwY2Kfk
         euyz2NktmA5xafC9wvTPfLW0ELmkcNsnay8xlalhdEYDHp+kpkrN+PuCXvJDLSg3vHcx
         99W99pmUW2HAXhQCvrJi6I/CA20daVJpJj7NqNUYkSrq9zsRony/+gKKNiP9/c42Huqc
         cgnA==
X-Gm-Message-State: AOJu0Yy1g94VFJzonCmQKWQV00Yed9MzaurlrdAwFiw5uzl3eSJ03iNX
	/tFiEyjZBRtxfvX8QPZKcKwxPFCwa2/BjdhpCwln7UZnpcXJp5CJl7xo
X-Gm-Gg: ATEYQzwd87Ayr9iBtrs+yX6FzFh3s5hinY/EOGN4PAOIJGiUKL++Lp/TUsC9SVC6xSi
	3gCEg8YbtMrKfDdEiuPmn7OGAL+yu5hawLMEThIaT/b7h/6INN56iMpXB6RjW1jsD+aPBOI8pSW
	twHDd49iuwIF1NEkQHVovfJoUWSFyf9Ddi2aj9g+w+tUG/in1+insMYyi1cpTxjXA1IDnpKFpfB
	F7+7eiAEpv/70tXoGhBO/4SO69FecHti+bNKOXFghhQnN6w0dJS7bMK5g2AeuCDGkRRbohoEG+N
	e3TI5kLmrGWLq41OchV6SLaFQLWDakX9ihhKp6rkREeu0WbeFCQqoq4FPlVQtpnaYxxSkh7hFJ6
	DrImesa+ZKmRuxgDScZYostELlyvNRZtcEwERSvT8ZI2p+eIHJMA8v5xYQanTXKqsUG3iRgElGr
	L0RGzsGyajOaub+3t3NYdZ9EiH6YAND5QCmRT4Mod6BxeJ/pzycrCqOmihvtbJucmL7Sox6RIVj
	dAiuSozt032JV6zFbCWos8Y
X-Received: by 2002:a05:690c:95:b0:793:bc67:da0a with SMTP id 00721157ae682-7982903d449mr110024327b3.47.1771964947642;
        Tue, 24 Feb 2026 12:29:07 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79865ef6631sm2429447b3.12.2026.02.24.12.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 12:29:07 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: linusw@kernel.org,
	joshua.henderson@microchip.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] pinctrl: pinctrl-pic32: Fix resource leaks
Date: Tue, 24 Feb 2026 14:28:46 -0600
Message-ID: <20260224202846.2437400-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-32151-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D57018C5FA
X-Rspamd-Action: no action

Add three missing clk_disable_unprepare() in early return error paths.

Detected by Smatch:
drivers/pinctrl/pinctrl-pic32.c:2211 pic32_pinctrl_probe() warn:
'pctl->clk' from clk_prepare_enable() not released on lines: 2208.

drivers/pinctrl/pinctrl-pic32.c:2274 pic32_gpio_probe() warn:
'bank->clk' from clk_prepare_enable() not released on lines: 2264,2272.

Fixes: 2ba384e6c3810 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driver")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/pinctrl/pinctrl-pic32.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index eb438c9d9667..cf098c183b14 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2204,6 +2204,7 @@ static int pic32_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctldev = devm_pinctrl_register(&pdev->dev, &pic32_pinctrl_desc,
 					      pctl);
 	if (IS_ERR(pctl->pctldev)) {
+		clk_disable_unprepare(pctl->clk);
 		dev_err(&pdev->dev, "Failed to register pinctrl device\n");
 		return PTR_ERR(pctl->pctldev);
 	}
@@ -2260,8 +2261,10 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),
 				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto err_clk_cleanup;
+	}
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->parents[0] = irq;
@@ -2269,9 +2272,13 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to add GPIO chip %u: %d\n",
 			id, ret);
-		return ret;
+		goto err_clk_cleanup;
 	}
 	return 0;
+
+err_clk_cleanup:
+	clk_disable_unprepare(bank->clk);
+	return ret;
 }
 
 static const struct of_device_id pic32_pinctrl_of_match[] = {
-- 
2.53.0


