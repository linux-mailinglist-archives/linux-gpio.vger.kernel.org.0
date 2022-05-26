Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE57534B81
	for <lists+linux-gpio@lfdr.de>; Thu, 26 May 2022 10:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346693AbiEZIQk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 May 2022 04:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346677AbiEZIQL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 May 2022 04:16:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D48AFB3F
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 01:16:09 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j2-20020a2597c2000000b0064b3e54191aso978552ybo.20
        for <linux-gpio@vger.kernel.org>; Thu, 26 May 2022 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5GHBoFboCsQPgW0xnX8626mjCMc2pUtGqVQ4b897WKc=;
        b=IrILs6/SrbLE4LxEZxNKCm/JFj6eee7zIC+Pzx0k28blExnst8p510N+Mrt6f7Ati/
         fhCLg+kIuoSBGxRzYVVkBrn63L8QzTnZkJYc+jKZnJm5JNaCL1XmmvYBctVPcR+qBS4Q
         4wGC14+pYhcdcXPlJ8KKsOY776WVCqrKd5R2mTvBd9JNSJx0gAZsEcqFNfNjwN61LpwP
         wY12x1+QnyJW06iCpgYiPtLxT3ic3L0/CM/Hl9WavuWnDT7UzG67QuvgYRK2zzxRr467
         x76TkjjCfbOV/OiKelBwG+ZZI+ODSVX9nCHAb3bfLDYI4sagD3QOzDplraPR35J1ch4q
         W9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5GHBoFboCsQPgW0xnX8626mjCMc2pUtGqVQ4b897WKc=;
        b=vt+1mT3WSfW7ffVOtY3+dXQUS9+zudSXlX1NAjwazBAJk5wKi631MqTci1Q6hmd8A1
         016hSLqBBM5sBOqVxQLgRhfzk/fMe1XlLGl8sVfADyq/whtayBSlgxqsT/4UsbVE3CMJ
         h6J73ib1jiwWiCTI+hA8CQhsBuYb07poGi0I0IOkTKXyLWm5THheRJy+LShPsbt3FPso
         HjWWnzeIwWPDogeGXpfaQHLbCWS36ZHPCpaFLNiyVLl6yzxpcuaAAsp9JwBgQRYEGiO0
         vaBIa43Ihtjy017MefTAOAWzJwdAspFHO0BLq1upEJeZ9v+yyVvCxXiMODZJegoOfvVh
         BJxA==
X-Gm-Message-State: AOAM530GXPMDwc92dAEf5SZNHAJ3gYR5ghfzWsHGyuEj7vyA1u4YUhSb
        52Nwt8Y+atGUoi6VW6hagTVp8+XzaLWH9sY=
X-Google-Smtp-Source: ABdhPJwfT06c9prMUark3SgFprxU4855waPyfG4Z17nnwU6nQsbeq/CDsaY7uVT4Uffa6yH95LJ8lA+usCDNGiw=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:ff1f:a3b7:b6de:d30f])
 (user=saravanak job=sendgmr) by 2002:a25:8e08:0:b0:64d:b20e:bf73 with SMTP id
 p8-20020a258e08000000b0064db20ebf73mr34625441ybl.558.1653552968266; Thu, 26
 May 2022 01:16:08 -0700 (PDT)
Date:   Thu, 26 May 2022 01:15:44 -0700
In-Reply-To: <20220526081550.1089805-1-saravanak@google.com>
Message-Id: <20220526081550.1089805-6-saravanak@google.com>
Mime-Version: 1.0
References: <20220526081550.1089805-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [RFC PATCH v1 5/9] driver core: Set fw_devlink.strict=1 by default
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

Now that deferred_probe_timeout is non-zero by default, fw_devlink will
never permanently block the probing of devices. It'll try its best to
probe the devices in the right order and then finally let devices probe
even if their suppliers don't have any drivers.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7cd789c4985d..7672f23231c1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1581,7 +1581,7 @@ static int __init fw_devlink_setup(char *arg)
 }
 early_param("fw_devlink", fw_devlink_setup);
 
-static bool fw_devlink_strict;
+static bool fw_devlink_strict = true;
 static int __init fw_devlink_strict_setup(char *arg)
 {
 	return strtobool(arg, &fw_devlink_strict);
-- 
2.36.1.124.g0e6072fb45-goog

