Return-Path: <linux-gpio+bounces-39118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IFBCEdRwQmpD7QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:19:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277C6DB0EA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="X/8wIgc2";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39118-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39118-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B1BE3085958
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28B0409608;
	Mon, 29 Jun 2026 13:03:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229240911B;
	Mon, 29 Jun 2026 13:03:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738238; cv=none; b=k0nu1AxG6MWcS8AVcE6LtvA1QpFfhOEDiWnrdHPB8puo2tDTD/HKV9VwzokM6xeKLFJY+fYiWk6Woz+zus8NYvXu5VwFL9jCOa0SNPdZrejnZjLDsv9jUTTfqx6LEXODocvpwK6LwDT1ndqkg7S8gf7ok0NJvg8RxxyjDLrfCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738238; c=relaxed/simple;
	bh=wnWeVn4uQOYhQlmFLHn1Zh1WjlZdCjP++LP8pAg9xFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LIP2w7mAq2MEg8r3TCPQgZl4PYP19qtEhRSU2kT+CbHjUY757g/U32HFBmffb9/36CAnDq4s/LrUjj7Gdnle3Gc49MWXlWHiCmw8I37+Q1gewktNatZO1l1Yxrtc74J4hKjsVlxGc1ernlq1LRN1k2Xlxiq9868qaUN5IN0+8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/8wIgc2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE5F1F000E9;
	Mon, 29 Jun 2026 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738237;
	bh=7Qd5aOmYqY4jz5afRQkgB0hXol3OR7hZ+QqBuGDDL4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X/8wIgc2uCaTxo2Q/LGXGWjPX3LXI/2I1LZn4wb4m+A1q+F1flKjnhXAcb+I/lnR8
	 jiD7vqYJ4eYoSyZEeeNrrFtpRB74H0VyYUev4ypPUaDlavoBo/6f8+CDRANyydKVSV
	 zuE81DuI6cqiCRlLCMAKKuy+2j2qb06cgOXtCYYdFAOogCyIO20pxUAlnsjRPcqMYt
	 yxxX16+huguqeSac+VgQT5vVToA3/FwyofbmOe0NDEZSsZ7NF1UE25eaXHpfZD4qVc
	 +xgdMDZNhOggY2SZ19YrlGERNr20EgrY8lezy8UNFjm/G5XwQOTEL58xtn6wzwXsF3
	 9iyEZ8wrufGpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 3/6] [v5] Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
Date: Mon, 29 Jun 2026 15:03:26 +0200
Message-Id: <20260629130329.1291953-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629130329.1291953-1-arnd@kernel.org>
References: <20260629130329.1291953-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39118-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4277C6DB0EA

From: Arnd Bergmann <arnd@arndb.de>

This driver converts information from ACPI in x86 based tablets and
laptops into platform_data for the gpio_keys driver, using the obsolete
gpio number based interfaces.

This should really be converted to some other method, but since the
conversion is nontrivial, have this one select GPIOLIB_LEGACY for the
time being.

This enables turning GPIOLIB_LEGACY off by default on most kernel
builds. Since the driver is only used on x86 portables, add a CONFIG_X86
dependency, which means non-x86 allmodconfig builds usuallly build
without the legacy gpio support.

Link: https://lore.kernel.org/all/ah-1z9LhVG0wtfBw@google.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v5: This was part of an earlier "x86/platform: select legacy
    gpiolib interfaces where used" patch that covered several
    drivers. This is the only one left as of linux-7.2-rc1
---
 drivers/input/misc/Kconfig            | 3 +++
 drivers/input/misc/soc_button_array.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 1f6c57dba030..9c66e3a67127 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -892,6 +892,9 @@ config INPUT_IDEAPAD_SLIDEBAR
 config INPUT_SOC_BUTTON_ARRAY
 	tristate "Windows-compatible SoC Button Array"
 	depends on KEYBOARD_GPIO && ACPI
+	depends on X86
+	depends on GPIOLIB
+	select GPIOLIB_LEGACY
 	help
 	  Say Y here if you have a SoC-based tablet that originally runs
 	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index b8cad415c62c..eb11bf2e9436 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -15,7 +15,7 @@
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio_keys.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 
 static bool use_low_level_irq;
-- 
2.39.5


