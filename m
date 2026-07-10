Return-Path: <linux-gpio+bounces-39860-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BaK8GHBiUWqODgMAu9opvQ
	(envelope-from <linux-gpio+bounces-39860-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 23:21:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC0873EC58
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 23:21:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dOCG7RLq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39860-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39860-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6223010524
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9953B5F48;
	Fri, 10 Jul 2026 21:19:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470653B4EAA;
	Fri, 10 Jul 2026 21:19:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718344; cv=none; b=HA8OXozMaB/Eot9kpM89LGpdaOOk17MBuHRnJf4PDg1hQUM0RehcoabEg/ufG7vnbyHvWq9/2hFRWDccHrS+/eiRrh+TISX/hYJBUJCLWsD+CDnwparg9x1CwfHnmIFFCv4Dppb1GKlWVA24UamYEPnEg1CIkiKGz/C8luXXbjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718344; c=relaxed/simple;
	bh=7VgHi4Y9L2SOPytkfgYbGVWI7YTf+ZUJgXGUavjwtxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hFw0RAde1IZGna2fathb2ALUKDW/NZVSvI/ux0BNFD4stMxlBowtHj1MYviCjMGpTAV7RC9vrpcYs32FNRBCCdLvMHz6Wl8K2AkPtEcX08BpR/0Vp2geEjn4wHRDe6iZqbBspN9fJ7tFVTNzoqDBODwqw6d0XMYKJIiFYp+N7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOCG7RLq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164C71F000E9;
	Fri, 10 Jul 2026 21:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718342;
	bh=c3VGwn/zHIAeMdqewunrMP3NaW3k6iPGymktB8Q2e1Y=;
	h=From:To:Cc:Subject:Date;
	b=dOCG7RLqdxBDJpFQ5a0dgJIwtuYc54B0Gu1NnN1lbQZP0vMIE5HMBBOFOjWervabb
	 jOESP3GnDbyFO6ZJvvQqBnW4dC+tXiOyh+0L1ZRonKmNqa0/wj/SazpsjPf9PtBLEt
	 vk9U914wL0pILPT5laaWTxLrEm/9pF3sbOw8oLfes6SjnmI19m+jYA3Qu2uBzCvN5g
	 OYyAPHiC6HuCcduXwTc7F0cTgabE2Eu81aWToW7uhZpAxcT0VMzor6x8kOeKxeMTj/
	 V4GMwaFX0cwOLzbzCGwJD/+jsWsaVRALaz9xs7Zxqf0PmGr3ewN0O2FryIfH9dZStv
	 EITiBv6miuwGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 0/6] gpiolib: fence off legacy interfaces
Date: Fri, 10 Jul 2026 23:18:48 +0200
Message-Id: <20260710211854.1371746-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39860-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:glaubitz@physik.fu-berlin.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFC0873EC58

From: Arnd Bergmann <arnd@arndb.de>

This is the remainder of the series previously posted in [1] and [2].

I only made one trivial chance suggested by Andy Shevchenko and
reordered the series to have the input patches first.

Dmitry Torokhov asked about having an immutable branch, so I would
suggest sharing the two input patches between the mfd and gpio
trees, and everything else go through the gpio tree only.

     Arnd

[1] https://lore.kernel.org/all/20260520183815.2510387-1-arnd@kernel.org/
[2] https://lore.kernel.org/all/20260629130329.1291953-1-arnd@kernel.org/

Arnd Bergmann (6):
  [v6] Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
  [v6] Input: gpio-keys: make legacy gpiolib optional
  [v6] leds: gpio: make legacy gpiolib interface optional
  [v6] sh: select legacy gpiolib interface
  [v6] x86/olpc: select GPIOLIB_LEGACY
  [v6] gpiolib: turn off legacy interface by default

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
 drivers/input/misc/soc_button_array.c     |  1 -
 drivers/leds/leds-gpio.c                  | 52 +++++++++++++++--------
 drivers/mfd/rohm-bd71828.c                |  1 -
 drivers/mfd/rohm-bd718x7.c                |  1 -
 include/linux/gpio_keys.h                 |  2 +
 include/linux/leds.h                      |  2 +
 sound/pci/Kconfig                         |  1 +
 sound/pci/cs5535audio/cs5535audio_olpc.c  |  2 +-
 18 files changed, 75 insertions(+), 28 deletions(-)

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

