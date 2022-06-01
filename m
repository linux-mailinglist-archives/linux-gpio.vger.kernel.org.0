Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D35539DB0
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 09:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343607AbiFAHHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 03:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343531AbiFAHHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 03:07:16 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD62BC32
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 00:07:15 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-30041bd304bso8238547b3.18
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Eq6nH6aGeuKpMU9nM7ibONmheABIDjQM7t9UjsNcl+w=;
        b=dvfs6aw0o9enYr6q5JvsoITL1cIodQJtPwQKFVNV/ElWQiITwvlgBGIYVXYubJ0EWb
         hQZknjUn8hWhfVG63Q26ahXT/ybuECTh3IQ0hlFzpMrRfffJaSxehOVATgqcGdOl5B63
         UAGusDHfZ1+bZx3UPXTCMA74yfTvat1qBDbQNIwN2gBcEL0s2lgJJxBkvLKW4seHwHfy
         yy/kVDyKrdiePicpV782RiPioPYMYI6dNrIPSqSRQjnVUQlBHfFoZNPq2vXgAhQA5tJ2
         qPRfgtRDz89n2glwq1xvIPHXD3I9kan+rQBxaKWDF0fkq11SsjvYI3DlubXtUCtJ5N2t
         udoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Eq6nH6aGeuKpMU9nM7ibONmheABIDjQM7t9UjsNcl+w=;
        b=1dJVc7j5gyrMWDSraXU06TKAINE/VUtFQ9n7ZD+CGb5b3tarlocRu/lot/4TBpWBBQ
         nnBXFFSiha2pHF/eRdqSUfoGPsLfSQU+qHNnTCkrEIkMN3n4bhom/0uoXkJK/dMcIKru
         OXtEwE+uAD7EzOLbu53LEXSukuVdP2j4+wt6k1MR3bfjQOa0l7rHTrm7lkXswBeNYF5V
         xSONc/BUWpBoB+7nN9QmmPUD814ydpBth2G/qdW8pvKJoOzIqmThWCYMZDEp3LRzQUfW
         ox3mLhIpCWAGbx6XeW9rra1Ja8tO0avfbBYa/TsGl0sPCGjgysITwt757Ao8CGPrFh9U
         YsUA==
X-Gm-Message-State: AOAM531Lb5qI3+hAjFopoSnMogU3ZPdynf+6qVVZrgCt75SRXsfVb8Ah
        LuMKkSVuWuDgpcYN+EORf7pEyY6QxdbcImw=
X-Google-Smtp-Source: ABdhPJyEEJmzYE3LJbKEPxep9Txd8IS2Y3Ohb4w4RDlkBWekTGGi+00/Yu83BjSHoAA0YZYV1qdNB+xcoJAZ8NA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a25:2e06:0:b0:65c:ed2e:31bd with SMTP id
 u6-20020a252e06000000b0065ced2e31bdmr13135711ybu.244.1654067234572; Wed, 01
 Jun 2022 00:07:14 -0700 (PDT)
Date:   Wed,  1 Jun 2022 00:06:57 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-2-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 1/9] PM: domains: Delete usage of driver_deferred_probe_check_state()
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

Now that fw_devlink=on by default and fw_devlink supports
"power-domains" property, the execution will never get to the point
where driver_deferred_probe_check_state() is called before the supplier
has probed successfully or before deferred probe timeout has expired.

So, delete the call and replace it with -ENODEV.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/power/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 739e52cd4aba..3e86772d5fac 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2730,7 +2730,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		mutex_unlock(&gpd_list_lock);
 		dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
 			__func__, PTR_ERR(pd));
-		return driver_deferred_probe_check_state(base_dev);
+		return -ENODEV;
 	}
 
 	dev_dbg(dev, "adding to PM domain %s\n", pd->name);
-- 
2.36.1.255.ge46751e96f-goog

