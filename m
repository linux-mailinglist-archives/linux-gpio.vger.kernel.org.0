Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B373A2CEB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 15:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhFJN1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 09:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhFJN1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 09:27:10 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB03C061574;
        Thu, 10 Jun 2021 06:25:00 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id r7so18624300edv.12;
        Thu, 10 Jun 2021 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHjU2WEAbMZiarjhmO6iycYFdVSmDuuGt5Qz3UrBd+Y=;
        b=I/TRvtWBf2DDlmtgj9SJsOmWLpYOaIfcq4VrtTsAp2XaC6+XhDPuz1BzWHvp4mo7t6
         fIcEaPfX63674bKdSVX+mNCqw59k+dqXNz2wAPa5apypTXMiLrHB1ivA1Nb/wtVW5jeL
         0IbwQhmZb3QLvOzEIl6We35cXPxTp/G28sGN53xTwHwBEz3HkMOdFBAtTY2MyWg9f89r
         txcxLqCUQGMj45LVm2dBp+ym/RXADi2xenGYWrVHloTLpPHCQP72hlxXgKlK+k0k0Pbe
         wkrT/wtmhAKJ1j43VNNzoyaI3wPZRKnbCrJhd+BNQbXeSkTTLimAi6KEmkeO62R345v2
         jHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fHjU2WEAbMZiarjhmO6iycYFdVSmDuuGt5Qz3UrBd+Y=;
        b=dQ23py5UeZkKUiIGgnc9ec2EMv5jxRoejmGRMqgyY/qMi7cRlqaY1lb5+7yeUbPYyH
         0awGL9w+d6qP+KqFBy57/qXWQA/8OE2VqeublrYJLp5VJHvX6+KXBsV2zlkFABaHS69k
         7yN+dln76K1QWyW5/p5vbyBFTuKS10S7n1MiLwx8JHxH+phBR0YjGzZoLdP5FPUz6nCW
         r3G3xHkaiE5yglzm7DNsP4rMyP86E9JelMSBdcbqVfJrKemZl7yF+i5nZcEsBDMNVv9A
         QzJUtI9DWZvsljsJ5QuM6lyLxG5nxvXa1rbtkKvVZ7ssWcuOtNqqCx10z74hPKJM9G1H
         3EpQ==
X-Gm-Message-State: AOAM53174bmLJQNUiwKhcRzNJtKFVGYSZDrd+1ugV/vdHheJhlbSLmsE
        UOEsFh70PBqFRcz6LX6hRCE=
X-Google-Smtp-Source: ABdhPJyuG6UoPJnv1fm5wbYE3JVsU3eu0AejdDreusBw8vLID7l2lSp5Fp6bM8JsuY+V/qGFKUtM/g==
X-Received: by 2002:a05:6402:14d8:: with SMTP id f24mr4823204edx.79.1623331498736;
        Thu, 10 Jun 2021 06:24:58 -0700 (PDT)
Received: from lab-pc01.sra.uni-hannover.de (lab.sra.uni-hannover.de. [130.75.33.87])
        by smtp.gmail.com with ESMTPSA id du16sm999619ejc.42.2021.06.10.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 06:24:58 -0700 (PDT)
From:   Andreas Kaessens <akaessens@gmail.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linux-kernel@i4.cs.fau.de, Andreas Kaessens <akaessens@gmail.com>,
        Darian Biastoch <d.biastoch@gmail.com>
Subject: [PATCH 1/2] pinctrl: mcp23s08: Add optional reset GPIO
Date:   Thu, 10 Jun 2021 15:24:37 +0200
Message-Id: <20210610132438.3085841-1-akaessens@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MCP23x port expander RESET# line can be connected to a host GPIO.
The optional reset-gpio must be set to LOW if the reset is asserted
at probing time.

On page 5 in the datasheet [0] the "Device Active After Reset high"
time is specified at 0 µs. Therefore no waiting is needed after the
reset transition.

[0] https://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf

Signed-off-by: Andreas Kaessens <akaessens@gmail.com>
Signed-off-by: Darian Biastoch <d.biastoch@gmail.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 3 +++
 drivers/pinctrl/pinctrl-mcp23s08.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 799d596a1a4b..8ab254170d99 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
@@ -558,6 +559,8 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
 
+	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
 	 */
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.h b/drivers/pinctrl/pinctrl-mcp23s08.h
index 90dc27081a3c..b8d15939e0c2 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.h
+++ b/drivers/pinctrl/pinctrl-mcp23s08.h
@@ -43,6 +43,7 @@ struct mcp23s08 {
 
 	struct pinctrl_dev	*pctldev;
 	struct pinctrl_desc	pinctrl_desc;
+	struct gpio_desc        *reset_gpio;
 };
 
 extern const struct regmap_config mcp23x08_regmap;
-- 
2.25.1

