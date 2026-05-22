Return-Path: <linux-gpio+bounces-37391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHUsOXbaEGogewYAu9opvQ
	(envelope-from <linux-gpio+bounces-37391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 00:36:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B575BB26D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 00:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A7C0300D36F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2B93909AC;
	Fri, 22 May 2026 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJM13lUm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA830EF90;
	Fri, 22 May 2026 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779489395; cv=none; b=fOBU5w5LplZPEJpldpY3VryF2hPa/aBZvyoFM63eq3LOTRt7uSyprWLdKNvJG+KrkFeY+2nUhBzLjXPeqv7gKGsRCth5qjw4Af+/WafylIdFR5MQozULjJIQcMujlpwcMUD9iTMYouABl9eRoYD7elJSvxqM0BSmJmFLjoeZ90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779489395; c=relaxed/simple;
	bh=DsFrLy1QnmfWFDbon41lWyQaVdRD1IbMP6ozeZW94Ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bFwEg/M6bdIo797RwJaLKxBqrnra72M832fR8TkK7daf+RZj1S2La21uXYgDMY6WOXACxkJiS1I0yIKUZVq98AiIb1TAi9pFhaEU4CLjFi7oBppfwAQkm0yZv/LW3urN+Ir71JsTOxQF5kFPr2B/qFkNvEYsEmA1r7RKzw8GRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJM13lUm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B643F1F000E9;
	Fri, 22 May 2026 22:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779489394;
	bh=6njRsw02iSRnqRZYZKADbmfJ16iyqvzEz/yxpdPwiws=;
	h=From:Date:Subject:To:Cc;
	b=gJM13lUmR9iFlNe65UcQTtky7kQ/5n05Waz3y72Kk3S1Jsb+tQ23erOPvN2HFZMft
	 b2gssuvysm+IN9dzoIeX2lWjpTIri5QjW4rQnY5slehKEoEJLdP29rYnHcY8/RqqVk
	 EKb1HG6yip5h4evB/A7Zax9WeElIFHCIB4sSm25J/EN9J8FisMjBBVauQx6o6UyvXM
	 YuzOiLH+gdvteVaDG/VlxBTqUGLrFWTNt4mlqPETFscLkA/OhSbgg8b/bDzgM400U9
	 XQwwF+9GL984VQfTLo6BARwfJGExfbGGyi00mLefYyFr8TgNn+bqbpWV/qsPrtyUtD
	 9J/uLjP9FHNvw==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 00:36:30 +0200
Subject: [PATCH] media: camif-core: Drop GPIO handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g2MM2ppr1JcjJloU6hKolIQ7
 96xXb7F/zsYq7DBvdhBeROTacwoLwXQM44Do6Rs8M43rvYBLRBSfEuPiY1U5mVSw2vZ+KojF+I
 tQW5n5V4+v++j/dvW7sW0nDM4ji+0Cit9eQAAAA==
X-Change-ID: 20260523-s3c-camif-descriptors-71624bc03a9d
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37391-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A3B575BB26D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver and platform data refers to the legacy GPIO API,
doesn't really use it, and also calls some GPIO-related functions
passed as platform data.

This platform data is not used anywhere in the kernel.

I'm not outright deleting the driver, just deleting the bogus
GPIO handling. If outoftree developers want to fix up the
driver the GPIOs should be defined in some kind of firmware
node and be obtained using the gpiod_get*() APIs directly
in the driver, but I don't even know what these GPIOs are
since they are hidden in platform data that is not in the
mainline kernel, so what can I do.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 9 ++-------
 include/media/drv-intf/s3c_camif.h                    | 2 --
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..1304d4191dd6 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -412,7 +411,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 
 	camif->dev = dev;
 
-	if (!pdata || !pdata->gpio_get || !pdata->gpio_put) {
+	if (!pdata) {
 		dev_err(dev, "wrong platform data\n");
 		return -EINVAL;
 	}
@@ -429,9 +428,7 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = pdata->gpio_get();
-	if (ret < 0)
-		return ret;
+	/* FIXME: get GPIOs here */
 
 	ret = s3c_camif_create_subdev(camif);
 	if (ret < 0)
@@ -504,7 +501,6 @@ static int s3c_camif_probe(struct platform_device *pdev)
 err_clk:
 	s3c_camif_unregister_subdev(camif);
 err_sd:
-	pdata->gpio_put();
 	return ret;
 }
 
@@ -521,7 +517,6 @@ static void s3c_camif_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	camif_clk_put(camif);
 	s3c_camif_unregister_subdev(camif);
-	pdata->gpio_put();
 }
 
 static int s3c_camif_runtime_resume(struct device *dev)
diff --git a/include/media/drv-intf/s3c_camif.h b/include/media/drv-intf/s3c_camif.h
index f746851a5ce6..00d83620ea5f 100644
--- a/include/media/drv-intf/s3c_camif.h
+++ b/include/media/drv-intf/s3c_camif.h
@@ -31,8 +31,6 @@ struct s3c_camif_sensor_info {
 
 struct s3c_camif_plat_data {
 	struct s3c_camif_sensor_info sensor;
-	int (*gpio_get)(void);
-	int (*gpio_put)(void);
 };
 
 #endif /* MEDIA_S3C_CAMIF_ */

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260523-s3c-camif-descriptors-71624bc03a9d

Best regards,
--  
Linus Walleij <linusw@kernel.org>


