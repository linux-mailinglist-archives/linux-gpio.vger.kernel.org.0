Return-Path: <linux-gpio+bounces-37409-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGI8DK/nEWpFrwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37409-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:45:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A095C017D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 19:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452393014BC8
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 17:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9CE351C1E;
	Sat, 23 May 2026 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE4U5fiI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD371345757
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779558316; cv=none; b=g4ESj3YIpQhjzr2+L+pf/zwPMgNup7Ch58/bfrq/nhci/i15PzgQW/+We0l4h1OwS+5TzL2a9JSVFwdZpp7g7a7jr8B51ENZYRyCOIirXFV8W7KcxiEB5MTwd7cFDpaAOPAYowWtIpnN+8Tx6t4YIjhDnzOfwVpw1IsKmfEebhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779558316; c=relaxed/simple;
	bh=3uCSAZaEKJhqIoMxLF0gKtRAOr7hPsxZqRHiu+Vplzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dz1hE/qQ9/06o605+ulr2hGLQfj3w3eLEFV1071n4SLoywMQxv4sXwq0ZLpTv/+tBoq8QZS4yVxQGolFZpruJU8NocQi4ZGqaJafiYAPsu7BeJpKbG//RlbkQdf2jpPdmNKVsUh9XzzRRhnhYhmiwWEWxP8nR/dTX0qN6g1Jdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE4U5fiI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36974220e45so3631996a91.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779558314; x=1780163114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KB9h+7r26Q66tvDFJQbtSLggffDcPzif2omnbHE6cS8=;
        b=YE4U5fiIIMM9oO1ubVPDNs2mbmMrfbUrOyeKVJN6bcE2bYQxBjfqT0pFaH07+cd1Na
         98sctN2Fly+0mR0PbychWOI7jVV3SJmIBVL3l46wdisTxy52v9qY5G3yYVOtFHZuvvyf
         7Yy96pyXj5/BaJeCMtuKRFVzBxfB13ikdFLCTP+z+/vmufkhzebSNF8IPhil0Yky+VPE
         xE/37qbWBGs8EITj8mWpVFASZIvbpxfNsqltU7R0ACe8Qn57NFEA4KldwGYvtYSmhSwq
         18iuayi77sAcWc+75wBSOMD2ixXPPAmw8AzLXVPhXXEX0gsKHRFgX1CrT1cttgyU4tTb
         hjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779558314; x=1780163114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KB9h+7r26Q66tvDFJQbtSLggffDcPzif2omnbHE6cS8=;
        b=spb2Bo6zutIboOy0+yP/QJbQhCm19vYGGCmF7DAyAO6RU7afbjS74V+LasfQSZcyJd
         2wlfNcwR0kE19cpx5OLvjOiQCTRLyw558mGy5PvrYF/JMtp5FdMKWHPZbuxC4nRu4/44
         5h3K4zbJMmjQqP0niarhY4M5pyVg9OfvL8N0+uW8v8iLUkmqa14c6a7QZf/hSKtqsmzC
         GwYtKvEjG2Ii8hWpuzn7AJjgRTXotpabFvkq9hI8T/3QZtSO8BTp0YV/o7EL+jKVBWTc
         1YZ5+rSEPejIKCrzL/ErvlSngAKky2+7AKSDke2N7RU/aBhnv2Lz1GXgA7fbndbq16BP
         Q7xg==
X-Gm-Message-State: AOJu0YxrSj63VnmbBqRUufLHjogo9Zvw+d5eBQBed0nj4Azqukbmk+8C
	DMFPgrymep8b1KIpbP1vffxDTwk/ckr1ZoOcWaxaj/KX6K7Uynxd3vg8
X-Gm-Gg: Acq92OElZOVp73XJzYBMyp6EEweiPG4+wMDgmjYQ4udfmPK8/NjiD8Z+wteMteZ5q6V
	tiLdPsqYlNYFhqT0IKrniqMnrinmzz2HG71Hp+JkTm+H9d0CPZb51ylClSD6QLPs9Q9/bioR7Uc
	iDqQgD00nEjsF5yWFsuprJyvdumo+tspHekANWjnDw4PKzmq81WsOQkUNjYZDBiWH78ZEqo/cDe
	drtKvxddp8HmBEXsOKc+sz4iO4gkxnW7VEW97KuYUxIUEmjo02Xe+PVZdsdSUdFH7Eb1GA9yzmR
	0g5t1U5+93nzwWppGi273e2yCoeaeTkovuSQpzgWYPgoEgsM4PozkhlPa/g6JH9JM4Tp2OTf1D1
	+ovgv+l+waqB2XZ582PhV2GMzl40Fd9S6DCA/MGpCz2hJndUx181EJuBMsdMAD8piUXejIgUo+1
	uqXYMOJ7XkaCt4UiwU2xzhqDVQ0OfPiYE6cvL5sDxj9uiOMA0SvQEQB1hUiuxiVV6r0xxakmFvL
	eqnolY0Hj7guO/pwP5TjaWw5gdrIAVOuCdUMBjaVVrtrDe4P/3oIadWOvyg2mVCpnrUoH1C2D62
	m/O0Nv6DTKnM
X-Received: by 2002:a17:90b:35c9:b0:369:74b3:a103 with SMTP id 98e67ed59e1d1-36a476ec35amr9987666a91.8.1779558313595;
        Sat, 23 May 2026 10:45:13 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c23:1260:c040:19f4:9706:1050])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71dbc38fsm5127139a91.5.2026.05.23.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:45:13 -0700 (PDT)
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
Subject: [PATCH v6 0/1] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Sat, 23 May 2026 23:14:39 +0530
Message-ID: <20260523174440.9629-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37409-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 80A095C017D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
tree. This replaces patch 2 with a generic solution suggested by
Mario Limonciello.

The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
completes. Dynamic debug tracing confirmed the race:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Previous attempts to fix this via initcall promotion (subsys_initcall,
fs_initcall, arch_initcall) all failed because the race is not about
when the driver registers but about when probe completes. The GPIO chip
becomes visible to the system via gpiochip_add_data() before
amd_gpio_probe() finishes, and i2c-designware probes AMDI0010:02 in
that window.

This patch adds a generic check that walks ACPI child devices, finds
any GpioInt resources, and defers probe if the referenced GPIO
controllers are not yet fully bound. No DMI matching required.

v6:
 - Replace DMI-specific deferral with generic GpioInt dependency check
   walking ACPI child devices (suggested by Mario Limonciello)

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
 - CC AMD engineers (Andy Shevchenko)

v2:
 - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev()
 - Use device_is_bound() under device_lock() with explanatory comments
 - Add Assisted-by tags per coding-assistants.rst

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454

Hardik Prakash (1):
  i2c: designware: defer probe if child GpioInt controllers are not
    bound

 drivers/i2c/busses/i2c-designware-platdrv.c | 157 ++++++++++++++++++++
 1 file changed, 157 insertions(+)

base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945

