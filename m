Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED452A6902
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgKDQEi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgKDQEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:04:38 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA4BC0613D3;
        Wed,  4 Nov 2020 08:04:38 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id w4so6741896pgg.13;
        Wed, 04 Nov 2020 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0n46AHM1ZqA3Gna+bXoHTkiVn6oTFv2wK2HdNOKlaDY=;
        b=KMXQvMbUzMe63w/lEw/PFvIAzz3ioHzrEwWtIsXmbyzCet2uCJLMdL5jawL/9UrhHp
         a+Qlba4j4H8Ft581tsThI98dYK49LVHFwUYzthyZ2IIRC2lXGDyLCXW5H0/7oaQHesGl
         21L4zms+iYmosPLSOF6YPLAe/cAFv6ru1bUzzYWj/KqsRAQ14oayn2C7DCNvV5vswNg/
         DcI4k29TdmdAMxxAEIX6E661yrIV7uagDaWEtDSAcxYFUje6uKkBwigoUv0M+0AhCJ49
         cBfW0DYzTf+q21FVPdmF4fQ2TOqOyMPla9GihNa4JdcU+sTJjvxxNnOXlInvgb7RWw+p
         mbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0n46AHM1ZqA3Gna+bXoHTkiVn6oTFv2wK2HdNOKlaDY=;
        b=ZmTJM7mYqRu3agHRE9NalU8+0p7JMmJsgoPIBxssu4Ct9gWziuya2ZWUEeka3b1Jys
         aOOBoNr5Hq9572Uf3dw9gRykX2wwaWD/RHaF2V73bQ+63GwCMh+Ae/VQqMDics6b6jkv
         y+tyTShCZAbKIfzrnvo6IscYckw1Io+BR/w6hEK0V1y8cJbarDUsPruUL+PR5KTItPWS
         IppYkohhNQB6vJXoWZdOtGi/5Ogv7zmkeBBcHJ/xAQ9+y9t/+i+pZs+cGZhqGdUgkzZj
         j1ADfPMcWE44vGIAoM79LBo9apQ5MG+3PzZfQHSoZw1HO3/W5s3YzVgaWkQCaBhzki49
         aOwQ==
X-Gm-Message-State: AOAM533Gq5hHMGmD8WG+4jI6OI4r6PcJmmW5l2JDiBmblxfQrm+hrvVT
        2A/ZbbdynravvNs21eUOUtU=
X-Google-Smtp-Source: ABdhPJysc6a1tQxV37VXh+GMOWkSf2yC9F2sCo61UiWmqoWq7b6dHBpJ5btDczexAwkAgfd6Fouxhg==
X-Received: by 2002:a17:90a:9412:: with SMTP id r18mr4615379pjo.152.1604505878097;
        Wed, 04 Nov 2020 08:04:38 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id 192sm3053368pfz.200.2020.11.04.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:04:37 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] pinctrl: amd: use higher precision for 512 RtcClk
Date:   Thu,  5 Nov 2020 00:03:42 +0800
Message-Id: <20201104160344.4929-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104160344.4929-1-coiby.xu@gmail.com>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RTC is 32.768kHz thus 512 RtcClk equals to 15625 usec.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
Message-ID: <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index d6b2b4bd337c..4aea3e05e8c6 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -156,7 +156,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
 		} else if (debounce < 250000) {
-			time = debounce / 15600;
+			time = debounce / 15625;
 			pin_reg |= time & DB_TMR_OUT_MASK;
 			pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
-- 
2.28.0

