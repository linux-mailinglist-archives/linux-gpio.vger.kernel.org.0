Return-Path: <linux-gpio+bounces-31370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ECKGaqRgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:11:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D28D50DC
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DB92300B9C8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5373D36B049;
	Tue,  3 Feb 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVC5Kf0F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130942F12C9;
	Tue,  3 Feb 2026 06:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099111; cv=none; b=FDYYQDkqPoo0gmWsGriykKXO7nHc+ipMNKQkQEjWyOyTbjo36rjBf0VuJzjxk7/O8I3jmTl9Uw5zrFZ/AZm6KDPM7m4VHFNyP+JHxvH8eD440dgiajCGakUQsr+kGNL5AQoaCczNxSt9lfUd1BFNQtPFqcdYy3ieZ0l0ffA24e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099111; c=relaxed/simple;
	bh=BSGHvToVNCx/Yaya0iwtDEm8RKbO3YQ4bYXyPmAstLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRsd25GcERUyRJyevYS0idSWFny7bzi8YvhYZ/ZHKmAG5j3hRxszbw7sQOg75v5v2FQRyEBPzPh5SLHEoQZgszCMmdkb3EPm2i6INTjW1CIuuPybJxOjiEmBAdFRYor68x3OOe7sfdwR8vqd+iCL1U3mH2KGB5E7+ykuvPUxFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVC5Kf0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46721C116D0;
	Tue,  3 Feb 2026 06:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099110;
	bh=BSGHvToVNCx/Yaya0iwtDEm8RKbO3YQ4bYXyPmAstLE=;
	h=From:To:Cc:Subject:Date:From;
	b=dVC5Kf0FuMzGQbAYOTnbaXD7awfQUjAaTQi7gl9dqyAxyEkEPWJ5+ygagwNw2cVnt
	 sHe/pu6WajcRIGNG045FvHaCX8MKbN8+enaCDz2kLvXFqHXupS/h1gcX+kHvDIL71U
	 GiL/SytMSwxYVs29zIRpZWRX0lSxWm/aZLzsE0ux+dqsv5mtXTfzEMBeeE3NZ0mthn
	 XRxDm7ASxtiii9zYC9+HXh7CHNe50RUUoo6g43NLhB/+iY5hHIsxB9IhhLm18jxP6p
	 jYpLN6BJwvRNQkrybL9nZR8v8T3VmdBr9odbrJWjAYzlku9m15qRoKVp39AujNxJei
	 jKOMOoIHXi+qQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 00/11] gpio: Adopt revocable mechanism for UAF prevention
Date: Tue,  3 Feb 2026 06:10:47 +0000
Message-ID: <20260203061059.975605-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31370-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08D28D50DC
X-Rspamd-Action: no action

This series transitions the UAF prevention logic within the GPIO core
(gpiolib) to use the 'revocable' mechanism.

The existing code aims to prevent UAF issues when the underlying GPIO
chip is removed.  This series replaces that custom logic with the
generic 'revocable' API, which is designed to handle such lifecycle
dependencies.  There should be no changes in behavior.

The series applies after:
- https://lore.kernel.org/all/20260129143733.45618-1-tzungbi@kernel.org
- https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org

Bartosz: the series was planned to send after -rc1 comes.  But I think
it'd be great to send out for your early review and testing if possible.
The series base on v6.19-rc8, driver-core-next, and gpio/for-next.
Please use the temporary integration testing branch
https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git/log/?h=gpio_rev
if you'd like to.

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
v2:
- Separate fixes patches from v1.  Some of them have been landed.
- Combine small patches into one as they become simpler after applying
  https://lore.kernel.org/all/20260129143733.45618-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-1-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c                   |  97 +++---
 drivers/gpio/gpiolib-cdev.h                   |   3 +-
 drivers/gpio/gpiolib-sysfs.c                  |  50 ++-
 drivers/gpio/gpiolib-sysfs.h                  |  11 +-
 drivers/gpio/gpiolib.c                        | 303 +++++++++---------
 drivers/gpio/gpiolib.h                        |  27 +-
 tools/testing/selftests/gpio/Makefile         |   5 +-
 tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 292 +++++++++++++++++
 tools/testing/selftests/gpio/gpio-cdev-uaf.sh |  63 ++++
 9 files changed, 575 insertions(+), 276 deletions(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
 create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh

-- 
2.53.0.rc2.204.g2597b5adb4-goog


