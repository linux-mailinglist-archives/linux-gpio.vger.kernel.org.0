Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E7331FAB4
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Feb 2021 15:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhBSO2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Feb 2021 09:28:30 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59443 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230513AbhBSO2I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Feb 2021 09:28:08 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E51245803AA;
        Fri, 19 Feb 2021 09:26:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=tgPzT8KANlt6b
        tnmwq4Jhv0nW8WKZxHI0W8K9l9oRQI=; b=L+cJhKoNTicVe/5mtdySxPKqm+DHd
        MWGX2qPO42e74fUm1BFJLL5AJOsH1Iu6/EI77sy/dZEOd7Ao+m/oo4EXH5pAuTcl
        K+oy4YA0C9l6lKgWiaQi2sk2bsyUoxuzfubWUXraSj7gklpKNvx/JQFop0UxmWzh
        ez3Ble0Sah+zvwga5T9+zN0BJqd+7vC8JnCS+qaCDUwErC57xlkSIjES7vPjlhzG
        eGQTbO5V7qKAFxp2S9TuskJ2dmHaoHNhW9HeGoyOmbzZ9tuAyZndh67qwsxkBEDK
        /hnJBiSWEBHSWrs0kHxSnG7LDmxfZemu79swVNo9J/XwS0wMndPZvxX5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=tgPzT8KANlt6btnmwq4Jhv0nW8WKZxHI0W8K9l9oRQI=; b=Qeq9gs9R
        eDJdpdz2trQc0kmOeeQTU+K3nzqw+Jgj6v/Ov0RGATB4tuc95fHpiEMvLGPe9GK2
        irnepiQTzpB4xvHbq5xd5CB83R3FK7+06NwgUm4oOvrYiXNB2SG9oIiVe5avBPVA
        7B4Klt7kXWGlc++t5P+qlHKUgpqpOnZWk+egNBNg+ayj8vndcA3iuLJJjhqBHPON
        dDPakRMR/ND2qNfSRTeZCNYhc4qnrPnggG7RXBxg/4oWYU0huOWS4xY6KEmvsLIw
        T3ZYLvBOKWkJg2PX9t9dU7/1uobHvJFPJ9dwlWSwI2iii7H/q/43BLr+wEGB1CFx
        0aNLDPD7bR9g+Q==
X-ME-Sender: <xms:pcovYBqspdv-TQXWzQPRXs41_jG2i-ijTMCfe2mHB1AsBH7jwSwNKg>
    <xme:pcovYDq_F9r6Y3asoTy3WxFLum_14r5-RI0hJTXPPlhtB1BVRlqID92eIARo-dXoM
    6p8jnC9r-Plf9Un_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
    uhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:pcovYOPfwr4B3mCpS3H3PUlD1knNs5j1VXj3_gQwm-OssBFnGMh5RA>
    <xmx:pcovYM6xRtKpbA154LPYDPpwGpjHP9flzWXClIClURuNBvpoTDCxZA>
    <xmx:pcovYA6NBNZA35SGT4VNQg_fUQ0qf0qeaytn4hBxDnA8ZnO3x4-ggA>
    <xmx:pcovYMqLRweyp5TI8wBSy2UQJ_aZWLozbGPfCDOnrJmt07u4FJzDqQ>
Received: from localhost.localdomain (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
        by mail.messagingengine.com (Postfix) with ESMTPA id E53BD240062;
        Fri, 19 Feb 2021 09:26:38 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org
Cc:     robh+dt@kernel.org, joel@jms.id.au, lee.jones@linaro.org,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, chiawei_wang@aspeedtech.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH 09/19] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Date:   Sat, 20 Feb 2021 00:55:13 +1030
Message-Id: <20210219142523.3464540-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Take steps towards defining a coherent API to separate the KCS device
drivers from the userspace interface. Decreasing the coupling will
improve the separation of concerns and enable the introduction of
alternative userspace interfaces.

For now, simply split the chardev logic out to a separate file. The code
continues to build into the same module.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/Makefile            |   2 +-
 drivers/char/ipmi/kcs_bmc.c           | 423 +------------------------
 drivers/char/ipmi/kcs_bmc.h           |  10 +-
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 426 ++++++++++++++++++++++++++
 4 files changed, 449 insertions(+), 412 deletions(-)
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c

diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..a302bc865370 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
 obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
-obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
+obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o kcs_bmc_cdev_ipmi.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index c4336c1f2d6d..ef5c48ffe74a 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -3,446 +3,51 @@
  * Copyright (c) 2015-2018, Intel Corporation.
  */
 
-#define pr_fmt(fmt) "kcs-bmc: " fmt
-
-#include <linux/errno.h>
-#include <linux/io.h>
-#include <linux/ipmi_bmc.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/poll.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
 
 #include "kcs_bmc.h"
 
-#define DEVICE_NAME "ipmi-kcs"
-
-#define KCS_MSG_BUFSIZ    1000
-
-#define KCS_ZERO_DATA     0
-
-
-/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
-#define KCS_STATUS_STATE(state) (state << 6)
-#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
-#define KCS_STATUS_CMD_DAT      BIT(3)
-#define KCS_STATUS_SMS_ATN      BIT(2)
-#define KCS_STATUS_IBF          BIT(1)
-#define KCS_STATUS_OBF          BIT(0)
-
-/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
-enum kcs_states {
-	IDLE_STATE  = 0,
-	READ_STATE  = 1,
-	WRITE_STATE = 2,
-	ERROR_STATE = 3,
-};
-
-/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
-#define KCS_CMD_GET_STATUS_ABORT  0x60
-#define KCS_CMD_WRITE_START       0x61
-#define KCS_CMD_WRITE_END         0x62
-#define KCS_CMD_READ_BYTE         0x68
-
-static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
 }
+EXPORT_SYMBOL(kcs_bmc_read_data);
 
-static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
 }
+EXPORT_SYMBOL(kcs_bmc_write_data);
 
-static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
 }
+EXPORT_SYMBOL(kcs_bmc_read_status);
 
-static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
 }
+EXPORT_SYMBOL(kcs_bmc_write_status);
 
-static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
 {
 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
+EXPORT_SYMBOL(kcs_bmc_update_status);
 
-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
-{
-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
-					KCS_STATUS_STATE(state));
-}
-
-static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
-{
-	set_state(kcs_bmc, ERROR_STATE);
-	kcs_bmc_read_data(kcs_bmc);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-
-	kcs_bmc->phase = KCS_PHASE_ERROR;
-	kcs_bmc->data_in_avail = false;
-	kcs_bmc->data_in_idx = 0;
-}
-
-static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
-{
-	u8 data;
-
-	switch (kcs_bmc->phase) {
-	case KCS_PHASE_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
-		fallthrough;
-
-	case KCS_PHASE_WRITE_DATA:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, WRITE_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
-		} else {
-			kcs_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
-		}
-		break;
-
-	case KCS_PHASE_WRITE_END_CMD:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, READ_STATE);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
-			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
-			kcs_bmc->data_in_avail = true;
-			wake_up_interruptible(&kcs_bmc->queue);
-		} else {
-			kcs_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
-		}
-		break;
-
-	case KCS_PHASE_READ:
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
-			set_state(kcs_bmc, IDLE_STATE);
-
-		data = kcs_bmc_read_data(kcs_bmc);
-		if (data != KCS_CMD_READ_BYTE) {
-			set_state(kcs_bmc, ERROR_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			break;
-		}
-
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->phase = KCS_PHASE_IDLE;
-			break;
-		}
-
-		kcs_bmc_write_data(kcs_bmc,
-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
-		break;
-
-	case KCS_PHASE_ABORT_ERROR1:
-		set_state(kcs_bmc, READ_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
-		break;
-
-	case KCS_PHASE_ABORT_ERROR2:
-		set_state(kcs_bmc, IDLE_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-		kcs_bmc->phase = KCS_PHASE_IDLE;
-		break;
-
-	default:
-		kcs_force_abort(kcs_bmc);
-		break;
-	}
-}
-
-static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
-{
-	u8 cmd;
-
-	set_state(kcs_bmc, WRITE_STATE);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-
-	cmd = kcs_bmc_read_data(kcs_bmc);
-	switch (cmd) {
-	case KCS_CMD_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_START;
-		kcs_bmc->error = KCS_NO_ERROR;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-		break;
-
-	case KCS_CMD_WRITE_END:
-		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
-			kcs_force_abort(kcs_bmc);
-			break;
-		}
-
-		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
-		break;
-
-	case KCS_CMD_GET_STATUS_ABORT:
-		if (kcs_bmc->error == KCS_NO_ERROR)
-			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
-
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-		break;
-
-	default:
-		kcs_force_abort(kcs_bmc);
-		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
-		break;
-	}
-}
-
+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
 {
-	unsigned long flags;
-	int ret = -ENODATA;
-	u8 status;
-
-	spin_lock_irqsave(&kcs_bmc->lock, flags);
-
-	status = kcs_bmc_read_status(kcs_bmc);
-	if (status & KCS_STATUS_IBF) {
-		if (!kcs_bmc->running)
-			kcs_force_abort(kcs_bmc);
-		else if (status & KCS_STATUS_CMD_DAT)
-			kcs_bmc_handle_cmd(kcs_bmc);
-		else
-			kcs_bmc_handle_data(kcs_bmc);
-
-		ret = 0;
-	}
-
-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
-
-	return ret;
+	return kcs_bmc_ipmi_event(kcs_bmc);
 }
 EXPORT_SYMBOL(kcs_bmc_handle_event);
 
-static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
-{
-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
-}
-
-static int kcs_bmc_open(struct inode *inode, struct file *filp)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	int ret = 0;
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (!kcs_bmc->running)
-		kcs_bmc->running = 1;
-	else
-		ret = -EBUSY;
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return ret;
-}
-
-static __poll_t kcs_bmc_poll(struct file *filp, poll_table *wait)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	__poll_t mask = 0;
-
-	poll_wait(filp, &kcs_bmc->queue, wait);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->data_in_avail)
-		mask |= EPOLLIN;
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return mask;
-}
-
-static ssize_t kcs_bmc_read(struct file *filp, char __user *buf,
-			    size_t count, loff_t *ppos)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	bool data_avail;
-	size_t data_len;
-	ssize_t ret;
-
-	if (!(filp->f_flags & O_NONBLOCK))
-		wait_event_interruptible(kcs_bmc->queue,
-					 kcs_bmc->data_in_avail);
-
-	mutex_lock(&kcs_bmc->mutex);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	data_avail = kcs_bmc->data_in_avail;
-	if (data_avail) {
-		data_len = kcs_bmc->data_in_idx;
-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	if (!data_avail) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
-	if (count < data_len) {
-		pr_err("channel=%u with too large data : %zu\n",
-			kcs_bmc->channel, data_len);
-
-		spin_lock_irq(&kcs_bmc->lock);
-		kcs_force_abort(kcs_bmc);
-		spin_unlock_irq(&kcs_bmc->lock);
-
-		ret = -EOVERFLOW;
-		goto out_unlock;
-	}
-
-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
-		ret = -EFAULT;
-		goto out_unlock;
-	}
-
-	ret = data_len;
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
-		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-	} else {
-		ret = -EAGAIN;
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
-
-	return ret;
-}
-
-static ssize_t kcs_bmc_write(struct file *filp, const char __user *buf,
-			     size_t count, loff_t *ppos)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	ssize_t ret;
-
-	/* a minimum response size '3' : netfn + cmd + ccode */
-	if (count < 3 || count > KCS_MSG_BUFSIZ)
-		return -EINVAL;
-
-	mutex_lock(&kcs_bmc->mutex);
-
-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
-		ret = -EFAULT;
-		goto out_unlock;
-	}
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
-		kcs_bmc->phase = KCS_PHASE_READ;
-		kcs_bmc->data_out_idx = 1;
-		kcs_bmc->data_out_len = count;
-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
-		ret = count;
-	} else {
-		ret = -EINVAL;
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
-
-	return ret;
-}
-
-static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
-			  unsigned long arg)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	long ret = 0;
-
-	spin_lock_irq(&kcs_bmc->lock);
-
-	switch (cmd) {
-	case IPMI_BMC_IOCTL_SET_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
-		break;
-
-	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
-		break;
-
-	case IPMI_BMC_IOCTL_FORCE_ABORT:
-		kcs_force_abort(kcs_bmc);
-		break;
-
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return ret;
-}
-
-static int kcs_bmc_release(struct inode *inode, struct file *filp)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	kcs_bmc->running = 0;
-	kcs_force_abort(kcs_bmc);
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return 0;
-}
-
-static const struct file_operations kcs_bmc_fops = {
-	.owner          = THIS_MODULE,
-	.open           = kcs_bmc_open,
-	.read           = kcs_bmc_read,
-	.write          = kcs_bmc_write,
-	.release        = kcs_bmc_release,
-	.poll           = kcs_bmc_poll,
-	.unlocked_ioctl = kcs_bmc_ioctl,
-};
-
+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
 struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
 {
-	struct kcs_bmc *kcs_bmc;
-
-	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
-	if (!kcs_bmc)
-		return NULL;
-
-	spin_lock_init(&kcs_bmc->lock);
-	kcs_bmc->channel = channel;
-
-	mutex_init(&kcs_bmc->mutex);
-	init_waitqueue_head(&kcs_bmc->queue);
-
-	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-
-	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
-	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
-					       DEVICE_NAME, channel);
-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
-	    !kcs_bmc->miscdev.name)
-		return NULL;
-	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
-
-	return kcs_bmc;
+	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
 }
 EXPORT_SYMBOL(kcs_bmc_alloc);
 
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index 970f53892f2d..febea0c8deb4 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -104,6 +104,12 @@ static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
 }
 
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
-					u32 channel);
+struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel);
+
+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
+
 #endif /* __KCS_BMC_H__ */
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
new file mode 100644
index 000000000000..bc011db0ec01
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015-2018, Intel Corporation.
+ */
+
+#define pr_fmt(fmt) "kcs-bmc: " fmt
+
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/ipmi_bmc.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include "kcs_bmc.h"
+
+#define DEVICE_NAME "ipmi-kcs"
+
+#define KCS_MSG_BUFSIZ    1000
+
+#define KCS_ZERO_DATA     0
+
+
+/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
+#define KCS_STATUS_STATE(state) (state << 6)
+#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
+#define KCS_STATUS_CMD_DAT      BIT(3)
+#define KCS_STATUS_SMS_ATN      BIT(2)
+#define KCS_STATUS_IBF          BIT(1)
+#define KCS_STATUS_OBF          BIT(0)
+
+/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
+enum kcs_states {
+	IDLE_STATE  = 0,
+	READ_STATE  = 1,
+	WRITE_STATE = 2,
+	ERROR_STATE = 3,
+};
+
+/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
+#define KCS_CMD_GET_STATUS_ABORT  0x60
+#define KCS_CMD_WRITE_START       0x61
+#define KCS_CMD_WRITE_END         0x62
+#define KCS_CMD_READ_BYTE         0x68
+
+static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
+{
+	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
+					KCS_STATUS_STATE(state));
+}
+
+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
+{
+	set_state(kcs_bmc, ERROR_STATE);
+	kcs_bmc_read_data(kcs_bmc);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+
+	kcs_bmc->phase = KCS_PHASE_ERROR;
+	kcs_bmc->data_in_avail = false;
+	kcs_bmc->data_in_idx = 0;
+}
+
+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
+{
+	u8 data;
+
+	switch (kcs_bmc->phase) {
+	case KCS_PHASE_WRITE_START:
+		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
+		fallthrough;
+
+	case KCS_PHASE_WRITE_DATA:
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(kcs_bmc, WRITE_STATE);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
+						kcs_bmc_read_data(kcs_bmc);
+		} else {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			kcs_bmc->error = KCS_LENGTH_ERROR;
+		}
+		break;
+
+	case KCS_PHASE_WRITE_END_CMD:
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(kcs_bmc, READ_STATE);
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
+						kcs_bmc_read_data(kcs_bmc);
+			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
+			kcs_bmc->data_in_avail = true;
+			wake_up_interruptible(&kcs_bmc->queue);
+		} else {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			kcs_bmc->error = KCS_LENGTH_ERROR;
+		}
+		break;
+
+	case KCS_PHASE_READ:
+		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
+			set_state(kcs_bmc, IDLE_STATE);
+
+		data = kcs_bmc_read_data(kcs_bmc);
+		if (data != KCS_CMD_READ_BYTE) {
+			set_state(kcs_bmc, ERROR_STATE);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			break;
+		}
+
+		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc->phase = KCS_PHASE_IDLE;
+			break;
+		}
+
+		kcs_bmc_write_data(kcs_bmc,
+			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
+		break;
+
+	case KCS_PHASE_ABORT_ERROR1:
+		set_state(kcs_bmc, READ_STATE);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
+		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
+		break;
+
+	case KCS_PHASE_ABORT_ERROR2:
+		set_state(kcs_bmc, IDLE_STATE);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+		kcs_bmc->phase = KCS_PHASE_IDLE;
+		break;
+
+	default:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		break;
+	}
+}
+
+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
+{
+	u8 cmd;
+
+	set_state(kcs_bmc, WRITE_STATE);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+
+	cmd = kcs_bmc_read_data(kcs_bmc);
+	switch (cmd) {
+	case KCS_CMD_WRITE_START:
+		kcs_bmc->phase = KCS_PHASE_WRITE_START;
+		kcs_bmc->error = KCS_NO_ERROR;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+		break;
+
+	case KCS_CMD_WRITE_END:
+		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			break;
+		}
+
+		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
+		break;
+
+	case KCS_CMD_GET_STATUS_ABORT:
+		if (kcs_bmc->error == KCS_NO_ERROR)
+			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
+
+		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+		break;
+
+	default:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
+		break;
+	}
+}
+
+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
+{
+	unsigned long flags;
+	int ret = -ENODATA;
+	u8 status;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+
+	status = kcs_bmc_read_status(kcs_bmc);
+	if (status & KCS_STATUS_IBF) {
+		if (!kcs_bmc->running)
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+		else if (status & KCS_STATUS_CMD_DAT)
+			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
+		else
+			kcs_bmc_ipmi_handle_data(kcs_bmc);
+
+		ret = 0;
+	}
+
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(kcs_bmc_ipmi_event);
+
+static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
+{
+	return container_of(filp->private_data, struct kcs_bmc, miscdev);
+}
+
+static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	int ret = 0;
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (!kcs_bmc->running)
+		kcs_bmc->running = 1;
+	else
+		ret = -EBUSY;
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return ret;
+}
+
+static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	__poll_t mask = 0;
+
+	poll_wait(filp, &kcs_bmc->queue, wait);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->data_in_avail)
+		mask |= EPOLLIN;
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return mask;
+}
+
+static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
+			    size_t count, loff_t *ppos)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	bool data_avail;
+	size_t data_len;
+	ssize_t ret;
+
+	if (!(filp->f_flags & O_NONBLOCK))
+		wait_event_interruptible(kcs_bmc->queue,
+					 kcs_bmc->data_in_avail);
+
+	mutex_lock(&kcs_bmc->mutex);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	data_avail = kcs_bmc->data_in_avail;
+	if (data_avail) {
+		data_len = kcs_bmc->data_in_idx;
+		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	if (!data_avail) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	if (count < data_len) {
+		pr_err("channel=%u with too large data : %zu\n",
+			kcs_bmc->channel, data_len);
+
+		spin_lock_irq(&kcs_bmc->lock);
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		spin_unlock_irq(&kcs_bmc->lock);
+
+		ret = -EOVERFLOW;
+		goto out_unlock;
+	}
+
+	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
+		ret = -EFAULT;
+		goto out_unlock;
+	}
+
+	ret = data_len;
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
+		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+	} else {
+		ret = -EAGAIN;
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+out_unlock:
+	mutex_unlock(&kcs_bmc->mutex);
+
+	return ret;
+}
+
+static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	ssize_t ret;
+
+	/* a minimum response size '3' : netfn + cmd + ccode */
+	if (count < 3 || count > KCS_MSG_BUFSIZ)
+		return -EINVAL;
+
+	mutex_lock(&kcs_bmc->mutex);
+
+	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
+		ret = -EFAULT;
+		goto out_unlock;
+	}
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
+		kcs_bmc->phase = KCS_PHASE_READ;
+		kcs_bmc->data_out_idx = 1;
+		kcs_bmc->data_out_len = count;
+		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
+		ret = count;
+	} else {
+		ret = -EINVAL;
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+out_unlock:
+	mutex_unlock(&kcs_bmc->mutex);
+
+	return ret;
+}
+
+static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	long ret = 0;
+
+	spin_lock_irq(&kcs_bmc->lock);
+
+	switch (cmd) {
+	case IPMI_BMC_IOCTL_SET_SMS_ATN:
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
+		break;
+
+	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
+		break;
+
+	case IPMI_BMC_IOCTL_FORCE_ABORT:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return ret;
+}
+
+static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	kcs_bmc->running = 0;
+	kcs_bmc_ipmi_force_abort(kcs_bmc);
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return 0;
+}
+
+static const struct file_operations kcs_bmc_fops = {
+	.owner          = THIS_MODULE,
+	.open           = kcs_bmc_ipmi_open,
+	.read           = kcs_bmc_ipmi_read,
+	.write          = kcs_bmc_ipmi_write,
+	.release        = kcs_bmc_ipmi_release,
+	.poll           = kcs_bmc_ipmi_poll,
+	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
+};
+
+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel)
+{
+	struct kcs_bmc *kcs_bmc;
+
+	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
+	if (!kcs_bmc)
+		return NULL;
+
+	spin_lock_init(&kcs_bmc->lock);
+	kcs_bmc->channel = channel;
+
+	mutex_init(&kcs_bmc->mutex);
+	init_waitqueue_head(&kcs_bmc->queue);
+
+	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+
+	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
+	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
+					       DEVICE_NAME, channel);
+	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
+	    !kcs_bmc->miscdev.name)
+		return NULL;
+	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
+
+	return kcs_bmc;
+}
+EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system software");
-- 
2.27.0

