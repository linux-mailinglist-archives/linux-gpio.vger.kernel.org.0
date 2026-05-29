Return-Path: <linux-gpio+bounces-37671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sABJH9hlGWoBwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:09:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F26007A2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD3C8301B3D0
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EE935E1C3;
	Fri, 29 May 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoVnyX70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A1A35E55D
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049352; cv=none; b=EzbxzldkfQM2zwO6Bh0bM/1Ro4z9euQEZVUq3dFyNpir8XqgdBlvf4nD+TbJsxu1BBEOoQ4DH1vkLSkwNNsPu5U4oPCOmDmQJCDod+OhiFwzQi74Ds2yvwgsBQJ8z8R1cSI7CLIysIaU1w8rXx6C5lwSWEDoTL5BMOw7xCME8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049352; c=relaxed/simple;
	bh=a/OpJMsrZEY9OEjNsUXOYseMRjwbQc2doP8rUzmGenU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxVkz8abO2az4Xblvhwz5Ipl9AvYMu4UCub3pylLTkZBmbuVXVHG7aGSW0ZeB8yX0OZdJqD0rovbTuXS/loeY39QtS4PbzDwSphTzPbl6t9lGX6CpIY2OAoCbY3dF5kddDEqnWESV4n0bJBwgIKuT/pftyEzNL3YdUL85iIHmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoVnyX70; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7423836a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049348; x=1780654148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHr0wZ9EwQa/c6Vk+G+u2Owq7gK2jir1dXtjVgyxJ90=;
        b=QoVnyX70wunVLUcfFiNvbgPnfhz/81+P6xQlY+cSuwqjzt+9EGA5k2W/i9Cd3Yp6e8
         +AL3AiU0vbDlzBPq3QV25w9Vht7+GnVAsOqOAmTNWJ5v94jdmNmQWwNNTZHshHtEf22Y
         roJXZJp8sgfUg/Iw3tox02n43Cg7vpiI45eT12DeyKaz44v44zVUziK62xUo1lK77axH
         jD6EbP45Ht86HNbpB7UgXyQXP3feDbSrMrM1aY3zlNboO90bloxeyfBkaFjZ1X1pHwbN
         dOM//HghgK9EhC80p9YUV+ECOWnMa+V6vUFRrp4S9sw2Lq3kwQyVNNXk3JPfS8bnD4Y7
         7COA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049348; x=1780654148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DHr0wZ9EwQa/c6Vk+G+u2Owq7gK2jir1dXtjVgyxJ90=;
        b=annB8yBF9E+uxCl1Z11Yr8Q4sj5uyAGRTSqP9lm9PvlFDVf+UHztX7DpFmoglylV8q
         ZAo9TTy1dKHIvuSIvqXNzM169a/dPN/0EIA8AQ2DYb1hWeM8Z7Ns6NbA/CiCj1L5tHLT
         UqebAxLHQs0B+ovJg19htPAEBh3v8Z4R1j3CFelb3yy6J6y8oo2aI5NGA3o9EAOB1zNm
         MsXyGTT4IBCaMU13ew0XrRMl9X6mlgUTnm1VBZQHL7v18yNFo6ZtbGTrYcccvHB2GvNs
         38HjO7ovxEZmYx1XKlBvr6HJlHeF9aaWmd93f4cKqbW4JhvlupkuRM+MbzFERisZpT4e
         dF8w==
X-Gm-Message-State: AOJu0YzzLHlmvMIuvBarxpHLKoWxCZa4SgDNvr3TnZpWQxhkRwdW6OR4
	VM+sfVA41WE/KCFvuoL3aTtLlyohpSbvTwBtmWR5hZxUBEjQr2VGtUbY
X-Gm-Gg: Acq92OFiO5gW8Ld5JDCOPa2MiScM1v4rUqOhddtvbsunx5ifZkg93uK9nDhvJZ8WAkQ
	mNjIfUcRfP3EuS7SeZJ+dX4sxMxLg3XyPScgTHXyI09sZhjlnge1P8cH1p/V8UIfQ8OfrKjIavh
	Qp7Vzwcij+C0+86Y2INVYEbBOHKAwJ4PWSeksJKy0j3uaPpcQefjJYC5c7b2VJZAYp/kGnyvRod
	am3pn+nX09rTHfuVPsFlUh5t0k+P2NCMbNK13orZ4xt/44AlC8M3lXeTPKCBMYURQxzLrDKi8UI
	knzR86YakchdU+ruGbmzlDU8bepb0sg9zUFlnTuUZEbnLLwC23ePjiz6RZ5/8bYspT/M1TepkQU
	sg8AKO18ELxN4hZVnkzVDlVvSqjSlMrfx3oOsIPWm5INQbcqsp72hfS+AhMVlFI5YLiDLSdxgaD
	hdNG3hMPTXt7HhEVhNO8i5tpMxtQAkPR3VZYPwyhvn+9GFFXDvZivDigfLXKO8Dt50NXtwTwmY/
	JqpU0qcQqqj7sIxb6tpxKFJBhfFi9DagannIM5Fonh5TIY794PVXkn+GAWJqm/Gw7Ujw62PqDiH
	ucBwrxqF4bmt5p6DQQqpSM0=
X-Received: by 2002:a17:903:2986:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bf204d973dmr28431175ad.8.1780049347629;
        Fri, 29 May 2026 03:09:07 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c22:2195:3f68:8568:1e68:2087])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0122asm16051225ad.46.2026.05.29.03.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:09:07 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v8 1/2] Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11"
Date: Fri, 29 May 2026 15:38:36 +0530
Message-ID: <20260529100838.8896-2-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529100838.8896-1-hardikprakash.official@gmail.com>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37671-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 515F26007A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit 3812a9e84265a5cdd90d29fe8d97a023e91fb945.

The probe ordering fix in the following patch ensures amd_gpio_probe()
completes before i2c-designware probes AMDI0010:02, allowing the
existing amd_gpio_irq_enable() flow to work correctly. The manual IRQ
restoration added by this patch is therefore no longer needed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 64315b0edf2a..e3128b0045d2 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -26,7 +26,6 @@
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
-#include <linux/dmi.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/string_choices.h>
@@ -40,39 +39,6 @@
 static struct amd_gpio *pinctrl_dev;
 #endif
 
-static const struct dmi_system_id amd_gpio_quirk_yoga7_14agp11[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
-			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
-		},
-	},
-	{ }
-};
-
-static void amd_gpio_apply_quirks(struct amd_gpio *gpio_dev)
-{
-	const unsigned int pin = 157; /* WACF2200 GpioInt per ACPI _CRS */
-	unsigned long flags;
-	u32 reg;
-
-	if (!dmi_check_system(amd_gpio_quirk_yoga7_14agp11))
-		return;
-	if (pin >= gpio_dev->gc.ngpio)
-		return;
-
-	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	reg = readl(gpio_dev->base + pin * 4);
-	reg |= BIT(INTERRUPT_ENABLE_OFF) | BIT(INTERRUPT_MASK_OFF);
-	writel(reg, gpio_dev->base + pin * 4);
-	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-
-	dev_info(&gpio_dev->pdev->dev,
-		 "Enabled IRQ for GPIO %u (Yoga 7 14AGP11 touchscreen)\n",
-		 pin);
-}
-
 static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned long flags;
@@ -1253,7 +1219,6 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	/* Disable and mask interrupts */
 	amd_gpio_irq_init(gpio_dev);
-	amd_gpio_apply_quirks(gpio_dev);
 
 	girq = &gpio_dev->gc.irq;
 	gpio_irq_chip_set_chip(girq, &amd_gpio_irqchip);
-- 
2.54.0


