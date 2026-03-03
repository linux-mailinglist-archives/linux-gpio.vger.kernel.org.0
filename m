Return-Path: <linux-gpio+bounces-32416-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEnbIPbkpmngZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32416-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:41:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 247AC1F078D
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 14:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8FBB303B909
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 13:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8364266BE;
	Tue,  3 Mar 2026 13:40:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC631375F97
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545214; cv=none; b=K/MAmR8w+NcyIgmt/maZIW5ZiI26kP4FHwgohCHbXshHxoV/FszvGzuTJjea0SlTeFKyeqnZR8HNuQJaVJRoXATTDTXm6mt1e/irYQsKui5+H7RN1kx2mVga5L9Nwlxd4AUdI5V+QKU2tB/TsEeLbWw9NMrUZVE3HwchALmsThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545214; c=relaxed/simple;
	bh=Y1pVRS1BUw7kDWX7SNwKslHt74IdLbqmxWtn4FbC07I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmAryZxVjU3/OwguDFhcmcw0VicAmFBiB1ueLJndD1Oumq2UShimnIo3reukUTJGce4wDLwEyb/PBH5w7EcHF3viD19y32F2+vCJq49Fnq1y7vddjXjy/EWU+qXkNAG1MIliSyamw0gJu+42P0c1Y3We+rXs1FqFBKrSLxqSk4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyX-0000VM-8x; Tue, 03 Mar 2026 14:39:49 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyV-003YXE-2D;
	Tue, 03 Mar 2026 14:39:49 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vxPyW-00000004idh-3t63;
	Tue, 03 Mar 2026 14:39:48 +0100
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
Subject: [PATCH v2 3/6] pinctrl: core: Make pin group callbacks optional
Date: Tue,  3 Mar 2026 14:39:43 +0100
Message-ID: <20260303133947.1123575-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303133947.1123575-1-o.rempel@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
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
X-Rspamd-Queue-Id: 247AC1F078D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32416-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

Currently, the pinctrl core strictly requires all drivers to implement
.get_groups_count and .get_group_name callbacks in their pinctrl_ops.

However, for simple pinctrl drivers that act purely as GPIO controllers
and pin-specific configuration proxies (without any concept of muxing or
pin groups), this strict requirement forces the implementation of dummy
callbacks just to satisfy pinctrl_check_ops().

Relax this requirement by making the group callbacks optional. Update
the core and debugfs (pinconf) functions to check for the existence of
these callbacks before invoking them, allowing simple drivers to omit
group boilerplate entirely.

Suggested-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/pinctrl/core.c    | 25 ++++++++++++++++++++-----
 drivers/pinctrl/pinconf.c | 18 +++++++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589f..920e025622d6 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -621,8 +621,13 @@ static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
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
@@ -737,8 +742,15 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
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
@@ -1769,6 +1781,11 @@ static int pinctrl_groups_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
+	if (!ops->get_groups_count || !ops->get_group_name) {
+		mutex_unlock(&pctldev->mutex);
+		return 0;
+	}
+
 	ngroups = ops->get_groups_count(pctldev);
 
 	seq_puts(s, "registered pin groups:\n");
@@ -2050,9 +2067,7 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
 {
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 
-	if (!ops ||
-	    !ops->get_groups_count ||
-	    !ops->get_group_name)
+	if (!ops)
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index dca963633b5d..feab87e8530d 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -273,10 +273,13 @@ void pinconf_show_setting(struct seq_file *s,
 			   setting->data.configs.group_or_pin);
 		break;
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
-		seq_printf(s, "group %s (%d)",
-			   pctlops->get_group_name(pctldev,
-					setting->data.configs.group_or_pin),
-			   setting->data.configs.group_or_pin);
+		if (pctlops->get_group_name)
+			seq_printf(s, "group %s (%d)",
+				   pctlops->get_group_name(pctldev,
+						setting->data.configs.group_or_pin),
+				   setting->data.configs.group_or_pin);
+		else
+			seq_printf(s, "group (%d)", setting->data.configs.group_or_pin);
 		break;
 	default:
 		break;
@@ -348,8 +351,13 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
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


