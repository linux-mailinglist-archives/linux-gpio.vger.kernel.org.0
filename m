Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B7148AE89
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 14:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240618AbiAKNha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 08:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240572AbiAKNha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 08:37:30 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5B4C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:29 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l25so22153467wrb.13
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h8p80Tn6IMEQvSpV9M3jq2rt7b4lafUnGCFI66AEg9s=;
        b=xgRGjqhVI/1VZqgNPFjDggRAZmJLDTFkuIBPeaD0JiY6r9CuBbhe2x6oLZH3HUbRxM
         9zD/P+H3nUDqKcxi6eQ9XIvWVjrrraMfXnb2T8piQCQhNiaEvC8okYOnMBOPeOm2wrRv
         VHoGviPIVfvn4jtsu3ycz93rbcdr/fMRNno1tSsaTBrmdG/6A1Q9y4iBpR0E8y3wy8XA
         Xdb30yfCWyQ0Na/godR4exn5HgHsIge2Id2DxyAJe9Fn7beoJyUIxM08K7ekNCLP4Q4E
         cYi8ZQct4ZNXbzz+j2QOFJw7Gmhy18K+g+jpWesOAS+QbApsSXJOORPw9IXKHv8tBi3D
         E4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h8p80Tn6IMEQvSpV9M3jq2rt7b4lafUnGCFI66AEg9s=;
        b=Lcf4JDqu9yNSU6j2EKpDb34LgjkHisDlo9sOu1BzCZBK14U6Tj5T3HIMx6MoLvS8M7
         +wR0VbV5Pw8FY7Z9nBMfi5tRl9B+lblgjFrmQyCa3RBNTFCWDPDTu2doa8hv5MU7VIxE
         W3lT9kukZsqxzTKpPqA6cpFFUY/t6skaN57LYa4gY09n90LbST2JY9MBVuTtso9h0sgw
         ruaqIfC7+Yz7LW1wJlVm5b3eXXdNUGppRmc/tacPNt7ietdMvsOH/VSK0RMryShJ5f8W
         Qe3qvIn6tDafbMHs3sEDN0fXwAqSKzc08FhHM+2+4uRGcPr91XK/kmS8OEKeqZVXzY78
         mxtg==
X-Gm-Message-State: AOAM533/SjJbMCqdO5NQZUqpprgmeE3WrnhqYZi9ElMz6cLky2aG3dXR
        38B87z5bXzqVJ2SBtW6HaF17Xg==
X-Google-Smtp-Source: ABdhPJyw/06MoaCRxCCw8L1D5bLPRxDFeOJiaLHVCbhSiIohFPM3SE/mTFOi3AhSd22rRjDYWzpzRA==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr3784099wro.501.1641908248143;
        Tue, 11 Jan 2022 05:37:28 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f9sm1976186wry.115.2022.01.11.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 05:37:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/2] libgpiosim: new library for controlling the gpio-sim module
Date:   Tue, 11 Jan 2022 14:37:19 +0100
Message-Id: <20220111133720.713541-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220111133720.713541-1-brgl@bgdev.pl>
References: <20220111133720.713541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a C library for controlling the gpio-sim kernel module from various
libgpiod test suites. This aims at replacing the old gpio-mockup module
and its user-space library - libgpio-mockup - in the project's tree.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 configure.ac                     |    7 +-
 tests/Makefile.am                |    4 +-
 tests/gpiosim/.gitignore         |    4 +
 tests/gpiosim/Makefile.am        |   16 +
 tests/gpiosim/gpiosim-selftest.c |  157 +++++
 tests/gpiosim/gpiosim.c          | 1009 ++++++++++++++++++++++++++++++
 tests/gpiosim/gpiosim.h          |   64 ++
 7 files changed, 1257 insertions(+), 4 deletions(-)
 create mode 100644 tests/gpiosim/.gitignore
 create mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/gpiosim-selftest.c
 create mode 100644 tests/gpiosim/gpiosim.c
 create mode 100644 tests/gpiosim/gpiosim.h

diff --git a/configure.ac b/configure.ac
index ce6de99..8e74104 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 AC_PREREQ([2.69])
 
@@ -31,6 +31,7 @@ AC_SUBST(ABI_CXX_VERSION, [2.1.1])
 # ABI version for libgpiomockup (we need this since it can be installed if we
 # enable install-tests).
 AC_SUBST(ABI_MOCKUP_VERSION, [0.1.0])
+AC_SUBST(ABI_GPIOSIM_VERSION, [0.1.0])
 
 AC_CONFIG_AUX_DIR([autostuff])
 AC_CONFIG_MACRO_DIRS([m4])
@@ -126,10 +127,11 @@ AC_DEFUN([FUNC_NOT_FOUND_TESTS],
 
 if test "x$with_tests" = xtrue
 then
-	# For libgpiomockup
+	# For libgpiomockup & libgpiosim
 	AC_CHECK_FUNC([qsort], [], [FUNC_NOT_FOUND_TESTS([qsort])])
 	PKG_CHECK_MODULES([KMOD], [libkmod >= 18])
 	PKG_CHECK_MODULES([UDEV], [libudev >= 215])
+	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
 
 	# For core library tests
 	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
@@ -224,6 +226,7 @@ AC_CONFIG_FILES([Makefile
 		 tools/Makefile
 		 tests/Makefile
 		 tests/mockup/Makefile
+		 tests/gpiosim/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 43b215e..8a3d7c9 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = mockup
+SUBDIRS = mockup gpiosim
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/mockup/
 AM_CFLAGS += -include $(top_builddir)/config.h
diff --git a/tests/gpiosim/.gitignore b/tests/gpiosim/.gitignore
new file mode 100644
index 0000000..5731644
--- /dev/null
+++ b/tests/gpiosim/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+gpiosim-selftest
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
new file mode 100644
index 0000000..ab5838a
--- /dev/null
+++ b/tests/gpiosim/Makefile.am
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+lib_LTLIBRARIES = libgpiosim.la
+noinst_PROGRAMS = gpiosim-selftest
+
+AM_CFLAGS = -Wall -Wextra -g -fvisibility=hidden -std=gnu89
+AM_CFLAGS += -include $(top_builddir)/config.h
+
+libgpiosim_la_SOURCES = gpiosim.c gpiosim.h
+libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
+libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
+libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS)
+
+gpiosim_selftest_SOURCES = gpiosim-selftest.c
+gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
new file mode 100644
index 0000000..205580d
--- /dev/null
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "gpiosim.h"
+
+#define UNUSED __attribute__((unused))
+
+static const char *const line_names[] = {
+	"foo",
+	"bar",
+	"foobar",
+	NULL,
+	"barfoo",
+};
+
+int main(int argc UNUSED, char **argv UNUSED)
+{
+	struct gpiosim_bank *bank0, *bank1;
+	struct gpiosim_dev *dev;
+	struct gpiosim_ctx *ctx;
+	int ret, i;
+
+	printf("Creating gpiosim context\n");
+
+	ctx = gpiosim_ctx_new();
+	if (!ctx) {
+		perror("unable to create the gpios-sim context");
+		return EXIT_FAILURE;
+	}
+
+	printf("Creating a chip with random name\n");
+
+	dev = gpiosim_dev_new(ctx, NULL);
+	if (!dev) {
+		perror("Unable to create a chip with random name");
+		return EXIT_FAILURE;
+	}
+
+	printf("Creating a bank with a random name\n");
+
+	bank0 = gpiosim_bank_new(dev, NULL);
+	if (!bank0) {
+		perror("Unable to create a bank with random name");
+		return EXIT_FAILURE;
+	}
+
+	printf("Creating a bank with a specific name\n");
+
+	bank1 = gpiosim_bank_new(dev, "foobar");
+	if (!bank1) {
+		perror("Unable to create a bank with a specific name");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the label of bank #2 to foobar\n");
+
+	ret = gpiosim_bank_set_label(bank1, "foobar");
+	if (ret) {
+		perror("Unable to set the label of bank #2");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the number of lines in bank #1 to 16\n");
+
+	ret = gpiosim_bank_set_num_lines(bank0, 16);
+	if (ret) {
+		perror("Unable to set the number of lines");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the number of lines in bank #2 to 8\n");
+
+	ret = gpiosim_bank_set_num_lines(bank1, 8);
+	if (ret) {
+		perror("Unable to set the number of lines");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting names for some lines in bank #1\n");
+
+	for (i = 0; i < 5; i++) {
+		ret = gpiosim_bank_set_line_name(bank0, i, line_names[i]);
+		if (ret) {
+			perror("Unable to set line names");
+			return EXIT_FAILURE;
+		}
+	}
+
+	printf("Hog a line on bank #2\n");
+
+	ret = gpiosim_bank_hog_line(bank1, 3, "xyz",
+				    GPIOSIM_HOG_DIR_OUTPUT_HIGH);
+	if (ret) {
+		perror("Unable to hog a line");
+		return EXIT_FAILURE;
+	}
+
+	printf("Enabling the GPIO device\n");
+
+	ret = gpiosim_dev_enable(dev);
+	if (ret) {
+		perror("Unable to enable the device");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the pull of a single line to pull-up\n");
+
+	ret = gpiosim_bank_set_pull(bank0, 6, GPIOSIM_PULL_UP);
+	if (ret) {
+		perror("Unable to set the pull");
+		return EXIT_FAILURE;
+	}
+
+	printf("Reading the pull back\n");
+
+	ret = gpiosim_bank_get_pull(bank0, 6);
+	if (ret < 0) {
+		perror("Unable to read the pull");
+		return EXIT_FAILURE;
+	}
+
+	if (ret != GPIOSIM_PULL_UP) {
+		fprintf(stderr, "Invalid pull value read\n");
+		return EXIT_FAILURE;
+	}
+
+	printf("Reading the value\n");
+
+	ret = gpiosim_bank_get_value(bank0, 6);
+	if (ret < 0) {
+		perror("Unable to read the value");
+		return EXIT_FAILURE;
+	}
+
+	if (ret != 1) {
+		fprintf(stderr, "Invalid value read\n");
+		return EXIT_FAILURE;
+	}
+
+	printf("Disabling the GPIO device\n");
+
+	ret = gpiosim_dev_disable(dev);
+	if (ret) {
+		perror("Error while disabling the device");
+		return EXIT_FAILURE;
+	}
+
+	gpiosim_bank_unref(bank1);
+	gpiosim_bank_unref(bank0);
+	gpiosim_dev_unref(dev);
+	gpiosim_ctx_unref(ctx);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
new file mode 100644
index 0000000..60a3e50
--- /dev/null
+++ b/tests/gpiosim/gpiosim.c
@@ -0,0 +1,1009 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <libkmod.h>
+#include <libmount.h>
+#include <linux/version.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/random.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/utsname.h>
+#include <unistd.h>
+
+#include "gpiosim.h"
+
+#define GPIOSIM_API		__attribute__((visibility("default")))
+#define ARRAY_SIZE(x)		(sizeof(x) / sizeof(*(x)))
+#define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 15, 0)
+
+struct refcount {
+	unsigned int cnt;
+	void (*release)(struct refcount *);
+};
+
+static void refcount_init(struct refcount *ref,
+			  void (*release)(struct refcount *))
+{
+	ref->cnt = 1;
+	ref->release = release;
+}
+
+static void refcount_inc(struct refcount *ref)
+{
+	ref->cnt++;
+}
+
+static void refcount_dec(struct refcount *ref)
+{
+	ref->cnt--;
+
+	if (!ref->cnt)
+		ref->release(ref);
+}
+
+struct list_head {
+	struct list_head *prev;
+	struct list_head *next;
+};
+
+static void list_init(struct list_head *list)
+{
+	list->next = list;
+	list->prev = list;
+}
+
+static void list_add(struct list_head *new, struct list_head *head)
+{
+	struct list_head *prev = head->prev;
+
+	head->prev = new;
+	new->next = head;
+	new->prev = prev;
+	prev->next = new;
+}
+
+static void list_del(struct list_head *entry)
+{
+	struct list_head *prev = entry->prev, *next = entry->next;
+
+	prev->next = next;
+	next->prev = prev;
+}
+
+#define container_of(ptr, type, member) ({ \
+	void *__mptr = (void *)(ptr); \
+	((type *)(__mptr - offsetof(type, member))); \
+})
+
+#define list_entry(ptr, type, member) \
+	container_of(ptr, type, member)
+
+#define list_first_entry(ptr, type, member) \
+	list_entry((ptr)->next, type, member)
+
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
+
+#define list_entry_is_head(pos, head, member) \
+	(&pos->member == (head))
+
+#define list_for_each_entry(pos, head, member) \
+	for (pos = list_first_entry(head, typeof(*pos), member); \
+	     !list_entry_is_head(pos, head, member); \
+	     pos = list_next_entry(pos, member))
+
+static int open_write_close(int base_fd, const char *where, const char *what)
+{
+	ssize_t written, size = strlen(what) + 1;
+	int fd;
+
+	fd = openat(base_fd, where, O_WRONLY);
+	if (fd < 0)
+		return -1;
+
+	written = write(fd, what, size);
+	close(fd);
+	if (written < 0) {
+		return -1;
+	} else if (written != size) {
+		errno = EIO;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int open_read_close(int base_fd, const char *where,
+			   char *buf, size_t bufsize)
+{
+	ssize_t rd;
+	int fd;
+
+	fd = openat(base_fd, where, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	memset(buf, 0, bufsize);
+	rd = read(fd, buf, bufsize);
+	close(fd);
+	if (rd < 0)
+		return -1;
+
+	if (buf[rd - 1] == '\n')
+		buf[rd - 1] = '\0';
+
+	return 0;
+}
+
+static int check_kernel_version(void)
+{
+	unsigned int major, minor, release;
+	struct utsname un;
+	int ret;
+
+	ret = uname(&un);
+	if (ret)
+		return -1;
+
+	ret = sscanf(un.release, "%u.%u.%u", &major, &minor, &release);
+	if (ret != 3) {
+		errno = EFAULT;
+		return -1;
+	}
+
+	if (KERNEL_VERSION(major, minor, release) < MIN_KERNEL_VERSION) {
+		errno = EOPNOTSUPP;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int check_gpiosim_module(void)
+{
+	struct kmod_module *module;
+	struct kmod_ctx *kmod;
+	const char *modpath;
+	int ret, initstate;
+
+	kmod = kmod_new(NULL, NULL);
+	if (!kmod)
+		return -1;
+
+	ret = kmod_module_new_from_name(kmod, "gpio-sim", &module);
+	if (ret)
+		goto out_unref_kmod;
+
+again:
+	/* First check if the module is already loaded or built-in. */
+	initstate = kmod_module_get_initstate(module);
+	if (initstate < 0) {
+		if (errno == ENOENT) {
+			/*
+			 * It's not loaded, let's see if we can do it manually.
+			 * See if we can find the module.
+			 */
+			modpath = kmod_module_get_path(module);
+			if (!modpath) {
+				/* libkmod doesn't set errno. */
+				errno = ENOENT;
+				ret = -1;
+				goto out_unref_module;
+			}
+
+			ret = kmod_module_probe_insert_module(module,
+						KMOD_PROBE_IGNORE_LOADED,
+						NULL, NULL, NULL, NULL);
+			if (ret)
+				goto out_unref_module;
+
+			goto again;
+		} else {
+			if (errno == 0)
+				errno = EOPNOTSUPP;
+
+			goto out_unref_module;
+		}
+	}
+
+	if (initstate != KMOD_MODULE_BUILTIN &&
+	    initstate != KMOD_MODULE_LIVE &&
+	    initstate != KMOD_MODULE_COMING) {
+		errno = EPERM;
+		goto out_unref_module;
+	}
+
+	ret = 0;
+
+out_unref_module:
+	kmod_module_unref(module);
+out_unref_kmod:
+	kmod_unref(kmod);
+	return ret;
+}
+
+/* We don't have mkdtempat()... :( */
+static char *make_random_dir_at(int at)
+{
+	static const char chars[] = "abcdefghijklmnoprstquvwxyz"
+				    "ABCDEFGHIJKLMNOPRSTQUVWXYZ"
+				    "0123456789";
+
+	char name[] = "XXXXXXXXXXXX\0";
+	unsigned int idx, i;
+	int ret;
+
+again:
+	for (i = 0; i < sizeof(name) - 1; i++) {
+		ret = getrandom(&idx, sizeof(idx), GRND_NONBLOCK);
+		if (ret != sizeof(idx)) {
+			if (ret >= 0)
+				errno = EAGAIN;
+
+			return NULL;
+		}
+
+		name[i] = chars[idx % (ARRAY_SIZE(chars) - 1)];
+	}
+
+	ret = mkdirat(at, name, 0600);
+	if (ret) {
+		if (errno == EEXIST)
+			goto again;
+
+		return NULL;
+	}
+
+	return strdup(name);
+}
+
+static char *configfs_make_item_name(int at, const char *name)
+{
+	char *item_name;
+	int ret;
+
+	if (name) {
+		item_name = strdup(name);
+		if (!item_name)
+			return NULL;
+
+		ret = mkdirat(at, item_name, 0600);
+		if (ret) {
+			free(item_name);
+			return NULL;
+		}
+	} else {
+		item_name = make_random_dir_at(at);
+		if (!item_name)
+			return NULL;
+	}
+
+	return item_name;
+}
+
+struct gpiosim_ctx {
+	struct refcount refcnt;
+	int cfs_dir_fd;
+	char *cfs_mnt_dir;
+};
+
+struct gpiosim_dev {
+	struct refcount refcnt;
+	struct gpiosim_ctx *ctx;
+	bool live;
+	char *item_name;
+	char *dev_name;
+	int cfs_dir_fd;
+	int sysfs_dir_fd;
+	struct list_head banks;
+};
+
+struct gpiosim_bank {
+	struct refcount refcnt;
+	struct gpiosim_dev *dev;
+	struct list_head siblings;
+	char *item_name;
+	char *chip_name;
+	char *dev_path;
+	int cfs_dir_fd;
+	int sysfs_dir_fd;
+	unsigned int num_lines;
+};
+
+static int ctx_open_configfs_dir(struct gpiosim_ctx *ctx, const char *cfs_path)
+{
+	char *path;
+	int ret;
+
+	ret = asprintf(&path, "%s/gpio-sim", cfs_path);
+	if (ret < 0)
+		return -1;
+
+	ctx->cfs_dir_fd = open(path, O_RDONLY);
+	free(path);
+	if (ctx->cfs_dir_fd < 0)
+		return -1;
+
+	return 0;
+}
+
+/*
+ * We don't need to check the configfs module as loading gpio-sim will pull it
+ * in but we need to find out if and where configfs was mounted. If it wasn't
+ * then as a last resort we'll try to mount it ourselves.
+ */
+static int ctx_get_configfs_fd(struct gpiosim_ctx *ctx)
+{
+	struct libmnt_context *mntctx;
+	struct libmnt_iter *iter;
+	struct libmnt_table *tb;
+	struct libmnt_fs *fs;
+	const char *type;
+	int ret;
+
+	/* Try to find out if and where configfs is mounted. */
+	mntctx = mnt_new_context();
+	if (!mntctx)
+		return -1;
+
+	ret = mnt_context_get_mtab(mntctx, &tb);
+	if (ret)
+		goto out_free_ctx;
+
+	iter = mnt_new_iter(MNT_ITER_FORWARD);
+	if (!iter)
+		goto out_free_ctx;
+
+	while (mnt_table_next_fs(tb, iter, &fs) == 0) {
+		type = mnt_fs_get_fstype(fs);
+
+		if (strcmp(type, "configfs") == 0) {
+			ret = ctx_open_configfs_dir(ctx, mnt_fs_get_target(fs));
+			if (ret)
+				goto out_free_iter;
+
+			ret = 0;
+			goto out_free_iter;
+		}
+	}
+
+	/* Didn't find any configfs mounts - let's try to do it ourselves. */
+	ctx->cfs_mnt_dir = strdup("/tmp/gpiosim-configfs-XXXXXX");
+	if (!ctx->cfs_mnt_dir)
+		goto out_free_iter;
+
+	ctx->cfs_mnt_dir = mkdtemp(ctx->cfs_mnt_dir);
+	if (!ctx->cfs_mnt_dir)
+		goto out_free_tmpdir;
+
+	ret = mount(NULL, ctx->cfs_mnt_dir, "configfs", MS_RELATIME, NULL);
+	if (ret)
+		goto out_rm_tmpdir;
+
+	ret = ctx_open_configfs_dir(ctx, ctx->cfs_mnt_dir);
+	if (ret == 0)
+		/* Skip unmounting & deleting the tmp directory on success. */
+		goto out_free_iter;
+
+	umount(ctx->cfs_mnt_dir);
+out_rm_tmpdir:
+	rmdir(ctx->cfs_mnt_dir);
+out_free_tmpdir:
+	free(ctx->cfs_mnt_dir);
+	ctx->cfs_mnt_dir = NULL;
+out_free_iter:
+	mnt_free_iter(iter);
+out_free_ctx:
+	mnt_free_context(mntctx);
+
+	return ret;
+}
+
+static void ctx_release(struct refcount *ref)
+{
+	struct gpiosim_ctx *ctx = container_of(ref, struct gpiosim_ctx, refcnt);
+
+	close(ctx->cfs_dir_fd);
+
+	if (ctx->cfs_mnt_dir) {
+		umount(ctx->cfs_mnt_dir);
+		rmdir(ctx->cfs_mnt_dir);
+		free(ctx->cfs_mnt_dir);
+	}
+
+	free(ctx);
+}
+
+GPIOSIM_API struct gpiosim_ctx *gpiosim_ctx_new(void)
+{
+	struct gpiosim_ctx *ctx;
+	int ret;
+
+	ret = check_kernel_version();
+	if (ret)
+		return NULL;
+
+	ret = check_gpiosim_module();
+	if (ret)
+		return NULL;
+
+	ctx = malloc(sizeof(*ctx));
+	if (!ctx)
+		return NULL;
+
+	memset(ctx, 0, sizeof(*ctx));
+	refcount_init(&ctx->refcnt, ctx_release);
+
+	ret = ctx_get_configfs_fd(ctx);
+	if (ret) {
+		free(ctx);
+		return NULL;
+	}
+
+	return ctx;
+}
+
+GPIOSIM_API struct gpiosim_ctx *gpiosim_ctx_ref(struct gpiosim_ctx *ctx)
+{
+	refcount_inc(&ctx->refcnt);
+
+	return ctx;
+}
+
+GPIOSIM_API void gpiosim_ctx_unref(struct gpiosim_ctx *ctx)
+{
+	refcount_dec(&ctx->refcnt);
+}
+
+static void dev_release(struct refcount *ref)
+{
+	struct gpiosim_dev *dev = container_of(ref, struct gpiosim_dev, refcnt);
+	struct gpiosim_ctx *ctx = dev->ctx;
+
+	if (dev->live)
+		gpiosim_dev_disable(dev);
+
+	unlinkat(ctx->cfs_dir_fd, dev->item_name, AT_REMOVEDIR);
+	close(dev->cfs_dir_fd);
+	free(dev->dev_name);
+	free(dev->item_name);
+	gpiosim_ctx_unref(ctx);
+	free(dev);
+}
+
+GPIOSIM_API struct gpiosim_dev *
+gpiosim_dev_new(struct gpiosim_ctx *ctx, const char *name)
+{
+	struct gpiosim_dev *dev;
+	int configfs_fd, ret;
+	char devname[128];
+	char *item_name;
+
+	item_name = configfs_make_item_name(ctx->cfs_dir_fd, name);
+	if (!item_name)
+		return NULL;
+
+	configfs_fd = openat(ctx->cfs_dir_fd, item_name, O_RDONLY);
+	if (configfs_fd < 0)
+		goto err_unlink;
+
+	dev = malloc(sizeof(*dev));
+	if (!dev)
+		goto err_close_fd;
+
+	ret = open_read_close(configfs_fd, "dev_name",
+			      devname, sizeof(devname));
+	if (ret)
+		goto err_free_dev;
+
+	memset(dev, 0, sizeof(*dev));
+	refcount_init(&dev->refcnt, dev_release);
+	list_init(&dev->banks);
+	dev->cfs_dir_fd = configfs_fd;
+	dev->sysfs_dir_fd = -1;
+	dev->item_name = item_name;
+
+	dev->dev_name = strdup(devname);
+	if (!dev->dev_name)
+		goto err_free_dev;
+
+	dev->ctx = gpiosim_ctx_ref(ctx);
+
+	return dev;
+
+err_free_dev:
+	free(dev);
+err_close_fd:
+	close(configfs_fd);
+err_unlink:
+	unlinkat(ctx->cfs_dir_fd, item_name, AT_REMOVEDIR);
+	free(item_name);
+
+	return NULL;
+}
+
+GPIOSIM_API struct gpiosim_dev *gpiosim_dev_ref(struct gpiosim_dev *dev)
+{
+	refcount_inc(&dev->refcnt);
+
+	return dev;
+}
+
+GPIOSIM_API void gpiosim_dev_unref(struct gpiosim_dev *dev)
+{
+	refcount_dec(&dev->refcnt);
+}
+
+GPIOSIM_API const char *gpiosim_dev_get_name(struct gpiosim_dev *dev)
+{
+	return dev->dev_name;
+}
+
+static bool dev_check_pending(struct gpiosim_dev *dev)
+{
+	if (dev->live)
+		errno = EBUSY;
+
+	return !dev->live;
+}
+
+static bool dev_check_live(struct gpiosim_dev *dev)
+{
+	if (!dev->live)
+		errno = ENODEV;
+
+	return dev->live;
+}
+
+static int bank_set_chip_name(struct gpiosim_bank *bank)
+{
+	char chip_name[32];
+	int ret;
+
+	ret = open_read_close(bank->cfs_dir_fd, "chip_name",
+			      chip_name, sizeof(chip_name));
+	if (ret)
+		return -1;
+
+	bank->chip_name = strdup(chip_name);
+	if (!bank->chip_name)
+		return -1;
+
+	return 0;
+}
+
+static int bank_set_dev_path(struct gpiosim_bank *bank)
+{
+	char dev_path[64];
+
+	snprintf(dev_path, sizeof(dev_path), "/dev/%s", bank->chip_name);
+
+	bank->dev_path = strdup(dev_path);
+	if (!bank->dev_path)
+		return -1;
+
+	return 0;
+}
+
+static int bank_open_sysfs_dir(struct gpiosim_bank *bank)
+{
+	struct gpiosim_dev *dev = bank->dev;
+	int fd;
+
+	fd = openat(dev->sysfs_dir_fd, bank->chip_name, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	bank->sysfs_dir_fd = fd;
+
+	return 0;
+}
+
+static int bank_enable(struct gpiosim_bank *bank)
+{
+	int ret;
+
+	ret = bank_set_chip_name(bank);
+	if (ret)
+		return -1;
+
+	ret = bank_set_dev_path(bank);
+	if (ret)
+		return -1;
+
+	return bank_open_sysfs_dir(bank);
+}
+
+static int dev_open_sysfs_dir(struct gpiosim_dev *dev)
+{
+	int ret, fd;
+	char *sysp;
+
+	ret = asprintf(&sysp, "/sys/devices/platform/%s", dev->dev_name);
+	if (ret < 0)
+		return -1;
+
+	fd = open(sysp, O_RDONLY);
+	free(sysp);
+	if (fd < 0)
+		return -1;
+
+	dev->sysfs_dir_fd = fd;
+
+	return 0;
+}
+
+/* Closes the sysfs dir for this device and all its child banks. */
+static void dev_close_sysfs_dirs(struct gpiosim_dev *dev)
+{
+	struct gpiosim_bank *bank;
+
+	list_for_each_entry(bank, &dev->banks, siblings) {
+		free(bank->chip_name);
+		free(bank->dev_path);
+		bank->chip_name = bank->dev_path = NULL;
+
+		if (bank->sysfs_dir_fd < 0)
+			break;
+
+		close(bank->sysfs_dir_fd);
+		bank->sysfs_dir_fd = -1;
+	}
+
+	close(dev->sysfs_dir_fd);
+	dev->sysfs_dir_fd = -1;
+}
+
+GPIOSIM_API int gpiosim_dev_enable(struct gpiosim_dev *dev)
+{
+	struct gpiosim_bank *bank;
+	int ret;
+
+	if (!dev_check_pending(dev))
+		return -1;
+
+	ret = open_write_close(dev->cfs_dir_fd, "live", "1");
+	if (ret)
+		return -1;
+
+	ret = dev_open_sysfs_dir(dev);
+	if (ret) {
+		open_write_close(dev->cfs_dir_fd, "live", "0");
+		return -1;
+	}
+
+	bank = container_of(&dev->banks, struct gpiosim_bank, siblings);
+
+	list_for_each_entry(bank, &dev->banks, siblings) {
+		ret = bank_enable(bank);
+		if (ret) {
+			dev_close_sysfs_dirs(dev);
+			open_write_close(dev->cfs_dir_fd, "live", "0");
+			return -1;
+		}
+	}
+
+	dev->live = true;
+
+	return 0;
+}
+
+GPIOSIM_API int gpiosim_dev_disable(struct gpiosim_dev *dev)
+{
+	int ret;
+
+	if (!dev_check_live(dev))
+		return -1;
+
+	ret = open_write_close(dev->cfs_dir_fd, "live", "0");
+	if (ret)
+		return ret;
+
+	dev_close_sysfs_dirs(dev);
+
+	dev->live = false;
+
+	return 0;
+}
+
+static void bank_release(struct refcount *ref)
+{
+	struct gpiosim_bank *bank = container_of(ref, struct gpiosim_bank,
+						 refcnt);
+	struct gpiosim_dev *dev = bank->dev;
+	unsigned int i;
+	char buf[64];
+
+	for (i = 0; i < bank->num_lines; i++) {
+		snprintf(buf, sizeof(buf), "line%u/hog", i);
+		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+		snprintf(buf, sizeof(buf), "line%u", i);
+		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+	}
+
+	list_del(&bank->siblings);
+	unlinkat(dev->cfs_dir_fd, bank->item_name, AT_REMOVEDIR);
+	gpiosim_dev_unref(dev);
+	close(bank->cfs_dir_fd);
+	free(bank->item_name);
+	free(bank);
+}
+
+GPIOSIM_API struct gpiosim_bank*
+gpiosim_bank_new(struct gpiosim_dev *dev, const char *name)
+{
+	struct gpiosim_bank *bank;
+	int configfs_fd;
+	char *item_name;
+
+	if (!dev_check_pending(dev))
+		return NULL;
+
+	item_name = configfs_make_item_name(dev->cfs_dir_fd, name);
+	if (!item_name)
+		return NULL;
+
+	configfs_fd = openat(dev->cfs_dir_fd, item_name, O_RDONLY);
+	if (configfs_fd < 0)
+		goto err_unlink;
+
+	bank = malloc(sizeof(*bank));
+	if (!bank)
+		goto err_close_cfs;
+
+	memset(bank, 0, sizeof(*bank));
+
+	refcount_init(&bank->refcnt, bank_release);
+	list_add(&bank->siblings, &dev->banks);
+	bank->cfs_dir_fd = configfs_fd;
+	bank->dev = gpiosim_dev_ref(dev);
+	bank->item_name = item_name;
+
+	return bank;
+
+err_close_cfs:
+	close(configfs_fd);
+err_unlink:
+	unlinkat(dev->cfs_dir_fd, item_name, AT_REMOVEDIR);
+
+	return NULL;
+}
+
+GPIOSIM_API struct gpiosim_bank *gpiosim_bank_ref(struct gpiosim_bank *bank)
+{
+	refcount_inc(&bank->refcnt);
+
+	return bank;
+}
+
+GPIOSIM_API void gpiosim_bank_unref(struct gpiosim_bank *bank)
+{
+	refcount_dec(&bank->refcnt);
+}
+
+GPIOSIM_API const char *gpiosim_bank_get_chip_name(struct gpiosim_bank *bank)
+{
+	return bank->chip_name;
+}
+
+GPIOSIM_API const char *gpiosim_bank_get_dev_path(struct gpiosim_bank *bank)
+{
+	return bank->dev_path;
+}
+
+GPIOSIM_API int gpiosim_bank_set_label(struct gpiosim_bank *bank,
+				       const char *label)
+{
+	if (!dev_check_pending(bank->dev))
+		return -1;
+
+	return open_write_close(bank->cfs_dir_fd, "label", label);
+}
+
+GPIOSIM_API int gpiosim_bank_set_num_lines(struct gpiosim_bank *bank,
+					   unsigned int num_lines)
+{
+	char buf[32];
+	int ret;
+
+	if (!dev_check_pending(bank->dev))
+		return -1;
+
+	snprintf(buf, sizeof(buf), "%u", num_lines);
+
+	ret = open_write_close(bank->cfs_dir_fd, "num_lines", buf);
+	if (ret)
+		return -1;
+
+	bank->num_lines = num_lines;
+
+	return 0;
+}
+
+/*
+ * Create a sub-directory under given bank's configfs directory. Do nothing
+ * if the directory exists and is writable. Mode is O_RDONLY.
+ */
+static int bank_mkdirat(struct gpiosim_bank *bank, const char *path)
+{
+	int ret;
+
+	ret = faccessat(bank->cfs_dir_fd, path, W_OK, 0);
+	if (ret) {
+		if (errno == ENOENT) {
+			ret = mkdirat(bank->cfs_dir_fd, path, O_RDONLY);
+			if (ret)
+				return -1;
+		} else {
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+GPIOSIM_API int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
+					   unsigned int offset,
+					   const char *name)
+{
+	char buf[32];
+	int ret, fd;
+
+	if (!dev_check_pending(bank->dev))
+		return -1;
+
+	snprintf(buf, sizeof(buf), "line%u", offset);
+
+	ret = bank_mkdirat(bank, buf);
+	if (ret)
+		return -1;
+
+	fd = openat(bank->cfs_dir_fd, buf, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	ret = open_write_close(fd, "name", name ?: "");
+	close(fd);
+	return ret;
+}
+
+GPIOSIM_API int gpiosim_bank_hog_line(struct gpiosim_bank *bank,
+				      unsigned int offset,
+				      const char *name, int direction)
+{
+	char buf[64], *dir;
+	int ret, fd;
+
+	switch (direction) {
+	case GPIOSIM_HOG_DIR_INPUT:
+		dir = "input";
+		break;
+	case GPIOSIM_HOG_DIR_OUTPUT_HIGH:
+		dir = "output-high";
+		break;
+	case GPIOSIM_HOG_DIR_OUTPUT_LOW:
+		dir = "output-low";
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!dev_check_pending(bank->dev))
+		return -1;
+
+	snprintf(buf, sizeof(buf), "line%u", offset);
+
+	ret = bank_mkdirat(bank, buf);
+	if (ret)
+		return -1;
+
+	snprintf(buf, sizeof(buf), "line%u/hog", offset);
+
+	ret = bank_mkdirat(bank, buf);
+	if (ret)
+		return -1;
+
+	fd = openat(bank->cfs_dir_fd, buf, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	ret = open_write_close(fd, "name", name ?: "");
+	if (ret) {
+		close(fd);
+		return -1;
+	}
+
+	ret = open_write_close(fd, "direction", dir);
+	close(fd);
+	return ret;
+}
+
+GPIOSIM_API int gpiosim_bank_clear_hog(struct gpiosim_bank *bank,
+				       unsigned int offset)
+{
+	char buf[64];
+
+	snprintf(buf, sizeof(buf), "line%u/hog", offset);
+
+	return unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+}
+
+static int sysfs_read_bank_attr(struct gpiosim_bank *bank, unsigned int offset,
+				const char *attr, char *buf,
+				unsigned int bufsize)
+{
+	struct gpiosim_dev *dev = bank->dev;
+	char where[32];
+
+	if (!dev_check_live(dev))
+		return -1;
+
+	snprintf(where, sizeof(where), "sim_gpio%u/%s", offset, attr);
+
+	return open_read_close(bank->sysfs_dir_fd, where, buf, bufsize);
+}
+
+GPIOSIM_API int gpiosim_bank_get_value(struct gpiosim_bank *bank,
+				       unsigned int offset)
+{
+	char what[3];
+	int ret;
+
+	ret = sysfs_read_bank_attr(bank, offset, "value", what, sizeof(what));
+	if (ret)
+		return ret;
+
+	if (what[0] == '0')
+		return 0;
+	if (what[0] == '1')
+		return 1;
+
+	errno = EIO;
+	return -1;
+}
+
+GPIOSIM_API int gpiosim_bank_get_pull(struct gpiosim_bank *bank,
+				      unsigned int offset)
+{
+	char what[16];
+	int ret;
+
+	ret = sysfs_read_bank_attr(bank, offset, "pull", what, sizeof(what));
+	if (ret)
+		return ret;
+
+	if (strcmp(what, "pull-down") == 0)
+		return GPIOSIM_PULL_DOWN;
+	if (strcmp(what, "pull-up") == 0)
+		return GPIOSIM_PULL_UP;
+
+	errno = EIO;
+	return -1;
+}
+
+GPIOSIM_API int gpiosim_bank_set_pull(struct gpiosim_bank *bank,
+				      unsigned int offset, int pull)
+{
+	struct gpiosim_dev *dev = bank->dev;
+	char where[32], what[16];
+
+	if (!dev_check_live(dev))
+		return -1;
+
+	if (pull != GPIOSIM_PULL_DOWN && pull != GPIOSIM_PULL_UP) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	snprintf(where, sizeof(where), "sim_gpio%u/pull", offset);
+	snprintf(what, sizeof(what),
+		 pull == GPIOSIM_PULL_DOWN ? "pull-down" : "pull-up");
+
+	return open_write_close(bank->sysfs_dir_fd, where, what);
+}
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
new file mode 100644
index 0000000..6cb71de
--- /dev/null
+++ b/tests/gpiosim/gpiosim.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_GPIOSIM_H__
+#define __GPIOD_GPIOSIM_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+struct gpiosim_ctx;
+struct gpiosim_dev;
+struct gpiosim_bank;
+
+enum {
+	GPIOSIM_PULL_DOWN = 1,
+	GPIOSIM_PULL_UP,
+};
+
+enum {
+	GPIOSIM_HOG_DIR_INPUT = 1,
+	GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+	GPIOSIM_HOG_DIR_OUTPUT_LOW,
+};
+
+struct gpiosim_ctx *gpiosim_ctx_new(void);
+struct gpiosim_ctx *gpiosim_ctx_ref(struct gpiosim_ctx *ctx);
+void gpiosim_ctx_unref(struct gpiosim_ctx *ctx);
+
+struct gpiosim_dev *
+gpiosim_dev_new(struct gpiosim_ctx *ctx, const char *name);
+struct gpiosim_dev *gpiosim_dev_ref(struct gpiosim_dev *dev);
+void gpiosim_dev_unref(struct gpiosim_dev *dev);
+const char *gpiosim_dev_get_name(struct gpiosim_dev *dev);
+
+int gpiosim_dev_enable(struct gpiosim_dev *dev);
+int gpiosim_dev_disable(struct gpiosim_dev *dev);
+
+struct gpiosim_bank*
+gpiosim_bank_new(struct gpiosim_dev *dev, const char *name);
+struct gpiosim_bank *gpiosim_bank_ref(struct gpiosim_bank *bank);
+void gpiosim_bank_unref(struct gpiosim_bank *bank);
+const char *gpiosim_bank_get_chip_name(struct gpiosim_bank *bank);
+const char *gpiosim_bank_get_dev_path(struct gpiosim_bank *bank);
+
+int gpiosim_bank_set_label(struct gpiosim_bank *bank, const char *label);
+int gpiosim_bank_set_num_lines(struct gpiosim_bank *bank,
+			       unsigned int num_lines);
+int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
+			       unsigned int offset, const char *name);
+int gpiosim_bank_hog_line(struct gpiosim_bank *bank, unsigned int offset,
+			  const char *name, int direction);
+int gpiosim_bank_clear_hog(struct gpiosim_bank *bank, unsigned int offset);
+
+int gpiosim_bank_get_value(struct gpiosim_bank *bank, unsigned int offset);
+int gpiosim_bank_get_pull(struct gpiosim_bank *bank, unsigned int offset);
+int gpiosim_bank_set_pull(struct gpiosim_bank *bank,
+			  unsigned int offset, int pull);
+
+#ifdef __cplusplus
+} /* extern "C" */
+#endif
+
+#endif /* __GPIOD_GPIOSIM_H__ */
-- 
2.30.1

