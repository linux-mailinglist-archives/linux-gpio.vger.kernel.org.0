Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC0019B6B9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 22:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732695AbgDAUFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 16:05:36 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51273 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732645AbgDAUFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Apr 2020 16:05:36 -0400
Received: by mail-wm1-f65.google.com with SMTP id z7so1092632wmk.1;
        Wed, 01 Apr 2020 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F5gNAOoUSUhg21+3DUZibFk19ISaqGjaMFiYeuZ6vMw=;
        b=rswyjTSQ6rZ02dUssfmexHsuYexiIj4kg3yLMCbIkUGGBTYmpox7845L2Qw4WUX8wJ
         vZCgbRP+toUTuRpcfHzS43JE19OEOaWKaqtIc9gmdac9M5/LXsdrTm/j6CC4CMRgdqye
         BAk4trNtEl0er8EHfzVDy0QABV1X+rk2WjHiNbnhT0vsriSmfmNLvGCzyfZ4M1RVy4il
         5UglY29TflrVS+Au/lolZq1c8cTxt9qI4LdcMiFUlUyv1WcTJ4x/mATeI3tOw9Evdfz4
         ztxhhhGFunEaw15CYm0UdB6eRq8c9rd6x2PlVcLu5fGHvjCUUQQO49Sszt5isjvlUpxO
         dSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5gNAOoUSUhg21+3DUZibFk19ISaqGjaMFiYeuZ6vMw=;
        b=A7EeUglTnmhdO/Q3cvZgKgDs0SyrxZ01oRq+VBhlu65hW/ivoDJZHkDCcREEHCrNBc
         wgdmmrl+FgGrw86eBURHL6q6DSCUtQ13Ugg8gb5SHZVEtzeKf5R7L0KuN9m1MwbTFIpY
         x2NMCPTdPcHbYryqKCHdmemg50Oi9o1zKmnu7kd98lFZ+QF6ClraJ1st/9p2U3J2X5Vg
         HbcX/TrDLECJzou6gTp5OKCHM0kBeuivOiKSx2xpf4QSKWGV9VHcp9btlKdWB45/p+9s
         NvW5M59s9CeNl77A5ZH4+S5SCjqqTVJuluHhao5+glpHCmrlXm0KbFpZMnNO5dRkh//x
         wDdA==
X-Gm-Message-State: AGi0PuYYcwe+gh7Sd+L545mahkgD7QNIIG+ckbltfmB83km4gYuIkMSV
        ujSnc+SALUkRKL7kskIHex4=
X-Google-Smtp-Source: APiQypJpxKSU5rWL3MZoUM1xteY5UNluOT9lw87EguVC3ovAlYbwAPi+7LoT9mEW0lWgOZBkgb44fg==
X-Received: by 2002:a7b:ca46:: with SMTP id m6mr100026wml.102.1585771534364;
        Wed, 01 Apr 2020 13:05:34 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id u13sm3792751wmm.32.2020.04.01.13.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:05:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: Unconditionally assign .request()/.free()
Date:   Wed,  1 Apr 2020 22:05:27 +0200
Message-Id: <20200401200527.2982450-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200401200527.2982450-1-thierry.reding@gmail.com>
References: <20200401200527.2982450-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The gpiochip_generic_request() and gpiochip_generic_free() functions can
now deal properly with chips that don't have any pin-ranges defined, so
they can be assigned unconditionally.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7f5376ce7fb1..e5dcf77fe43d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2323,11 +2323,8 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.direction_input = ingenic_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;
 	jzgc->gc.get_direction = ingenic_gpio_get_direction;
-
-	if (of_property_read_bool(node, "gpio-ranges")) {
-		jzgc->gc.request = gpiochip_generic_request;
-		jzgc->gc.free = gpiochip_generic_free;
-	}
+	jzgc->gc.request = gpiochip_generic_request;
+	jzgc->gc.free = gpiochip_generic_free;
 
 	jzgc->irq = irq_of_parse_and_map(node, 0);
 	if (!jzgc->irq)
-- 
2.24.1

