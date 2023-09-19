Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E247A636E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 14:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbjISMqS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 08:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbjISMqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 08:46:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC5A125
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so12244629a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695127565; x=1695732365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kA0NToIbWuR6d6alRKXkP3KfjrWVM/I6SsyvDthzTxU=;
        b=CwS/cyREVeEVLjvlCgp1qJoyrdqn3ckGQeuCVT7k803ktVJdi99D8nGB4rCroWlSH6
         Z8VEdaVRvV/2JjQ+d8twp+AoEZfAzUMOMoSbq5FXjhkeIyMRYPKRQfUo6zwQ/EcjaMJd
         5lbL4f5MQvC9fo0IpzWO3Fs+K6rlyUQg2acbjEuiTAv+hSrT56vYc/9hzb5nUXPjItae
         SY3sKi+zVCnO5oPtRDC9zHBBPUZMVIutka6hlo1TyaMGzQQGth0WxF50pOVvf6ATNTOF
         N5JpqylEJnqXK5oAlZFGIwEQS/bfjwgDK/jsn3y5f1Ih+4RE0CXRIdHwIlvjMitcfDTb
         CG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127565; x=1695732365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0NToIbWuR6d6alRKXkP3KfjrWVM/I6SsyvDthzTxU=;
        b=CmZRvYfnPTjWg73JgGt1ehPWd0nqZdXizk5hxHVW0LsmNcA/IKtkRt2BbA7K+6NbP4
         fZAEVuZnDob5qL9ANWQJxCcZSXJEQo7UGavvUs/rZZNc19V9s72lMIBFcUe8WjgN8kMN
         2HR+mjAgaO1lGTYsT1EatEvU4OBHtkqv8Kh1iV95bKBTGKOj2yxFDUiN/ZEDJ25MrY7G
         /bvxS8DCg99prn8tZ1tZhHKBL0bwlVwENOqTivZv1ka8bQ7xb6U8DblfEJDaz1K6Fxp1
         97vXSrGpFT5ApHtDjKSsMG2o4z6G+UUM7zrX/48hRMEjbUWzuj5NUg4fhDcItS5kQX2i
         rOjg==
X-Gm-Message-State: AOJu0Yx1KFbwblzcOfrWJYuFp1COAMWddELPseUQ3sPo0MjGgXpmxj7v
        oEroFcAca9sWRZP+JkOlhZHfOA==
X-Google-Smtp-Source: AGHT+IFrtYCZSQ5shL6KQpW4yzOiSjutPhoOz2W7aPnHTf+JUa1mxqdR6aoD/M8rkYHlMxdTQEDweg==
X-Received: by 2002:a05:6402:43c3:b0:531:157d:ba2d with SMTP id p3-20020a05640243c300b00531157dba2dmr3611058edc.4.1695127565674;
        Tue, 19 Sep 2023 05:46:05 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm635878edb.66.2023.09.19.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:46:05 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 19 Sep 2023 14:45:56 +0200
Subject: [PATCH v2 2/7] nvmem: qfprom: Mark core clk as optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230919-fp5-initial-v2-2-14bb7cedadf5@fairphone.com>
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On some platforms like sc7280 on non-ChromeOS devices the core clock
cannot be touched by Linux so we cannot provide it. Mark it as optional
as accessing qfprom for reading works without it but we still prohibit
writing if we cannot provide the clock.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/nvmem/qfprom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 14814cba2dd6..525be03b7bba 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -423,12 +423,12 @@ static int qfprom_probe(struct platform_device *pdev)
 		if (IS_ERR(priv->vcc))
 			return PTR_ERR(priv->vcc);
 
-		priv->secclk = devm_clk_get(dev, "core");
+		priv->secclk = devm_clk_get_optional(dev, "core");
 		if (IS_ERR(priv->secclk))
 			return dev_err_probe(dev, PTR_ERR(priv->secclk), "Error getting clock\n");
 
-		/* Only enable writing if we have SoC data. */
-		if (priv->soc_data)
+		/* Only enable writing if we have SoC data and a valid clock */
+		if (priv->soc_data && priv->secclk)
 			econfig.reg_write = qfprom_reg_write;
 	}
 

-- 
2.42.0

