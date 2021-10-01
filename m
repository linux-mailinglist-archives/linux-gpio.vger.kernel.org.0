Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54FC41F1FE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 18:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354858AbhJAQT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 12:19:26 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46797 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231992AbhJAQT0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 12:19:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 4EEA632027AE;
        Fri,  1 Oct 2021 12:17:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Oct 2021 12:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=fnYYp9mb27h0Z
        dVSjyd4MQZ1/vDi7YrWJarVWcluyKA=; b=3UOrue5kAfZUv3adiKxjAunbfj1Nc
        U/m51lyv+LgUPW7WgJMQjEuCTO/xsoN2n0wiUb6Jj9qi5nohzTMgteKIlMViBdfr
        bvOvdZekkiqwujC4fhKMHC9PPdaS8wPlaTW8MmqPHF02hB1gYgS2X2TqhHuEfCMW
        qPJgpFdquRhwUZWGgKmoPdx0NAHJ6okSHtvILLPNLvLR6BqiUms21XrKfrlAdSQJ
        f2fPzqF+NqFpJSUoMTjRQmXBDpncHXVe/lfYC7/0rHgn3jojSAGh+gqmjn8Zd47n
        tPkSoy5ocfW9QprfLpoW9bTdXKug4Bd6OMj4Vl0UcW7QWDL4FYouA+2LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=fnYYp9mb27h0ZdVSjyd4MQZ1/vDi7YrWJarVWcluyKA=; b=JDWmubp2
        w3ISRQfefmoY9GhcFSzzE+d5iiksLkE8eptGHDK5+BNV29OMEQZcxD2TutCDEK10
        hckuaRiT7ViDnYzPZdrFPacolsBr0rRaymWmYbITq6pVi/brE8YxN/SgjVC+3t2Z
        RDhwBDOYEkvhT0JkgT3wapY62QsmuGNiKsptWKSHD1pz1A02geoM8IfF/sTPvAed
        cnkL23e3nylPLPiBL6iBnLdxz2yh4UKiIUdL4vx8qDMIc3hW3te1C0VQ1tniJspe
        y3Y5YtuHmrpeEmKoruHj6jYxuZeLcIjKFHt8CIhdoaXk9He/2y9C0iJ+GXjr5LOw
        mCWwB83vs0MRKQ==
X-ME-Sender: <xms:pDRXYchD9wGEP7PjhGMSFxgXLp3tvy7NtanBpVI1yBwI0VMgNoWjvA>
    <xme:pDRXYVCogzE-wFKZGmIlvtJUui2635GYM6PjUQqFJt49xGd1uuF8NeTo_LA2cbRCy
    YpDp2KSL3RSxqPU9w>
X-ME-Received: <xmr:pDRXYUHiZt9q6bK_Pc9_cR8QJc5nlsNLw0hFtCNEROlz30GMj0aTg2aC-JU8jMtF1Katy5Ol2xxFyyA1J1G9IKdXgMjI2XV2bu6nn1_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepufgrtghhihcumfhinhhguceonhgrkhgrthhosehnrghkrght
    ohdrihhoqeenucggtffrrghtthgvrhhnpedufeethfetgeektdeuvdetiefhteffuddule
    dukeektdfhtdefudeiheejgffhhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnrghkrghtohesnhgrkhgrthhordhioh
X-ME-Proxy: <xmx:pDRXYdQn5MSwsrkR73ZAMH34UqFRshFZcj8M3fceDM5n_7uoUwZbGg>
    <xmx:pDRXYZwxoZxOAnwCtpjovAlkY8O_MojDqlW02208oXeB5_yW0Bbwgg>
    <xmx:pDRXYb7j6geo_He13aIP0amUtBFq5U2c4mi0Ubc-SHOQMxx-U7sZ-Q>
    <xmx:pDRXYU9W7hrPOInUX1_5316xskPIL5P2W4GP5NkP6aGcOBh1EFRWmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:17:38 -0400 (EDT)
From:   Sachi King <nakato@nakato.io>
To:     linux-gpio@vger.kernel.org, basavaraj.natikar@amd.com
Cc:     linux-kernel@vger.kernel.org, Sachi King <nakato@nakato.io>
Subject: [PATCH 1/1] pinctrl: amd: disable and mask interrupts on probe
Date:   Sat,  2 Oct 2021 02:17:14 +1000
Message-Id: <20211001161714.2053597-2-nakato@nakato.io>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001161714.2053597-1-nakato@nakato.io>
References: <20211001161714.2053597-1-nakato@nakato.io>
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
 drivers/pinctrl/pinctrl-amd.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index c001f2ed20f8..aa4136cd312d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -830,6 +830,32 @@ static const struct pinconf_ops amd_pinconf_ops = {
 	.pin_config_group_set = amd_pinconf_group_set,
 };
 
+static void amd_gpio_irq_init(struct amd_gpio *gpio_dev) {
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	unsigned long flags;
+	u32 pin_reg, mask;
+	int i;
+
+	mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3)
+		| BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF)
+	        | BIT(INTERRUPT_MASK_OFF) | BIT(WAKE_CNTRL_OFF_S4);
+
+	for (i = 0; i < desc->npins; i++) {
+		int pin = desc->pins[i].number;
+		const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
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
@@ -967,6 +993,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
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

