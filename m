Return-Path: <linux-gpio+bounces-36704-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELz0KsUWBGpLDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36704-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9352DFC6
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BEF2302A1A8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 06:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932CC3D349C;
	Wed, 13 May 2026 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gddHux3x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2DC3D333D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652862; cv=none; b=Z/+/IzUz4ObBfSYgvavMejs1VoNEm+Nq7CeehUhWTDsFbz6Aq+FrGUIHUBJcnmBo4ADms94wpeUIx708MBR1Ao0kxm76IHKbIUvqgLYqPGsP8DTQznhj5T6KU1BeJK89ErhGTx6cg45NNJuWETbmtZGSUJvEhZij/kPLTtmQvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652862; c=relaxed/simple;
	bh=1Nb5K6b9vdJ82GOO2YqSTVU36l4hCMuI8qeYvM2NjdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3OC2gnRdjwkeMvHKpjVHsaMQzjgZnHHzmuJ2lzvYzgGYbxdf0dbLYYc8qMnmcT+o83/VoagCmBet88u8af/a8AqPN2C94JgD73Ziz5IZAC1z90RMGjOmVnbQlBs5+vh97s5+gCbn1wE8lEggjhajgL1gUfzhApi0CH/HuLDxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gddHux3x; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8025aecc40so3075538a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778652860; x=1779257660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbWUPZ03mDdxdSYYlsvSPmpVezNp0pNuUyGvANfB4Mo=;
        b=gddHux3xhkJZHky3kZ95IAc41t2ejdJ2w+M/H3MzhYcRO3bm1yEb+qzHz0qAZvIZKw
         HOYsauRX4TrJaFUtzo84q3HxCf302LxNhQt61rOMqXPGLX57D5+tCT0asBzzsBgBNDgY
         kBEFtRFDitL2hV51+yeIrNWZuB7bk+MjFY3Q4VIExqYzXaSCDhiRIAhCDEJYkUyua8Q+
         d+VXGfJNLVw5VW1kpf98/eksvccF2HYB/4ah8qfJzHdoW5pDztBs3/I3lNvm7PSX/VzB
         lSSJKLvGdmDOIo0ZT3NB039qoXYecSPLvPN2Ldj1DFwEmYUQhhFhDK7TfCXy6fVcSEmX
         FpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652860; x=1779257660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MbWUPZ03mDdxdSYYlsvSPmpVezNp0pNuUyGvANfB4Mo=;
        b=SCRXGpHcL6t54Z9bcTKMxFY8W8lMKfaKKQVDTVwfMsdAxsIlQAqW9IpgGGssVpRNiW
         8Zljqo6tMC/w58+8wY1mrWUCST4fBjoIg739QB5xHwcYjlcHtk3ol66FbXdQioSsgFd2
         la1AqPMwP6fnlnfawdGquoSvl6IYdUTpYGRBFR+q8XMEtvChykDBu0NtFW1kGtCguzNd
         3Edm+dQve8l57tByCljW08Jic/zmkYUWuZeJzQv0tzWtVgC5d6eaJIDsaoicqVkIkjhQ
         FDj7zecfgYv7kJIydDKEPXDjNajIJbl+ULlWX4VWHeNU6J5++7sjQATBK4uoiWvPCbcL
         lkNw==
X-Gm-Message-State: AOJu0Yz8ULeO1LsaRGV77sVwagFNzrfNHCl6tBcV8NAYQMY8VZQccocf
	0leI3QcL2elwL8HdTPaLlknjeq3EhgmDH4OcEfKJ9OmPfe8Ir5SNhZuU6eJ7XbMe
X-Gm-Gg: Acq92OEWVgP9htoc90ZZC660/923xcQ6bn794gieSQlpDtyHFWbGd8LQKb9SMUynCGF
	0/+9kf/XHVe/rzxluS1r35HyKy5+Y9x25opBO6YT3P3K6fonba+G8u1N6uRYCeDDoYtkPRgBhlQ
	hAK5sBj6EmEcGpj1yOQ8FSrIH4htzzfilM9GmrX8SDLq8bKUL/O5lCazt0kgGifpE2qlB+9I/jG
	YKeUM1pIVF46vD2yHzyc/9cX1d5aDiosVyIrXM/yFoWotwTsawaAOzhkEXDDNP5lCvauN0ufl8T
	0TvXVyeazO46m2LsBqYlMmVBgdtnHBBFg9ePYqj3na3UmGMPLK6JU/ep3qpPjJjnE2VgmMoPlQ/
	k+Pac2+LeC39VWx53ObuUOSujBnthYDVbd+1o5YNvL8++0n855A/aa2YfzmVCrVWZEUTG9WjmRx
	utBVRQ73HUxg2Il22XDJ89Rb9tZLXZksXz6vuqboxJy349voruAMofcnAm33gD6+9jv5wKIgf9r
	3GjEZ6X3Em8gx3pe6E/Q9K4YgZjsJKCnQYzJ1sC8h9DEkDuyoSnDZlsDWs3l5E6
X-Received: by 2002:a05:6a21:338f:b0:3a2:f05a:795e with SMTP id adf61e73a8af0-3acd4207c22mr6738499637.3.1778652860126;
        Tue, 12 May 2026 23:14:20 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c64:ff18:3fa8:7855:804e:9f49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm13470874a12.24.2026.05.12.23.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:14:19 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11
Date: Wed, 13 May 2026 11:43:37 +0530
Message-ID: <20260513061338.9348-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513061338.9348-1-hardikprakash.official@gmail.com>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EDC9352DFC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36704-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Lenovo Yoga 7 14AGP11 (83TD), the WACF2200 touchscreen controller
is wired via I2C2 (AMDI0010:02) with its interrupt on GPIO pin 157
(confirmed via ACPI _CRS GpioInt decode). After amd_gpio_irq_init()
clears all GPIO interrupts at boot, pin 157 is never re-enabled,
preventing the touchscreen from signalling the driver.

Windows keeps GPIO 157 INTERRUPT_ENABLE (bit 11) and INTERRUPT_MASK
(bit 12) set after initialisation. Add a DMI quirk to restore these
bits after amd_gpio_irq_init() on this hardware.

Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
Assisted-by: Claude:claude-sonnet-4-6
Assisted-by: GPT-Codex:gpt-5.2-codex
---
 drivers/pinctrl/pinctrl-amd.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e3128b0045d22..64315b0edf2a6 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
+#include <linux/dmi.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/string_choices.h>
@@ -39,6 +40,39 @@
 static struct amd_gpio *pinctrl_dev;
 #endif
 
+static const struct dmi_system_id amd_gpio_quirk_yoga7_14agp11[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
+			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+		},
+	},
+	{ }
+};
+
+static void amd_gpio_apply_quirks(struct amd_gpio *gpio_dev)
+{
+	const unsigned int pin = 157; /* WACF2200 GpioInt per ACPI _CRS */
+	unsigned long flags;
+	u32 reg;
+
+	if (!dmi_check_system(amd_gpio_quirk_yoga7_14agp11))
+		return;
+	if (pin >= gpio_dev->gc.ngpio)
+		return;
+
+	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+	reg = readl(gpio_dev->base + pin * 4);
+	reg |= BIT(INTERRUPT_ENABLE_OFF) | BIT(INTERRUPT_MASK_OFF);
+	writel(reg, gpio_dev->base + pin * 4);
+	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+
+	dev_info(&gpio_dev->pdev->dev,
+		 "Enabled IRQ for GPIO %u (Yoga 7 14AGP11 touchscreen)\n",
+		 pin);
+}
+
 static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned long flags;
@@ -1219,6 +1253,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	/* Disable and mask interrupts */
 	amd_gpio_irq_init(gpio_dev);
+	amd_gpio_apply_quirks(gpio_dev);
 
 	girq = &gpio_dev->gc.irq;
 	gpio_irq_chip_set_chip(girq, &amd_gpio_irqchip);
-- 
2.54.0


