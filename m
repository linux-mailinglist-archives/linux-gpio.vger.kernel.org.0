Return-Path: <linux-gpio+bounces-34716-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAtBNPXG02kZmAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34716-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 16:45:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5053A45B9
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 16:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7761A302D514
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4783859E8;
	Mon,  6 Apr 2026 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMXvTfup"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41073845B3;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486562; cv=none; b=t6xmTm4yPyF44A985ShLaYU/SbTdyeGglbMKb4o5Q++P6Mbe2+BD4GJsGlvuhqfoTYHUcegddPn2wQ/E/httD9FxoeNT8a2Hu02SOjvCBA+jxaNZZQ/xxZqFpcIfhEvB/Ovd3GxxPq+kzcq99S3UPODAGIx1coESpp4zUqIw9Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486562; c=relaxed/simple;
	bh=1qvPs6Dx3KIJATyl7qc5LXmaMLyGjDLwYwapxU8QMaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iwk8SHuxfaZe3qjP7BQ7FWl5GZyFYEn4Qiyy2Yo5GLL/V+g0WmF4P7ozK5jzECzUQlg2mZyJVYILxZcb5BcklmkAtX5G4xWpaqqbJ6V/V8SV79vQBK7rh2b1x5dzqV0BPuAm9KRVDkxlGfWTEmH/0BIftcfDjLlCGYFVP3p5ViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMXvTfup; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E21C4CEF7;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775486562;
	bh=1qvPs6Dx3KIJATyl7qc5LXmaMLyGjDLwYwapxU8QMaE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tMXvTfupCYXm0z7u5z+8rAlFg8o28+A2xDTygcI4h8o6GTkoSDVrKTkLh56R/4a8Z
	 MVSiIhumoVmB7KCbjIoBpUp0m3de8MpCfc5jGCETnERPA0vchGiVEYu/cGJtVvEOIg
	 MWtH1Hr3NU+0jwOTCLDJdKai/Oo6E2jGilGMcfJwyqJ1mR+xhRu0KwH6pOlEKdw1rt
	 mCwePPkVvG4Rzb+b/8RjM1z0EwwZshWV48qlOz1o/tW7TbEPpke/t3hxIRQt1b5/Lh
	 dlU8P0rGih1et0kyOCcFXMFQ4gVnGxi/FkpfCURtduS38SQZs4RKTFj3/g4EwD0ED1
	 twqlQsg00wXuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5EAF46C48;
	Mon,  6 Apr 2026 14:42:42 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v9 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Mon, 06 Apr 2026 15:31:10 +0100
Message-Id: <20260406-ltc4283-support-v9-0-b66cfc749261@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ7CIBCG4as0rMXQofzoynsYFwSGlqSWBmqja
 Xp3aVca4/L9knlmIRlTwEzO1UISziGHOJQ4HSpiOzO0SIMrTYCBZJxx2k+2Ac1pfoxjTBNlknu
 ljbXCNKRcjQl9eO7i9Va6C3mK6bU/mOW2/rdmSRlFj3UtGHjj4GIG08f2aOOdbNisPwBQv4AuQ
 KNqhyCEU6C/gHVd3zA26k/wAAAA
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775486610; l=2471;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=1qvPs6Dx3KIJATyl7qc5LXmaMLyGjDLwYwapxU8QMaE=;
 b=zg96LAc7vzvzRRoSu1RjQO+IgFC5QplIyIy4bIA0KkDl5TOHSHDev44amb671aQeopTnpEBzt
 GT/mOhV7LQeAeXHLXPIUCFNCOaZALWgv7YauYVhHJ7gjiR39dQM5ubp
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34716-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,analog.com:replyto,analog.com:mid]
X-Rspamd-Queue-Id: 7B5053A45B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v9:
- Patch 2:
  * Add max and min rsense values to avoid 32bit overflows in power and
    rsense * 256;
  * Fix typo in ltc4283_read_in_alarm() s/LTC4283_CHAN_ADIN34/LTC4283_CHAN_ADIO34;
  * Clamp 'val * MILLI' for LTC4283_ADC1_FS_uV in ltc4283_read_in_alarm();
  * Adapt rsense default and property reading for the new range values.
  * Properly construct an auxdev id from the i2c client.
- Link to v8: https://patch.msgid.link/20260327-ltc4283-support-v8-0-471de255d728@analog.com
---

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
 drivers/hwmon/ltc4283.c                            | 1808 ++++++++++++++++++++
 10 files changed, 2603 insertions(+)
---
base-commit: 30a90fa04af6937493fbba20e3e923b5b5a162b4
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



