Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5697667DA7D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 01:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjA0ANU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 19:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbjA0AMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 19:12:33 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE44073763
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 16:12:12 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5065604854eso38275607b3.16
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 16:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tTvFN9zt+7lH55sPjPnCWAMH3CSMYqAujbIJhWhGHpQ=;
        b=fJbwfbPyLajM8BS9brnvnJPHttuFd4SHDHCbOBlCg/VxAuOvTepr0GZHQM6b84YyRA
         PGZc1my4gZVIxdJD6+WG1ofD+96uUSWoV1kz9Ju1zqCgLOrV3aoO1spiemr3VfD0NSR+
         5gWV+AkxCQfqzAMSlm62EBUFx3WVlWwQ/lyg8G5AKjz7E9l+lPVW+VwiXKzhgoOqLEVg
         e7WijyIAqHKwyCsh9qbehpat436RYGDweSUlBivA6fvPKaCeTPPpCq4q/C+Xd7LjgUB4
         ZPS7LazL527TUMqI1r0GnvyfXb6faxBKg97hTdSLi3rwGCXSYvoE48EislHpAiUHoVSt
         zkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTvFN9zt+7lH55sPjPnCWAMH3CSMYqAujbIJhWhGHpQ=;
        b=lF599MYz/9RGPhMOv5H/+IlY7YKzyCxxXH3UTUg7tVtZ6PhP4UogEkiFreLqPFwPx/
         YIWRF53g3q3/6kr0IDTSLnXHH3RDUJ5i59FIlNPBHoNfa29W4edIonu26UOaVW7alnOS
         vcUexiGVq5AGLmMupnq+2X9gQf3ZtMVrAVSNqu6o7RIPf5DZteUxFF7Slph//6URAi3Y
         7LIAUFT4GeuaCFR/jsOTiKT0PMbYH/eMdA292ee+WuYQFlqZuZVi1PES0VGLiYJwU7Vt
         JHtOLx6yK8zxmMchXGT6AF/oKuHWnujgFxMFVtrlUN+S+bFYdkJChI4jPnN6q/l5aQP5
         D4ow==
X-Gm-Message-State: AFqh2kriS/bVg/kLWfu6G7amKDTOVhwv7mW/NEfxBLyQMBH4h81OXmj7
        nyTV73xLxWhrAB+CkyzFRKREUtfs4larbVg=
X-Google-Smtp-Source: AMrXdXtG7vV8hAqaNOO3XIpSGa1FPirJBe63/y15kC2w6rHGEFHML2nGTZnit7DdBS69wDhESwRkBEUxeDUA7p0=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:c3b4:8b1c:e3ee:3708])
 (user=saravanak job=sendgmr) by 2002:a81:bf41:0:b0:36c:dd56:ce59 with SMTP id
 s1-20020a81bf41000000b0036cdd56ce59mr4682807ywk.321.1674778332239; Thu, 26
 Jan 2023 16:12:12 -0800 (PST)
Date:   Thu, 26 Jan 2023 16:11:38 -0800
In-Reply-To: <20230127001141.407071-1-saravanak@google.com>
Message-Id: <20230127001141.407071-12-saravanak@google.com>
Mime-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v2 11/11] firmware: arm_scmi: Set fwnode for the scmi_device
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

This allows fw_devlink to track and enforce supplier-consumer
dependencies for scmi_device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/firmware/arm_scmi/bus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 35bb70724d44..1d8a6a8d9906 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #include "common.h"
 
@@ -192,6 +193,7 @@ scmi_device_create(struct device_node *np, struct device *parent, int protocol,
 	scmi_dev->protocol_id = protocol;
 	scmi_dev->dev.parent = parent;
 	scmi_dev->dev.of_node = np;
+	scmi_dev->dev.fwnode = of_fwnode_handle(np);
 	scmi_dev->dev.bus = &scmi_bus_type;
 	scmi_dev->dev.release = scmi_device_release;
 	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
-- 
2.39.1.456.gfc5497dd1b-goog

