Return-Path: <linux-gpio+bounces-36948-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAU/DQxPB2rBxgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36948-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 18:51:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A585E55409C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 18:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA4443340206
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B01D4C0433;
	Fri, 15 May 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fin0sNQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF64C0408
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861758; cv=none; b=tL6AFQBwI961DSRkmi7gbVdMhBFL706bhd+kIrkPSNvL5P2La5/YpwD0Gj7KqigQUz/jzkIzG7OgUuz/LrAbPY2V8MnsrZtT7JLTVsX6cd2xfiMgnbbAqBYZd/4Mxiny5VPWwMxI0oizwoIal+yR/WwMfZ2qvq5bszvY6qEr2BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861758; c=relaxed/simple;
	bh=qSZuFzawdmmgI0kkp8axChRwnn8vKGfKmospa+AK43U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YusJ3uhRSgAx2zMXobJIoAORToVHGFtZVVFA5DCDv+zQB7vfbUD4z71ylLtesKUstwAgIXKbU2UpaADJ506FxCkv5DaUF7m3D/aFQZY+sIfppzvm7zxy45oEK2zhdhIFAad0smfgnl83p6eTcJB2wxwhxVA85hB19RhhjTJNZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fin0sNQn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso3925069a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778861757; x=1779466557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQRqiVHWya/5y61dQcIpX563d/hPABwmTEr+JCzBtB8=;
        b=Fin0sNQnp4YoQvUENVyHSmRHWKX0+dsd08QGUzTEeNySl2QQYISkCFSrMn2VV9jY29
         Ytr2t2mV8qsZ5mBXf00IgN9XXsHlbC+AVJnYkPXvl7MinPhB42z18OF7XOXG92eQghqE
         fJNY9HI477Mou1enAe+52ZKO7JXn2LG0jksUEo6sdDNlAkVH2+XSn7byXibtqr33Ug3D
         Oon9bEohS2U2t9IRKrXf11QSDJffp5NY6YssyWwILau6uT2oWO+D2T9xWZu3hNY9bIXo
         Weoy+qPiTWiVL3XV5+1+UtqbG3DFmfhGcc/rlThM2oOeYE/rpTgR98dkI82hmn85O5g9
         tlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778861757; x=1779466557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQRqiVHWya/5y61dQcIpX563d/hPABwmTEr+JCzBtB8=;
        b=ebsJfzIzyq435BYp0CrGiarYVhio/S8x1DRNDPxeP293qZHBbu0I1SLYYSOiDbh9ai
         wP10gC5TDomhJhLdw/1qiQDgkXCjRReNvX2r1XqIBivsJEz0VPWA4dl664jVtPuCTm/d
         wqR//18coRub6grZznoZLAkI+7GrnNhle9NcFZRdWZyJmG1KAStIeVxy2OvCm15jrsL5
         B021b8UjwzrmHwUx+IM1uY0Ji1P0a3t5ty0w49RnUo84mPCaXn/UK4N/YMlZHmW7tOiQ
         HsFHvKammiqcJ5FcKxJWDi942xR1b7j8HoXlP/YFhzz/Mrd3VvPnbAOEV9Qj7m4YlSIF
         LFCg==
X-Gm-Message-State: AOJu0YzTEWENFXtluYpz7mq5s4SG/M1cSzxD8KfBCVzW9n9W/He7QpOp
	SS949PEPe4EFuGWMFNhOfv/285XQN5ywNURxXewGFREW0qWU8UbJHuVd8LhoVOE/
X-Gm-Gg: Acq92OEr/04O4bH3Y6wB3Ioxx5dmHHbKQRrDKHkbQFIm76YT2ewPZzHGcp+fJ39B296
	1hos+i9XardnoKBYnSN8Z/jiwp2ZsfANgxMPp/y/xWGPu01s+Xm7Ud4sAnhmnvENt3GUUwGsBSD
	1wMc/LyhfI/xSygczVUcKtnoYcGPk1Js9uwe0acMVWGzO6hC8QuX4m6zA7WUgY6Y5LXLsdRH5zV
	vrOFWkajqghnaOK0uhCrhfZ9SWT/idUsCeImpXjl/w/IwzJm/sywNSsdiNjoXU2HaBbmqe3xMaB
	q/TUBgLs5Pja40/A8iZ3QGWyYFqV4IpD5PnUfj2pssy8H9nzJSD98+Pv5RgtSZp479ZqKdI7WfE
	9DrxGJSUUw79mZBP5sRjeyvolRyF9WcfNpPq2hy2l6tbs63t7tkJjkr/vkladxfxXCAovEOJ11t
	op5rXRLMCD95yxMOaDfZLB8lMNyr2rYdUX6O5uX5YcbAAqhxYj2KPkOdWqMQGl32udsCTq19ijG
	XOVMYHWS5XjMQuC5LLSCBlPiAul9QbTT/FdiVl/6KtQu+3Oa+Sf3ts43YbwKiuB
X-Received: by 2002:a05:6a20:7fa0:b0:398:9e47:f5ff with SMTP id adf61e73a8af0-3b22e67bbb4mr5826867637.2.1778861756709;
        Fri, 15 May 2026 09:15:56 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c64:ff18:3fa8:7855:804e:9f49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062a2bsm7699036a12.7.2026.05.15.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:15:56 -0700 (PDT)
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
Subject: [PATCH v3 0/1] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Fri, 15 May 2026 21:45:15 +0530
Message-ID: <20260515161516.10474-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A585E55409C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36948-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
non-functional on Linux due to two bugs. Patch 1 (pinctrl-amd GPIO IRQ
fix) has already been taken into Linus Walleij's tree. This v3 resend
covers patch 2 only, addressing Andy Shevchenko's formatting feedback.

Root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd's
probe completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
interrupt bits cleared when the first I2C transaction is attempted,
causing lost arbitration errors. The udev rebind workaround (which
works because pinctrl-amd has finished by userspace time) confirms
probe ordering as the root cause.

Note: the dual-master hypothesis raised by Mario Limonciello was
investigated. TPNL's _DSM (UUID 3cdff6f7-4267-4555-ad05-b30a3d8938de)
is a pure query method returning a constant HID descriptor address with
no side effects, making firmware acting as secondary I2C master unlikely
on this hardware. Awaiting Mario and Bart's technical verdict before
any further approach changes.

v3:
 - Patch 2 only (patch 1 already in Linus Walleij's tree)
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

 drivers/i2c/busses/i2c-designware-platdrv.c | 77 +++++++++++++++++++++
 1 file changed, 77 insertions(+)

