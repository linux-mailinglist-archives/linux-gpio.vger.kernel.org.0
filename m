Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2272A433688
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbhJSNC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 09:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhJSNC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 09:02:58 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CF3C06161C;
        Tue, 19 Oct 2021 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FKYyukUjYQcoakf1FClyDjpoueWSopxNcHu8tfk/XOM=; b=InAIHn7I3VH09l8zIndRLCpwpo
        6tBT7O8YzqjFhwiESdbFTczfW688QWBXEg98wybq0tGFZMsu+rDQAu+/iqSa+jS86UoZPVhYHzvU4
        s7hx1iY9zIg0Q26G8xsXfVtMcMaj19nKSi/nB9SLEK5088bT5xHn8LbKTB78f3Q7og9R8w3IW6YXR
        /OZiiE0qHGqw+H0uP4Pto5D6ki2snGG4CMK+fDwRlBc7LIsXypDJv/77Z3KgZzT9njtX63EAnqWCH
        MPvWFLhJVzOmrpTdu+jmkxmizAssvK4NQgegdcHTrUFqHaMNV9RkyQ8pJXOBPDIknJKb9/qFwwYHb
        Sejmsf9A==;
Received: from 153-106-191-90.dyn.estpak.ee ([90.191.106.153]:56952 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mcojM-0001sg-2X; Tue, 19 Oct 2021 16:00:37 +0300
Received: by localdomain (sSMTP sendmail emulation); Tue, 19 Oct 2021 16:00:35 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Tue, 19 Oct 2021 15:57:29 +0300
Message-Id: <20211019125731.4327-1-maukka@ext.kapsi.fi>
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
Subject: [PATCH v6 0/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello all,

It's been a while and here comes the sixth version of the patches.

What was done:
 - adjust module dependecies and what it selects in Kconfig
 - use managed device resource call when adding gpio chip
 - remove redundant code
 - cosmetic changes

Thanks,
Mauri

rangediff v5 -> v6:
1:  a1bb23f56378 ! 1:  87348f391671 dt-bindings: gpio-cascade: add documentation
    @@ Commit message
         the cascaded line.
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    +    Reviewed-by: Rob Herring <robh@kernel.org>
         ---
    +    v5 -> v6:
    +     - added Reviewed-by tag by Rob
         v4 -> v5:
          - renamed gpio-mux-input -> gpio-cascade
          - changed vague term 'pin' to 'upstream line'
2:  e0be9df088a9 ! 2:  a8e608181bc7 gpio: gpio-cascade: add generic GPIO cascade
    @@ Metadata
      ## Commit message ##
         gpio: gpio-cascade: add generic GPIO cascade
     
    -    Adds support for a building cascades of GPIO lines. That is, it allows
    +    Adds support for building cascades of GPIO lines. That is, it allows
         setups when there is one upstream line and multiple cascaded lines, out
         of which one can be chosen at a time. The status of the upstream line
    -    can be conveyd to the selected cascaded line or, vice versa, the status
    +    can be conveyed to the selected cascaded line or, vice versa, the status
         of the cascaded line can be conveyed to the upstream line.
     
    -    A gpio-mux is being used to select, which cascaded GPIO line is being
    +    A multiplexer is being used to select, which cascaded GPIO line is being
         used at any given time.
     
         At the moment only input direction is supported. In future it should be
    @@ Commit message
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
         ---
    +    v5 -> v6:
    +     - In Kconfig, remove dependency to OF_GPIO and select only MULTIPLEXER
    +     - refactor code preferring one-liners
    +     - clean up prints, removing them from success-path.
    +     - don't explicitly set gpio_chip.of_node as it's done in the GPIO library
    +     - use devm_gpiochip_add_data instead of gpiochip_add
         v4 -> v5:
          - renamed gpio-mux-input -> gpio-cascade. refactored code accordingly
            here and there and changed to use new bindings and compatible string
    @@ drivers/gpio/Kconfig: config GPIO_VIRTIO
     +
     +config GPIO_CASCADE
     +	tristate "General GPIO cascade"
    -+	depends on OF_GPIO
     +	select MULTIPLEXER
    -+	select MUX_GPIO
     +	help
     +	  Say yes here to enable support for generic GPIO cascade.
     +
    @@ drivers/gpio/gpio-cascade.c (new)
     +
     +static int gpio_cascade_get_value(struct gpio_chip *gc, unsigned int offset)
     +{
    -+	struct gpio_cascade *cas;
    ++	struct gpio_cascade *cas = chip_to_cascade(gc);
     +	int ret;
     +
    -+	cas = chip_to_cascade(gc);
     +	ret = mux_control_select(cas->mux_control, offset);
     +	if (ret)
     +		return ret;
    @@ drivers/gpio/gpio-cascade.c (new)
     +
     +static int gpio_cascade_probe(struct platform_device *pdev)
     +{
    -+	struct device_node *np = pdev->dev.of_node;
     +	struct device *dev = &pdev->dev;
     +	struct gpio_cascade *cas;
     +	struct mux_control *mc;
    @@ drivers/gpio/gpio-cascade.c (new)
     +	struct gpio_chip *gc;
     +	int err;
     +
    -+	cas = devm_kzalloc(dev, sizeof(struct gpio_cascade), GFP_KERNEL);
    -+	if (cas == NULL)
    ++	cas = devm_kzalloc(dev, sizeof(*cas), GFP_KERNEL);
    ++	if (!cas)
     +		return -ENOMEM;
     +
     +	mc = devm_mux_control_get(dev, NULL);
    -+	if (IS_ERR(mc)) {
    -+		err = (int) PTR_ERR(mc);
    -+		if (err != -EPROBE_DEFER)
    -+			dev_err(dev, "unable to get mux-control: %d\n", err);
    -+		return err;
    -+	}
    ++	if (IS_ERR(mc))
    ++		return dev_err_probe(dev,
    ++				     PTR_ERR(mc),
    ++				     "unable to get mux-control\n");
     +
     +	cas->mux_control = mc;
     +	upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
     +	if (IS_ERR(upstream)) {
    -+		err = (int) PTR_ERR(upstream);
    -+		dev_err(dev, "unable to claim upstream GPIO line: %d\n", err);
    -+		return err;
    ++		dev_err(dev, "unable to claim upstream GPIO line\n");
    ++		return -ENODEV;
     +	}
     +
     +	cas->upstream_line = upstream;
    @@ drivers/gpio/gpio-cascade.c (new)
     +	gc->label = dev_name(cas->parent);
     +	gc->parent = cas->parent;
     +	gc->owner = THIS_MODULE;
    -+	gc->of_node = np;
     +
    -+	err = gpiochip_add(&cas->gpio_chip);
    ++	err = devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
     +	if (err) {
    -+		dev_err(dev, "unable to add gpio chip, err=%d\n", err);
    ++		dev_err(dev, "unable to add gpio chip\n");
     +		return err;
     +	}
     +
     +	platform_set_drvdata(pdev, cas);
    -+	dev_info(dev, "registered %u cascaded GPIO lines\n", gc->ngpio);
     +	return 0;
     +}
     +
     +static const struct of_device_id gpio_cascade_id[] = {
    -+	{
    -+		.compatible = "gpio-cascade",
    -+		.data = NULL,
    -+	},
    ++	{ .compatible = "gpio-cascade" },
     +	{ /* sentinel */ }
     +};
     +MODULE_DEVICE_TABLE(of, gpio_cascade_id);

Mauri Sandberg (2):
  dt-bindings: gpio-cascade: add documentation
  gpio: gpio-cascade: add generic GPIO cascade

 .../bindings/gpio/gpio-cascade.yaml           | 103 ++++++++++++++
 drivers/gpio/Kconfig                          |  12 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-cascade.c                   | 129 ++++++++++++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
 create mode 100644 drivers/gpio/gpio-cascade.c


base-commit: f4a20dfac88c06c9b529a41ff4cf9acba8f3fdff
-- 
2.25.1

