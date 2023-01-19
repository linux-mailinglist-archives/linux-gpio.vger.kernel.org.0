Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE04674791
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 00:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjASXzT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 18:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjASXzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 18:55:18 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEF446082
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 15:55:16 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z13so3861170plg.6
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlaNs59h5L/VZK9NKX1XrN48x5B0buY4rNRSvhSEduY=;
        b=akYNw9C8jZ1H8bdyXNUUsoZOe0v6Q2cgeHQp86x0kz8Id83Glq38O8wO7YWB2htT6P
         CVJo4izquStKNDmyA/31103uG/t8hCaBS5Auy2zAX4cRf7buOeDhv1kYoDbSeHeD4k82
         Zx5hCvbbI/HVdn4wErJrQ/qbSZXZgLF0hIQ4qsSXc1TdZSCwW5XxVSxugYud5eRvFwTg
         piXVZ0B/rN6p2p4AODRYPG6FL67CzneGSfWymLD5U6pMeVxCmSH1TtXML8QWa5hB9JiJ
         pZ6BRQVtEMfhp16M2WWk+TBa3WGMhnv/aLY7NOuv4TDcc739qk0dKk6FCtd4Z/fkzzOl
         KivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlaNs59h5L/VZK9NKX1XrN48x5B0buY4rNRSvhSEduY=;
        b=AI2Q4hXPtllAyh9zDrb2FcPDNF2AZiwvMYy5i1Bzaf7kKs2JxdxJzO/PM8fBxZq9SV
         OIdnu5i1CRWCn5NnxQCMA0DUmcpkkUSE+KwlqP3nzhkymHqWvtNf2rEMp9UMhNc6fqup
         /dHofSRIDhCCmcmzTf+2KviTriSjZlOwlYzW1Nj1NU4sbzTcgFX4zTOGTShrkrF9nBwn
         vgfIH62Vzf/lnH73D9y/LgyCS7qq25iiP3srsv2rt0W887WnKgjn6AkVKak2m5x9RCbv
         hjswdj0Dat44bfHsNcMDzIaKmCA6p65XsDANITqMPdzKR3nPCUBG8EescFz32HLpCYz/
         r9sw==
X-Gm-Message-State: AFqh2kpsGRxZyhPf1HAxIeTWB831TXOw8jbxgzCI4RcbBSFMU607Sgqj
        4BKLuCpc/bMfFMOg+gM//L0=
X-Google-Smtp-Source: AMrXdXtgf4X3l3kRiB9pQjlLynR7Djz18tE7IYnrdEy0rX51iGVUNwfBOIdeFXLhSIz56FgGfz0ZGw==
X-Received: by 2002:a17:903:2014:b0:194:a7b2:4329 with SMTP id s20-20020a170903201400b00194a7b24329mr10600713pla.28.1674172516245;
        Thu, 19 Jan 2023 15:55:16 -0800 (PST)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001948ff557besm8967603plf.83.2023.01.19.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:55:15 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed-g5: Bypass clock check when fetching regmap
Date:   Fri, 20 Jan 2023 10:25:01 +1030
Message-Id: <20230119235501.53294-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A recent commit cf517fef601b ("pinctrl: aspeed: Force to disable the
function's signal") exposed a problem with fetching the regmap for
reading the GFX register.

The Romulus machine the device tree contains a gpio hog for GPIO S7.
With the patch applied:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  aspeed-g5-pinctrl 1e6e2080.pinctrl: Failed to acquire regmap for IP block 1
  aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 151

The code path is aspeed-gpio -> pinmux-g5 -> regmap -> clk, and the
of_clock code returns an error as it doesn't have a valid struct clk_hw
pointer. The regmap call happens because pinmux wants to check the GFX
node (IP block 1) to query bits there.

For reference, before the offending patch:

  Muxing pin 151 for GPIO
  Disabling signal VPOB9 for VPO
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF1
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Disabling signal VPOB9 for VPOOFF2
  Want SCU8C[0x00000080]=0x1, got 0x0 from 0x00000000
  Enabling signal GPIOS7 for GPIOS7
  Muxed pin 151 as GPIOS7
  gpio-943 (seq_cont): hogged as output/low

As a workaround, skip the clock check to allow pinmux to proceed.

Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 7ee0c473ad70..f714fe40e400 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2635,7 +2635,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		node = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 0);
 		if (node) {
-			map = syscon_node_to_regmap(node);
+			map = device_node_to_regmap(node);
 			of_node_put(node);
 			if (IS_ERR(map))
 				return map;
-- 
2.39.0

