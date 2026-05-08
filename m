Return-Path: <linux-gpio+bounces-36453-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAvqKMvC/WkpigAAu9opvQ
	(envelope-from <linux-gpio+bounces-36453-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:02:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A04F5714
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C48C30C09FE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 10:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8F63446AB;
	Fri,  8 May 2026 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiZkIDNu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDC345CAE;
	Fri,  8 May 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237755; cv=none; b=lsnP49gbE8v/pzRldZ6xb3uE5ifhzvClGDswZzFVh3LflmjDw9EyasnxpYTtesR4VLsTqP3eP8qyB4NHa8Y+8vHPPW90DO0z3hNXUVAxnMI4DhH2pTN+4vkhCBjQZQ9/8vDva0jwChR9+dGh7T9W4K5/Xq6EhdIbthi8w4/JTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237755; c=relaxed/simple;
	bh=v+BzLZhhFii4PcYFeQkCkVoCdjXrTXNwuPyP+/iYktU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ja9EAQ5ZFQRH8rh22gqIAEoFv/OOAcOrJpy9JAc5pT5A2RbCYPzfzbj1py0OLKLK03cpMIAxY4IxU///g771H7E2FIX4RjnI0X0G6EJkVcBgS5vvFLv3V2h4Gb7gonocZa/2ymfB6XEeAFapnH1GhoBFsIqxRRCvjZC2nqq+oZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiZkIDNu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082E3C2BCC7;
	Fri,  8 May 2026 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778237755;
	bh=v+BzLZhhFii4PcYFeQkCkVoCdjXrTXNwuPyP+/iYktU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hiZkIDNu4/XbooIFT6MR1tHXJU7X/TQI0HBtTasmGjc71nYFHRtysTkDIZ5BTn1r4
	 2q4t7DgMk1QBlOx1vI2ByykZP5P+Y9S08cppbnSzka5IZnNq0KOLzP5wB4ZSdjiZfJ
	 Wd1TSB5/8gtc+MBUwSIpTUvF+XUqKjgXM+SgGXOYVC0Suqxa1E4lrA2cS5TjHimIOV
	 NONzFSh5cg9SiV2fOhCJVrkUoKvkb8VE7LV7BIoFC9srueiNkxWuDE8fBRwL19oNyI
	 6J4bqlweRM8v5Gcci+4bhkDEBvQWm39N+HkP39XQuDxQoM6BNdWNXmhLZHcjbrDy4u
	 dykS3NekEqCWA==
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
Subject: [PATCH v10 9/9] platform/chrome: cros_ec_chardev: Consume cros_ec_device via revocable
Date: Fri,  8 May 2026 18:54:48 +0800
Message-ID: <20260508105448.31799-10-tzungbi@kernel.org>
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
X-Rspamd-Queue-Id: 261A04F5714
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
	TAGGED_FROM(0.00)[bounces-36453-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Action: no action

The cros_ec_chardev driver provides a character device interface to the
ChromeOS EC.  A file handle to this device can remain open in userspace
even if the underlying EC device is removed.

This creates a classic use-after-free vulnerability.  Any file operation
(ioctl, release, etc.) on the open handle after the EC device has gone
would access a stale pointer, leading to a system crash.

To prevent this, leverage the revocable and convert cros_ec_chardev to a
resource consumer of cros_ec_device.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v10:
- No changes.

v9: https://lore.kernel.org/all/20260427135841.96266-10-tzungbi@kernel.org
- New to the series.
- Change revocable API usages accordingly.

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20250912081718.3827390-6-tzungbi@kernel.org
- Use specific labels for different cleanup in cros_ec_chardev_open().

v2: https://lore.kernel.org/all/20250820081645.847919-6-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Fix a sparse warning by removing the redundant __rcu annotation.

v1: https://lore.kernel.org/all/20250814091020.1302888-4-tzungbi@kernel.org

---
 drivers/platform/chrome/cros_ec_chardev.c | 80 +++++++++++++++++------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 002be3352100..c597dc92d519 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -22,6 +22,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -32,7 +33,7 @@
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
 struct chardev_priv {
-	struct cros_ec_device *ec_dev;
+	struct revocable *rev;
 	struct notifier_block notifier;
 	wait_queue_head_t wait_event;
 	unsigned long event_mask;
@@ -55,6 +56,7 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	};
 	struct ec_response_get_version *resp;
 	struct cros_ec_command *msg;
+	struct cros_ec_device *ec_dev;
 	int ret;
 
 	msg = kzalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
@@ -64,12 +66,19 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	msg->command = EC_CMD_GET_VERSION + priv->cmd_offset;
 	msg->insize = sizeof(*resp);
 
-	ret = cros_ec_cmd_xfer_status(priv->ec_dev, msg);
-	if (ret < 0) {
-		snprintf(str, maxlen,
-			 "Unknown EC version, returned error: %d\n",
-			 msg->result);
-		goto exit;
+	revocable_try_access_with_scoped(priv->rev, ec_dev) {
+		if (!ec_dev) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+		if (ret < 0) {
+			snprintf(str, maxlen,
+				 "Unknown EC version, returned error: %d\n",
+				 msg->result);
+			goto exit;
+		}
 	}
 
 	resp = (struct ec_response_get_version *)msg->data;
@@ -92,10 +101,15 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 {
 	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
 						 notifier);
-	struct cros_ec_device *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct ec_event *event;
-	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
-	int total_size = sizeof(*event) + ec_dev->event_size;
+	unsigned long event_bit;
+	int total_size;
+
+	revocable_try_access_or_return_err(priv->rev, ec_dev, NOTIFY_DONE);
+
+	event_bit = 1 << ec_dev->event_data.event_type;
+	total_size = sizeof(*event) + ec_dev->event_size;
 
 	if (!(event_bit & priv->event_mask) ||
 	    (priv->event_len + total_size) > CROS_MAX_EVENT_LEN)
@@ -166,7 +180,8 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ec_dev = ec_dev;
+	priv->rev = ec_dev->its_rev;
+	revocable_get(priv->rev);
 	priv->cmd_offset = ec->cmd_offset;
 	filp->private_data = priv;
 	INIT_LIST_HEAD(&priv->events);
@@ -178,6 +193,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 					       &priv->notifier);
 	if (ret) {
 		dev_err(ec_dev->dev, "failed to register event notifier\n");
+		revocable_put(priv->rev);
 		kfree(priv);
 	}
 
@@ -251,11 +267,13 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_device *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct ec_event *event, *e;
 
-	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
-					   &priv->notifier);
+	revocable_try_access_or_skip_scoped(priv->rev, ec_dev)
+		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+						   &priv->notifier);
+	revocable_put(priv->rev);
 
 	list_for_each_entry_safe(event, e, &priv->events, node) {
 		list_del(&event->node);
@@ -273,6 +291,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 {
 	struct cros_ec_command *s_cmd;
 	struct cros_ec_command u_cmd;
+	struct cros_ec_device *ec_dev;
 	long ret;
 
 	if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
@@ -299,10 +318,17 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 	}
 
 	s_cmd->command += priv->cmd_offset;
-	ret = cros_ec_cmd_xfer(priv->ec_dev, s_cmd);
-	/* Only copy data to userland if data was received. */
-	if (ret < 0)
-		goto exit;
+	revocable_try_access_with_scoped(priv->rev, ec_dev) {
+		if (!ec_dev) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		ret = cros_ec_cmd_xfer(ec_dev, s_cmd);
+		/* Only copy data to userland if data was received. */
+		if (ret < 0)
+			goto exit;
+	}
 
 	if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + s_cmd->insize))
 		ret = -EFAULT;
@@ -313,10 +339,12 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 
 static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user *arg)
 {
-	struct cros_ec_device *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
+	revocable_try_access_or_return(priv->rev, ec_dev);
+
 	/* Not every platform supports direct reads */
 	if (!ec_dev->cmd_readmem)
 		return -ENOTTY;
@@ -370,11 +398,25 @@ static const struct file_operations chardev_fops = {
 #endif
 };
 
+static void cros_ec_chardev_free(void *data)
+{
+	struct revocable *rev = data;
+
+	revocable_put(rev);
+}
+
 static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
+	struct revocable *rev = ec->ec_dev->its_rev;
 	struct miscdevice *misc;
+	int ret;
+
+	revocable_get(rev);
+	ret = devm_add_action_or_reset(&pdev->dev, cros_ec_chardev_free, rev);
+	if (ret)
+		return ret;
 
 	/* Create a char device: we want to create it anew */
 	misc = devm_kzalloc(&pdev->dev, sizeof(*misc), GFP_KERNEL);
-- 
2.51.0


