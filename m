Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C781968CC10
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 02:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjBGBma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 20:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjBGBm1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 20:42:27 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C0935260
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 17:42:20 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id a17-20020a256611000000b00889c54916f2so5857612ybc.14
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2023 17:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJLrTZtGB/wtRgZ8auzL1/mCtthfh1jmvZ+jyYODrHo=;
        b=KxHeBd9/qrt/W/MW4sUpZIYo6+yTTh5TEOdC00+aZnQdBS23CNq8lQ/3ly9Ie7C0jx
         AjoC98Qjw2BjtA+6HokTZ2K8U6tXQihfm5h+hLPeDCF4PTWsWCDJ/JKmZiN9nTWt8Shh
         Ps3mn6yubOQoZo/oaLlFALgQc/euTcI9CK8eH/0m+jNzUowjJcD18GLh/uIuCpLexd7Z
         orKSAUPqQwHVZJ9xvZl95RcQbB5RMKJL/RxwOhlVemuGVd3JmPzazJDUpXkyWRMFu6XQ
         tonVupUP0/OJgnHzIKGNW5KmQA8ou+8EsSVWRj8S2uoKjGzS2cH4h7TZD39JXwkbCIxy
         BAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJLrTZtGB/wtRgZ8auzL1/mCtthfh1jmvZ+jyYODrHo=;
        b=QPGax0VytcbZkcaJJDHu3X/Am0XkyBAuBX6UM900tNKoRL8gJZiWP3L5DKTYpPgLwD
         mEl+AAGeuuxXM+/LC2nyVg6BHGsaW+k8gIX03qKiYOZK3lJgIl2kTxQQFcmcf89eRAzw
         S4L7PA+NJOAZgo/DmhNWu2OwqZKdMrBMz5AFi8qgm9t0/0lrp0awPZP98/37GQfwoFMy
         jd75ChH8UaAxpJR+Y4AtRX3/CkSyEFICqs8bV8LwzYRv8JMxmAFm48kJhGJZrjlVC6IZ
         /eGIubenpC02E+VofkMKoh7IdDqgYavwYHOykiLXSunG21VtXacaI/O6FA/KArgJswCC
         BqgQ==
X-Gm-Message-State: AO0yUKWxWHb+J0ZlNRl6VjVMMflo3DTCbR8PNNvI9dk2cdQZXcKM6PTL
        WU8viymBVWj0FDWzxEczTWwSS0bGJN9Jciw=
X-Google-Smtp-Source: AK7set9IZk0AFyhStprHcWsDyLohlpZMk4+IUUW+9YYC1cuPIrl5oy+DIc0aaHggVeZTHlKuTRQOg8YA5KQoVnA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ae1:aba6:f21c:4a94])
 (user=saravanak job=sendgmr) by 2002:a25:d2cc:0:b0:855:fdcb:4465 with SMTP id
 j195-20020a25d2cc000000b00855fdcb4465mr31ybg.6.1675734138499; Mon, 06 Feb
 2023 17:42:18 -0800 (PST)
Date:   Mon,  6 Feb 2023 17:41:55 -0800
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
Message-Id: <20230207014207.1678715-4-saravanak@google.com>
Mime-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Subject: [PATCH v3 03/12] soc: renesas: Move away from using OF_POPULATED for fw_devlink
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
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        "=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?=" <rafal@milecki.pl>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The OF_POPULATED flag was set to let fw_devlink know that the device
tree node will not have a struct device created for it. This information
is used by fw_devlink to avoid deferring the probe of consumers of this
device tree node.

Let's use fwnode_dev_initialized() instead because it achieves the same
effect without using OF specific flags. This allows more generic code to
be written in driver core.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index b0a80de34c98..eed47696e825 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -437,7 +437,7 @@ static int __init rcar_sysc_pd_init(void)
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
 	if (!error)
-		of_node_set_flag(np, OF_POPULATED);
+		fwnode_dev_initialized(of_fwnode_handle(np), true);
 
 out_put:
 	of_node_put(np);
-- 
2.39.1.519.gcb327c4b5f-goog

