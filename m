Return-Path: <linux-gpio+bounces-37670-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM28I7lmGWrZwAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37670-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E690B60089F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B73EB3067154
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F907352014;
	Fri, 29 May 2026 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4calMsD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5095351C3B
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049342; cv=none; b=GEetAHJWbgbL0XLF3IMYksFyVI6Z/vGBB5ye19EreXLaR1dCRXJ/d72nHwAHN2vmNEZS2JURn7qGxifPeip+HNNqTB9QQCFPfCLJ7StaU3WrYfHdBcMVRX86VVjvVA1Jf0EkS9LFn7QPPxWnG3BKrgd/IVPvieTh3uE67qhdTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049342; c=relaxed/simple;
	bh=Yz4wKUO7mRoNaZIugtu9UsGT2PX6SXaZekLqVb3l5ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YaNyr69umTHLkh+cRtDFWX6K2DyfOh1rh0mf+27GQQoNeRs2ygrWKkHO7GnGl4WRxflOwOn/7CXGvZETgHKJx+BedBSsnXTYJNEDRXpfaaPXaDm6ek2PI7cRS9f1UXiL/nub5ENL2nQ+ZoxFWTukF3TfNTous1lLXJZz1FAA+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4calMsD; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so143045935ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049341; x=1780654141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8hXh27TAg8GvayKzSm4qP6Yj601eapfE8Ty44/peic=;
        b=W4calMsDFc7B+ziecRpLGRxJHvowzifbv+xIemf4X+TyFCJZi/MXTXs1HJwfRm465A
         QXKEc4AZCygkXppVPv4ArC9Gqs9asnKCpxLzIh7kARf0c9vZEhrzB59Fbb6ZYPusaX5d
         4Ln5LZ5icHuvyWsEH/O4YXR7dOsf7Ya++WM9r88ZhpfvdUfFWTdCseH/37kF7ZAyR46K
         DPq1Mj5+BcBuG5V5UE1k2uw92KFX+HJvxHJgnTzyBVcMItizmrFvQx5EUOe0ZXJZ9fM3
         hak/Qq0+10jpSgo+lGNhCk1e42XU0ZyNTdhhJfgi37FiWdkxpaSY58sBebLpbq0nYjDZ
         X7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049341; x=1780654141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8hXh27TAg8GvayKzSm4qP6Yj601eapfE8Ty44/peic=;
        b=jPazD2gUkcplaUwzmAtqzIx64g0l8TLB6uN1U63QTxJ5Afbz66oZgN/gSZLHTTk5Gj
         m+bDz4pMDSR+9WOyPutuQ/ONgFQqPgDmwrAfMgz+VsZ524lR0Nk6d3Vy92s5ArlDy1DT
         tscq70/Bv2OAVbMEjoLxeMNuznEt/BA2Q9d9sd2O4MtogXbDiRg6oubLsGlZ48eiffoo
         +qKWUt0sz0mOl0nYznU7jiytmliKEXuNNHNX7FUbeKpTGHXPAY619TRShaD8bImjQEJt
         o+WQ8vKLmyC2xH0duO7j1bGlO7fvzu5puF/ctFBdMA0hsEPrxDZ2e3WwexHycVPSvp0h
         TSdw==
X-Gm-Message-State: AOJu0YzsJlI1po0kKnxve2vZgNevso1psTkvIJliRDJLwnkOQ7W+ebni
	Uqw8PDgrNimTgUt3sZJm2KE6HA1R/u6tpZLis1o0V/0lnVkCddZF8fPP
X-Gm-Gg: Acq92OHDDR450yy0XsAhR3qquz43nnaCEqiJ4jgwOm1EfvVtQgRfF5HgIgZjytI6o7e
	uHgKxKcMQPqepXsZuqpt45ns+5kMEDvQLaShnqvMZ/wmJ8PKyoUtJKrquNUqi8HfWL4KGdq4+c9
	7lPsaz1n1jiYhtPQRNIVJYqs9fHScZ56/M9kj6GaLp+8KD90jOqD+dud2H8g1qmVqSNwMcttPaG
	VzXuRY+wN/Ov/Gm+wLRnvipLtMhZXuNHBhnuio6SMqBppOSZYqtyjd6mFYvOIGIUO2aGROLFUMO
	I8xEyzkEoo75UCnzAkErdqlw1uR26FhoHLSS1qn4M4mGpghvRDcxgLAMx6aPjbJsf4gs7VntQNr
	jtusK6KgAuNJlk+O5p+VcuZ2VRq3bn2FxwxCogmM5781CatlDBzeWVpC5YKVWvJHEI88eczzYjy
	wkdsr1O4Ak6uW3rqf43bUwz/q8PU4Q6rOtOsBhWhJFfAFDQ1fsLB/L7EkOJ5AZT4Hf6r6sS8kqy
	NbQq/2JeEDT+oP6Hv/FQXhxySrb37GplgJoG0NGDKlKbxfyoNBbvvx4WFt9QXcrr67YL+pVMb8D
	MUsidpbWByoEryX+l2UpOSY=
X-Received: by 2002:a17:902:ce87:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2bf281f1c27mr12163095ad.24.1780049340822;
        Fri, 29 May 2026 03:09:00 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c22:2195:3f68:8568:1e68:2087])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0122asm16051225ad.46.2026.05.29.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:09:00 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linusw@kernel.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v8 0/2] i2c: designware: fix WACF2200 touchscreen probe ordering
Date: Fri, 29 May 2026 15:38:35 +0530
Message-ID: <20260529100838.8896-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37670-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E690B60089F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes the non-functional WACF2200 touchscreen on Lenovo
Yoga 7 14AGP11 by:

1. Reverting the earlier DMI-specific GPIO IRQ quirk (patch 1 of the
   original series, already in Torvalds' tree) which is no longer
   needed.

2. Adding a generic probe deferral in i2c-designware that walks ACPI
   child devices, finds GpioInt resources, and defers probe until the
   referenced GPIO controllers are fully bound.

Testing confirms patch 2 alone is sufficient — the existing
amd_gpio_irq_enable() flow works correctly once probe ordering is
fixed, making the manual IRQ restoration in the reverted patch
unnecessary.

The probe ordering race was confirmed via dynamic debug tracing:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

Tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel 7.1.0-rc5+.

v8:
 - Add revert of now-unnecessary patch 1 (Mario Limonciello)
 - Collect Acked-by (Bartosz Golaszewski) and Reviewed-by (Mario Limonciello)

v7:
 - Fix unused 'ret' variable in check_child_gpioint() (kernel test robot)
 - Replace BugLink: with Link: (Bartosz Golaszewski)
 - Add Reported-by and Closes tags for kernel test robot warning

v6:
 - Replace DMI-specific deferral with generic GpioInt dependency check
   walking ACPI child devices (suggested by Mario Limonciello)

v5:
 - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
 - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)

v4:
 - Rebase onto Linus Walleij's tree
 - Use --base so series is correctly 1/1 (Andy Shevchenko)

v3:
 - Fix variable declaration style (Andy Shevchenko)
 - Add BugLink tag (Andy Shevchenko)
 - CC AMD engineers (Andy Shevchenko)

v2:
 - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev()
 - Use device_is_bound() under device_lock() with explanatory comments
 - Add Assisted-by tags per coding-assistants.rst

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454

Hardik Prakash (2):
  Revert "pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo
    Yoga 7 14AGP11"
  i2c: designware: defer probe if child GpioInt controllers are not
    bound

 drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.c               |  35 -----
 2 files changed, 156 insertions(+), 35 deletions(-)

base-commit: 8fde5d1d47f6

