Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381C1621973
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 17:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbiKHQdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 11:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234428AbiKHQdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 11:33:01 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16C458006;
        Tue,  8 Nov 2022 08:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=r3eNyIjxDKk23f9oCDU73gWOczaFl0qT6zUOuTRb0KQ=; b=AzGdUlh9t8JDBnIuNxuDjRNcW0
        fFfcdGUwj0KSqsLFPDfXaN9OWeoMQwAwz8WJ13HVKS/VDc2pfYP5S+uYwA61hl+0e2ijMVdW+jynO
        POEuP+WLohwvLH9sOMp7uEmB3KwYO2gkaBwgX0SUQzAldHI8YofqnNQS1VrwOUurX/LxYMKTZGdrH
        w/RwBzIxrB4JKwsbBhR88tUPwJ8kN65Z4oppRBtIXJX9XpSB5vZBrXjQ62u9sgQthc2e+DLiZDVT9
        HW8DO3+9ax8uuRYzYe70L8AjvLpZWc2gGNz4Jvo9frdtOiRTq1mAKWdOJqPeNYfECF9l7KNm4uBRE
        tGdTKg4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35172)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1osRWm-0003R2-7b; Tue, 08 Nov 2022 16:32:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1osRWg-0004su-7V; Tue, 08 Nov 2022 16:32:38 +0000
Date:   Tue, 8 Nov 2022 16:32:38 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH v3 0/7] Add Apple Mac System Management Controller GPIOs
Message-ID: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This is version 3 of the series adds support for the Apple Mac GPIO
driver. These GPIOs are hadled via the System Management Controller.

The first patch adds the core SMC support to the MFD subsystem.

Patch 2 prepares the printf code for printing generic fourccs, as
required by patch 4 and 7.

Patch 3 adds the DT binding documentation for the rtkit backend.

Patch 4 adds the rtkit backend for the SMC core.

Patch 5 adds the device tree updates for the rtkit communication
channel and gpio sub device to DT.

Patch 6 adds the DT binding documentation for the gpio client.

Patch 7 adds the gpio client.

Patches mostly taken from the Asahi project and then modified due to
review comments from the previous postings.

I may have missed some comments as there's been quite a lot of
discussion on previous postings.

 Documentation/core-api/printk-formats.rst          |  32 ++
 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   |  37 ++
 .../devicetree/bindings/mfd/apple,smc.yaml         |  67 +++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  27 ++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 245 +++++++++++
 drivers/mfd/Kconfig                                |   4 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/macsmc.c                               | 239 +++++++++++
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/apple/Kconfig                     |  34 ++
 drivers/platform/apple/Makefile                    |   7 +
 drivers/platform/apple/macsmc-rtkit.c              | 455 +++++++++++++++++++++
 include/linux/mfd/macsmc.h                         | 104 +++++
 lib/test_printf.c                                  |  39 +-
 lib/vsprintf.c                                     |  35 +-
 18 files changed, 1328 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c
 create mode 100644 drivers/mfd/macsmc.c
 create mode 100644 drivers/platform/apple/Kconfig
 create mode 100644 drivers/platform/apple/Makefile
 create mode 100644 drivers/platform/apple/macsmc-rtkit.c
 create mode 100644 include/linux/mfd/macsmc.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
