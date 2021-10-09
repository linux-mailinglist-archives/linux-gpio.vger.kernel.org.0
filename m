Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC4F4276ED
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Oct 2021 05:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhJIDfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 23:35:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39687 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhJIDfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 23:35:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 631E35C00E2;
        Fri,  8 Oct 2021 23:33:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 23:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=LXfnNhzWYII+P
        kFrYEVL8hgiVyH5C1OFCPYKY9Yaiso=; b=akdTeznuhuUxqiXnQCZJsKh3ywm3E
        Z/+sAS76MrPhsSCzFOYuXUiHmR8WXx470O7JbpYJUlu9700u8A65Sc0QoMqXhFjT
        OFghT0yDEn0dU8tWsesih4LpbRqak9LQLsWQQ1DuKNvW6DRZWymJOqkNxs8JIjAs
        uMHVrK6DIMqT9y5oGuRDk726z5xyOcqKhCanTRw36Kr2qPJ8bYfh4pI2wtUovKWr
        c6tfuyR2Hlll/FSqpctuXEsRNG9Y+TrEqfNV9UovC5JGaW0L6vU4pAznYzBSu3S1
        RZaDnFixdSv4abwvElwPiXLbn9LaWeUP+ZiPMk+ozYooBdIQuY07cPYTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=LXfnNhzWYII+PkFrYEVL8hgiVyH5C1OFCPYKY9Yaiso=; b=ltZslUUd
        Ob83VRN24VJpN6/SrlKQQLpXJHz8Fm5gg0lm2XjlhItLcp8T2ZsloBlRhAyTZaeM
        TelyJv8Ttvar3THPaFoGmXn6oY86SZfJXaD5hZOb6jWKgq1nLLZiyPDsiGiznPlg
        W2ErPKH3MX0kmXtpd5OSyi6BAgJNUuaBQ2x8ng9sSGcWDjS1Oo19P2jmkIcXViUe
        DEIIlqxgG0+rnpPzFHzG1W8zboFbedMJjQo1Miatq3/sEmWMLbBXzilGZqljZrQd
        MTyObxgCA+xF/sKkxC9yNFgoIIaUS+QgqtvHnyYuVsaaiAqP0C5/kNcKiPIu/cxB
        MucsNUfsTBXZwg==
X-ME-Sender: <xms:cQ1hYW2dpP0uff2m-HDWkWSLS8LKQjqEgqcfqlVQZBHbTwAQo2Aw5A>
    <xme:cQ1hYZER-dIviCfaGjQEQOd9ZXTwP_MgFkFBQMuEzDFc16rvg_eMqRIQWZmOWIGok
    3BKrKeOxtohzaWtZw>
X-ME-Received: <xmr:cQ1hYe4Y4YCUnX3yBEgYJX7qxEQYTKaTToCaFddcPes6hDWTXcQo0_4pmdFAhmwxuICWX50Ga25LqS51nbdbUuUdfJGPC-e5TIrVOWtR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtuddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepufgrtghhihcumfhinhhguceonhgrkhgrthhosehnrghkrght
    ohdrihhoqeenucggtffrrghtthgvrhhnpedufeethfetgeektdeuvdetiefhteffuddule
    dukeektdfhtdefudeiheejgffhhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnrghkrghtohesnhgrkhgrthhordhioh
X-ME-Proxy: <xmx:cQ1hYX3diMAcRYiaszah4QNdXehPLgGN-j_sI_TpL7k31Zf6nqJiNg>
    <xmx:cQ1hYZFgxMKV9yz_gvZCsLGsWX6vdV3bvdceYVIUfAF6W98-lUVp7A>
    <xmx:cQ1hYQ8A8qB6Y8aebPQemL7ck14v0CFOJnnp-EMZvkIT4Z3DVS9gYQ>
    <xmx:cQ1hYe432JC-okPW4md0XjGH4UUJ5k5ppZC_08azayMnDqml3J_psw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 23:33:01 -0400 (EDT)
From:   Sachi King <nakato@nakato.io>
To:     bnatikar@amd.com, mario.limonciello@amd.com
Cc:     linux-gpio@vger.kernel.org, Shyam-sundar.S-k@amd.com,
        Nehal-bakulchandra.Shah@amd.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, nakato@nakato.io
Subject: [PATCH v2] pinctrl: amd: disable and mask interrupts on probe
Date:   Sat,  9 Oct 2021 14:32:40 +1100
Message-Id: <20211009033240.21543-1-nakato@nakato.io>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <5d683882-257d-87b2-20aa-0871e2902090@amd.com>
References: <5d683882-257d-87b2-20aa-0871e2902090@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some systems such as the Microsoft Surface Laptop 4 leave interrupts
enabled and configured for use in sleep states on boot, which cause
unexpected behaviour such as spurious wakes and failed resumes in
s2idle states.

As interrupts should not be enabled until they are claimed and
explicitly enabled, disabling any interrupts mistakenly left enabled by
firmware should be safe.

Signed-off-by: Sachi King <nakato@nakato.io>
---
Changes since v1:
- Removed duplicate INTERRUPT_MASK_OFF
- Corrected incorrect use of spaces instead of tab on third mask line
- Moved bitwise or to end of line to follow convention
- Corrected missing blank line after declaration
- Corrected open brace following function definitions
---
 drivers/pinctrl/pinctrl-amd.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 8d0f88e9ca88..bae9d429b813 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -840,6 +840,34 @@ static const struct pinconf_ops amd_pinconf_ops = {
 	.pin_config_group_set = amd_pinconf_group_set,
 };
 
+static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
+{
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	unsigned long flags;
+	u32 pin_reg, mask;
+	int i;
+
+	mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3) |
+		BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF) |
+		BIT(WAKE_CNTRL_OFF_S4);
+
+	for (i = 0; i < desc->npins; i++) {
+		int pin = desc->pins[i].number;
+		const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
+
+		if (!pd)
+			continue;
+
+		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+
+		pin_reg = readl(gpio_dev->base + i * 4);
+		pin_reg &= ~mask;
+		writel(pin_reg, gpio_dev->base + i * 4);
+
+		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+	}
+}
+
 #ifdef CONFIG_PM_SLEEP
 static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 {
@@ -976,6 +1004,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio_dev->pctrl);
 	}
 
+	/* Disable and mask interrupts */
+	amd_gpio_irq_init(gpio_dev);
+
 	girq = &gpio_dev->gc.irq;
 	girq->chip = &amd_gpio_irqchip;
 	/* This will let us handle the parent IRQ in the driver */
-- 
2.33.0

