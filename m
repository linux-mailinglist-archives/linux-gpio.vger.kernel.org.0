Return-Path: <linux-gpio+bounces-38560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zSMVBdcSMWrdbAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:09:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A0368D64D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 11:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=ElIeszfo;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38560-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38560-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F1F3085EA9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7B541C2E7;
	Tue, 16 Jun 2026 09:08:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61C3B42E0;
	Tue, 16 Jun 2026 09:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600933; cv=none; b=hTDrl3QmogyLuauFeM6Vq6qX6Zj5XG5bOC4Xx5KX6KGOdrXNtY1h2AHBCBrRqZieMdCqa3OJ/FynCxs7nD5SCF5572sXQEW4bJl3B4CkcAWemjjw9bdsy5WXCYx+wnq2oZ9o6KE+6eICaAXIfhIWzzctQC4uFFsRNbkSMVVyTEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600933; c=relaxed/simple;
	bh=n0NkIV/Qx3Uk2GLJjYkZ09/aArbxPofUZwETgU7mhwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ni0uIXsDmntRhiedUJtD2gwr600In2B24ZeW5nSf+Ii0wHAnmO8aFgpMHdO/9EMBm8Y6nUIaDjMv3MNyWVkmiFeOxkGYbIWjNJrmUI0HBKOExDw3jpVhWwTxoGXMBOFNxiM7yqOc/qg0GGuXfCiRQ3f/CrnLLQO6hJ1rM1dparU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ElIeszfo; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 71B75276FB;
	Tue, 16 Jun 2026 11:08:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlPkQ8I8lPOs; Tue, 16 Jun 2026 11:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781600927; bh=n0NkIV/Qx3Uk2GLJjYkZ09/aArbxPofUZwETgU7mhwg=;
	h=From:To:Cc:Subject:Date;
	b=ElIeszfovhCsLBpW3VM5xwtWOJZqz0j7jGpSFYxydhh53qoOYFZjYCaNwgCm3mcjq
	 Aq/pXi784cnY7tBVmKX+S/BBZvY4pJl92MY2GvTnfF9dS7GKlraOqErwgZ1gdpLuQw
	 97Gg5sNEw0Ped6bDq88Uu8fuCP9nWLjzcj11TzsgXmwAZywx7oo6Y4TIBh0Mut1oRh
	 gAa2M5uuvX30r/a9+dbGnonyNLRWpA8CRaA/LJm94jAOF5bJiMTmrYDib9ErwFi6EM
	 FVX5JF54G3G/XCsg22xUyWbKwhfVRMTuJdj5Mghezuxjpo72dikZjgCoM60/5OSCRS
	 Edn4iQS9ZF9ag==
From: Marco Scardovi <scardracs@disroot.org>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH] gpiolib: acpi: Add quirk for ASUS ROG Strix G614 series
Date: Tue, 16 Jun 2026 11:08:24 +0200
Message-ID: <20260616090824.5967-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38560-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linusw@kernel.org,m:brgl@kernel.org,m:mario.limonciello@amd.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:scardracs@disroot.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[scardracs@disroot.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,disroot.org:dkim,disroot.org:email,disroot.org:mid,disroot.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08A0368D64D

The ASUS ROG Strix G16 G614 series laptops experience a long boot delay of
approximately 36 seconds. This happens because the system firmware triggers
a slow/hanging ActiveBoth GPIO interrupt handler at boot time.

Even though commit 3bb62e3f99a5 ("gpiolib: acpi: Only trigger ActiveBoth
interrupts on boot") restricted boot-time execution to ActiveBoth edge
events, the problematic interrupt on these laptops is configured as
ActiveBoth. Consequently, the handler is still executed at boot and
the boot process stalls.

Fix the delay by adding a DMI quirk to disable edge event execution at
boot for the ASUS ROG Strix G16 G614 family.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004975..fa0f03bd51af 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,20 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * ASUS ROG Strix G614 series laptops experience a long boot
+		 * delay (approx. 36 seconds) due to a slow/hanging ActiveBoth
+		 * GPIO interrupt handler executing at boot.
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


