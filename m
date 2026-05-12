Return-Path: <linux-gpio+bounces-36682-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGNiDoJGA2ri2QEAu9opvQ
	(envelope-from <linux-gpio+bounces-36682-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:25:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E01523988
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 17:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41ACD30D1DFF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 15:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7183A71AA;
	Tue, 12 May 2026 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ujHyxUnd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849F388876
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599297; cv=none; b=Yw9uYBwAk1vId8AQ6jATJlFYky11xKH/KnWVJxGHvhCTGyELid0IGmRnOugTxXofSmkw+NbTqXJUlvzDyJyxPDOZ62Cy5bC/100pqPJLUJMebwevq2itHhHvL0ndTM8e73D14/uVUrl47dyPZhzYp62TTsIzZG7Q2z+jjHHonXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599297; c=relaxed/simple;
	bh=Gl9oc4mc/zxA99QeW0v4e5Ek2Ox01jBRjGnpUF+ZOJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hOR3m6OWcG4vsG58yXwqCbqzqyctCc7FS0kgEoZsGyiHpWOF2r/n6b0XJxzDZGHElLFD+PuJrPC48b1yFyyt5ldQescr2A4JJEucJANrRq20OeW5V/LGTx0VknTuwJR3Wy9/jgPXHpzPxwNeXFxEKz10n2vawtaHCZly0jaSLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ujHyxUnd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44a74032ff8so4232134f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778599292; x=1779204092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gPHbOJzv6pAI7J+8/BYSrMsKQuITf7Y/afIqiLHocw=;
        b=ujHyxUndH3HxUeeuKn0FcBJnXgcbCmJCatuz9OWmlpjp1R3E0C2Y4efuPKSJA1hqRy
         3HqxcRuhaPOZ1GyCvCzAutKfqhD2z9A94hOo7/4SKYDPUBamdUX6qp4QGpldVGQVTd3U
         u27Frxu/l+RbbckfzHlgn1IX6aNLceejhFoJRke0PnP3a8bwXTR8cRMY5+Ed67+bNrgN
         aO+Diw/7W1EUK1UQBhw6MCY2LyryVhvGezKs6FmlupM9Qi2rQBUkY5n4I/xyuOF52EAZ
         GnjyKMw/gE50SAiRnNZry5Vi2jIR97HfpFamqfe6h3CJOiuSZRjCqRios22NRnYIXqUp
         s03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599292; x=1779204092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gPHbOJzv6pAI7J+8/BYSrMsKQuITf7Y/afIqiLHocw=;
        b=WuXhJ+naYzYIrGbckb6GhRZFTlGG/a+geycTJsIg89HYfrkXyBoLhXlmW+fnHqsrzY
         88SzlXP/hj7W0sgqiSFcoSF8+Z57q9fzF9DOepyP1l1mlFM/I6SiPmZqyb3oo5AMowPp
         2wZiIWjaufnRrFMx4fEgGiYwkWMmDUcojjX1gUjr1RKuxCFdWOcReNIqcxAekdME9ToX
         8cMG/wMPWkx4cYl+wy+vmkXB0VcMfUDG/X2cVQJj48O5PCBkBLvxudUoFBjSJoiLH8WQ
         crLaYIFAmP2H2CzLUSWTej2WPjDWEg6aZUgshst5X12dBHeHY2M9o1mNKPudLqzxGxyM
         SwzQ==
X-Gm-Message-State: AOJu0YyaCftH8k8oaLmicHWolZWXYUpgPvK8uc3hMrMJQDahvfMt6kt7
	rs2WnyLUmxUQ3i+tXZVqeoLz87hf7O7YOiyNezVLV784yNC5eap4KxNuDyJvvx4FmPw=
X-Gm-Gg: Acq92OH/aVvFw49woQtUgZ+Toa1E9laLoxvVZ6AvbugCyT+aVDuEK7ilJ27ehZH2Qye
	FskrNkJGxPOTnu9/xOn/rpTnVcCmBIFc2fVYhRU/ALwSc5f0MiDHi55DAc7BJuT2ocpVHmB0Sjr
	NbumMiSAGkPkkJ7oENxO6oujnHjjm/HTighINmtVnFMuTmL6y1q1YiBcOGuQZskCDD6j7LVMjcg
	aaSWuwdjaqLUj99m8vym8GfB4DWQKe67omnFpuo3ou8bgiztrLif2RLDsJeVB+cGvubAdDMDajT
	VzANlg651brC5P3UWCV8YpZ5xfJQf8v4P+PlvpvIzpElv9CnCllbaBAjXQszEEjfG1miCpQ0rrP
	OE+NHGglRFH2naaRSJFlCZq1z7ihjdt8qtsBdopsOuNt32vUjVmD39zfi9F2BAlL9WtCciqQOIQ
	xPYTEft/fjhUxKR/qiKd9CAc9TDx7ypBvBnpKiiv0wNt+KrIDzrkwDd0a5estunSIBGpLyn1Mwp
	0z/ob//nXYKCVkGwU1oTgZjtw==
X-Received: by 2002:a05:6000:2383:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-4515d4d107bmr49219238f8f.34.1778599292262;
        Tue, 12 May 2026 08:21:32 -0700 (PDT)
Received: from localhost (p200300f65f114e08229f8c404acd2182.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:229f:8c40:4acd:2182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4548ec6be40sm34729467f8f.12.2026.05.12.08.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:21:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Initialize i2c_device_id arrays using member names
Date: Tue, 12 May 2026 17:21:25 +0200
Message-ID: <20260512152125.924433-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9467; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Gl9oc4mc/zxA99QeW0v4e5Ek2Ox01jBRjGnpUF+ZOJg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqA0V12e3BJfynoO/YF9n1hHI+DKVRRdZXET6Ws f2c3jh5IJuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagNFdQAKCRCPgPtYfRL+ ToT0B/9nOJ2GS2Fmx4f/pdsU48/ZUGT3TWwg7dItOsTQmA+xpcSoS/MqEf1GrvdSZReEcrp5Qph PNcsvHflfbGNA0imBgfwKB9X3DYKUlakFp9PJUD7bAnP/Fdj7gP7KlgnAqbrnTfVtxLIcj7ezpj 3fSSX9TMTqYczAwm42mCkLk0Jg1rz8jjlPqptvkQ6U3g+VgqaDcCuXNF+j++kAmXZTR87ciNEHZ YpDGO/JodppUIVDm4h/RMwcyhTsa2LMDURmMh7PnRG+wmmZ0PJnwO77Oy1H60N5LkMWuA56z/Fg 3n7ml3R5o3wctdi6pYSzUf4jBHdJD9iRAgrKBSQBWW1bCdRI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 90E01523988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36682-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I didn't find a GPIO driver that benefits from the continuation of my
quest with the union in struct i2c_device_id.
See
https://lore.kernel.org/all/cover.1778582187.git.u.kleine-koenig@baylibre.com/
for an example in a different subsystem.

But even without that, I consider the changes done here beneficial.

Best regards
Uwe

 drivers/gpio/gpio-max732x.c | 20 +++++-----
 drivers/gpio/gpio-pca953x.c | 80 ++++++++++++++++++-------------------
 drivers/gpio/gpio-pca9570.c |  6 +--
 drivers/gpio/gpio-pcf857x.c | 26 ++++++------
 4 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 281ba1740a6a..24c67c912954 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -103,16 +103,16 @@ static uint64_t max732x_features[] = {
 };
 
 static const struct i2c_device_id max732x_id[] = {
-	{ "max7319", MAX7319 },
-	{ "max7320", MAX7320 },
-	{ "max7321", MAX7321 },
-	{ "max7322", MAX7322 },
-	{ "max7323", MAX7323 },
-	{ "max7324", MAX7324 },
-	{ "max7325", MAX7325 },
-	{ "max7326", MAX7326 },
-	{ "max7327", MAX7327 },
-	{ },
+	{ .name = "max7319", .driver_data = MAX7319 },
+	{ .name = "max7320", .driver_data = MAX7320 },
+	{ .name = "max7321", .driver_data = MAX7321 },
+	{ .name = "max7322", .driver_data = MAX7322 },
+	{ .name = "max7323", .driver_data = MAX7323 },
+	{ .name = "max7324", .driver_data = MAX7324 },
+	{ .name = "max7325", .driver_data = MAX7325 },
+	{ .name = "max7326", .driver_data = MAX7326 },
+	{ .name = "max7327", .driver_data = MAX7327 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max732x_id);
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 52e96cc5f67b..94bb1a9f9268 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -86,49 +86,49 @@
 #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
 
 static const struct i2c_device_id pca953x_id[] = {
-	{ "pca6408", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca6416", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9505", 40 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9506", 40 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9534", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9535", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9536", 4  | PCA953X_TYPE, },
-	{ "pca9537", 4  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9538", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9539", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9554", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "pca9555", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca9556", 8  | PCA953X_TYPE, },
-	{ "pca9557", 8  | PCA953X_TYPE, },
-	{ "pca9574", 8  | PCA957X_TYPE | PCA_INT, },
-	{ "pca9575", 16 | PCA957X_TYPE | PCA_INT, },
-	{ "pca9698", 40 | PCA953X_TYPE, },
+	{ .name = "pca6408", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca6416", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9505", .driver_data = 40 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9506", .driver_data = 40 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9534", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9535", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9536", .driver_data = 4  | PCA953X_TYPE },
+	{ .name = "pca9537", .driver_data = 4  | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9538", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9539", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9554", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9555", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca9556", .driver_data = 8  | PCA953X_TYPE },
+	{ .name = "pca9557", .driver_data = 8  | PCA953X_TYPE },
+	{ .name = "pca9574", .driver_data = 8  | PCA957X_TYPE | PCA_INT },
+	{ .name = "pca9575", .driver_data = 16 | PCA957X_TYPE | PCA_INT },
+	{ .name = "pca9698", .driver_data = 40 | PCA953X_TYPE },
 
-	{ "pcal6408", 8 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal6534", 34 | PCAL653X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ .name = "pcal6408",  .driver_data = 8  | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal6416",  .driver_data = 16 | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal6524",  .driver_data = 24 | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal6534",  .driver_data = 34 | PCAL653X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal9535",  .driver_data = 16 | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal9554b", .driver_data = 8  | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "pcal9555a", .driver_data = 16 | PCA953X_TYPE | PCA_LATCH_INT },
 
-	{ "max7310", 8  | PCA953X_TYPE, },
-	{ "max7312", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "max7313", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "max7315", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "max7318", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "pca6107", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "tca6418", 18 | TCA6418_TYPE | PCA_INT, },
-	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
-	{ "tca9538", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
-	{ "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
-	{ "xra1202", 8  | PCA953X_TYPE },
+	{ .name = "max7310", .driver_data = 8  | PCA953X_TYPE },
+	{ .name = "max7312", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "max7313", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "max7315", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "max7318", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "pca6107", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca6408", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca6416", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca6418", .driver_data = 18 | TCA6418_TYPE | PCA_INT },
+	{ .name = "tca6424", .driver_data = 24 | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca9538", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca9539", .driver_data = 16 | PCA953X_TYPE | PCA_INT },
+	{ .name = "tca9554", .driver_data = 8  | PCA953X_TYPE | PCA_INT },
+	{ .name = "xra1202", .driver_data = 8  | PCA953X_TYPE },
 
-	{ "tcal6408", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
-	{ "tcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ .name = "tcal6408", .driver_data = 8  | PCA953X_TYPE | PCA_LATCH_INT },
+	{ .name = "tcal6416", .driver_data = 16 | PCA953X_TYPE | PCA_LATCH_INT },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index 4a368803fb03..7a47a9aa0414 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -163,9 +163,9 @@ static const struct pca9570_chip_data slg7xl45106_gpio = {
 };
 
 static const struct i2c_device_id pca9570_id_table[] = {
-	{ "pca9570", (kernel_ulong_t)&pca9570_gpio},
-	{ "pca9571", (kernel_ulong_t)&pca9571_gpio },
-	{ "slg7xl45106", (kernel_ulong_t)&slg7xl45106_gpio },
+	{ .name = "pca9570", .driver_data = (kernel_ulong_t)&pca9570_gpio },
+	{ .name = "pca9571", .driver_data = (kernel_ulong_t)&pca9571_gpio },
+	{ .name = "slg7xl45106", .driver_data = (kernel_ulong_t)&slg7xl45106_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 3b9de8c3d924..c942b959571b 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -20,19 +20,19 @@
 #include <linux/spinlock.h>
 
 static const struct i2c_device_id pcf857x_id[] = {
-	{ "pcf8574", 8 },
-	{ "pcf8574a", 8 },
-	{ "pca8574", 8 },
-	{ "pca9670", 8 },
-	{ "pca9672", 8 },
-	{ "pca9674", 8 },
-	{ "pcf8575", 16 },
-	{ "pca8575", 16 },
-	{ "pca9671", 16 },
-	{ "pca9673", 16 },
-	{ "pca9675", 16 },
-	{ "max7328", 8 },
-	{ "max7329", 8 },
+	{ .name = "pcf8574", .driver_data = 8 },
+	{ .name = "pcf8574a", .driver_data = 8 },
+	{ .name = "pca8574", .driver_data = 8 },
+	{ .name = "pca9670", .driver_data = 8 },
+	{ .name = "pca9672", .driver_data = 8 },
+	{ .name = "pca9674", .driver_data = 8 },
+	{ .name = "pcf8575", .driver_data = 16 },
+	{ .name = "pca8575", .driver_data = 16 },
+	{ .name = "pca9671", .driver_data = 16 },
+	{ .name = "pca9673", .driver_data = 16 },
+	{ .name = "pca9675", .driver_data = 16 },
+	{ .name = "max7328", .driver_data = 8 },
+	{ .name = "max7329", .driver_data = 8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


