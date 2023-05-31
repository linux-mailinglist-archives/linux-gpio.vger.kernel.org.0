Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C744F718B62
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 22:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjEaUls (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 16:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjEaUlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 16:41:47 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A701134
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 13:41:46 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-53202149ae2so57595a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685565705; x=1688157705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akyKWVKyPkLNxMRzqWTgHJvGDhTUQ+cKpoqfMEuES1s=;
        b=eROEwGbU6XuzXQQe0+Hg+qHckduK1kSmaelGwUv0E0yA2Wpp9lJcxwyCGbxHkfWM0z
         bv4LdNhIIsnga050P3IyUvy6WVxaC0fXMgxwWr1bGxDzL65kDXTP/h7VwMZvoSqEwX8X
         h0lWm8bZpbRy/zMT4bf7DE0UkZDJrtKVYFzV0jRJU0PTdDZhnj2Y+H7mtvuUK4CCF+kO
         +gynN4Pd15mEBqRa1odVCBQ6GadIekOGqsHkOi1vrP2l8+WI+WD1zi31MlHXrL3734o9
         260EX6DuELWpur/fqSQpTauaBmyQ168MCbycHc7Uu5kQk5b6BFBqy2XA2mlhkxjlGZuC
         BNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685565705; x=1688157705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akyKWVKyPkLNxMRzqWTgHJvGDhTUQ+cKpoqfMEuES1s=;
        b=iP8salWyKQmIwyPxGTKMJGpnpf6gkqJ/0UflkuryIevtqzUgTPJbYhH+zJqqfG3CVu
         iPHOrkClW/AWkvmQ0AJ6wls7oF5RTJfSIH/bKbRLbRpm2TCf2RgDZCxfT+wzwlwJPllI
         PbvaPivUegBQ7i3S1oiOUqSYTlF0ochqQMMigez7cT5tk08s6B98GSK5ewxlPvFaIxkv
         jqoFpYaI4boQKhPS9AdB87eQc0vyxMlo6jNblXFn8OOrAoNuPg6ggFNhsF8/gvbaHv9a
         /+LdMdYRGJHBRG3jRpsxiPsnk9q20GziO5m7uk/juPoGZpYcqaiu5RAVhAxyrIkJpoZg
         +Tug==
X-Gm-Message-State: AC+VfDwCScwTUUetnqNKL2xp+EI09N7NdKFZbMoCW7GggW2VPY7PYyqU
        G+kTJb55/8oVxwcmiiBWlUo=
X-Google-Smtp-Source: ACHHUZ6C/Il3463h2FKcznxjBpTUOgJ98IxfnQO87YDP4PwkQmO3vcrP73t8eXrs4UeKpNETogjdYg==
X-Received: by 2002:a17:902:ce82:b0:1b0:4718:8832 with SMTP id f2-20020a170902ce8200b001b047188832mr5836368plg.63.1685565705163;
        Wed, 31 May 2023 13:41:45 -0700 (PDT)
Received: from babbage.. (162-227-164-7.lightspeed.sntcca.sbcglobal.net. [162.227.164.7])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902b21100b001b04772d33esm1822679plr.165.2023.05.31.13.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 13:41:44 -0700 (PDT)
From:   msmulski2@gmail.com
To:     linus.walleij@linaro.org
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        Michal Smulski <michal.smulski@ooma.com>
Subject: [PATCH v2] gpio: mpc8xxx: latch GPIOs state on module load when configured as output
Date:   Wed, 31 May 2023 13:41:39 -0700
Message-Id: <20230531204139.10570-1-msmulski2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Michal Smulski <michal.smulski@ooma.com>

Qoriq and related devices allow reading out state of GPIO set as output.
However, currently on driver's init, all outputs are configured as driven
low. So, any changes to GPIO confiuration will drive all pins (configured
as output) as output-low.
This patch latches state of output GPIOs before any GPIO configuration
takes place. This preserves any output settings done prior to loading
the driver (for example, by u-boot).

Signed-off-by: Michal Smulski <michal.smulski@ooma.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 3eb08cd1fdc0..6340e738c912 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -375,8 +375,12 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
 	    of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
-	    is_acpi_node(fwnode))
+	    is_acpi_node(fwnode)) {
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+		/* Also, latch state of GPIOs configured as output by bootloader. */
+		gc->bgpio_data = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) &
+			gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
+	}
 
 	ret = devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
 	if (ret) {
-- 
2.34.1

