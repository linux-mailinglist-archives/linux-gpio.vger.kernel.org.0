Return-Path: <linux-gpio+bounces-31378-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLVtKhiTgWl/HAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31378-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:18:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE11D522C
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 07:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB9BC3132995
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 06:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B6536E483;
	Tue,  3 Feb 2026 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNxCY7OD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70E36C0B4;
	Tue,  3 Feb 2026 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099133; cv=none; b=gwVAJK66SnYJCpUbHyiWB1dtsx4AETzWFNXpC68kwoOSZZAY9gQ340F3sbuiZh61mdn4oP8YfWKe9z4iWulbi5zC2igUOKBOQ0Na17v++2M0/+LWtLgCR71YmZx71M9z677w22/icbc6TATur7Gu7LYBcKv8bVqayBgaEyxN3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099133; c=relaxed/simple;
	bh=yQiJynIAbuFeeRMS6x1JyTsW8237/zPmWVWr/0DAPzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9mHp3tFuuS5P2AuilrSS/pNGTlg8rngx7b57t5+b38z/cBctKZY/akKHN+8KuNqdiMetYjtDjV1VsZ4O0ecieic64iVvQ0fwspFbVXQzjmXIz8tcxPc9iWiAGPUK4o5KrwgFfpGbz0OaABGlwK8J0gAGp16tz5IHoywAgPNyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNxCY7OD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19089C116D0;
	Tue,  3 Feb 2026 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770099132;
	bh=yQiJynIAbuFeeRMS6x1JyTsW8237/zPmWVWr/0DAPzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNxCY7OD/rcNlfOqxqyeEKrKEjgKPwe2bzveNeFWKBcmaxeVr4CsM87UPeZN8IUtW
	 poPT581dLhXD++sPmqr4Ng9yw0rTmb7XKWhYF0T/Qi5Mda12glpmxKX5bWrENR8f5/
	 3PdttxuXXSUhQfGoeZiS4+uB+Xg3j1R1agqlsM7O8EFMpfTGqvWKOrDUlwPQhsPQyv
	 4kPrVDIXukCYhTx0wLs4CKPfkxdgN0Pi68PabF2Lh+y/gTqoD8Fu+xC4MbOf66WuoR
	 7xj1ZEEsuZPFbFwhqAIX9v49ZXctKdZWRoUhMFTqXxmWgZyocpiOjh0gnzdm4VR7V9
	 f3g7qJgRnocaA==
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
Subject: [PATCH v2 08/11] gpio: cdev: Leverage revocable for accessing struct gpio_chip
Date: Tue,  3 Feb 2026 06:10:55 +0000
Message-ID: <20260203061059.975605-9-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-31378-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BE11D522C
X-Rspamd-Action: no action

Struct gpio_device now provides a revocable provider to the underlying
struct gpio_chip.  Leverage revocable for accessing the struct
gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.org.
  - Preserve a local storage for `struct revocable`.
- Combine multiple patches (see "v1:").

v1:
- https://lore.kernel.org/all/20260116081036.352286-14-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-15-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-16-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-17-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-18-tzungbi@kernel.org

 drivers/gpio/gpiolib-cdev.c | 70 ++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index aaa5de814468..ca9c04765df4 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -22,6 +22,7 @@
 #include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -210,10 +211,10 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
 	unsigned int i;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lh->gdev->srcu);
-
-	if (!rcu_access_pointer(lh->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(lh->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	switch (cmd) {
@@ -1432,10 +1433,10 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 {
 	struct linereq *lr = file->private_data;
 	void __user *ip = (void __user *)arg;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(lr->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	switch (cmd) {
@@ -1463,10 +1464,10 @@ static __poll_t linereq_poll(struct file *file,
 {
 	struct linereq *lr = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(lr->gdev->chip_rp, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &lr->wait, wait);
@@ -1485,10 +1486,10 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	struct gpio_v2_line_event le;
 	ssize_t bytes_read = 0;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(lr->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	if (count < sizeof(le))
@@ -1781,10 +1782,10 @@ static __poll_t lineevent_poll(struct file *file,
 {
 	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(le->gdev->chip_rp, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &le->wait, wait);
@@ -1819,10 +1820,10 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	ssize_t ge_size;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(le->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	/*
@@ -1901,10 +1902,10 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 	struct lineevent_state *le = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(le->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	/*
@@ -2434,11 +2435,11 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpio_device *gdev = cdev->gdev;
 	void __user *ip = (void __user *)arg;
-
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *gc;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!rcu_access_pointer(gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 	/* Fill in the struct and pass to userspace */
@@ -2497,12 +2498,9 @@ static void lineinfo_changed_func(struct work_struct *work)
 		 * Pin functions are in general much more static and while it's
 		 * not 100% bullet-proof, it's good enough for most cases.
 		 */
-		scoped_guard(srcu, &ctx->gdev->srcu) {
-			gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
-			if (gc &&
-			    !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
-				ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
-		}
+		REVOCABLE_TRY_ACCESS_WITH(ctx->gdev->chip_rp, gc);
+		if (gc && !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+			ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
 	}
 
 	ret = kfifo_in_spinlocked(&ctx->cdev->events, &ctx->chg, 1,
@@ -2583,10 +2581,10 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 {
 	struct gpio_chardev_data *cdev = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(cdev->gdev->chip_rp, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &cdev->wait, pollt);
@@ -2606,10 +2604,10 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 	size_t event_size;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
+	REVOCABLE_TRY_ACCESS_WITH(cdev->gdev->chip_rp, gc);
+	if (!gc)
 		return -ENODEV;
 
 #ifndef CONFIG_GPIO_CDEV_V1
-- 
2.53.0.rc2.204.g2597b5adb4-goog


