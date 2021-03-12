Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB61338965
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 10:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhCLJ5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 04:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233441AbhCLJ51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 04:57:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39594C061762
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 01:57:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o14so645777wrm.11
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ae9O+vV6Y1U8UdtXoNtbk0v4I3Tsz6Ni9lKyTQf2Zag=;
        b=DPiWRA5EDT/f3IOoa9jgIFSt9nh5xPu5KNIlNaUqDcdT/WXBp4qz57foNYlfL+afbj
         ZkpvTkz8bf+5WJm1UGoNwCj/SKEje52ZsGIs5XoCUHsum6KdKsl6zl/yUZbHzBhxJMyj
         fNNjiHlCD9gS2muDlXgdhilNujRhDe+RYb1uiusm/ZWRb8FLFzdo83hmQiGjFmF+FYRm
         oi1sl0ge/T/6aWuQdF5Y8Am9mXwc04sJGVMpruX7AwCKbsFDBIuMCpe8oNbu6g5PxuKr
         ToON2cesaqCONgJg0/FHzqEvd0YyFu4kqLGczV9BDWdkdQSAOFCsZMq1x9MD1ozwYG/r
         aUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ae9O+vV6Y1U8UdtXoNtbk0v4I3Tsz6Ni9lKyTQf2Zag=;
        b=fQa8rVqOJPytLl030aHGTNVY8YHSBjXYHiApKK9SSIKEU/S2xzqkxLNV7PGtUjKJzr
         aj2LHhUIVeUcvo6h9nSFntIBiJMhTLL88LoWy7FCiXbkx3mkL87QY8MVUZCe3NqnQrJg
         zg3tlYEDn7GV53xCkVRn78dWElwa/Vmx/7yLP4vbSaCiEc8faUAW586NcbXUq/X0MXUr
         NcNs9oReyAs92f0Vtx3CZ5dxDM/EE3dsH6v5QV34/E6iJ8rxRDMnyDKjQCUpwIVDApjB
         G03plpYfFl9U/aKFOpX7gnSqs01t9UVI/Nwl5SguX5/pVOea3lO2ktdEOU6KsfvDGP7S
         c0mQ==
X-Gm-Message-State: AOAM530nE6An1nYN/aFXElXRGn4fsCjix1Vy/1+frfFKC+/3KqdzlAqe
        zwQXe7ieqL4U3njtnVD5Ouj2d83urwX2IQ==
X-Google-Smtp-Source: ABdhPJxo9xrO/XNV8prQb/QCuUZbvdfvk7mppNj2R8ulFFSCH1sUgmgJCuFz5v+bcKo1UVzyS3Dfzw==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr13215363wrs.83.1615543045930;
        Fri, 12 Mar 2021 01:57:25 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id x13sm7031630wrt.75.2021.03.12.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:57:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 04/11] samples: configfs: add a committable group
Date:   Fri, 12 Mar 2021 10:56:53 +0100
Message-Id: <20210312095700.16277-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312095700.16277-1-brgl@bgdev.pl>
References: <20210312095700.16277-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add an example of using committable items to configfs samples. Each
config item has two attributes: read-write 'storeme' which works
similarly to other examples in this file and a read-only 'committed'
attribute which changes its value between false and true depending on
whether it's committed or not at the moment.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 samples/configfs/configfs_sample.c | 153 +++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/samples/configfs/configfs_sample.c b/samples/configfs/configfs_sample.c
index f9008be7a8a1..9bef74e4369d 100644
--- a/samples/configfs/configfs_sample.c
+++ b/samples/configfs/configfs_sample.c
@@ -315,6 +315,158 @@ static struct configfs_subsystem group_children_subsys = {
 
 /* ----------------------------------------------------------------- */
 
+/*
+ * 04-committable-children
+ *
+ * This is an example of a committable group.  It's similar to the simple
+ * children example but each config_item has an additional 'committed'
+ * attribute which is read-only and is only modified when the config_item
+ * is moved from the 'pending' to the 'live' directory.
+ */
+
+struct committable_child {
+	struct config_item item;
+	int storeme;
+	bool committed;
+};
+
+static inline struct committable_child *
+to_committable_child(struct config_item *item)
+{
+	return container_of(item, struct committable_child, item);
+}
+
+static ssize_t
+committable_child_storeme_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", to_committable_child(item)->storeme);
+}
+
+static ssize_t committable_child_storeme_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct committable_child *child = to_committable_child(item);
+	int ret;
+
+	if (child->committed)
+		return -EPERM;
+
+	ret = kstrtoint(page, 10, &child->storeme);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+CONFIGFS_ATTR(committable_child_, storeme);
+
+static ssize_t
+committable_child_committed_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%s\n",
+		to_committable_child(item)->committed ? "true" : "false");
+}
+
+CONFIGFS_ATTR_RO(committable_child_, committed);
+
+static struct configfs_attribute *committable_child_attrs[] = {
+	&committable_child_attr_storeme,
+	&committable_child_attr_committed,
+	NULL,
+};
+
+static void committable_child_release(struct config_item *item)
+{
+	kfree(to_committable_child(item));
+}
+
+static struct configfs_item_operations committable_child_item_ops = {
+	.release	= committable_child_release,
+};
+
+static const struct config_item_type committable_child_type = {
+	.ct_item_ops	= &committable_child_item_ops,
+	.ct_attrs	= committable_child_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+struct committable_children {
+	struct config_group group;
+};
+
+static struct config_item *
+committable_children_make_item(struct config_group *group, const char *name)
+{
+	struct committable_child *child;
+
+	child = kzalloc(sizeof(*child), GFP_KERNEL);
+	if (!child)
+		return ERR_PTR(-ENOMEM);
+
+	config_item_init_type_name(&child->item, name, &committable_child_type);
+
+	return &child->item;
+}
+
+static ssize_t
+committable_children_description_show(struct config_item *item, char *page)
+{
+	return sprintf(page,
+"[04-committable-children]\n"
+"\n"
+"This subsystem allows creation of committable config_items.  The subsystem\n"
+"has two subdirectories: pending and live.  New config_items can only be\n"
+"created in pending/ and they have one writable and readable attribute as\n"
+"well as a single read-only attribute.  The latter is only changed once the\n"
+"item is 'committed'.  This is done by moving the config_item (using\n"
+"rename()) to the live/ directory.  In this example, the storeme attribute\n"
+"becomes 'read-only' once committed.\n");
+}
+
+CONFIGFS_ATTR_RO(committable_children_, description);
+
+static struct configfs_attribute *committable_children_attrs[] = {
+	&committable_children_attr_description,
+	NULL,
+};
+
+static int committable_children_commit_item(struct config_item *item)
+{
+	to_committable_child(item)->committed = true;
+
+	return 0;
+}
+
+static int committable_children_uncommit_item(struct config_item *item)
+{
+	to_committable_child(item)->committed = false;
+
+	return 0;
+}
+
+static struct configfs_group_operations committable_children_group_ops = {
+	.make_item	= committable_children_make_item,
+	.commit_item	= committable_children_commit_item,
+	.uncommit_item	= committable_children_uncommit_item,
+};
+
+static const struct config_item_type committable_children_type = {
+	.ct_group_ops	= &committable_children_group_ops,
+	.ct_attrs	= committable_children_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem committable_children_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "04-committable-children",
+			.ci_type = &committable_children_type,
+		},
+	},
+};
+
+/* ----------------------------------------------------------------- */
+
 /*
  * We're now done with our subsystem definitions.
  * For convenience in this module, here's a list of them all.  It
@@ -326,6 +478,7 @@ static struct configfs_subsystem *example_subsys[] = {
 	&childless_subsys.subsys,
 	&simple_children_subsys,
 	&group_children_subsys,
+	&committable_children_subsys,
 	NULL,
 };
 
-- 
2.30.1

