Return-Path: <linux-gpio+bounces-38647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aHZFJ0HtMmof7wUAu9opvQ
	(envelope-from <linux-gpio+bounces-38647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:53:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF169C08A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 20:53:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=N8YTvgo1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38647-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38647-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7BE1301C5D3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 18:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D34037C91F;
	Wed, 17 Jun 2026 18:53:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809837DEA8;
	Wed, 17 Jun 2026 18:53:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722428; cv=none; b=jLWCgdsxtXP168GB90fOcgv+sG/viRiowCd8ddfr42H2U+9FnW+G/ROu38WOagEIOp+YZL0rdYPkt76cfCoHYt1jM8T0GrhjvpJ8JWp4AmHFQ9mSaSkPsSWovTI9Bst2KVX/2O7JId2pvVnMDrVkWZkpQHsxlRZIbM2xgYK0Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722428; c=relaxed/simple;
	bh=C9Kc5u3uGWG4kXI65SLZH2WnV7LUNytQqC6LL1av7AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvSSaNcAstd/w6NdvFgxG1xIQ0ui1Ad/1QL3IQGsq4tQsvi7uKjkcwDg9sfmQRnDuTUKzSthl+A8kAo7eESWHMWlXdr0zOCCXkmhWGYlYzXcue8X8AbkJTqJh10GiCqAORTIs46YPr4wZWiyRrFjOWfaos9gb/aFoAXlQEIStrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=N8YTvgo1; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B948527832;
	Wed, 17 Jun 2026 20:53:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-6ZjoQM8fI9; Wed, 17 Jun 2026 20:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781722415; bh=C9Kc5u3uGWG4kXI65SLZH2WnV7LUNytQqC6LL1av7AI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N8YTvgo1Mdq4rjCz5ny5ONyfiesCtK9nU6gtIB9MfLm1hxMk6bwQjvJuvcGofDlMM
	 xJBjSOdySbJ3iYZCo+Hk3lOXBgrKuGzy6H68P6RcUIR/GiJkNy69DQbDEJQ46pzgk6
	 Z9hOy29klX6Q3rvAYIvXhiBEMkQFNAOxvuaobraRhehkWRkaQgxKrfVTbO8P7oPYco
	 c5mfaoNkEIvQeQs4lZuqQ1Mk/dPjvUASlRzeQQ1XBRRf8CfYyw6fFobVE5abcB84VR
	 /tSCY7diH+qat3L76ndvVvdYC803YGKLst7F07IbX9kpAxW1IBpy32CTy7WgO6XSLK
	 wz+m3HbpxajHw==
From: Marco Scardovi <scardracs@disroot.org>
To: bnatikar@amd.com
Cc: andriy.shevchenko@linux.intel.com,
	brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	scardracs@disroot.org,
	westeri@kernel.org
Subject: [PATCH v2 1/1] gpiolib: acpi: Add quirk for ASUS ROG Strix G16 G614 series
Date: Wed, 17 Jun 2026 20:50:13 +0200
Message-ID: <20260617185318.11237-2-scardracs@disroot.org>
In-Reply-To: <20260617185318.11237-1-scardracs@disroot.org>
References: <221cd70d-70f9-4d01-8e8c-b4a5b347b8b9@amd.com>
 <20260617185318.11237-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38647-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bnatikar@amd.com,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:scardracs@disroot.org,m:westeri@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94AF169C08A

ASUS ROG Strix G16 G614 series laptops experience a long boot delay of
approximately 36 seconds.

On these laptops, the firmware leaves the touchpad's ActiveBoth GPIO
line asserted (logic low) at boot. Per the boot-time initial-state logic,
an ActiveBoth interrupt found low is replayed once to sync its initial state,
which calls the handler synchronously in the probe path. On these laptops
that interrupt handler is slow/hanging, so the synchronous call blocks for
~36s and stalls boot.

The touchpad itself is driven by the i2c-hid driver using a standard
GpioInt() resource defined in the touchpad device's _CRS method. The ACPI
event handler on pin 21 is distinct from this and is not required for the
touchpad's initialization or runtime operation.

Commit 3bb62e3f99a5 ("gpiolib: acpi: Only trigger ActiveBoth interrupts
on boot") restricted the boot-time replay to ActiveBoth interrupts that are
asserted (low). The pin on ASUS ROG Strix G16 G614 series laptops meets
exactly that condition, which is why it still triggers.

Fix the delay by adding a DMI quirk to set no_edge_events_on_boot to true
for the ASUS ROG Strix G16 G614 family. This prevents the boot-time
trigger of this ACPI event handler without affecting the touchpad driver
or disabling the handler for post-boot events.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..3cd4cd27808a 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,21 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * ASUS ROG Strix G16 G614 series laptops experience a long boot
+		 * delay (approx. 36 seconds) because the touchpad's ActiveBoth
+		 * GPIO interrupt handler (TP_ATTN#) stalls/hangs during boot
+		 * initialization.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16 G614"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.no_edge_events_on_boot = true,
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.54.0


