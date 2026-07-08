Return-Path: <linux-gpio+bounces-39638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /fM3GxwhTmoXDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:06:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F072408E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:06:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=Qz10A8KE;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39638-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39638-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56F3B304A06A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD01E390229;
	Wed,  8 Jul 2026 10:04:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7038BF7A;
	Wed,  8 Jul 2026 10:04:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505093; cv=none; b=bew8ch1oHnG1z84b0vmZE0jxA/tHyQEfA8xJC/4r0Ykb6OVv/9PjNVuy4Nm1XZ2f1TlgOn2oQfiaq9RKY0shSzko0vfIn8xW2PtLKuKYxbexHD/W6r4IBDXkZfCbohhnlio6VKr7GHxf85spbiufX0dNe9DTDSd63LVtymivMMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505093; c=relaxed/simple;
	bh=usAfYevOmBkXN9Gjh8cAYdfXcFXSpaRP3X0m774TT44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2mivfnpZHaO9NBYhvmOxPX5xCuyUuYdSBuLIR9Vc4d+dRwcyjURytPQ4UFRpMJ9MvbxEHM9jtM7GBtO1VzM1qWTFNF76JCBHiC06ctp3OrTUb2my/jkjKDAeeC5pbrstGEItvJ+lkbDO6RFPsVNMGcrFFNnBZJPBR8qfhK3gMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qz10A8KE; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3862F4E40CF2;
	Wed,  8 Jul 2026 10:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A26B60337;
	Wed,  8 Jul 2026 10:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDE1611BC340F;
	Wed,  8 Jul 2026 12:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505089; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=n3rZDpxVJAIIliYiyVNYugjYn2qhcR56xtU5a8fFzdQ=;
	b=Qz10A8KEg9HqFYnPA2DN3Y1JGT3mC3Fzer2nn+yO9T1aD/Th0E9GmLsoFeYDx9oQmwnkah
	Im/RerxgDkq1UD9UmQd+VSzMcJ+yjTIcuQXqrIw7vFWO6l19JBpoXKahIrTzdFR58Rqfc6
	HGbjxHsWEso0KaZeGre5tpmXuAYcxSF/2dO7Y2SS3FyYQWRLzVZPyt1E7+0mwAD1l/KRLZ
	nvQs4qP8mZWRjMCsuxN22JWAeb4ahD5CKL3/dKH4AqOuFX6LyyJpJE/Ji7+tjP6AsOSLLb
	soWbPco/Cr7W0/TNNxEGZlMnd0lMEoNgQ/AuXmDBgPGc6QAT6lDIR2CFfqBi4w==
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
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v9 5/9] cxl/test: Use fw_devlink_set_device()
Date: Wed,  8 Jul 2026 12:02:55 +0200
Message-ID: <20260708100302.517792-6-herve.codina@bootlin.com>
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
	RCPT_COUNT_TWELVE(0.00)[42];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39638-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:icheng@nvidia.com,m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:lizhi.hou@amd.com,m:herve.codina@bootlin.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:stee
 n.hegelund@microchip.com,m:luca.ceresoli@bootlin.com,m:thomas.petazzoni@bootlin.com,m:jonathan.cameron@huawei.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 105F072408E

The code set directly fwnode.dev field.

Use the dedicated fw_devlink_set_device() helper to perform this
operation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/testing/cxl/test/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
index 69da0727362b..95e39dfc6ec9 100644
--- a/tools/testing/cxl/test/cxl.c
+++ b/tools/testing/cxl/test/cxl.c
@@ -1529,7 +1529,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
 	device_initialize(&adev->dev);
 	fwnode_init(&adev->fwnode, NULL);
 	device_set_node(dev, &adev->fwnode);
-	adev->fwnode.dev = dev;
+	fw_devlink_set_device(&adev->fwnode, dev);
 }
 
 #ifndef SZ_64G
-- 
2.54.0


