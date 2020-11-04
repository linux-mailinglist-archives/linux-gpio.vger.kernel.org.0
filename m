Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3922E2A70EF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgKDXHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgKDXHa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:07:30 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120B9C0613CF;
        Wed,  4 Nov 2020 15:07:30 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 10so18602695pfp.5;
        Wed, 04 Nov 2020 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wFU/mPUt5bnAn1NYJxaqVm9bqWLQ5tB7/uIHYHp0HQ=;
        b=b5MvlJWke83QbIoTA7AN/OK3LwdPyAjP45qdztR6fnfZhNhuZ/yniQQtrOmO6vWjlQ
         6DJz2xY+ESN/R2uZvQUi8DDfEySyFk65kati9kdpnG6yYUQFDBNptmqpa5k2PwqfYPIW
         HCLO5/XeMw4V3F4C0dPgtdvUe4EW3jKq8BDk3JoX46VPfJe0bpRNLS+fb6Q77weiB0C6
         IJSCEv7FBI2rFR/YfdFQb/5SDYFrDfz06HDr5X5w4mJiJbXp2MZx+MkezKmTwSbjxMyW
         OlA4lAHRg83At7utOYDWkVM8Df0KxCMNDazQotcpjAppt7/FdzWDVPm6bbpqutWFd7fN
         yZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5wFU/mPUt5bnAn1NYJxaqVm9bqWLQ5tB7/uIHYHp0HQ=;
        b=ZGJ982n4k+bJ+7zJvtKAGlxQ8qqtImTXpUqnV/b10oyAcLIKBIAd2v0N0U8BkHnQtk
         o3P43sa72Shp4+/ZUbNbUDtdown4JRMHPSK4f+rsvxqh2AuDGT3GEiYmeiABDteyvTMX
         h2gW8hkGGK3tiu8DW2IB9Jo+7prD6PLSMgcq4Y+PKwkJYZrJgB2sH7WBRtZA+TDkyaIq
         AXxjLBvOxTUhwrm0HIYlZe25ZKrErnfTCj8bWK+BXsNPfKSQXUblwr3CkIL3+YMR7DxQ
         VyDeB7g3OCrJDAkqPyaMuaYNtKqK+Oa3Gj83dBCqNyO3L9K2YAivb9uD8Qwati0B5WlX
         4rrw==
X-Gm-Message-State: AOAM531x3KYzbH4xdGouW61Q2cxi7xqgqy/j1qcGSJPZCmHnOy1WRUOF
        ghU8eO6enmhgZ9ukr6V37JQ=
X-Google-Smtp-Source: ABdhPJw9E9hqV27H7b7OfYUd72iM7FdbdnHf4qOTfDJhSmjibd+a412HkrfiITS+l5re7E4+/GcleQ==
X-Received: by 2002:a62:26c1:0:b029:18a:e262:b6dc with SMTP id m184-20020a6226c10000b029018ae262b6dcmr135680pfm.28.1604531249674;
        Wed, 04 Nov 2020 15:07:29 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id b3sm3418930pfd.66.2020.11.04.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:07:29 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] pinctrl: amd: fix incorrect way to disable debounce filter
Date:   Thu,  5 Nov 2020 07:07:00 +0800
Message-Id: <20201104230703.21466-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104230703.21466-1-coiby.xu@gmail.com>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The correct way to disable debounce filter is to clear bit 5 and 6
of the register.

Cc: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/linux-gpio/df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com/
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9a760f5cd7ed..d6b2b4bd337c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -166,14 +166,14 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 			pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
 			pin_reg |= BIT(DB_TMR_LARGE_OFF);
 		} else {
-			pin_reg &= ~DB_CNTRl_MASK;
+			pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 			ret = -EINVAL;
 		}
 	} else {
 		pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
 		pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
 		pin_reg &= ~DB_TMR_OUT_MASK;
-		pin_reg &= ~DB_CNTRl_MASK;
+		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
 	}
 	writel(pin_reg, gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-- 
2.28.0

