Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0958C193E9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 23:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfEIVBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 17:01:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45983 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfEIVBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 17:01:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id i21so1801148pgi.12;
        Thu, 09 May 2019 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rji3Tsx4QdgFefM8jscUiPkqR6jrOJsimIgfbLEWBM8=;
        b=qI6ufmv32wwIJe/P5xoB6V2LwPg2k0uATPOsgYvQ/FktxohPd6qokjj0qp9drwdjwg
         7CY8GzyGig23rFHllc8aINFtiVD/Z3RRCWKgqgzBaQwIVpnVOcJ3xUci/n/LZjr7OXwG
         riavwMw5bWNSE5/ZuR04jHA757v7RbyirigrVoJ7wYr8QcdVHk/eEsjQYPoJ8GUuJd9+
         oHL8ssMVpWeCHfz3VGUl5BBg/muHwDEkERYzioFgnWXKLKWMfQKrEwjj6HZPzP/ggSpO
         +9duQoHcTE00N9LzP1sG02BuG7Rp9uYVSUvQrF++uqpsGhn5OuBfNbvRUHDDCJPh7jqx
         3hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rji3Tsx4QdgFefM8jscUiPkqR6jrOJsimIgfbLEWBM8=;
        b=gENNiBPr4gGHvFIYiSFHbPcR+NRM0ImmsjpwRkfaGyT2v79byj11Dkc5Cbhp+4onIS
         dAQ7ozgI1oDFqJF5uwAoFApY59tF9JLGWglJtnWj+hZ5ESw6K4T2yunA279yDyr38KGx
         aMTxdOacbITgdOemcSK9mPu5Pqv90fr3fBjQ8R5u80jddterKrFubd1fw+RCcV9AQvJh
         hbw2jYOeoiVsYVhztIIXoNQ2E+sJ5xv2j1DvJQUX3t1JyVFY7pKdU/h+dx8mgJkwXGLZ
         TqaHcexVC056Ep78ZB143Kttfpy3iwobyqwUlfU5WRcOxCKw1C8KhVEiEWLN33FqriT4
         2+VA==
X-Gm-Message-State: APjAAAX+At175aIEBYhRt0p/SiHaSIN4b4ZQqQAv254aB8+Af3p7kXcQ
        DdviQP09YL+xCDjPJl9wg7E=
X-Google-Smtp-Source: APXvYqxGsWxzMY/zvlEJjq4i52EZgy9WmOXV9oY/+hUqUu+ZAT9UlzzCIOeZHOjiUYsD90CSHX8NQQ==
X-Received: by 2002:a65:554d:: with SMTP id t13mr8487941pgr.171.1557435680626;
        Thu, 09 May 2019 14:01:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id d15sm10989209pfm.186.2019.05.09.14.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:01:19 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible
Date:   Thu,  9 May 2019 13:59:53 -0700
Message-Id: <20190509205955.27842-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BCM7211 has a slightly different block layout and some additional GPIO
registers that were added, document the compatible string.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index 3fac0a061bcc..ac6d614d74e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -5,6 +5,9 @@ controller, and pinmux/control device.
 
 Required properties:
 - compatible: "brcm,bcm2835-gpio"
+- compatible: should be one of:
+  "brcm,bcm2835-gpio" - BCM2835 compatible pinctrl
+  "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
 - reg: Should contain the physical address of the GPIO module's registers.
 - gpio-controller: Marks the device node as a GPIO controller.
 - #gpio-cells : Should be two. The first cell is the pin number and the
-- 
2.17.1

