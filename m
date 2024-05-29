Return-Path: <linux-gpio+bounces-6791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6998D2DF6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0F711F232CF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A181667E5;
	Wed, 29 May 2024 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="K8SUtCHJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312415FCFE
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716966985; cv=none; b=hK07urNaaQwufB9bXJIxTA/sYSRsqg0I0ZX7MD3TeC8zNT2oN3nSORqn+U/Qjf7Q37ulgmYR4nwjnqVWEQ90LWGFaSSNS1QjMNhpnF9qaq+XMoBYZAzHDlvesNwGzjE3+TkGI9fdp4OKUm0G/YGqGqbfiu638a77k+tll9fw0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716966985; c=relaxed/simple;
	bh=nq9OPjriJWIJ5BFeLbgNqrTQm3GhcP0bGpwBiZ8qkO8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=a0mjwisvILypc44L2n66uPGChg17sjA9H7lsQQNmvXFSz9caXNbCn6mltAh2H9eEO5d9oY9TmOpg3sc0YtBjHqr4nzK4ItRSlP74rZUdyC8tqwXOOEPcvjrqO6uj0MD7w8ixdQFM9MUqX19y6uP6nf3jkN613l66LEuiybwYRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=K8SUtCHJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240529071621epoutp01f628cf0e2db048c968ea048ea6c7eed3~T5F9693GN0327603276epoutp01K
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 07:16:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240529071621epoutp01f628cf0e2db048c968ea048ea6c7eed3~T5F9693GN0327603276epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1716966981;
	bh=SiGNd/X062sCjbQ3KNasPq9AXI1T7vTAaXy64r0sd5g=;
	h=From:To:Cc:Subject:Date:References:From;
	b=K8SUtCHJ3n7H9BRfgnOdXRSJ4bj6GCNBIYh/TSsQwm9Q8TdJFdCAR2XL8AjoAfmJZ
	 FOWcDMi6oBOgu6MUQjNIYeSN7YzznUJPH7GodW3Lpj2NqhCH+dmwzjq/HpGLAn0OMS
	 gel+perT/43YNxOED0fGFp4R/zLc8w7RBfFSQCJk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240529071621epcas5p23fe659a7ce88c64dab6ca24ccaec2ec2~T5F9cD9pv3114431144epcas5p25;
	Wed, 29 May 2024 07:16:21 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Vq0zm0Y7cz4x9Pr; Wed, 29 May
	2024 07:16:20 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	53.60.08853.246D6566; Wed, 29 May 2024 16:16:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240529070220epcas5p140580a28b93ce5cb256ef825c778c649~T45urcH3o2715427154epcas5p1B;
	Wed, 29 May 2024 07:02:20 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240529070220epsmtrp2922cc095f16316937ad6715823142c6d~T45uqpiv91136511365epsmtrp2l;
	Wed, 29 May 2024 07:02:20 +0000 (GMT)
X-AuditID: b6c32a44-5fcaba8000002295-e2-6656d642360e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.36.08622.CF2D6566; Wed, 29 May 2024 16:02:20 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240529070219epsmtip17ef35fc42e2bd39fbdedfa6f12c23d0a~T45tOTlm01300713007epsmtip1H;
	Wed, 29 May 2024 07:02:19 +0000 (GMT)
From: Vishnu Reddy <vishnu.reddy@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com
Subject: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
Date: Wed, 29 May 2024 12:29:39 +0530
Message-Id: <20240529065939.36369-1-vishnu.reddy@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7bCmpq7TtbA0gz8rVS0ezNvGZnH+/AZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxaKtX9gtHn7Yw25x+E07qwOXx6ZVnWwed67t
	YfPYvKTeo2/LKkaPz5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YW
	l+al6+WlllgZGhgYmQIVJmRnXNq6gb1gu1TF959rGRsYJ4t1MXJwSAiYSJx4F9PFyMUhJLCb
	UWL3n5uMEM4nRon+vhlsEM43Rok1yz4BZTjBOj78aWOHSOxllGjonQLltDJJvOs4AlbFJqAr
	8XnJWRYQW0QgQeLlh5Ngo5hBlkyefIgNJCEs4CGxbNd6MJtFQFVi5ZFbbCBH8QrYSny9Hg2x
	TV5i9YYDzCC9EgKH2CWuTfnKDpFwkfi0eznUScISr45vgYpLSXx+t5cNwk6WWP/7FDvEozkS
	PdMUIML2EgeuzGEBCTMLaEqs36UPEZaVmHpqHROIzSzAJ9H7+wkTRJxXYsc8GFtN4tik6awQ
	toxE54obUBd4SMzY0glmCwnESrSe2MA4gVF2FsKGBYyMqxglUwuKc9NTk00LDPNSy+HxlJyf
	u4kRnNS0XHYw3pj/T+8QIxMH4yFGCQ5mJRHeM5NC04R4UxIrq1KL8uOLSnNSiw8xmgJDbCKz
	lGhyPjCt5pXEG5pYGpiYmZmZWBqbGSqJ875unZsiJJCeWJKanZpakFoE08fEwSnVwGQgv4FL
	iXPhzaW3X57fMrvgnn9/zcszP4z/HLhx/Mt/vWP+txfNajDYtOjUdHvPZO4EpZtttlwT137X
	VwvwMr/7SViQ9+jHCzzHZhfOPbAhxO2/KMucp8mq+bO3zlMRiHzz+3vtzwyWV6dYhdzM77fe
	E4+czpqoaHzb7aUR+9mAVQuyZkzUlbE7yrv1ejn/zs/p/zd8e3tF2Wli6psZHotfv2Mo3NnQ
	4vJ/pVpVeof7q/zAffYzdT+ftrxz6kVvDsed3Mc7WVdeaRapmu12eVPlXIe2BzryoUvLXVQN
	TNPYOj0n2cT+dBA4aijeLjUvYX/O/Hb5LVc1BQ7WlLAxtXV1nZvxbvc2y0eL/9XmvzqjxFKc
	kWioxVxUnAgAXGOByvMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTvfPpbA0gwU/VSwezNvGZnH+/AZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxaKtX9gtHn7Yw25x+E07qwOXx6ZVnWwed67t
	YfPYvKTeo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDIubd3AXrBdquL7z7WMDYyTxboYOTkk
	BEwkPvxpY+9i5OIQEtjNKHFo2hR2iISMxIc7W5ghbGGJlf+eQxU1M0ksOfWBFSTBJqAr8XnJ
	WRYQW0QgReL1pVtgRcwCBxkl5n1sBysSFvCQWLZrPRuIzSKgKrHyyC0gm4ODV8BW4uv1aIgF
	8hKrNxxgnsDIs4CRYRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnCIaWntYNyz6oPe
	IUYmDsZDjBIczEoivGcmhaYJ8aYkVlalFuXHF5XmpBYfYpTmYFES5/32ujdFSCA9sSQ1OzW1
	ILUIJsvEwSnVwHRGTltXdOv8/98EmU+q/U1inMstfnN6z/wlvD+6Wt01e54dSZhVaH23+/nX
	RIuPy9jYP98PZvj9h3GeYqLQlEOL1W//jn2kPmnqsofSNXfkD/627l3qoa2+4ffxG/MOdwQ9
	vXRCPGci2xlO5UM8bTHvqgM6y2+fn8bDHax8LLRjC8uSRyqPDUrFTsgantyiH+9u6+rSwM61
	e3ps+XbVeU4q0ZEzjStb1+RNcWRbrb75+/eDrRbeS+0KFr8W6/yveTQ26pd17+qZrMKnCyJC
	PgTWz+J6utrp/JKpO4p9Sv+k7nAJOm8Rnb8h4OGnbRqN2tOi6g3Djt8rCxBS8RWRuami4vjr
	f7RL2xt+gaQZlUosxRmJhlrMRcWJAINOWoKgAgAA
X-CMS-MailID: 20240529070220epcas5p140580a28b93ce5cb256ef825c778c649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240529070220epcas5p140580a28b93ce5cb256ef825c778c649
References: <CGME20240529070220epcas5p140580a28b93ce5cb256ef825c778c649@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

gpiolib framework has the implementation of setting up the
PUD configuration for GPIO pins but there is no driver support.

Add support to handle the PUD configuration request from the
userspace in samsung pinctrl driver.

Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 51 +++++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.h |  7 ++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ed07e23e0912..a4b6eea5e168 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -939,6 +939,56 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
 	return 0;
 }
 
+/*
+ * samsung_gpio_set_pud will enable or disable the pull-down and
+ * pull-up for the gpio pins in the PUD register.
+ */
+static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int offset,
+				 unsigned int value)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	const struct samsung_pin_bank_type *type = bank->type;
+	void __iomem *reg;
+	unsigned int data;
+
+	reg = bank->pctl_base + bank->pctl_offset;
+	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
+	data &= ~(0xf << (offset * 4));
+	data |= value << (offset * 4);
+	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
+}
+
+/*
+ * samsung_gpio_set_config will identify the type of PUD config based
+ * on the gpiolib request to enable or disable the PUD configuration.
+ */
+static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				   unsigned long config)
+{
+	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
+	unsigned long flags;
+	unsigned int value = 0;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		value = DISABLE_PIN_PULL_UP_DOWN;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value = ENABLE_PIN_PULL_DOWN;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value = ENABLE_PIN_PULL_UP;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	raw_spin_lock_irqsave(&bank->slock, flags);
+	samsung_gpio_set_pud(gc, offset, value);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	return 0;
+}
+
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
@@ -948,6 +998,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
 	.direction_output = samsung_gpio_direction_output,
 	.to_irq = samsung_gpio_to_irq,
 	.add_pin_ranges = samsung_add_pin_ranges,
+	.set_config = samsung_gpio_set_config,
 	.owner = THIS_MODULE,
 };
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index ab791afaabf5..23b70ddcaccc 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -61,6 +61,13 @@ enum pincfg_type {
 #define PIN_CON_FUNC_INPUT		0x0
 #define PIN_CON_FUNC_OUTPUT		0x1
 
+/*
+ * Values for the pin PUD register.
+ */
+#define DISABLE_PIN_PULL_UP_DOWN	0x0
+#define ENABLE_PIN_PULL_DOWN		0x1
+#define ENABLE_PIN_PULL_UP		0x3
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
-- 
2.17.1


