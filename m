Return-Path: <linux-gpio+bounces-35977-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /u5QKDzK9WkwPAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35977-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 11:56:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F674B1970
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 11:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 400E3301051A
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2026 09:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2FE30FF2A;
	Sat,  2 May 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1pPyeGY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927121ADA4;
	Sat,  2 May 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715764; cv=none; b=GqvOFBwbHZc0VyiqWt1/R7IS2g6UhAEdJ691BVaBvTW5xUmEdUjPJnx6DjhdKRDDmoJ+ozOG8/gXu9OxugfbUOPe0PSZip/xRCZ9aqWRlJ884ElYWWO02OPldlJZV5DFufTW6/iC+ckgb5YSu7MK5o6GQU66aqjVppNWe1/xejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715764; c=relaxed/simple;
	bh=1qCobfoCEucgrjRGXrCQ3vKcmNt1JqyTqC3CN//BeTg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i7SJxOYgNGqnkerbXCKwC+WG+AOtT9/codxCzlII8f2VV30CdNOUnNnpEmxR03+bHIaTCZ5v5jjjw5zKzmJBq1dmqJtxUsi/VBCtqxzRvaPwZRTpoTKFhyilXf+x6bASnsQwPTV7CLyZSRxA4kkQY6zE5uwhrShN9IndD2amSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1pPyeGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E823DC19425;
	Sat,  2 May 2026 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777715764;
	bh=1qCobfoCEucgrjRGXrCQ3vKcmNt1JqyTqC3CN//BeTg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M1pPyeGYpiWzdiXrmobDlFflvw9s24olyRdbqRATTTAhtKgiERc85RytS7XUMII2Y
	 Un6AyaR2vCT9VVkLPICXEtq0YvlQ/9V5NexhU+Vx49WV711VwcNfbKPxqM5ln7NH5j
	 N1wNk8gLqjlqE2wW65KgkqocCKsxrpviwqEkWy6McHuuY3EKda/ZOKrWcCFmHt+jQf
	 lMs44AXYr0l7SDfGR5QClz4acV8UQDu7/QIR04oDVC5w7CI6gSwr276WwUgPSAzMjH
	 llic//IQVKNgV/RjFQX+G1Xuz5FDHDH3vFjEMwdnIsDVAzRgf3LYPAC35jNZSnO4nZ
	 jx/crUDCL2/yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D6CCFA13;
	Sat,  2 May 2026 09:56:03 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v13 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Sat, 02 May 2026 10:56:51 +0100
Message-Id: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTW7DIBAF4KtErEvFDDBAVr1H1AXlJ0FKbct2r
 VSR716cTV2RLt+T5ntzZ1MaS5rY8XBnY1rKVPquBpAvBxYuvjsnXmItGAokIYXk1zkotJJPX8P
 QjzMXJLOxPgTtFatXw5hyuT3I03vNlzLN/fj9WFhoa/+3FuKCp5wAtMDsI775zl/782voP9mGL
 XYHoGkBWwFlICbUOhq0DeB+ASWoBVwFPohCDkY5JGgAEDsBbSuA2H7ISFmRchBkS8CecE8IqAS
 aEGIicNHHlsAdIcUTAiuhY3BOQEZN5g+xrusPVc8HOvsBAAA=
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777715816; l=2159;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=1qCobfoCEucgrjRGXrCQ3vKcmNt1JqyTqC3CN//BeTg=;
 b=2lD4JiD7HXmz7ICmwv1z6+5Qet99RmrVlaltpn/Focc/QXX+JPWkpzj+DaEU4TL5LGUfout9r
 vuW1Qo/ZJ8IBW+kTu4Yt997g/CISjNBTJsH9T3DiZYwHyMOVLWZm2u9
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: 05F674B1970
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
	TAGGED_FROM(0.00)[bounces-35977-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:replyto,analog.com:mid]

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
Changes in v13:
- Patch 2
   * Properly register debugfs fet faults to match DRAIN channel (in11).
- Link to v12: https://patch.msgid.link/20260430-ltc4283-support-v12-0-5dc9901f2567@analog.com

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



