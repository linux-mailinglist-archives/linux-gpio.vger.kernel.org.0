Return-Path: <linux-gpio+bounces-31376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO/xGtKSgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:16:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DED51F7
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4455B3100A2F
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBD536D517;
	Tue,  3 Feb 2026 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYmEBer8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2877636D4FA;
	Tue,  3 Feb 2026 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099127; cv=none; b=RuYzvJo4fnIr9DAGbeSj8E+zhz2+BRic5xTF/qQKRM7KKyH2/itVODjaxRy9oyo4OLakvvHjbTCxyeZT1JH5Gja8dEuJKXBha4edmE2bkMdNqBTmrOw1jV2rZbredxEajQRsNEe2sF1bw1w04eAMuSa4PNGWNQhc8Oemb7WTMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099127; c=relaxed/simple;
	bh=q4CPLmejv1/cWQkqo1Ssx6UbxBRF9iXRvnw2vIQAgBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEiL+jAn3RUd0p0IeDmDL8Je6gdt8UBU8IlDMEsb0gaCTWZ+m3QdhNhGoKbR0+v3P4jHsTwD2AH7KuJuqRE/bldGhxldQGdVoL0vhTAWwfXm99+BG8O49090/VpBlcImov0Xo4/kX8m20rvrcDSK5vC2fPa9INxiZWtxEMcfh2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYmEBer8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D49C2BC9E;
	Tue,  3 Feb 2026 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099127;
	bh=q4CPLmejv1/cWQkqo1Ssx6UbxBRF9iXRvnw2vIQAgBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYmEBer8jR460EnuitVFhkD88OwLpgjbYHtZMnehjgy7xLgl20HF5S9u2h80wICpL
	 MP+w/t+ra9WypIEKE87nK60mSFAXGpHhmmJCDH72T5YJZ23XOf1xU9mauqma1YFSth
	 haly3vHE1rawOyEAgIZfAqMAXnAL3UxErPGlHPB6lW3KOqqYn1IrlVFQsGVawefxZB
	 egHxHcz9D2FKiGANRdAWf0u2iAvpDAbC3m9lJH6++/bY1ymihV0mh0gx53sstphmUg
	 nLYci1MJl+RxypFBpFe/1/rTCpr6YVXOIrPgjcGqiCjlIZ4D2sRluUvAeDg67u+nEg
	 aTvWww67AopRw==
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
Subject: [PATCH v2 06/11] selftests: gpio: Add gpio-cdev-uaf tests
Date: Tue,  3 Feb 2026 06:10:53 +0000
Message-ID: <20260203061059.975605-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260203061059.975605-1-tzungbi@kernel.org>
References: <20260203061059.975605-1-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31376-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gpio-mockup.sh:url,pfds.events:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gpio-aggregator.sh:url,gpio-cdev-uaf.sh:url,gpio-sim.sh:url,gpio-mockup-sysfs.sh:url]
X-Rspamd-Queue-Id: F24DED51F7
X-Rspamd-Action: no action

Add tests for gpiolib-cdev to make sure accessing to dangling resources
via the opening file descriptor won't crash the system after the
underlying resource providers have gone.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
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
2.53.0.rc2.204.g2597b5adb4-goog


