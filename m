Return-Path: <linux-gpio+bounces-36651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJYbFw7YAmpXyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:34:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD8B51BED3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF7D53003BFA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 07:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F93368D73;
	Tue, 12 May 2026 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKFpCSRH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6D3148A7
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571271; cv=none; b=gf1eqwD1N6eYOs6sTvOkECXI7aAqg6/2Wkn/UKhZSQxYfWoqdyDPNOORu5lncaoSp2WbstiyQEKwfeBRQX3XINhntT1GlmO8/xNsJtl7ZSAq89CzWeebafuulh2ORchVSQYAVY6KsFbsE9LAn2BXBTxp5eVCOcYltbX1wDWnRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571271; c=relaxed/simple;
	bh=t1XG/Pl14YN/6UQXaghjEzoaUjADDTxVxBV/J7INaiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1a5C+psfS73TuvaiJyAK7WhgwRcVlgHQUVYstiPb8GeNBkCLki6+mJwGIxInk/+47+/42j49I9MT9fHZ1UHTcffu9rM7eVCazFTpIt2HQgAlKfbdCohq57s2hfCfq7qtFjhG3urWPHGHNUw5jkVyr/s3Dr+Y8EAwkYZekfOK0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKFpCSRH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-366070f71adso4650185a91.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571263; x=1779176063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etg83PviE/w1g4Vyc9uQdtlXTJeI/QHOPu5afMb3oNY=;
        b=LKFpCSRHn1KiDKpELsS5o4vYvnlOdEP4K5iNs2J8qAYF1FfTV/KAD97Oy3jR6RBRT+
         jCqiW0wkr7uQPBBBeZIZM8HJBhkkt8d8RANbaSc/OrhKKoH+SSCohfqrcwAF/cC6k3ZC
         jDew989B2HF5Kn8bFRw1D7Il1AmCU9rJ1T/bifjBi/Rf1anBbaJTsMklV2UWP8mIQp2A
         6HteVXT+R5Y0tApcAK29+nrNmOculpTukgHbx5wy+HgstOecjahWZZuNNnns+jUCpdau
         BF7Tg7lIwPtzAWhBQa38j0tHlmT6x9bdryzbJ9nFevPLDK5Hyb4+qQUdw3PqmuEH3Vug
         4gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571263; x=1779176063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etg83PviE/w1g4Vyc9uQdtlXTJeI/QHOPu5afMb3oNY=;
        b=jOzXpIDweWBF2s6kXIYedfNlvhC7yxgXZfuowY5JY/7CRF/+fA7Mrj1mZmgRvQArm3
         xnWk1xuab5VFUodUwU7cQD0mC3AomYPMB+rgjmdh5+VOYKy4YwpKAV607a/fvnVmCT/0
         yL/1ifQibKeWfZQLg3uPnt8tRRWttNQ0WBS9eN9ga9ZOpPXUepicRjSsbDHAiMmbavQs
         6UvBgnHXRmc/Zcnu9Y+YxnnyblCKGB7xrApqs7XEO6H/vAZantKi91qhvxy9c2+wBLtV
         6Z099EDI/23sfKi92/QrhBMy60vREfJXHR/TtWZTlBzO0a1cYnuIQAOADnQ7spaw3z9r
         UTbQ==
X-Gm-Message-State: AOJu0YwdxufamD2psP8DvCshyuAGFrXAEfUpL3NdoWc5eL2TL5cwpsbh
	v1CXY2VRdjcv3CEyxDTprKzEi3LXbAMsF6Z7oPHXo+2kXU5V41RDW7Ak2w83gJaIk7U=
X-Gm-Gg: Acq92OEnLQXy4mCrjsnuWlShJRHe/wMr6aDkscuALKYGvCNNqN/rpHDnZ/UhgPPDSW3
	7MPKTAQcR0UT6BCrcD0hvDYMSsn8n82TpjNaZmQDBItjz/vEKpId9bONkgxfzKG1FQpZG7w9/ti
	UZB36pgd9MucAQbiZG30ff8VLct7eN7Qew5tQpWgkOAwyvMyrstbN30LPtUFjVJIXGXafhQIwbN
	D4+hBi4uK1MErjdHGo/SRkidGDmh4Ljd+F1RKn1DL6xCjwUiabcpSPzL6Ljv0klnsrECS9xgTxb
	CZ54U1pMe/OXNlQ3rl4kgitgwu+GOYCpR053l7u6Vkf4wmAhu1hk7499DLJKtWr3bZ8/5wxsgfT
	ybuJ0VLPncoAx1aoVANU7ZoiekpNoU7tCWxLYEO2l4HAORNpqV82dPCzjQiC+djE0Uo6HThi474
	YBOGa0EWEhQYXF09RWTlxlRT94l+DMGN3aasFrcpVNUdIDWejb+QMjiD32+NG724MxTys15iM1J
	POoq9+pcKK0P6jUpOQfxklR5IOkOJNH7MmGzVxvLvdwmaLS/uEL5a4uph/ok0Q=
X-Received: by 2002:a17:90b:52:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-36652feecdamr18593148a91.5.1778571262728;
        Tue, 12 May 2026 00:34:22 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c23:32d:3989:a15e:2491:59ba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63bad27sm12420410a91.10.2026.05.12.00.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:34:22 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH 2/2] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Tue, 12 May 2026 13:01:39 +0530
Message-ID: <20260512073139.16343-3-hardikprakash.official@gmail.com>
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
X-Rspamd-Queue-Id: 5DD8B51BED3
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
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36651-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

The existing dw_i2c_amd_gpio_defer_dmi quirk for Lenovo 83TD checks
gpio_dev->driver to determine if the GPIO controller is ready, but
this pointer is set before pinctrl-amd's probe completes, causing
i2c_designware to probe AMDI0010:02 before the GPIO IRQ quirk runs.

Switch to device_is_bound() under device_lock() to correctly defer
until GPIO probe has fully completed. Also replace the string-based
device lookup with ACPI HID/UID matching for robustness, and add
DMI_BOARD_NAME to the DMI match to reduce false positives.

Fixes: the lost arbitration on AMDI0010:02 at boot on Lenovo 83TD.

Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 81 +++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3351c4a9ef118..ccf4433a1d4fa 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -86,6 +87,82 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
 	{ } /* terminate list */
 };
 
+static const struct dmi_system_id dw_i2c_amd_gpio_defer_dmi[] = {
+	{
+		.ident = "Lenovo Yoga 7 14AGP11",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83TD"),
+			DMI_MATCH(DMI_BOARD_NAME, "LNVNB161216"),
+		},
+	},
+	{ } /* terminate list */
+};
+
+struct dw_i2c_hid_uid {
+	const char *hid;
+	u64 uid;
+};
+
+static int dw_i2c_match_hid_uid(struct device *dev, const void *data)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	const struct dw_i2c_hid_uid *id = data;
+
+	if (!adev)
+		return 0;
+
+	return acpi_dev_hid_uid_match(adev, id->hid, id->uid);
+}
+
+static struct device *dw_i2c_find_platform_hid_uid(const char *hid, u64 uid)
+{
+	struct dw_i2c_hid_uid data = {
+		.hid = hid,
+		.uid = uid,
+	};
+
+	return bus_find_device(&platform_bus_type, NULL, &data, dw_i2c_match_hid_uid);
+}
+
+static bool dw_i2c_needs_amd_gpio_dep(struct device *device)
+{
+	struct acpi_device *adev = ACPI_COMPANION(device);
+
+	if (!dmi_check_system(dw_i2c_amd_gpio_defer_dmi))
+		return false;
+	if (!adev)
+		return false;
+
+	return acpi_dev_hid_uid_match(adev, "AMDI0010", 2);
+}
+
+static int dw_i2c_defer_for_amd_gpio(struct device *device)
+{
+	struct device *gpio_dev;
+
+	if (!dw_i2c_needs_amd_gpio_dep(device))
+		return 0;
+
+	gpio_dev = dw_i2c_find_platform_hid_uid("AMDI0030", 0);
+	if (!gpio_dev)
+		return -EPROBE_DEFER;
+
+	device_lock(gpio_dev);
+	if (!device_is_bound(gpio_dev)) {
+		device_unlock(gpio_dev);
+		put_device(gpio_dev);
+		return -EPROBE_DEFER;
+	}
+	device_unlock(gpio_dev);
+
+	if (!device_link_add(device, gpio_dev, DL_FLAG_AUTOREMOVE_CONSUMER))
+		dev_warn(device, "failed to add device link to AMDI0030:00\n");
+
+	put_device(gpio_dev);
+	return 0;
+}
+
 static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 #ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
 	{
@@ -138,6 +215,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
+	ret = dw_i2c_defer_for_amd_gpio(device);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -ENXIO)
 		flags |= ACCESS_POLLING;
-- 
2.54.0


