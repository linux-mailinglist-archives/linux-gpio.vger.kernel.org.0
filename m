Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412F25A997F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 15:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbiIANyT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 09:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbiIANyS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 09:54:18 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5776A205EA;
        Thu,  1 Sep 2022 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OIuuWZHIE79RchMzxo9rcKTVtQlB+aNlI5Cl+pfkoGQ=; b=G1eBjNaG1b4RpXR2bE4d7P2XwL
        NJi248a9rKrf89X3PkR4RzYu0kirMsJsrNYYyibj0m1eu8cAecuqrjTmM4ZwRPi6v98OII0/b/IVU
        Mus0CF9MaDTbP4mxUBS4GUJN/Jfcd3Cl8kmsiQaBkwcItL+QnoLXaDPsTaCMk+ByNaeIjBoXUSIqK
        wlDUm77bhGcuWewBKj7gEP105Mu7/4eR0MBvWM9yV12MdDOicHRN79pizFkKt42qJ/rmPEYCicVrg
        FREe4ait+/J96hZgfpBNIkRuiv2C2HMtxI2sQ/1P47hWOC8dgtR2zntTgjwVo2CwThPE6APsK0Mm6
        fV3x/zug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34038)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTkdw-0005vl-CF; Thu, 01 Sep 2022 14:54:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTkdt-0003Vs-Us; Thu, 01 Sep 2022 14:54:01 +0100
Date:   Thu, 1 Sep 2022 14:54:01 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 0/6] Add Apple Mac System Management Controller GPIOs
Message-ID: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series adds support for the Apple Mac GPIO driver. These GPIOs
are hadled via the System Management Controller.

The first two patches add the DT binding documentation for the new
drivers.

The second two patches add the core System Management Controller
support.

The last two patches add the GPIO support.

DT updates will follow once the bindings have been reviewed.

Patches taken from the Asahi project.

 .../devicetree/bindings/gpio/gpio-macsmc.yaml      |  28 ++
 .../devicetree/bindings/mfd/apple,smc.yaml         |  57 +++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 394 ++++++++++++++++++
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/apple/Kconfig                     |  49 +++
 drivers/platform/apple/Makefile                    |  11 +
 drivers/platform/apple/smc.h                       |  28 ++
 drivers/platform/apple/smc_core.c                  | 249 ++++++++++++
 drivers/platform/apple/smc_rtkit.c                 | 451 +++++++++++++++++++++
 drivers/soc/apple/rtkit.c                          |   6 +
 include/linux/mfd/macsmc.h                         |  86 ++++
 include/linux/soc/apple/rtkit.h                    |  12 +
 15 files changed, 1386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c
 create mode 100644 drivers/platform/apple/Kconfig
 create mode 100644 drivers/platform/apple/Makefile
 create mode 100644 drivers/platform/apple/smc.h
 create mode 100644 drivers/platform/apple/smc_core.c
 create mode 100644 drivers/platform/apple/smc_rtkit.c
 create mode 100644 include/linux/mfd/macsmc.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
