Return-Path: <linux-gpio+bounces-39634-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DBoKA8ggTmoBDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39634-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:04:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E480724049
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=MESKkIMf;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39634-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39634-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7959A301D633
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABF38C2D8;
	Wed,  8 Jul 2026 10:04:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B63815F1
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:04:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505073; cv=none; b=qwd8yXLpDtKVBmJNZxPzs0LD1jXF44bocu3ELByw6MdEHLCkw8Ho7sbBiUm2au6IwRGFdQGt8R/34ZEUlmzvEy1z9RJnTwb9wfGzTDgOGlFNGXK41lnWdpoRcQ4SrLh3eHJ8z5WPzz/1P684+ahjZ1iDKCLGJ8PANrCCFR7rVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505073; c=relaxed/simple;
	bh=Dr7yY5XLV8e/9e5N9FOL+bV4EWOSxszyyOnFOIzQXrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ol6qbfU3N4EY9MwhkVtxj+y3kTx9aQmKXPSWjXbpZx6CCPgKyzCl4G89LcDXmnnECj2YMxkLW9ljB+TngpFy0i7SDv9CRwFOaIRY1EzZiygM+sJpyxfOtJb0XtKmrZXDM9M2pQK5ABDlT4VrtT46phHLxN9nFMLByOdGj4kSv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MESKkIMf; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC15F4E40CF3;
	Wed,  8 Jul 2026 10:04:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8B7860337;
	Wed,  8 Jul 2026 10:04:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D911511BC33D6;
	Wed,  8 Jul 2026 12:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505067; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=N5mQBROnrDBEAwginXZzryOTa1g0CZWIynlCLymzLoo=;
	b=MESKkIMf7M9PljdQihORQF2hfIL8Vpu6e/+i3mujJWBQrGBD+U3R6lG0xoUc0S5JTeaTfy
	Y+XPW7+0QuF5cWNdb3Vm12uzY4wCaheRs2gDcrX9VlFC2zby0Zgzf5i7MLoH2THSx50Xbg
	t88Rl4892Cdkt7FPFM3viEGz/Jwe2grrf7QX7pRq7CufXZzdIzY13hdpZVRO/VvJWr2eSQ
	VBuVr8VRM0SjzF1iwPL1KANlQqwGJCBGi8k8m6Ug6o5k8GReX4riK6EGjsseoxpdI5yvcw
	T6R+utUAoYSBWQz7wVeFuusd8UrKymfWQ/ARJryDKXfa0WVYyEJFsZzUN1e8ww==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v9 1/9] driver core: fw_devlink: Introduce fw_devlink_set_device()
Date: Wed,  8 Jul 2026 12:02:51 +0200
Message-ID: <20260708100302.517792-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708100302.517792-1-herve.codina@bootlin.com>
References: <20260708100302.517792-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39634-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:icheng@nvidia.com,m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:lizhi.hou@amd.com,m:herve.codina@bootlin.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:stee
 n.hegelund@microchip.com,m:luca.ceresoli@bootlin.com,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,m:ulf.hansson@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,lunn.ch,kernel.org,linuxfoundation.org,google.com,cirrus.com,opensource.cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,amd.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,cirrus.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E480724049

Setting fwnode->dev is specific to fw_devlink.

In order to avoid having a direct 'fwnode->dev = dev;' in several
place in the kernel, introduce fw_devlink_set_device() helper to perform
this operation.

Having this helper allows to hide the fwnode devlink related stuff
behind the helper.

Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Cc stable because used by other patches with Fixes + Cc stable
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 4e86e6990d28..31538f54b1ca 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -256,4 +256,10 @@ void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
 void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
+static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
+					 struct device *dev)
+{
+	fwnode->dev = dev;
+}
+
 #endif
-- 
2.54.0


