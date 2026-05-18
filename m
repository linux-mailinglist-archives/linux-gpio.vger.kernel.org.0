Return-Path: <linux-gpio+bounces-37057-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJtYKnkHC2r4/QQAu9opvQ
	(envelope-from <linux-gpio+bounces-37057-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:35:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93756CC23
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D167301221B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 12:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94D5409E04;
	Mon, 18 May 2026 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avxt0YVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D1404896
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107316; cv=none; b=K1PoVU/MXLgdfmJA6kA7XCZyRTGDxUKfSLSmsyzyd7xGO4eq94y/Qu9GvVx7rTLz0Nb3FJDh2m9CuFxUq+UccogTpN5uotO4RPlDgNEzViEPEQ1KLYtsO38sMwgbIwyDB2SMiw6QYqUDFaEPBhvjdDCEtMsh+TRL9WoWkU+GgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107316; c=relaxed/simple;
	bh=1ybKlwammGmDtK2LUbGag/NDL4ZS2QmVDl8lR6xNa+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjCPU0Q5sXU1/t1lMCjDcwfnD5Rfjw6MvdoTlJq3EJL1Id3B4tRxpFEp6ObFqLe6MUmsp9f4vuOPuCZfl4BBu9bYxCQCdggkF3V34g19At6EekD2pQF5I5guTE4y+h8CfWCnvlNRjBy9lNfQ5A8kULnRhw6L+xhkc3gitB/Rmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avxt0YVb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso748215a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779107314; x=1779712114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/qCgc+4mUjMLRI/598MkfZu+KxmtkC92/pg9a3hb/M=;
        b=avxt0YVblNa045y12DGDTHmLCjawAOWaPhTGyBPsmHdGuScq6uQIbjE54X5uqFQp7L
         RpSXvKSdJVTmutNfzf05KhXvdGBDisYclHHzoCzWrZrDJTA1SZBss93wZtBNCwvdF9gw
         dwwNh87SlVxRB/cD459Ncn+EgxVrtdzNVfWpRGZdJj6kWcpVWvcBwCrcP/PQ6pvoOkKg
         fI0uKZoH0gRrUBBehKLLObjMfEuSVTNeiZynvLx2+3XY5K+0wENWD6t584BS6/dictrY
         zJ43t0npIzNC3izD8m+GDoXSlenbkbdsKY5q1mZ4fivS9fqlIFLgILCmcyHcQWh3phB6
         NI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107314; x=1779712114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/qCgc+4mUjMLRI/598MkfZu+KxmtkC92/pg9a3hb/M=;
        b=ONiliKscNveoo7CXCo3nRxThKLay2iKEOx1qPh4f0SJ/gTTi+0PUph6pOfVkDWVPHP
         s3v+4us4NSUAlmHPnFmMrxE8TlRFOpb8uzpmDF5o2kNalfaiLqJNjXxH1BVAX2sSKqB4
         Flen+wPs2Ccw7uVWTJhawwXiCf3sQW90oVUHmiJ/ekseu97gkD6CS5P8p3rGwjBBB3l5
         4nGmgjePw8+AaR1HDL9W+pacmeeiGbCcXGHIyuSgEuWWEoFvtYl2XbgTWW/ZOLDy/hvR
         6obKrh3h1zUrmHW4SwvQ8o0DyNz7du9fXmahrHcUlC4Mz0GjwbijzNX+IfXP5VLJYbl1
         WfaQ==
X-Gm-Message-State: AOJu0YxLubaAWFaxXAHx9nFN3vqYK/TXwhbeaKNWFAcQWxgdZhkrL/1h
	eyMXXY3b0M0w/+cnX3R+QIQu+HkOnyWaXtbhnB93oAkSDu6N/q/CNxrO
X-Gm-Gg: Acq92OH5rT3VsKKIARGOlQJ1Tyfwn5KPISr3b/tCuOBEpQzTXgZlXXByK1eshy66SAe
	xnmWW3+c1N2HgIzzEvqsvLjGGLU06j9UxMj7JFUyNCiXKnpJesm652oRNC5/8auDn/LChWqnf64
	/hH8/pDjgUIgRuKT0RzpJCHLQwiArNSKhfp/AtbUPEtwuqGaVv0Wz9ohHCKOxxJa2mPH2GtS+z3
	1//woiVDZ/hReTFNyMiIQKJ4Ax2ARWxRUcy/gwOz/8nbBahlvCJeciA9gD8sUV18QY4X2YUHtq0
	52iB6JGY3XeTsw7z/WZ/Up8PddbX8HcR8A0YHUV4hIk18UVBGrQ/8NwD8EAwsAM/AYYo6SA5Ybc
	TEMm5d7MAmqdaUatSTtzq2HgNBOhjKYhflTCGZqOrOv0OcbM1GYDc9+lZ7hZ6iUvQFEeOS5cUgc
	RwvQ3p35FqRcdXlj4XCGtUwJBW7DcGVdq+LIY0/vGb+lkcK/5WSh6USqxDmTv7PSu2TtC2r9Svu
	qMkc5XQ7VeEdp4MTR9f+PEhyn8fxHvgMNw5s4EXF4fMghBcTglYDxsZ362K404l
X-Received: by 2002:a05:6a20:430b:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3b22ec72085mr15778694637.39.1779107314447;
        Mon, 18 May 2026 05:28:34 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c65:166e:af67:d4b8:e4e0:1695])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664a59sm14650472b3a.1.2026.05.18.05.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:28:34 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linus.walleij@linaro.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Mon, 18 May 2026 17:58:12 +0530
Message-ID: <20260518122814.8975-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F93756CC23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37057-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
tree. This series contains only the i2c-designware probe ordering fix,
based on top of that commit.

The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
interrupt bits cleared when the first I2C transaction is attempted,
causing lost arbitration errors.

A higher-level ACPI devlink approach was investigated in response to
Bartosz Golaszewski's suggestion. The DSDT has no _DEP object linking
AMDI0010:02 to AMDI0030:00, so fw_devlink has nothing to act on.
Setting this up at the ACPI layer would require either a firmware
change to add _DEP, or a DMI quirk in the ACPI scan path — equally
quirk-based as the current approach.

v5:
 - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
 - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)

v4:
 - Rebase onto Linus Walleij's tree (patch 1 already there)
 - Use --base so series is correctly 1/1 (Andy Shevchenko)
 - Add subsys_initcall test results (Mario Limonciello)

v3:
 - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy Shevchenko)
 - Add BugLink tag (Andy Shevchenko)
 - Add -v3 subject versioning (Andy Shevchenko)
 - CC AMD engineers (Andy Shevchenko)

v2:
 - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev() (Andy Shevchenko)
 - Use acpi_get_first_physical_node() for platform device lookup
 - Use device_is_bound() under device_lock() with explanatory comments
 - Fix dev_warn to use dev_name() instead of hardcoded suffix
 - Fix commit message (removed incorrect "existing" reference)
 - Add Assisted-by tags per coding-assistants.rst

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454

Hardik Prakash (1):
  i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
    14AGP11

 drivers/i2c/busses/i2c-designware-platdrv.c | 76 +++++++++++++++++++++
 1 file changed, 76 insertions(+)

base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945

