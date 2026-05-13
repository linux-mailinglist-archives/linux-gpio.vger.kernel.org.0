Return-Path: <linux-gpio+bounces-36703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGH8Lr0WBGpLDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A762452DFB5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 08:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30B1A3013AB5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 06:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B207E3D348F;
	Wed, 13 May 2026 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMeNor2R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B93D333D
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652854; cv=none; b=BhuuEhWkzrbmYj8LgnXOT49AKJXi6Y4raUj/1YyTnFLUXWdDY//wWlfetTlGPngurVRetuOwYfJ3dmN/2kkMXH8XtE91dR5fhwkZcpbrmAhhNokMptQL8tgxdgIBCzsAdDPuoF6goKqIDhWsawpaAEFWZqTMEVvHjC7w0GJ83QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652854; c=relaxed/simple;
	bh=V6msAI377L+ns0uHY7va0NdiO6T6hVzqRPjEuIEAZrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQDOwKzSXsS/MN1Bq88QsQ8UOiTUhng6jX9mdoztdOnE7T0Ku2fVyZNk+9mdq0Iaakzn8k70LEJAHSkDQ7itpZJfxjq0171t5NDLUbJWFqCrR+rJUjIivuOx/UDDLH9YeS8MmOaBqtE75Imwm3o7DS/6zDM1OH3LmzQ2Z4UAHIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMeNor2R; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8025500cc7so4620657a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778652852; x=1779257652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLABxC4pkckDVG0/IBLNPBDn3CA4Kl5z12bdryv+qA4=;
        b=BMeNor2RX4C9EPmX0QJ13DyyylQ8XGkgQgfDhtKTn5K2CIpjcEJgxb5jv8Abga+ItR
         KXwBEO9JSqFk0zHqqf4ChCoPqiKQ78KpMjroZeU/U0QLT0R5k5Rby7eKIzPuEKpVXFxK
         ALBEbr8VQTZ9/hRicjUipcm21a8hIrM1tkJKtwZuNHLt64Bug2JV90/O1Wt8RffO91+o
         KZHSXDcDmn1QDVYNrZ4m7khHMkemOZ+8dCCEYtUGxx3hY4HnShRY8AOrrCDhZ7iWgkUP
         9zqqDMRQkxU1UKhUMc4SskRjeuQ/zkHZpdA73cCczWxAL328g+T5ypp2qfWLbrhwzE6a
         URBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652852; x=1779257652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLABxC4pkckDVG0/IBLNPBDn3CA4Kl5z12bdryv+qA4=;
        b=ZJp+FoirFsoQK14LNq5RGcYFDe1ipsxsjTVT3kImxN77OxvnTHZlB3h3nmYUAM3jMV
         itf0dAi5JJIHk5H8aAgmlFdNdvOa/LFQrQPys/ntJNSrM+kObOvmlTwb7yyZlvSTkcr9
         m3fwjds/aTqGwhGEuHTTv2cmJJKO/EfMvaiyHZoXFHH2MWaKAx98Gah1CUzhRUoswMk7
         mUzXlcZSU9BtwRt72W/4SwDHDkeC0eGKDWSQj33mrxk+JexvWKhAjEWpPayHTH72EPc3
         FsC6xdkVShbUAZ3vYH45m1mrTdP7fcV5qgF0u4kPr45oH01zXEhZiaN6Lgaa640cNY2G
         Jt+Q==
X-Gm-Message-State: AOJu0YxGbqSt6L6dmKy8inKviZlDELWn1DJNjO5IboNRFdzYJuVeLRiY
	k0z5UKIU++I783qFINXeLa/g0doRPvQl70NmXRkyYTUveImfFJfP4E/LaPZrQzn8
X-Gm-Gg: Acq92OFCr22sub/GCwwKpKUbIxC5/5fbrnphCb4JClmYeQK78Wuj5qHTDd+poU7ZxRr
	UAwQ0IJH0g+tao91MTzSL/Fao0SX34UzDIlAP+rPAXbn9tazTv8R2ff0u8ICkVgLYqivGlmP52t
	vVh+ORNtmBFb38czBJrMN/Wczx94BNRgcZS1FKOkNbKC6tCRC60jgYQVskW+1WE88cAx7KXg+B3
	UsOklcAlr1rMC/EIYcnmCwa99YUwjATUbaPfnItbiqXVD3F9PZJi9to3aSgQM7kNgCRltJA0oYZ
	Y2CcWMxQVfIzot13s297+wW9NCY50UPiXWffhVfmyfHOUIVjbpbMPNo1iwIxdldt9taU7JC8mHq
	mOqwRs5mYKexfc3qK3uMLqmDOe5iHktqD+mJNw319P/ZOKZdjsoW3vSKXnx3kdU/8yCS5f/7nhc
	BSQ7RIl8wCnmNusC+u6PFujQmexe7Li8OZONSkIOdNVkB9peCjuaNxb80UhjgNU1geTkMNYMw6C
	DefEwHlxR1bX6TazMHXYTJXP4jishpCIamzjeNhG8Trqg7AnRJm2EVBKO0Df6db
X-Received: by 2002:a05:6a21:6d94:b0:3af:53f3:6ddb with SMTP id adf61e73a8af0-3afb002b243mr1610431637.47.1778652852266;
        Tue, 12 May 2026 23:14:12 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c64:ff18:3fa8:7855:804e:9f49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm13470874a12.24.2026.05.12.23.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:14:11 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v2 0/2] Fix WACF2200 touchscreen on Lenovo Yoga 7 14AGP11
Date: Wed, 13 May 2026 11:43:36 +0530
Message-ID: <20260513061338.9348-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A762452DFB5
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
	TAGGED_FROM(0.00)[bounces-36703-lists,linux-gpio=lfdr.de];
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

The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
completely non-functional on Linux. The I2C bus (AMDI0010:02) fails with
repeated lost arbitration errors at boot before any driver can probe the
device. The touchscreen works correctly in UEFI and Windows.

Investigation using ACPI _CRS decode and Windows/Linux GPIO register
comparison identified two bugs:

1. GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has INTERRUPT_ENABLE and
   INTERRUPT_MASK cleared by amd_gpio_irq_init() and never restored,
   preventing the device from signalling the driver. Windows keeps both
   bits set after initialisation.

2. i2c_designware probes AMDI0010:02 before pinctrl-amd's probe
   completes. A DMI-matched deferral is added to correctly enforce
   ordering using device_is_bound() under device_lock().

Patch 1 adds a DMI quirk in pinctrl-amd to restore GPIO 157 interrupt
bits after amd_gpio_irq_init().

Patch 2 adds a probe deferral in i2c-designware-platdrv that correctly
waits for pinctrl-amd to fully complete before AMDI0010:02 is probed,
using acpi_dev_get_first_match_dev() and acpi_get_first_physical_node()
for robust device lookup.

Both patches tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel
7.1.0-rc2+. Touch and stylus fully functional across 4 stable reboots.

v2:
 - Patch 2: replace custom HID/UID lookup helpers with
   acpi_dev_get_first_match_dev() (Andy Shevchenko)
 - Patch 2: use acpi_get_first_physical_node() to get the platform
   device for correct device_is_bound() check
 - Patch 2: use device_is_bound() under device_lock() with explanatory
   comments (Andy Shevchenko)
 - Patch 2: fix dev_warn to use dev_name() instead of hardcoded suffix
   (Andy Shevchenko)
 - Patch 2: fix commit message (removed incorrect "existing" reference)
 - Both patches: add Assisted-by tags per coding-assistants.rst
 - Patch 1: no functional changes (Acked-by: Andy Shevchenko)

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454


 drivers/i2c/busses/i2c-designware-platdrv.c | 75 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.c               | 35 ++++++++++
 2 files changed, 110 insertions(+)

-- 
2.54.0


