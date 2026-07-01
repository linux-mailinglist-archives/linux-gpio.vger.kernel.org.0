Return-Path: <linux-gpio+bounces-39264-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oztNL3mPRGq3wwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39264-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 05:54:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8F6E9923
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 05:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JHBwfLGv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39264-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39264-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F73430A33C3
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 03:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7782FFF8B;
	Wed,  1 Jul 2026 03:50:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9012D7DC8
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 03:50:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877848; cv=none; b=L6HZjKoE8UKD7JS+4z6p3sNfKhyNmDll1He/ovDmOsKFDdSuCDjO/BowUvqX0TgAyNmGHCmagZWqCxBCSIFJwSiIJ2ul6EHZ3oAgTjYAmrSTMpr6B4JNK8UViEkzSGZZm+j1ys8KL5XJ8kvprI/jbcgd4CEtAGh1T+eXRDhsBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877848; c=relaxed/simple;
	bh=QHLfq0+01isNj1yrq9v2QkM6WgJjPQHUV4X0GxdiE/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6iPOo5n2mw6+4r/2GZThEUe/smgwKAp91WcaZK396cY4bEGXJSEccUPDyyWynqR/ATLjl+8EI8fkMh5vnzJNhpPnA4OpBHSE7QATfzd78YwF9eo8y1kbXQNTNSemOofnxVovIf84O2D55pOXKYMtD3Xaux91YR4n4sZ1VRgyPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHBwfLGv; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so94313a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 20:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782877845; x=1783482645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X7pzfCTXPwMbRd3JbENOoVc0U1qKMgH+pMjUvhfKbY=;
        b=JHBwfLGvdvWV0U+2BmS7u1KrGPFlDXA9X5HyKKP8sIOF64hZxKBrCK8IXbhfeLW+eK
         YcVyNfgWvs+pnDsoNKKTGLSNfth3zSoNsBpSK2Re2i1fu30FyLlj2e8cOMAbmWdRg0j+
         1NLczPbs0R5UjbjSI/at0OMoZ/GeWtfNMSrND2pP2/iqdUqm5uaOXdGmnqB5m6gqZdns
         Bx0Lycvnpuy9f4Ken/zQ0ozRfRVy30eUNdNQMt4ONwdYWczW8XGOL8kVHtReqthqZjwd
         P2uOwR3ELhv/Xx+gewJPxnHmYYhT99gKxjDk2jqloVOW41pauS/kgYx6el0xuw2G0Dwa
         GpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782877845; x=1783482645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4X7pzfCTXPwMbRd3JbENOoVc0U1qKMgH+pMjUvhfKbY=;
        b=Bv2T8gUU9+KEag9SJYjTVmOLany+SeLrYSWtEv78YhiBIUYnsd35XPnV6cDLb1tw6K
         PWuO+DneujyrAXxPklFOw6FyowHRr3bXOMX9P7zma8g9+YaNl2nI6q+WuSU1wr4tkmIz
         1SYn5pGB7j9GmBZSccbb3rz9qQ4C2V/p4H/wn8rQmp9gj7iOJ4mIpOONz1QmrTfRTbvF
         45jQ8tpGigqvWwymz2m60jaCcTrng0KcxwqLislSRHhiOgxYvFdZ0HlRqUrWuUDgb1CG
         msrYU6fCBxV0efuKnG/P+OVQY1dA9c1G9wipbcQe7DBfwJJDtspoS435831HIyjB4ORu
         ziOw==
X-Forwarded-Encrypted: i=1; AHgh+RpM/TfpiMVqXVoLCVHFqEhgGQEZwaG4nJbyX3VgWTFLpG3albMg8LfFRVBAie3kFBsoDQq0n451nJHq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9JBb5jIFcg71R4Hl+z+NgIaQYu3NOElNmMRcKIF6EnvOHouc
	nEb8zIHFrjh8wnHPshrlx3lEwlQa5Ed3bn2/aWKXbh+YZmpqnHjfYCMs
X-Gm-Gg: AfdE7ckloxZhoUI91JBw5cQCgicnWLxCxIfgeCAbFbGk50hkceLMBuCJaz8vQa2akGN
	EG23j8xly8rM8zPP5chpJA8PJFQxh0q/0RtALDo21kYC7zo7ukfTEy9SlycuyuGA2cGWxJvbONM
	k0t+edF3/j63j1sl+SU7S/mkGDbzMBxVups6BfgjMfRLdeE5Rr4C3+jCKBIGgYH99HKX9FO9YZg
	JlUNcpAISbBUR95pDPUqRjTzv21CxVBbz0/G8C3e1Zv4qvjHMv48tlCiyQyQhHiEf3gq37ipN4b
	uUw7+bKMJvRdsT8bA4W0vyBOEM86q//lJfMQXTb0rIAUTRM0damDWFO6sqLRZDFQx9KdeYLCTwS
	j0WE9YvbJxk4c3C7rJNFJTRAdTnn60HTgdr+ACCglWKnLv7qR7nUOlz90bzICxmilTGyVjZiRBf
	fu3v6voPIYMVtlv1akwQ/unGN6b+31uwRi7/GDDB6N+KYiOeM5MHHcFqo=
X-Received: by 2002:a05:6a20:a121:b0:3b3:fdb0:2295 with SMTP id adf61e73a8af0-3bfc505bcc1mr5294388637.6.1782877845029;
        Tue, 30 Jun 2026 20:50:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbd27a924sm2429089a12.14.2026.06.30.20.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 20:50:44 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v6 1/7] mfd: nct6694: Move module type macros to shared header
Date: Wed,  1 Jul 2026 11:50:19 +0800
Message-Id: <20260701035025.3082927-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701035025.3082927-1-a0282524688@gmail.com>
References: <20260701035025.3082927-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:tmyu0@nuvoton.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux@roeck-us.net,m:andi.shyti@kernel.org,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:alexandre.belloni@bootlin.com,m:wim@linux-watchdog.org,m:linux-kernel@vger.kernel.org,m:a0282524688@gmail.com,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-watchdog@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39264-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40B8F6E9923

From: Ming Yu <a0282524688@gmail.com>

Move NCT6694_XXX_MOD macro definitions from individual sub-device
drivers into the shared header include/linux/mfd/nct6694.h.

This is a prerequisite for supporting multiple transport interfaces
(USB, HIF) without duplicating these definitions.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v6:

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/gpio/gpio-nct6694.c         |  7 -------
 drivers/hwmon/nct6694-hwmon.c       | 21 ---------------------
 drivers/i2c/busses/i2c-nct6694.c    |  7 -------
 drivers/net/can/usb/nct6694_canfd.c |  6 ------
 drivers/rtc/rtc-nct6694.c           |  7 -------
 drivers/watchdog/nct6694_wdt.c      |  7 -------
 include/linux/mfd/nct6694.h         |  9 +++++++++
 7 files changed, 9 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..53bfc5983648 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -13,13 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 GPIO controller.
- * This defines the module type used for communication with the NCT6694
- * GPIO controller over the USB interface.
- */
-#define NCT6694_GPIO_MOD	0xFF
-
 #define NCT6694_GPIO_VER	0x90
 #define NCT6694_GPIO_VALID	0x110
 #define NCT6694_GPI_DATA	0x120
diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
index 6dcf22ca5018..581451875f2c 100644
--- a/drivers/hwmon/nct6694-hwmon.c
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -15,13 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 report channel
- * This defines the module type used for communication with the NCT6694
- * report channel over the USB interface.
- */
-#define NCT6694_RPT_MOD			0xFF
-
 /* Report channel */
 /*
  * The report channel is used to report the status of the hardware monitor
@@ -38,13 +31,6 @@
 #define NCT6694_TIN_STS(x)		(0x6A + (x))
 #define NCT6694_FIN_STS(x)		(0x6E + (x))
 
-/*
- * USB command module type for NCT6694 HWMON controller.
- * This defines the module type used for communication with the NCT6694
- * HWMON controller over the USB interface.
- */
-#define NCT6694_HWMON_MOD		0x00
-
 /* Command 00h - Hardware Monitor Control */
 #define NCT6694_HWMON_CONTROL		0x00
 #define NCT6694_HWMON_CONTROL_SEL	0x00
@@ -53,13 +39,6 @@
 #define NCT6694_HWMON_ALARM		0x02
 #define NCT6694_HWMON_ALARM_SEL		0x00
 
-/*
- * USB command module type for NCT6694 PWM controller.
- * This defines the module type used for communication with the NCT6694
- * PWM controller over the USB interface.
- */
-#define NCT6694_PWM_MOD			0x01
-
 /* PWM Command - Manual Control */
 #define NCT6694_PWM_CONTROL		0x01
 #define NCT6694_PWM_CONTROL_SEL		0x00
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
index 1413ab6f9462..ef3329f34246 100644
--- a/drivers/i2c/busses/i2c-nct6694.c
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -12,13 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 I2C controller.
- * This defines the module type used for communication with the NCT6694
- * I2C controller over the USB interface.
- */
-#define NCT6694_I2C_MOD			0x03
-
 /* Command 00h - I2C Deliver */
 #define NCT6694_I2C_DELIVER		0x00
 #define NCT6694_I2C_DELIVER_SEL		0x00
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
index e5f7f8849a73..262b4c26c9d4 100644
--- a/drivers/net/can/usb/nct6694_canfd.c
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -18,12 +18,6 @@
 
 #define DEVICE_NAME "nct6694-canfd"
 
-/* USB command module type for NCT6694 CANfd controller.
- * This defines the module type used for communication with the NCT6694
- * CANfd controller over the USB interface.
- */
-#define NCT6694_CANFD_MOD			0x05
-
 /* Command 00h - CAN Setting and Initialization */
 #define NCT6694_CANFD_SETTING			0x00
 #define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
index 35401a0d9cf5..c06902f150c9 100644
--- a/drivers/rtc/rtc-nct6694.c
+++ b/drivers/rtc/rtc-nct6694.c
@@ -14,13 +14,6 @@
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 RTC controller.
- * This defines the module type used for communication with the NCT6694
- * RTC controller over the USB interface.
- */
-#define NCT6694_RTC_MOD		0x08
-
 /* Command 00h - RTC Time */
 #define NCT6694_RTC_TIME	0x0000
 #define NCT6694_RTC_TIME_SEL	0x00
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
index bc3689bd4b6b..4c06ac105562 100644
--- a/drivers/watchdog/nct6694_wdt.c
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -20,13 +20,6 @@
 
 #define NCT6694_WDT_MAX_DEVS		2
 
-/*
- * USB command module type for NCT6694 WDT controller.
- * This defines the module type used for communication with the NCT6694
- * WDT controller over the USB interface.
- */
-#define NCT6694_WDT_MOD			0x07
-
 /* Command 00h - WDT Setup */
 #define NCT6694_WDT_SETUP		0x00
 #define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..3c683e317aa3 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -8,6 +8,15 @@
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#define NCT6694_HWMON_MOD	0x00
+#define NCT6694_PWM_MOD		0x01
+#define NCT6694_I2C_MOD		0x03
+#define NCT6694_CANFD_MOD	0x05
+#define NCT6694_WDT_MOD		0x07
+#define NCT6694_RTC_MOD		0x08
+#define NCT6694_RPT_MOD		0xFF
+#define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
+
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
 #define NCT6694_INT_IN_EP	0x81
-- 
2.34.1


