Return-Path: <linux-gpio+bounces-36734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id feRPDGtFBGowGgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:33:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826B530B08
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C810E310F0CA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE09A3E5A2F;
	Wed, 13 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmNaef2/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443C3E5A0B;
	Wed, 13 May 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663508; cv=none; b=f6bvEvf/DeAwyQHo9S05W6xO38wDY8Kc9Kwo5NZgPaffdirepYI98ixl+Wiuf9m9xgYQww9O80PEFH6xpav7t0/UrKuK8Ry1tCNr7Uh+e+HjJfeZ1lykKOh0dDQCyuXdKDne37tbvgGXWpaG0Awu9bID9FnN5hj+7s6TUPS/+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663508; c=relaxed/simple;
	bh=1KZndV5SJKsaAAM++jaA27myr0QkOO/SO6ts0pSWRfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZEl5Lb/eDG6Kknb2RtwnoQ6ipKXRKy45lyHqgEv3DLk4M45cCClFte+oipc45aYZP128hiwX081dVaFg0r4ZVEZCF4dO0RemkbTUQWlF57ssP7hlWJwGvZoUfGTfbc8/IOESsjSiF5qDqhPxkmGNIsxZm9KuXXb6u91tuyz4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmNaef2/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A794DC2BCC7;
	Wed, 13 May 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778663508;
	bh=1KZndV5SJKsaAAM++jaA27myr0QkOO/SO6ts0pSWRfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rmNaef2/QZnkif9QQgrYTm8cRZHLsIsDhEbxc4unXTpdlKcaBYIMPww/y4toOs1nO
	 l1aEjtQoCaMdHVV+u5BZD3p6wcvtFrOcFKiOHt4c+MhTuaepvJMEeHG73Aa1fWBdJb
	 rf+8aOAGY60Hv5zUazIivyEMsu4o6IfvBo2kKRR8T0rov7AhlDy3jC2sxtg7Q1NxYs
	 6NX9tVY1rQIrQNnHthChnRVe5S03lsbyLHfRZ9SW/QQWDRikNnOySCbL48vsb8Y+Ky
	 5dYFkcCQCG3vWOeGpQDq9rlsJD9zq26DuXfB6Q/tNduNxCAmN0TPNdnps+sDBr24r6
	 UokrNkpy94Fyw==
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
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v11 2/5] revocable: Add KUnit test cases
Date: Wed, 13 May 2026 17:10:40 +0800
Message-ID: <20260513091043.6766-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260513091043.6766-1-tzungbi@kernel.org>
References: <20260513091043.6766-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9826B530B08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-36734-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add KUnit test cases for the revocable API.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.
- Concurrent Access: Verifies multiple threads can access the resource.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v11:
- Move the test to drivers/base/test/.
- Add R-b tag.

v10: https://lore.kernel.org/all/20260508105448.31799-3-tzungbi@kernel.org
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
 MAINTAINERS                        |   1 +
 drivers/base/test/Kconfig          |   5 +
 drivers/base/test/Makefile         |   2 +
 drivers/base/test/revocable-test.c | 406 +++++++++++++++++++++++++++++
 4 files changed, 414 insertions(+)
 create mode 100644 drivers/base/test/revocable-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 424847de7a17..24c884e19cd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22869,6 +22869,7 @@ L:	driver-core@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	drivers/base/revocable.c
+F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 2756870615cc..fde950fcfac9 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -18,3 +18,8 @@ config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+
+config REVOCABLE_KUNIT_TEST
+	tristate "KUnit tests for revocable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index e321dfc7e922..7b5832d38436 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -6,3 +6,5 @@ obj-$(CONFIG_DM_KUNIT_TEST)	+= platform-device-test.o
 
 obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
+
+obj-$(CONFIG_REVOCABLE_KUNIT_TEST) += revocable-test.o
diff --git a/drivers/base/test/revocable-test.c b/drivers/base/test/revocable-test.c
new file mode 100644
index 000000000000..85ec83412bbf
--- /dev/null
+++ b/drivers/base/test/revocable-test.c
@@ -0,0 +1,406 @@
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
+
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


