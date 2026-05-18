Return-Path: <linux-gpio+bounces-37090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDOsEZWJC2p1IwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 23:50:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E04155741BA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 23:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C254301A997
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 21:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9F039A7E7;
	Mon, 18 May 2026 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb1/6Fmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276483909A2
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141010; cv=none; b=rB/7poK2E659hZeh/kyfvoAO3XUNoio0BY4ZWaBLn8aI0o2CQQ4DKbwB1hthDjtG7zeMjnyYwn8LsconMDoyxm+LAuxS4GQiT/LVmxUP4yjBK4c52Oy/CeUiqNEY/cEJr+tki+g/71zWYx5IJql2H0VupHzGb2MTKs2RVD10TeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141010; c=relaxed/simple;
	bh=Lg7fWyly90F3ihSTCWqbxsBLSPkegGMGTEOwKSdPXeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFcuRcNOhpXrp6aa30Ya6OdeVqsakd36Ujo8XJKZ0db6sNsFpN0aZq+bLqPZUp36fSC8OEZT6eW8cDQbav+NU7UbgMrTUGnQchH+8+K1PlpiA3yGxe/59P/+YBotKsu1lKKuDdiBKACeCX9EpVh8+Ja06LedFrxq79EzndQUcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb1/6Fmu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so17835455ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141008; x=1779745808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLBT7VYjQm9ozuG2dmFAZtoh/FcI44K/00Rj2P3S1JQ=;
        b=jb1/6Fmubk5Pl1zsHnPCUa5AWIYjecD13HmkiSfl9qYfLjIKFh+zbhuSRlaNPzFPIQ
         G0s9S6E+GWfvxCYSH89cVr7ksKz0SbWiay7PPm/FQtOussOjFuCQE2rf7e2Jv3ulTJmB
         VbL2oyCJEk75eFbL4eYuxHuRbbLJhCqAibnngWJ48ak3ibXHKXDtPo6f4SlBGJX+Hbku
         vgo+Nvjrh8iq9egsnCieeWcU1sGbXYP+6a4K0peQGLubOTFMQFQN8iHqNO49UmIfSySW
         7HKy1edcjKuZdAIqTqqOP/suADfMJi0YWo1t92q4gY4zpR7XKMRlB4sfI7hwoLzQGp+l
         fRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141008; x=1779745808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLBT7VYjQm9ozuG2dmFAZtoh/FcI44K/00Rj2P3S1JQ=;
        b=e1U7JPVg9t83HiEVtMQ/gX43KE0skHrU/sm+ajHRScTMOF2m2S8MczrGM3q6a0pZaP
         e0Vx1ivgNBCCXX7uTNTPWHh0a05PfcK2rQQGkZNt7rkQd0SHryw13Z++O0Umxiw3e2td
         OlcuCbVu6Bj3C7bToHUf1wqojN5rdx06uFDrCR8PvipYljn7p1OyMNYmluoVxaoaXZ9+
         LV4adWm/0Z2GVETPkE2V193XEiUO4Mi11o4e2EHNMFs4ILELDXv4XpZ925y89Nnpr5/O
         CqvGGKsqiCd49mzFeLXQhKPNO/vf5XvOwRUHiOXZ+ouc8HliCn4nIJqFobvKB8y0KaF9
         hzGQ==
X-Gm-Message-State: AOJu0YzCk8PqfeUAEOtNUEJRtPJXB8Ob58aQUmW87ZSqDXoMHvkEjWgo
	Hw2J3fNteTgKmQRRYf7o5Cy7omrqmWynD0JTpaisrs/ZkeAS7nnC/9Aco/9uqWuq
X-Gm-Gg: Acq92OGle9/wTmytPW1I7LMUPa3cvxeKA9KCeqK0ungIQYuCAgMy8DPaXnrt2dZdqpb
	PqdeG74f+kTp3/57vFO/siKQiNLkCj+Ca0DVWKzKvXOT6QuRs/eB0ybbzIyKu03gfubcr9AzG5o
	H5hV6WugGBZ2T67YnxX/Wasf3GQ0pYtATb9GDn1jVHBB2QLgetVGTY3YN85+C8gaIngkaIy1mG2
	OI1NCmAYLaFa4H/rfLI5Iy4p79owhBddRBughTu241zCbW4xD+UwhHofkVJme2owp+jwA23p9B3
	5/fVRJYlB0/QCN+5ZWZg5LoDRDTk/J9wSHh85MrET0pCovuesfOMMqbeAMQWpmRES66LWdPQCBi
	odltpcg7Rp+MrMfPDXX0rMIlEBDm2yQfQDGHnEcEWAB4nDGReE8AfoK+s7A3FYMULBaJu+TtYzz
	Q9Si0OLCsLGuCoTUL8/Dh/74O76WK7lhY36/v0yfzOUOxgDIpHgt4O8nnfcj6uQBzUzpmwGWP/4
	ul+P97evnb/1if7oqqskfCoeF9S3OtVpgLhUrPDw20F9Q==
X-Received: by 2002:a17:902:e743:b0:2b4:696b:7bb7 with SMTP id d9443c01a7336-2bd7e8ae070mr184012655ad.15.1779141008547;
        Mon, 18 May 2026 14:50:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe47bdsm164423775ad.44.2026.05.18.14.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:50:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: pc104: Add COMPILE_TEST coverage
Date: Mon, 18 May 2026 14:49:51 -0700
Message-ID: <20260518214951.16526-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37090-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E04155741BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The port-mapped GPIO drivers are hidden on non-x86 builds even when the
architecture provides I/O port access. Several PC/104 GPIO drivers only
depend on generic ISA, regmap, and gpiolib infrastructure, so they can be
built for compile-test coverage.

Allow the port-mapped GPIO menu and the PC/104 GPIO drivers to be selected
under COMPILE_TEST while retaining the existing HAS_IOPORT guard.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 25a6d7af3f5c..c33a10a31861 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -934,7 +934,8 @@ config GPIO_IDT3243X
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86 && HAS_IOPORT # I/O space access
+	depends on X86 || COMPILE_TEST
+	depends on HAS_IOPORT # I/O space access
 
 config GPIO_VX855
 	tristate "VIA VX855/VX875 GPIO"
@@ -963,7 +964,7 @@ config GPIO_I8255
 
 config GPIO_104_DIO_48E
 	tristate "ACCES 104-DIO-48E GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select REGMAP_IRQ
@@ -978,7 +979,7 @@ config GPIO_104_DIO_48E
 
 config GPIO_104_IDIO_16
 	tristate "ACCES 104-IDIO-16 GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select GPIO_IDIO_16
@@ -991,7 +992,7 @@ config GPIO_104_IDIO_16
 
 config GPIO_104_IDI_48
 	tristate "ACCES 104-IDI-48 GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select REGMAP_IRQ
@@ -1016,7 +1017,7 @@ config GPIO_F7188X
 
 config GPIO_GPIO_MM
 	tristate "Diamond Systems GPIO-MM GPIO support"
-	depends on PC104
+	depends on PC104 || COMPILE_TEST
 	select ISA_BUS_API
 	select REGMAP_MMIO
 	select GPIO_I8255
-- 
2.54.0


