Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7F2681DB8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 23:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjA3WJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 17:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjA3WJT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 17:09:19 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7760B4A1D1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:09:03 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so5937440pjb.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L5foAVcdo0wWC1jyJkjon2kzWr1+9ltHtWZQ2d1jOVw=;
        b=Baa8FKGHgsqHOOj68wxx0RxE8EryAs2yr6Lw4gyNRkO5D6k2qSD7r4KN7/8KNV+RTw
         xlCqwguOwuQpPYDDQsub2O+e+quW/YGL04cVEmRLb2ngdVfRuGn9txrxOzJhFIDikLHW
         TNtEKeklzLwGrn6SuOSOqWV2olym5L5dpat8WAnmEhVNvIcziY8OGEYXSvXdi7MKIsPz
         R1auOxUF0GwqTwXGeBtK7YZhX94eqZvnEk2Xr1HheWuJOIgc6kk0Hcr92NhBhAw/ZWsq
         PYUYNFojoLgP/334x9leUoI+0xTIvv6ng+iXFyhO/VkzhGX/n/sBPQlxRaO6YCWO+53M
         Z6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5foAVcdo0wWC1jyJkjon2kzWr1+9ltHtWZQ2d1jOVw=;
        b=rsCAPVPHXgxWzi3+e7bM6w4jyz1bhqRCRpJNVXuPYsZyDhq4zqQNtf1mKRFlfToiCm
         AMEr1EkwcZStx7ku6Po/UpKjrI6WjPaPzaVNioZfOUBs3iMAIRCojCspsM48/tjed23r
         0ZKWK3MUs7Xbub6H3wKEcGgMHEyUXqd/AeqkaNeWrLTttxdLj/EjBZ19B9o+qHy+P983
         MyypQTYMTk9W6liCAm24T4k2fq09QNUf2QyAqoGmkxts3Afy1xigwE9VBgK3N+NW9P6G
         33X5Hn1VnUIqO3A2xw4D14MqN3ygQY7qYAYnHjWcRZeVpzuUfLU/Z9b0FzIoADtuZmgO
         9YNw==
X-Gm-Message-State: AO0yUKXnuD9SW5fs3sLeLEftt8E15dWIVY+vLbZuUDf0DeoiIjEaFYCA
        9wgEuUbVx5aiW8ADODQA4FhMJC00WwA=
X-Google-Smtp-Source: AK7set9vdlpVkOYcmq+zYZISjy8rtCo12U/jBU3OzjF1ZhMA9Aein/s5pHwUlEL/1R4BcnHLZBobIQ==
X-Received: by 2002:a17:902:da8e:b0:196:2da1:dca4 with SMTP id j14-20020a170902da8e00b001962da1dca4mr24378796plx.65.1675116542535;
        Mon, 30 Jan 2023 14:09:02 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902758500b0019686d286e2sm2285995pll.13.2023.01.30.14.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:09:01 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
Date:   Tue, 31 Jan 2023 08:38:45 +1030
Message-Id: <20230130220845.917985-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit cf517fef601b9dde151f0afc27164d13bf1fd907.

The commit cf517fef601b ("pinctrl: aspeed: Force to disable the
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

We can't skip the clock check to allow pinmux to proceed, because the
write to disable VPOB9 will try to set a bit in the GFX register space
which will not stick when the IP is in reset. However, we do not want to
enable the IP just so pinmux can do a disable-enable dance for the pin.

For now, revert the offending patch while a correct solution is found.

Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
Link: https://github.com/openbmc/linux/issues/218
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index f93d6959cee9..5a12fc7cf91f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -92,10 +92,19 @@ static int aspeed_sig_expr_enable(struct aspeed_pinmux_data *ctx,
 static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
 				   const struct aspeed_sig_expr *expr)
 {
+	int ret;
+
 	pr_debug("Disabling signal %s for %s\n", expr->signal,
 		 expr->function);
 
-	return aspeed_sig_expr_set(ctx, expr, false);
+	ret = aspeed_sig_expr_eval(ctx, expr, true);
+	if (ret < 0)
+		return ret;
+
+	if (ret)
+		return aspeed_sig_expr_set(ctx, expr, false);
+
+	return 0;
 }
 
 /**
-- 
2.39.0

