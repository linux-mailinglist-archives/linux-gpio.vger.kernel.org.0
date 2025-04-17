Return-Path: <linux-gpio+bounces-19022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BC9A91FA2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1703AB423
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 14:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906032522A9;
	Thu, 17 Apr 2025 14:26:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C855251792;
	Thu, 17 Apr 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900010; cv=none; b=niorls2Du6jL8LbUt5FXWSk/2HD5CxXPf0FfE8de2Ks4BgUC2qqfLBpRo3BE28gJOp1d+lWZEsJT4Fq4Hwt7orMU3TrGdPmA9eJPvuvyu4sLiAa9fqa5v2xVnw6f8//6TtH2GJ2VO+yNAJG5thAhYH02Hqk3qkq2mdOhpP20F3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900010; c=relaxed/simple;
	bh=0HQf6FJU32krnLiqr4S/lTsMFbdUqi6Uw6Nofsn+azA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq8AtQWQnHefS36zuM1ymzDZULcL80XdlCwPjmteyhMCaE43p+rrnFg1CW0tNkThCdQYSJdK5H6GqaGRB+ff6Qdz4u1AfEOS6S3dNXKQA18qJvUT4Qz/1AS2sH+pcyqdau1GzxCRMdSD0ElalXlEoFQTGZZ5RGlI3ohd6t10yyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A9E1515;
	Thu, 17 Apr 2025 07:26:45 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0448C3F694;
	Thu, 17 Apr 2025 07:26:44 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:26:42 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20250417-diligent-anteater-of-felicity-70bff3@sudeepholla>
References: <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
 <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>

On Wed, Apr 09, 2025 at 12:14:00PM +0100, Sudeep Holla wrote:
> On Wed, Apr 09, 2025 at 11:50:29AM +0800, Peng Fan wrote:
> > Hi Sudeep, Cristian
> > 
> > On Thu, Mar 13, 2025 at 01:23:27PM +0800, Peng Fan wrote:
> > >On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
> > >>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
> > >>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
> > >>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> > >>> > >
> > >>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> > >>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
> > >>> > > to scmi cpufreq device.
> > >>> > >         if (dev->fwnode && !dev->fwnode->dev) {
> > >>> > >                 dev->fwnode->dev = dev;
> > >>> > >                 fw_devlink_link_device(dev);
> > >>> > >         }
> > >>> > >
> > >>> >
> > >>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
> > >>> >
> > >>> 
> > >>> I could reproduce but none of my solution solved the problem completely
> > >>> or properly. And I don't like the DT proposal you came up with. I am
> > >>> not inclined to just drop this fwnode setting in the scmi devices and
> > >>> just use of_node.
> > >>>
> > >>
> > >>Sorry for the typo that changes the meaning: s/not/now
> > >>
> > >>I meant "I am now inclined ..", until we figure out a way to make this
> > >>work with devlinks properly.
> > >
> > >when you have time, please give a look at
> > >https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4
> > >
> > >The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
> > >a flag SCMI_DEVICE_NO_FWNODE for scmi device.
> > >
> > >I could post out the upper patch as V3 if it basically looks no design flaw.
> > >I will drop the pinctrl patch in v3, considering we are first going
> > >to resolve the fw_devlink issue for cpufreq/devfreq.
> > >
> > >[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/
> > 
> > Not sure you gave a look on this or not. I am thinking to bring this V3
> > out to mailing list later this week. Please raise if you have any concern.
> > 
> 
> Yes I had some thoughts. I will take a look and refresh my memories first.
> 

OK, I will post it separately(may be next week) but I wanted this way.
Revert to old behaviour and driver request fw_devlink dependencies to
be created if they rely on them. I am not sure if that is better approach.

Regards,
Sudeep


-->8

From: Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 17 Apr 2025 10:59:10 +0100
Subject: [PATCH] firmware: arm_scmi: Add flag to control setting of fwnode
 handle

Currently, when multiple SCMI devices share the same protocol,
their fwnode->dev all reference the same device tree node. Depending
on the order of device creation, fwnode->dev ends up pointing to one
of the SCMI devices, causing fw_devlink to incorrectly establish
supplier-consumer relationships treating the first-created device as
the supplier for all others.

To address this, introduce a flag that enables explicit control over
whether the fwnode handle should be set. This allows only those devices
that require fw_devlink support to request it explicitly.

By default, only the of_node is set, which is sufficient for most SCMI
drivers.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c    | 19 ++++++++++++-------
 drivers/firmware/arm_scmi/common.h |  2 +-
 drivers/firmware/arm_scmi/driver.c | 12 ++++++------
 include/linux/scmi_protocol.h      |  4 ++++
 4 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 1adef0389475..eeab5de03a1e 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -389,7 +389,7 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
 
 static struct scmi_device *
 __scmi_device_create(struct device_node *np, struct device *parent,
-		     int protocol, const char *name)
+		     int protocol, const char *name, u32 flags)
 {
 	int id, retval;
 	struct scmi_device *scmi_dev;
@@ -439,11 +439,15 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 	scmi_dev->id = id;
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
-	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
 
+	if (flags & SCMI_DEV_SET_FWNODE)
+		device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+	else
+		scmi_dev->dev.of_node = np;
+
 	retval = device_register(&scmi_dev->dev);
 	if (retval)
 		goto put_dev;
@@ -461,11 +465,11 @@ __scmi_device_create(struct device_node *np, struct device *parent,
 
 static struct scmi_device *
 _scmi_device_create(struct device_node *np, struct device *parent,
-		    int protocol, const char *name)
+		    int protocol, const char *name, u32 flags)
 {
 	struct scmi_device *sdev;
 
-	sdev = __scmi_device_create(np, parent, protocol, name);
+	sdev = __scmi_device_create(np, parent, protocol, name, flags);
 	if (!sdev)
 		pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
 		       of_node_full_name(parent->of_node), protocol, name);
@@ -498,14 +502,14 @@ _scmi_device_create(struct device_node *np, struct device *parent,
  */
 struct scmi_device *scmi_device_create(struct device_node *np,
 				       struct device *parent, int protocol,
-				       const char *name)
+				       const char *name, u32 flags)
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
 	struct scmi_device *scmi_dev = NULL;
 
 	if (name)
-		return _scmi_device_create(np, parent, protocol, name);
+		return _scmi_device_create(np, parent, protocol, name, flags);
 
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
@@ -521,7 +525,8 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-					   rdev->id_table->name);
+					   rdev->id_table->name,
+					   rdev->id_table->flags);
 		if (sdev)
 			scmi_dev = sdev;
 	}
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index dab758c5fdea..c948c4d88332 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -151,7 +151,7 @@ extern struct blocking_notifier_head scmi_requested_devices_nh;
 
 struct scmi_device *scmi_device_create(struct device_node *np,
 				       struct device *parent, int protocol,
-				       const char *name);
+				       const char *name, u32 flags);
 void scmi_device_destroy(struct device *parent, int protocol, const char *name);
 
 int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f6c9e4491240..433b057ec0d9 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -436,11 +436,11 @@ EXPORT_SYMBOL_GPL(scmi_protocol_unregister);
  *	  for the specified protocol.
  */
 static void scmi_create_protocol_devices(struct device_node *np,
-					 struct scmi_info *info,
-					 int prot_id, const char *name)
+					 struct scmi_info *info, int prot_id,
+					 const char *name, u32 flags)
 {
 	mutex_lock(&info->devreq_mtx);
-	scmi_device_create(np, info->dev, prot_id, name);
+	scmi_device_create(np, info->dev, prot_id, name, flags);
 	mutex_unlock(&info->devreq_mtx);
 }
 
@@ -2668,7 +2668,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
 		 idx ? "rx" : "tx", prot_id);
 	/* Create a uniquely named, dedicated transport device for this chan */
-	tdev = scmi_device_create(of_node, info->dev, prot_id, name);
+	tdev = scmi_device_create(of_node, info->dev, prot_id, name, 0);
 	if (!tdev) {
 		dev_err(info->dev,
 			"failed to create transport device (%s)\n", name);
@@ -2865,7 +2865,7 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	switch (action) {
 	case SCMI_BUS_NOTIFY_DEVICE_REQUEST:
 		scmi_create_protocol_devices(np, info, id_table->protocol_id,
-					     id_table->name);
+					     id_table->name, id_table->flags);
 		break;
 	case SCMI_BUS_NOTIFY_DEVICE_UNREQUEST:
 		scmi_destroy_protocol_devices(info, id_table->protocol_id,
@@ -3244,7 +3244,7 @@ static int scmi_probe(struct platform_device *pdev)
 		}
 
 		of_node_get(child);
-		scmi_create_protocol_devices(child, info, prot_id, NULL);
+		scmi_create_protocol_devices(child, info, prot_id, NULL, 0);
 	}
 
 	return 0;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..2546b7977fe3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -947,9 +947,13 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
+/* The scmi device needs fwnode handle */
+#define SCMI_DEV_SET_FWNODE		BIT(0)
+
 struct scmi_device_id {
 	u8 protocol_id;
 	const char *name;
+	u32 flags;
 };
 
 struct scmi_driver {
-- 
2.34.1


