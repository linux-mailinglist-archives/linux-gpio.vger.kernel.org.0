Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3E4534B62
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 10:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346670AbiEZIQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 04:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346642AbiEZIQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 04:16:09 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E506B8BC2
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 01:16:00 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fb7bf98f1aso7586197b3.5
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dlvkAQYsuGB8Wv9lxWmQ5ia/pAj0723lrMJL/F7FmGY=;
        b=PY2a/ZfTWLOTKMXKyETU+koM0WgQW4QxqX3sYrgc5F8Fync7J+e5f3GBKiPIqpwgPZ
         SkDAVoB1jl7cjlSJwUihxgqBvVZnvCxi9I4QUaG5WqMu1pOMKtmDRTxpQFAeblPdDleX
         mxDvzcfuqk3TE1tsWfuNrUDu6y3Z2uQsLnSOUjywddi7iE0G0uqUtlpP3c2Gm0KnZoNS
         dnyI/ZOgNUHpkp0mB2EIPEiSrxIsj2RY5G5poVzBbXn9Rg97rrWC6Adibg/wQrj3n2xT
         kI+LY0Yk8J7Hl0wWscTOZw/YR4+r0mDtAk/VmmToHBZWaKhAHd+W02rgl8RuAea8avYR
         u8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dlvkAQYsuGB8Wv9lxWmQ5ia/pAj0723lrMJL/F7FmGY=;
        b=zn80+7ppbVFPcN6fUK1t33jkcCPa1maNpwWOI7OG2ooYRZ0HS1rJkno5KvVHyu4QmN
         6BsghWyqeRvDQyZ/6tW2196jSs8zSS16nuJSRtFb1RhJY8BGtikFu1brZePj/NT0Ftiu
         tygVR8NpLZcFwFYNWkEDO5NGj25t+tar6oQ7EKX1/USJbxGoaphIu3LYKZPeE8He1dJL
         0wr79kd493cG46WqIEdhYUa9zz3EUzKEv4ILSdRZMU19C80In7SM1FZXb9juxOIcb6Px
         WDOfV+J1g/xfk0GmZr9qsw6nGyrC4EAxglcDYAwq0ithqIjSt/UASKwDfKMmpW8shtFF
         AcHg==
X-Gm-Message-State: AOAM5312M0t+RfQqp28iDRWIzQ8Zw7nD1NEfazmhssk4vmO3/cxZnuNl
        qcHcsimmdui/4ppLwp6sZdHzqzd3MNsZCDY=
X-Google-Smtp-Source: ABdhPJxNRFl0/Al5aF4+hw2juEzzxnRNoJ08VAGxc9iz3rkpIotBWNb9jqq9kR5GKz6VAnObadTZe+xq9PgYyao=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ff1f:a3b7:b6de:d30f])
 (user=saravanak job=sendgmr) by 2002:a81:4757:0:b0:2ff:d34d:4d59 with SMTP id
 u84-20020a814757000000b002ffd34d4d59mr20437021ywa.511.1653552959732; Thu, 26
 May 2022 01:15:59 -0700 (PDT)
Date:   Thu, 26 May 2022 01:15:41 -0700
In-Reply-To: <20220526081550.1089805-1-saravanak@google.com>
Message-Id: <20220526081550.1089805-3-saravanak@google.com>
Mime-Version: 1.0
References: <20220526081550.1089805-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [RFC PATCH v1 2/9] pinctrl: devicetree: Delete usage of driver_deferred_probe_check_state()
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        John Stultz <jstultz@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that fw_devlink=on by default and fw_devlink supports
"pinctrl-[0-8]" property, the execution will never get to the point
where driver_deferred_probe_check_state() is called before the supplier
has probed successfully or before deferred probe timeout has expired.

So, delete the call and replace it with -ENODEV.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/pinctrl/devicetree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 3fb238714718..ef898ee8ca6b 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -129,7 +129,7 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		np_pctldev = of_get_next_parent(np_pctldev);
 		if (!np_pctldev || of_node_is_root(np_pctldev)) {
 			of_node_put(np_pctldev);
-			ret = driver_deferred_probe_check_state(p->dev);
+			ret = -ENODEV;
 			/* keep deferring if modules are enabled */
 			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
 				ret = -EPROBE_DEFER;
-- 
2.36.1.124.g0e6072fb45-goog

