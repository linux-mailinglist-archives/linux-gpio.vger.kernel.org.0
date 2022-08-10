Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186C958E6EE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Aug 2022 08:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiHJGB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Aug 2022 02:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbiHJGBA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Aug 2022 02:01:00 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D5C15FE8
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 23:00:59 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i194-20020a253bcb000000b00676d86fc5d7so11278487yba.9
        for <linux-gpio@vger.kernel.org>; Tue, 09 Aug 2022 23:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=NqpNj2ocNlieJvtq2Rsc6gGxelmaBpd53cWZI4hRdYA=;
        b=MzzjYm5HiDy/e+AAiaA8O6qiqZTeuWaSmUul6mrOTOGDjmtqabFjSlUNlBvvqWqvOu
         jF8wpL3gD98q8iaJmJbPNXu5Jcq8MaF5znAghQHPSyfDKTPcRmFjFafFYiQiT0r/WTpG
         +pdffSn/lWfXQ2MYHZ1u8WuOaTCyJmQBiBsejjHkXUCYJVGFcgsxP6qjdh6pQLU4RxSh
         MxKKjJC87FeBV3cirBR0UWIGiLTcZlyT5xuhr0DEtPacLRS5oC3vA1APF7Rb9kLp3z3n
         pFISfY34zzCPsGmOLdR3XFq8QeDaH/onImXVvKiUASr7k3HuVan3sxyNgwF3q+8F4/HV
         B+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=NqpNj2ocNlieJvtq2Rsc6gGxelmaBpd53cWZI4hRdYA=;
        b=kUGs7Kztwx8dRLLXtW9tU+WkpJhN5gqPvlp49vL+bESjQdkceQknz2XFAKJCGY5vvn
         wWidGk4KMtkzm/bMvKTcNs3v+hWZhFJ/D49jlJf0EW7Aa3jEs6yLtj568v3f367MkSa5
         BA2ySsDjrxXx9odx06IPhyIIgpxJT3WP8+tINVaReR19SqgthYDNmJ/9RFOf2CcS9c0p
         3D/NrefkB/8tygjlog7JTwz5xVtL/XQUwyvqdNQu16950z95IRZOjUcCA0ix70THkd6H
         bucPs+brOYRAphrKeRCkkvVoiW/W3Xs4x0yzVtau9EPy19LmDc5NdTt2v/thPE3jCPhC
         3thg==
X-Gm-Message-State: ACgBeo2S+9NimFxLAvEVM+pRUIlSQL33P8PJ7QtYdr90shruBSvmO31a
        l7Sb+UM9Zlbj6SWCqRFMXLCfsm8OPuiLKS4=
X-Google-Smtp-Source: AA6agR4iq9bUQootDJRxvaaJGo0ZWuATHd7U0JhEzjkGXqE16C2kiMrkJpaNY9G0SstRjMkM93lN22NFoI50pzI=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:f21:76ca:766f:e0ab])
 (user=saravanak job=sendgmr) by 2002:a25:b9c3:0:b0:668:a418:13c with SMTP id
 y3-20020a25b9c3000000b00668a418013cmr22880523ybj.498.1660111258798; Tue, 09
 Aug 2022 23:00:58 -0700 (PDT)
Date:   Tue,  9 Aug 2022 23:00:33 -0700
In-Reply-To: <20220810060040.321697-1-saravanak@google.com>
Message-Id: <20220810060040.321697-5-saravanak@google.com>
Mime-Version: 1.0
References: <20220810060040.321697-1-saravanak@google.com>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [PATCH v1 4/9] gpiolib: Clear the gpio_device's fwnode initialized
 flag before adding
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Registering an irqdomain sets the flag for the fwnode. But having the
flag set when a device is added is interpreted by fw_devlink to mean the
device has already been initialized and will never probe. This prevents
fw_devlink from creating device links with the gpio_device as a
supplier. So, clear the flag before adding the device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cc9c0a12259e..1d57d6f24632 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -522,6 +522,12 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
 	int ret;
 
+	/*
+	 * If fwnode doesn't belong to another device, it's safe to clear its
+	 * initialized flag.
+	 */
+	if (!gdev->dev.fwnode->dev)
+		fwnode_dev_initialized(gdev->dev.fwnode, false);
 	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
 		return ret;
-- 
2.37.1.559.g78731f0fdb-goog

