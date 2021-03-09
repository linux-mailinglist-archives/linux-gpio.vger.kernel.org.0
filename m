Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998AD33306D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 22:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhCIU7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhCIU7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:59:37 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9457C061760
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:59:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id w7so3797460wmb.5
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUwsUBnwpUEeIgj3zKzPgEDR8ZuQ3xVAmh3ZPjlofqU=;
        b=LiqclJdw9eHAYgTxdG1Dotd01oxoT+nNfcWLmQxynIgqBwak5LnlkZA6O/1JmGHbob
         zkeiy/zfxGKFcfMtg2GTy/rJndS9j6ZOcAo1RJooPxZ2Z8PMP+nH2dHvOSsILt8DKQ4/
         Ec4ZqYDCH14dWOqkCWD8AYBrwyuMhaP4htVXSxFq8lrHVP79SJ5VzU6hgYCqGO2TgkWS
         3qHAhlqkE/xfzrd6L7XDZ/bHTOGSCExXZLNMVSAoPw7oMP4+CITOSwG14k1K4ByT+zy9
         Nnp7yH4XOFUuGayxF6MCGcrtdtp35C3eRa6pyYiKaTzhuyuytq18DRmWNW2nvff1YShj
         2BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUwsUBnwpUEeIgj3zKzPgEDR8ZuQ3xVAmh3ZPjlofqU=;
        b=ua7IjqDhNlaA9lLOpOOaHq4aRcrUiaiIJy5qrTlz4KK58zEM4dFi3QlYnJi8B6jtfn
         i1Ch3SUhmVaCmXq1XNmM130vj0fzFmfzIFkbwemuqDlntuxt9iMvzeqIERTtsTieu3uW
         xX9kDyro3H6NioHr7S9R8hb3Fr0IrNVzb8WOo44mvbvLKp3Opg4XeXAYZXm9efcrX9hz
         X5quYI5+2woTK4BSBDVytJza2SUvb8qEy6mNgTH0+KQArlOcFbwM2JKhUmgcceI7fAP4
         s5OXl9u4mbjQKtMw3mlLtiaZvvrG+KjbpxssYpf4HxLv6IdzGzvH3+Opwl+tm0O/ouz+
         Awcw==
X-Gm-Message-State: AOAM533Fk4qc2ToIatwW2C7mARFqqIb/gfirtHar6vToTACr7aorG+CA
        EiTBz59nGxnop9Snn1J823DTWQ==
X-Google-Smtp-Source: ABdhPJzgZyyYHTYaFH3Mys+5xDuxiGWleCb8irqlE7XF4TDUVmAb6OocGlBbqnVDf+KFQt6eVN5vHA==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr6130375wmh.144.1615323575609;
        Tue, 09 Mar 2021 12:59:35 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:35 -0800 (PST)
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
Subject: [PATCH v3 03/11] configfs: implement committable items
Date:   Tue,  9 Mar 2021 21:59:13 +0100
Message-Id: <20210309205921.15992-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This implements configfs committable items. We mostly follow the
documentation except that we extend config_group_ops with uncommit_item()
callback for reverting the changes made by commit_item().

Each committable group has two sub-directories: pending and live. New
items can only be created in pending/. Attributes can only be modified
while the item is in pending/. Once it's ready to be committed, it must
be moved over to live/ using the rename() system call. This is when the
commit_item() function will be called.

Implementation-wise: we reuse the default group mechanism to elegantly
plug the new pseude-groups into configfs. The pending group inherits the
parent group's operations so that config_items can be seamlesly created
in it using the callbacks supplied by the user as part of the committable
group itself.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/filesystems/configfs.rst |   6 +-
 fs/configfs/configfs_internal.h        |   2 +
 fs/configfs/dir.c                      | 245 ++++++++++++++++++++++++-
 include/linux/configfs.h               |   1 +
 4 files changed, 245 insertions(+), 9 deletions(-)

diff --git a/Documentation/filesystems/configfs.rst b/Documentation/filesystems/configfs.rst
index 1d3d6f4a82a9..7e0e7c356450 100644
--- a/Documentation/filesystems/configfs.rst
+++ b/Documentation/filesystems/configfs.rst
@@ -290,6 +290,7 @@ config_item_type::
 		struct config_group *(*make_group)(struct config_group *group,
 						   const char *name);
 		int (*commit_item)(struct config_item *item);
+		int (*uncommit_item)(struct config_item *item);
 		void (*disconnect_notify)(struct config_group *group,
 					  struct config_item *item);
 		void (*drop_item)(struct config_group *group,
@@ -490,9 +491,6 @@ pass up an error.
 Committable Items
 =================
 
-Note:
-     Committable items are currently unimplemented.
-
 Some config_items cannot have a valid initial state.  That is, no
 default values can be specified for the item's attributes such that the
 item can do its work.  Userspace must configure one or more attributes,
@@ -532,4 +530,4 @@ method returns zero and the item is moved to the "live" directory.
 As rmdir(2) does not work in the "live" directory, an item must be
 shutdown, or "uncommitted".  Again, this is done via rename(2), this
 time from the "live" directory back to the "pending" one.  The subsystem
-is notified by the ct_group_ops->uncommit_object() method.
+is notified by the ct_group_ops->uncommit_item() method.
diff --git a/fs/configfs/configfs_internal.h b/fs/configfs/configfs_internal.h
index b495c9f043d4..41ac21c82bf5 100644
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@ -56,6 +56,8 @@ struct configfs_dirent {
 #define CONFIGFS_USET_DROPPING		(1UL << 8)
 #define CONFIGFS_USET_IN_MKDIR		(1UL << 9)
 #define CONFIGFS_USET_CREATING		(1UL << 10)
+#define CONFIGFS_GROUP_PENDING		(1UL << 11)
+#define CONFIGFS_GROUP_LIVE		(1UL << 12)
 #define CONFIGFS_NOT_PINNED	(CONFIGFS_ITEM_ATTR | CONFIGFS_ITEM_BIN_ATTR)
 
 extern struct mutex configfs_symlink_mutex;
diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index b6098e02e20b..f3c95c1d5278 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -656,6 +656,13 @@ static void detach_groups(struct config_group *group)
 
 		inode_unlock(d_inode(child));
 
+		/*
+		 * Free memory allocated for the pending and live directories
+		 * of committable groups.
+		 */
+		if (sd->s_type & (CONFIGFS_GROUP_PENDING | CONFIGFS_GROUP_LIVE))
+			kfree(sd->s_element);
+
 		d_delete(child);
 		dput(child);
 	}
@@ -860,6 +867,134 @@ static void configfs_detach_item(struct config_item *item)
 	configfs_remove_dir(item);
 }
 
+static bool is_committable_group(struct config_item *item)
+{
+	const struct config_item_type *type = item->ci_type;
+
+	if (type && type->ct_group_ops &&
+	    type->ct_group_ops->commit_item &&
+	    type->ct_group_ops->uncommit_item)
+		return true;
+
+	return false;
+}
+
+struct pending_group_data {
+	struct config_group group;
+	struct config_item_type type;
+	struct configfs_group_operations group_ops;
+};
+
+struct live_group_data {
+	struct config_group group;
+	struct config_item_type type;
+};
+
+static int create_pending_group(struct config_item *parent_item,
+				struct configfs_fragment *frag)
+{
+	const struct config_item_type *parent_type = parent_item->ci_type;
+	struct pending_group_data *pending;
+	struct configfs_dirent *sd;
+	int ret;
+
+	pending = kzalloc(sizeof(*pending), GFP_KERNEL);
+	if (!pending)
+		return -ENOMEM;
+
+	/*
+	 * Let's inherit the group_ops from the parent except for item
+	 * committing and uncommitting.
+	 */
+	memcpy(&pending->group_ops, parent_type->ct_group_ops,
+	       sizeof(struct configfs_group_operations));
+	pending->type.ct_group_ops = &pending->group_ops;
+	pending->type.ct_group_ops->commit_item = NULL;
+	pending->type.ct_group_ops->uncommit_item = NULL;
+
+	/* Let's directly reuse item_ops. */
+	pending->type.ct_item_ops = parent_type->ct_item_ops;
+	pending->type.ct_owner = parent_type->ct_owner;
+
+	config_group_init_type_name(&pending->group, "pending", &pending->type);
+
+	ret = create_default_group(to_config_group(parent_item),
+				   &pending->group, frag);
+	if (ret) {
+		kfree(pending);
+		return ret;
+	}
+
+	link_group(to_config_group(parent_item), &pending->group);
+
+	sd = pending->group.cg_item.ci_dentry->d_fsdata;
+	/* Allow creating config_items in 'pending' group. */
+	sd->s_type |= (CONFIGFS_GROUP_PENDING | CONFIGFS_USET_DIR);
+
+	return 0;
+}
+
+static int create_live_group(struct config_item *parent_item,
+			     struct configfs_fragment *frag)
+{
+	struct live_group_data *live;
+	struct configfs_dirent *sd;
+	int ret;
+
+	live = kzalloc(sizeof(*live), GFP_KERNEL);
+	if (!live)
+		return -ENOMEM;
+
+	live->type.ct_owner = parent_item->ci_type->ct_owner;
+
+	config_group_init_type_name(&live->group, "live", &live->type);
+
+	ret = create_default_group(to_config_group(parent_item),
+				   &live->group, frag);
+	if (ret) {
+		kfree(live);
+		return ret;
+	}
+
+	link_group(to_config_group(parent_item), &live->group);
+
+	sd = live->group.cg_item.ci_dentry->d_fsdata;
+	sd->s_type |= CONFIGFS_GROUP_LIVE;
+	sd->s_type &= ~CONFIGFS_USET_DIR;
+
+	return 0;
+}
+
+static int create_committable_groups(struct config_item *parent_item,
+				     struct configfs_fragment *frag)
+{
+	struct configfs_dirent *sd;
+	int ret;
+
+	ret = create_pending_group(parent_item, frag);
+	if (ret)
+		return ret;
+
+	ret = create_live_group(parent_item, frag);
+	if (ret) {
+		detach_groups(to_config_group(parent_item));
+		return ret;
+	}
+
+	/* Disallow creating items directly in the committable group. */
+	sd = parent_item->ci_dentry->d_fsdata;
+	sd->s_type &= ~CONFIGFS_USET_DIR;
+
+	return 0;
+}
+
+static void dentry_mark_dead(struct config_item *item, struct dentry *dentry)
+{
+	configfs_detach_item(item);
+	d_inode(dentry)->i_flags |= S_DEAD;
+	dont_mount(dentry);
+}
+
 static int configfs_attach_group(struct config_item *parent_item,
 				 struct config_item *item,
 				 struct dentry *dentry,
@@ -885,11 +1020,15 @@ static int configfs_attach_group(struct config_item *parent_item,
 		inode_lock_nested(d_inode(dentry), I_MUTEX_CHILD);
 		configfs_adjust_dir_dirent_depth_before_populate(sd);
 		ret = populate_groups(to_config_group(item), frag);
-		if (ret) {
-			configfs_detach_item(item);
-			d_inode(dentry)->i_flags |= S_DEAD;
-			dont_mount(dentry);
+		if (ret)
+			dentry_mark_dead(item, dentry);
+
+		if (is_committable_group(item)) {
+			ret = create_committable_groups(item, frag);
+			if (ret)
+				dentry_mark_dead(item, dentry);
 		}
+
 		configfs_adjust_dir_dirent_depth_after_populate(sd);
 		inode_unlock(d_inode(dentry));
 		if (ret)
@@ -966,6 +1105,8 @@ static void configfs_dump_one(struct configfs_dirent *sd, int level)
 	type_print(CONFIGFS_USET_DIR);
 	type_print(CONFIGFS_USET_DEFAULT);
 	type_print(CONFIGFS_USET_DROPPING);
+	type_print(CONFIGFS_GROUP_PENDING);
+	type_print(CONFIGFS_GROUP_LIVE);
 #undef type_print
 }
 
@@ -1457,7 +1598,7 @@ static int configfs_rmdir(struct inode *dir, struct dentry *dentry)
 	struct config_item *parent_item;
 	struct config_item *item;
 	struct configfs_subsystem *subsys;
-	struct configfs_dirent *sd;
+	struct configfs_dirent *sd, *parent_sd;
 	struct configfs_fragment *frag;
 	struct module *subsys_owner = NULL, *dead_item_owner = NULL;
 	int ret;
@@ -1476,6 +1617,12 @@ static int configfs_rmdir(struct inode *dir, struct dentry *dentry)
 		return -EINVAL;
 	}
 
+	parent_sd = dentry->d_parent->d_fsdata;
+	if (parent_sd->s_type & CONFIGFS_GROUP_LIVE) {
+		config_item_put(parent_item);
+		return -EPERM;
+	}
+
 	/* configfs_mkdir() shouldn't have allowed this */
 	BUG_ON(!subsys->su_group.cg_item.ci_type);
 	subsys_owner = subsys->su_group.cg_item.ci_type->ct_owner;
@@ -1562,9 +1709,97 @@ static int configfs_rmdir(struct inode *dir, struct dentry *dentry)
 	return 0;
 }
 
+static int configfs_rename(struct user_namespace *mnt_userns,
+			   struct inode *old_dir, struct dentry *old_dentry,
+			   struct inode *new_dir, struct dentry *new_dentry,
+			   unsigned int flags)
+{
+	struct configfs_dirent *sd, *old_parent_sd, *new_parent_sd;
+	struct dentry *old_parent_dentry, *new_parent_dentry;
+	struct dentry *committable_group_dentry;
+	struct config_item *committable_group_item, *item, *new_parent_item;
+	struct configfs_subsystem *committable_group_subsys;
+	struct configfs_group_operations *committable_group_ops;
+	int ret = 0;
+
+	if (flags)
+		return -EINVAL;
+
+	old_parent_dentry = old_dentry->d_parent;
+	new_parent_dentry = new_dentry->d_parent;
+
+	sd = old_dentry->d_fsdata;
+	old_parent_sd = old_dentry->d_parent->d_fsdata;
+	new_parent_sd = new_dentry->d_parent->d_fsdata;
+
+	if (!old_parent_sd || !new_parent_sd)
+		return -EPERM;
+
+	/*
+	 * Renaming must always be between a 'pending' and a 'live' group and
+	 * both need to have the same parent. Changing the directory name is
+	 * not allowed.
+	 */
+	if (!((old_parent_sd->s_type & CONFIGFS_GROUP_PENDING) &&
+	      (new_parent_sd->s_type & CONFIGFS_GROUP_LIVE)) &&
+	    !((old_parent_sd->s_type & CONFIGFS_GROUP_LIVE) &&
+	      (new_parent_sd->s_type & CONFIGFS_GROUP_PENDING)))
+		return -EPERM;
+
+	if (old_parent_dentry->d_parent != new_parent_dentry->d_parent)
+		return -EPERM;
+
+	if (strcmp(old_dentry->d_name.name, new_dentry->d_name.name))
+		return -EPERM;
+
+	committable_group_dentry = old_parent_dentry->d_parent;
+	/*
+	 * Grab a reference to the committable group for the duration of
+	 * this function.
+	 */
+	committable_group_item =
+		configfs_get_config_item(committable_group_dentry);
+	committable_group_subsys =
+		to_config_group(committable_group_item)->cg_subsys;
+	committable_group_ops = committable_group_item->ci_type->ct_group_ops;
+
+	item = sd->s_element;
+	new_parent_item = new_parent_sd->s_element;
+
+	if (WARN_ON(!is_committable_group(committable_group_item))) {
+		/* This would be a result of a programming error in configfs. */
+		config_item_put(committable_group_item);
+		return -EPERM;
+	}
+
+	mutex_lock(&committable_group_subsys->su_mutex);
+
+	if ((old_parent_sd->s_type & CONFIGFS_GROUP_PENDING) &&
+	    (new_parent_sd->s_type & CONFIGFS_GROUP_LIVE))
+		ret = committable_group_ops->commit_item(item);
+	else
+		ret = committable_group_ops->uncommit_item(item);
+	if (ret)
+		goto out;
+
+	spin_lock(&configfs_dirent_lock);
+	new_dentry->d_fsdata = sd;
+	list_move(&sd->s_sibling, &new_parent_sd->s_children);
+	item->ci_parent = new_parent_item;
+	d_move(old_dentry, new_dentry);
+	spin_unlock(&configfs_dirent_lock);
+
+out:
+	mutex_unlock(&committable_group_subsys->su_mutex);
+	config_item_put(committable_group_item);
+
+	return ret;
+}
+
 const struct inode_operations configfs_dir_inode_operations = {
 	.mkdir		= configfs_mkdir,
 	.rmdir		= configfs_rmdir,
+	.rename		= configfs_rename,
 	.symlink	= configfs_symlink,
 	.unlink		= configfs_unlink,
 	.lookup		= configfs_lookup,
diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 4f76dcc08134..ff6b0e408136 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -219,6 +219,7 @@ struct configfs_group_operations {
 	struct config_item *(*make_item)(struct config_group *group, const char *name);
 	struct config_group *(*make_group)(struct config_group *group, const char *name);
 	int (*commit_item)(struct config_item *item);
+	int (*uncommit_item)(struct config_item *item);
 	void (*disconnect_notify)(struct config_group *group, struct config_item *item);
 	void (*drop_item)(struct config_group *group, struct config_item *item);
 };
-- 
2.30.1

