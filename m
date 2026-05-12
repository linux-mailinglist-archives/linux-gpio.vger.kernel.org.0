Return-Path: <linux-gpio+bounces-36649-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIB0F7DXAmpXyAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36649-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:33:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386551BE7A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 09:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EF4E30142BD
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 07:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17343148A7;
	Tue, 12 May 2026 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rf1gJy6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340E346E7F
	for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571149; cv=none; b=lYWX1laQ43bwBZBrIYkYkbm9s3dPOQZ55GL9YmN2YUblP/Mnp6mAnQyc7zGoYPLwFLm0aTXVo/31kXLuhl6G703/T7qJRdDvNpq4HFuhjCUsYgU4xNSqASxkIPbO6YHboq1mLZ4514StpcjXKoiRyB2U54Z31OhUVhaUiGPzB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571149; c=relaxed/simple;
	bh=GTUlPVx0YMPbfLUzBxXLhjPR/mqY9lD53Qc8zk3/i4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GhtikpmDulkgxFuOBvcW1n7YT3r26PXL2ejJT9eBaZsJUgwwxyQvkDXToKUnbMbRxrkBAQuMf/WLF0mXAQz0kU4QwNvfzsxZJpdUw/ReqkGtn6JGUlW3BU6yHMJUHzjMZKt5G9rY6d3UXCVv5Ke5Sem1W0qt4GoI2paLjoXGKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rf1gJy6j; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367d88b9940so2018715a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2026 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571147; x=1779175947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9/d2mQMSHOXQXBgiHyinooMXc2bmST//VHdITCznnc=;
        b=rf1gJy6jEY2cxpt57+pHrqH7+cUSs2c5Bc9EP1Ce2aTUnq2T4CjIVEBwHIGZlf3Yko
         5sKXicnKqFueK7KOjSN5ULjq4wpO5Uu/IHG6wDtjMjx3HtZrrOY1IJ1+m8T7ShnbO8mQ
         d9VE5qeMCyILQp2b0Ju4Tmb8d4f95agN84vvme1q/y8znbNE+KLhyq3tY0dES+7Qo766
         7UNS7ph5aDnHE76M42HjFb1aYgwOcG+lhUVNPDlCXCX6gM8WAjxwJkcJZZ0F/hC3Jjit
         +FpXao7+L/kFMRnGEiNLgHyNkguVoaLH0n0o2xF03bj+iIEBJhnxHBdVuCErB1x45QTs
         P1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571147; x=1779175947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9/d2mQMSHOXQXBgiHyinooMXc2bmST//VHdITCznnc=;
        b=Xwnz6ZOs0ZZXlno/MoeA7DhJ2GHVmXi1Tmiz7hB8v6AfghqoTB+z8N82r2mY2HQGbo
         at32zniSHG4JqMXH/G/KR9KKrsEetaShmvRNDbT9/gzSitKTkSIjb47oEZuPLWxZUdBU
         TFKMHR1Ky7DbeWSfR8Y3joy9lkKtjAb+q40Z7PuJfjOlWHdu0kp/0FJkJhBliGwKAq9m
         wVuhKg9r6dByTOBu/Kx3gMnE5F076d+LFqxIJTiMKqybqv+ie8S+LdxNPZaXzQagkVCh
         TAWwNHHMhNUUwkZoiw7lN0QFCxGZOIUCywFLPZpFQ4wGkWYkH/guPC++hEcyJxrPyTN7
         1cvA==
X-Gm-Message-State: AOJu0YwZww8eIgr6qm4lKeGvTqEZHjiKHmgLBDpvYCxUPR6F4ER585mu
	4YOqN9g8hnpO7tbOyenF0VvPyLnNULaCGLSPPeEmjQjGLtuhljPaHesGAhbjsXEwpD8=
X-Gm-Gg: Acq92OFz7zN9agcV/I4CLpkdYwx4natQmSYkUroaJO8vGv22fXRjDLd4uVWj26HTzWn
	u7kWKB+r3usbWi8Vg+hEL2nLpXRIBecYBgwWclGQQIw1SR32GveGgrD3ectoVwayg5co1pziPRp
	cE9RWVpe+h5p6FbywkO0Rwgf7qm1s3Q4AAqSgg0S/FXS4TokC8y6ZWS1XgtqYUgGSoD7kjtJ/T3
	8+yhoUtCzUuQySOqODmfVfiU9BTTwxCl5vYfBEoXNz66+LdwuSDekhAu69wwNpkYn+9kGDvfwYr
	YROKVoIAKcKUYZhCsNKLGVEA1dhDQ+fEBLl3HP2NuIZmh0l+PjZ1ZWvCTms+NGdA/0NvLnbdLco
	a9I6pl1clyMTekQIMSq2MR0hgXFcNyXJY2oN619PsE4fwNS/T7dfqRbVf7xTLcG5TcZ0e7bUagm
	62t+QyGu08y5jbr3eMjXV/nb2iyu2IUMuR/aUgT9fmpTqy9+2oWdKUIRW6EYNYnIvTtcOLKvAjq
	OvYOdw+/QlwzuSzeAK+BKWA8A1VPNsSus3FOJiYYrznEN/EWOj+bHrId1YgJM8=
X-Received: by 2002:a17:90a:2c86:b0:368:2289:42cc with SMTP id 98e67ed59e1d1-3682289a92dmr6128980a91.24.1778571147028;
        Tue, 12 May 2026 00:32:27 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c23:32d:3989:a15e:2491:59ba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63bad27sm12420410a91.10.2026.05.12.00.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:32:26 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: linus.walleij@linaro.org,
	wsa@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH 0/2] Fix WACF2200 touchscreen on Lenovo Yoga 7 14AGP11
Date: Tue, 12 May 2026 13:01:37 +0530
Message-ID: <20260512073139.16343-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7386551BE7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36649-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
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
   completes. The existing dw_i2c_amd_gpio_defer_dmi quirk for this
   hardware checks gpio_dev->driver which is set before probe finishes,
   so the deferral does not actually enforce ordering.

Patch 1 adds a DMI quirk in pinctrl-amd to restore GPIO 157 interrupt
bits after amd_gpio_irq_init().

Patch 2 fixes the existing broken deferral in i2c-designware-platdrv to
use device_is_bound() under device_lock(), which correctly waits for
pinctrl-amd probe to complete before AMDI0010:02 is probed.

Both patches tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel
7.1.0-rc2+. Touch and stylus fully functional after applying both patches.

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454

Hardik Prakash (2):
  pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7
    14AGP11
  i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
    14AGP11

 drivers/i2c/busses/i2c-designware-platdrv.c | 81 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.c               | 35 +++++++++
 2 files changed, 116 insertions(+)

-- 
2.54.0

