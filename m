Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A9E38B868
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 22:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbhETUaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 16:30:16 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:42121 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236249AbhETUaP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 16:30:15 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jpGWlKVEa5WrZjpGqlTUNp; Thu, 20 May 2021 22:27:53 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621542473; bh=Z3x++lNl1KUyMjHgJXYz6ViHhU+nTnNfaQmFUS1eWNs=;
        h=From;
        b=wOvc1XmJnM+BC4bu8KsxcvKqRExh4/8BlbUWDbsHNJmYoZdNLFuD7zIcO4+Id+9pW
         qf0Tb5vF0THakHnduzVs53hZWgDUgjfBrkG4gb5UpvRAfmXaokxL950PZ/Pm+gBH0n
         EjVsLpHQ+OtgXdx/RW9+btqoxq18UzMEPMiXDDcWIvyax7FFuBlMhMTk4qWEla2Fdz
         qdiZsSRaR7n4PVdi3ujbHm826Wkgl8/IH0xNSHxjWUK38lUqlUI4IeERQ+h6/vAPqp
         /4duDt5dRkhn1qQqF3r0DptmuIfHEStm8DKd7O1+KJxw1+99L7sVyTK1RMcSvM3dEk
         7AiG6cK4dzMYA==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6c649 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17
 a=LmjiRsjZlzoeE_K0hIMA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug file
Date:   Thu, 20 May 2021 22:27:29 +0200
Message-Id: <20210520202730.4444-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520202730.4444-1-dariobin@libero.it>
References: <20210520202730.4444-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfIUmEvQVxqvsNff7Mc8QYZVUGolb2h3/P3PFxHG5VygqL5T5I2Ja4Gf6GxfDvt86ebJJBjztbv5sXiNyvfP+xIQSoF/FbWpQM26jzirtbxbau2MWod9W
 UOEccBj3hn6Gx6MDH7rRmXfpc6BzHDXVB1cP6HMk7lJoBw135Ob69lr3RVd8sCzO6y5F2aMHk8sBKDDFiBvbOKwcsoWzvoXFI+c1ZKn6Sc+PyYo4T0LnpzUY
 cLoOb0YebtPSw+pYyEx1J4UKXZe3khwc8w0q7i7lk576L7/O6PENlxVRWSeBVeT2pZGDr61EfQII2SciVc91tN7G4vNgyztif9O2P5yG0qZJYGtJmJhjBnTa
 x7osxmPoVmrpzm/waqAfYe6IifhG0IzEnh+MG8e303s+X7IQx3Hit/Y2GAnZAbui5RKCC5pKDAPJ/CxzAbHrrhd8vFzXbg==
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

Changes in v3:
- Use strncpy_from_user() instead of copy_from_user().
- Do not shadow the error code returned by kstrtouint().
- Change pin_dbg_set() interface (char *buf --> unsigned int val).
- Describe pin_dbg_set().

 drivers/pinctrl/core.c          | 63 +++++++++++++++++++++++++++++++--
 include/linux/pinctrl/pinctrl.h |  4 +++
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a4ac87c8b4f8..ab832044a0c3 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1620,6 +1620,53 @@ EXPORT_SYMBOL_GPL(pinctrl_pm_select_idle_state);
 
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
+	int ret;
+	unsigned int i, pin, val;
+
+	if (!ops->pin_dbg_set)
+		return -EFAULT;
+
+	ret = strncpy_from_user(buf, user_buf, sizeof(buf));
+	if (ret == 0 || ret == sizeof(buf))
+		ret = -ERANGE;
+
+	if (ret < 0)
+		return ret;
+
+	token = strsep(&c, " ");
+	ret = kstrtouint(token, 0, &pin);
+	if (ret)
+		return ret;
+
+	token = strsep(&c, " ");
+	ret = kstrtouint(token, 0, &val);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < pctldev->desc->npins; i++) {
+		if (pin != pctldev->desc->pins[i].number)
+			continue;
+
+		ret = ops->pin_dbg_set(pctldev, pin, val);
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
@@ -1677,7 +1724,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
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
@@ -1886,6 +1937,14 @@ static int pinctrl_show(struct seq_file *s, void *what)
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
@@ -1915,7 +1974,7 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
 			dev_name(pctldev->dev));
 		return;
 	}
-	debugfs_create_file("pins", 0444,
+	debugfs_create_file("pins", 0644,
 			    device_root, pctldev, &pinctrl_pins_fops);
 	debugfs_create_file("pingroups", 0444,
 			    device_root, pctldev, &pinctrl_groups_fops);
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..7ae8aca3dfa5 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -75,6 +75,8 @@ struct pinctrl_gpio_range {
  *	group selector @pins, and the size of the array in @num_pins
  * @pin_dbg_show: optional debugfs display hook that will provide per-device
  *	info for a certain pin in debugfs
+ * @pin_dbg_set: optional debugfs set hook that will write per-device pinmux
+ *	register for a certain pin in debugfs
  * @dt_node_to_map: parse a device tree "pin configuration node", and create
  *	mapping table entries for it. These are returned through the @map and
  *	@num_maps output parameters. This function is optional, and may be
@@ -95,6 +97,8 @@ struct pinctrl_ops {
 			       unsigned *num_pins);
 	void (*pin_dbg_show) (struct pinctrl_dev *pctldev, struct seq_file *s,
 			  unsigned offset);
+	int (*pin_dbg_set) (struct pinctrl_dev *pctldev, unsigned int offset,
+			    unsigned int val);
 	int (*dt_node_to_map) (struct pinctrl_dev *pctldev,
 			       struct device_node *np_config,
 			       struct pinctrl_map **map, unsigned *num_maps);
-- 
2.17.1

