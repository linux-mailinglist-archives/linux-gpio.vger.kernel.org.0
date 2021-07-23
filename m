Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3173D35D2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 09:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbhGWHSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:18:50 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41225 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233291AbhGWHSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 03:18:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7666558163D;
        Fri, 23 Jul 2021 03:59:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Jul 2021 03:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=prvFZBuvGwZue
        C8BLyYXlLV7gDV0lQGJkUtNBW/Q/Ok=; b=jnQpu3WBtUnqmRHaHOWk3RoktPD77
        Gl8xQKvUlATXmBTuldAeI8Z8tdxsxmq7b7pLPFpwH86If5Qwf9CCKlk7Dw+dexjp
        D2TZkQZPvARdqTIlsAEXBpJ8pyee/lgXS38gy/wmNEHJQT/KrcJSKT5EB1OLl2TE
        7BeG6W9ffCJXIsV3PwdLQ/fra6etZ97+SgSzgMDw1ggMAMK+HBUG7lqJ5gU4eqSF
        hreIqJ++/63Y1PapuplHevVMX0NVIbJ9RovuT+R+wu2clEbGvbtuxfKDXbLlqibu
        xYmBlj++AltwC9KvZn/7Mh9lXXlEbbzLZPED1k6RwhsYM89cEa8mVd+tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=prvFZBuvGwZueC8BLyYXlLV7gDV0lQGJkUtNBW/Q/Ok=; b=RJsjaRJ0
        qZR2nFVvDiApiQqvcXDUhDirmvRrVxdmV3F/t2wsw9pb7cIkt57wyR7zfOq6pv/1
        QAqGcYbDVSFEo/ZK8hwNktOdFJczkEm4uNZP8b6j4MYMVQ0f16eeAQKoU2v2WUAw
        iO75/9jU5E91lzbMBrkJYBAS1b75F/rladRduWSBuwYx5aSQS4pqlU5jyN2Ppvg7
        LnpH9CBIDXYcmj+mNkxD9+Yjb/I0PkfYc5G0rbRyHZCQ8Xfgg3qgDR7+tMvPw2tm
        glRZ2lAeCiloUufE7GYX37cpCRLDjDqU5K0nhbIhEktdPXHahg0ufDLeQrQ0FICw
        u6BYLFjb0ytAmQ==
X-ME-Sender: <xms:23b6YJnfRAc5XYp3Q0GpqqRKO4qptuL8vTzSevV6No1iUGWEo7Czkg>
    <xme:23b6YE3GOBBNTYQXKwWFqmpI2W2Jxhr3P-F7YVsNqADtKWsyaBJ4bexSV_eMcO10L
    U_qMszEt4qrpPIHgA>
X-ME-Received: <xmr:23b6YPr0sXab7RfSjtqsuSDRNh2s1QTlxQJQd1pOxVB5T_idQvs5ZXvbPdJys37al5y1HhbN-ppU1DBiblz3e3RQOYIPpmUJ-lrKm9IUYXBmWCU-JzWb9YyKK5SZOzCpY-cX2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:23b6YJlWOVOhSg30IjHI_6GZggFxYDnT1tw6x5dAiPymcSG4yq-Jvw>
    <xmx:23b6YH0Zh7I6CfNFxpE9hQSOAt9eKnIdP7Bbek9Mcu5Dn-l28yRdEg>
    <xmx:23b6YIvEjspLLQ0KRLQkgNH4Z3vofHAixguZ-aaE2XYUBRVIy-9sSw>
    <xmx:23b6YJxPpU6fVnPgGRLYfdjNXgXI1L18gQh4_EWWzLEvMA6RoIZeOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:19 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/6] pinctrl: Add pinctrl_gpio_as_pin()
Date:   Fri, 23 Jul 2021 17:28:53 +0930
Message-Id: <20210723075858.376378-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow gpiochips to map the GPIO numberspace onto a pin numberspace when
the register layout for GPIO control is implemented in terms of the
pin numberspace.

This requirement sounds kind of strange, but the patch is driven by
trying to resolve a bug in the leds-pca955x driver where this mapping is
not correctly performed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/core.c          | 19 +++++++++++++++++++
 include/linux/pinctrl/pinctrl.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a4ac87c8b4f8..9c788f0e2844 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -738,6 +738,25 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
+int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio)
+{
+	struct pinctrl_gpio_range *range;
+	int pin;
+
+	range = pinctrl_match_gpio_range(pctldev, gpio);
+	if (!range)
+		return -ENODEV;
+
+	mutex_lock(&pctldev->mutex);
+
+	pin = gpio_to_pin(range, gpio);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return pin;
+}
+EXPORT_SYMBOL_GPL(pinctrl_find_gpio_range_from_pin);
+
 bool pinctrl_gpio_can_use_line(unsigned gpio)
 {
 	struct pinctrl_dev *pctldev;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 70b45d28e7a9..1ceebc499cc4 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -182,6 +182,9 @@ extern struct pinctrl_dev *pinctrl_find_and_add_gpio_range(const char *devname,
 extern struct pinctrl_gpio_range *
 pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
 				 unsigned int pin);
+
+extern int pinctrl_gpio_as_pin(struct pinctrl_dev *pctldev, unsigned int gpio);
+
 extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				const char *pin_group, const unsigned **pins,
 				unsigned *num_pins);
-- 
2.30.2

