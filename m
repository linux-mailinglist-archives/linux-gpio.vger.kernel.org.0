Return-Path: <linux-gpio+bounces-40026-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTj8DEzlVWrsuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40026-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94550751DBC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=BNfyB9e7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40026-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40026-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A94B3309E1B3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DCD3F44FA;
	Tue, 14 Jul 2026 07:25:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73283F412C
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013937; cv=none; b=JAJMjvqhGCSiKKdie72ucwwnayzY4Ankcl2GYcLUiOZvLwKIIwK7p2s8vyPiAACZYB0PJ8XN/pUF+qKD0bpkDUy7SWxnRCyxnG31Vl+j0FL7MnKEnH/gSKboCseoIzNkfVAdK1I1lgQ0dSs3N5crCDhxbgvHc0gD4KL28ua9QM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013937; c=relaxed/simple;
	bh=sgUY0S/Wf6RKVdL/O7MaAprFuyCblfcodNo+HtW7MRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HY7ZviENmkBNubHmcnEvLgeMy208nppSrXeiwuciS3h2UvzopnkUwZwJClQ6yxTzida0cFz07b3lPl8hk1kRwqyZQab+Cn+6GmPKk7JSUPeuesr9LMhlCbZNl8AKdO3KWhgcbZUjHGp34Mo3koTIi96S5lpCnMwPiFIGh8OUjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BNfyB9e7; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c7902f47so35612865e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013934; x=1784618734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7XEu1anbxbFM/7L/MYZGDwApZe9SlYQE5kSCv2TCY90=;
        b=BNfyB9e7xgMFrNF5zELof8y1WzpPPwNX6nLxdNm0oi0gq+HWuwbISvAHu9ANcqJgww
         WIjOg1Qvdv8BlNO46bx28srn5Z+E0IUtwkXY0hHoPOYepJvfIRGX2JBQ+RnwckTRu3rn
         yYA/mdYerMeUiDdT2ko7d2fcTq/1Z3e+IvEdr3D3G9p7AP9xUy/i+WJM5rG/SpJIJMt+
         4uVUi0fg+gotkSkJseoXS4sSnti7X2xO8Or0O2rvDV8h5MB59v8Ux7aOgVpzEod8Ob6I
         96Zqlk27fGFoHTbO9BsSb9++ZfRo0bV/LA9K+xvJRmzz07V1Ns2rICzfBHYIDYrxa7rM
         K8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013934; x=1784618734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XEu1anbxbFM/7L/MYZGDwApZe9SlYQE5kSCv2TCY90=;
        b=el/pRaRdY/z1cDQX2xLEe8QhsOF3igbTF3HcPA1scBHffU8ApegBMpAsFWhzyaBXeU
         QK6RwuuyWWBW27O6WX0iIMxgl8itYjkEdCSOccRBDwR6DH0ew02XnIDUOvdoIjV8+YEh
         P7oucStKYxtvIoPyx32qCQ8+rDptA5kZi3yo2Di/jdVAEeNsdHL+MOHryp3I2p8MFwHg
         mprXWjLkMvG8P9VTTt8VWpkK6bCDqFALiHDgBV7iNZYJetufYEYehAvIa22faL4vGKRi
         yzdRy0QBVCWuEqsS5JPXSe/CouCnFVfvNjFukHMBypyt354kycBuWlzcT9EbqUlzOaOq
         ZnLA==
X-Gm-Message-State: AOJu0YzQ4CKFyMvhQBXUEgZBrjazy79cP9JFNVxoN2L1xH4l0u0Ipqh1
	njK3p8xATowi3W6r7+ucRY3r6Ld3HMdPvrwht314EijKOkiAyV3Q/26xD9bzrIm7rEY=
X-Gm-Gg: AfdE7cnmmVfXobchOSylUZ0uw4bEi6zix7AcEqQNzoe0sDl1ZX6jMu/9weD/lhAHB5+
	wSV8etVNKSfVrFGFATFro6jVc2MB1hrGmFddK8rW/7wuv47NEi2nT+B+pzSylra5lIaXVfCQQsB
	FVI4ReAi8E0S9Xw0BoWeoWamKyw1xwvYr00EYStjutyARNkh+9TZgBVUd6YSxQ6PUSEYSoZ6lcw
	+XScNP4Rqc4hIUOhy10uztZQhayik+vzCxjoabsHHHXe+ebiwLRdKeAi+vvvsaTV9Eg8MuO1QHk
	A5+t2cWmAPXhbriNwZVbbAKK6sEzhyDskpB4b30U5anyYIVzkKhvnh8PqIljn5z4NUj+uL/Uekp
	hTi01oIVSiY/blCdCrmMdX6uqNn4CpLD61pj75i8hY3G9fV/ucvCaRtY1nK8XvLw6paLgoEjwvk
	0vUSXKS6KXUsEFO91Kp60bQKcsZoyuHH13n+h1/gAjS8eBIxFcZB4C5i2FX8D7iRT6dbEexORWz
	Ct5
X-Received: by 2002:a05:600c:34c9:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-493f87db53dmr121999225e9.7.1784013934063;
        Tue, 14 Jul 2026 00:25:34 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4829896asm4179394f8f.23.2026.07.14.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/20] gpio: Use named initializers for spi_device_id array
Date: Tue, 14 Jul 2026 09:24:13 +0200
Message-ID:  <16f9e5106e024be75d81d961789904646f877c07.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=sgUY0S/Wf6RKVdL/O7MaAprFuyCblfcodNo+HtW7MRQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQ5bOVqLA0jNqOvnpZ6TFYaVn2PtX9Qqxw60 oz3MiaVcdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkOQAKCRCPgPtYfRL+ ThRgB/0S8vlPK0ElJZy9CMQWoFSiGBFueCB8TxZq4f0kyaKb2RT2wNnvYBTeZku8+HxxQ+M5Yxb PIMggDqCVLui1qq3yxJkq2HqxerNkSw32zlvf2yDBwB2HpWNOxlCmyRwIVEs6lC9YK0MxB31qZP 7VqgBmwwN6zuN0+pHod0yGfCwFSeKAWJg1K7ScfI9CesmvHBK2s77JdDiSNmexAhymF/IohdKOy OX8esaeNcgwW3Bi0r1FCqKdgHrM4MnZB2CX0Lh/ILecbgsVfOlrHPWvCyJNkd/cYy3r3tbmr3Zg JTSgtvJLSBNDRa4SbOccJ3aDA+f5kN4A51JR/xZoB/VHA9nn
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40026-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94550751DBC

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union (though
none of these drivers uses .driver_data, so this patch isn't strictly
necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 12 ++++++------
 drivers/gpio/gpio-max7301.c  |  2 +-
 drivers/gpio/gpio-pisosr.c   |  2 +-
 drivers/gpio/gpio-xra1403.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 6e6504ab740a..b06fecc98633 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -449,12 +449,12 @@ static const struct of_device_id max3191x_of_id[] = {
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
 
 static const struct spi_device_id max3191x_spi_id[] = {
-	{ "max31910" },
-	{ "max31911" },
-	{ "max31912" },
-	{ "max31913" },
-	{ "max31953" },
-	{ "max31963" },
+	{ .name = "max31910" },
+	{ .name = "max31911" },
+	{ .name = "max31912" },
+	{ .name = "max31913" },
+	{ .name = "max31953" },
+	{ .name = "max31963" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index c8bf6a9c3de0..9db20c22ba9f 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301" },
+	{ .name = "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 2732ea8c16b7..75a8f3efaf94 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -150,7 +150,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id pisosr_gpio_id_table[] = {
-	{ "pisosr-gpio", },
+	{ .name = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index fe0fba6ea902..3713475bdb75 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -185,7 +185,7 @@ static int xra1403_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-	{ "xra1403" },
+	{ .name = "xra1403" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
-- 
2.55.0.11.g153666a7d9bb


