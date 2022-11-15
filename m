Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E1062A0C4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 18:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbiKORyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 12:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiKORyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 12:54:35 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977362EF08
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:32 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o30so10192054wms.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDQEb4wyd6UiPVNPxGomKiLn13MPRZATFwIaEn1n0F8=;
        b=pn98Jwodh0/on/5+6OJ4iQGA41uQNmacKyJcG+kOloN+Iyui2C4SYE960yRwwxjJT7
         e5A8zEdXyNzFH9eD3iHyazF7pNNvXnMfkLZaj3nOvgP7WIKfVaQerAwPtHPLzxorLf0K
         /lKaNy3xHOyVBLQpwnSZDy4TL7yqDD+0MKwuW1/e0+A8tAXCAHt2TJ+J5pyvZNnSaEun
         fgAtmZMMmxFpG75rm7kHjxQ/EsweGRPpSI6TaZgw2fYReNvE920V6xLf7y0MemmNK2UA
         EWcaUYgq6vu2WzptvMnBevvd5gIthpDf4wcT3ncFPK2iB9/07SAS9Co0Pdh4npV7dKc7
         iR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDQEb4wyd6UiPVNPxGomKiLn13MPRZATFwIaEn1n0F8=;
        b=r1kLwQvugjdf214To8YlTawWzGJKv7a58IjVM3EH6JEoCRVOwF7Lzgz3DykcTNj6Zm
         yS7MC6t23AkxKGHz7dC+OO4Tt8KDOtiZLzZ+kG/BRTjY3faaTPsj/ZKoftkO3PAViPWx
         J/vxk5+HvgCrpB3z3LRKnt/MISOMo8oKK5JCCSTMt/jb/lTQsKCL8GAgrgQWVZbS/Cuj
         nmgRaJbZenk2oATNUSxuyhHTqRxS4lQM8u7eN9JXEapaRF4/LA9CBQCDKgDgEYIqTGAa
         XXZmMEi00IaBxuz6MUWaNdtLuLkx3dEotpXrYDGoxyaVgSt9Jc2/EdCIG6m52TK+utyo
         o0Jw==
X-Gm-Message-State: ANoB5pntHKMmn1FV87CE4ERswpjRzgUGHeYyGF0iykDJu4/tOTqJrYow
        BHCQjN9bWpQlmBcton6Gxav4N86voItyVWco
X-Google-Smtp-Source: AA0mqf5NX1p/AxGwmfBCj9XWFbpm3coJFJPixQOzfX++/Itgfx+60gWPLgaIDYVyKYtduQIZOKOInQ==
X-Received: by 2002:a1c:7417:0:b0:3cf:8a3a:9996 with SMTP id p23-20020a1c7417000000b003cf8a3a9996mr1292959wmc.89.1668534870871;
        Tue, 15 Nov 2022 09:54:30 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm26599521wmg.46.2022.11.15.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:54:30 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull down config values
Date:   Tue, 15 Nov 2022 17:54:14 +0000
Message-Id: <20221115175415.650690-3-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115175415.650690-1-niyas.sait@linaro.org>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
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

PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
be custom or an SI unit such as ohms

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 include/linux/pinctrl/pinconf-generic.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 2422211d6a5a..11e7394bcc70 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -35,7 +35,8 @@ struct pinctrl_map;
  *	impedance.
  * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
  *	impedance to GROUND). If the argument is != 0 pull-down is enabled,
- *	if it is 0, pull-down is total, i.e. the pin is connected to GROUND.
+ *	the value is interpreted by the driver and can be custom or an SI unit
+ *  such as ohms.
  * @PIN_CONFIG_BIAS_PULL_PIN_DEFAULT: the pin will be pulled up or down based
  *	on embedded knowledge of the controller hardware, like current mux
  *	function. The pull direction and possibly strength too will normally
@@ -46,7 +47,8 @@ struct pinctrl_map;
  *	@PIN_CONFIG_BIAS_DISABLE.
  * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
  *	impedance to VDD). If the argument is != 0 pull-up is enabled,
- *	if it is 0, pull-up is total, i.e. the pin is connected to VDD.
+ *	the value is interpreted by the driver and can be custom or an SI unit
+ *  such as ohms.
  * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
  *	collector) which means it is usually wired with other output ports
  *	which are then pulled up with an external resistor. Setting this
-- 
2.25.1

