Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671E632D0BF
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhCDKcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238485AbhCDKbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:31:31 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B1FC0613DD
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 02:30:10 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id a18so18822308wrc.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bs0N+b7IbNFBoZCqiL+fVI6wVQVsEVA2VSnx/V3f4QI=;
        b=i+Zvg25xWRRu3Q+3OHqNie0KuSOiMHg6Had86XZY/5pU4nj64JjnzVPBvlXb100DOY
         55fH5/xUvZDflCQt+qb9eJwDxrAMVcc7VTXf6LvuhVwMt1UI4r2jr3FJBwU3JDkwv7Wj
         HHaBp+Fcl37uh7LYBMPHYBrlascVC/XfrppRxQlYnItNZNgWlwOr6g4cybI0E7r+GYzS
         +3o5/Tdy1Xuc+yp9ld87CGZnogyIBpZpBLyYcUQQQ4UKcKjieo7ocJtNtt4mVUjHveiP
         2bV+S5MkgpN53kZtGLSaMR+WRRpxvc3iOwYVGB0xQNFRR04gtt+9fr5q+r/0HBpEtkmV
         lAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bs0N+b7IbNFBoZCqiL+fVI6wVQVsEVA2VSnx/V3f4QI=;
        b=V706neAo3yy4XiABUvHGOmPDW145Q1R7qP9YA8ZzAQKdAAKq+f0HvzXxw510rrbrdr
         L4SsHiEjobQtTBDJm0Xb0kSHKYjn1TiWSxnoyjLt13XhIqrNzCg8lx0k8UBblMQQb3YY
         N2UDeOwxMskaSo6nOtZtuMA9L4ku4cCgj5RZX13x+qM0GFHo2YcvQuYGQyjn1XJPIT4y
         KV9PlS9b/GAwbgACokUYDHVZbjY61pJVRXKPndDTQBxyOIgy/I9BIvZ9p7swcJqvYohb
         VnUFLROxWMAubaUEeq9kB+cdO6+6qOp7sKskGbryd62x+Knf1PrFGrETnVWktDalw4Td
         WOKw==
X-Gm-Message-State: AOAM532uZw3FJuwZv0EuaSA62g69ptKGQXsUJZ73OksnxG5EbBA1NW5W
        o+RrTMiG+LiJCsbOC7kRlmoQaQ==
X-Google-Smtp-Source: ABdhPJzIhX1GD3MT99SO7tV3rh3J1lUvbyMcRtszgrTHe6AQgZOwY8ko4EmIITwwTNLJc76mCCH0Uw==
X-Received: by 2002:adf:d236:: with SMTP id k22mr3317611wrh.144.1614853809697;
        Thu, 04 Mar 2021 02:30:09 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:09 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 04/12] samples: configfs: add a committable group
Date:   Thu,  4 Mar 2021 11:24:44 +0100
Message-Id: <20210304102452.21726-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
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
2.29.1

