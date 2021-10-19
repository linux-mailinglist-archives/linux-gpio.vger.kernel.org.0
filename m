Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08203433FA4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 22:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhJSUMI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 16:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhJSUMI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 16:12:08 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB971C06161C;
        Tue, 19 Oct 2021 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rBxQ4DfYbECACCOQnpolaJo1nto7DwdD3s0cBNrWDV4=; b=zpfwALp1y+ZKJsUF8bFHPpBHXm
        rrCju60NLqJgRH7xgg1LyGbqgeM33ppDtMlgz03x6/CrBeeTeAaThzXKr2p2Sd5JFeR2O1q3IoMza
        j3lunUhN81O8+nn/rS8cnrGQggIpH4LlonEWmMbCZTiJ3TGyrdbowZW+wVyQYk1RusQyRccrS6kPU
        NxAivxRggxUK3/e2JAqD/OU9ks+VXFH0a9FTpOmZ7tiz81Bu7GpG7gGDoRTmr19Yj4uUSqsN5jDv8
        oCZDbu5p3elMwWH+51k4VXwcEgpNPjAJDozlo8DnZGAhUKeDfSlVVGAfV8ta8Ul7Qr/OfVzzis90L
        et5e0RRQ==;
Received: from 153-106-191-90.dyn.estpak.ee ([90.191.106.153]:63063 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mcvQf-0002xN-LU; Tue, 19 Oct 2021 23:09:47 +0300
Received: by localdomain (sSMTP sendmail emulation); Tue, 19 Oct 2021 23:09:43 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Tue, 19 Oct 2021 23:08:29 +0300
Message-Id: <20211019200831.3817-1-maukka@ext.kapsi.fi>
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
        TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH v7 0/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for you prompt feedback Andy. Here are the highlights on this round:
 - no changes in the bindings file.
 - added better help text in Kconfig
 - refactored the return code handling for claiming upstream gpio line
 - refactored the return and exit at the end of the function
 
Thanks,
Mauri

rangediff v6 -> v7:
1:  1283751fadd4 = 1:  434637e7188e dt-bindings: gpio-cascade: add documentation
2:  46541776733a ! 2:  a72e186f8e3b gpio: gpio-cascade: add generic GPIO cascade
    @@ Commit message
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
         ---
    +    v6 -> v7:
    +     - In Kconfig add info about module name
    +     - adhere to new convention that allows lines longer than 80 chars
    +     - use dev_probe_err with upstream gpio line too
    +     - refactor for cleaner exit of probe function.
         v5 -> v6:
          - In Kconfig, remove dependency to OF_GPIO and select only MULTIPLEXER
          - refactor code preferring one-liners
    @@ drivers/gpio/Kconfig: config GPIO_VIRTIO
     +	  This allows building one-to-many cascades of GPIO lines using
     +	  different types of multiplexers readily available. At the
     +	  moment only input lines are supported.
    ++
    ++	  To build the driver as a module choose 'm' and the resulting module
    ++	  will be called 'gpio-cascade'.
     +
      endif
     
    @@ drivers/gpio/gpio-cascade.c (new)
     + */
     +
     +#include <linux/module.h>
    -+#include <linux/gpio/consumer.h>
    -+#include <linux/gpio/driver.h>
     +#include <linux/slab.h>
     +#include <linux/platform_device.h>
     +#include <linux/mux/consumer.h>
     +
    ++#include <linux/gpio/consumer.h>
    ++#include <linux/gpio/driver.h>
    ++
     +struct gpio_cascade {
     +	struct device		*parent;
     +	struct gpio_chip	gpio_chip;
    @@ drivers/gpio/gpio-cascade.c (new)
     +	struct mux_control *mc;
     +	struct gpio_desc *upstream;
     +	struct gpio_chip *gc;
    -+	int err;
     +
     +	cas = devm_kzalloc(dev, sizeof(*cas), GFP_KERNEL);
     +	if (!cas)
    @@ drivers/gpio/gpio-cascade.c (new)
     +
     +	mc = devm_mux_control_get(dev, NULL);
     +	if (IS_ERR(mc))
    -+		return dev_err_probe(dev,
    -+				     PTR_ERR(mc),
    -+				     "unable to get mux-control\n");
    ++		return dev_err_probe(dev, PTR_ERR(mc), "unable to get mux-control\n");
     +
     +	cas->mux_control = mc;
     +	upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
    -+	if (IS_ERR(upstream)) {
    -+		dev_err(dev, "unable to claim upstream GPIO line\n");
    -+		return -ENODEV;
    -+	}
    ++	if (IS_ERR(upstream))
    ++		return dev_err_probe(dev, PTR_ERR(upstream), "unable to claim upstream GPIO line\n");
     +
     +	cas->upstream_line = upstream;
     +	cas->parent = dev;
    @@ drivers/gpio/gpio-cascade.c (new)
     +	gc = &cas->gpio_chip;
     +	gc->get = gpio_cascade_get_value;
     +	gc->get_direction = gpio_cascade_get_direction;
    -+
     +	gc->base = -1;
     +	gc->ngpio = mux_control_states(mc);
     +	gc->label = dev_name(cas->parent);
     +	gc->parent = cas->parent;
     +	gc->owner = THIS_MODULE;
     +
    -+	err = devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
    -+	if (err) {
    -+		dev_err(dev, "unable to add gpio chip\n");
    -+		return err;
    -+	}
    -+
     +	platform_set_drvdata(pdev, cas);
    -+	return 0;
    ++	return devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
     +}
     +
     +static const struct of_device_id gpio_cascade_id[] = {

Mauri Sandberg (2):
  dt-bindings: gpio-cascade: add documentation
  gpio: gpio-cascade: add generic GPIO cascade

 .../bindings/gpio/gpio-cascade.yaml           | 103 +++++++++++++++
 drivers/gpio/Kconfig                          |  15 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-cascade.c                   | 118 ++++++++++++++++++
 4 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
 create mode 100644 drivers/gpio/gpio-cascade.c


base-commit: f4a20dfac88c06c9b529a41ff4cf9acba8f3fdff
-- 
2.25.1

