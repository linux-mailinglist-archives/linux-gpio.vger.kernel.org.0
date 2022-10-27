Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F38260FE1D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 19:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbiJ0RCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 13:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236856AbiJ0RCS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 13:02:18 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86ED11911EC;
        Thu, 27 Oct 2022 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OwFIODKeucvm38ifeAbzV+MbTDymYFhJAFnWlpmT7RU=; b=l8oyLr1xEzaWtYkV80v2eOP5Vn
        ZqoFqV/uOA0XjNIxHbkPm6Zs/vH08sAQfvIbQ7c2WLYOc5qRJS6fRQRooe6yODaWaylUcE2zMYW3x
        2QNjcmYD3fuWI2Ffu932xMfpvN3Z4fJYv/poO3eW25yyUXMI2dvpqYjaLU5rk1D7B9a+UbVdvSo57
        bxOeN30bj8NWZ86Lk2sR0U476K3jTPfXrKOtm/cK+12Ksd/mhFXDJ2KvHBleEBhwDj5WVN9LZBgb0
        GNn70je2GP0tWxi5YmaAquLEdNM57k1WI/QabBJ5O2uTX97gtcCrp9S6JtD1B1yX67+pAc7zGV08R
        brciOFuw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34982)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oo6Gc-0007Jf-DI; Thu, 27 Oct 2022 18:02:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oo6Gb-0001i6-52; Thu, 27 Oct 2022 18:02:05 +0100
Date:   Thu, 27 Oct 2022 18:02:05 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/2] Add Apple macsmc GPIO support
Message-ID: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This series adds support for the Apple Mac SMC GPIO driver that was
previously posted before the last merge window. I believe all previous
review points have been addressed.

This series is smaller than the previous posting because I'm splitting
this up to allow progress to be made; this driver is dependent on the
Apple SMC driver in order to be buildable and usable. It is expected
that this Apple SMC driver will be merged via Lee's MFD tree. The
Kconfig dependencies this driver from causing build issues until that
driver is also merged, so I believe it is appropriate to send this
separately.

There is no issue if we wish to delay applying this until the core
driver has been accepted by Lee.

The series is made up of two patches - one patch for the bindings,
which now include two compatibles, one specific and one generic. The
second patch adds the actual driver itself.

 .../devicetree/bindings/gpio/gpio-macsmc.yaml      |  28 +++
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-macsmc.c                         | 245 +++++++++++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
 create mode 100644 drivers/gpio/gpio-macsmc.c

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
