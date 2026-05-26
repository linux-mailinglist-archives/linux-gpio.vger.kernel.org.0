Return-Path: <linux-gpio+bounces-37517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NKEHZx8FWpEVwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:57:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0215D47C0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C6E305045B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DBB3DDDBD;
	Tue, 26 May 2026 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf7NuEhl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861FC3DD856
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792759; cv=none; b=ADzFQwmwMVlOelIjn0ap6WfCAIBcfsJp/WttsYIab4q2vlA9GIk0Ex/YIu8O+GvQIWX9lC0seBoZ4/5FbYxTo7FbiMemLyejiM5/6Y6ltM6Vg8FX4q/vFkHkdvP0gQpgNzm9n729v/wjR6M27Z8exkVRfKUhBz7vlBE+uKOuOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792759; c=relaxed/simple;
	bh=O7YRMU/gIB39/PH7Oe5t1hwEMJjKDCiXGwnEh4pxdoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kam9rK+H8WdxinChBt8YdOrvq0FUBkQ+ZS3wSkfwoH78LRDOyTQaObZCHrqRAhM4qMi5czZJfPyId0oMq1TAbz6R36I8MwaSccEiugibrsTC2igxuR0XD4shgOadaFKtaf6CbKf/h0rtYVx4/Kg3HUzoyhq5hOAWjK2NWtMcxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf7NuEhl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835b78c3797so4496693b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779792758; x=1780397558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LywgSOMGFzG9gHBF5SWAjzmzCpEAv3XPtUpcuKzvSZg=;
        b=Yf7NuEhlI56tFH6eyzxacU50i0rapxOL2hXkL8I7gp/+OkQXJPhTppE7n4yQlrFsde
         mbCrmLZ7ZTKeWcoKRmFnKsQq0Tnv+V7FCRGVmXhosvnPhy1kkjvl6dODwGj3BCo94Z3J
         aobUzMIOtzezPFtT5433aE/IcgOwnjfMIhL6eXhFfgEe6thqXNI+pCUA+e7pIQiRSIvK
         NGXYGFAXldV0SnTYG0ooPM0W6eHxXkzhUtpKMaFMvGjmAS8pc1FIl7oJUAzUdF1S/sNv
         vCYc2wz4vowfDzYWTXVuyYrP8mJiv3tsvilyo3b9irMgXe6s5/YTKTiSC9ksKLLNqz6v
         K1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792758; x=1780397558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LywgSOMGFzG9gHBF5SWAjzmzCpEAv3XPtUpcuKzvSZg=;
        b=n9wbjwjixbFI7VDVBJ7kFHbFclgJjMCkxaNBL+HyHWGlnFxN0k7cNMwoeFx+voKVos
         q/Ia5htfGnxxX2UaltMtHb60AmpxERyJElQJwaxkacBY8ITXImCtXz5kWWKpG3DYHwJA
         rVJqXbA+y2H0N9Ccal4uEkpmN5xJ5YV0FHLo7lVLcmzGpEm6frbCock3H4EJ2AtU00T9
         19719+vTDxUgZ5XIph/NpyNFLJgkJM4cpI/juviumsCcYtBfnVbw09KsrD49saHvQRk2
         sdlE9Lh9vHfnJ3e568M9oqphGPs1DaMb9XMp4OaqupAIzNxavXPVnDQ69gYYvCDHvs5v
         YAXA==
X-Gm-Message-State: AOJu0YxaF0Q5/FPN02aZDZf8Em8Gz22v1jwyDTfd8vVEpNNyGWaXccqt
	5zh7m2yDGqtFqPbrVn3reXaHbSiBGHjZfPzpLIMDsINa94fhsJe/eDe2
X-Gm-Gg: Acq92OHfTzJl77wQzt5VnFQap9uvHM8C3xUXwlEOniLZtwEvhUwKTfq2iVPXHCX+mGC
	b/1JAQLaWQVK3P9a/HUto018avoNgEYYe9kuB191EOA/nByuAOQXurzPZZeoS8oGu6s9C/nyo4g
	hWYzHfAtRiLFDQLiSwtGIEDVESMPgO5lGDtNjkGikw8pzfWOH0Xc+SLIOCkwQXYc3lb8le3VbFl
	G8ZN9gQC2q8AS1yl92/6kZiYA48V/lad10o75ilvcdOPIP7yI3/doKGJ4qYEdVAM7l0yjWq+XST
	8DiUBVqONU+ayMbFZdkB1ePHvOv+StbQa6VpaAdOVYnOZMzSQGr9EP6csB57AkZwkwDlX0drAWW
	bG90grI8QH5Fy/CceSaq3D9ra0R+jPehCK9IwGOG31/WQlpldjQ/sQXEjaMNs0sv4CCyxlZm+ky
	jSeW7wiqWWQl2cJtHpfGFkFtJW5TrPUxtjYHTxVuD0qg4VzQQDLh1jWEhs6BrjS++WMPVEjjhBe
	NFVzaf0nyCsEsH7wKW83jGsEG4Wqs6TnfaeVkM5R+UUOPOvkFUbsV7TeLuWg6OQYn9emNfJteLv
	hcS04CLVAeMMCd1yb3mkaTo=
X-Received: by 2002:a05:6a00:a90c:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-8415f3a3cd6mr16705784b3a.43.1779792757864;
        Tue, 26 May 2026 03:52:37 -0700 (PDT)
Received: from hardik-yoga.oryx-cobra.ts.net ([2401:4900:1c23:6e83:739b:c8ff:8cea:29c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm12053271b3a.43.2026.05.26.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:52:37 -0700 (PDT)
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
Subject: [PATCH v7 0/1] i2c: designware: defer probe if child GpioInt controllers are not bound
Date: Tue, 26 May 2026 16:22:09 +0530
Message-ID: <20260526105213.85833-1-hardikprakash.official@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37517-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: DA0215D47C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
tree, but testing confirms it is not needed with this approach — v7
alone is sufficient. Linus Walleij may wish to drop patch 1.

The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
completes. Dynamic debug tracing confirmed the race:

  0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
  0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
  0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
  2.348157  lost arbitration

This patch adds a generic check that walks ACPI child devices, finds
any GpioInt resources, and defers probe if the referenced GPIO
controllers are not yet fully bound. No DMI matching required.

Tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel 7.1.0-rc1+.
Touch and stylus fully functional with v7 alone (without patch 1).

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
 - Rebase onto Linus Walleij's tree (patch 1 already there)
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

Hardik Prakash (1):
  i2c: designware: defer probe if child GpioInt controllers are not
    bound

 drivers/i2c/busses/i2c-designware-platdrv.c | 156 ++++++++++++++++++++
 1 file changed, 156 insertions(+)

base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945

