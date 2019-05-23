Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15614279B8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 11:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfEWJvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 05:51:25 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40166 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbfEWJvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 05:51:24 -0400
Received: by mail-lf1-f65.google.com with SMTP id h13so3923044lfc.7
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYaapiuktWji+ZLrBkHMS37YDS3FOPH9F6n5Ia6NopU=;
        b=TKzf2iDqswc0LSUvoxXVx9v9IIeFK1+m/wTS+tpORFlyvWIIPkbHqPcLQA/xMJ9675
         orMrCeX696bO1ppZJF4IFxIpK7eptODW62JC6pxeE4aNkzuD1kuHBIdp/mnHI1aMATb9
         OiW8eqcNZTI6eonmhVCRW/YY9C4/5h5bGNUV5D+okztPv/VDG/uAGPbzXHaj8PmOY3ZY
         E/iL5VK6naH+JKIPU4jxeH1JzyJmTeTrmiZ+Am83RTABB+7VK4tk7gPwzBZgcc5LYvNP
         cTZCRALRxwsiuyK+wR6Ey/dB0i3kH9sVUUO/4BenyPF6jil6Rn6MBA8PGPcq8S8cAwmA
         tJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TYaapiuktWji+ZLrBkHMS37YDS3FOPH9F6n5Ia6NopU=;
        b=r1Q4paLpldby8Cn7nlxd5E/sGUAlbAkvHbYEBElW8/akssas/hpRevlJaKnjXqxuiz
         v8Mnmd6lYSPisJRDYtBkfu+dUCjsMu4VOPbsl9O17mhztsazyjqzox4AhZ60da8o8Uay
         7pv8YKwWVFOl9xbMz4peKzXPA7/IStYfIy/Y+171pM/PS6Da5glFG7HrcnQDssYwE8cN
         52SJfOX7kJASQqBs1RPzBBS/cvf5D2psnXeCit0zR9cYk6BVVohLC3uulTIREfX65kRW
         OiZNAnnyN890t0bHHmgo0a7i07eOmCGOHW60Xtq6iJpQKGhYWVMvnTUF+V4KeU8PaAkR
         +BAQ==
X-Gm-Message-State: APjAAAUomL/RBU7P62zs65OPYPhxEcQFbC5Re2e6Gny4Z+efY8VqpZpb
        Hp1pzV13twh+PpgmEhG9Up2BqfwJltQ=
X-Google-Smtp-Source: APXvYqzMJhLWj477QHlXRJKu7d259w8hBffzPAjr8MeMTubc28hKtsR4jxpMo9hCmFOvIzXr84R7DA==
X-Received: by 2002:a19:c20e:: with SMTP id l14mr2857058lfc.5.1558605082232;
        Thu, 23 May 2019 02:51:22 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d10sm1041589lfn.91.2019.05.23.02.51.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 02:51:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH] gpio: ixp4xx: Use irq_domain_translate_twocell()
Date:   Thu, 23 May 2019 11:51:19 +0200
Message-Id: <20190523095119.31967-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use standard functions. Eventually we will be able to drop all
checks and just assign irq_domain_translate_twocell() to this
callback.

Cc: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ixp4xx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 4b1cf7ea858d..670c2a85a35b 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -205,20 +205,20 @@ static int ixp4xx_gpio_irq_domain_translate(struct irq_domain *domain,
 					    unsigned long *hwirq,
 					    unsigned int *type)
 {
+	int ret;
 
 	/* We support standard DT translation */
 	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
-		*hwirq = fwspec->param[0];
-		*type = fwspec->param[1];
-		return 0;
+		return irq_domain_translate_twocell(domain, fwspec,
+						    hwirq, type);
 	}
 
 	/* This goes away when we transition to DT */
 	if (is_fwnode_irqchip(fwspec->fwnode)) {
-		if (fwspec->param_count != 2)
-			return -EINVAL;
-		*hwirq = fwspec->param[0];
-		*type = fwspec->param[1];
+		ret = irq_domain_translate_twocell(domain, fwspec,
+						   hwirq, type);
+		if (ret)
+			return ret;
 		WARN_ON(*type == IRQ_TYPE_NONE);
 		return 0;
 	}
-- 
2.20.1

