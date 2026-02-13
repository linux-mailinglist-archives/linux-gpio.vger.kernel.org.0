Return-Path: <linux-gpio+bounces-31657-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J3WN1vvjmk5GAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31657-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E564134785
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 10:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42BBB303D2DB
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC302D9EC5;
	Fri, 13 Feb 2026 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sf/b1GXX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF2265629;
	Fri, 13 Feb 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975063; cv=none; b=ujCI1rBXSRqznGp++/9crGgLf9Jad7cAF1cFX+ucwuGLh9AuwaWo3YLfcLVTiU2ywAww//jRSrRg2TJY86RZT//zeoQAGWNui37nectbHUdkl507VCxnFE7mLZKRMxnFRox0R/DGLoBxdfBDYiVKSPv9tx3wBBOwIwTthregKVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975063; c=relaxed/simple;
	bh=ATT9nRVbaGc4c5P4DPW3faqeclZGjNYQ4Wg9eaJSyJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l6fiL+Cf1mB5cNzaAuK6234ukYqsKKDlW/4ZrXdumrOacJ2ZS7fRxUKxE1nlLH7Fih6pc2hNUhZXL/ps0lHG8KHcOTSInTz1GZZg6ZYciEekcAWBpvcJXIjGpgpbZKxSPmmN/sDFRvKpXkvhfpKvxvbawok4G0N0a+XGwJ8CIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sf/b1GXX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B834DC16AAE;
	Fri, 13 Feb 2026 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770975062;
	bh=ATT9nRVbaGc4c5P4DPW3faqeclZGjNYQ4Wg9eaJSyJY=;
	h=From:To:Cc:Subject:Date:From;
	b=sf/b1GXX5UoB9DMwnIa7VT0KRv5y8T+3rN9fqJGxq+gVBzqiz6zyJN6LqXCi2PKiH
	 c0E30B1fxTP13WFPc+z2cPoEsiuc/BjJFrKoKdBiz5zDubs6IxsC1jfAZ4/3mK6A99
	 WoVe4Om8S5uORExXm8713nHQpRTtCkfoQHmncEbEH/HGNObS1C55LHl/TWt1FjJC8C
	 hyNkuYHeGUuVprK5OiYVydI3VVnx9++O+Lyrpxi40nj4LlN+EoGtsFfo7tMdNSnEpd
	 NvQ7jr5QGMKjO6tCJukmXOSuMXttRZRTlkMSCY3ypUn2Fo7QutceSbgSVCWNpkDmXw
	 F7KytC3DCyQwA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/11] gpio: Adopt revocable mechanism for UAF prevention
Date: Fri, 13 Feb 2026 09:29:47 +0000
Message-ID: <20260213092958.864411-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-31657-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E564134785
X-Rspamd-Action: no action

This series transitions the UAF prevention logic within the GPIO core
(gpiolib) to use the 'revocable' mechanism.

The existing code aims to prevent UAF issues when the underlying GPIO
chip is removed.  This series replaces that custom logic with the
generic 'revocable' API, which is designed to handle such lifecycle
dependencies.  There should be no changes in behavior.

The series applies after:
- https://lore.kernel.org/all/20260213092307.858908-1-tzungbi@kernel.org
- https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org

Tzung-Bi Shih (11):
  gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
  gpio: Remove redundant check for struct gpio_chip
  gpio: sysfs: Remove redundant check for struct gpio_chip
  gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
  gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
=> The first 5 patches are refactors.  They try to make the subsequent
   changes easier or at least clear.

  selftests: gpio: Add gpio-cdev-uaf tests
=> The following patch adds kselftest cases for some classic UAF
   scenarios.

  gpio: Add revocable provider handle for struct gpio_chip
  gpio: cdev: Leverage revocable for accessing struct gpio_chip
  gpio: Remove gpio_chip_guard by using revocable
  gpio: Leverage revocable for accessing struct gpio_chip
=> The following 4 patches start to replace the existing code.

  gpio: Remove unused `chip` and `srcu` in struct gpio_device
=> The last patch removes the unused fields for the custom logic as all
   of them should be transiting to revocable.

---
v3:
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-1-tzungbi@kernel.org
- Separate fixes patches from v1.  Some of them have been landed.
- Combine small patches into one as they become simpler after applying
  https://lore.kernel.org/all/20260129143733.45618-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-1-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c                   |  95 ++----
 drivers/gpio/gpiolib-cdev.h                   |   2 +-
 drivers/gpio/gpiolib-sysfs.c                  |  53 ++-
 drivers/gpio/gpiolib-sysfs.h                  |   8 +-
 drivers/gpio/gpiolib.c                        | 305 ++++++++----------
 drivers/gpio/gpiolib.h                        |  27 +-
 tools/testing/selftests/gpio/Makefile         |   5 +-
 tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 292 +++++++++++++++++
 tools/testing/selftests/gpio/gpio-cdev-uaf.sh |  63 ++++
 9 files changed, 541 insertions(+), 309 deletions(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
 create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh

-- 
2.53.0.310.g728cabbaf7-goog


