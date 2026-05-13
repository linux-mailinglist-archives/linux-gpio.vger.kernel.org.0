Return-Path: <linux-gpio+bounces-36736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ8IKYpFBGp0GQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:34:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FE530B35
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 11:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 756EB3167B02
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B96A3E717F;
	Wed, 13 May 2026 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB+c318J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5583E5A24;
	Wed, 13 May 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663517; cv=none; b=VKU4Y4kdNbR+X5MRTppCqpqo6ru3vS7V0hWz9F5mgU6bcs+sMn9GRnrkQpoPbb6yPewgQ30kEifOE5NT0Iwljo0JDR25Ny76Hz/NtwZJDvxuJ6iI+/eLlOevNIQs/IB02EmQbf2yeoLrnu58dVumIpO9ILzeJZrcpcg7NY3z+/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663517; c=relaxed/simple;
	bh=zg4myjGWRU1O/73Zb1JpG/HVv39/PyjlxQy0TMJ2sFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEl2OEDOV0XmXE/omJcORLxbTtZ4vx3TPPapBmfc0YvUbpCJYa8DWtf2yVK6CUMUK4qUvkIRRq3C9pRAMd+eCRLkG/+q0RIYf5iI6YdxUO4EP8f7DpFP8ydSwW6SLlMne7lk1/kktIckiKx8fxoQ9f8Yvwcm5qSVq9jn13rfCtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB+c318J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CCEC2BCB8;
	Wed, 13 May 2026 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778663515;
	bh=zg4myjGWRU1O/73Zb1JpG/HVv39/PyjlxQy0TMJ2sFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MB+c318JcsvR62eMW9ImhwYQy5a0LROKfJfg7df70ba9xKKohC27FDvPyq5skb2k9
	 jPhvcZJ+E8+9/0+u+gzoTAtPwSFQHaAoekcP43hb5ih2Z2BfFvFS6dhD1r8nFq6W6V
	 xnluKKOPbF/nTA818AgQijod8Cp5XSZSYFlRSOppJUfdTSoYP1TXcKIaWKgXl2gfDo
	 qIvIbtD18sXiY6BjBh1qicrNYF0VPm3fjOySOyPnbfv4GugVSDoPrpCKOtXZt7M5xw
	 T6582ajr1rRnhi423w4ItRr/CXS+AIr2ccH6RRWgOtZYbBd5/rxvTezgL4sE4NdBLM
	 DllU0B8r+QPaA==
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
Subject: [PATCH v11 4/5] platform/chrome: Protect cros_ec_device lifecycle with revocable
Date: Wed, 13 May 2026 17:10:42 +0800
Message-ID: <20260513091043.6766-5-tzungbi@kernel.org>
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
X-Rspamd-Queue-Id: BC1FE530B35
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36736-lists,linux-gpio=lfdr.de];
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

The cros_ec_device can be unregistered when the underlying device is
removed.  Other kernel drivers that interact with the EC may hold a
pointer to the cros_ec_device, creating a risk of a use-after-free
error if the EC device is removed while still being referenced.

To prevent this, leverage the revocable and convert the underlying
device drivers to resource providers of cros_ec_device.

---
v11:
- No changes.

v10: https://lore.kernel.org/all/20260508105448.31799-9-tzungbi@kernel.org
- No changes.

v9: https://lore.kernel.org/all/20260427135841.96266-9-tzungbi@kernel.org
- New to the series.
- Change revocable API usages accordingly.
- Rename "revocable_provider" -> "its_rev".

v5 - v8:
- Doesn't exist.

v4: https://lore.kernel.org/all/20250923075302.591026-5-tzungbi@kernel.org
- No changes.

v3: https://lore.kernel.org/all/20250912081718.3827390-5-tzungbi@kernel.org
- Initialize the revocable provider in cros_ec_device_alloc() instead of
  spreading in protocol device drivers.

v2: https://lore.kernel.org/all/20250820081645.847919-5-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".

v1: https://lore.kernel.org/all/20250814091020.1302888-3-tzungbi@kernel.org

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c           | 11 +++++++++++
 include/linux/platform_data/cros_ec_proto.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 1da79e3d215b..2702a1bbfeb5 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -37,6 +38,7 @@ static void cros_ec_device_free(void *data)
 
 	mutex_destroy(&ec_dev->lock);
 	lockdep_unregister_key(&ec_dev->lockdep_key);
+	revocable_revoke(ec_dev->its_rev);
 }
 
 struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
@@ -47,6 +49,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 	if (!ec_dev)
 		return NULL;
 
+	ec_dev->its_rev = revocable_alloc(ec_dev);
+	if (!ec_dev->its_rev)
+		return NULL;
+	/*
+	 * Drop the extra reference for the caller as the caller is the
+	 * resource provider.
+	 */
+	revocable_put(ec_dev->its_rev);
+
 	ec_dev->din_size = sizeof(struct ec_host_response) +
 			   sizeof(struct ec_response_get_protocol_info) +
 			   EC_MAX_RESPONSE_OVERHEAD;
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index de14923720a5..e8c3bd03403c 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -12,6 +12,7 @@
 #include <linux/lockdep_types.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
+#include <linux/revocable.h>
 
 #include <linux/platform_data/cros_ec_commands.h>
 
@@ -165,6 +166,7 @@ struct cros_ec_command {
  * @pd: The platform_device used by the mfd driver to interface with the
  *      PD behind an EC.
  * @panic_notifier: EC panic notifier.
+ * @its_rev: The revocable_provider to this device.
  */
 struct cros_ec_device {
 	/* These are used by other drivers that want to talk to the EC */
@@ -211,6 +213,7 @@ struct cros_ec_device {
 	struct platform_device *pd;
 
 	struct blocking_notifier_head panic_notifier;
+	struct revocable *its_rev;
 };
 
 /**
-- 
2.51.0


