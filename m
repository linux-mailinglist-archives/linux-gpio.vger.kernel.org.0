Return-Path: <linux-gpio+bounces-37194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEdyH3WVDWoMzwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:05:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F058C183
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 13:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07C6A301572F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E663DA7F7;
	Wed, 20 May 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPlfSe96"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63033DA5C0
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275120; cv=none; b=ezr1Qgzob7N5h4puBjux0moO3DFircyswVHqi1ISBckjsuOCmgniUlMWAUlJaG33jqDMV4MmNpVnzQAlASSyoV/Rhmzdl3maUZkkVAg+Gz5f/Eg6E/qDRxvzR8fakV7wtV9vtHaXRbIldoZNUaVlStRAK4CFSHx1n1vZWTA+0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275120; c=relaxed/simple;
	bh=mDSDYiGBy8xYz5JmDiA1s6oWYSl6J/LaLj9wYdnQ3MA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IOJYUXgV9GMqFaeCkHRUuwXegliuhn/nknwwWL2iUJPQa6KmmsKSQNS7yHK8VEYmLNlEFPb3fRwvxlZjR6Es39xnlvlJmHguUm2fuHH1AGvNoqKif1TmGboeYJ76ago1PkVJq+YAa5UEe3A8xImdMOV02CvYdQ6yG1kkLNNNX/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPlfSe96; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a4002b1183so381387e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779275117; x=1779879917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPGbqHEiYmUBrYYcp6+N4mVxHnjR3wjfgDM8RhieGjQ=;
        b=UPlfSe96qIDShFmFg8AMWyuXUznSm47HDb0QfaGQ2zE1ZD2QGAcrxlerpgPLdh0/Wu
         rlVaaW6C8pn6pdJJFnU+GMnCTLWl+puokEjP7gLW20YcY1iPFt77UE0pTugfS+6zFYYs
         dZJnjeVnA9XMMVbyg5sA8uIzbk3Jf3jp2VMaavxLjJjd0yCUmFqxc2KmMD7FQnLq8h50
         QsiC728RyO6nyZhIgUUmZFqVkrwhpsVoxfL91SZ6qnJ2c0MEKEMzgtkXkNtUav3D4xOH
         weA1k4Z/gvqY8XO3UH/wfPbHQOueu/n3IT55Rvvm1dtAz3VvrwneuQLbXkBtZiROD80W
         NnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275117; x=1779879917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPGbqHEiYmUBrYYcp6+N4mVxHnjR3wjfgDM8RhieGjQ=;
        b=MF4siSy30zodBKqeSUCOfpgA5wlQd0go2m/R1O3wQIushPt7MUiDElAhOJUx0hmmBA
         /70EuwRkIzsjzqENFUr8YrdK5MRsf1pP9id0dDQBZwK/5kisyXTNgdFf+QSnWTe/CLm5
         0rgbk7YK/Fn1usXTcMpE8PJcsvURZ2iXuEWLYj19F7+S9SydgnTzCXBABDu/LZv+4UPF
         C9Zh+LXphxd2a42680McelsMYEBxX6vVBwfN92Co/tQuoH5IjR+m5RsEGJWoC62yoR20
         gr2eXpcYUPrY3MQEK8ESHYOs8rCD4FLwSZzGUkIV9hwyUUxykDAdSjotNkiywEtSRIK7
         yqNA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bka8odUFp2qjNMxsBjRWiev6nf4C1KO0e1H7zXmhwX92jplcMn7yJXJuuSGZwnNoyPqaaambHcPo7@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0GIaAmLFMVcJLEDceBy88uzsIT8eFAkRXoxb+LGhvtsY7aMj
	bhmvGCSAK3k3r7ZcCvBf0bMXaUim+GLYmHSU0wmzY+PUt5hb7SBa5VJj
X-Gm-Gg: Acq92OE1Ti2vVlPa4MBWs9AW3P8U1+iFOnPr7u8ROCF7+/gBWAHoo/mp5c1RjOQs+iG
	6iwegnWyb3hwUobp55CA4SMtxfJARuoMSKD7zAjt29vV3k7FlfTNPrIlIivGthlukWXzzhG3RqM
	FtZwIVIFGvOsz15PEAkSWfzN6WT5xk3ZpwBnVmlXampLUupuhMjNCXO6tcDC2BhJ09F9+/VObZb
	ygAV/uAMhJBQuvkTpVOuqpq454OMyAwDI11zlbnne/fciwwh57gdxJaGYy/fDu2tMhxVNcYvxIE
	Cc+Pid4z/KvXbXRGqfuyVjlxIHybC8EhUlapQMeVDC5ZNm0Atkn07XEADu/wzOF8Xco8rPHI0BW
	/lHyZnqy3OwdYPJPhyYm8266xWNsOzPW694yJABGW3xqcqIIM3m4vFQORyhgfYRD4+mVx5AOqCZ
	qysjGEW3RFVNLjNSTgXieMSct1+3IcG2vdcAZ6HP25xC58Z9vD/DNFQQjqJg==
X-Received: by 2002:a05:6512:33c5:b0:5a8:7317:540b with SMTP id 2adb3069b0e04-5aa0e74eb18mr3046668e87.7.1779275116754;
        Wed, 20 May 2026 04:05:16 -0700 (PDT)
Received: from localhost.localdomain ([213.230.116.218])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm4910827e87.70.2026.05.20.04.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:05:16 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: brgl@bgdev.pl
Cc: linus.walleij@linaro.org,
	andy@kernel.org,
	hcazarim@yahoo.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] gpio: pca953x: propagate regulator_enable() error from resume
Date: Wed, 20 May 2026 16:05:04 +0500
Message-Id: <20260520110504.13969-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37194-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,yahoo.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 229F058C183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pca953x_resume() returns 0 when regulator_enable() fails, dropping
the real error code and masking the failure as a successful resume.
The caller then proceeds as if the chip is powered, while the
regulator is in fact disabled.

Return ret so PM core sees the actual failure.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 52e96cc5f..b9c905a0f 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1411,7 +1411,7 @@ static int pca953x_resume(struct device *dev)
 		ret = regulator_enable(chip->regulator);
 		if (ret) {
 			dev_err(dev, "Failed to enable regulator: %d\n", ret);
-			return 0;
+			return ret;
 		}
 	}
 
-- 
2.43.0


