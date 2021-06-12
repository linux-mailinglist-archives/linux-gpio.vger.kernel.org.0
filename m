Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBD43A50E9
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhFLVPy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhFLVPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:42 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735BFC0611C0
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 14:13:42 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 59DD720C9D4;
        Sat, 12 Jun 2021 23:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zrcLchoMZqIdTITbDeghInblzMMLq4JBFFSGSpCy4xg=;
        b=I3v24iASIQFoz3x/LthQYhV+Xp9BeyHHc2qmJzfjTPm0kL5uFI0csBKA4E6G4AhgAZJu5i
        IWW/RpR3uYOUHr8A2PilzaE/vR9k+eSGNzRPOKTRyOxEpMfLaogyjNr1YMxfgOcVkdy1Cg
        84d5/Am5Z0PsdVbzf2dTRkwPEgSP/bMX0aTLAYg95tnIwgqeOc5US+8+zB1aAFCAg4BN4v
        NeEay7QG4rQcivHBKiQbyFPIjIx87NqNvhOTtXjWaVmALh53t3v+AkColApo9gDuqKCpPK
        gnyAsE3a+eRtcRg439YHsSYAQvyRLpN8Q1sI7SL2CtM94RZolOg0dvOPojtlJg==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v5 8/8] MAINTAINERS: Add RTL8231 MFD driver
Date:   Sat, 12 Jun 2021 23:12:38 +0200
Message-Id: <de430ce05d463e4b8dd8091d90b622999168cbe7.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623532208.git.sander@svanheule.net>
References: <cover.1623532208.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the files associated with the RTL8231 support, and list Sander
Vanheule (myself) as maintainer.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b706dd20ff2b..62d042c14158 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15505,6 +15505,16 @@ S:	Maintained
 F:	include/sound/rt*.h
 F:	sound/soc/codecs/rt*
 
+REALTEK RTL8231 MFD DRIVER
+M:	Sander Vanheule <sander@svanheule.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
+F:	drivers/leds/leds-rtl8231.c
+F:	drivers/mfd/rtl8231.c
+F:	drivers/pinctrl/pinctrl-rtl8231.c
+F:	include/linux/mfd/rtl8231.h
+
 REALTEK RTL83xx SMI DSA ROUTER CHIPS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.31.1

