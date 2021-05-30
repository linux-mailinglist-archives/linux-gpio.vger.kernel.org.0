Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F94395214
	for <lists+linux-gpio@lfdr.de>; Sun, 30 May 2021 18:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhE3Qvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 May 2021 12:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhE3Qvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 May 2021 12:51:45 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A81C061574;
        Sun, 30 May 2021 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VKO4ovngf+sWSmcrnz3MEUgc27yXWFhNYyo4X/LTgik=; b=zPFBXpOQy9g9b2PNHUBzRKcBBx
        MOS1X5ZT2WSbWB1ARQO1NKMAyJ98y2AMa+6SkQNjuz2SfRG+qU79v5uA/qGW8RW3W0Z/xOuShfx/K
        hvu+m6EGPSJGCDW8KxBK93JI9u4Tc+e3fRQ/fWVdm51zbD++eT++hYnSv1FOnXc+qQFFROPhORhIg
        vqVdACuWipJXqomPi3gX8TJO/ZgGt7T52Qj0y+LbUWqTyD+gJMiKyzuqD4ExbRqUSVtERd8RUIR22
        NnGh3+r1Gg5Yn+ekbRoZXbvwjrATdt4JEjL0th/BRTLL2DWk2MACf8KLpZDGlM3RR6aS9vIW6SnbD
        EraEVerQ==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:50307 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lnO6D-0001d2-7T; Sun, 30 May 2021 19:15:39 +0300
Received: by localdomain (sSMTP sendmail emulation); Sun, 30 May 2021 19:15:33 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Sun, 30 May 2021 19:13:31 +0300
Message-Id: <20210530161333.3996-1-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v4 0/2] gpio: add generic gpio input multiplexer
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello all!

I changed my email setup because there were serious issues with it
previously and patches were not delivered to people. Hopefully it's working
now. Because of that I am sending updated patches in v4, which consist of
the same functionality as in v3 added with cosmetic changes to Kconfig and
updated author email address.

Drew gave acked and tested-by tags in [1] so I took the liberty to include
them in the patches.

For convenience I am including also rangediff between v3 and v4 below.

Thanks,
Mauri

[1] https://www.spinics.net/lists/linux-gpio/msg61277.html

1:  1ca26bb53ab6 ! 1:  496558967cd8 dt-bindings: gpio-mux-input: add documentation
    @@
      ## Metadata ##
    -Author: Mauri Sandberg <sandberg@mailfence.com>
    +Author: Mauri Sandberg <maukka@ext.kapsi.fi>
     
      ## Commit message ##
         dt-bindings: gpio-mux-input: add documentation
     
         Add documentation for a general GPIO multiplexer.
     
    -    Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
    +    Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    +    Tested-by: Drew Fustini <drew@beagleboard.org>
    +    Reviewed-by: Drew Fustini <drew@beagleboard.org>
         ---
    +    v3 -> v4:
    +     - Changed author email
    +     - Included Tested-by and Reviewed-by from Drew
         v2 -> v3: added a complete example on dual 4-way multiplexer
         v1 -> v2: added a little bit more text in the binding documenation
     
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +title: Generic GPIO input multiplexer
     +
     +maintainers:
    -+  - Mauri Sandberg <sandberg@mailfence.com>
    ++  - Mauri Sandberg <maukka@ext.kapsi.fi>
     +
     +description: |
     +  A generic GPIO based input multiplexer
2:  dcd76ada9d34 ! 2:  782e009ba54b gpio: gpio-mux-input: add generic gpio input multiplexer
    @@
      ## Metadata ##
    -Author: Mauri Sandberg <sandberg@mailfence.com>
    +Author: Mauri Sandberg <maukka@ext.kapsi.fi>
     
      ## Commit message ##
         gpio: gpio-mux-input: add generic gpio input multiplexer
    @@ Commit message
         pin.
     
         Reported-by: kernel test robot <lkp@intel.com>
    -    Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
    +    Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    +    Tested-by: Drew Fustini <drew@beagleboard.org>
    +    Reviewed-by: Drew Fustini <drew@beagleboard.org>
         ---
    +    v3 -> v4:
    +     - Changed author email
    +     - Included Tested-by and Reviewed-by from Drew
         v2 -> v3:
          - use managed device resources
          - update Kconfig description
    @@ drivers/gpio/Kconfig: config GPIO_MOCKUP
     +	help
     +	  Say yes here to enable support for generic GPIO input multiplexer.
     +
    -+  	  This driver uses a mux-controller to drive the multiplexer and has a
    -+  	  single output pin for reading the inputs to the mux. The driver can be
    -+  	  used in situations when GPIO pins are used to select what multiplexer
    -+  	  pin should be used for reading input and the output pin of the
    -+  	  multiplexer is connected to a GPIO input pin.
    ++	  This driver uses a mux-controller to drive the multiplexer and has a
    ++	  single output pin for reading the inputs to the mux. The driver can
    ++	  be used in situations when GPIO pins are used to select what
    ++	  multiplexer pin should be used for reading input and the output pin
    ++	  of the multiplexer is connected to a GPIO input pin.
     +
      endif
     
    @@ drivers/gpio/gpio-mux-input.c (new)
     +/*
     + *  A generic GPIO input multiplexer driver
     + *
    -+ *  Copyright (C) 2021 Mauri Sandberg <sandberg@mailfence.com>
    ++ *  Copyright (C) 2021 Mauri Sandberg <maukka@ext.kapsi.fi>
     + *
     + */
     +
    @@ drivers/gpio/gpio-mux-input.c (new)
     +};
     +module_platform_driver(gpio_mux_input_driver);
     +
    -+MODULE_AUTHOR("Mauri Sandberg <sandberg@mailfence.com>");
    ++MODULE_AUTHOR("Mauri Sandberg <maukka@ext.kapsi.fi>");
     +MODULE_DESCRIPTION("Generic GPIO input multiplexer");
     +MODULE_LICENSE("GPL");

Mauri Sandberg (2):
  dt-bindings: gpio-mux-input: add documentation
  gpio: gpio-mux-input: add generic gpio input multiplexer

 .../bindings/gpio/gpio-mux-input.yaml         |  75 +++++++++++
 drivers/gpio/Kconfig                          |  16 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-mux-input.c                 | 124 ++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
 create mode 100644 drivers/gpio/gpio-mux-input.c


base-commit: c354c29524eeabba63da51f30a09b85ec9dc853a
-- 
2.25.1

