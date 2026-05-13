Return-Path: <linux-gpio+bounces-36733-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MmmFHxABGokGQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36733-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:12:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ADE530596
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CACC7305BF9C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4113E5A1B;
	Wed, 13 May 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKBUtfz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC213E51CC;
	Wed, 13 May 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663505; cv=none; b=JUjPUgIWnAELPh3fw2zm0F8Vez301x1Y+fjYPEd8/Kc1vGmwp0EcipVa43zhpoa13lsx+tyTRAuzD4DRNL/Ll5ygPuaC+X31fFt9MiZcU9FaM/l4VB7tFuasfQ78xFwVSBkSsl01V3LZ1XuHx74NTXDqzmORPAtAmTU7k5MpiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663505; c=relaxed/simple;
	bh=0NkzIJSkYtlvpvJ7vDF87jKOYvCLQY5DcnMfefeBaqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDo9sws/GbJHm/LH1GFD6+URSRN82V8cCxGyYA8l6ipd+wi0B1eCs/TBhoIsVsLiY5zd+00MVd1Uj5+K4ZOsrGqHOxiy/j2uPoF092h9JpS6DVtDSNZ07m4MCOvyRY0jwYKPX/9g5MjhhMJTmaaO8jKnbMdMtAlXL8BL/lBNW4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKBUtfz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F5FC2BCB8;
	Wed, 13 May 2026 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778663504;
	bh=0NkzIJSkYtlvpvJ7vDF87jKOYvCLQY5DcnMfefeBaqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IKBUtfz8yQN0uDPc9/9FF6gxKs3jppYUOBgMawkQVbmxLNU+9C5nHfj399UmWedR7
	 /g0umDKAT9W/K0B4OyPJiZ9wS671Cj45aAqGrCkCx59RukCeP4+7mo62z7lfZeB2G7
	 D8blrOlCDk8BvpZuTaHWgn1F+CBzbylFhyk4AMuD4oFqiVvuxTEHCTrAE+eI0qqdJ4
	 iMJPP5pjP8pl90i7ZY4Rg4RqZy26JWThZX/gYVm54r0b8qZjDUntOu+na3XUejkSOe
	 wnMItMFAzUhmPDvUhWKQffMalwpAE7OCYv1WKWTSYxuKHdqXHIJAqqmJyJRZ6a0YzE
	 yPmgCrhvAThmQ==
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
Subject: [PATCH v11 1/5] revocable: Revocable resource management
Date: Wed, 13 May 2026 17:10:39 +0800
Message-ID: <20260513091043.6766-2-tzungbi@kernel.org>
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
X-Rspamd-Queue-Id: D9ADE530596
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-36733-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

The "revocable" mechanism is a synchronization primitive designed to
manage safe access to resources that can be asynchronously removed or
invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
errors when interacting with resources whose lifetimes are not
guaranteed to outlast their consumers.

This is particularly useful in systems where resources can disappear
unexpectedly, such as those provided by hot-pluggable devices like
USB.  When a consumer holds a reference to such a resource, the
underlying device might be removed, causing the resource's memory to
be freed.  Subsequent access attempts by the consumer would then lead
to UAF errors.

Revocable addresses this by providing a form of "weak reference" and
a controlled access method.  It allows a resource consumer to safely
attempt to access the resource.  The mechanism guarantees that any
access granted is valid for the duration of its use.  If the resource
has already been revoked (i.e., freed), the access attempt will fail
safely, typically by returning NULL, instead of causing a crash.

It uses a provider/consumer model built on Sleepable RCU (SRCU) to
guarantee safe memory access:

- A resource provider, such as a driver for a hot-pluggable device,
  allocates a struct revocable and initializes it with a pointer
  to the resource.

- A resource consumer that wants to access the resource allocates a
  struct revocable_consumer containing a reference to the provider.

- To access the resource, the consumer uses revocable_try_access().
  This function enters an SRCU read-side critical section and returns
  the pointer to the resource.  If the provider has already freed the
  resource, it returns NULL.  After use, the consumer calls
  revocable_withdraw_access() to exit the SRCU critical section.  There
  are some macro level helpers for doing that.

  The API provides the following contract:

  - revocable_try_access() can be safely called from both process and
    atomic contexts.
  - It is permitted to sleep within the critical section established
    between revocable_try_access() and revocable_withdraw_access().
  - revocable_try_access() and the matching revocable_withdraw_access()
    must occur in the same context.  For example, it is illegal to
    invoke revocable_withdraw_access() in an irq handler if the matching
    revocable_try_access() was invoked in process context.

- When the provider needs to remove the resource, it calls
  revocable_revoke().  This function sets the internal resource
  pointer to NULL and then calls synchronize_srcu() to wait for all
  current readers to finish before the resource can be completely torn
  down.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v11:
- Add Reviewed-by and Tested-by tags.

v10: https://lore.kernel.org/all/20260508105448.31799-2-tzungbi@kernel.org
- Drop unused header.
- Unify handling of embedded and dynamic allocation.
- Rename:
  - struct revocable_consumer -> struct revocable_handle.
  - revocable_init() -> revocable_handle_init().
  - revocable_deinit() -> revocable_handle_deinit().
  - revocable_embed_init() -> revocable_init().

v9: https://lore.kernel.org/all/20260427135841.96266-2-tzungbi@kernel.org
- Add revocable_embed_init() and revocable_embed_destroy() for embedded
  resource provider per
  https://lore.kernel.org/all/CAMRc=MehkJc-js=Wk9vBAcXOpazqjtYDLPUEhmbN8U7Wu2YpgA@mail.gmail.com

v8: https://lore.kernel.org/all/20260213092307.858908-2-tzungbi@kernel.org
- Squash:
  - fdeb3ca3cca8 revocable: Remove redundant synchronize_srcu() call
  - 4d7dc4d1a62d revocable: Fix races in revocable_alloc() using RCU
  - 377563ce0653 revocable: fix SRCU index corruption by requiring caller-provided storage
- Rename macro names:
  - REVOCABLE_TRY_ACCESS_WITH() -> revocable_try_access_with().
  - REVOCABLE_TRY_ACCESS_SCOPED() -> revocable_try_access_with_scoped().
- Rename terminologies as now normal users should only "see" provider
  handles, using a shorter name for provider handle to echo the main
  concept.
  - struct revocable -> struct revocable_consumer.
  - struct revocable_provider -> struct revocable.
  - revocable_provider_alloc() -> revocable_alloc().
  - revocable_provider_revoke() -> revocable_revoke().
- New APIs:
  - revocable_get().
  - revocable_put().
  - revocable_try_access_or_return_err().
  - revocable_try_access_or_return().
  - revocable_try_access_or_return_void().
  - revocable_try_access_or_return_err_scoped().
  - revocable_try_access_or_return_scoped().
  - revocable_try_access_or_void_scoped().
  - revocable_try_access_or_skip_scoped().
- Add API contract that revocable_try_access() works from process and
  atomic context while also allowing sleeping inside the critical
  sections.
- Add revocable.h to the DRIVER CORE entry in MAINTAINERS.

v7: https://lore.kernel.org/all/20260116080235.350305-2-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Documentation/
  - Rephrase section "Revocable vs. Devres (devm)".
  - Include sections for struct revocable_provider and struct revocable.
- Minor rename: "revocable" -> "access_rev" for DEFINE_FREE().
- Add Acked-by tag.

v6: https://lore.kernel.org/all/20251106152330.11733-2-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add new REVOCABLE_TRY_ACCESS_WITH().
- Remove Acked-by tags as the API names changed a bit.

v5: https://lore.kernel.org/all/20251016054204.1523139-2-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/all/20250923075302.591026-2-tzungbi@kernel.org
- Rename:
  - revocable_provider_free() -> revocable_provider_revoke().
  - REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
  - revocable_release() -> revocable_withdraw_access().
- rcu_dereference() -> srcu_dereference() to fix a warning from lock debugging.
- Move most docs to kernel-doc, include them in Documentation/, and modify the
  commit message accordingly.
- Fix some doc errors.
- Add Acked-by tags.

v3: https://lore.kernel.org/all/20250912081718.3827390-2-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20250820081645.847919-2-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Add introduction in kernel-doc format in revocable.c.
- Add MAINTAINERS entry.
- Add copyright.
- Move from lib/ to drivers/base/.
- EXPORT_SYMBOL() -> EXPORT_SYMBOL_GPL().
- Add Documentation/.
- Rename _get() -> try_access(); _put() -> release().
- Fix a sparse warning by removing the redundant __rcu annotations.
- Fix a sparse warning by adding __acquires() and __releases() annotations.

v1: https://lore.kernel.org/all/20250814091020.1302888-2-tzungbi@kernel.org

A way to verify Documentation/:
- `make O=build SPHINXDIRS=driver-api/driver-model/ htmldocs`.

---
 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 384 ++++++++++++++++++
 MAINTAINERS                                   |   9 +
 drivers/base/Makefile                         |   2 +-
 drivers/base/revocable.c                      | 267 ++++++++++++
 include/linux/revocable.h                     | 204 ++++++++++
 6 files changed, 866 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 include/linux/revocable.h

diff --git a/Documentation/driver-api/driver-model/index.rst b/Documentation/driver-api/driver-model/index.rst
index abeb4b36636b..cc90b20bb192 100644
--- a/Documentation/driver-api/driver-model/index.rst
+++ b/Documentation/driver-api/driver-model/index.rst
@@ -14,3 +14,4 @@ Driver Model
    overview
    platform
    porting
+   revocable
diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
new file mode 100644
index 000000000000..9a20c2032695
--- /dev/null
+++ b/Documentation/driver-api/driver-model/revocable.rst
@@ -0,0 +1,384 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Revocable Resource Management
+==============================
+
+Overview
+========
+
+.. kernel-doc:: drivers/base/revocable.c
+   :doc: Overview
+
+Revocable vs. Devres (devm)
+===========================
+
+Revocable and Devres address different problems in resource management:
+
+*   **Devres:** Primarily addresses **resource leaks**.  The lifetime of the
+    resources is tied to the lifetime of the device.  The resource is
+    automatically freed when the device is unbound.  This cleanup happens
+    irrespective of any potential active users.
+
+*   **Revocable:** Primarily addresses **invalid memory access**,
+    such as Use-After-Free (UAF).  It's an independent synchronization
+    primitive that decouples consumer access from the resource's actual
+    presence.  Consumers interact with a "revocable object" (an intermediary),
+    not the underlying resource directly.  This revocable object persists as
+    long as there are active references to it from consumer handles.
+
+**Key Distinctions & How They Complement Each Other:**
+
+1.  **Reference Target:** Consumers hold a reference to the *revocable object*,
+    not the encapsulated resource itself.
+
+2.  **Resource Lifetime vs. Access:** The underlying resource's lifetime is
+    independent of the number of references to the revocable object.  The
+    resource can be freed at any point.  A common scenario is the resource
+    being freed by `devres` when the providing device is unbound.
+
+3.  **Safe Access:** Revocable provides a safe way to attempt access.  Before
+    using the resource, a consumer uses the Revocable API (e.g.,
+    revocable_try_access()).  This function checks if the resource is still
+    valid.  It returns a pointer to the resource only if it hasn't been
+    revoked; otherwise, it returns NULL.  This prevents UAF by providing a
+    clear signal that the resource is gone.
+
+4.  **Complementary Usage:** `devres` and Revocable work well together.
+    `devres` can handle the automatic allocation and deallocation of a
+    resource tied to a device.  The Revocable mechanism can be layered on top
+    to provide safe access for consumers whose lifetimes might extend beyond
+    the provider device's lifetime.  For instance, a userspace program might
+    keep a character device file open even after the physical device has been
+    removed.  In this case:
+
+    *   `devres` frees the device-specific resource upon unbinding.
+    *   The Revocable mechanism ensures that any subsequent operations on the
+        open file handle, which attempt to access the now-freed resource,
+        will fail gracefully (e.g., revocable_try_access() returns NULL)
+        instead of causing a UAF.
+
+In summary, `devres` ensures resources are *released* to prevent leaks, while
+the Revocable mechanism ensures that attempts to *access* these resources are
+done safely, even if the resource has been released.
+
+API and Usage
+=============
+
+For Resource Providers
+----------------------
+
+There are two ways to manage the resource provider handle (``struct revocable``):
+
+Dynamic Allocation
+~~~~~~~~~~~~~~~~~~
+
+If the lifetime of the ``struct revocable`` is not tied to another specific
+kernel object, or if multiple independent consumers need to hold references,
+dynamic allocation should be used.
+
+*   **Creation:** Use revocable_alloc() to allocate and initialize.
+*   **Ownership:** The caller receives a reference, and the provider holds
+    another.
+*   **Revocation:** Call revocable_revoke() when the resource is going away.
+    This drops the provider's reference.
+*   **Cleanup:** The caller *must* call revocable_put() to release its reference
+    when it no longer needs the handle.  The memory is freed automatically when
+    the last reference is dropped.
+
+Embedded Allocation
+~~~~~~~~~~~~~~~~~~~
+
+If the ``struct revocable`` can be embedded within a parent kernel object
+(e.g., a foo_device struct), this method can be simpler as the lifetime is
+inherently tied to the parent.
+
+*   **Initialization:** Declare a ``struct revocable`` within your parent
+    structure and initialize it with revocable_init().
+*   **Ownership:** The caller receives a reference, and the provider holds
+    another.
+*   **Revocation:** Call revocable_revoke() when the resource is going away.
+    This drops the provider's reference.
+*   **Cleanup:** The owner *must* call revocable_put() during the parent
+    object's teardown process and ensuring no more consumers can access
+    it.  This cleans up internal resources like the SRCU domain.  The memory
+    for the ``struct revocable`` is freed when the parent object is freed.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_alloc
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_init
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_revoke
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_get
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_put
+
+Example Usage (Dynamic Allocation)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    struct foo_device {
+        struct revocable *rev;
+        ...
+    };
+
+    int foo_device_probe(struct device *dev)
+    {
+        struct foo_device *foo_dev;
+        void *res;
+        int ret;
+
+        foo_dev = devm_kzalloc(dev, sizeof(*foo_dev), GFP_KERNEL);
+        if (!foo_dev)
+            return -ENOMEM;
+
+        // Acquire the actual resource.
+        res = ...(...);
+
+        // Allocate the revocable handle.
+        foo_dev->rev = revocable_alloc(res);
+        if (!foo_dev->rev)
+            return -ENOMEM;
+
+        dev_set_drvdata(dev, foo_dev);
+        // ... further device setup ...
+        return 0;
+    }
+
+    void foo_device_remove(struct device *dev)
+    {
+        struct foo_device *foo_dev = dev_get_drvdata(dev);
+
+        // Drop the reference.
+        revocable_put(foo_dev->rev);
+    }
+
+    // Provider side would use revocable_revoke() on foo_dev->rev.
+    // Consumer side would use revocable_try_access_* macros on foo_dev->rev.
+
+Example Usage (Embedded Allocation)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    struct foo_device {
+        struct revocable rev;
+        ...
+    };
+
+    int foo_device_probe(struct device *dev)
+    {
+        struct foo_device *foo_dev;
+        void *res;
+        int ret;
+
+        foo_dev = devm_kzalloc(dev, sizeof(*foo_dev), GFP_KERNEL);
+        if (!foo_dev)
+            return -ENOMEM;
+
+        // Acquire the actual resource.
+        res = ...(...);
+
+        // Initialize the embedded revocable.
+        ret = revocable_init(&foo_dev->rev, res);
+        if (ret)
+            return ret;
+
+        dev_set_drvdata(dev, foo_dev);
+        // ... further device setup ...
+        return 0;
+    }
+
+    void foo_device_remove(struct device *dev)
+    {
+        struct foo_device *foo_dev = dev_get_drvdata(dev);
+
+        // Cleanup the embedded revocable internal state.
+        revocable_put(&foo_dev->rev);
+    }
+
+    // Provider side would use revocable_revoke() on &foo_dev->rev.
+    // Consumer side would use revocable_try_access_* macros on &foo_dev->rev.
+
+For Resource Consumers
+----------------------
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_handle
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_handle_init
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_handle_deinit
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_try_access
+
+.. kernel-doc:: drivers/base/revocable.c
+   :identifiers: revocable_withdraw_access
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_with
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_with(rev, res);
+        // Always check if the resource is valid.
+        if (!res) {
+            pr_warn("Resource is not available\n");
+            return -EAGAIN;
+        }
+
+        // 'res' is guaranteed to be valid until this function exits.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_err
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENXIO if access fails.
+        revocable_try_access_or_return_err(rev, res, -ENXIO);
+
+        // 'res' is guaranteed to be valid if we reach here.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENODEV if access fails.
+        revocable_try_access_or_return(rev, res);
+
+        // 'res' is guaranteed to be valid if we reach here.
+        do_something_with(res);
+        return 0;
+    } // revocable_withdraw_access() is automatically called here.
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_with_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_with_scoped(rev, res) {
+            // Always check if the resource is valid.
+            if (!res) {
+                pr_warn("Resource is not available\n");
+                return -EAGAIN;
+            }
+
+            // 'res' is valid for the rest of this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0;
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_err_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENXIO if access fails.
+        revocable_try_access_or_return_err_scoped(rev, res, -ENXIO) {
+            // 'res' is guaranteed to be valid in this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0; // Only reached if resource was accessed.
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_return_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        // Returns -ENODEV if access fails.
+        revocable_try_access_or_return_scoped(rev, res) {
+            // 'res' is guaranteed to be valid in this block.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0; // Only reached if resource was accessed.
+    }
+
+.. kernel-doc:: include/linux/revocable.h
+   :identifiers: revocable_try_access_or_skip_scoped
+
+Example Usage
+~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int consumer_use_resource(struct revocable *rev)
+    {
+        struct foo_resource *res;
+
+        revocable_try_access_or_skip_scoped(rev, res) {
+            // This block is ONLY entered if 'res' is not NULL.
+            do_something_with(res);
+        }
+        // revocable_withdraw_access() is automatically called here.
+
+        return 0;
+    }
diff --git a/MAINTAINERS b/MAINTAINERS
index b2040011a386..424847de7a17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7813,6 +7813,7 @@ F:	include/linux/fwnode.h
 F:	include/linux/kobj*
 F:	include/linux/ksysfs.h
 F:	include/linux/property.h
+F:	include/linux/revocable.h
 F:	include/linux/sysfs.h
 F:	kernel/ksysfs.c
 F:	lib/kobj*
@@ -22862,6 +22863,14 @@ F:	include/uapi/linux/rseq.h
 F:	kernel/rseq.c
 F:	tools/testing/selftests/rseq/
 
+REVOCABLE RESOURCE MANAGEMENT
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
+L:	driver-core@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
+F:	drivers/base/revocable.c
+F:	include/linux/revocable.h
+
 RFKILL
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linux-wireless@vger.kernel.org
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..bdf854694e39 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o faux.o
+			   swnode.o faux.o revocable.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
new file mode 100644
index 000000000000..3fb747d749ab
--- /dev/null
+++ b/drivers/base/revocable.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * Revocable resource management
+ */
+
+#include <linux/kref.h>
+#include <linux/revocable.h>
+#include <linux/slab.h>
+#include <linux/srcu.h>
+
+/**
+ * DOC: Overview
+ *
+ * The "revocable" mechanism is a synchronization primitive designed to
+ * manage safe access to resources that can be asynchronously removed or
+ * invalidated.  Its primary purpose is to prevent Use-After-Free (UAF)
+ * errors when interacting with resources whose lifetimes are not
+ * guaranteed to outlast their consumers.
+ *
+ * This is particularly useful in systems where resources can disappear
+ * unexpectedly, such as those provided by hot-pluggable devices like
+ * USB.  When a consumer holds a reference to such a resource, the
+ * underlying device might be removed, causing the resource's memory to
+ * be freed.  Subsequent access attempts by the consumer would then lead
+ * to UAF errors.
+ *
+ * Revocable addresses this by providing a form of "weak reference" and
+ * a controlled access method.  It allows a resource consumer to safely
+ * attempt to access the resource.  The mechanism guarantees that any
+ * access granted is valid for the duration of its use.  If the resource
+ * has already been revoked (i.e., freed), the access attempt will fail
+ * safely, typically by returning NULL, instead of causing a crash.
+ *
+ * It uses a provider/consumer model built on Sleepable RCU (SRCU) to
+ * guarantee safe memory access:
+ *
+ * - A resource provider, such as a driver for a hot-pluggable device,
+ *   allocates a struct revocable and initializes it with a pointer
+ *   to the resource.
+ *
+ * - A resource consumer that wants to access the resource allocates a
+ *   struct revocable_handle containing a reference to the provider.
+ *
+ * - To access the resource, the consumer uses revocable_try_access().
+ *   This function enters an SRCU read-side critical section and returns
+ *   the pointer to the resource.  If the provider has already freed the
+ *   resource, it returns NULL.  After use, the consumer calls
+ *   revocable_withdraw_access() to exit the SRCU critical section.  There
+ *   are some macro level helpers for doing that.
+ *
+ *   The API provides the following contract:
+ *
+ *   - revocable_try_access() can be safely called from both process and
+ *     atomic contexts.
+ *   - It is permitted to sleep within the critical section established
+ *     between revocable_try_access() and revocable_withdraw_access().
+ *   - revocable_try_access() and the matching revocable_withdraw_access()
+ *     must occur in the same context.  For example, it is illegal to
+ *     invoke revocable_withdraw_access() in an irq handler if the matching
+ *     revocable_try_access() was invoked in process context.
+ *
+ * - When the provider needs to remove the resource, it calls
+ *   revocable_revoke().  This function sets the internal resource
+ *   pointer to NULL and then calls synchronize_srcu() to wait for all
+ *   current readers to finish before the resource can be completely torn
+ *   down.
+ */
+
+static void revocable_release(struct kref *kref)
+{
+	struct revocable *rev = container_of(kref, typeof(*rev), kref);
+
+	cleanup_srcu_struct(&rev->srcu);
+
+	if (!rev->embedded)
+		kfree(rev);
+}
+
+/**
+ * revocable_alloc() - Allocate struct revocable.
+ * @res: The pointer of resource.
+ *
+ * This allocates a resource provider handle and holds 2 initial reference
+ * counts to the handle.  If revocable_alloc() succeed:
+ *
+ * - The provider should call revocable_revoke() for dropping a reference.
+ * - The caller should call revocable_put() for dropping another reference.
+ *
+ * Return: The pointer of struct revocable.  NULL on errors.
+ */
+struct revocable *revocable_alloc(void *res)
+{
+	struct revocable *rev;
+	int ret;
+
+	rev = kzalloc_obj(*rev);
+	if (!rev)
+		return NULL;
+
+	ret = revocable_init(rev, res);
+	if (ret) {
+		kfree(rev);
+		return NULL;
+	}
+
+	rev->embedded = false;
+	return rev;
+}
+EXPORT_SYMBOL_GPL(revocable_alloc);
+
+/**
+ * revocable_init() - Initialize struct revocable.
+ * @rev: The pointer of resource provider.
+ * @res: The pointer of resource.
+ *
+ * This initializes a resource provider handle embedded within another
+ * structure and holds 2 initial reference counts to the handle.
+ *
+ * If revocable_init() succeed:
+ *
+ * - The provider should call revocable_revoke() for dropping a reference.
+ * - The caller should call revocable_put() for dropping another reference.
+ */
+int revocable_init(struct revocable *rev, void *res)
+{
+	int ret;
+
+	ret = init_srcu_struct(&rev->srcu);
+	if (ret)
+		return ret;
+
+	RCU_INIT_POINTER(rev->res, res);
+	kref_init(&rev->kref);
+	kref_get(&rev->kref);
+	rev->embedded = true;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(revocable_init);
+
+/**
+ * revocable_revoke() - Revoke the managed resource.
+ * @rev: The pointer of resource provider.
+ *
+ * This sets the resource `(struct revocable *)->res` to NULL to indicate
+ * the resource has gone.
+ *
+ * This drops a reference count to the resource provider.  If it is the
+ * final reference, revocable_release() will be called to free the internal
+ * resources.
+ */
+void revocable_revoke(struct revocable *rev)
+{
+	rcu_assign_pointer(rev->res, NULL);
+	synchronize_srcu(&rev->srcu);
+	revocable_put(rev);
+}
+EXPORT_SYMBOL_GPL(revocable_revoke);
+
+/**
+ * revocable_get() - Increase a reference count to the provider handle.
+ * @rev: The pointer of resource provider.
+ *
+ * This increments the reference count.
+ */
+void revocable_get(struct revocable *rev)
+{
+	kref_get(&rev->kref);
+}
+EXPORT_SYMBOL_GPL(revocable_get);
+
+/**
+ * revocable_put() - Decrease a reference count to the provider handle.
+ * @rev: The pointer of resource provider.
+ *
+ * This drops a reference count to the resource provider.  If it is the
+ * final reference, revocable_release() will be called to free the internal
+ * resources.
+ */
+void revocable_put(struct revocable *rev)
+{
+	kref_put(&rev->kref, revocable_release);
+}
+EXPORT_SYMBOL_GPL(revocable_put);
+
+/**
+ * revocable_handle_init() - Initialize struct revocable_handle.
+ * @rev: The pointer of resource provider.
+ * @rh: The pointer of resource_handle.
+ *
+ * This initializes a handle owned by the consumer and holds a reference
+ * count to the resource provider.
+ */
+void revocable_handle_init(struct revocable *rev, struct revocable_handle *rh)
+{
+	revocable_get(rev);
+	rh->rev = rev;
+}
+EXPORT_SYMBOL_GPL(revocable_handle_init);
+
+/**
+ * revocable_handle_deinit() - Deinitialize struct revocable_handle.
+ * @rh: The pointer of resource_handle.
+ *
+ * This drops a reference count to the resource provider.  If it is the
+ * final reference, revocable_release() will be called to free the internal
+ * resources.
+ */
+void revocable_handle_deinit(struct revocable_handle *rh)
+{
+	struct revocable *rev = rh->rev;
+
+	revocable_put(rev);
+}
+EXPORT_SYMBOL_GPL(revocable_handle_deinit);
+
+/**
+ * revocable_try_access() - Try to access the resource.
+ * @rh: The pointer of resource_handle.
+ *
+ * This tries to de-reference to the resource and enters a SRCU critical
+ * section.
+ *
+ * The function is safe to be called from both process and atomic contexts.
+ * While holding the access (i.e. before calling revocable_withdraw_access()),
+ * the caller is allowed to sleep.
+ *
+ * Note that revocable_try_access() and the matching
+ * revocable_withdraw_access() must occur in the same context.  For example, it
+ * is illegal to invoke revocable_withdraw_access() in an irq handler if the
+ * matching revocable_try_access() was invoked in process context.
+ *
+ * Return: The pointer to the resource.  NULL if the resource has gone.
+ */
+void *revocable_try_access(struct revocable_handle *rh)
+	__acquires(&rh->rev->srcu)
+{
+	struct revocable *rev = rh->rev;
+
+	rh->idx = srcu_read_lock(&rev->srcu);
+	return srcu_dereference(rev->res, &rev->srcu);
+}
+EXPORT_SYMBOL_GPL(revocable_try_access);
+
+/**
+ * revocable_withdraw_access() - Stop accessing to the resource.
+ * @rh: The pointer of resource_handle.
+ *
+ * Call this function to indicate the resource is no longer used.  It exits
+ * the SRCU critical section.
+ *
+ * The function is safe to be called from both process and atomic contexts.
+ *
+ * Note that revocable_try_access() and the matching
+ * revocable_withdraw_access() must occur in the same context.  For example, it
+ * is illegal to invoke revocable_withdraw_access() in an irq handler if the
+ * matching revocable_try_access() was invoked in process context.
+ */
+void revocable_withdraw_access(struct revocable_handle *rh)
+	__releases(&rh->rev->srcu)
+{
+	struct revocable *rev = rh->rev;
+
+	srcu_read_unlock(&rev->srcu, rh->idx);
+}
+EXPORT_SYMBOL_GPL(revocable_withdraw_access);
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
new file mode 100644
index 000000000000..b66d41b92ee5
--- /dev/null
+++ b/include/linux/revocable.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2026 Google LLC
+ */
+
+#ifndef __LINUX_REVOCABLE_H
+#define __LINUX_REVOCABLE_H
+
+#include <linux/cleanup.h>
+#include <linux/kref.h>
+#include <linux/srcu.h>
+
+/**
+ * struct revocable - A handle for resource provider.
+ * @srcu: The SRCU to protect the resource.
+ * @res:  The pointer of resource.  It can point to anything.
+ * @kref: The refcount for this handle.
+ * @embedded: Indicate if the handle is embedded in another struct.
+ *
+ * Note: All members of this structure are intended to be opaque and should
+ * not be accessed directly by the users.
+ */
+struct revocable {
+	struct srcu_struct srcu;
+	void __rcu *res;
+	struct kref kref;
+	bool embedded;
+};
+
+/**
+ * struct revocable_handle - A handle for resource consumer.
+ * @rev: The pointer of resource provider.
+ * @idx: The index for the SRCU critical section.
+ *
+ * Note: All members of this structure are intended to be opaque and should
+ * not be accessed directly by the users.
+ */
+struct revocable_handle {
+	struct revocable *rev;
+	int idx;
+};
+
+struct revocable *revocable_alloc(void *res);
+int revocable_init(struct revocable *rev, void *res);
+void revocable_revoke(struct revocable *rev);
+void revocable_get(struct revocable *rev);
+void revocable_put(struct revocable *rev);
+
+void revocable_handle_init(struct revocable *rev, struct revocable_handle *rh);
+void revocable_handle_deinit(struct revocable_handle *rh);
+void *revocable_try_access(struct revocable_handle *rh)
+	__acquires(&rh->rev->srcu);
+void revocable_withdraw_access(struct revocable_handle *rh)
+	__releases(&rh->rev->srcu);
+
+DEFINE_FREE(access_rev, struct revocable_handle *, {
+	revocable_withdraw_access(_T);
+	revocable_handle_deinit(_T);
+})
+
+#define _revocable_try_access_with(_rev, _rh, _res)				\
+	struct revocable_handle _rh;						\
+	struct revocable_handle *__UNIQUE_ID(name) __free(access_rev) = &_rh;	\
+										\
+	revocable_handle_init(_rev, &_rh);					\
+	_res = revocable_try_access(&_rh)
+
+/**
+ * revocable_try_access_with() - A helper for accessing revocable resource
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * The macro simplifies the access-release cycle for consumers, ensuring that
+ * corresponding revocable_withdraw_access() and revocable_handle_deinit() are
+ * called, even in the case of an early exit.
+ *
+ * It creates a local variable in the current scope.  @_res is populated with
+ * the result of revocable_try_access().  Callers **must** check if @_res is
+ * ``NULL`` before using it.  The revocable_withdraw_access() function is
+ * automatically called when the scope is exited.
+ *
+ * Note: It shares the same issue with guard() in cleanup.h.  No goto statements
+ * are allowed before the helper.  Otherwise, the compiler fails with
+ * "jump bypasses initialization of variable with __attribute__((cleanup))".
+ */
+#define revocable_try_access_with(_rev, _res)					\
+	_revocable_try_access_with(_rev, __UNIQUE_ID(name), _res)
+
+/**
+ * revocable_try_access_or_return_err() - Variant of revocable_try_access_with()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ * @_err: The error code to return if resource is revoked.
+ *
+ * Similar to revocable_try_access_with() but returns from the current function
+ * with @_err if the resource is revoked.  Callers don't need to check @_res for
+ * ``NULL`` as this handles the revocation case by returning early.
+ */
+#define revocable_try_access_or_return_err(_rev, _res, _err)			\
+	_revocable_try_access_with(_rev, __UNIQUE_ID(name), _res);		\
+	if (!_res)								\
+		return _err
+
+/**
+ * revocable_try_access_or_return() - Variant of revocable_try_access_with()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err() but returns -ENODEV if the
+ * resource is revoked.
+ */
+#define revocable_try_access_or_return(_rev, _res)				\
+	revocable_try_access_or_return_err(_rev, _res, -ENODEV)
+
+/**
+ * revocable_try_access_or_return_void() - Variant of revocable_try_access_with()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err() but returns void if the
+ * resource is revoked.
+ */
+#define revocable_try_access_or_return_void(_rev, _res)				\
+	revocable_try_access_or_return_err(_rev, _res, )
+
+#define _revocable_try_access_with_scoped(_rev, _rh, _label, _res)		\
+	for (struct revocable_handle _rh,					\
+			*__UNIQUE_ID(name) __free(access_rev) = &_rh;		\
+	     ({ revocable_handle_init(_rev, &_rh);				\
+		_res = revocable_try_access(&_rh);				\
+		true; });							\
+	     ({ goto _label; }))						\
+		if (0) {							\
+_label:										\
+			break;							\
+		} else
+
+/**
+ * revocable_try_access_with_scoped() - Variant of revocable_try_access_with()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_with() but with an explicit scope from a
+ * temporary ``for`` loop.
+ */
+#define revocable_try_access_with_scoped(_rev, _res)				\
+	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)
+
+/**
+ * revocable_try_access_or_return_err_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ * @_err: The error code to return if resource is revoked.
+ *
+ * Similar to revocable_try_access_with_scoped() but returns from the current
+ * function with @_err if the resource is revoked.  Callers don't need to check
+ * @_res for ``NULL`` as this handles the revocation case by returning early.
+ */
+#define revocable_try_access_or_return_err_scoped(_rev, _res, _err)		\
+	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)		\
+	if (!_res) {								\
+		return _err;							\
+	} else
+
+/**
+ * revocable_try_access_or_return_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err_scoped() but returns -ENODEV
+ * if the resource is revoked.
+ */
+#define revocable_try_access_or_return_scoped(_rev, _res)			\
+	revocable_try_access_or_return_err_scoped(_rev, _res, -ENODEV)
+
+/**
+ * revocable_try_access_or_return_void_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_or_return_err_scoped() but returns void
+ * if the resource is revoked.
+ */
+#define revocable_try_access_or_return_void_scoped(_rev, _res)			\
+	revocable_try_access_or_return_err_scoped(_rev, _res, )
+
+/**
+ * revocable_try_access_or_skip_scoped() - Variant of revocable_try_access_with_scoped()
+ * @_rev: The pointer of resource provider.
+ * @_res: A pointer variable that will be assigned the resource.
+ *
+ * Similar to revocable_try_access_with_scoped() but skips the following code
+ * block if the resource is revoked.
+ */
+#define revocable_try_access_or_skip_scoped(_rev, _res)				\
+	_revocable_try_access_with_scoped(_rev, __UNIQUE_ID(name),		\
+					  __UNIQUE_ID(label), _res)		\
+	if (!_res) {								\
+		break;								\
+	} else
+
+#endif /* __LINUX_REVOCABLE_H */
-- 
2.51.0


