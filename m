Return-Path: <linux-gpio+bounces-36650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC9MHMHXAmpXyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:33:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7851BE96
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CC8330167CB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 07:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0D047DFB1;
	Tue, 12 May 2026 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWf8Sw4K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17308304BDE
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571152; cv=none; b=YqZA/fpYNbcruez8FGmD7B5ttSdxfkzfkDuLHn/4MQT6LjOMtj0uhWqcxajxgz6uGC5t0R8ORoTm80shvwS7v2YPc3cwDxzuzmfjk3RVx/YUAOSnM2fGGZ+7kBKNSwHiZD73gvY9TD1Fpp8qCAYd/iE8EbPysD+XXtxL0Ki+Y3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571152; c=relaxed/simple;
	bh=pdYvF+Sk+5Qtm7MPxsJdTzM7WXs+BtD0PbNzj9oHtYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Go53Cc7jhtRyq2grj51U5NxJ9yHBoP4w5TyAJic0D6YzyKL2eR9vSRaiUn0oEsjE7p9gxn5pBxj0BFruvCnvDVFwq/9X4ac+EHKLcFfX4L2KOdDcKeNva+Vw6HaKrULPXp8I547HQNrwgVTFd0L7wE5zY2HxMG5LkZNb8oGwbCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWf8Sw4K; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-368977e334eso851328a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571150; x=1779175950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1U7TBG5kHM139IR5XJ/vRZGZx3+E8rlZI9Ha1Id3g8=;
        b=IWf8Sw4Kb4XjUldznu7+Af+m72gvTy0kln8NBrBTxBZTlwIvhbb+lHGn8jKyYMuoP9
         prmPZYtw47StqRqkXE7LusBkk+Whwn/W+5dF2zPwP6sqklXBy6VmLOlSFdzTlv6prxLD
         +z5O1pkjnNZOOc9jcsV8hZxpumL3B/z3o79tOU427yYxPFr6VW5x95eAZiq4FNZ7rVqN
         uO7Wu5wiPOb/GoyFEBNt2I4fIHkJ5ehxhlZlGZf5zEUatVW+L++4Ij3MsipWF14a9Dp5
         UqUnIxU3eIns63SAMe/hJVE9BatDrlzqOQsty203EwEItBaz4E7P4Zs17iSfCz/QVpcS
         K6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571150; x=1779175950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1U7TBG5kHM139IR5XJ/vRZGZx3+E8rlZI9Ha1Id3g8=;
        b=jzpRGnZjRcKeRp0Hi6SuVNH0PqFhPkl62J2PPbEhFLcLEPKq2ISBaxJwfukNeRdumL
         rhVj8sV3dK//CWfvYMw+s+7unZ1ELx2hZvpzUijnJ3+n2CWgUKZXroaINUVbbG2DYTre
         6Bqz55IxHcdN+k9hzqr06hjksYVIJJ5OtBI8crQG/iwlKqhrBMtTiCGKXs4j/Pxg8RHG
         UsrI4mnEYE3GXtoqE+8w7dAPm624wwj0xYt++d2L7KrN88tvbzk5q4BD7bRh7N0Cj/Gi
         igPuFjZz/bNq+lReYJm9ORuNeVZ/6fYRqVeeTv7ujKgQBOl3ggbiuZrIeP5QU0ezrV9g
         2qrg==
X-Gm-Message-State: AOJu0YweVvRxV6/IQC/g9ph6oAQLTXqfJrDISmkNPV7a4X53SxcwtZ4l
	UkmONvnfaWnkLln2KSDAGt++S5+9ddD/4d4P1lWjQVhjLGSR+oS6pbekpaN+R6XOcSc=
X-Gm-Gg: Acq92OG/U178sjRGu5cGN6p0KZ5nyIxo78CGHWFoKsVt4cyiIz7u8Oh1/QHDT+6HaIP
	8OOQZbeDCl9Y2v/HhK1ri6Ki/dkVrNSzjWfbK7vT88Ic1QLkpO5GjF7E+acMGmkY4weMPJkTaMf
	uyNx6+Z20pi3V0BbcA2e/8pHdDuaEq+roxMiC47vaSmL1whlucePNtMRbizLbH8aDTvZX9XBzPJ
	5E22CNMQqTLhiJO2W273KhrprcRVJaUCBFCbBSDoyvLR2ddw+skynYSXv8AE2cvwP95GcUrXCqJ
	9zgVAi6p4Cu/9Qyn+ZIMrYf2hbzP6vUlkRfQ28qhgETqaK9ux55TxeQgvXHAg4XGAb7bW+SXCkT
	4PwMb/RpBXtSWhdIKNRuS+qp/gw8EQzlgvIJ0+akU7r+L/lODTKXvPADhZOBk7r3FmHYIFMWMw4
	EFvI1m/fGWd47l/FVJOV/aumhMqgJE54fF76wrBVyI93N3PN3/Ql3ZqdkOvlp90IE8XR2F7sPGq
	meI10LfuXc6wnxXM54lOvDWsMbrnS2R2t+ejtCdwH1GLZAk7V018wGMo/+ZpDE=
X-Received: by 2002:a17:90b:2710:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-368b2726528mr2224622a91.24.1778571150068;
        Tue, 12 May 2026 00:32:30 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c23:32d:3989:a15e:2491:59ba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63bad27sm12420410a91.10.2026.05.12.00.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:32:29 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH 1/2] pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11
Date: Tue, 12 May 2026 13:01:38 +0530
Message-ID: <20260512073139.16343-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512073139.16343-1-hardikprakash.official@gmail.com>
References: <20260512073139.16343-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84B7851BE96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36650-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
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


