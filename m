Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03D736E82E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 11:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbhD2Jsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 05:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2Jsa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 05:48:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB379C06138B
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:42 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x5so15926113wrv.13
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVB4u4MAAXR/zcjuQ67DXb4v0/xTY/muAtgeR8vGm6o=;
        b=d+2iJHwx8CAuuf9G6GlvQsP6NaIMrw6qCwWf1RkntB69YZGbN/8oVtS4J6fQ8OTOuf
         +j5Sl5wwbXn3Gz6xKcW6mHBENlpi3iV4dJ7Rh8YT5bAJbBbifSvcuQTQ2s5q/F7racVf
         /oyjnMDj+yPNEfYEznYmnVpeMwn/oDo22wzplLjDs+3BopehtlIaDT40Op3iMRQOrRZ9
         mv7CZRJoKYUNK6kTX/WR2UVULAIr+sAWT95Tr4doCpkzeSF52BPtRYpsLRHvKGNTl/Uz
         EJM3XVldc2dTtg4xL4gg8GGXm+xEHciKV7tCwuKB97qwMgULmks/WdHPerZ1ETtk1Wvo
         nOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVB4u4MAAXR/zcjuQ67DXb4v0/xTY/muAtgeR8vGm6o=;
        b=JFMmwvJN9ha9w3KAinU1TsKUYA83auyFdqovacPOyCLexBn2bH5/3Cl0Zulxnp+UMY
         vcB8f9yx6LE4Ov5OoiEhrWlfrqb2nFy8Zc3mHvUn1mY+Xg1kmPSHMh7MT1LKZVEcQQlt
         Bnq7NkmdKc1O4RsG36kyOMLTwfA6w+5g7mfmbYNjCka+rmtUKL09g893gx8KHRl5aXkW
         OLh+QZXeXasWV2pV1pBfDwOadDpONzvPy4LirwIr91anN0rlrnnyfhT3oHYd+vUMHwwn
         SOo8Bsrmdnk/34RipxUK6JmP82srvfEQKv8URxoQsBMBAYAzO64YNJIyAU2Na7KdxNHf
         ei1w==
X-Gm-Message-State: AOAM532QNJHCQ6Lp4Lxjk/BWIRh126581Om8yvdbmIPgR+hxPO4V6eIR
        Gnm8MkC8eJuIdEV7OeSv0XjVSA==
X-Google-Smtp-Source: ABdhPJztSdBz6OxX0Y/Rz8Rqo/I3i0BnqykkwY2wNoRHG2piUqi/lI1a6KwhLPxieYlttwzefuH8lg==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr28085979wro.113.1619689661509;
        Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id j22sm4101247wra.46.2021.04.29.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling the gpio-sim module
Date:   Thu, 29 Apr 2021 11:47:33 +0200
Message-Id: <20210429094734.9585-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210429094734.9585-1-brgl@bgdev.pl>
References: <20210429094734.9585-1-brgl@bgdev.pl>
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
 configure.ac                     |   5 +-
 tests/Makefile.am                |   2 +-
 tests/gpiosim/.gitignore         |   4 +
 tests/gpiosim/Makefile.am        |  16 +
 tests/gpiosim/gpiosim-selftest.c | 103 +++++
 tests/gpiosim/gpiosim.c          | 743 +++++++++++++++++++++++++++++++
 tests/gpiosim/gpiosim.h          |  42 ++
 7 files changed, 913 insertions(+), 2 deletions(-)
 create mode 100644 tests/gpiosim/.gitignore
 create mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/gpiosim-selftest.c
 create mode 100644 tests/gpiosim/gpiosim.c
 create mode 100644 tests/gpiosim/gpiosim.h

diff --git a/configure.ac b/configure.ac
index e0a917f..af8249c 100644
--- a/configure.ac
+++ b/configure.ac
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
index 43b215e..760aefa 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
-SUBDIRS = mockup
+SUBDIRS = mockup gpiosim
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/mockup/
 AM_CFLAGS += -include $(top_builddir)/config.h
diff --git a/tests/gpiosim/.gitignore b/tests/gpiosim/.gitignore
new file mode 100644
index 0000000..16b38d2
--- /dev/null
+++ b/tests/gpiosim/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+gpiosim-selftest
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
new file mode 100644
index 0000000..ca08f6e
--- /dev/null
+++ b/tests/gpiosim/Makefile.am
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+lib_LTLIBRARIES = libgpiosim.la
+noinst_PROGRAMS = gpiosim-selftest
+
+AM_CFLAGS = -Wall -Wextra -g -fvisibility=hidden -std=gnu89
+AM_CFLAGS += -include $(top_builddir)/config.h
+
+libgpiosim_la_SOURCES = gpiosim.c gpiosim.h
+libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(UDEV_CFLAGS) $(MOUNT_CFLAGS)
+libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
+libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(UDEV_LIBS) $(MOUNT_LIBS)
+
+gpiosim_selftest_SOURCES = gpiosim-selftest.c
+gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
new file mode 100644
index 0000000..db87dd8
--- /dev/null
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "gpiosim.h"
+
+#define UNUSED __attribute__((unused))
+
+static char *line_names[] = {
+	"foo",
+	"bar",
+	"foobar",
+	NULL,
+	"barfoo",
+};
+
+int main(int argc UNUSED, char **argv UNUSED)
+{
+	const char *devpath, *chip_name;
+	struct gpiosim_ctx *sim_ctx;
+	struct gpiosim_chip *chip;
+	int ret;
+
+	printf("Creating gpiosim context\n");
+
+	sim_ctx = gpiosim_ctx_new();
+	if (!sim_ctx) {
+		perror("unable to create the gpios-sim context");
+		return EXIT_FAILURE;
+	}
+
+	printf("Creating a chip with random name\n");
+
+	chip = gpiosim_chip_new(sim_ctx, NULL);
+	if (!chip) {
+		perror("Unable to create a chip with random name");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the number of lines to 16\n");
+
+	ret = gpiosim_chip_set_num_lines(chip, 16);
+	if (ret) {
+		perror("Unable to set the number of lines");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the chip label\n");
+
+	ret = gpiosim_chip_set_label(chip, "foobar");
+	if (ret) {
+		perror("Unable to set the chip label");
+		return EXIT_FAILURE;
+	}
+
+	printf("Setting the line names\n");
+
+	ret = gpiosim_chip_set_line_names(chip, 5, line_names);
+	if (ret) {
+		perror("Unable to set GPIO line names");
+		return EXIT_FAILURE;
+	}
+
+	printf("Committing the chip\n");
+
+	ret = gpiosim_chip_commit_sync(chip);
+	if (ret) {
+		perror("Unable to commit the chip");
+		return EXIT_FAILURE;
+	}
+
+	printf("Reading the device path\n");
+
+	devpath = gpiosim_chip_get_dev(chip);
+	if (!devpath) {
+		perror("Unable to read the device path");
+		return EXIT_FAILURE;
+	}
+
+	printf("The device path is: '%s'\n", devpath);
+	printf("Reading the chip name\n");
+
+	chip_name = gpiosim_chip_get_name(chip);
+	if (!chip_name) {
+		perror("Unable to read the chip name");
+		return EXIT_FAILURE;
+	}
+
+	printf("The chip name is: '%s'\n", chip_name);
+
+	ret = gpiosim_chip_uncommit(chip);
+	if (ret) {
+		perror("Unable to uncommit the chip");
+		return EXIT_FAILURE;
+	}
+
+	gpiosim_chip_unref(chip);
+	gpiosim_ctx_unref(sim_ctx);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
new file mode 100644
index 0000000..169ccc6
--- /dev/null
+++ b/tests/gpiosim/gpiosim.c
@@ -0,0 +1,743 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <libkmod.h>
+#include <libmount.h>
+#include <libudev.h>
+#include <linux/version.h>
+#include <poll.h>
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
+#define GPIOSIM_ARRAY_SIZE(x)	(sizeof(x) / sizeof(*(x)))
+/* FIXME Bump to 5.13 once released. */
+#define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 12, 0)
+
+struct gpiosim_ctx {
+	unsigned int refcnt;
+	int pending_dir_fd;
+	int live_dir_fd;
+	char *cfs_mnt_dir;
+};
+
+struct gpiosim_chip {
+	unsigned int refcnt;
+	struct gpiosim_ctx *ctx;
+	bool live;
+	char *item_name;
+	char *devname;
+	char *chipname;
+	char *devnode;
+	int configfs_dir_fd;
+	int sysfs_dir_fd;
+};
+
+static int check_kernel_version(void)
+{
+	unsigned int major, minor, release;
+	struct utsname un;
+	int rv;
+
+	rv = uname(&un);
+	if (rv)
+		return -1;
+
+	rv = sscanf(un.release, "%u.%u.%u", &major, &minor, &release);
+	if (rv != 3) {
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
+static int ctx_open_configfs_dirs(struct gpiosim_ctx *ctx, const char *cfs_path)
+{
+	int fd;
+
+	fd = open(cfs_path, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	ctx->pending_dir_fd = openat(fd, "gpio-sim/pending", O_RDONLY);
+	if (ctx->pending_dir_fd < 0) {
+		close(fd);
+		return -1;
+	}
+
+	ctx->live_dir_fd = openat(fd, "gpio-sim/live", O_RDONLY);
+	close(fd);
+	if (ctx->live_dir_fd < 0) {
+		close(ctx->pending_dir_fd);
+		return -1;
+	}
+
+	return 0;
+}
+
+/*
+ * We don't need to check the configfs module as loading gpio-sim will pull it
+ * in but we need to find out if and where configfs was mounted. If it wasn't
+ * then as a last resort we'll try to mount it ourselves.
+ */
+static int ctx_get_configfs_fds(struct gpiosim_ctx *ctx)
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
+			ret = ctx_open_configfs_dirs(ctx,
+						     mnt_fs_get_target(fs));
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
+	ret = ctx_open_configfs_dirs(ctx, ctx->cfs_mnt_dir);
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
+	ctx->refcnt = 1;
+
+	ret = ctx_get_configfs_fds(ctx);
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
+	ctx->refcnt++;
+	return ctx;
+}
+
+GPIOSIM_API void gpiosim_ctx_unref(struct gpiosim_ctx *ctx)
+{
+	if (--ctx->refcnt == 0) {
+		close(ctx->pending_dir_fd);
+		close(ctx->live_dir_fd);
+
+		if (ctx->cfs_mnt_dir) {
+			umount(ctx->cfs_mnt_dir);
+			rmdir(ctx->cfs_mnt_dir);
+			free(ctx->cfs_mnt_dir);
+		}
+
+		free(ctx);
+	}
+}
+
+static int open_write_close(int base_fd, const char *where, const char *what)
+{
+	ssize_t written, size = strlen(what);
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
+/* We don't have mkdtempat()... :( */
+static char *make_random_dir_at(int at)
+{
+	static const char chars[] = "abcdefghijklmnoprstquvwxyz"
+				    "ABCDEFGHIJKLMNOPRSTQUVWXYZ"
+				    "0123456789";
+	static const unsigned int namelen = 16;
+
+	unsigned int idx, i;
+	char *name;
+	int ret;
+
+	name = malloc(namelen);
+	if (!name)
+		return NULL;
+
+again:
+	for (i = 0; i < namelen; i++) {
+		ret = getrandom(&idx, sizeof(idx), GRND_NONBLOCK);
+		if (ret != sizeof(idx)) {
+			if (ret >= 0)
+				errno = EAGAIN;
+
+			free(name);
+			return NULL;
+		}
+
+		name[i] = chars[idx % (GPIOSIM_ARRAY_SIZE(chars) - 1)];
+	}
+
+	ret = mkdirat(at, name, 0600);
+	if (ret) {
+		if (errno == EEXIST)
+			goto again;
+
+		free(name);
+		return NULL;
+	}
+
+	return name;
+}
+
+GPIOSIM_API struct gpiosim_chip *
+gpiosim_chip_new(struct gpiosim_ctx *ctx, const char *item_name)
+{
+	struct gpiosim_chip *chip;
+	int configfs_fd, ret;
+	char devname[128];
+	char *name;
+
+	if (item_name) {
+		name = strdup(item_name);
+		if (!name)
+			return NULL;
+
+		ret = mkdirat(ctx->pending_dir_fd, name, 0600);
+		if (ret)
+			goto err_free_name;
+	} else {
+		name = make_random_dir_at(ctx->pending_dir_fd);
+		if (!name)
+			return NULL;
+	}
+
+	configfs_fd = openat(ctx->pending_dir_fd, name, O_RDONLY);
+	if (configfs_fd < 0)
+		goto err_unlink;
+
+	chip = malloc(sizeof(*chip));
+	if (!chip)
+		goto err_close_fd;
+
+	ret = open_read_close(configfs_fd, "dev_name",
+			      devname, sizeof(devname));
+	if (ret)
+		goto err_free_chip;
+
+	memset(chip, 0, sizeof(*chip));
+	chip->refcnt = 1;
+	chip->configfs_dir_fd = configfs_fd;
+	chip->sysfs_dir_fd = -1;
+	chip->item_name = name;
+
+	chip->devname = strdup(devname);
+	if (!chip->devname)
+		goto err_free_chip;
+
+	chip->ctx = gpiosim_ctx_ref(ctx);
+
+	return chip;
+
+err_free_chip:
+	free(chip);
+err_close_fd:
+	close(configfs_fd);
+err_unlink:
+	unlinkat(ctx->pending_dir_fd, name, AT_REMOVEDIR);
+err_free_name:
+	free(name);
+
+	return NULL;
+}
+
+GPIOSIM_API struct gpiosim_chip *gpiosim_chip_ref(struct gpiosim_chip *chip)
+{
+	chip->refcnt++;
+	return chip;
+}
+
+GPIOSIM_API void gpiosim_chip_unref(struct gpiosim_chip *chip)
+{
+	struct gpiosim_ctx *ctx = chip->ctx;
+
+	if (--chip->refcnt == 0) {
+		if (chip->live)
+			gpiosim_chip_uncommit(chip);
+
+		close(chip->configfs_dir_fd);
+		unlinkat(ctx->pending_dir_fd, chip->item_name, AT_REMOVEDIR);
+		free(chip->devname);
+		free(chip->item_name);
+		gpiosim_ctx_unref(ctx);
+		free(chip);
+	}
+}
+
+static bool chip_check_pending(struct gpiosim_chip *chip)
+{
+	if (chip->live)
+		errno = EBUSY;
+
+	return !chip->live;
+}
+
+static bool chip_check_live(struct gpiosim_chip *chip)
+{
+	if (!chip->live)
+		errno = ENODEV;
+
+	return chip->live;
+}
+
+GPIOSIM_API int gpiosim_chip_set_label(struct gpiosim_chip *chip,
+				       const char *label)
+{
+	if (!chip_check_pending(chip))
+		return -1;
+
+	return open_write_close(chip->configfs_dir_fd, "label", label);
+}
+
+GPIOSIM_API int gpiosim_chip_set_num_lines(struct gpiosim_chip *chip,
+					   unsigned int num_lines)
+{
+	char buf[32];
+
+	if (!chip_check_pending(chip))
+		return -1;
+
+	snprintf(buf, sizeof(buf), "%u", num_lines);
+
+	return open_write_close(chip->configfs_dir_fd, "num_lines", buf);
+}
+
+GPIOSIM_API int gpiosim_chip_set_line_names(struct gpiosim_chip *chip,
+					    unsigned int num_names,
+					    char **names)
+{
+	int ret, written = 0;
+	size_t size = 0, len;
+	unsigned int i;
+	char *buf;
+
+	if (!chip_check_pending(chip))
+		return -1;
+
+	if (!num_names)
+		return 0;
+
+	for (i = 0; i < num_names; i++) {
+		len = names[i] ? strlen(names[i]) : 0;
+		/* Length of the name + '"'x2 + ', '. */
+		size += len + 4;
+	}
+
+	buf = malloc(size);
+	if (!buf)
+		return -1;
+
+	memset(buf, 0, size);
+
+	for (i = 0; i < num_names; i++)
+		written += snprintf(buf + written, size - written,
+				    "\"%s\", ", names[i] ?: "");
+	buf[size - 2] = '\0';
+
+	ret = open_write_close(chip->configfs_dir_fd, "line_names", buf);
+	free(buf);
+	return ret;
+}
+
+static int chip_open_sysfs_dir(struct gpiosim_chip *chip)
+{
+	int ret, fd;
+	char *path;
+
+	ret = asprintf(&path,
+		       "/sys/devices/platform/%s/line-ctrl", chip->devname);
+	if (ret < 0)
+		return -1;
+
+	fd = open(path, O_RDONLY);
+	free(path);
+	if (fd < 0)
+		return -1;
+
+	return fd;
+}
+
+/* Check if this is the device we're waiting for. */
+static bool check_gpiosim_devpath(struct gpiosim_chip *chip,
+				  const char *devpath, const char *sysname)
+{
+	char expected[128];
+
+	snprintf(expected, sizeof(expected),
+		 "/devices/platform/%s/%s", chip->devname, sysname);
+
+	return !strcmp(devpath, expected);
+}
+
+/*
+ * This version is called _sync because it synchronously waits for the chip
+ * to appear in the system. There's no _async variant for now but using the
+ * suffix here will make it easier to add it if we ever need it.
+ */
+GPIOSIM_API int gpiosim_chip_commit_sync(struct gpiosim_chip *chip)
+{
+	const char *devpath, *devnode, *sysname, *action;
+	struct gpiosim_ctx *ctx = chip->ctx;
+	struct udev_monitor *udev_mon;
+	struct udev_device *dev;
+	unsigned int tries = 10;
+	struct udev *udev;
+	struct pollfd pfd;
+	int ret;
+
+	if (!chip_check_pending(chip))
+		return -1;
+
+	udev = udev_new();
+	if (!udev)
+		return -1;
+
+	udev_mon = udev_monitor_new_from_netlink(udev, "udev");
+	if (!udev_mon) {
+		ret = -1;
+		goto out_unref_udev;
+	}
+
+	ret = udev_monitor_filter_add_match_subsystem_devtype(udev_mon,
+							      "gpio", NULL);
+	if (ret < 0)
+		goto out_unref_udev_mon;
+
+	ret = udev_monitor_enable_receiving(udev_mon);
+	if (ret < 0)
+		goto out_unref_udev_mon;
+
+	ret = renameat(ctx->pending_dir_fd, chip->item_name,
+		       ctx->live_dir_fd, chip->item_name);
+	if (ret)
+		goto out_unref_udev_mon;
+
+	while (--tries) {
+		pfd.fd = udev_monitor_get_fd(udev_mon);
+		pfd.events = POLLIN | POLLPRI;
+
+		ret = poll(&pfd, 1, 5000);
+		if (ret <= 0) {
+			if (ret == 0)
+				errno = EAGAIN;
+			goto out_rename_back;
+		}
+
+		dev = udev_monitor_receive_device(udev_mon);
+		if (!dev) {
+			ret = -1;
+			goto out_rename_back;
+		}
+
+		devpath = udev_device_get_devpath(dev);
+		devnode = udev_device_get_devnode(dev);
+		sysname = udev_device_get_sysname(dev);
+		action = udev_device_get_action(dev);
+
+		if (!devpath || !devnode || !sysname ||
+		    !check_gpiosim_devpath(chip, devpath, sysname) ||
+		    strcmp(action, "add") != 0) {
+			udev_device_unref(dev);
+			continue;
+		}
+
+		chip->devnode = strdup(devnode);
+		if (!chip->devnode) {
+			udev_device_unref(dev);
+			goto out_rename_back;
+		}
+
+		chip->chipname = strdup(sysname);
+		udev_device_unref(dev);
+		if (!chip->chipname) {
+			free(chip->devnode);
+			goto out_rename_back;
+		}
+
+		chip->sysfs_dir_fd = chip_open_sysfs_dir(chip);
+		if (chip->sysfs_dir_fd < 0) {
+			free(chip->chipname);
+			free(chip->devnode);
+			goto out_rename_back;
+		}
+
+		chip->live = true;
+		ret = 0;
+		goto out_unref_udev_mon;
+	}
+
+	errno = ENODEV;
+	ret = -1;
+
+out_rename_back:
+	renameat(ctx->live_dir_fd, chip->item_name,
+		 ctx->pending_dir_fd, chip->item_name);
+out_unref_udev_mon:
+	udev_monitor_unref(udev_mon);
+out_unref_udev:
+	udev_unref(udev);
+
+	return ret;
+}
+
+GPIOSIM_API int gpiosim_chip_uncommit(struct gpiosim_chip *chip)
+{
+	int ret;
+
+	if (!chip_check_live(chip))
+		return -1;
+
+	ret = renameat(chip->ctx->live_dir_fd, chip->item_name,
+		       chip->ctx->pending_dir_fd, chip->item_name);
+	if (ret)
+		return ret;
+
+	close(chip->sysfs_dir_fd);
+	free(chip->chipname);
+	free(chip->devnode);
+	chip->live = false;
+
+	return 0;
+}
+
+GPIOSIM_API const char *gpiosim_chip_get_dev(struct gpiosim_chip *chip)
+{
+	if (!chip_check_live(chip))
+		return NULL;
+
+	return chip->devnode;
+}
+
+GPIOSIM_API const char *gpiosim_chip_get_name(struct gpiosim_chip *chip)
+{
+	if (!chip_check_live(chip))
+		return NULL;
+
+	return chip->chipname;
+}
+
+GPIOSIM_API int gpiosim_chip_get_value(struct gpiosim_chip *chip,
+				       unsigned int offset)
+{
+	char where[32], what[3];
+	int ret;
+
+	if (!chip_check_live(chip))
+		return -1;
+
+	snprintf(where, sizeof(where), "gpio%u", offset);
+
+	ret = open_read_close(chip->sysfs_dir_fd, where, what, sizeof(what));
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
+GPIOSIM_API int gpiosim_chip_set_pull(struct gpiosim_chip *chip,
+				      unsigned int offset, int value)
+{
+	char where[32], what[2];
+
+	if (!chip_check_live(chip))
+		return -1;
+
+	if (value != 0 && value != 1) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	snprintf(where, sizeof(where), "gpio%u", offset);
+	snprintf(what, sizeof(what), value ? "1" : "0");
+
+	return open_write_close(chip->sysfs_dir_fd, where, what);
+}
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
new file mode 100644
index 0000000..bdfb5a3
--- /dev/null
+++ b/tests/gpiosim/gpiosim.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_GPIOSIM_H__
+#define __GPIOD_GPIOSIM_H__
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+struct gpiosim_ctx;
+struct gpiosim_chip;
+
+struct gpiosim_ctx *gpiosim_ctx_new(void);
+struct gpiosim_ctx *gpiosim_ctx_ref(struct gpiosim_ctx *ctx);
+void gpiosim_ctx_unref(struct gpiosim_ctx *ctx);
+
+struct gpiosim_chip *
+gpiosim_chip_new(struct gpiosim_ctx *ctx, const char *item_name);
+struct gpiosim_chip *gpiosim_chip_ref(struct gpiosim_chip *chip);
+void gpiosim_chip_unref(struct gpiosim_chip *chip);
+
+int gpiosim_chip_set_label(struct gpiosim_chip *chip, const char *label);
+int gpiosim_chip_set_num_lines(struct gpiosim_chip *chip,
+			       unsigned int num_lines);
+int gpiosim_chip_set_line_names(struct gpiosim_chip *chip,
+				unsigned int num_names, char **names);
+
+int gpiosim_chip_commit_sync(struct gpiosim_chip *chip);
+int gpiosim_chip_uncommit(struct gpiosim_chip *chip);
+
+const char *gpiosim_chip_get_dev(struct gpiosim_chip *chip);
+const char *gpiosim_chip_get_name(struct gpiosim_chip *chip);
+int gpiosim_chip_get_value(struct gpiosim_chip *chip, unsigned int offset);
+int gpiosim_chip_set_pull(struct gpiosim_chip *chip,
+			  unsigned int offset, int value);
+
+#ifdef __cplusplus
+} /* extern "C" */
+#endif
+
+#endif /* __GPIOD_GPIOSIM_H__ */
-- 
2.30.1

