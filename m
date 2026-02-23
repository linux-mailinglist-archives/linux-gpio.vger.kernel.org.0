Return-Path: <linux-gpio+bounces-32013-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI+5HIrxm2kI+AMAu9opvQ
	(envelope-from <linux-gpio+bounces-32013-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284151720D8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 07:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80A4B3042603
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 06:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F46A3469FC;
	Mon, 23 Feb 2026 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2ROXckC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50F73469F4;
	Mon, 23 Feb 2026 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827476; cv=none; b=e9BEKyMwBKftayptepnnIYl9g2Iyu0AeUpju99GzL1Eri2a8clQoj8PrG1pLABmiSYcLd85WsK9aihnaAKCLgXwIZEmVtRq0yB15ZH5nLUiJmGZLbSX49ZY/1MCA5kKPBb2i6SVHwkPbna+GelDnJxMMlvAC0pxDBqPEkw2r2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827476; c=relaxed/simple;
	bh=JpdZrqFMvn1I2wIDO5c75qXXq2BiDGaqMTs3XgagMI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSYbyVSZLc7J3ayPVwgl6MGgrNL+mLvdLmx85jCmeUxux31A+G9K/xvQFZfo366GPObTnQTsz+XpQn9n4i/6Wzremb2RZzKW0DtTpU9lz9xMr6Zgtf3CmVKzcrrHKjULt10UhWEcB4UauZtXXs8ml6WuPtaAvjfX6haGN82+0aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2ROXckC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5406DC19421;
	Mon, 23 Feb 2026 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827476;
	bh=JpdZrqFMvn1I2wIDO5c75qXXq2BiDGaqMTs3XgagMI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2ROXckCh/FxEs57Uygr+JWe0jpWcjSEGzMbPH3yNxLJyrHCWBBQdrrS+gKjVW6Zt
	 V2/Q8J8MZ2rEspFhBY4xQ7/gmzy/QC9WGu+taZLzyXwsZt1xZ1FLCptEcGTdQjAGGv
	 P8xmWAJzXpN7D0aL+Bf9LW1gltALpoDcicjiDljFsgs74KNIToQW6uDr2y9Mhyklur
	 mZKc3uikvRyekbPNpgFB5H4eYC7giG0i1WhAYMwYgcRZAjsyaSUEAh3thgsfh3I1Qw
	 FgXpkfKd22957fFJTrm7+WhgOJlgTHqeuQ+ClECGpUQBLWqJn+d2L5Wf7uy/RM1DUp
	 sKlAsX1U6zY5g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v4 6/6] selftests: gpio: Add gpio-cdev-uaf tests
Date: Mon, 23 Feb 2026 14:17:26 +0800
Message-ID: <20260223061726.82161-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
References: <20260223061726.82161-1-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32013-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gpio-mockup-sysfs.sh:url,pfds.events:url,gpio-mockup.sh:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gpio-cdev-uaf.sh:url,gpio-aggregator.sh:url]
X-Rspamd-Queue-Id: 284151720D8
X-Rspamd-Action: no action

Add tests for gpiolib-cdev to make sure accessing to dangling resources
via the opening file descriptor won't crash the system after the
underlying resource providers have gone.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Add R-b tag.

v3: https://lore.kernel.org/all/20260213092958.864411-7-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20260203061059.975605-7-tzungbi@kernel.org
- Remove fdinfo test which is redundant.

v1: https://lore.kernel.org/all/20260116081036.352286-12-tzungbi@kernel.org

 tools/testing/selftests/gpio/Makefile         |   5 +-
 tools/testing/selftests/gpio/gpio-cdev-uaf.c  | 292 ++++++++++++++++++
 tools/testing/selftests/gpio/gpio-cdev-uaf.sh |  63 ++++
 3 files changed, 358 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
 create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 7bfe315f7001..741ab21e1260 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-TEST_PROGS := gpio-mockup.sh gpio-sim.sh gpio-aggregator.sh
+TEST_PROGS := gpio-mockup.sh gpio-sim.sh gpio-aggregator.sh gpio-cdev-uaf.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name \
+			   gpio-cdev-uaf
 CFLAGS += -O2 -g -Wall $(KHDR_INCLUDES)
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-cdev-uaf.c b/tools/testing/selftests/gpio/gpio-cdev-uaf.c
new file mode 100644
index 000000000000..765d3cc4f0ef
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-cdev-uaf.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for UAF tests.
+ *
+ * Copyright 2026 Google LLC
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/gpio.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#define CONFIGFS_DIR "/sys/kernel/config/gpio-sim"
+#define PROCFS_DIR "/proc"
+
+static void print_usage(void)
+{
+	printf("usage:\n");
+	printf("  gpio-cdev-uaf [chip|handle|event|req] [poll|read|ioctl]\n");
+}
+
+static int _create_chip(const char *name, int create)
+{
+	char path[64];
+
+	snprintf(path, sizeof(path), CONFIGFS_DIR "/%s", name);
+
+	if (create)
+		return mkdir(path, 0755);
+	else
+		return rmdir(path);
+}
+
+static int create_chip(const char *name)
+{
+	return _create_chip(name, 1);
+}
+
+static void remove_chip(const char *name)
+{
+	_create_chip(name, 0);
+}
+
+static int _create_bank(const char *chip_name, const char *name, int create)
+{
+	char path[64];
+
+	snprintf(path, sizeof(path), CONFIGFS_DIR "/%s/%s", chip_name, name);
+
+	if (create)
+		return mkdir(path, 0755);
+	else
+		return rmdir(path);
+}
+
+static int create_bank(const char *chip_name, const char *name)
+{
+	return _create_bank(chip_name, name, 1);
+}
+
+static void remove_bank(const char *chip_name, const char *name)
+{
+	_create_bank(chip_name, name, 0);
+}
+
+static int _enable_chip(const char *name, int enable)
+{
+	char path[64];
+	int fd, ret;
+
+	snprintf(path, sizeof(path), CONFIGFS_DIR "/%s/live", name);
+
+	fd = open(path, O_WRONLY);
+	if (fd == -1)
+		return fd;
+
+	if (enable)
+		ret = write(fd, "1", 1);
+	else
+		ret = write(fd, "0", 1);
+
+	close(fd);
+	return ret == 1 ? 0 : -1;
+}
+
+static int enable_chip(const char *name)
+{
+	return _enable_chip(name, 1);
+}
+
+static void disable_chip(const char *name)
+{
+	_enable_chip(name, 0);
+}
+
+static int open_chip(const char *chip_name, const char *bank_name)
+{
+	char path[64], dev_name[32];
+	int ret, fd;
+
+	ret = create_chip(chip_name);
+	if (ret) {
+		fprintf(stderr, "failed to create chip\n");
+		return ret;
+	}
+
+	ret = create_bank(chip_name, bank_name);
+	if (ret) {
+		fprintf(stderr, "failed to create bank\n");
+		goto err_remove_chip;
+	}
+
+	ret = enable_chip(chip_name);
+	if (ret) {
+		fprintf(stderr, "failed to enable chip\n");
+		goto err_remove_bank;
+	}
+
+	snprintf(path, sizeof(path), CONFIGFS_DIR "/%s/%s/chip_name",
+		 chip_name, bank_name);
+
+	fd = open(path, O_RDONLY);
+	if (fd == -1) {
+		ret = fd;
+		fprintf(stderr, "failed to open %s\n", path);
+		goto err_disable_chip;
+	}
+
+	ret = read(fd, dev_name, sizeof(dev_name) - 1);
+	close(fd);
+	if (ret == -1) {
+		fprintf(stderr, "failed to read %s\n", path);
+		goto err_disable_chip;
+	}
+	dev_name[ret] = '\0';
+	if (ret && dev_name[ret - 1] == '\n')
+		dev_name[ret - 1] = '\0';
+
+	snprintf(path, sizeof(path), "/dev/%s", dev_name);
+
+	fd = open(path, O_RDWR);
+	if (fd == -1) {
+		ret = fd;
+		fprintf(stderr, "failed to open %s\n", path);
+		goto err_disable_chip;
+	}
+
+	return fd;
+err_disable_chip:
+	disable_chip(chip_name);
+err_remove_bank:
+	remove_bank(chip_name, bank_name);
+err_remove_chip:
+	remove_chip(chip_name);
+	return ret;
+}
+
+static void close_chip(const char *chip_name, const char *bank_name)
+{
+	disable_chip(chip_name);
+	remove_bank(chip_name, bank_name);
+	remove_chip(chip_name);
+}
+
+static int test_poll(int fd)
+{
+	struct pollfd pfds;
+
+	pfds.fd = fd;
+	pfds.events = POLLIN;
+	pfds.revents = 0;
+
+	if (poll(&pfds, 1, 0) == -1)
+		return -1;
+
+	return (pfds.revents & ~(POLLHUP | POLLERR)) ? -1 : 0;
+}
+
+static int test_read(int fd)
+{
+	char data;
+
+	if (read(fd, &data, 1) == -1 && errno == ENODEV)
+		return 0;
+	return -1;
+}
+
+static int test_ioctl(int fd)
+{
+	if (ioctl(fd, 0, NULL) == -1 && errno == ENODEV)
+		return 0;
+	return -1;
+}
+
+int main(int argc, char **argv)
+{
+	int cfd, fd, ret;
+	int (*test_func)(int);
+
+	if (argc != 3) {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	if (strcmp(argv[1], "chip") == 0 ||
+	    strcmp(argv[1], "event") == 0 ||
+	    strcmp(argv[1], "req") == 0) {
+		if (strcmp(argv[2], "poll") &&
+		    strcmp(argv[2], "read") &&
+		    strcmp(argv[2], "ioctl")) {
+			fprintf(stderr, "unknown command: %s\n", argv[2]);
+			return EXIT_FAILURE;
+		}
+	} else if (strcmp(argv[1], "handle") == 0) {
+		if (strcmp(argv[2], "ioctl")) {
+			fprintf(stderr, "unknown command: %s\n", argv[2]);
+			return EXIT_FAILURE;
+		}
+	} else {
+		fprintf(stderr, "unknown command: %s\n", argv[1]);
+		return EXIT_FAILURE;
+	}
+
+	if (strcmp(argv[2], "poll") == 0)
+		test_func = test_poll;
+	else if (strcmp(argv[2], "read") == 0)
+		test_func = test_read;
+	else	/* strcmp(argv[2], "ioctl") == 0 */
+		test_func = test_ioctl;
+
+	cfd = open_chip("chip", "bank");
+	if (cfd == -1) {
+		fprintf(stderr, "failed to open chip\n");
+		return EXIT_FAILURE;
+	}
+
+	/* Step 1: Hold a FD to the test target. */
+	if (strcmp(argv[1], "chip") == 0) {
+		fd = cfd;
+	} else if (strcmp(argv[1], "handle") == 0) {
+		struct gpiohandle_request req = {0};
+
+		req.lines = 1;
+		if (ioctl(cfd, GPIO_GET_LINEHANDLE_IOCTL, &req) == -1) {
+			fprintf(stderr, "failed to get handle FD\n");
+			goto err_close_chip;
+		}
+
+		close(cfd);
+		fd = req.fd;
+	} else if (strcmp(argv[1], "event") == 0) {
+		struct gpioevent_request req = {0};
+
+		if (ioctl(cfd, GPIO_GET_LINEEVENT_IOCTL, &req) == -1) {
+			fprintf(stderr, "failed to get event FD\n");
+			goto err_close_chip;
+		}
+
+		close(cfd);
+		fd = req.fd;
+	} else {	/* strcmp(argv[1], "req") == 0 */
+		struct gpio_v2_line_request req = {0};
+
+		req.num_lines = 1;
+		if (ioctl(cfd, GPIO_V2_GET_LINE_IOCTL, &req) == -1) {
+			fprintf(stderr, "failed to get req FD\n");
+			goto err_close_chip;
+		}
+
+		close(cfd);
+		fd = req.fd;
+	}
+
+	/* Step 2: Free the chip. */
+	close_chip("chip", "bank");
+
+	/* Step 3: Access the dangling FD to trigger UAF. */
+	ret = test_func(fd);
+	close(fd);
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
+err_close_chip:
+	close(cfd);
+	close_chip("chip", "bank");
+	return EXIT_FAILURE;
+}
diff --git a/tools/testing/selftests/gpio/gpio-cdev-uaf.sh b/tools/testing/selftests/gpio/gpio-cdev-uaf.sh
new file mode 100755
index 000000000000..6e47533019cf
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-cdev-uaf.sh
@@ -0,0 +1,63 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2026 Google LLC
+
+BASE_DIR=`dirname $0`
+MODULE="gpio-cdev-uaf"
+
+fail() {
+	echo "$*" >&2
+	echo "GPIO $MODULE test FAIL"
+	exit 1
+}
+
+skip() {
+	echo "$*" >&2
+	echo "GPIO $MODULE test SKIP"
+	exit 4
+}
+
+# Load the gpio-sim module. This will pull in configfs if needed too.
+modprobe gpio-sim || skip "unable to load the gpio-sim module"
+# Make sure configfs is mounted at /sys/kernel/config. Wait a bit if needed.
+for _ in `seq 5`; do
+	mountpoint -q /sys/kernel/config && break
+	mount -t configfs none /sys/kernel/config
+	sleep 0.1
+done
+mountpoint -q /sys/kernel/config || \
+	skip "configfs not mounted at /sys/kernel/config"
+
+echo "1. GPIO"
+
+echo "1.1. poll"
+$BASE_DIR/gpio-cdev-uaf chip poll || fail "failed to test chip poll"
+echo "1.2. read"
+$BASE_DIR/gpio-cdev-uaf chip read || fail "failed to test chip read"
+echo "1.3. ioctl"
+$BASE_DIR/gpio-cdev-uaf chip ioctl || fail "failed to test chip ioctl"
+
+echo "2. linehandle"
+
+echo "2.1. ioctl"
+$BASE_DIR/gpio-cdev-uaf handle ioctl || fail "failed to test handle ioctl"
+
+echo "3. lineevent"
+
+echo "3.1. read"
+$BASE_DIR/gpio-cdev-uaf event read || fail "failed to test event read"
+echo "3.2. poll"
+$BASE_DIR/gpio-cdev-uaf event poll || fail "failed to test event poll"
+echo "3.3. ioctl"
+$BASE_DIR/gpio-cdev-uaf event ioctl || fail "failed to test event ioctl"
+
+echo "4. linereq"
+
+echo "4.1. read"
+$BASE_DIR/gpio-cdev-uaf req read || fail "failed to test req read"
+echo "4.2. poll"
+$BASE_DIR/gpio-cdev-uaf req poll || fail "failed to test req poll"
+echo "4.3. ioctl"
+$BASE_DIR/gpio-cdev-uaf req ioctl || fail "failed to test req ioctl"
+
+echo "GPIO $MODULE test PASS"
-- 
2.51.0


