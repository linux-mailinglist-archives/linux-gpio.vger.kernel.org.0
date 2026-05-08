Return-Path: <linux-gpio+bounces-36444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNFxJLrB/WkpigAAu9opvQ
	(envelope-from <linux-gpio+bounces-36444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:58:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E934F55FD
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B713013A7F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 10:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397113290DC;
	Fri,  8 May 2026 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY2XxI5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8081862A;
	Fri,  8 May 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237721; cv=none; b=q7URh7EYDyjnEm9jLIbNdaZtTPwSk7yZl4Z+WwNUSRwtz2ZggFhpjpuT1aVfaW6/ywmZyn+dB42qcNO8YOmaY3ebMjA7QO16bRu/CXCSsVAPGtL9nxwtypZpCihWA3j8u3mPhZ9AD5ZHCM5QN8mi670dB/MBbKhcy9gonuwpzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237721; c=relaxed/simple;
	bh=sZoKk2j+9/Xh2m14M9z96ycQqA159DiqMv2u5K6uIAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klXsy8IfHHQH+pVaVx4gm1IH/u4h1h2OXzbwUmmvxJj1PPCF7gGuQTTCKQaznVAkmWR/kIbd+zGk6BmGjYrOsPZDizCXR5zF2v9oY19dCpwHrLyj6nIN3xkhWaz3+sYjzMK5PDj3u8dHzD94FJz2OIe9J3jyvHrLqkE9kKP8lgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY2XxI5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A77C2BCB0;
	Fri,  8 May 2026 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778237720;
	bh=sZoKk2j+9/Xh2m14M9z96ycQqA159DiqMv2u5K6uIAg=;
	h=From:To:Cc:Subject:Date:From;
	b=KY2XxI5e4Ann33s+XxOVYt4V8lYlI1fwmVjf9E8afHTLfxPH0r/Zl1m9i/3L8+SBm
	 xwh49j/LLGdCFDgU/AIoHAGIyY5duAtxbFUsH3IcyNAmALVi3CBilk0lWxpFMOigpw
	 GfKppZLtKPCE/+irov3FQdutr5nYEW0FwE2vUb4orM457uIt937k5GhJOrWLqr2wYH
	 91GkHBTxoOXNYCMmIs4U2Xd+MNGQSxJ9b80SFF1z5z808yTakuEq/XRpQhQ7Ttn01C
	 SZwHEsa8uD4zFmg6KhI4Qs/0s9S55R//o/+YvJa2+3llM9WjRm1jFtQykV7d7Vbt6g
	 ps0FFB7aG2w7Q==
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
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v10 0/9] drivers/base: Introduce revocable
Date: Fri,  8 May 2026 18:54:39 +0800
Message-ID: <20260508105448.31799-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 31E934F55FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36444-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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
v10:
- Unify handling of embedded and dynamic allocation.

v9: https://lore.kernel.org/all/20260427135841.96266-1-tzungbi@kernel.org
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
 .../driver-api/driver-model/revocable.rst     | 384 +++++++++++++++++
 MAINTAINERS                                   |  10 +
 drivers/base/Kconfig                          |   5 +
 drivers/base/Makefile                         |   5 +-
 drivers/base/revocable.c                      | 267 ++++++++++++
 drivers/base/revocable_test.c                 | 405 ++++++++++++++++++
 drivers/gpio/gpiolib-cdev.c                   |  77 ++--
 drivers/gpio/gpiolib-sysfs.c                  |  31 +-
 drivers/gpio/gpiolib.c                        | 263 +++++-------
 drivers/gpio/gpiolib.h                        |  28 +-
 drivers/platform/chrome/cros_ec.c             |  11 +
 drivers/platform/chrome/cros_ec_chardev.c     |  80 +++-
 include/linux/platform_data/cros_ec_proto.h   |   3 +
 include/linux/revocable.h                     | 204 +++++++++
 15 files changed, 1505 insertions(+), 269 deletions(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/revocable_test.c
 create mode 100644 include/linux/revocable.h

-- 
2.51.0


