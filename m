Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC867912
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 09:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfGMHxE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 03:53:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35551 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfGMHxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 03:53:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id w24so5891489plp.2;
        Sat, 13 Jul 2019 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tL8zpLf1AfgFUBw93f85JwsM3od1tn4L5if6plQqteM=;
        b=ZfCUscVfGjU0IF53blN6KslSY9z3o5jmTfUFo1PN1PaS2lHdMwcXVEb+dDSQihRn+L
         7REL1VeQ1Jd81PuhXXIG++/XRNls2nK3RvTtbKqHr7YakpyLlCJgoUKi+a74hea1ErH1
         g9hGOW4rdBCGrh62iz2SaDNbdan8Yq2y82wVvKTbbdkSzT7Hqg6ljEzS8rMYk09rW61v
         tmVVTAM6dWSKosSfRsHiKGJKOFaR3nyb98I5yojMqSpmUFBw05lP1yS+YeOfIdwrPXjG
         gHeXUS6U2nu2afdVWEjX2la+Qd7mv30LX4wbEwdGixq6cdhzCPPV0fgrL9m/OhGxxFbm
         mSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tL8zpLf1AfgFUBw93f85JwsM3od1tn4L5if6plQqteM=;
        b=ibFCT981QCIVB2nlSeBmtJH9ka/kIfM6SHDHsKl3tmeur0IMWYXd5dsuGso4J96vqQ
         0MVaB5P6Rh4E9c8tU5jhvYa7n/YF80SDhfcJ9PT3F11ONl1gJEBVYd+cqPJKPm6Jriuq
         e0vSy4PvacO881IPD0Zy4gj0WUErOawFOqYqKhlstca5wH4FBAVbtq8ela5Rbc/1paZR
         tA9VC5XbHpT1AvZcv3KWV2B8eGCg+iLORs7BC9fzGFIwsTSYO8XI8LOyutBtVY2EWILc
         GVfBPR/0NlyLFXJaR4i7c4r5awa95xNyGujZzaZaxDu9TblNH3ufZl/y+sqOC2OJkVdK
         w6lg==
X-Gm-Message-State: APjAAAUiXz8uty8+kp7sGpKpkVFF9jqZfsRvplOHhRTA/b+Psa6WHJFP
        DdgDa3WIHQWUXOhgfQdU1iw=
X-Google-Smtp-Source: APXvYqwOTPf3sUJc2ItMb8LWrbXBBU7BNxrh+k4/VbF5L0/kfDQQTnG4ippgvH4ZYi9yxkuSle2FGw==
X-Received: by 2002:a17:902:7083:: with SMTP id z3mr16604369plk.278.1563004382849;
        Sat, 13 Jul 2019 00:53:02 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q1sm19004518pfn.178.2019.07.13.00.53.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 00:53:02 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
Date:   Sat, 13 Jul 2019 00:52:58 -0700
Message-Id: <20190713075259.243565-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is helpful to know what device, if any, a software node is tied to, so
let's store a pointer to the device in software node structure. Note that
children software nodes will inherit their parent's device pointer, so we
do not have to traverse hierarchy to see what device the [sub]tree belongs
to.

We will be using the device pointer to locate GPIO lookup tables for
devices with static properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/property.c  |  1 +
 drivers/base/swnode.c    | 35 ++++++++++++++++++++++++++++++++++-
 include/linux/property.h |  5 +++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 348b37e64944..3bc93d4b35c4 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -527,6 +527,7 @@ int device_add_properties(struct device *dev,
 	if (IS_ERR(fwnode))
 		return PTR_ERR(fwnode);
 
+	software_node_link_device(fwnode, dev);
 	set_secondary_fwnode(dev, fwnode);
 	return 0;
 }
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 7fc5a18e02ad..fd12eea539b6 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -24,6 +24,9 @@ struct software_node {
 
 	/* properties */
 	const struct property_entry *properties;
+
+	/* device this node is associated with */
+	struct device *dev;
 };
 
 static DEFINE_IDA(swnode_root_ids);
@@ -607,8 +610,14 @@ fwnode_create_software_node(const struct property_entry *properties,
 	INIT_LIST_HEAD(&swnode->children);
 	swnode->parent = p;
 
-	if (p)
+	if (p) {
 		list_add_tail(&swnode->entry, &p->children);
+		/*
+		 * We want to maintain the same association as the parent node,
+		 * so we can easily locate corresponding device.
+		 */
+		swnode->dev = p->dev;
+	}
 
 	ret = kobject_init_and_add(&swnode->kobj, &software_node_type,
 				   p ? &p->kobj : NULL, "node%d", swnode->id);
@@ -639,6 +648,30 @@ void fwnode_remove_software_node(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
 
+int software_node_link_device(struct fwnode_handle *fwnode, struct device *dev)
+{
+	struct software_node *swnode = to_software_node(fwnode);
+
+	if (!swnode)
+		return -EINVAL;
+
+	swnode->dev = dev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(software_node_link_device);
+
+struct device *
+software_node_get_linked_device(const struct fwnode_handle *fwnode)
+{
+	const struct software_node *swnode = to_software_node(fwnode);
+
+	if (!swnode)
+		return ERR_PTR(-EINVAL);
+
+	return swnode->dev;
+}
+EXPORT_SYMBOL_GPL(software_node_get_linked_device);
+
 int software_node_notify(struct device *dev, unsigned long action)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index e9caa290cda5..754188cfd9db 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -338,4 +338,9 @@ fwnode_create_software_node(const struct property_entry *properties,
 			    const struct fwnode_handle *parent);
 void fwnode_remove_software_node(struct fwnode_handle *fwnode);
 
+int software_node_link_device(struct fwnode_handle *fwnode,
+			      struct device *device);
+struct device *
+software_node_get_linked_device(const struct fwnode_handle *fwnode);
+
 #endif /* _LINUX_PROPERTY_H_ */
-- 
2.22.0.510.g264f2c817a-goog

