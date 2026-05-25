Return-Path: <linux-gpio+bounces-37423-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCmBOY4AFGquIQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37423-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:55:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64E5C757B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D6E8300291B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 07:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A8B3D565F;
	Mon, 25 May 2026 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUCgxp3b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA23D649C;
	Mon, 25 May 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695750; cv=none; b=aLv9thwdkAU+xfnCUzKOjTcNj954ofTG8OZwcEGE4phcHc7oBkcMDZwkX6fRWEXIzOKzJ+nWJcFOvBh4XgxRuZ+Sjpsk68hxh77qL5Aa4sCA66gPX1gpeMmC5DKWKmw/KqGk1mMdG7FdGhhDwFAhZP4PNnGJNsdhPOgZy9SnWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695750; c=relaxed/simple;
	bh=LcYJGzA6Ip5bOzj01f04I/SJm1+EtJhIKyxQGfMYw+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ln92V3wAQWmUbGxYMlI3UO84mcohg+x8I5qWLUs5WCAQftdpHX+yanNj2aQ/vmrVefoiL2zJw4tEPLDhowzWtH70dlp3izOguDsHBMG6ZVFWTaKiDVUaUCF7JIo0IdIxArOLT5+6X4JpbYV22eb+HGy1vaaGJWgrAVrbGoPH9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUCgxp3b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7361F000E9;
	Mon, 25 May 2026 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695746;
	bh=ACjGyXRjli4oLa6o/HLH8h+it8SYZeJIvbN4HR3my/c=;
	h=From:Date:Subject:To:Cc;
	b=fUCgxp3bbDQ8vDQqCtwIff1SmkV5lDqx3E+PFn/MzlvKBwHsiKCeMOaDQ8VXoQu6O
	 sxT0eGVrVZcogbWo9tk0DJ1mggfzM/q417i91R7q8aGkjc9hkyoypxwMl6pFETxHaK
	 oHMHreX4DhUzCrCOG23eYEt66BUfyMhcudsJzvVu+MpqYNUwhUuYnZwN0r+UvxJDht
	 LWEU9+76nBqCCwtJWeXi3tI150zOn9yFsg39Vu2kAlAE/jdOmfBCbqzJWlrsK6INBN
	 6Ln+ib16UvhpLMtotS8g7pyl0rP7iaz1bSFY1+LPid8LYMpf8uZzv4XQN46N3qnF7m
	 t6ZtIOfVN9YjA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 09:55:42 +0200
Subject: [PATCH v2] media: camif-core: Drop GPIO handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-s3c-camif-descriptors-v2-1-d703e47c4f96@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7RjaCgRX3sOwKGWA8YeSDhIN4
 e4WPIDLl7zvfQsIBSaBc7JAoJmF/RBBHxJwvR06Qm4ig051nmbaoBiHzj65xYbEBR4nHwQLlet
 T7VJjywbidgzU8nvvXqsfy6u+kZu22Gb0LHH52Y9ntXn/PmaFCouyiIq1dZaZy53CQI+jDx1U6
 7p+Ae5cuujNAAAA
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37423-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EE64E5C757B
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
Changes in v2:
- Drop unused local pdata variable in remove() after a gazillion
  robot complaints.
- Link to v1: https://patch.msgid.link/20260523-s3c-camif-descriptors-v1-1-797052aab553@kernel.org
---
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 10 ++--------
 include/media/drv-intf/s3c_camif.h                    |  2 --
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..14eedd1ceb27 100644
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
@@ -504,14 +501,12 @@ static int s3c_camif_probe(struct platform_device *pdev)
 err_clk:
 	s3c_camif_unregister_subdev(camif);
 err_sd:
-	pdata->gpio_put();
 	return ret;
 }
 
 static void s3c_camif_remove(struct platform_device *pdev)
 {
 	struct camif_dev *camif = platform_get_drvdata(pdev);
-	struct s3c_camif_plat_data *pdata = &camif->pdata;
 
 	media_device_unregister(&camif->media_dev);
 	media_device_cleanup(&camif->media_dev);
@@ -521,7 +516,6 @@ static void s3c_camif_remove(struct platform_device *pdev)
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


