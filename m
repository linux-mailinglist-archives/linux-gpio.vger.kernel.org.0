Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604CD292E85
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 21:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbgJSTeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 15:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730943AbgJSTeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Oct 2020 15:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603136042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=Kq5VxBu2z8uXUidFjxUtgnQ0vBBkojXZgIAYG1rS13k=;
        b=XwisfWL1yDp8tjCx3C/o+yb35YDUfpHhNmDHKMMQkvlo618NOvPKmtzxfz6QEub/6HtMRK
        jNmJ8pOvBxib7By4WeSp4UzijpIGxoVMj65CfurmiHc3JF7imWUIcQ36NKXZghuY9IKTkr
        QuA44Tm7WOqehGyB+ui2W+woWrrqzOc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-kMeJINLnNoy6gXWgKMojIA-1; Mon, 19 Oct 2020 15:34:00 -0400
X-MC-Unique: kMeJINLnNoy6gXWgKMojIA-1
Received: by mail-qt1-f198.google.com with SMTP id n8so709621qtf.10
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 12:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Kq5VxBu2z8uXUidFjxUtgnQ0vBBkojXZgIAYG1rS13k=;
        b=E8k5UJR7SBNLWKFogsq32W9wQaQ55K6CtZcI4fHDK41I84m+s2A+knAW+mQzRlCNl6
         29ZSqclirJHwu0ey2LlLdGO3BhSfzINs7K3NwRZw4sjN0yG39lIWs8YgBrhSNBu7n2MU
         vT3T831syilpEAGwEMBqEvErWVyEaeequ16Okj0YQoCdonyoYQOleUPHgkvq66PzPyhm
         /0zVSBhExOEo3TGyo2Hb8HR/gcEZbVLJV3lXaUiiiA8qjo4eUww0BTh5dKj7bfPY2oKW
         ccs7V//G6bzWbie4G6YTxDVDsg7qshIL6Q70bBowgewe7RcQdMZjWZlucDPk9oeomZ/S
         yyGg==
X-Gm-Message-State: AOAM530na4n6UgNGpIV+kY2nI/817op3as8WfQTyfzW9lawRPnuDSSrc
        G/u6mjvvZL+St77OG3VXvJz3ND7lhVI9ZhSQ376MAsxrjkAl/2C4usGkoOZt7rL4DeWn5x/GJAy
        yCtKBvW35jaWMw81KXHQ/Yg==
X-Received: by 2002:a05:620a:998:: with SMTP id x24mr1093533qkx.160.1603136040061;
        Mon, 19 Oct 2020 12:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRBOMiv5G17G7LD/7F/VAfAiG22qRDwWAIDg5xLV1iQptDtvpB+4Rtxa35qcp0KfqWXbJFEQ==
X-Received: by 2002:a05:620a:998:: with SMTP id x24mr1093513qkx.160.1603136039870;
        Mon, 19 Oct 2020 12:33:59 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id h8sm358550qto.46.2020.10.19.12.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:33:59 -0700 (PDT)
From:   trix@redhat.com
To:     matti.vaittinen@fi.rohmeurope.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] gpio: bd70528: remove unneeded break
Date:   Mon, 19 Oct 2020 12:33:53 -0700
Message-Id: <20201019193353.13066-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpio-bd70528.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index 45b3da8da336..931e5765fe92 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -71,17 +71,14 @@ static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 					  GPIO_OUT_REG(offset),
 					  BD70528_GPIO_DRIVE_MASK,
 					  BD70528_GPIO_OPEN_DRAIN);
-		break;
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return regmap_update_bits(bdgpio->chip.regmap,
 					  GPIO_OUT_REG(offset),
 					  BD70528_GPIO_DRIVE_MASK,
 					  BD70528_GPIO_PUSH_PULL);
-		break;
 	case PIN_CONFIG_INPUT_DEBOUNCE:
 		return bd70528_set_debounce(bdgpio, offset,
 					    pinconf_to_config_argument(config));
-		break;
 	default:
 		break;
 	}
-- 
2.18.1

