Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76EA379C53C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 06:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjILEyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 00:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjILEw6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 00:52:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4AF170A
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4cbso6501117a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494357; x=1695099157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xebdOcqzNiLkrduYHBYJ420PrwL90pWS/PE9oQklpQQ=;
        b=Q6951NLvBLtdQJdHbWazUlIgC6dItBfINLnECfWGnWpUHF8ddwr15nlV+1DTrRAlSX
         6AG3yd5crTN+vL/rKVQLb9fatbnx7dRuII2Olzh3hLCYIOhnI1ltxS8P/m3VfM/KL/VN
         L9ESBj373OZIBhENeB7V2ePeTEJ8Mu48+q1ZJpG/wt+CagFnXDXy1eKLy4Qkr2w+IsLy
         gW10318azQ8oXmStfeF3QgulhaVtSFOjs0itKLtJGJBdbVBK0gH7uYaR2Powu16hXKGk
         gY2fgYbGPWLOsXNWwq9Jdpv4VIP1wrcVmMAmRUAlFO4GExQXN57y8lmfWmSLwG0hae02
         1w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494357; x=1695099157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xebdOcqzNiLkrduYHBYJ420PrwL90pWS/PE9oQklpQQ=;
        b=tu5hsJlX/VFG7lQx2Xlsvta6oadaexFLPc14DkEzaOhWi3jNUeH5WFil43I/yvbYMj
         GbNSkM/df9R++1dWRuyt2wr+y6IDmVqD6+l7YHOs9iUFJ218FXCWP7aL85usourAOcRI
         BkCdcSnS7LF9/6G6hb/1HG/M4vBuUliQF2mLe0ljcFzx58yKlm4Q6wAIdNzO0r4HCi4q
         pnZG/LE5/qO5ya4SNIrsYFdzFuIqVwgNhczJIj+kbEhM0CCkN0SlOwS8vuBSLvMCM1xl
         pY7wZDJ4fWVCPBP86vr9i0huBsajfMTBD8CWbIuaFas0yQjz/iNCCUSjXCo4LGK/zTkN
         XVeg==
X-Gm-Message-State: AOJu0YxdZEKo9iU6W4GYNBDRC7xB5Q0mz8OZQYkH9H3NpxVrxTcr5fvV
        +KG9SAwYdcOT9swzystXTebuBw==
X-Google-Smtp-Source: AGHT+IGjT1c2D7rGbZkIDjQDBZ2SswU72mlETKwu7Rg6sZA50uDeTp2UawtC4cLxsacoGPlnRuQpVw==
X-Received: by 2002:aa7:c989:0:b0:525:58aa:6c83 with SMTP id c9-20020aa7c989000000b0052558aa6c83mr10337940edt.11.1694494357418;
        Mon, 11 Sep 2023 21:52:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:37 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/37] clk: renesas: rzg2l: use core->name for clock name
Date:   Tue, 12 Sep 2023 07:51:30 +0300
Message-Id: <20230912045157.177966-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

core->name already contains the clock name thus, there is no
need to check the GET_SHIFT(core->conf) to decide on it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b391c9548421..44226682db2c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -266,7 +266,7 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
 	clk_hw_data->priv = priv;
 	clk_hw_data->conf = core->conf;
 
-	init.name = GET_SHIFT(core->conf) ? "sd1" : "sd0";
+	init.name = core->name;
 	init.ops = &rzg2l_cpg_sd_clk_mux_ops;
 	init.flags = 0;
 	init.num_parents = core->num_parents;
-- 
2.39.2

