Return-Path: <linux-gpio+bounces-36446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBQ9E+nB/WkpigAAu9opvQ
	(envelope-from <linux-gpio+bounces-36446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:58:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54D4F563B
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 12:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 386B03036EC2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 10:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0569332B981;
	Fri,  8 May 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrhnYWDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18C3254A3;
	Fri,  8 May 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237728; cv=none; b=HSnsEH0eieQu0Hy9ML3sv3urXPJSiUId7sUlqVFjyeoUvQJElnCOkJiLrk0Ch05TJxcUl1voWdTilYd8fG4s/pUPicI5zs4pTym39YmtzTaDuqMXfTn8g7psiBWsLc9rF5ktAtFm1K0Gs+tBJTcXdaAlHRxhT4xpFaR+GyTj358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237728; c=relaxed/simple;
	bh=b1x6U5MyNCu42AfQd4Np8rqe9z8Wu3dq59WRsGOVctA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4XZ2j6LZBtIn2KT0Y/AVvMc9hMH31NJk5oXgWXAgdLNKKpGTybR2h+nXA4VpnB5i76kkyOCn9hLIzprS/cWXDPzwLJu4rUbRjVKkURZVgFxvj7iRGdJwyh8u66IyT+9+BTySpLIZM81gLOcV3Z0es5i67Itqu8U8DnhOSIdI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrhnYWDo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D90C2BCF5;
	Fri,  8 May 2026 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778237728;
	bh=b1x6U5MyNCu42AfQd4Np8rqe9z8Wu3dq59WRsGOVctA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrhnYWDo/N8ANFKWHim0UvYo2jf0uOT68ois6EaUkCT4/TJlWgqVEPov4jZnE537/
	 qJbzL13YEEStZ0+NnlW6tIJFNV25bSpKODV3Ejxq4Mcu6KwVKK8QFmtTPalk9NJ0de
	 TfZTC0OJ9WjGhqJro9r+WnQdePH0bxVQelWUPkQuu/lgyEcrqwvBIhEhdS0aNinOmK
	 E3QoTDZ0Od5P0Q27z9zCcgDvb8gVoPJ2VE2ebPVPKqvTrfpwwRz/hfwX8EkTdSXoh6
	 EquZppKrBX27xiCxLMEQQnU5iZPgG+1YjD5A5yfJuUcJRm6J1Ldbq519E3s5jXsLZI
	 57PvYBRp7QioA==
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
Subject: [PATCH v10 2/9] revocable: Add KUnit test cases
Date: Fri,  8 May 2026 18:54:41 +0800
Message-ID: <20260508105448.31799-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260508105448.31799-1-tzungbi@kernel.org>
References: <20260508105448.31799-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DE54D4F563B
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
	TAGGED_FROM(0.00)[bounces-36446-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add KUnit test cases for the revocable API.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.
- Concurrent Access: Verifies multiple threads can access the resource.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v10:
- Merge revocable_test_try_access_macro*() cases.
- Change revocable API usages accordingly.

v9: https://lore.kernel.org/all/20260427135841.96266-3-tzungbi@kernel.org
- Add test cases for embedded resource provider.

v8: https://lore.kernel.org/all/20260213092307.858908-3-tzungbi@kernel.org
- Squash:
  - c259cd7ea3c9 revocable: fix missing module license and description
  - a243f7fb11fe revocable: Add KUnit test for provider lifetime races
  - 988357628c2c revocable: Add KUnit test for concurrent access
- Change accordingly due to its dependency "revocable: Revocable resource
  management" changes.

v7: https://lore.kernel.org/all/20260116080235.350305-3-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Rename the test name "macro" -> "try_access_macro".

v6: https://lore.kernel.org/all/20251106152330.11733-3-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add tests for new REVOCABLE_TRY_ACCESS_WITH().

v5: https://lore.kernel.org/all/20251016054204.1523139-3-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/all/20250923075302.591026-3-tzungbi@kernel.org
- REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
- revocable_release() -> revocable_withdraw_access().

v3: https://lore.kernel.org/all/20250912081718.3827390-3-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20250820081645.847919-3-tzungbi@kernel.org
- New in the series.

A way to run the test:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        revocable_test
Or
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_DEBUG_INFO=y \
        --kconfig_add CONFIG_DEBUG_INFO_DWARF5=y \
        --kconfig_add CONFIG_KASAN=y \
        --kconfig_add CONFIG_DETECT_HUNG_TASK=y \
        --kconfig_add CONFIG_DEFAULT_HUNG_TASK_TIMEOUT="10" \
        --arch=x86_64 \
        --make_options="C=1 W=1" \
        revocable_test

---
 MAINTAINERS                   |   1 +
 drivers/base/Kconfig          |   5 +
 drivers/base/Makefile         |   3 +
 drivers/base/revocable_test.c | 405 ++++++++++++++++++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 drivers/base/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ec3a7cb5e6b..14aa035ef431 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22831,6 +22831,7 @@ L:	driver-core@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	drivers/base/revocable.c
+F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index f7d385cbd3ba..921f7e812ba5 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -259,3 +259,8 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  work on.
 
 endmenu
+
+config REVOCABLE_KUNIT_TEST
+	tristate "KUnit tests for revocable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index bdf854694e39..5fd19abbc83e 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -35,3 +35,6 @@ ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
 # define_trace.h needs to know how to find our header
 CFLAGS_trace.o		:= -I$(src)
 obj-$(CONFIG_TRACING)	+= trace.o
+
+# KUnit test cases
+obj-$(CONFIG_REVOCABLE_KUNIT_TEST)	+= revocable_test.o
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
new file mode 100644
index 000000000000..bb776a747ff7
--- /dev/null
+++ b/drivers/base/revocable_test.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * KUnit tests for the revocable API.
+ *
+ * The test cases cover the following scenarios:
+ *
+ * - Basic: Verifies that a consumer can successfully access the resource.
+ *
+ * - Revocation: Verifies that after the provider revokes the resource,
+ *   the consumer correctly receives a NULL pointer on a subsequent access.
+ *
+ * - Try Access Macro: Same as "Revocation" but uses the macro level
+ *   helpers.
+ *
+ * - Concurrent Access: Verifies multiple threads can access the resource.
+ */
+
+#include <kunit/test.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/refcount.h>
+#include <linux/revocable.h>
+
+static int get_refcount(struct revocable *rev)
+{
+	return refcount_read(&rev->kref.refcount);
+}
+
+static void revocable_test_basic(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_FALSE(test, rev->embedded);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+static void revocable_embedded_test_basic(struct kunit *test)
+{
+	struct revocable rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	revocable_init(&rev, real_res);
+	KUNIT_EXPECT_TRUE(test, rev.embedded);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 2);
+
+	revocable_handle_init(&rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 3);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 2);
+	revocable_revoke(&rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 1);
+	revocable_put(&rev);
+}
+
+static void revocable_test_revocation(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_FALSE(test, rev->embedded);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+static void revocable_embedded_test_revocation(struct kunit *test)
+{
+	struct revocable rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	revocable_init(&rev, real_res);
+	KUNIT_EXPECT_TRUE(test, rev.embedded);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 2);
+
+	revocable_handle_init(&rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 3);
+	revocable_revoke(&rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 2);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(&rev), 1);
+	revocable_put(&rev);
+}
+
+static int call_revocable_try_access_or_return_err(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_err(rev, res, -ENXIO);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return(rev, res);
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void(struct kunit *test,
+						     struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_void(rev, res);
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static int call_revocable_try_access_or_return_err_scoped(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_err_scoped(rev, res, -ENXIO) {}
+	return 0;
+}
+
+static int call_revocable_try_access_or_return_scoped(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_scoped(rev, res) {}
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void_scoped(struct kunit *test,
+							    struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_void_scoped(rev, res) {}
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static void revocable_test_try_access_macro(struct kunit *test)
+{
+	struct revocable *rev;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+	bool accessed;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_FALSE(test, rev->embedded);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	ret = call_revocable_try_access_or_return_err(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void(test, rev);
+
+	ret = call_revocable_try_access_or_return_err_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void_scoped(test, rev);
+
+	accessed = false;
+	revocable_try_access_or_skip_scoped(rev, res)
+		accessed = true;
+	KUNIT_EXPECT_FALSE(test, accessed);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+struct test_concurrent_access_context {
+	struct completion started, enter;
+	struct task_struct *thread;
+
+	union {
+		/* Used by test provider. */
+		struct revocable *rev;
+
+		/* Used by test consumer. */
+		struct {
+			struct completion exit;
+			struct revocable_handle rh;
+			struct kunit *test;
+			void *expected_res;
+		};
+	};
+};
+
+static int test_concurrent_access_provider(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	revocable_revoke(ctx->rev);
+
+	return 0;
+}
+
+static int test_concurrent_access_consumer(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+	void *res;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	res = revocable_try_access(&ctx->rh);
+	KUNIT_EXPECT_PTR_EQ(ctx->test, res, ctx->expected_res);
+
+	wait_for_completion(&ctx->exit);
+	revocable_withdraw_access(&ctx->rh);
+
+	return 0;
+}
+
+static void revocable_test_concurrent_access(struct kunit *test)
+{
+	struct revocable *rev;
+	void *real_res = (void *)0x12345678;
+	struct test_concurrent_access_context *ctx;
+	int i;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_FALSE(test, rev->embedded);
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			/* Transfer the ownership of provider reference too. */
+			ctx[i].rev = rev;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"revocable_%d", i);
+		} else {
+			init_completion(&ctx[i].exit);
+			revocable_handle_init(rev, &ctx[i].rh);
+			KUNIT_EXPECT_EQ(test, get_refcount(rev), 2 + i);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"revocable_handle_%d", i);
+		}
+		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	msleep(100);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	msleep(100);
+	/* provider0 can't exit.  It's waiting for the grace period. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 4);
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	msleep(100);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop(ctx[i].thread);
+		revocable_handle_deinit(&ctx[i].rh);
+	}
+
+	kthread_stop(ctx[0].thread);
+	/* provider0 exits as all readers exit their critical section. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	/* Drop the caller reference. */
+	revocable_put(rev);
+}
+
+static struct kunit_case revocable_test_cases[] = {
+	KUNIT_CASE(revocable_test_basic),
+	KUNIT_CASE(revocable_embedded_test_basic),
+	KUNIT_CASE(revocable_test_revocation),
+	KUNIT_CASE(revocable_embedded_test_revocation),
+	KUNIT_CASE(revocable_test_try_access_macro),
+	KUNIT_CASE(revocable_test_concurrent_access),
+	{}
+};
+
+static struct kunit_suite revocable_test_suite = {
+	.name = "revocable_test",
+	.test_cases = revocable_test_cases,
+};
+
+kunit_test_suite(revocable_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
+MODULE_DESCRIPTION("KUnit tests for the revocable API");
-- 
2.51.0


