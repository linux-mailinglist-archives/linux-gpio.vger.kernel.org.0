Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468D66A8BD3
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Mar 2023 23:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjCBWas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Mar 2023 17:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjCBWap (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Mar 2023 17:30:45 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E2830B33
        for <linux-gpio@vger.kernel.org>; Thu,  2 Mar 2023 14:30:43 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id g73-20020a9d12cf000000b006943a7df072so463168otg.11
        for <linux-gpio@vger.kernel.org>; Thu, 02 Mar 2023 14:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677796243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HDohv0lvkUtSClkIwD4MKqx28WrKdTpdtBDDMSSGgA=;
        b=QK5ECiWqmMBIYChjTCoV1plMlRsQHILLL5Qy/L0tFkz0T5B+516OiUGoN1oGnwHkJp
         WCLdYjxUmUl5GZEvc/9mcDLq5c+g8M/jysvcni8fKq7E/pz9KIov8jcUJWg+qDhgK8Il
         2Hu0fe6rlSaC3WPcqiNxNajahwo3oodAJWra7MNllB9RHiP+WLzu0mD42MALpSlywSkK
         HAlfblwrkejJHyXDPE5lfTBiMuWq01PLafhDpN1AxExPj6o90mZxPK7zvayQBQ2Iau31
         D7Kb+a0aH7UXGY+LSsIHsMtjN2Ge5fE+7aJ4nFL4V++G06l+xjwxEJYqgD6k3eCF4lme
         eDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677796243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HDohv0lvkUtSClkIwD4MKqx28WrKdTpdtBDDMSSGgA=;
        b=7hHGsemyyapgz2Z3eH8MWB/5cZIp24ucalt40HMW2Z2f4DO0aw9/xuCcvg88ch0EG6
         xEALOlwgmx1fiJh7mrpP4mR5gzX6uSutZ9bhqTIIW71LVoJHXDM5XaaILalXOmqaa+f8
         Vk2V5fa/LON54x4lJdfNjFLsC+BKJGHJxkbPk/0WSDQJdLu45Q1oc9i0vUfy3nSzRlaK
         QhDRbEEYNDLqIn3ARpHDKXs1adg2Oqm8CBNAwQ2K/LjXQcW+2PB4z2jKi/YfO2AXC52D
         QTmZGem7dlGY3uLH2mTRGw/yvpumyIe0qwNlsxdgPy94bfv3HhmqNOL/pxL7yP35fOZU
         cDbQ==
X-Gm-Message-State: AO0yUKVQzOFR2smc4g5bY+6tSezgCkjaEG3621NOKssDDfManQ3bnBNk
        7P8b7KiPy7w327/jWsSoA+CF4Q==
X-Google-Smtp-Source: AK7set8aOSjPE5sh5YVuAen/6NBD9XPC1GJYtNeoPHfloJ8wL4Ac8gg9pWvda4YzAQAMyKKCz0oYPg==
X-Received: by 2002:a9d:4e5:0:b0:68d:5b43:5ac9 with SMTP id 92-20020a9d04e5000000b0068d5b435ac9mr6213905otm.4.1677796243123;
        Thu, 02 Mar 2023 14:30:43 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id a26-20020a056830101a00b00693ea7bfdc2sm346095otp.76.2023.03.02.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 14:30:42 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        techsupport@winsystems.com, stable@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Subject: [RESEND] gpio: ws16c48: Fix off-by-one error in WS16C48 resource region extent
Date:   Tue, 28 Feb 2023 03:17:24 -0500
Message-Id: <20230228081724.94786-1-william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The WinSystems WS16C48 I/O address region spans offsets 0x0 through 0xA,
which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
correct value of 11 so that access to necessary device registers is
properly requested in the ws16c48_probe() callback by the
devm_request_region() function call.

Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register structures")
Cc: stable@vger.kernel.org
Cc: Paul Demetrotion <pdemetrotion@winsystems.com>
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-ws16c48.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index e73885a4dc32..afb42a8e916f 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -18,7 +18,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#define WS16C48_EXTENT 10
+#define WS16C48_EXTENT 11
 #define MAX_NUM_WS16C48 max_num_isa_dev(WS16C48_EXTENT)
 
 static unsigned int base[MAX_NUM_WS16C48];

base-commit: 4827aae061337251bb91801b316157a78b845ec7
-- 
2.39.2

