Return-Path: <linux-gpio+bounces-33785-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG0EJAxmu2lVjgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33785-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:57:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370A2C5356
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278ED313C5FB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7096389E1D;
	Thu, 19 Mar 2026 02:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWqta3mO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72526389DE0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 02:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888990; cv=none; b=WEHWtLIlbXm21N6OTJkmQfgZxF3llzgWSyaUXAVlLPWJxWx2aI+EYxKDC9A+mOV7KN0XIrcPqGj2e2yxXvdMnHJFBsoA3Ge82VKnasLBXoESF7VTNeG1O7Jnk5DXBOnhFUj/hCTauadZG0PLwptmFBkMv+iBKLLsLDBeWnKNbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888990; c=relaxed/simple;
	bh=j+TfdR2vMLzYv/kUd6Hr5UCBSIgEc4azCMqHxSkXbWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeU/hyW9k2v3mp6rIHZ5MkyCtFoxn5tXm7IPne/AnhgVzYVCqo9PcOvz/lZZngdZWplurNOSBLn4SOkN0RJrO9/F+tNG1QF7R/gsRTREyvTz0FxS2iyBBUxbONCHAk5hiPfZy3RaNMNwysHEdJ8w6PR7ZShw5mqjqjg6t5+bDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWqta3mO; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so576153eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 19:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888989; x=1774493789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgPWB+b9LbV2c18ggNpLoeCrPTB8CAkNmY8m136D6Cw=;
        b=nWqta3mOso4lZn7+gmMBtwu8ePo40ttfPa7PjyV/mb0X9/7GWTxrSn148HqlerQB6K
         0BfbFmv6nSBM1EenuSpTRCqZd8Zy7FSjpID1NnmJ01QeIzyGdRIw2pYChMH22S1QPowJ
         PogNDjAfwOzAwGu8MUxVDgcF/mO7ZXEml1oU9tIu/lqC54Q6MewOjizCEiueNoflwBJK
         ydp6VQxwQuhG3VfKzCYbYf4gOxpilCegfvYTGb9bRHux+IfeT8ylu8MyyeJ/NtboWQKI
         3i4kRNd1YBwa0Kxr698mESatsdMzc69qBUuEU90U2BOft7dlMSe/arfKJ2AyI+bY2lF7
         KEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888989; x=1774493789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgPWB+b9LbV2c18ggNpLoeCrPTB8CAkNmY8m136D6Cw=;
        b=QDrrWIS86C0T40c1IqoPZrbjBQS2X5Zj4nBkBOsjoxwUBc33kCo9MZnx5WquSAaMW8
         Y8pjrVJNfncS/NROjy6gCkZZ/SpWkCi5BwNbEFrNhrZ827jzabtQKo4W2Dp124fYZSPO
         CLEYIO1yFhX2r3jyiDvyYsuwjB3YWbC9ZP5K1IAFAWIXX7o3oaCIONms+ielnGAuwnPM
         oOZioPJeN6Jre8PY1GtnPkfrmLqfFUr+cURHS56q+Crnu72lclyFLokDBpjcHTL5C8Ei
         pwJzagbFEY72YBkKN+QohsOofpddKxTowKXl4Puh1tnhrKx7cEI99pNAQeGUv2WvdLUX
         44fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4WgPprss1MtEAAFAbYKWQWOF8Fm3BwkWoKk6TI66H1fLRnEX6xX2qP1TYmtjO3Bfvyy6L4rEtfLlR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv5JRoQyA6b8yAenshL6GWSD/t2hmj+wjEBtQAC49EK19r6418
	YuTaYD5wKSI2nL7M8IjYGAzbUp3bWb1OXdSVyj0kyuxbva0G/40h8ZNN
X-Gm-Gg: ATEYQzy5xuti7pE6+SN/y00lplektdZmiBssXYaHlC2cVnguM+pGeyVbolGOJXdY3l/
	4aV5Ctp0fa7ANBkBx9quVLr+tsPS9BtIAUfIy1wV4KyMWR9cWmsOAWPFkf9hdPFvJNfkkiYroWH
	wKlIYtupM6Bsl1yoXrxoydVADMoxPI5wQV7KCONDcRDfMo0Ka0iiy/wySYCV4dIvLxF9MgJ5Szj
	/YHosONzoeEi8epG8tMQ+HpDeOmRu5gmlTXuUg5lgoxFSHI+So8/Qdp+8iMQ+95m2k7Ekm3ByoW
	SZ2kNIeOI4M25gJFGgRDN486UvcbMfxUlRlkKqy4YPcOzMTRnQXXzW4jVglpDeaDaQdpv0w1tNv
	fhvkCzc03KaV80Fe0r8LQo5zo2SkeuLzbwKSt8acTiz85SwCtkF3F3vb3gsaa70p9msEQmGUlOh
	VyY4TE4u6azKSLUzVY/I1N1N6/ZFRLvZopyuzayJz0b4wzlK/ciLtEm0/xK5vqdb4fWabRMAWQ2
	XEA+0oqYEkxSg==
X-Received: by 2002:a05:7300:7fa2:b0:2ba:6a79:f04c with SMTP id 5a478bee46e88-2c0e50631femr2651118eec.18.1773888988115;
        Wed, 18 Mar 2026 19:56:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 18 Mar 2026 19:56:18 -0700
Subject: [PATCH v2 2/2] platform/x86: barco-p50-gpio: convert to guard()
 notation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-barco-p50-gpio-set-v2-2-c0a4a6416163@gmail.com>
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33785-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 3370A2C5356
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using guard notation simplifies control flow and makes the code clearer.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 360ffd8505d6..2a6d8607c402 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -272,33 +272,27 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct p50_gpio *p50 = gpiochip_get_data(gc);
 	int ret;
 
-	mutex_lock(&p50->lock);
+	guard(mutex)(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0) {
-		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
-		if (ret >= 0)
-			ret = !!ret;
-	}
+	if (ret < 0)
+		return ret;
 
-	mutex_unlock(&p50->lock);
+	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return !!ret;
 }
 
 static int p50_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct p50_gpio *p50 = gpiochip_get_data(gc);
-	int ret;
-
-	mutex_lock(&p50->lock);
 
-	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO,
-				gpio_params[offset], value);
+	guard(mutex)(&p50->lock);
 
-	mutex_unlock(&p50->lock);
-
-	return ret;
+	return p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO,
+				 gpio_params[offset], value);
 }
 
 static int p50_gpio_probe(struct platform_device *pdev)

-- 
2.53.0.851.ga537e3e6e9-goog


