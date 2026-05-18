Return-Path: <linux-gpio+bounces-37017-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIUvEevFCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37017-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D440568307
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2734130117C8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7BA3E123F;
	Mon, 18 May 2026 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH20tHFE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46012F7F13
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090846; cv=none; b=QGiVKOPRcn9o20xf/7valbOzGzbvAKhkSU8NPGP7/rFJVFZsFdwHfZPUjFpLG4LRF1L+ZCTELP6dlr+dQfr8qO4Ob6AvMrkbH1xiNZ6ri/gB9xI7Ou8RvT8DhP1EDOpzKGZ4YnURdk7UHmTdzw0LciAnHb/WzOppR2uVIlijXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090846; c=relaxed/simple;
	bh=WCFTNgalPCyI+sy9RLNEoFvhiBqK+HERYFo0HvPnOpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bd8KSB3s/KthZgYm/0Pe9EwDdE8ucndsgfng/SGh/gayjMxxmfqTD3PFE5mCk6H35cKxYX/VZm0kp0y3F4uE7+XMQbdOQRMqZZHsrbsWDLCR/lcpdyP7skGbBX8HkYZvj4FdAAfA0rdlqO1DVNSdTU2SF2EBza743IlMQbR539E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH20tHFE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso8302265e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090840; x=1779695640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpOy3ncayuyh97YCAToNo+s6kNuDC2GipWRHQoTk0xw=;
        b=JH20tHFEV00Yx/cCfHiu0iQPTpn0aoSeGxMlp4Qc2H6jYOVh7TpV1UHjSlpSdYWo2j
         VG30uqWmVlAVDXK6PR2hzvUlueeynEL+cH48qgHZiA0UJM43zvjiIUSWQhCh2yL3YolU
         hMy/7KX7TYvazNHfLhREDoARVi6N2qHg+VtWfE/djbTtv69jkImzYMu+QcZPRTO20Lpb
         cgCd/aYECIpv/wVh1fDschzSMq3m97+pMYgGpuovHFbC7kDvfxx/hbIqd3W+E7NdEExu
         9s3vQxy2+fYh0G/APyvRm360fFCD60ibX7/sDHzSNXv4KnDPLuveE4p9H8QhIh+XymVr
         8QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090840; x=1779695640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpOy3ncayuyh97YCAToNo+s6kNuDC2GipWRHQoTk0xw=;
        b=rJdetVRJgak1ok3o5II4VG0JULZiJbBFS5TPmxMAbH0WfaUowXoryEPGTc3gKJefj3
         HT+sRt+3rzN43Qw7yjAhbz7ck/Vk7/yextCJnO1fwBiVjjIHr67MdSAKEHZV31D6v0h5
         vrmQdQS+dDRb6OIq+iRpAnmsuVOPgvz0WvoJuv6O8NaFj7V66vQWqk0JuQWkLaeiKQFM
         oC5No2p3+TgxkFFXW6T1L/4rakoVjqrAPYqjD7ngJyGdzHKj8pVl86HYZWQBS/t22U4N
         3bVWxyBajVwUBeQwHXx5SeZ+jvZsvAXd21cm9+0I+iID1pUsbzm8WTLxLcjBHxFZEERk
         VUmg==
X-Forwarded-Encrypted: i=1; AFNElJ8NALkPE3cnX3Gw/jWllx9FRVVEi3CwabKfB6PGMJ2ucjnmruH2HArb2uBUnM9jDfEVL3xzHmdK7Z8V@vger.kernel.org
X-Gm-Message-State: AOJu0YwVo/jcEthvITSErebAArAZVER3Rf0WUEiDLJX/C8K5+B7GmdTk
	6zaQfBcZSyjFBQ2bk7LkCRxUsAQ+2gaCUDlOtcqsTCAPrGA4/fSBnSS5
X-Gm-Gg: Acq92OEamjAGHkKRCHsDsH7LvXKl7rOBihRz0Nqm5VGbGOVgMrUtCDRXpa1B01VoYOu
	Cay0t3Qte+YwrT9rvFXkDMtUTRbQ0fNS6Hv13PasFspxQRbuwu44oFEFgqXzvxsith6CNWeEVTS
	0WpHFN6xaGsPNXzz790arEr21Y8fKigQ14c4kmXDV2lmWe01zRn5h2/9cA5f8MewHwBA7oj5FXS
	CPEY4iB7F2Mkr8gD39Z2CZ39Q8DpwO34bTaRiSH/F7S1aFbM7XZjUxs/zn/xAMCQtWCo7JPHmYs
	M63Cob45gUuOgCEoEsAr+NQEnyOKWP+4EHH7qb9lpxAcmguFUAisvisbT7xOsBJD1ozqoa5Rt7e
	osQ0ON59HvGec4tH6CzfqcAPliINIQhzk4QQg/FEXYTblHkZhMARD4mRMB19pMOCI/ctDz0p+ge
	HqsTUWgZk/+doLP0g=
X-Received: by 2002:a05:600c:4f8a:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48fe62f8c6bmr210573225e9.24.1779090840303;
        Mon, 18 May 2026 00:54:00 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:53:59 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 00/12] gpiolib: acpi: Refactor, harden, and modularize ACPI GPIO support
Date: Mon, 18 May 2026 09:53:45 +0200
Message-ID: <20260518075357.112584-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2D440568307
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37017-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Good morning everyone,

This patch series took fairly a bit of time because, well, it ended up going a "bit"
out of hand. It improves style, robustness, resource safety, and modularity
of the ACPI GPIO subsystem. The massive gpiolib-acpi-core.c driver (previously
well over 1400 lines) has been significantly refactored, reducing its footprint
by separating concerns into distinct, dedicated modules for ACPI Operation Region
handling and ACPI Event/Interrupt processing.

Key changes and structure of the series:
1. Hardening & Correctness (Patches 1-4):
   - Style adjustments to match Linux Kernel coding standard.
   - Modernized parsing in quirks using standard sysfs/kstrto helpers.
   - Added robust bounds checking for ACPI GPIO resource pin ranges.
   - Fixed a critical memory resource leak in the OpRegion cleanup path.

2. ACPI Operation Region Modularization (Patches 5-9):
   - Declared shared data structures in the local header.
   - Exposed private-to-core registration helpers by making them non-static.
   - Extracted Operation Region handling logic to gpiolib-acpi-opregion.c.
   - Diverted callback registration to the new OpRegion module.
   - Removed the unused static emulation handlers from the core driver.

3. ACPI Event & Interrupt Handling Modularization (Patches 10-12):
   - Declared shared helper prototypes in the local header.
   - Extracted Event/Interrupt logic to gpiolib-acpi-events.c.
   - Fully decoupled static event handlers and event structures from the core.

Build correctness and functional behavior were validated on x86 virtual
platforms using virtme-ng under KASAN and kmemleak with successful boot,
execution, and zero resource leaks.

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>

Marco Scardovi (scardracs) (12):
  gpiolib: acpi: Fix style and formatting issues in core
  gpiolib: acpi: Modernize string parsing in quirks layer
  gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
  gpiolib: acpi: Fix resource leak in OpRegion cleanup path
  gpiolib: acpi: Declare shared structures in gpiolib-acpi.h
  gpiolib: acpi: Expose core GPIO resource and OpRegion helpers
  gpiolib: acpi: Add dedicated Operation Region module
  gpiolib: acpi: Divert OpRegion registration callbacks from core
  gpiolib: acpi: Remove unused static address space emulation from core
  gpiolib: acpi: Declare shared event helpers in gpiolib-acpi.h
  gpiolib: acpi: Add dedicated ACPI GPIO events module
  gpiolib: acpi: Decouple Event and Interrupt handling from core

 drivers/gpio/Makefile                |   2 +-
 drivers/gpio/gpiolib-acpi-core.c     | 488 +--------------------------
 drivers/gpio/gpiolib-acpi-events.c   | 309 +++++++++++++++++
 drivers/gpio/gpiolib-acpi-opregion.c | 175 ++++++++++
 drivers/gpio/gpiolib-acpi-quirks.c   |  23 +-
 drivers/gpio/gpiolib-acpi.h          |  50 ++-
 6 files changed, 561 insertions(+), 486 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-acpi-events.c
 create mode 100644 drivers/gpio/gpiolib-acpi-opregion.c

-- 
2.54.0


