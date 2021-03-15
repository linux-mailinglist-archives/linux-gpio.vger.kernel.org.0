Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFCC33AE4F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhCOJOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCOJON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:13 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2658C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:12 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id 61so5282992wrm.12
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ae9O+vV6Y1U8UdtXoNtbk0v4I3Tsz6Ni9lKyTQf2Zag=;
        b=v6nt/lZet5RL6fKizILe25hqkpNkJwD70MY69RPjnaruBnKwx7yseZRnrN7skgLTrv
         QXJFeppbzjhLndknXzEOSYRWN/wjjlZUMvGaL4fw4/v7zKg1lgAqunWJy6ubjtsv2Bi0
         I3k0zuCSlS+34VwjfI102PbyRRaSWLUgvd4ZA59mOkoLmGaeWaqq8Kw60rOoj1ZkHDt0
         HEEBnfadhdgIf2CAlUDdGaEwPzdw8AfzYls9Mmn9ALSb0AvP8/6/7VOOOFKYHWC1osg8
         v2IUvyQiCxWU//l8aW7VOcht2ns/teK7qlDB4Iu35No8ZLw4igJib/1ilgbKvUI1kc3m
         sN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ae9O+vV6Y1U8UdtXoNtbk0v4I3Tsz6Ni9lKyTQf2Zag=;
        b=X71D9SQLb0W6ryl6J3kDn3v8d0M7c+qK2jdCFeDKL56d/eZQi7UCHf9yFg2mhGndLK
         za4xYoJtvjUau1jRHSVelggZ8DtDjGbN3b9WA+HDWTUFQ4wj0TQuQWFXiFFKFpca7+bd
         bxkLJieUNxkM3Q4waSYuaZC4hBhjlkThVc7fpK0mwcXa6b3qtjvZVXZLqolki7430aCm
         hSlpTir1LAL1OMFoNi3/SQC7NbAzW7FpqWUW1mfqXVluyVfrcold0WnVRVcsrWCkNzUr
         KN+sUhL6vTbNi5EMM9EtxhsYOhRCVwBh2fd0QHUxrlx1nLM75TwXcNGElpZW7GpsFtVV
         7OJQ==
X-Gm-Message-State: AOAM533yM1IrMrPmb2UNbxikozcR+s1PMWKGoG4u7Vlj8n+gRKZqfjkj
        uAIQWBKNpfAasdJTyEPK6a+KrQ==
X-Google-Smtp-Source: ABdhPJxJcD9pfqsBilZVQWRafLubvQU8C1cgsgZpLkDCCcbZEJRHgUnxAJ5dVwUP8+dvyU8Yvoa49w==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr26810851wrv.348.1615799651560;
        Mon, 15 Mar 2021 02:14:11 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:11 -0700 (PDT)
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
Subject: [PATCH v5 04/11] samples: configfs: add a committable group
Date:   Mon, 15 Mar 2021 10:13:53 +0100
Message-Id: <20210315091400.13772-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
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

