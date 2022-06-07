Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625CA539DD2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 09:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350127AbiFAHHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 03:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350129AbiFAHHl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 03:07:41 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4AC8CCEE
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 00:07:32 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id u22-20020a170902a61600b0016363cdfe84so666211plq.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 00:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OkJpVuwUYhbhpu72ndfOfRLuS01Uvu7J1G58GhOqBxA=;
        b=kaB7C37gink8Qqvn0pctcjGVSWc9j4P8uk4v0K5AISpFKd+hvgB21RJZ41FYYZ2nfP
         UmDUvnh6V+KzZKv5WfvINI9HLMdh7n8ba4XuzBpJy5rHK6bp1b1kDpTMg0ATRjp6Lwj2
         oUK95Il9GYfC6gvX6T78R/PvRyeHepeWwdbNNm5Sr2T0TFGbeSJTp2JBkr1gp4mduXVA
         lkarklZizZ86HZBwymU9R99XtDoe9UgMCyo+4bRGBaY/9hFYylTp4hF/BbGcx22jCbiY
         nO8hfl2g+kKIMmRXfosATkgzY9XsxdnlNlEw7i2848Bd9uWVHMGW1ZotBwpbu0+owPb3
         dOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OkJpVuwUYhbhpu72ndfOfRLuS01Uvu7J1G58GhOqBxA=;
        b=aLg0qj/dUfcjOM9w52LxXT1R5mGi+1/3JtU7MbLWYfocDHhtSAks9+qhPGsUmkxUIx
         OJU1DGT8cgrlKOTZRgJHn4eUh7gJyVZbOIEE5PgSohL5MwXxu1rXmYwve/mWswrcmG3j
         0YVxeoFcyu9Go8EibLcc5h3rISb50s+yyzMNkUxyjbzN5ED4J6JkhYv5TRAYcdMwQvMi
         4MEUCPZdKNRwbrYFXDswJysv1YdqXEQ9THk978z7PEXWYhPTeJtET1YpZ+/Mejd047yq
         OLKTJllzz4eoHh4X4J8XZgWQdPY6bnKPkUyuAxuZwcv47DfTnhzGHJ8qA6Vgi/swvEHb
         3Jcg==
X-Gm-Message-State: AOAM532hyNBAP0o9b+mxcj2hjTL7LXxXly6p7TTxvfbLnJWVToeOl3wJ
        3Khm+6mk7egY3vylOkfXaMpO4I25W7ie0GM=
X-Google-Smtp-Source: ABdhPJztwlN85cyj2vBepMijcpN5dd/hOJ41SzfRJZ6qCQvnaOveLbdas5N5VokZNsF3pp0hEJdTKPs546XcksM=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a17:90b:3c4e:b0:1e3:36c8:8496 with SMTP
 id pm14-20020a17090b3c4e00b001e336c88496mr7944623pjb.82.1654067252323; Wed,
 01 Jun 2022 00:07:32 -0700 (PDT)
Date:   Wed,  1 Jun 2022 00:07:03 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-8-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 7/9] driver core: Set fw_devlink.strict=1 by default
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
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org
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

Now that deferred_probe_timeout is non-zero by default, fw_devlink will
never permanently block the probing of devices. It'll try its best to
probe the devices in the right order and then finally let devices probe
even if their suppliers don't have any drivers.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 61fdfe99b348..977b379a495b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1613,7 +1613,7 @@ static int __init fw_devlink_setup(char *arg)
 }
 early_param("fw_devlink", fw_devlink_setup);
 
-static bool fw_devlink_strict;
+static bool fw_devlink_strict = true;
 static int __init fw_devlink_strict_setup(char *arg)
 {
 	return strtobool(arg, &fw_devlink_strict);
-- 
2.36.1.255.ge46751e96f-goog

