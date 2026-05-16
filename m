Return-Path: <linux-gpio+bounces-36962-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C8WLk6CCGo2tAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36962-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 16:42:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587855C248
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 16:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 432093004F6B
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 14:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945CB3E2AB6;
	Sat, 16 May 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRSOShqv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F871175A7D;
	Sat, 16 May 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942537; cv=none; b=JoMZCB/8hsZR4iKIm/8aLUy4ZVSSDVoVl4J5yzwUzQgP07TnN2VZrkYrkfWuinfcCO+aFBN4WcJL7qNNqXwXKFlpQuYathqV88AHJkAFOcu0LKsUdpSt+PItfLDhsxscf6YjnFUkOSIADYoL1/R9pLASrdbB6+vo7JWqGMTVMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942537; c=relaxed/simple;
	bh=i/FYLgSikrkeun5I054A2xlFhy9CCMMcMXS/Bt1zCXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF13AymMIL95tJgMO2vBJkm9RgxL+9rl0L6AqzUDghotVXjnhxyEdxXlhkX2DZ5tZQqkStyomoVEoBvx+8Hr+nv8SDSYvPTNvtgwRNlYrufTPCMMAXSDqiR6kjx41FeuzkwgMyosICYWhWEHeAC9ovEzuArond6BQfch0+kA+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRSOShqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A48C19425;
	Sat, 16 May 2026 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778942536;
	bh=i/FYLgSikrkeun5I054A2xlFhy9CCMMcMXS/Bt1zCXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRSOShqv+SPJBBmRHza7dYwW5UetezG4OhxWQTqFdmBwUGPePc5r4iTjXIRH4cEW7
	 2hJDrt7I+RzFNHZYe7y8GwWCcLvpQLPrSUrT5LBFOelpzRHPBeaj61KahyD5lLtL7R
	 MBWsoJNJqvXlXrVbpPyp612tXVm4JCTbE+h9kSRLgNJWmnPiAxMGWLee+utlkRyCD6
	 CAxIk5CfCKlSQzVGB1fm3MwXXg0LCFy4sUYddlus22d0qJ4Em0m7gky1b8j+zVFqfm
	 uIH32/yXnKgpBFOXaMlOh6Fm+mE9JH8kviQG0q7dq3FHQQG9hfz1wurCjJq3o+c42A
	 O81qSlXNTFCMQ==
Date: Sat, 16 May 2026 22:42:09 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v11 4/5] platform/chrome: Protect cros_ec_device
 lifecycle with revocable
Message-ID: <agiCQQO9KGoMS1Jj@tzungbi-laptop>
References: <20260513091043.6766-1-tzungbi@kernel.org>
 <20260513091043.6766-5-tzungbi@kernel.org>
 <20260513115102.GF7655@nvidia.com>
 <agVCtBbqT6aZL0mx@google.com>
 <20260514160043.GG787748@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514160043.GG787748@nvidia.com>
X-Rspamd-Queue-Id: 6587855C248
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36962-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 01:00:43PM -0300, Jason Gunthorpe wrote:
> On Thu, May 14, 2026 at 03:34:12AM +0000, Tzung-Bi Shih wrote:
> 
> > To help me understand, could you elaborate on why the revocable mechanism
> > isn't suitable here?
> 
> Stay within one driver. Create the revokable is probe, consume it
> within that drivers fops/etc, destroy it on remove. Do not randomly
> pass it to other drivers.

In that sense, after applying [1], does the patch make sense to you?

[1] https://lore.kernel.org/all/20260516143017.18560-1-tzungbi@kernel.org

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 450f79759122..27e52fee59f6 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -23,7 +23,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
-#include <linux/rwsem.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -39,8 +39,7 @@
 struct chardev_pdata {
 	struct miscdevice misc;
 	struct kref kref;
-	struct rw_semaphore ec_dev_sem;
-	struct cros_ec_device *ec_dev;
+	struct revocable ec_rev;
 	u16 cmd_offset;
 	struct blocking_notifier_head subscribers;
 	struct notifier_block relay;
@@ -50,6 +49,7 @@ static void chardev_pdata_release(struct kref *kref)
 {
 	struct chardev_pdata *pdata = container_of(kref, typeof(*pdata), kref);
 
+	revocable_put(&pdata->ec_rev);
 	kfree(pdata);
 }
 
@@ -87,6 +87,7 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	};
 	struct ec_response_get_version *resp;
 	struct cros_ec_command *msg;
+	struct cros_ec_device *ec_dev;
 	int ret;
 
 	msg = kzalloc(sizeof(*msg) + sizeof(*resp), GFP_KERNEL);
@@ -96,13 +97,13 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	msg->command = EC_CMD_GET_VERSION + priv->pdata->cmd_offset;
 	msg->insize = sizeof(*resp);
 
-	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
-		if (!priv->pdata->ec_dev) {
+	revocable_try_access_with_scoped(&priv->pdata->ec_rev, ec_dev) {
+		if (!ec_dev) {
 			ret = -ENODEV;
 			goto exit;
 		}
 
-		ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
+		ret = cros_ec_cmd_xfer_status(ec_dev, msg);
 		if (ret < 0) {
 			snprintf(str, maxlen,
 				 "Unknown EC version, returned error: %d\n",
@@ -136,10 +137,8 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 	unsigned long event_bit;
 	int total_size;
 
-	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
-	if (!priv->pdata->ec_dev)
-		return NOTIFY_DONE;
-	ec_dev = priv->pdata->ec_dev;
+	revocable_try_access_or_return_err(&priv->pdata->ec_rev, ec_dev,
+					   NOTIFY_DONE);
 
 	event_bit = 1 << ec_dev->event_data.event_type;
 	total_size = sizeof(*event) + ec_dev->event_size;
@@ -206,6 +205,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	struct miscdevice *mdev = filp->private_data;
 	struct chardev_pdata *pdata = container_of(mdev, typeof(*pdata), misc);
 	struct chardev_priv *priv;
+	struct cros_ec_device *ec_dev;
 	int ret;
 
 	priv = kzalloc_obj(*priv);
@@ -223,11 +223,9 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	ret = blocking_notifier_chain_register(&pdata->subscribers,
 					       &priv->notifier);
 	if (ret) {
-		scoped_guard(rwsem_read, &pdata->ec_dev_sem) {
-			if (pdata->ec_dev)
-				dev_err(pdata->ec_dev->dev,
-					"failed to register event notifier\n");
-		}
+		revocable_try_access_or_skip_scoped(&pdata->ec_rev, ec_dev)
+			dev_err(ec_dev->dev,
+				"failed to register event notifier\n");
 		kref_put(&priv->pdata->kref, chardev_pdata_release);
 		kfree(priv);
 	}
@@ -324,6 +322,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 {
 	struct cros_ec_command *s_cmd;
 	struct cros_ec_command u_cmd;
+	struct cros_ec_device *ec_dev;
 	long ret;
 
 	if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
@@ -351,13 +350,13 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 
 	s_cmd->command += priv->pdata->cmd_offset;
 
-	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
-		if (!priv->pdata->ec_dev) {
+	revocable_try_access_with_scoped(&priv->pdata->ec_rev, ec_dev) {
+		if (!ec_dev) {
 			ret = -ENODEV;
 			goto exit;
 		}
 
-		ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
+		ret = cros_ec_cmd_xfer(ec_dev, s_cmd);
 		/* Only copy data to userland if data was received. */
 		if (ret < 0)
 			goto exit;
@@ -376,10 +375,7 @@ static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
-	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
-	if (!priv->pdata->ec_dev)
-		return -ENODEV;
-	ec_dev = priv->pdata->ec_dev;
+	revocable_try_access_or_return(&priv->pdata->ec_rev, ec_dev);
 
 	/* Not every platform supports direct reads */
 	if (!ec_dev->cmd_readmem)
@@ -438,25 +434,29 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
+	struct cros_ec_device *ec_dev = ec->ec_dev;
 	struct chardev_pdata *pdata;
 	int ret;
 
 	pdata = kzalloc_obj(*pdata);
 	if (!pdata)
 		return -ENOMEM;
+	ret = revocable_init(&pdata->ec_rev, ec_dev);
+	if (ret) {
+		kfree(pdata);
+		return ret;
+	}
 
 	platform_set_drvdata(pdev, pdata);
 	kref_init(&pdata->kref);
-	init_rwsem(&pdata->ec_dev_sem);
-	pdata->ec_dev = ec->ec_dev;
 	pdata->cmd_offset = ec->cmd_offset;
 	BLOCKING_INIT_NOTIFIER_HEAD(&pdata->subscribers);
 	pdata->relay.notifier_call = cros_ec_chardev_relay_event;
-	ret = blocking_notifier_chain_register(&pdata->ec_dev->event_notifier,
+	ret = blocking_notifier_chain_register(&ec_dev->event_notifier,
 					       &pdata->relay);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register event notifier\n");
-		goto err_put_pdata;
+		goto err_revoke_ec_rev;
 	}
 
 	pdata->misc.minor = MISC_DYNAMIC_MINOR;
@@ -472,9 +472,10 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 
 	return 0;
 err_unregister_notifier:
-	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
+	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 					   &pdata->relay);
-err_put_pdata:
+err_revoke_ec_rev:
+	revocable_revoke(&pdata->ec_rev);
 	kref_put(&pdata->kref, chardev_pdata_release);
 	return ret;
 }
@@ -482,11 +483,12 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
 	struct chardev_pdata *pdata = platform_get_drvdata(pdev);
+	struct cros_ec_device *ec_dev;
 
-	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
-					   &pdata->relay);
-	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
-		pdata->ec_dev = NULL;
+	revocable_try_access_or_skip_scoped(&pdata->ec_rev, ec_dev)
+		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+						   &pdata->relay);
+	revocable_revoke(&pdata->ec_rev);
 	misc_deregister(&pdata->misc);
 	kref_put(&pdata->kref, chardev_pdata_release);
 }

