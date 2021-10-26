Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D236543BA7F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 21:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJZTSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 15:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236806AbhJZTSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 15:18:44 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F192C061570;
        Tue, 26 Oct 2021 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AE0HWeO42eC3rGr6k1wETlWIi3Gki3ZUNsQeXPAbs+o=; b=Q43mgNCMtdK3isSsAdw8+RG8br
        pAvG1GVh7M6Yf1WLVWS21hwRJFbiBFniaJmoF5+NuXEg3Hu3QEMnMMsvF+QowJVhk8AUmZsgpe+D7
        3lfJeKDMfSyZ5ODIcOe9HelCnO9eX7tBCZ0+sacDrE2J7zpPReBKrgbKr0/K2ehIITf5hiUuPnkO7
        Y7zsq0I1wGvP4lKc0RcdMYfpzqtQfUSg5uYHMwbtdHlJVbM9ZDuOHb+9Il7WFqH+Gj5hV97/mngYX
        KxNe6jS3YFFEzTNANoBI3AFaC7Xzqx1Yp3/kmnWuF/+d76gO/7y/+w8hUmC+TFULgLTTHmNgc7jzC
        PMuzi3iw==;
Received: from 153-106-191-90.dyn.estpak.ee ([90.191.106.153]:49198 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mfRvV-0000Mn-5R; Tue, 26 Oct 2021 22:16:06 +0300
Received: by localdomain (sSMTP sendmail emulation); Tue, 26 Oct 2021 22:15:59 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Tue, 26 Oct 2021 22:15:04 +0300
Message-Id: <20211026191506.3099-1-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.106.153
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v8 0/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello everyone!

I am sending what I am hoping to be the final version of the patch set and
having kernel support for my router is one step closer.
I want to thank Drew, Linus, Andy and others for their patient review and
testing work over the different iterations.

The changes in this one compared to v7 are cosmetic consisting of
 - rearrange members of struct gpio_chip
 - fix typoes and one instance of split lines in function declaration
 - added Reviewed-by tags in appropriate commit messages

Thanks,
Mauri

rangediff v7 -> v8:

1:  0fa5e65443fb ! 1:  33008c379a28 dt-bindings: gpio-cascade: add documentation
    @@ Commit message
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
         Reviewed-by: Rob Herring <robh@kernel.org>
    +    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
         ---
    +    v7 -> v8:
    +     - added Reviewed-by tag by Linus
    +    v6 -> v7:
    +     - no changes
         v5 -> v6:
          - added Reviewed-by tag by Rob
         v4 -> v5:
2:  c2237aca3364 ! 2:  fc23ea48ba52 gpio: gpio-cascade: add generic GPIO cascade
    @@ Commit message
         possible to add support for output direction, too.
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    +    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
    +    Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
         ---
    +    v7 -> v8:
    +     - rearrange members in struct gpio_cascade
    +     - cosmetic changes in file header and in one function declaration
    +     - added Reviewed-by tags by Linus and Andy
         v6 -> v7:
          - In Kconfig add info about module name
          - adhere to new convention that allows lines longer than 80 chars
    @@ drivers/gpio/gpio-cascade.c (new)
     + *                | | .
     + *                 \|---- Cascaded GPIO line n
     + *
    -+ * A gpio-mux is being used to select, which cascaded line is being
    ++ * A multiplexer is being used to select, which cascaded line is being
     + * addressed at any given time.
     + *
     + * At the moment only input mode is supported due to lack of means for
     + * testing output functionality. At least theoretically output should be
    -+ * possible with an open drain constructions.
    ++ * possible with open drain constructions.
     + */
     +
     +#include <linux/module.h>
    @@ drivers/gpio/gpio-cascade.c (new)
     +#include <linux/gpio/driver.h>
     +
     +struct gpio_cascade {
    -+	struct device		*parent;
     +	struct gpio_chip	gpio_chip;
    ++	struct device		*parent;
     +	struct mux_control	*mux_control;
     +	struct gpio_desc	*upstream_line;
     +};
    @@ drivers/gpio/gpio-cascade.c (new)
     +	return container_of(gc, struct gpio_cascade, gpio_chip);
     +}
     +
    -+static int gpio_cascade_get_direction(struct gpio_chip *gc,
    -+					unsigned int offset)
    ++static int gpio_cascade_get_direction(struct gpio_chip *gc, unsigned int offset)
     +{
     +	return GPIO_LINE_DIRECTION_IN;
     +}

Mauri Sandberg (2):
  dt-bindings: gpio-cascade: add documentation
  gpio: gpio-cascade: add generic GPIO cascade

 .../bindings/gpio/gpio-cascade.yaml           | 103 +++++++++++++++
 drivers/gpio/Kconfig                          |  15 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-cascade.c                   | 117 ++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
 create mode 100644 drivers/gpio/gpio-cascade.c


base-commit: f4a20dfac88c06c9b529a41ff4cf9acba8f3fdff
-- 
2.25.1

