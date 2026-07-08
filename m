Return-Path: <linux-gpio+bounces-39640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NPdQE2EjTmqkDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:16:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CEF72422B
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=If5RS9o7;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39640-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39640-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60F0E3139517
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AEA3ADBA5;
	Wed,  8 Jul 2026 10:05:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0067B38BF6C;
	Wed,  8 Jul 2026 10:05:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505102; cv=none; b=Jg8Q4m02VmF9WKHXcP5MwZAEz+H5e543HnvwpGDeDgjr+gT66NYlocRNgIthy2QBqLoqMnG9zJORrPL25K6vu7ye1m1UkuvNaAeYdlJHTqtP2lklpOlWzi/boHu8yVMgcAdR1wpi8MQjiQmyNh4Iuaeg+OZVJn62tE2VnmxrGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505102; c=relaxed/simple;
	bh=eUh+5UzkPAkfltHyU1QGS+i+4QgZNpJJd4qiosfXErA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5BdMOJ7pr5KnAzpbXPpND66Swya5ae6QqfX6czkDCMcOX5qsroBNSEVOLnR493NQAmRhSowYSDX/oKDvhN1popjoLMQWGT6bpeACIc7AT065YHpHiS1idgL1/yGsGsUsvCsJXjIdJ05ML9xYzLEM6MqD9q/iF9HxNwahfC4eDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=If5RS9o7; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 95539C8F448;
	Wed,  8 Jul 2026 10:05:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B019260337;
	Wed,  8 Jul 2026 10:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39DE611BC340C;
	Wed,  8 Jul 2026 12:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505097; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=E+KjPslG8Yq6DlZpnY2eoa5wVJm9c3ayc/UZANasGp8=;
	b=If5RS9o7JNDODqDsh/6bZ5BjqoCHD5VdxUloPTNoe1aXK1WxB+uue9+c1uhRt1Ew+ncd4K
	878mMjPCPv2mz69O+h28+mmNBVnz8zJBllGxpHdOh09Y/1Nu7uAnFSiWVEpfzuTKyfwv/W
	0S9zomQV0Ttzy4Dlt0/+ZNUy5N+mDMzrCcR+Wpd1YglOQvtcmnYEN50QM8b0AmwonNE2B6
	xg29JLex4dHJNqz+ls4geoUtev7vvY6xmnL3lztCkWyOHP+/lU9wudmpz+Mkgs0FCpyvWA
	ZAjnwBli2VnnMSeASclSjxBAxDwAakb98+hxWb2VeT48kGN6PIuhqS81qcOA2A==
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
	stable@vger.kernel.org
Subject: [PATCH v9 7/9] PCI: of: Clear fwnode->dev during root bridge node removal
Date: Wed,  8 Jul 2026 12:02:57 +0200
Message-ID: <20260708100302.517792-8-herve.codina@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39640-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:icheng@nvidia.com,m:andrew@lunn.ch,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:linusw@kernel.org,m:lenb@kernel.org,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:lizhi.hou@amd.com,m:herve.codina@bootlin.com,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:allan.nielsen@microchip.com,m:horatiu.vultur@microchip.com,m:daniel.machon@microchip.com,m:stee
 n.hegelund@microchip.com,m:luca.ceresoli@bootlin.com,m:thomas.petazzoni@bootlin.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2CEF72422B

During the of_pci_make_host_bridge_node() call, an OF node is created
dynamically and its fwnode device (fwnode->dev) is set to the PCI root
bridge device using the fw_devlink_set_device(&np->fwnode, &bridge->dev)
call.

On removal, of_pci_remove_host_bridge_node() is called and calls
device_remove_of_node() which in turn set to NULL the related
dev->fwnode.

Later in the removal sequence, device_del() is called and runs its
cleanup logic:

    if (dev->fwnode && dev->fwnode->dev == dev)
        fw_devlink_set_device(dev->fwnode, NULL);

Because dev->fwnode has been cleared earlier, fw_devlink_set_device()
is not called and leaves fwnode->dev unchanged. This fwnode device
(fwnode->dev) becomes an dangling pointer.

If any reference to the OF node is held after this removal, the pointer
is still accessible using the OF node (np->fwnode.dev) but points to a
freed area.

Avoid this dangling fwnode->dev pointer by clearing it in
of_pci_remove_host_bridge_node().

Fixes: 1f340724419e ("PCI: of: Create device tree PCI host bridge node")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/pci/of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index ee9eb384b377..8dd558a490bb 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -743,6 +743,7 @@ void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge)
 	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
 		return;
 
+	fw_devlink_set_device(&np->fwnode, NULL);
 	device_remove_of_node(&bridge->bus->dev);
 	device_remove_of_node(&bridge->dev);
 	of_changeset_revert(np->data);
-- 
2.54.0


