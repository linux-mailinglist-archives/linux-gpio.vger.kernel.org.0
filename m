Return-Path: <linux-gpio+bounces-35843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEH6JtgY82llxAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:54:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D4949F7EE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 10:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E238B302AE05
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 08:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F133FF89F;
	Thu, 30 Apr 2026 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UmWrdU/U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B234A773;
	Thu, 30 Apr 2026 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539072; cv=none; b=V2XiMnk32GEfg+2rceG/KUfeG5WhEPCxMh5TmtN/ZM+t5pS8lDGYlAjsS54IpG40p9izu5s+nTHwcUHtMGsQ4f5ZvXAG1Lh8McfQX2c8K0ouNB4I1O6nKnlE44SGu0WaktY35/pt7+rvoHPU3qWUiuJOTOh9AWElcLN6RCsIkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539072; c=relaxed/simple;
	bh=X1hORcvEfGXH+JxOkAabXjsJ0RPQOd7wDQ4R+LR8WXM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W4wdTjJhT/FToX/9wh6meNLzNIGOB7OomeCpGlzyr7tbGa+1sofLwtLJ11sl0KTXTHBKeQfiUh2nAS4GdBvmhHFeHvfRBqdaM44LNc2aX11edOzzhELwQQnKOzz6E77AyjdsSzmfZ+wzbpPawr+2z9MMCZjHKTJJ2syToMTTYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UmWrdU/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5B77C2BCC4;
	Thu, 30 Apr 2026 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777539071;
	bh=X1hORcvEfGXH+JxOkAabXjsJ0RPQOd7wDQ4R+LR8WXM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UmWrdU/UkJfgXHqfyU6azjXocasXmBkZ0l2Nzol5raKTCjocz8EAi/2V44ZS4jL4U
	 5FiAykYLcEceAuKqwwCRIyawI4CFTcHeJFmmx3EjhrTVO1R/HVpqnopYGRhRN5bSei
	 MFDCNJANowKkDhgSvJ5N4IZmIih2bNAii9ywp4AsfqH6n4021mzQQTDDDGUhaUSkR6
	 SEJIQWK741spXcK+QCZ2G8I8v6kqEZgpiCk5Tn3lxGNik7tSXw3yKT3uia8/0DEQ61
	 rWSBG6goBHnW1hWJwolekBK7Sr1Ikk3JaNzglr/N9TRd4v3xKbDQSQg4f6cVjIS0Jp
	 jmjBibI8YYDag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35B3FF886F;
	Thu, 30 Apr 2026 08:51:11 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v12 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Thu, 30 Apr 2026 09:52:02 +0100
Message-Id: <20260430-ltc4283-support-v12-0-5dc9901f2567@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XO3U7EIBAF4FfZcC2GGegAXvkexgvkZ5dkbRuoj
 WbTd5fujTXo5TnJfGdurMaSY2VPpxsrcc01T2MLgA8n5i9uPEeeQysYCiQhheTXxSs0ktePeZ7
 KwgXJpI3zfnCKtau5xJQ/7+TLa8uXXJepfN0XVtrb/62VuOAxRYBBYHIBn93ortP50U/vbMdWc
 wBQ94BpgNIQIg5D0Gg6wP4ASlAP2Aa8EfnktbJI0AEgDgKaXgCx/5CQkiJlwcuegCNh/yCgEai
 9D5HABhd+Edu2fQNhQFX8uAEAAA==
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777539125; l=2204;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=X1hORcvEfGXH+JxOkAabXjsJ0RPQOd7wDQ4R+LR8WXM=;
 b=meKXRoX3OHpHON0TjTUrShcmctKrv2zBkfnhG2M4tPMLJusAzu/d3JQgqf73dHS1QCyvYDaBC
 CMq/LgDUCzeAXLc3A//ILHI1RW7PwgokdZ3lZsTCZ5IvAIgbzWiDTdw
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: F0D4949F7EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35843-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:replyto,analog.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]

This is v8 for the LTC4283 how swap controller. 

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

Guenter, for my last email worrying about rsense low values, this is
what I got internally:

"10uOhm at the smallest sense voltage of 15mV would be 1500A and 72kW, which
seems a tad excessive. The highest currents I’ve seen are around 200A, and
the -48V market 4283 serves is generally a lot lower than that. Normal values
are around 200uOhm.  I’d say the resolution should be around 1uohm and if a
minimum is needed, 50uOhm is probably safe."

For the resolution, I'm pretty sure I got the tenths of micro
resolution for ltc4282 so I just kept it in here. So, if you don't mind
I would prefer to keep it this way to be safer and changing that now would
require me to change some formulas and I would prefer not to do that at
this stage.

---
Changes in v12:
- Patch 2:
  * Add missing in0_reset_history in docs;
  * Make sure to pass st->gpio_mask in __devm_auxiliary_device_create().
- Link to v11: https://patch.msgid.link/20260429-ltc4283-support-v11-0-27ccde619dad@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  267 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1795 ++++++++++++++++++++
 10 files changed, 2591 insertions(+)
---
base-commit: 992920ad25f27f41521c1bb905d0e1062ecb9e93
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



