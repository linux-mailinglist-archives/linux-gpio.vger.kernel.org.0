Return-Path: <linux-gpio+bounces-39115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qlqhBr1wQmoz7QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:18:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8A6DB0B0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:18:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hC4kKBSl;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39115-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39115-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 208A43018CFA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C89407CFC;
	Mon, 29 Jun 2026 13:03:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B6407CF0;
	Mon, 29 Jun 2026 13:03:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738226; cv=none; b=fojrWM70eEMp+1CEUGUfJh3i19coqrjgZRzYEAU74WMvqpJpkgkXhGweweoD5naa+aghVENNOerwnIChKX5vcHKzg5M1oUme/m5IYKxJYWc/dWV0ECjHyVIrWzVT/H4HmGk5y1oKwcL4DMh9QmhIHHmlr10ETScxk1kwxAHtBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738226; c=relaxed/simple;
	bh=ZXxYYKWc/jGxfk2Nytyp7ioT+GGF5iEplxY6FAnMyNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ruGrJ7etg49CfDcV4qKIZwumoyKDlAboeVdXi/dkaN5ccMooda7gdOMLujna5wsh4EFjTAjDllrUwucMyBuUyv0t8YPJBNMRo8I3NMCAlv8zKEfjPJhfTQjAwCJLhbuHSnltJ2LFsG7CVlvXjQXytFjXh+ZlNlySXjs58FgQLO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC4kKBSl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D3E1F00A3D;
	Mon, 29 Jun 2026 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738225;
	bh=1jg1rQAK89ERmpcHGqenOSdalDO5zb8XIpGNN1kpzuo=;
	h=From:To:Cc:Subject:Date;
	b=hC4kKBSlI1YC3aYkWyb12M65wJhVTyQjHINpXLna7nBIHIzQXslOpalidGl0nU9F9
	 sKZBdHiIsT04xXPsPor0JvuYwebZMvQQT8VQQpLHBv6/Bh8LNMsCwvDvrF8KfyvWKr
	 v8Dc/ynpn7KS92OwuJZo8X6AnaCBV3GQW6XcoKwLhCBoEwdYy9ndAO0sLc5dh1rmsB
	 L3K2uf+lsmGnNS79iddvPtEWAvNxrHN+KsZMLDkmK9MU0hHquZ4qICWKj3EwMf6mky
	 SPgKLz+YGudrwoWXgOq0xzM/sZG6/TjjozaWd69NFMZCJE3eX9Rr/7FhRiwUp3KQJS
	 oilFtAu8wI0YQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 0/6] gpiolib: fence off legacy interfaces
Date: Mon, 29 Jun 2026 15:03:23 +0200
Message-Id: <20260629130329.1291953-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39115-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,physik.fu-berlin.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,zytor.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DD8A6DB0B0

From: Arnd Bergmann <arnd@arndb.de>

This is the remainder of the series previously posted as v2
in [1]. I've changed the version to v5 for all patches to
not confuse b4 too much, but the patches are mostly unchanged.

The patch "Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY"
was not part of the series last time, but the build bots reported
this as a regression since I had dropped that since v1.

I hope that all that remains now can just get merged through the
gpio tree. The gpio-keys patch needs a bit coordination with
another patch addressing the same issue that is already in
flight, so I expect that I'll rebase my series once more when
that is in a stable branch, but the state I have here should
just work as-is on top of v7.2-rc1.

     Arnd

[1] https://lore.kernel.org/all/20260520183815.2510387-1-arnd@kernel.org/

Arnd Bergmann (6):
  [v5] sh: select legacy gpiolib interface
  [v5] x86/olpc: select GPIOLIB_LEGACY
  [v5] Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
  [v5] Input: gpio-keys: make legacy gpiolib optional
  [v5] leds: gpio: make legacy gpiolib interface optional
  [v5] gpiolib: turn off legacy interface by default

 arch/sh/Kconfig                           |  1 +
 arch/sh/boards/Kconfig                    |  8 ++++
 arch/sh/boards/mach-highlander/Kconfig    |  1 +
 arch/sh/boards/mach-rsk/Kconfig           |  3 ++
 arch/x86/Kconfig                          |  1 +
 arch/x86/platform/olpc/olpc-xo1-sci.c     |  2 +-
 drivers/gpio/Kconfig                      |  9 +++-
 drivers/input/keyboard/gpio_keys.c        |  9 ++--
 drivers/input/keyboard/gpio_keys_polled.c |  4 +-
 drivers/input/misc/Kconfig                |  3 ++
 drivers/input/misc/soc_button_array.c     |  2 +-
 drivers/leds/leds-gpio.c                  | 53 +++++++++++++++--------
 drivers/mfd/rohm-bd71828.c                |  1 -
 drivers/mfd/rohm-bd718x7.c                |  1 -
 include/linux/gpio_keys.h                 |  2 +
 include/linux/leds.h                      |  2 +
 sound/pci/Kconfig                         |  1 +
 sound/pci/cs5535audio/cs5535audio_olpc.c  |  2 +-
 18 files changed, 76 insertions(+), 29 deletions(-)

-- 
2.39.5

Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-sh@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-leds@vger.kernel.org

