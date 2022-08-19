Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2990599104
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Aug 2022 01:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343761AbiHRXMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 19:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344032AbiHRXL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 19:11:59 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2255CE4B1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id p5so734585qvz.6
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qGjpQWlBEsnLX6GHKgz+4eStCbKQ3L8yDM6zs4RFMHg=;
        b=Bk4vjTP8uhWl7oL5ebI1LwMJMihXqKivXuNoITMw/0VYMMIbZOCZyqnZixlN8JAN7I
         9jpUf1PrHCjAW+ImYiZYS1tP5g7s0UzMXIdkAGq4SBZkikERPJhKuiGBxmXV81ab7BtJ
         6BT0LaSG1VylHc3K0aOWPhSSsCkSsoJDVHkPtDuZzjObso7Af5yyk6Gxrn2N9UOPaFnI
         7Jl4GvdNVg25DKaSknRaaillyIFdu6Rw25kck3ARY0zHLNzIRiZX12woqQgM2/i5GuzO
         p3INah8xtH3oKtH+T73Aa5qLdwxfJcJHxeNTwG7qaK53lDe3Sm7rbwJguH1W5nUb91Ep
         4RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qGjpQWlBEsnLX6GHKgz+4eStCbKQ3L8yDM6zs4RFMHg=;
        b=iZlTjkBVq6+0s9NoQOLc6IQgkb7xvmelmEK52OPGMEflPiWFRdnGxpVn90ejHK8KCU
         KjSjOeQfXIH/WX+xk0tclHs7RnAw2Oc4/3lI0ohKcTuqbzNCET0wFSiAyi0jCvF5jmNY
         Wyj65n6ixvE5Eyl1sGbgu0EsjmVS8d/vH4rP0t55HRDyrB7cW1bJS1UEiZWm995WfPtf
         kzr8V+d4hU8WnIFUIiEFe+aticgJqO47csG50SxxxS4bXJfPQAyKHbGfSiAOPlVWW0dg
         D3TZVGebm1lU+BAwxhG4sa7naNxGR3wX19GgVuUh2RkWam6cgxFFfr9wWGLRMR7pjNrt
         BFyw==
X-Gm-Message-State: ACgBeo0mqqf6BO2ZwR5H8bS9kLNGWaXRqZ8DzpfIOqrt0KpTJ4MtKOkH
        2vwJG1GDH0iqNDZF4rjFqsa+aQ==
X-Google-Smtp-Source: AA6agR4ix7mMLjT/ZIULKRyjTt3rncj/41VSGEAN7cdfBJaZdaGATl63I5/zMoAZ8KysxHmUjDRPGw==
X-Received: by 2002:a05:6214:1d0f:b0:496:b99f:3b3c with SMTP id e15-20020a0562141d0f00b00496b99f3b3cmr4193088qvd.113.1660864318612;
        Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a245000b006b5f06186aesm2864801qkn.65.2022.08.18.16.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 16:11:58 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linux-iio@vger.kernel.or, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 2/6] counter: 104-quad-8: Ensure number of irq matches number of base
Date:   Thu, 18 Aug 2022 12:28:11 -0400
Message-Id: <9c386d163f765d00c1277c5c5c7436d1c9f6d342.1660839809.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1660839809.git.william.gray@linaro.org>
References: <cover.1660839809.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 104-quad-8 module calls devm_request_irq() for each device. If the
number of irq passed to the module does not match the number of base, a
default value of 0 is passed to devm_request_irq(). IRQ 0 is probably
not what the user wants, so utilize the module_isa_driver_with_irq macro
to ensure the number of irq matches the number of base.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/counter/104-quad-8.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 62c2b7ac4339..3f8d1910a9bb 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -28,7 +28,8 @@ module_param_hw_array(base, uint, ioport, &num_quad8, 0);
 MODULE_PARM_DESC(base, "ACCES 104-QUAD-8 base addresses");
 
 static unsigned int irq[max_num_isa_dev(QUAD8_EXTENT)];
-module_param_hw_array(irq, uint, irq, NULL, 0);
+static unsigned int num_irq;
+module_param_hw_array(irq, uint, irq, &num_irq, 0);
 MODULE_PARM_DESC(irq, "ACCES 104-QUAD-8 interrupt line numbers");
 
 #define QUAD8_NUM_COUNTERS 8
@@ -1236,7 +1237,7 @@ static struct isa_driver quad8_driver = {
 	}
 };
 
-module_isa_driver(quad8_driver, num_quad8);
+module_isa_driver_with_irq(quad8_driver, num_quad8, num_irq);
 
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES 104-QUAD-8 driver");
-- 
2.37.2

