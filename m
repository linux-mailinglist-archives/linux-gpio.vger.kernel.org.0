Return-Path: <linux-gpio+bounces-32007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGfwGxDxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:17:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71E172036
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4B15301BA67
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA573446C6;
	Mon, 23 Feb 2026 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2zlRSA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021051534EC;
	Mon, 23 Feb 2026 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827466; cv=none; b=Wjr38Ci+GOkTBuMD7XfjwwRmseDHj6HQupldJbGthO0tu+InfNoxJ7YmJoFHnm0WsxghsjyHg7qvSB68MGTEafciYUpVYWudQ2FHuoDB9ilPzAun8NYRTVbTnDrXBdKpJUTF3F5J+3RQ49Fk29c7txNE9yhFelMm2fjuZb+OQvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827466; c=relaxed/simple;
	bh=5mu2lG/TPZq+JANR8vD2Ti3EHOwL+IC8LbP2bAxxHtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKT9gwXybkyDyxPYFUl82ZP5Ne+RF0dFuKY0VEGc7lmmQ6bivH5hxTBVdV86NdY2CHfkf4EIZxxVyRiOIpsHa7hpZko3J9SWghdY4t+gNwzB8R82dtlSXQoZvD1lycuf5wMznYB8QfKeHCkbHPEtkXc0cV/jRySuIARBHixofJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2zlRSA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C163C116C6;
	Mon, 23 Feb 2026 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827465;
	bh=5mu2lG/TPZq+JANR8vD2Ti3EHOwL+IC8LbP2bAxxHtU=;
	h=From:To:Cc:Subject:Date:From;
	b=F2zlRSA4bx4vmBXZOm8NnqgYq8Truw8yELYFUgJnm1mU4/yvyBIAoDQPCNS7sPYHR
	 oJaGnuQe6WYLmS7YwLYmiiX8T9k1k9fYb3miXP3khl9Eh6ytUUtFTdDKz6PDb7qles
	 H1h7VzjVgq0qQfnzr810mtfanPWQg5DYqg26se34FswUZBwavsaFnCuLflkxw6qbi7
	 YJYWXjjDDH/rOJisSgOl2sEevUDBtd8NPri6y7kUv5JeTluif80oyV4jpfAcNk0PMA
	 h4XTINDG2G45R+j8o2M0XzRSk9jHddFnpCNIp13B5uqXRwmzJCg1+vAYtgp+9B5/1Q
	 VKSP2KhS+RPyw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 0/6] gpio: Refactor and add selftest
Date: Mon, 23 Feb 2026 14:17:20 +0800
Message-ID: <20260223061726.82161-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32007-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF71E172036
X-Rspamd-Action: no action

The series is separated from v3 to lessen the burden on the subsequent
revocable work per suggestion in
https://lore.kernel.org/all/CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com/.

The series is based on v7.0-rc1 and applies after
https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.org.

---
v4:
- Separate the first 6 patches from v3.

v3: https://lore.kernel.org/all/20260213092958.864411-1-tzungbi@kernel.org

Tzung-Bi Shih (6):
  gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
  gpio: Remove redundant check for struct gpio_chip
  gpio: sysfs: Remove redundant check for struct gpio_chip
  gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
  gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
  selftests: gpio: Add gpio-cdev-uaf tests

 drivers/gpio/gpiolib-cdev.c                   |  20 +-
 drivers/gpio/gpiolib-cdev.h                   |   2 +-
 drivers/gpio/gpiolib-sysfs.c                  |  32 +-
 drivers/gpio/gpiolib-sysfs.h                  |   8 +-
 drivers/gpio/gpiolib.c                        |  46 +--
 tools/testing/selftests/gpio/Makefile         |   5 +-
 tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 292 ++++++++++++++++++
 tools/testing/selftests/gpio/gpio-cdev-uaf.sh |  63 ++++
 8 files changed, 402 insertions(+), 66 deletions(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
 create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh

-- 
2.51.0


