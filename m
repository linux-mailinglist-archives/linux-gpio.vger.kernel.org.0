Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19E632C792
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355648AbhCDAcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358967AbhCCNUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:20:30 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C3DC06178B
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:19:09 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id t26so16359093pgv.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NBfgEgCHA/tu7wvksJ+Ela7rKLrdKUo7I7MwiFrAmv4=;
        b=UVIOXMDi9J8DJIbTxxVN3T+unZ5PfEZRT6U5wPV5+ZiFI3OpuuAPar8pLixj72ZMS3
         gjt7fZE1bklpTr64mAUhy+vD2moGU/sUPMI3TLCuI43aa/KwKljZ2VEM00u9G2DOBBcY
         FfyHkZVJ0wJYX+RGuqvR/of3FMRSpEJRFOG8XrxhHXN7on36wwYRXJGILgAGsJl9zr7U
         OuVga7NsqZIGqq55jE3Db8DSzwpKyISuZKcMH6jInpPXxnoSaWxcRLRov2r1HXBgQ8rJ
         C9sHia9DsaGsjVtYMbOuDhJm7ov4ZjiYZMaZ81oiz1qlGB40O8YbldSgKDeXr8eoHNvH
         WoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NBfgEgCHA/tu7wvksJ+Ela7rKLrdKUo7I7MwiFrAmv4=;
        b=GXmZPaQeEg6X6cLyEmHX+M5glub1V4HYk3TDIqrplbsYst7ehYZK4On+PJqalKlwTL
         cRsUtC+NUQomS2lnbS4cYsJwre9VMogC0xGiYnedW+Yj1D7BHyT/Erm2z4X9p8AYhkZb
         mySZW2Z9ARyRsXCJAPZm4snDsn0cKeirByUEoYqsG3a3YORhkj0hzXmkC1kL0z6iVNn1
         rHnM1Agg750jO1P8AOOq25dmfzSsDAOdDWgzmwOklKWhgybuDY0Wu2EohgAaiXHE3faU
         WEuLfE6JpqeXy+CeUiOXyCHEbdM4T1ezvFhEATAaTnbazaJ76OHbDpS21tDXMzKIDSz0
         Khow==
X-Gm-Message-State: AOAM532XPUE+/e0BQZhutQe8H2x0KRkP9RUD9nVvrvOAG1ED8BhapGRJ
        Rd7l6QrBuhIVOHGWYFHxA+R9rw==
X-Google-Smtp-Source: ABdhPJyFG64TzDao/klei7BAxQjjNUPxrXhiYxy2Aog+3WrqisIR70Fz4GINTSd+BqMXiBAPMr7+MA==
X-Received: by 2002:a63:eb05:: with SMTP id t5mr22653508pgh.389.1614777549243;
        Wed, 03 Mar 2021 05:19:09 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i25sm22397099pgb.33.2021.03.03.05.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:19:08 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Date:   Wed,  3 Mar 2021 21:18:58 +0800
Message-Id: <20210303131858.3976-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
configs from ACPI table, and call into gpio_chip's .set_config hook for
setting them up.  It enables such support on qcom platform by using
generic config function, which in turn calls into .pin_config_set of
pinconf for setting up hardware.  For qcom platform, it's possible to
reuse pin group config functions for pin config hooks, because every pin
is maintained as a single group.

This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
pin is not set up by the kernel.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v2:
- Add pin config functions that simply call into group config ones.

 drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index af6ed7f43058..a59bb4cbd97e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -489,10 +489,24 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int msm_config_pin_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			      unsigned long *config)
+{
+	return msm_config_group_get(pctldev, pin, config);
+}
+
+static int msm_config_pin_set(struct pinctrl_dev *pctldev, unsigned pin,
+			      unsigned long *configs, unsigned num_configs)
+{
+	return msm_config_group_set(pctldev, pin, configs, num_configs);
+}
+
 static const struct pinconf_ops msm_pinconf_ops = {
 	.is_generic		= true,
 	.pin_config_group_get	= msm_config_group_get,
 	.pin_config_group_set	= msm_config_group_set,
+	.pin_config_get		= msm_config_pin_get,
+	.pin_config_set		= msm_config_pin_set,
 };
 
 static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -717,6 +731,7 @@ static const struct gpio_chip msm_gpio_template = {
 	.get_direction    = msm_gpio_get_direction,
 	.get              = msm_gpio_get,
 	.set              = msm_gpio_set,
+	.set_config       = gpiochip_generic_config,
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,
-- 
2.17.1

