Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4E067DA53
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 01:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbjA0AMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 19:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjA0AMG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 19:12:06 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCAC73773
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 16:11:55 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id x188-20020a2531c5000000b00716de19d76bso3641422ybx.19
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 16:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wk3RaaqmAR62xLzDJ8Op60QCb979gBwvyZtjh+d8pms=;
        b=Q2WFaB7HYPP68nmqPlJI4keXjbD/pxb6UPjlJ8lmwGED9ncdbg/OOGQt3MiKCZP2Se
         pQjE7iI6ApMscrR1Mf29VPBby3sWZscrPNEnlYUmDen5aUnSIjTAXmvbS6ejAILLEOOp
         1r6TLovL8RTk5ZWfuowg7wEgkjdHIsDN1Bu2sF2VBvt33RyqKGfxPldNu8oJ52hPbhVC
         6DBo8ng9PbKm/WLWjEXMhbcU2nRj2LjKm2GXHSqlzhf6rtwuvVDy8x/cG0qhHJgxS7Jc
         cowuYo8/jxFJ7tYE7thJsilYhuGiXJMCWGKpM7wbLP0pSta4P+TDb1HlTUEa248tRezV
         IE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wk3RaaqmAR62xLzDJ8Op60QCb979gBwvyZtjh+d8pms=;
        b=Unp1BxTyspW8ONQE7Q229BWJ8C2e280m626s/nE3CzOqHjTPaHTpjqdoq7W3ItqQ6R
         0LtHSn/vHQ1U17Wrxn1BVT6NEBqVZyjD74CMuYs+oDq94JGMSRVF0E0I63qZBN+RU/4N
         tr2jCl5bmCKsvjp6FcXrfH3jsU2bhzGxzw0vR1QmyNoBHgEhnYMjCeZ3d4QMUn4Do57H
         42L1uU+jn+oda96J4AQ1gbDMD9b7gYWNXYocPPPqQNPDF7nFJwWbhHiJvcMLvW97vaKh
         h4TtagXPA5c3HzR4UPbfwVtZGr73iJSfA3fcRBGLlGg/fmzFTgp3fuawBdD9qjVYdHT1
         6YQA==
X-Gm-Message-State: AFqh2kp0PqN7goo1miXvRXmP4mwov69RyY7EvhF2uG+iDTBFGXLiNjZF
        1dM42MLafQzyqwvbsqqKZgPxK9NdYEKXsvk=
X-Google-Smtp-Source: AMrXdXvFqwfBJStSrsBH/BRCuKDOK4BgaZUbZ3XWfVf/3j+JlaqVoseFVI+hKCCn7zINADWNs0uR+SnRqZJmoR4=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:c3b4:8b1c:e3ee:3708])
 (user=saravanak job=sendgmr) by 2002:a25:c74b:0:b0:801:22cf:f19e with SMTP id
 w72-20020a25c74b000000b0080122cff19emr3250820ybe.256.1674778314763; Thu, 26
 Jan 2023 16:11:54 -0800 (PST)
Date:   Thu, 26 Jan 2023 16:11:31 -0800
In-Reply-To: <20230127001141.407071-1-saravanak@google.com>
Message-Id: <20230127001141.407071-5-saravanak@google.com>
Mime-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v2 04/11] gpiolib: Clear the gpio_device's fwnode initialized
 flag before adding
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Saravana Kannan <saravanak@google.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
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
Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 939c776b9488..b23140c6485f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -578,6 +578,12 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
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
2.39.1.456.gfc5497dd1b-goog

