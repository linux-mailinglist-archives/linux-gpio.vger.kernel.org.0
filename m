Return-Path: <linux-gpio+bounces-35717-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMijArTu8Gn9bAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35717-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:30:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05056489FC5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A806C340FAAA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AB8480321;
	Tue, 28 Apr 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVllIqr4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9747F2D9;
	Tue, 28 Apr 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392398; cv=none; b=sQct/JH9DWqcLdEuDRS77zLsTPpXRQWGsP2aP5qYXMzrN7r4TL0NLMLXfG45rdR6+3SUAmBqhHrnG0uSq247iYc475ejA/QbRavP8BrYgDSTePAQgUoS0PW6/+E6IyGViLXpyE8tbsBXwTKQ2PgJ1cxtpiUtQ12rTDqt56iXMSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392398; c=relaxed/simple;
	bh=wJpZOr7WpcpInKgvVGac/trrFN9ZpHJHZEoCiuPdrYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nrsgFm+s1gTYxIaChQQi4FlN6h7qcoBaH+snNsh7xHgWdxAZ8Ij8USV83kmrQtv8jc7z1jL8EuYm2Qi30zYvx3VIIIYmRshqsjEU0cjcFIDwcHfOXSTE8wh+np87RuydPf83fFcPg6szC1GmhTsTfbMqNhbYbfoH1A78NHocZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVllIqr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B441C32782;
	Tue, 28 Apr 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392398;
	bh=wJpZOr7WpcpInKgvVGac/trrFN9ZpHJHZEoCiuPdrYs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aVllIqr4JCKqyLIoeSN16CpPbBgwVIEtlQp2ENbArx74blpc0WIyD0pMONFWWKBwI
	 BwPk4r94IAL6pT2TYrFp5xkrUxjPyQOc4Ok52/VHwfqRpIR+NfYtyPg5QxtTbo2G8d
	 njSpW0C4h3yljJ95g4FvGzaUYQon9gp1U+SdKCX+hSObkYwiiVAxyafxPMe6Ml9+q+
	 jYwcXFWvNNirR8T1/cUZt4GnXQAvs2Q/9uQY4yzCoDMu5WtP6s5tr5oR73aHL/oDMH
	 bQQUPuigS5R1I9qlBB+JSV/MAs/g8ffyf+FF8tzMnEMa63IbdPe+7IRi2ebsVYFeFD
	 mJgwWJnJT/vuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE44CFF886D;
	Tue, 28 Apr 2026 16:06:37 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v10 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Tue, 28 Apr 2026 17:07:25 +0100
Message-Id: <20260428-ltc4283-support-v10-0-4f26f46491c3@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XN0Q6CIBgF4FdxXEeDXwTsqvdoXRCCspk4MFZzv
 nvoTTXX5Tnb+c6MognORHQqZhRMctH5IQdKDgXSnRpag12TCwQEOClJiftJM5Aljo9x9GHChJd
 WSKV1pRjKqzEY654bebnm3Lk4+fDaHhJf2/9W4phgYw2lFQGrGjirQfW+PWp/RyuW5BcAYg/ID
 DBBGwNV1QiQO6D+AIzwPVBn4Ma5tlqwGjj9AZZleQOU2LccMgEAAA==
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777392450; l=2621;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=wJpZOr7WpcpInKgvVGac/trrFN9ZpHJHZEoCiuPdrYs=;
 b=JKTAEyv8cj4/a5R73is9A5no+jJH+LIDC8oOOPpDWV5LA7qj9M6fnD7uU0fVpMp8GjS21gyUf
 75zEL7JTuzwDsHKjW2OhuDP0gP+IHitPpIWLldEjAKerHCrfhk668N/
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: 05056489FC5
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35717-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:replyto,analog.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]

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
Changes in v10:
- Patch 2:
 * Replace regmap_clear_bits() with direct regmap_write() in
   ltc4283_read_alarm();
 * Simplify ltc4283_read_energy() overflow handling using
   mul_u64_u64_div_u64() for 128-bit intermediate precision;
 * Simplify ltc4283_write_power_word() overflow handling using
   mul_u64_u64_div_u64();
 * Fix clamp-before-multiply overflow in ltc4283_write_minmax() by
   clamping against LONG_MAX/MILLI first;
 * Drop broken %*ph format from ltc4283_parse_array_prop() error
   message;
 * Remove unused #include <linux/overflow.h>.
- Link to v9: https://patch.msgid.link/20260406-ltc4283-support-v9-0-b66cfc749261@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1795 ++++++++++++++++++++
 10 files changed, 2590 insertions(+)
---
base-commit: 30a90fa04af6937493fbba20e3e923b5b5a162b4
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



