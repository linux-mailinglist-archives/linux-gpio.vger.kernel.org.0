Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38424F62D4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 17:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbiDFPKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 11:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbiDFPKp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 11:10:45 -0400
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB509CA6C2
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 05:10:44 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id p189so1323038wmp.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRUlmkcegkZN+O/2wM2fn3kSu69W6SCmoGkffXmaZ+Q=;
        b=pO9PYpVotaLiTreMk45VQ+idw+osmytm9NFlMvNKdC9cXv+f3ycHTH4MdQxVzyLnX/
         hu5tY66GxXKLxmawy2axy2C4fE3KXHQVmruVUl8RaftUTAHFuKAQ7bdy9OHAZfmZV4T5
         GYLmWjAFFYHANcn2EfvH89IPSrVqhMSJnrnwP8YRmS6LJpczzCmYbgx+tdH6X+BcGlx5
         RQJQ5SsFOqeWhFOfiwo+AJJcCwYyRYSUc0nPBs5ocJR80uV0DnCvtmqg42m7W3q0Nc5C
         O0b0+pD8A13xB5SnYDNJB5tjMqZCkDy+grcRbU6CTrDlVT5iO6KzphY/C8JM0b85MiHW
         Lgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRUlmkcegkZN+O/2wM2fn3kSu69W6SCmoGkffXmaZ+Q=;
        b=h2NdIhSsGYEPcgK0e9S48WJI4P/UnefzhKL8/IbmuyMe2gQIux5X6+5uOIdV9DXHjI
         MLi58Og1XzZPu1vhoHirDmbp1Rgsqm7Mab4SVkyu1ldLk1R25tXJGzvpc/fBoiDbzfkn
         mFi37T9VF4HgtP9WL1UHj0+OTqPkiAu/0Zm6QNtswWWa/iS+4ApKloVJhSge708WSQa3
         gOWu86po1T0XPSWGihJFiKJPh00exE9mhIrseN3qzLoIPHDGJG5L9PPog8WwKNx6RWQk
         uC1IbA4eR6AMsA4CMHtDdfOXYivuSEQZCBMXODGTYu01wlgevaVxosKB5pLuMBMTYn2J
         fDxQ==
X-Gm-Message-State: AOAM533fYaeZX4Lp0XLfEzCVqxCvNhByzmqkPIj0ScX2d/8OUGR1vZtj
        xNVJ2eL+x+HREwXO2cUzrYDNhL6ipe59xULB
X-Google-Smtp-Source: ABdhPJz3PdeYBdaggymrkjI4raI7sfrZiFk3qbUJUrlnCPUiMJXV0LgVWp5Zt4nOD9mMUx+f4d1Aaw==
X-Received: by 2002:a7b:cc15:0:b0:38c:8af7:f47c with SMTP id f21-20020a7bcc15000000b0038c8af7f47cmr7136955wmh.177.1649246874386;
        Wed, 06 Apr 2022 05:07:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:25df:f55c:a17f:e965])
        by smtp.gmail.com with ESMTPSA id d14-20020a056000186e00b0020405198faasm16603799wri.52.2022.04.06.05.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 05:07:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] gpiosim: remove randomness from configfs name generation
Date:   Wed,  6 Apr 2022 14:07:52 +0200
Message-Id: <20220406120752.44049-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

None of the test suites use the random name generation at this point so
it's very much dead code and also every test-suite implements its own
deterministic way of assigning file names to configfs attributes while
also doing it wrong (as is evident as soon as we try to remove one
simulator but not all of them and then create another one).

This removes the 'name' argument from gpiosim_dev_new() and
gpiosim_bank_new() and makes the generation of the file names for
configfs attributes deterministic at the libgpiosim level. The names
are created from the program invocation name, the PID and an ID allocated
using a binary search tree in a similar manner to kernel's IDA API (find
the lowest available integer for a new name).

The ID pool is global within the library code and as such has protection
using a mutex (unlike the context object and its children which are
expected to be protected by the user if needed).

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tests/gpiod-test-sim.c           |   9 +-
 tests/gpiosim/Makefile.am        |   2 +-
 tests/gpiosim/gpiosim-selftest.c |  18 +--
 tests/gpiosim/gpiosim.c          | 222 +++++++++++++++++++++++--------
 tests/gpiosim/gpiosim.h          |   4 +-
 5 files changed, 180 insertions(+), 75 deletions(-)

diff --git a/tests/gpiod-test-sim.c b/tests/gpiod-test-sim.c
index fd4b8cc..fe5db38 100644
--- a/tests/gpiod-test-sim.c
+++ b/tests/gpiod-test-sim.c
@@ -23,8 +23,6 @@ enum {
 };
 
 static struct gpiosim_ctx *sim_ctx;
-static pid_t pid;
-static guint sim_id;
 
 G_DEFINE_TYPE(GPIOSimChip, g_gpiosim_chip, G_TYPE_OBJECT);
 
@@ -41,7 +39,6 @@ static void g_gpiosim_ctx_init(void)
 			g_strerror(errno));
 
 	atexit(g_gpiosim_ctx_unref);
-	pid = getpid();
 }
 
 static void g_gpiosim_chip_constructed(GObject *obj)
@@ -175,7 +172,6 @@ static void g_gpiosim_chip_dispose(GObject *obj)
 	}
 
 	gpiosim_dev_unref(dev);
-	sim_id--;
 }
 
 static void g_gpiosim_chip_finalize(GObject *obj)
@@ -239,13 +235,12 @@ static void g_gpiosim_chip_init(GPIOSimChip *self)
 	if (!sim_ctx)
 		g_gpiosim_ctx_init();
 
-	dev_name = g_strdup_printf("gpiod-test-dev.%u.%u", pid, sim_id++);
-	dev = gpiosim_dev_new(sim_ctx, dev_name);
+	dev = gpiosim_dev_new(sim_ctx);
 	if (!dev)
 		g_error("Unable to instantiate new GPIO device: %s",
 			g_strerror(errno));
 
-	self->bank = gpiosim_bank_new(dev, "bank");
+	self->bank = gpiosim_bank_new(dev);
 	gpiosim_dev_unref(dev);
 	if (!self->bank)
 		g_error("Unable to instantiate new GPIO bank: %s",
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
index ab5838a..05dce79 100644
--- a/tests/gpiosim/Makefile.am
+++ b/tests/gpiosim/Makefile.am
@@ -10,7 +10,7 @@ AM_CFLAGS += -include $(top_builddir)/config.h
 libgpiosim_la_SOURCES = gpiosim.c gpiosim.h
 libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
 libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
-libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS)
+libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS) -pthread
 
 gpiosim_selftest_SOURCES = gpiosim-selftest.c
 gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
index f2d0b35..b970755 100644
--- a/tests/gpiosim/gpiosim-selftest.c
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -31,27 +31,27 @@ int main(int argc UNUSED, char **argv UNUSED)
 		return EXIT_FAILURE;
 	}
 
-	printf("Creating a chip with random name\n");
+	printf("Creating a chip\n");
 
-	dev = gpiosim_dev_new(ctx, NULL);
+	dev = gpiosim_dev_new(ctx);
 	if (!dev) {
-		perror("Unable to create a chip with random name");
+		perror("Unable to create a chip");
 		return EXIT_FAILURE;
 	}
 
-	printf("Creating a bank with a random name\n");
+	printf("Creating a bank\n");
 
-	bank0 = gpiosim_bank_new(dev, NULL);
+	bank0 = gpiosim_bank_new(dev);
 	if (!bank0) {
-		perror("Unable to create a bank with random name");
+		perror("Unable to create a bank");
 		return EXIT_FAILURE;
 	}
 
-	printf("Creating a bank with a specific name\n");
+	printf("Creating a second bank\n");
 
-	bank1 = gpiosim_bank_new(dev, "foobar");
+	bank1 = gpiosim_bank_new(dev);
 	if (!bank1) {
-		perror("Unable to create a bank with a specific name");
+		perror("Unable to create a bank");
 		return EXIT_FAILURE;
 	}
 
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 5948944..cf7f438 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -5,6 +5,8 @@
 #include <libkmod.h>
 #include <libmount.h>
 #include <linux/version.h>
+#include <pthread.h>
+#include <search.h>
 #include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -22,6 +24,136 @@
 #define ARRAY_SIZE(x)		(sizeof(x) / sizeof(*(x)))
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 17, 0)
 
+static pthread_mutex_t id_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_once_t id_init_once = PTHREAD_ONCE_INIT;
+static void *id_root;
+
+struct id_find_next_ctx {
+	int lowest;
+	bool found;
+};
+
+struct id_del_ctx {
+	int id;
+	int *idp;
+};
+
+static void id_cleanup(void)
+{
+	tdestroy(id_root, free);
+}
+
+static void id_schedule_cleanup(void)
+{
+	atexit(id_cleanup);
+}
+
+static int id_compare(const void *p1, const void *p2)
+{
+	int id1 = *(int *)p1;
+	int id2 = *(int *)p2;
+
+	if (id1 < id2)
+		return -1;
+	if (id1 > id2)
+		return 1;
+	return 0;
+}
+
+static void id_find_next(const void *node, VISIT which, void *data)
+{
+	struct id_find_next_ctx *ctx = data;
+	int *id = *(int **)node;
+
+	if (ctx->found)
+		return;
+
+	switch (which) {
+	case postorder:
+	case leaf:
+		if (*id != ctx->lowest)
+			ctx->found = true;
+		else
+			ctx->lowest++;
+		break;
+	default:
+		break;
+	};
+}
+
+static void id_del(const void *node, VISIT which, void *data)
+{
+	struct id_del_ctx *ctx = data;
+	int *id = *(int **)node;
+
+	if (ctx->idp)
+		return;
+
+	switch (which) {
+	case postorder:
+	case leaf:
+		if (*id == ctx->id)
+			ctx->idp = id;
+		break;
+	default:
+		break;
+	}
+}
+
+static int id_alloc(void)
+{
+	struct id_find_next_ctx ctx;
+	void *ret;
+	int *id;
+
+	pthread_once(&id_init_once, id_schedule_cleanup);
+
+	ctx.lowest = 0;
+	ctx.found = false;
+
+	pthread_mutex_lock(&id_lock);
+
+	twalk_r(id_root, id_find_next, &ctx);
+
+	id = malloc(sizeof(*id));
+	if (!id) {
+		pthread_mutex_unlock(&id_lock);
+		return -1;
+	}
+
+	*id = ctx.lowest;
+
+	ret = tsearch(id, &id_root, id_compare);
+	if (!ret) {
+		pthread_mutex_unlock(&id_lock);
+		/* tsearch() doesn't set errno. */
+		errno = ENOMEM;
+		return -1;
+	}
+
+	pthread_mutex_unlock(&id_lock);
+
+	return *id;
+}
+
+static void id_free(int id)
+{
+	struct id_del_ctx ctx;
+
+	ctx.id = id;
+	ctx.idp = NULL;
+
+	pthread_mutex_lock(&id_lock);
+
+	twalk_r(id_root, id_del, &ctx);
+	if (ctx.idp) {
+		tdelete(ctx.idp, &id_root, id_compare);
+		free(ctx.idp);
+	}
+
+	pthread_mutex_unlock(&id_lock);
+}
+
 struct refcount {
 	unsigned int cnt;
 	void (*release)(struct refcount *);
@@ -233,62 +365,22 @@ out_unref_kmod:
 	return ret;
 }
 
-/* We don't have mkdtempat()... :( */
-static char *make_random_dir_at(int at)
+static char *configfs_make_item(int at, int id)
 {
-	static const char chars[] = "abcdefghijklmnoprstquvwxyz"
-				    "ABCDEFGHIJKLMNOPRSTQUVWXYZ"
-				    "0123456789";
-
-	char name[] = "XXXXXXXXXXXX\0";
-	unsigned int idx, i;
+	char *item_name;
 	int ret;
 
-again:
-	for (i = 0; i < sizeof(name) - 1; i++) {
-		ret = getrandom(&idx, sizeof(idx), GRND_NONBLOCK);
-		if (ret != sizeof(idx)) {
-			if (ret >= 0)
-				errno = EAGAIN;
-
-			return NULL;
-		}
-
-		name[i] = chars[idx % (ARRAY_SIZE(chars) - 1)];
-	}
+	ret = asprintf(&item_name, "%s.%u.%d",
+		       program_invocation_short_name, getpid(), id);
+	if (ret < 0)
+		return NULL;
 
-	ret = mkdirat(at, name, 0600);
+	ret = mkdirat(at, item_name, 0600);
 	if (ret) {
-		if (errno == EEXIST)
-			goto again;
-
+		free(item_name);
 		return NULL;
 	}
 
-	return strdup(name);
-}
-
-static char *configfs_make_item_name(int at, const char *name)
-{
-	char *item_name;
-	int ret;
-
-	if (name) {
-		item_name = strdup(name);
-		if (!item_name)
-			return NULL;
-
-		ret = mkdirat(at, item_name, 0600);
-		if (ret) {
-			free(item_name);
-			return NULL;
-		}
-	} else {
-		item_name = make_random_dir_at(at);
-		if (!item_name)
-			return NULL;
-	}
-
 	return item_name;
 }
 
@@ -303,6 +395,7 @@ struct gpiosim_dev {
 	struct gpiosim_ctx *ctx;
 	bool live;
 	char *item_name;
+	int id;
 	char *dev_name;
 	int cfs_dir_fd;
 	int sysfs_dir_fd;
@@ -314,6 +407,7 @@ struct gpiosim_bank {
 	struct gpiosim_dev *dev;
 	struct list_head siblings;
 	char *item_name;
+	int id;
 	char *chip_name;
 	char *dev_path;
 	int cfs_dir_fd;
@@ -478,22 +572,27 @@ static void dev_release(struct refcount *ref)
 	close(dev->cfs_dir_fd);
 	free(dev->dev_name);
 	free(dev->item_name);
+	id_free(dev->id);
 	gpiosim_ctx_unref(ctx);
 	free(dev);
 }
 
 GPIOSIM_API struct gpiosim_dev *
-gpiosim_dev_new(struct gpiosim_ctx *ctx, const char *name)
+gpiosim_dev_new(struct gpiosim_ctx *ctx)
 {
+	int configfs_fd, ret, id;
 	struct gpiosim_dev *dev;
-	int configfs_fd, ret;
 	char devname[128];
 	char *item_name;
 
-	item_name = configfs_make_item_name(ctx->cfs_dir_fd, name);
-	if (!item_name)
+	id = id_alloc();
+	if (id < 0)
 		return NULL;
 
+	item_name = configfs_make_item(ctx->cfs_dir_fd, id);
+	if (!item_name)
+		goto err_free_id;
+
 	configfs_fd = openat(ctx->cfs_dir_fd, item_name, O_RDONLY);
 	if (configfs_fd < 0)
 		goto err_unlink;
@@ -513,6 +612,7 @@ gpiosim_dev_new(struct gpiosim_ctx *ctx, const char *name)
 	dev->cfs_dir_fd = configfs_fd;
 	dev->sysfs_dir_fd = -1;
 	dev->item_name = item_name;
+	dev->id = id;
 
 	dev->dev_name = strdup(devname);
 	if (!dev->dev_name)
@@ -529,6 +629,8 @@ err_close_fd:
 err_unlink:
 	unlinkat(ctx->cfs_dir_fd, item_name, AT_REMOVEDIR);
 	free(item_name);
+err_free_id:
+	id_free(id);
 
 	return NULL;
 }
@@ -747,25 +849,30 @@ static void bank_release(struct refcount *ref)
 		/* If the device wasn't disabled yet, this fd is still open. */
 		close(bank->sysfs_dir_fd);
 	free(bank->item_name);
+	id_free(bank->id);
 	free(bank->chip_name);
 	free(bank->dev_path);
 	free(bank);
 }
 
 GPIOSIM_API struct gpiosim_bank*
-gpiosim_bank_new(struct gpiosim_dev *dev, const char *name)
+gpiosim_bank_new(struct gpiosim_dev *dev)
 {
 	struct gpiosim_bank *bank;
-	int configfs_fd;
+	int configfs_fd, id;
 	char *item_name;
 
 	if (!dev_check_pending(dev))
 		return NULL;
 
-	item_name = configfs_make_item_name(dev->cfs_dir_fd, name);
-	if (!item_name)
+	id = id_alloc();
+	if (id < 0)
 		return NULL;
 
+	item_name = configfs_make_item(dev->cfs_dir_fd, id);
+	if (!item_name)
+		goto err_free_id;
+
 	configfs_fd = openat(dev->cfs_dir_fd, item_name, O_RDONLY);
 	if (configfs_fd < 0)
 		goto err_unlink;
@@ -781,6 +888,7 @@ gpiosim_bank_new(struct gpiosim_dev *dev, const char *name)
 	bank->cfs_dir_fd = configfs_fd;
 	bank->dev = gpiosim_dev_ref(dev);
 	bank->item_name = item_name;
+	bank->id = id;
 
 	return bank;
 
@@ -788,6 +896,8 @@ err_close_cfs:
 	close(configfs_fd);
 err_unlink:
 	unlinkat(dev->cfs_dir_fd, item_name, AT_REMOVEDIR);
+err_free_id:
+	id_free(id);
 
 	return NULL;
 }
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
index 32f81bc..8013595 100644
--- a/tests/gpiosim/gpiosim.h
+++ b/tests/gpiosim/gpiosim.h
@@ -36,7 +36,7 @@ struct gpiosim_ctx *gpiosim_ctx_ref(struct gpiosim_ctx *ctx);
 void gpiosim_ctx_unref(struct gpiosim_ctx *ctx);
 
 struct gpiosim_dev *
-gpiosim_dev_new(struct gpiosim_ctx *ctx, const char *name);
+gpiosim_dev_new(struct gpiosim_ctx *ctx);
 struct gpiosim_dev *gpiosim_dev_ref(struct gpiosim_dev *dev);
 void gpiosim_dev_unref(struct gpiosim_dev *dev);
 struct gpiosim_ctx *gpiosim_dev_get_ctx(struct gpiosim_dev *dev);
@@ -47,7 +47,7 @@ int gpiosim_dev_disable(struct gpiosim_dev *dev);
 bool gpiosim_dev_is_live(struct gpiosim_dev *dev);
 
 struct gpiosim_bank*
-gpiosim_bank_new(struct gpiosim_dev *dev, const char *name);
+gpiosim_bank_new(struct gpiosim_dev *dev);
 struct gpiosim_bank *gpiosim_bank_ref(struct gpiosim_bank *bank);
 void gpiosim_bank_unref(struct gpiosim_bank *bank);
 struct gpiosim_dev *gpiosim_bank_get_dev(struct gpiosim_bank *bank);
-- 
2.32.0

