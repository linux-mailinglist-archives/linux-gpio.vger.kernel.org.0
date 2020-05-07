Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A801C8870
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 13:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGLgi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 07:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgEGLgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 07:36:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55595C05BD0D
        for <linux-gpio@vger.kernel.org>; Thu,  7 May 2020 04:36:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by albert.telenet-ops.be with bizsmtp
        id bncT2200T3ZRV0X06ncTEj; Thu, 07 May 2020 13:36:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWepH-0007DT-Kf; Thu, 07 May 2020 13:36:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWepH-0006GI-JO; Thu, 07 May 2020 13:36:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] lightning mountain: Add architecture dependency
Date:   Thu,  7 May 2020 13:36:24 +0200
Message-Id: <20200507113626.24026-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

The Intel Equilibrium pin controller and eMMC PHY are only present on Intel
Lightning Mountain SoCs.  This series adds architecture dependencies to the
corresponding config symbols, to avoid asking the user about them when
configuring a kernel for a non-x86 architecture.
    
All patches in this series are independent.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: equilibrium: Add architecture dependency
  phy: intel-lgm-emmc: Add architecture dependency

 drivers/phy/intel/Kconfig | 1 +
 drivers/pinctrl/Kconfig   | 1 +
 2 files changed, 2 insertions(+)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
