Return-Path: <linux-gpio+bounces-34276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHdlNKW0xmmiNgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:47:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BCA347B7B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 17:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AEA530A3A73
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 16:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC8D350D7E;
	Fri, 27 Mar 2026 16:35:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396ED2EB87B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629321; cv=none; b=p1gsBxSaiUxexaohwZHZEcTJFP5dGopESackQ8ixtTzwasb97/8qDrUMXSHd7qIdW1jDZX7N99+mZ7AqH/PwaLUZUHibvH7zYTlB6l0QEIfBjG7Mqu9VWBGLk26queFaV3pYQNI0sUmV8L+p8unuhotunWaMM5JGpuP1wMlPIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629321; c=relaxed/simple;
	bh=8xtnfyOCPoMAjd/pmwd2+flY4k9ekfKU3fDWMuAiUOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx0qHXHs8OlqXgBe2HwgZe/xf4bVcb14g5tzDKDdUAhMsrHjzOnQFrmXq2YN+v/4rqmhhHJJPbdxEerWSRlXfufA3rU2k5mahphGRmlTc9yg4vDOeimGMWtFTnAJrqkz59BtrcqKAAgtx0tlbKOKjq7mos5IsllG6Z7rkvwoadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9G-00066b-6m; Fri, 27 Mar 2026 17:35:02 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9F-002PtO-0y;
	Fri, 27 Mar 2026 17:35:01 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w6A9F-0000000DnDN-0vkm;
	Fri, 27 Mar 2026 17:35:01 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v7 3/6] pinctrl: core: Make pin group callbacks optional for pin-only drivers
Date: Fri, 27 Mar 2026 17:34:47 +0100
Message-ID: <20260327163450.3287313-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327163450.3287313-1-o.rempel@pengutronix.de>
References: <20260327163450.3287313-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34276-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 70BCA347B7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the pinctrl core strictly requires all drivers to implement
.get_groups_count and .get_group_name callbacks in their pinctrl_ops.

However, for simple pinctrl drivers that act purely as GPIO controllers
and pin-specific configuration proxies, without any concept of muxing or
pin groups, this strict requirement forces the implementation of dummy
callbacks just to satisfy pinctrl_check_ops().

Relax this requirement for pin-only drivers by making the group callbacks
optional when no muxing or group pin configuration support is provided.
Update the core and debugfs helpers to check for the existence of these
callbacks before invoking them.

Drivers that provide muxing or group pin configuration operations still
must implement group enumeration and naming callbacks, and are rejected
at registration time if they do not.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
changes v7:
- no changes
changes v6:
- Reject drivers in pinctrl_check_ops() that use pmxops or group confops
  without providing group callbacks.
- Add <linux/pinctrl/pinconf.h> to core.c.
- Revert the unnecessary NULL check in pinconf_show_setting(), since
  group settings are now strictly gated.
- Keep debugfs group listings tolerant of drivers without group callbacks.
changes v5:
- no changes
changes v4:
- add Reviewed-by: Linus Walleij ...
changes v3:
- no changes
---
 drivers/pinctrl/core.c    | 41 ++++++++++++++++++++++++++++++++++-----
 drivers/pinctrl/pinconf.c |  9 +++++++--
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589f..19a9a370d7b9 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -621,8 +622,13 @@ static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
 						  const char *function)
 {
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
-	int ngroups = ops->get_groups_count(pctldev);
 	int selector = 0;
+	int ngroups;
+
+	if (!ops->get_groups_count || !ops->get_group_name)
+		return -EINVAL;
+
+	ngroups = ops->get_groups_count(pctldev);
 
 	/* See if this pctldev has this group */
 	while (selector < ngroups) {
@@ -737,8 +743,15 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 			       const char *pin_group)
 {
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
-	unsigned int ngroups = pctlops->get_groups_count(pctldev);
 	unsigned int group_selector = 0;
+	unsigned int ngroups;
+
+	if (!pctlops->get_groups_count || !pctlops->get_group_name) {
+		dev_err(pctldev->dev, "does not support pin groups\n");
+		return -EINVAL;
+	}
+
+	ngroups = pctlops->get_groups_count(pctldev);
 
 	while (group_selector < ngroups) {
 		const char *gname = pctlops->get_group_name(pctldev,
@@ -1769,6 +1782,11 @@ static int pinctrl_groups_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
+	if (!ops->get_groups_count || !ops->get_group_name) {
+		mutex_unlock(&pctldev->mutex);
+		return 0;
+	}
+
 	ngroups = ops->get_groups_count(pctldev);
 
 	seq_puts(s, "registered pin groups:\n");
@@ -2049,12 +2067,25 @@ static void pinctrl_remove_device_debugfs(struct pinctrl_dev *pctldev)
 static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
 {
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
+	const struct pinconf_ops *confops = pctldev->desc->confops;
+	bool needs_groups = false;
 
-	if (!ops ||
-	    !ops->get_groups_count ||
-	    !ops->get_group_name)
+	if (!ops)
 		return -EINVAL;
 
+	if (pctldev->desc->pmxops)
+		needs_groups = true;
+
+	if (confops && (confops->pin_config_group_get ||
+			confops->pin_config_group_set))
+		needs_groups = true;
+
+	if (needs_groups && (!ops->get_groups_count || !ops->get_group_name)) {
+		dev_err(pctldev->dev,
+			"driver needs group callbacks for mux or group config\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index dca963633b5d..81686844dfa5 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -275,7 +275,7 @@ void pinconf_show_setting(struct seq_file *s,
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
 		seq_printf(s, "group %s (%d)",
 			   pctlops->get_group_name(pctldev,
-					setting->data.configs.group_or_pin),
+						   setting->data.configs.group_or_pin),
 			   setting->data.configs.group_or_pin);
 		break;
 	default:
@@ -348,8 +348,13 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
 {
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
-	unsigned int ngroups = pctlops->get_groups_count(pctldev);
 	unsigned int selector = 0;
+	unsigned int ngroups;
+
+	if (!pctlops->get_groups_count || !pctlops->get_group_name)
+		return 0;
+
+	ngroups = pctlops->get_groups_count(pctldev);
 
 	seq_puts(s, "Pin config settings per pin group\n");
 	seq_puts(s, "Format: group (name): configs\n");
-- 
2.47.3


