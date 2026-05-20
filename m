Return-Path: <linux-gpio+bounces-37176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLqzHVpnDWoKxAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:48:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC50589248
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5BF13022256
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AE036EAAB;
	Wed, 20 May 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZkM73Noy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF33921DC
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263303; cv=none; b=l0mSY+C5BMr42ilB1QI5eizCkYYq1AkohkAqJoM25Qasc6IEH3DGlizn0aeSt/MnmM50lxGYYc0BXxCS0Z4EXKFExhpXYwmLWYwnaExO6xi7GjT3Lh2KjaaP+JQtHc4oQArudnodvW+zYKp5/cywjUhxLcXO6xcIgmfPo2lHUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263303; c=relaxed/simple;
	bh=8oizMrjeWfteu1vloj6toZPSwmdcNwqp1/bOet7ng5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hkN6sJMt/RtRbkmAwE6AKClMzfX8atm8L4jqoIFgJvuyMwD9wdexLCsolk7bzGcmjdaLhacyAKOl+okZ6ltjOD+7b38elLvnZO3tQ/FgMIGSzA4wcsxRwu+6X3cIQI1fMe9e8nC4tGbLVyqVbm+vdsYxrV23jlYo6vWQIrexacI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZkM73Noy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a5174670eso2521053f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779263298; x=1779868098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LHKYBHNO9m3u0CZa7cLjg4ja/mnIoKgguwmanDDcf+E=;
        b=ZkM73NoyQVLRk8kbAvpL8KacbhLv0WcGexGeo9UEEj5ARzk3D+7Y4/LUxlwkZDunHS
         AyTddPXuJy5sAenk7ixeC0bwsw0mak/6lUEYrPmLZMPOGgtp5J8IYA6egl9eYyFkA2/1
         H0niQ/9e3McpZkSqN5PtmCI0N0tZ907VWahjCSw0ZooX9eMIKK0xI/ItipEVDCoM56WR
         pi4CBCPelgcEmXcgNFMu4YW6gaEE8w3UbQK8w4Ye026pbILCZ2gjYMkGsKfNKvNInMxw
         K6ulLV+6d+JLu79OVkA59WJEdbPqPqcfaztPGr8sF9Pa36ydvKWj0k/M6Km31FEF7OKJ
         CI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263298; x=1779868098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHKYBHNO9m3u0CZa7cLjg4ja/mnIoKgguwmanDDcf+E=;
        b=e6iePdK615icOVfQhtGpSNJPu00WuFhJcObyX/yx3wGPdRokdoZRwP+aZsCsv9RBO2
         pG3P2YM/CDnZKpEjq/GGSU3cBA3AAdurZBzfisKMfjZ2SgItGSuDzajIb8MGukQv9fD5
         rdCP//OIlVB/b8lwRGwiQJIcaZeg5myiQrjTnH+qUVUzPvCAgn0dlaDRoIwPUPEc0GaW
         m3AZPD937N09drxphAfvSYEoXjciGMrT8Wo32oD4JQtUP+owQNEz2UvN+7+KniGOvT7n
         mgHmQmIjDMtuzc8tipu120Z5STs/fahL24O3737cVs2TRnzpWE7Gi2+kWZNBOQGihjz4
         WD5w==
X-Gm-Message-State: AOJu0Yzn/xBMagZ71tqB1ecoWSqfYSEWoyf+psIY/UF/nZs2frpUMYP8
	E3kQAYujcz+igDoH3jge4XoTIR09rHp8COgp93lGECPaiOw2N0R24PBYrWkEkifQmrs=
X-Gm-Gg: Acq92OGNNA1Q8ujzqYxktvAcJa+Dh+HHTEnfLq72djm9o1xJ5LjXfeyEykyMvdLYri9
	E9YCVhgX3u8WNg4eXfZC1aiNPIXOgWssxQzS8nK6zQ0Jq1STABPqSuXEQPXQ5qVQ9UDBPwNN1TG
	mhJExlDux3l7X/y+Y5JF6zp2qKcukNjXA5sEBcfNWtZ2YzJ7vr+ptLletSeC3SL7RZz0Hx3IYgQ
	X2hXGKeCYvwIC6T/hzr47PX9+WpVivkoXvPO+mmY6o25hcZzOcICxPHGI3X9ikxotXq/faRYcvF
	JvxI3P3T0rxWOCVU+vzfFLM/msLH0SzspqZyhTuYv5s1CPd93b+z/66/nOM50LyKOcnNiUiDRjt
	Bj4YZe3nTXwdDRxRzaEJ9coDy+T0XVW5phU5WiUgu8V4xJdUbH2Tx/abqaa6TU0+Ulb6DSJ43BY
	Q66qp4WzBOycfIdi61qOTqIl1GldhWy4aWaQUiJmtmoV/l8BQOPJfuRwDShvCI7jCjG8DJxMSQ/
	ZfXK0LscryT081iGaP8cA5WOw==
X-Received: by 2002:a05:600c:3f0a:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-48fe6612a59mr357435925e9.29.1779263298403;
        Wed, 20 May 2026 00:48:18 -0700 (PDT)
Received: from localhost (p200300f65f47db04a02ef40d8e5825ac.dip0.t-ipconnect.de. [2003:f6:5f47:db04:a02e:f40d:8e58:25ac])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0fe1a41sm56072517f8f.31.2026.05.20.00.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:48:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Initialize all i2c_device_id arrays using member names
Date: Wed, 20 May 2026 09:48:12 +0200
Message-ID: <20260520074812.1632512-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4321; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=8oizMrjeWfteu1vloj6toZPSwmdcNwqp1/bOet7ng5A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDWc8ZpehEtlT/cjK7lMWny4yMSE/0QWYJsa4u 8Munn/R+LOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCag1nPAAKCRCPgPtYfRL+ Tlk5CACSwtA3Tb3VYu13N3C814yOGLEShBgljiCfWQ2ner4pCPyUyYLI4a2+ruOrS/o49iQxYWd tS5cN0rGvI0M40LPy+drqlAGmkQQ4UgFkm+HVhQJSqwBf4vNcPySo6sm5IibVK4EjeNi+PoqOjj GZHJRzysXdgW0LI31NIFwpjn2OTaP8OAqTTX7kL5jRX/D3dkyVI4kszzsPvh++eSJMzx8ZoXqdl K7LoWsjSPbEdxX9RO4qbxRExCjEl/EDZ92AhN1/1ImoXZVyKIIT+RlH3MoaoGoKuGJGS489MalP l8RcJ0kujMWqWjKulJlnW0dx9cshtxqSU8cZt/zwqrSrWFnF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37176-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DFC50589248
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The previously applied similar commit 553e26a45e0e ("gpio: Initialize
i2c_device_id arrays using member names") only handled i2c_device_id
arrays that also have an assignment for .driver_data.

For consistency also convert the entries without such an assignment.
Again this is a modification that has no influence on the generated
code, it's only more robust against changes to struct i2c_device_id and
easier to understand for a human.

While touching adnp_i2c_id[] drop the comma after the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

as requested in
https://lore.kernel.org/linux-gpio/CAMRc=McrnORJbik6QYB-ps7fjxXb24VbB8R9pBgnXzL5xj8aVw@mail.gmail.com
here comes a follow-up patch for the above mentioned commit.

Best regards
Uwe

 drivers/gpio/gpio-adnp.c     | 4 ++--
 drivers/gpio/gpio-ds4520.c   | 2 +-
 drivers/gpio/gpio-fxl6408.c  | 2 +-
 drivers/gpio/gpio-gw-pld.c   | 2 +-
 drivers/gpio/gpio-max7300.c  | 2 +-
 drivers/gpio/gpio-tpic2810.c | 2 +-
 drivers/gpio/gpio-ts4900.c   | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index e5ac2d211013..27a80d1143a1 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -499,8 +499,8 @@ static int adnp_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adnp_i2c_id[] = {
-	{ "gpio-adnp" },
-	{ },
+	{ .name = "gpio-adnp" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);
 
diff --git a/drivers/gpio/gpio-ds4520.c b/drivers/gpio/gpio-ds4520.c
index f52ecae382a4..5add662a7ef5 100644
--- a/drivers/gpio/gpio-ds4520.c
+++ b/drivers/gpio/gpio-ds4520.c
@@ -54,7 +54,7 @@ static const struct of_device_id ds4520_gpio_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, ds4520_gpio_of_match_table);
 
 static const struct i2c_device_id ds4520_gpio_id_table[] = {
-	{ "ds4520-gpio" },
+	{ .name = "ds4520-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ds4520_gpio_id_table);
diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index afc1b8461dab..45b02d36e66f 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -150,7 +150,7 @@ static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, fxl6408_dt_ids);
 
 static const struct i2c_device_id fxl6408_id[] = {
-	{ "fxl6408" },
+	{ .name = "fxl6408" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fxl6408_id);
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 2e5d97b7363f..bf1f91c3c4a8 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -109,7 +109,7 @@ static int gw_pld_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id gw_pld_id[] = {
-	{ "gw-pld", },
+	{ .name = "gw-pld" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, gw_pld_id);
diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 621d609ece90..62f2434c0d79 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -53,7 +53,7 @@ static void max7300_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max7300_id[] = {
-	{ "max7300" },
+	{ .name = "max7300" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max7300_id);
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 866ff2d436d5..c38538653e99 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -112,7 +112,7 @@ static int tpic2810_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tpic2810_id_table[] = {
-	{ "tpic2810", },
+	{ .name = "tpic2810" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, tpic2810_id_table);
diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index d9ee8fc77ccd..b46b48e56c56 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -175,7 +175,7 @@ static int ts4900_gpio_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ts4900_gpio_id_table[] = {
-	{ "ts4900-gpio", },
+	{ .name = "ts4900-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ts4900_gpio_id_table);

base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
-- 
2.47.3


