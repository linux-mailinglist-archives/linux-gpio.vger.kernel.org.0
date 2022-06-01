Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D07539DC3
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 09:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344932AbiFAHHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 03:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344576AbiFAHHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 03:07:19 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6B13614B
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 00:07:18 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-30c2f3431b4so8079067b3.21
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 00:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=s1gsps1j5Ayup9Swk+EXc2kGgnx5nhOnARnKuAKYXv0=;
        b=ch5YvNSZbFFvNIFbdMWgLJY52Qnpd1NtoLMcbn1rQ4YPVTxYHbxywFyCPzAP3/GdOE
         KdsrLMveolqX+jFl+h4mIER3kCKjzchkhaA5vc1KaGo6eRizAhbS9sDWsqPUMTwf+grp
         U7krsYB7Uq2sN+6D6tVvi/PXDklkCU0WIpKMDNVMY9ZLGTpoYdnVYedYDONJOBI2h8x4
         UIe8XKZmJKhAXeerPesRykxXMFw39fsB+kV+KjPQH/ddcGxWfonhfMLcu+h3NXhKRmfi
         /YqfTTroCVXlQaiebFvlX5bBi+H7w29MdlZQ5F7xCu5rWKB+fxWysM0OGOqJxtn145ed
         E/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=s1gsps1j5Ayup9Swk+EXc2kGgnx5nhOnARnKuAKYXv0=;
        b=pgIJXbaUU148ChDAv2SNlUOj0rtRImVaxTiLe9BiyPwLTDOik5peCSslk38lhOXKme
         WN44WDf6As9cHEkwnpaYLm8+jM0xMb8TK7e+32KUgNrSpOVeF50PY5j87XvDtQbRG1bm
         rWdk9RP0lMsUZ7WbgTDqLqgkq/c5RS2fJdM/fLS0YpHEYXsMpQYeNAi4bi/uJjgSd5No
         4pSTxfTW/KsyWPoxKjcITKbREoau0eHdfrRleT36TJO+ZA1ZZJQufcUPTw80IuyOgv9A
         W6559BowkA6O83WKvTg4d7bxx8PQ+SgenHcD6DZMkYMUHmWVmWCgqiml8VUuzn6BTExt
         VVVQ==
X-Gm-Message-State: AOAM530AAXfSKOIJ5MwYtuHS/s+yeEuAasWL2LXBx7MmMR0SskHIQ3mL
        qjPNgtCJTGZX9PzRO+8bV1jLBmb2PLEKsSI=
X-Google-Smtp-Source: ABdhPJzzpyv5qo/qKlMQeYH+3Z6qXGo9Ac2yEg0ZjA7JAUgPsaNr7W/YlAhXWO4zqrhgdu1gO/8toNkzEz6BwXE=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a05:6902:2ce:b0:64b:9bbd:34fa with SMTP
 id w14-20020a05690202ce00b0064b9bbd34famr60927760ybh.440.1654067237399; Wed,
 01 Jun 2022 00:07:17 -0700 (PDT)
Date:   Wed,  1 Jun 2022 00:06:58 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-3-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 2/9] pinctrl: devicetree: Delete usage of driver_deferred_probe_check_state()
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
2.36.1.255.ge46751e96f-goog

