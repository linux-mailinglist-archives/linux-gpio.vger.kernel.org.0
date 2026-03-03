Return-Path: <linux-gpio+bounces-32432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPYNAJoTp2ncdQAAu9opvQ
	(envelope-from <linux-gpio+bounces-32432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 18:00:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C01F4443
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 18:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 968D2302299E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 17:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDC74DA55D;
	Tue,  3 Mar 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+AXG+AO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08463C6A52;
	Tue,  3 Mar 2026 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557197; cv=none; b=WREkjqqcbXB7liWlX2FCZYWamhz7Yk2n3LPGPH8F0gD2Lxc1yx2kfBMJJKjWD7PgRuvYdrEFq8UDVTswCgDlf1A2CpiAM86d2qjpv38f+IigIUqnH1i0ryzmWM4qNJmCBv6sv7mDoeodyBmNAJd3aHN2gxtbnaa9inopbuHfK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557197; c=relaxed/simple;
	bh=mgwUhCncYhDl61XAwXlMI23b+H6nVEk5nE7YqMPl7/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WrqbgfwgT/8GMCFyjVw3pvPi+BM37bAFYC7fmW1p85dXUCrZdl50iz46EN2Uin5K6W+PpvDpMmyETr/NXlCL3XEiDZR4bNlWZ27McodJmCD+7uv4CeehoBgM9itjdZIE+sCseuNPheslhzj0QAlkHGoxrp5IEZiWITvgVdNDfCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+AXG+AO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A434C116C6;
	Tue,  3 Mar 2026 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557197;
	bh=mgwUhCncYhDl61XAwXlMI23b+H6nVEk5nE7YqMPl7/4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=L+AXG+AOypu1+2+mVs1pOvJWkKKAlYjCNLOWqw0VNC51YgJnnOQIY3aO5/toAKmFa
	 ii/nt5Bp67wYf0V4UXKrRRWF+DUtoMNkJ2ATZxjVn7R2IAkCK07dbui+Yl5ZhDX6RP
	 D5w7hZZsiiuomAW64PgC91lhe+2iJUz9oqYFFjbOIyTII7fWQ8rmgY+Z6ivQMK7Mcu
	 J6HkqO14hb3K7mIYOoJHfJjuWhTJa0+9YlcIBsa0dT0cGy7ZmPioqZbpnfG0t5hn6Z
	 YNXS/yzCN2eFaM28+7ZDjY2T9vopEiIBxiXKTo6MlfySoGCBzsfTgUtoh5ETIcuMyl
	 s06DeI4og5NGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6A4EDA697;
	Tue,  3 Mar 2026 16:59:57 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v6 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Tue, 03 Mar 2026 17:00:39 +0000
Message-Id: <20260303-ltc4283-support-v6-0-efe11502fad2@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBNEzaSrRAuxqQbCZKwIwrsnL
 d/i/xcyMmGGoXmB8aZMR6ywbQNh83FFQXM1KKms1FKL/QxGOS3yldLBp5BWL73zIXTeQK0S40L
 PfxynUj660kVMYQAAAA==
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772557240; l=1962;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=mgwUhCncYhDl61XAwXlMI23b+H6nVEk5nE7YqMPl7/4=;
 b=5QEy1itU4Qq/SbblS24Kt7rPX/4f94eo9Z8Iwj5JbfsH6EGvRk7Shvd0OCxCOFe/D3IM3xtXg
 jyAOnii5XYlD114Ja5BrgGvlFYESNG2je0ZO2v0RyNDX/Qu+WS3rWbG
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: 4D0C01F4443
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32432-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,analog.com:replyto,analog.com:mid]
X-Rspamd-Action: no action

This is v6 for the LTC4283 how swap controller. Main change is that I'm
now using the auxiliary bus for adding the GPIO device (done depending
on FW properties).

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

---
Changes in v6:
- Patch 2:
  * Rework regmap to use single regmap with custom regmap_bus
    (lm75-style);
  * Add explicit i2c func checks;
  * Make sure page support is enabled for energy reads;
  * Fix MODULE_DESCRIPTION: "How Swap" -> "Hot Swap";
  * Remove #include <linux/hwmon-sysfs.h> (unused);
  * Fix commit message: "How Swap Controller" -> "Hot Swap Controller";
  * Fix "Addresses scanned" section in docs (no .detect() supported).

- Patch 3:
  * Fix typo: LTC42823_ADIO_CONFIG -> LTC4283_ADIO_CONFIG.
 
- Link to v5: https://lore.kernel.org/linux-hwmon/20251223-ltc4283-support-v5-0-1152bff59a61@analog.com/

---

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  265 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1780 ++++++++++++++++++++
 10 files changed, 2574 insertions(+)
---
base-commit: 78558965440b27814592ec82d8f3668395953b1b
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



