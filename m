Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77815381F26
	for <lists+linux-gpio@lfdr.de>; Sun, 16 May 2021 15:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhEPN45 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 May 2021 09:56:57 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:59877 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233878AbhEPN44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 May 2021 09:56:56 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id iHEzl2tgYpK9wiHF6lOWlC; Sun, 16 May 2021 15:55:40 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621173340; bh=zRRW2ttSL8uuImcnrVzFadJTPoeeMyvOaD+cD7FnfQE=;
        h=From;
        b=cETlc+/qtTz5iDUemKDnyEZLRwJx25L2R9Ir1/mCVV5oBPBLVsOaILRUFfdpQu8dN
         8zbif3+Cmx3rN/PkwWrIwgPWX8f+28j+VwMpfs75eBuk0kk+o5+B8IJk+s+5rg3A7f
         eUfSGlxbfXUgQSOa3EYAi3SJ5tBV1ptkIK/+p82r1stENiOUhTT5Bk2KaGU6wENLQa
         xI8GIujwIHOk5zBbXNaOR/KRyydpCjlH1z3p9yTC78Yj+NNP1yBSHfM1j6/qkv2DcG
         A3bXu14pBVYYDz1/hqlBgzQQGEw0C8yBBlkV8V3jA67fkylROtbiNzc20Wj/8Pn2zm
         4H929yjDBHdhQ==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60a1245c cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=iV3ucFmErjs7te-rZ_sA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug file
Date:   Sun, 16 May 2021 15:55:30 +0200
Message-Id: <20210516135531.2203-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210516135531.2203-1-dariobin@libero.it>
References: <20210516135531.2203-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfEKWdtsMz3AlqfPzmdLuq2ferYiAGGKj4HFvxV4liFxTxx/nYFiPaqz06WDUTeS1WHZhhCKr8poXl/NXOGleEErb2k0x7cSxCjg29j2w2RMa+NjPO2u4
 4EeIN4kBy38uJ1FV0leHLw675ujxfKFMtTJMJ2adb33iCj3iExzUJ8mZjrHi4U1tl4P9AM4I8A6hyuNP9jUagvq78OKJHJwlIwhEy1nkjEU3Z/HW04F4co5c
 fSMFGnMUaJIVnyAiWXEdE3k6SishEjHpVlxFoePR4QqCPqmteytdzeZeJbDcXu6L1JPULWEFoYlZaFXSjn2E/JhY54YxULqx6GQrakFiq+6u4wKF5oxVyHiD
 B86K/0hy
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MPUs of some architectures (e.g AM335x) must be in privileged
operating mode to write on the pinmux registers. In such cases, where
writes will not work from user space, now it can be done from the pins
debug file if the platform driver exports the pin_dbg_set() helper among
the registered operations.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/pinctrl/core.c          | 56 +++++++++++++++++++++++++++++++--
 include/linux/pinctrl/pinctrl.h |  2 ++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a4ac87c8b4f8..f5c9a7d44039 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1620,6 +1620,46 @@ EXPORT_SYMBOL_GPL(pinctrl_pm_select_idle_state);
 
 #ifdef CONFIG_DEBUG_FS
 
+static ssize_t pinctrl_pins_write(struct file *file,
+				  const char __user *user_buf, size_t count,
+				  loff_t *ppos)
+{
+	struct seq_file	*s = file->private_data;
+	struct pinctrl_dev *pctldev = s->private;
+	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
+	char buf[32];
+	char *c = &buf[0];
+	char *token;
+	int ret, buf_size;
+	unsigned int i, pin;
+
+	if (!ops->pin_dbg_set)
+		return -EFAULT;
+
+	/* Get userspace string and assure termination */
+	buf_size = min(count, sizeof(buf) - 1);
+	if (copy_from_user(buf, user_buf, buf_size))
+		return -EFAULT;
+
+	buf[buf_size] = 0;
+	token = strsep(&c, " ");
+	if (kstrtouint(token, 0, &pin))
+		return -EINVAL;
+
+	for (i = 0; i < pctldev->desc->npins; i++) {
+		if (pin != pctldev->desc->pins[i].number)
+			continue;
+
+		ret = ops->pin_dbg_set(pctldev, pin, c);
+		if (ret)
+			return ret;
+
+		return count;
+	}
+
+	return -EINVAL;
+}
+
 static int pinctrl_pins_show(struct seq_file *s, void *what)
 {
 	struct pinctrl_dev *pctldev = s->private;
@@ -1677,7 +1717,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(pinctrl_pins);
+
+static int pinctrl_pins_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pinctrl_pins_show, inode->i_private);
+}
 
 static int pinctrl_groups_show(struct seq_file *s, void *what)
 {
@@ -1886,6 +1930,14 @@ static int pinctrl_show(struct seq_file *s, void *what)
 }
 DEFINE_SHOW_ATTRIBUTE(pinctrl);
 
+static const struct file_operations pinctrl_pins_fops = {
+	.open		= pinctrl_pins_open,
+	.read		= seq_read,
+	.write		= pinctrl_pins_write,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static struct dentry *debugfs_root;
 
 static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
@@ -1915,7 +1967,7 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
 			dev_name(pctldev->dev));
 		return;
 	}
-	debugfs_create_file("pins", 0444,
+	debugfs_create_file("pins", 0644,
 			    device_root, pctldev, &pinctrl_pins_fops);
 	debugfs_create_file("pingroups", 0444,
 			    device_root, pctldev, &pinctrl_groups_fops);
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..6db4a775f549 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -95,6 +95,8 @@ struct pinctrl_ops {
 			       unsigned *num_pins);
 	void (*pin_dbg_show) (struct pinctrl_dev *pctldev, struct seq_file *s,
 			  unsigned offset);
+	int (*pin_dbg_set) (struct pinctrl_dev *pctldev, unsigned int offset,
+			    char *buf);
 	int (*dt_node_to_map) (struct pinctrl_dev *pctldev,
 			       struct device_node *np_config,
 			       struct pinctrl_map **map, unsigned *num_maps);
-- 
2.17.1

