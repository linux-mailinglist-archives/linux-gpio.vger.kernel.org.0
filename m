Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048A23BA04F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhGBM0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:40 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42419 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232156AbhGBM0i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228647; x=1656764647;
  h=from:to:cc:subject:date:message-id;
  bh=x/cAfVv59ovK81IneX1hABOtGlTE/zThFenfoMr94bo=;
  b=CH7Fm6/5VJzR+9jxvp1+seSv3ZQvVWLbXMnXyAQpvc4V6C+XdfBdgzOS
   ClPTi9gmJbovrqzVEE+RDduBk5BOndWAXD+3lYKimh2otGm77ChzFmiov
   R0DDXY2xMDRHC1ciL8CChxUWeKoNGM97LXcl/7XeHVz12BNZlK/frzhL/
   vDMNovR7ciRkTQ61/v2FcnThuxPP5+e0eujkXuVhP3Y6V2CgUROZD04Jb
   znhpxay3g5HZDmkZQipBH7IFdkelk+ofC6MQ7fEfPyI+G4L35Ld75DW2I
   MryujKVRALzd+zNkPNlGVwH7KtZwm4Q5cwj54tfHtTgM+PJNti8F1zdWl
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252570"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228644; x=1656764644;
  h=from:to:cc:subject:date:message-id;
  bh=x/cAfVv59ovK81IneX1hABOtGlTE/zThFenfoMr94bo=;
  b=DIqeqhKiUQVrkuzvr+NFfAGf5daKySTR/8fvj49LbIUbOQht33UL7QOP
   lAep2cB+PejWF55MsR50WivARXx+xs8EYLN/+lQmrroodlodFMG53FBfR
   W1xM070qsZhAoZgydBUGL2CTIaTb5+uaHz9ake29hwEgSCefDSFoi4JLp
   DF1m847LYU3uk1he5E3SBDmwxzJEWwNsaozeSDOddJt40bLsPP63vm6r6
   ph5wLZQXhjQ28h7z/Rj1eZlqVStAyBGcFjs1FpTok3onSbeSPrn1pZVOO
   0GSHCWCqQRA3//2IoCWf8/qZ3NqzuJgebefD88b036seZGIOr4fBdF0/K
   A==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252569"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A3490280078;
        Fri,  2 Jul 2021 14:24:04 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
Date:   Fri,  2 Jul 2021 14:23:48 +0200
Message-Id: <25ee92527847b2fa15e2c82ca486a92b4fd1d44e.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver was registering IRQ 0 when no IRQ was set. This leads to
warnings with newer kernels.

Clear the resource flags, so no resource is registered at all in this
case.

Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: add Fixes line

Andy recommended to use IORESOURCE_DISABLED instead, but this doesn't
have any effect for platform_get_irq(), so I'm resubmitting this patch
without functional changes. Grepping for '\.flags = 0;' shows other
drivers doing the same.


 drivers/mfd/tqmx86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index ddddf08b6a4c..732013f40e4e 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -209,6 +209,8 @@ static int tqmx86_probe(struct platform_device *pdev)
 
 		/* Assumes the IRQ resource is first. */
 		tqmx_gpio_resources[0].start = gpio_irq;
+	} else {
+		tqmx_gpio_resources[0].flags = 0;
 	}
 
 	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
-- 
2.17.1

