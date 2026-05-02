Return-Path: <linux-gpio+bounces-35987-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHEMDMJm9mnLUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35987-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 23:04:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 818834B37A7
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 23:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B3E3009CFD
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2026 21:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1181B3845C1;
	Sat,  2 May 2026 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQpkw0Sj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D12DF13B
	for <linux-gpio@vger.kernel.org>; Sat,  2 May 2026 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777755838; cv=none; b=hUNaKEWl1X4zY3GWY9jlR68x7hEUmo5cFO4QOESwJVhYf4Y/5+zf9nYZzF5L5mlXrO+OqpUVbP1ecuowRz2dazPp8vTcbWuQuZ0FXGRKMXOm+wbacxpGP91DPmCnUq3BpQYKOvthzqjZAOIymFUmzWiVfMtxZO2t+q0+bjZT+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777755838; c=relaxed/simple;
	bh=lZd9s9yoPsQUriY4xkanImtClh6pgHtvv7FRMhtvNXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fx4fC1ET0xts3eLuF1iqOmR9159gyppSURsTacqFQ3gGP6dTJpiHlQ2wSKx4gHTteK9t+GIcba/vn41snZ4YLX/x1zfERu2UQjN6WWGWQgTeZmsde5ctLUWPLkP+F0w1Vk2C9Q6BmScJ5SjgZ+Kbp1mRak656SBGWilAsrVVFEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQpkw0Sj; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so2429496fac.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777755836; x=1778360636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx4mDW/25vd+W+emY9Z3Sk1SnuGW0v8LhZC0rkW6q2o=;
        b=nQpkw0SjlpND0ViXAcuq7u1VJv1Y7kWUrsjPv9RYh6W3lDg339Wjk1Fm9lzsJhQb3l
         bMH3t2OAVgUoKqCp9uiIfqh9pYqR8Fu7P4ViXBEV1i9anzCOl1qsd17rgRsJvAJT592S
         6ye6Xpdn4uP4Uay+EykpHS58Ha3ZUc4pplcvArg13Jxi1mulMmGZ/q45PGBTDA8HkyvI
         ldFa9NNa82xcHUEYGS9SVcT54pWHBO7cEWieZp7ghIQeCJ8AlJkcHbWXcNmE3WF757R/
         A8Ar2SJBdMxhj7TCsLBvwd+PD+Fg6CfGIePZEvje9u6dmjSiC5NqNa2V4WDXgvj9B0K1
         TCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777755836; x=1778360636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx4mDW/25vd+W+emY9Z3Sk1SnuGW0v8LhZC0rkW6q2o=;
        b=Fe9kKbLyWlj6mCwv3huaOhlmS4CZs8HgeXfM5JsvbYmAiB/AxpAhx+L4qslohNgpbM
         4IUA0dCrg8c59bmpNdiOswvnrQcAoazMCObfhQheJThsDo8UrmqkDQadEZukhMU5t+xC
         +X/opljHxf8sVylB+if2kO83nIpjvYPRbkD2Rrr9qbT7NFpP0RICT28/gHl4q/4dIzK/
         fvsmxWYIVNHylrmzPiAldnQZYtdbZjGteOciUqZsPCLa945L0+983F3ucpLBPdNwfvJr
         XhexA5pcpPbRDv8LzF19bLYVuNxuEbYUVEAMuyFzEbGXXxw7msl1q4BtvFPlbwPJPD3H
         k+yQ==
X-Gm-Message-State: AOJu0Yy7NBkzP6AHWX6iRMU1zVSlDrp8woVZzO+dx9T/CvuAuFYM+cbM
	l27cM11ImD+bCx5oDxUbxT4XQA8YyMg4N8oVEe+px4DQg6MiJIfMdO+x
X-Gm-Gg: AeBDieu7ON0CjRtVIQqTnOxspjOdSqjcIWjufqf75q12culgbkgowyUPKdn03HKszkd
	q6HeB4DzJjILJq2in+FGSsXgRUTxgz0Aa9SWQ84GPuo6tiXUlWy5rZ9KXU6c4Rs/1kr15EuXzxV
	m3/3s1Yc26OvcenbU7QQd9CUw6eWwRLy/JywowvfC1qRmdRUU5WSFj0eTL+26f1JDOUT2HeQaqo
	r+GjcAqKxu6n/J9+JbVP8ma5VcsKlxoFNyoXCRPd2C/bodAh9a0UFG7WqTJ7WBnQlOmQy/7ORiA
	ynPkqFP8Voob6Y2w84tldcpXHzMEumZZEMSlj9Oi2HA2YuhL8mpC2rGXLi0NNTmNhR9v02TN75P
	cLMCMxRUBDoFlCdu/knaffz8JQPZWsjSAEFligPs/FVKeCcdfJMP5Kp1qWeDeRtoDyKrE4c95p0
	iKVFNxOnXAZI0nNRVgqwCn0CsCS2O4C2f54r2bubsXAlpw6uttwM86MZuJOAW4JR819azYBEpOD
	mjudFM=
X-Received: by 2002:a05:6870:9a26:b0:42e:49e1:e511 with SMTP id 586e51a60fabf-43476296ccdmr2427036fac.33.1777755836349;
        Sat, 02 May 2026 14:03:56 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454951a95sm6073821fac.7.2026.05.02.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 14:03:56 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
Date: Sat,  2 May 2026 16:03:54 -0500
Message-ID: <20260502210354.160439-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 818834B37A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35987-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace mutex_lock() and mutex_unlock() pairs with the RAII macro
guard(mutex)(). This keeps the driver up-to-date with the latest
function macros.

Remove now-redundant gotos and goto labels which will maintain
readability. In addition, replace some gotos with direct returns where
appropriate.

Update certain control paths to make them more suited to the new
locking.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/gpio/gpio-twl4030.c | 69 ++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 43 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index a851702befde..df17f9c08817 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/irqdomain.h>
+#include <linux/cleanup.h>
 
 #include <linux/mfd/twl.h>
 
@@ -209,7 +210,7 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int status = 0;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Support the two LED outputs as output-only GPIOs. */
 	if (offset >= TWL4030_GPIO_MAX) {
@@ -227,30 +228,29 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
 		/* Configure PWM OFF register first */
 		status = twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg + 1);
 		if (status < 0)
-			goto done;
+			return status;
 
 		/* Followed by PWM ON register */
 		status = twl_i2c_write_u8(TWL4030_MODULE_LED, 0x7f, reg);
 		if (status < 0)
-			goto done;
+			return status;
 
 		/* init LED to not-driven (high) */
 		status = twl_i2c_read_u8(TWL4030_MODULE_LED, &cached_leden,
 					 TWL4030_LED_LEDEN_REG);
 		if (status < 0)
-			goto done;
+			return status;
 		cached_leden &= ~ledclr_mask;
 		status = twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
 					  TWL4030_LED_LEDEN_REG);
 		if (status < 0)
-			goto done;
+			return status;
 
 		status = 0;
-		goto done;
 	}
 
 	/* on first use, turn GPIO module "on" */
-	if (!priv->usage_count) {
+	else if (!priv->usage_count) {
 		struct twl4030_gpio_platform_data *pdata;
 		u8 value = MASK_GPIO_CTRL_GPIO_ON;
 
@@ -264,11 +264,9 @@ static int twl_request(struct gpio_chip *chip, unsigned offset)
 		status = gpio_twl4030_write(REG_GPIO_CTRL, value);
 	}
 
-done:
 	if (!status)
 		priv->usage_count |= BIT(offset);
 
-	mutex_unlock(&priv->mutex);
 	return status;
 }
 
@@ -276,10 +274,10 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 	if (offset >= TWL4030_GPIO_MAX) {
 		WARN_ON_ONCE(twl4030_led_set_value(offset - TWL4030_GPIO_MAX, 1));
-		goto out;
+		return;
 	}
 
 	priv->usage_count &= ~BIT(offset);
@@ -287,9 +285,6 @@ static void twl_free(struct gpio_chip *chip, unsigned offset)
 	/* on last use, switch off GPIO module */
 	if (!priv->usage_count)
 		gpio_twl4030_write(REG_GPIO_CTRL, 0x0);
-
-out:
-	mutex_unlock(&priv->mutex);
 }
 
 static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
@@ -297,17 +292,15 @@ static int twl_direction_in(struct gpio_chip *chip, unsigned offset)
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
 		ret = twl4030_set_gpio_direction(offset, 1);
 	else
-		ret = -EINVAL;	/* LED outputs can't be set as input */
+		return -EINVAL;	/* LED outputs can't be set as input */
 
 	if (!ret)
 		priv->direction &= ~BIT(offset);
 
-	mutex_unlock(&priv->mutex);
-
 	return ret;
 }
 
@@ -317,10 +310,9 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	int ret;
 	int status = 0;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 	if (!(priv->usage_count & BIT(offset))) {
-		ret = -EPERM;
-		goto out;
+		return -EPERM;
 	}
 
 	if (priv->direction & BIT(offset))
@@ -328,10 +320,7 @@ static int twl_get(struct gpio_chip *chip, unsigned offset)
 	else
 		status = twl4030_get_gpio_datain(offset);
 
-	ret = (status < 0) ? status : !!status;
-out:
-	mutex_unlock(&priv->mutex);
-	return ret;
+	return (status < 0) ? status : !!status;
 }
 
 static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
@@ -339,7 +328,7 @@ static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX)
 		ret = twl4030_set_gpio_dataout(offset, value);
 	else
@@ -350,8 +339,6 @@ static int twl_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		priv->out_state &= ~BIT(offset);
 
-	mutex_unlock(&priv->mutex);
-
 	return ret;
 }
 
@@ -360,21 +347,19 @@ static int twl_direction_out(struct gpio_chip *chip, unsigned offset, int value)
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	int ret = 0;
 
-	mutex_lock(&priv->mutex);
-	if (offset < TWL4030_GPIO_MAX) {
-		ret = twl4030_set_gpio_direction(offset, 0);
-		if (ret) {
-			mutex_unlock(&priv->mutex);
-			return ret;
+	scoped_guard(mutex, &priv->mutex) {
+		if (offset < TWL4030_GPIO_MAX) {
+			ret = twl4030_set_gpio_direction(offset, 0);
+			if (ret)
+				return ret;
 		}
-	}
 
-	/*
-	 *  LED gpios i.e. offset >= TWL4030_GPIO_MAX are always output
-	 */
+		/*
+		 *  LED gpios i.e. offset >= TWL4030_GPIO_MAX are always output
+		 */
 
-	priv->direction |= BIT(offset);
-	mutex_unlock(&priv->mutex);
+		priv->direction |= BIT(offset);
+	}
 
 	return twl_set(chip, offset, value);
 }
@@ -388,15 +373,13 @@ static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
 	 */
 	int ret = GPIO_LINE_DIRECTION_OUT;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX) {
 		ret = twl4030_get_gpio_direction(offset);
 		if (ret) {
-			mutex_unlock(&priv->mutex);
 			return ret;
 		}
 	}
-	mutex_unlock(&priv->mutex);
 
 	return ret;
 }
-- 
2.53.0


