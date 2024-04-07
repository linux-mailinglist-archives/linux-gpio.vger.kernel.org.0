Return-Path: <linux-gpio+bounces-5150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B110589B3EA
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 22:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E3D9B21460
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 20:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7373D55B;
	Sun,  7 Apr 2024 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTXG92GQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BED3D993
	for <linux-gpio@vger.kernel.org>; Sun,  7 Apr 2024 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712520308; cv=none; b=r1Zs9RN8H6GsUn2qq1LCiMGR0Ag49LXaREZhmP1996rBSXHNwYxgUNd1oLQFWRJBKRSPF1F7rXqezttu9xrpxOTG1LpK+SlAb/0kD/2Y1AAdevyFWSbK8QhossHxyT2orh/7B0+wIch6w+CKbioPSGq3cSfPcdTJ9Y3Zm8eDFHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712520308; c=relaxed/simple;
	bh=UWdlP9A4xBUMKpZnsnnlf89phasUQ7E1xv/QTD+EX8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rX6u/4Onrs/dC1GlHp6DRo9/MGONmlPxzWjBh4RjXeZoio8S8d9SuGxMskuueIDwGSL7efeSoBpQItB5DaiukgTMRLB9HyBReAG2LOPoxCTU/resD6YkQ6KtG2jl0gLcLT5Jw57l/toJcAze+7Jb0mpPaaPlm4NagZ7RK4E0FiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iTXG92GQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712520305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpiKXqbWLPjP/NDRVHjpDJdxSVc4DdZOf3OrRONCsyM=;
	b=iTXG92GQ37HpTPZDEFierqZBV5xaBAd0sq/KlqZL0tmEi3mSuY/I4gtJiVdl81LIN0IXMa
	hstMoNyNZP4ZN+w4oZZWhkkYubtJFVq95qsbir4qBV9NzCNb7dNRerni+N/urNJb+YEjWb
	ObHi7+OTaWiAdMmr1FqgUfptMs0FqKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-cCloG6YoNruaRgXDTx-q6w-1; Sun, 07 Apr 2024 16:05:03 -0400
X-MC-Unique: cCloG6YoNruaRgXDTx-q6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1432B1887314;
	Sun,  7 Apr 2024 20:05:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF5710060F7;
	Sun,  7 Apr 2024 20:05:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 4/6] mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga Tablet 2 series sdcard slot
Date: Sun,  7 Apr 2024 22:04:51 +0200
Message-ID: <20240407200453.40829-4-hdegoede@redhat.com>
In-Reply-To: <20240407200453.40829-1-hdegoede@redhat.com>
References: <20240407200453.40829-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Unlike all other Bay Trail devices I have (quite a few) the BIOS on
the Lenovo Yoga Tablet 2 830 / 1050 and Lenovo Yoga Tablet 2 Pro 1380 (8",
10" and 13") models sets the SDHCI_SUPPORT_DDR50 bit in the sdcard slots'
SDHCI controller's Caps_1 register which causes Linux to try and use
UHS SDR12 / SDR25 and DDR50 modes on UHS cards.

These tablets do have 1.8V signalling implemented in the hw level through
the Bay Trail SoC's SD3_1P8EN pin. But trying to use UHS modes leads to
lots of errors like these:

[  225.272001] mmc2: Unexpected interrupt 0x04000000.
[  225.272024] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
[  225.272034] mmc2: sdhci: Sys addr:  0x0712c400 | Version:  0x0000b502
[  225.272044] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000007
[  225.272054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000023
[  225.272064] mmc2: sdhci: Present:   0x01e20002 | Host ctl: 0x00000016
[  225.272073] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
[  225.272082] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
[  225.272092] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000001
[  225.272101] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
[  225.272110] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
[  225.272119] mmc2: sdhci: Caps:      0x076864b2 | Caps_1:   0x00000004
[  225.272129] mmc2: sdhci: Cmd:       0x00000c1b | Max curr: 0x00000000
[  225.272138] mmc2: sdhci: Resp[0]:   0x00000c00 | Resp[1]:  0x00000000
[  225.272147] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000900
[  225.272155] mmc2: sdhci: Host ctl2: 0x0000000c
[  225.272164] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x0712c200
[  225.272172] mmc2: sdhci: ============================================

Since sdhci_acpi_slot_int_emmc sets SDHCI_QUIRK2_PRESET_VALUE_BROKEN
I tried setting that for sdhci_acpi_slot_int_sd too and that does makes
things mostly work, but the above error still sometimes happen and
regularly access to the card simply freezes for seconds, which are
problems which do not happen with the non UHS SDR50 mode.

Add a new DMI_QUIRK_SD_NO_1_8_V DMI quirk flag and set that for these
tablets to disable sdcard slot UHS modes by setting SDHCI_QUIRK2_NO_1_8_V
for the sdcard slot when this quirk is set.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note a possible alternative approach would be to simply always set
SDHCI_QUIRK2_NO_1_8_V for the sdcard slot on all Bay Trail models
but that seems like a bit of a big hammer for a problem only seen
on these specific models and maybe there are Bay Trail models out
there with working UHS modes for their sdcard slot.
---
 drivers/mmc/host/sdhci-acpi.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index c0d77f589deb..233af36d55a9 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -80,7 +80,8 @@ struct sdhci_acpi_host {
 enum {
 	DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP			= BIT(0),
 	DMI_QUIRK_SD_NO_WRITE_PROTECT				= BIT(1),
-	DMI_QUIRK_SD_CD_ACTIVE_HIGH				= BIT(2),
+	DMI_QUIRK_SD_NO_1_8_V					= BIT(2),
+	DMI_QUIRK_SD_CD_ACTIVE_HIGH				= BIT(3),
 };
 
 static inline void *sdhci_acpi_priv(struct sdhci_acpi_host *c)
@@ -751,12 +752,15 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
 	{
 		/*
 		 * Lenovo Yoga Tablet 2 Pro 1380F/L (13" Android version) this
-		 * has broken WP reporting and an inverted CD signal.
+		 * has broken WP reporting, an inverted CD signal and claims
+		 * to support UHS modes but they do not work.
 		 * Note this has more or less the same BIOS as the Lenovo Yoga
 		 * Tablet 2 830F/L or 1050F/L (8" and 10" Android), but unlike
 		 * the 830 / 1050 models which share the same mainboard this
 		 * model has a different mainboard and the inverted CD and
 		 * broken WP are unique to this board.
+		 * This match for the 13" model MUST come before the 8" + 10"
+		 * match since that one will also match the 13" model!
 		 */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
@@ -766,7 +770,23 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21.X64.0005.R00.1504101516"),
 		},
 		.driver_data = (void *)(DMI_QUIRK_SD_NO_WRITE_PROTECT |
-					DMI_QUIRK_SD_CD_ACTIVE_HIGH),
+					DMI_QUIRK_SD_CD_ACTIVE_HIGH |
+					DMI_QUIRK_SD_NO_1_8_V),
+	},
+	{
+		/*
+		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
+		 * Lenovo Yoga Tablet 2 use the same mainboard) These claim
+		 * to support UHS modes but they do not work.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+			/* Partial match on beginning of BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
+		},
+		.driver_data = (void *)DMI_QUIRK_SD_NO_1_8_V,
 	},
 	{
 		/*
@@ -904,6 +924,9 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 
 		if (quirks & DMI_QUIRK_SD_NO_WRITE_PROTECT)
 			host->mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
+
+		if (quirks & DMI_QUIRK_SD_NO_1_8_V)
+			host->quirks2 |= SDHCI_QUIRK2_NO_1_8_V;
 	}
 
 	err = sdhci_setup_host(host);
-- 
2.44.0


