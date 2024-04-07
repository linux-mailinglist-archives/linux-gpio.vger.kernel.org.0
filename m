Return-Path: <linux-gpio+bounces-5151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6C989B3E9
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 22:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A41D1F213CA
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 20:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80DD3E480;
	Sun,  7 Apr 2024 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JoeiaB+d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E43DBA8
	for <linux-gpio@vger.kernel.org>; Sun,  7 Apr 2024 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712520308; cv=none; b=H3d2AuDQnITfZ5Nof/UjDUr+3f8pAuLL+Rw1sLl3NiiCL/GM0kwlnL613eYXIVrUlurC/pgLw1bIBBCgC2QlSCtV8bMqZXpKoP6Y/qsIXA8TAxaHKuQ9X+HYcDLll5+4zY+joaCdlKDIPJ0lIUql58/octquZDSnbGOetnGkGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712520308; c=relaxed/simple;
	bh=qpQO6FgTw4O5eGAkk89F0WzAnCKXXhlTtJWGdjRuXck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OV3rjHTqvgYYj4gv44m1vR4csLJE5Xpw6NKiok8BGoDUWt5XGqjbmsGwwfS8HZ5G7V4a4olqgGxjC7FI5phEDTIr7BbSBdWzmtQZo31i5G53q+VAnhe7Zywrvqh4nstdI/klyyxJUAz76y1OxXWRcqypoo75llD0jJn3I/+fYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JoeiaB+d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712520306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZy4eop/gOic+2Q0knfJpw2Vt3sQkPwTALkTkP5fDO4=;
	b=JoeiaB+dzo+L8q9s3OxoXqPnpuC1PE0ptwBglbbBUasxadlLoiIVgR2ZJ5t6gqrsgKgfeP
	R3akUKnS3PMmRuBCK6heJ4AZF1mC+d5GcXLGxdDzHpW9EQ+Us2eHrT3DBkHnjTX1MRYubA
	cLdE8f1IOu8IuJv9w2+yaTDcTav72yE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-NXpV7CnIOzqZV0SACY58CQ-1; Sun,
 07 Apr 2024 16:05:02 -0400
X-MC-Unique: NXpV7CnIOzqZV0SACY58CQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11333C0CEE9;
	Sun,  7 Apr 2024 20:05:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3DE0100077A;
	Sun,  7 Apr 2024 20:05:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 3/6] mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not working
Date: Sun,  7 Apr 2024 22:04:50 +0200
Message-ID: <20240407200453.40829-3-hdegoede@redhat.com>
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

The Lenovo Yoga Tablet 2 Pro 1380 sdcard slot has an active high cd pin
and a broken wp pin which always reports the card being write-protected.

Add a DMI quirk to address both issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mmc/host/sdhci-acpi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index d2003d3be6ba..c0d77f589deb 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -80,6 +80,7 @@ struct sdhci_acpi_host {
 enum {
 	DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP			= BIT(0),
 	DMI_QUIRK_SD_NO_WRITE_PROTECT				= BIT(1),
+	DMI_QUIRK_SD_CD_ACTIVE_HIGH				= BIT(2),
 };
 
 static inline void *sdhci_acpi_priv(struct sdhci_acpi_host *c)
@@ -747,6 +748,26 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
 		},
 		.driver_data = (void *)DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP,
 	},
+	{
+		/*
+		 * Lenovo Yoga Tablet 2 Pro 1380F/L (13" Android version) this
+		 * has broken WP reporting and an inverted CD signal.
+		 * Note this has more or less the same BIOS as the Lenovo Yoga
+		 * Tablet 2 830F/L or 1050F/L (8" and 10" Android), but unlike
+		 * the 830 / 1050 models which share the same mainboard this
+		 * model has a different mainboard and the inverted CD and
+		 * broken WP are unique to this board.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+			/* Full match so as to NOT match the 830/1050 BIOS */
+			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21.X64.0005.R00.1504101516"),
+		},
+		.driver_data = (void *)(DMI_QUIRK_SD_NO_WRITE_PROTECT |
+					DMI_QUIRK_SD_CD_ACTIVE_HIGH),
+	},
 	{
 		/*
 		 * The Toshiba WT8-B's microSD slot always reports the card being
@@ -867,6 +888,9 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 	if (sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD)) {
 		bool v = sdhci_acpi_flag(c, SDHCI_ACPI_SD_CD_OVERRIDE_LEVEL);
 
+		if (quirks & DMI_QUIRK_SD_CD_ACTIVE_HIGH)
+			host->mmc->caps2 |= MMC_CAP2_CD_ACTIVE_HIGH;
+
 		err = mmc_gpiod_request_cd(host->mmc, NULL, 0, v, 0);
 		if (err) {
 			if (err == -EPROBE_DEFER)
-- 
2.44.0


