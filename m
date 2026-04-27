Return-Path: <linux-gpio+bounces-35573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BQAEYBs72nFBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:02:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C5473F0F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 162943012869
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02DE3D090B;
	Mon, 27 Apr 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfvN5dqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7613CEBBC;
	Mon, 27 Apr 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298369; cv=none; b=DRQ3bQ0/sbZCKonYBJ4M+o4uzWVKYWIwWGCOlD3CQRtJaR/VacjbwL98biKPEUeKkXCM2pvyYR/9JUXdi3x+79/BYAdlZHlF2OmSR1luK9/M9K5QmaXNuqeHOh60Ib+3Rv8nuVGnmIvbs9DcF2zGsl9nvVrAH3TA9hpGnyOvwDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298369; c=relaxed/simple;
	bh=lLNZlNo4AbW+zXp5BcjsajFSNEqcY1uPQqOOFXgHf0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2CuRO1l3FwNRBWgYI1xDzzIM6qvde2reUpntrTn+Jk1AkulZDU86BBl3HC8uBvD77VwVqt9RwrNbtTGQ9amfWcDpJbze0+dPEfWa/o1MBTd3Cg7ASp1FMkGnJa0Gx5Y1AVdb8S6qU3EzF7vVJ7Lt1e5504aPBJSfdqSuSjRKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfvN5dqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E6FC2BCB4;
	Mon, 27 Apr 2026 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777298369;
	bh=lLNZlNo4AbW+zXp5BcjsajFSNEqcY1uPQqOOFXgHf0Y=;
	h=From:To:Cc:Subject:Date:From;
	b=sfvN5dqcc6cm3QEMsdLfkDDeKgf6mSl7DHBeNFFfoF860jJv6fyK7RuGx1q1VaZYS
	 1sr6cm43dF+xsp1/6F5JCdoitdq57Gh+agORN5+QdUY39fjkJ3LSZlt0Su/5AqhQ0u
	 Fw98dgry7KVEfexzcKj0EKsbJVRjs/Wybm/Y2ydDn4plXuZwKIxpa6J0NzLmcRrM4X
	 28IFzIdJgRsNjkCtD7Vd1yGrEmLu/moUPgkZyOvD6VmqWIzwuWmuP5FiSXU6Ev5zJS
	 nux/tYpMncLAx3rondyRmEUghb/15fwe4ShgDPASKgNJR+si+tUEdGcD0Y+2E8QK28
	 TVkyIAbcZeqJA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v9 0/9] drivers/base: Introduce revocable
Date: Mon, 27 Apr 2026 21:58:32 +0800
Message-ID: <20260427135841.96266-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF6C5473F0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35573-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lpc.events:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

This series introduces the "revocable" mechanism, a synchronization
primitive designed to prevent Use-After-Free errors.

- Patch 1 introduces the revocable which is an implementation of ideas
  from the talk [1].

- Patch 2 adds KUnit test cases.

- Patches 3 to 7 transitions the UAF prevention logic within the GPIO
  core (gpiolib) to use the "revocable" mechanism.

  The existing code aims to prevent UAF issues when the underlying GPIO
  chip is removed.  They replace that custom logic with the generic
  "revocable" API, which is designed to handle such lifecycle
  dependencies.  There should be no changes in behavior.

- Patches 8 to 9 uses "revocable" mechanism to fix an UAF in
  cros_ec_chardev driver.  Alternatively, [2] is a series for fixing the
  same issue without using "revocable".

Since v9, there are two ways to manage the resource provider handle.
- Embedded allocation: patches 3 to 7 might be the potential user.
- Dynamic allocation: patches 8 to 9 might be the potential user.

[1] https://lpc.events/event/17/contributions/1627/
[2] https://lore.kernel.org/all/20260427134659.95181-1-tzungbi@kernel.org

---
v9:
- Rebase onto v7.1-rc1.
- Remove the selftests patch as it makes less sense to test revocable
  APIs via kselftests.
- Merge patches 7 to 11 from
  https://lore.kernel.org/all/20260213092958.864411-1-tzungbi@kernel.org
  into the series.
- Merge patch from
  https://lore.kernel.org/all/20250923075302.591026-5-tzungbi@kernel.org
- Merge patch from
  https://lore.kernel.org/all/20250912081718.3827390-6-tzungbi@kernel.org

v8: https://lore.kernel.org/all/20260213092307.858908-1-tzungbi@kernel.org
- Rework on the revocable APIs.  See changelog in [PATCH v8 1/3] for details.

v7: https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org
- Rebase onto next-20260115.

v6: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org
- Rebase onto next-20251106.
- Separate revocable core and use cases.

v5: https://lore.kernel.org/all/20251016054204.1523139-1-tzungbi@kernel.org
- Rebase onto next-20251015.
- Add more context about the PoC.
- Support multiple revocable providers in the PoC.

v4: https://lore.kernel.org/all/20250923075302.591026-1-tzungbi@kernel.org
- Rebase onto next-20250922.
- Remove the 5th patch from v3.
- Add fops replacement PoC in 5th - 7th patches.

v3: https://lore.kernel.org/all/20250912081718.3827390-1-tzungbi@kernel.org
- Rebase onto https://lore.kernel.org/all/20250828083601.856083-1-tzungbi@kernel.org
  and next-20250912.
- The 4th patch changed accordingly.

v2: https://lore.kernel.org/all/20250820081645.847919-1-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Add test cases in Kunit and selftest.

v1: https://lore.kernel.org/all/20250814091020.1302888-1-tzungbi@kernel.org

Tzung-Bi Shih (9):
  revocable: Revocable resource management
  revocable: Add KUnit test cases
  gpio: Add revocable provider handle for struct gpio_chip
  gpio: cdev: Leverage revocable for accessing struct gpio_chip
  gpio: Remove gpio_chip_guard by using revocable
  gpio: Leverage revocable for accessing struct gpio_chip
  gpio: Remove unused `chip` and `srcu` in struct gpio_device
  platform/chrome: Protect cros_ec_device lifecycle with revocable
  platform/chrome: cros_ec_chardev: Consume cros_ec_device via revocable

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 384 +++++++++++++++
 MAINTAINERS                                   |  10 +
 drivers/base/Kconfig                          |   5 +
 drivers/base/Makefile                         |   5 +-
 drivers/base/revocable.c                      | 298 +++++++++++
 drivers/base/revocable_test.c                 | 461 ++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c                   |  77 ++-
 drivers/gpio/gpiolib-sysfs.c                  |  31 +-
 drivers/gpio/gpiolib.c                        | 255 ++++------
 drivers/gpio/gpiolib.h                        |  28 +-
 drivers/platform/chrome/cros_ec.c             |  11 +
 drivers/platform/chrome/cros_ec_chardev.c     |  80 ++-
 include/linux/platform_data/cros_ec_proto.h   |   3 +
 include/linux/revocable.h                     | 214 ++++++++
 15 files changed, 1597 insertions(+), 266 deletions(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/revocable_test.c
 create mode 100644 include/linux/revocable.h

-- 
2.51.0


