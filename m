Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B0F689FAC
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 17:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjBCQvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 11:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbjBCQvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 11:51:18 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2094CA87BF
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 08:51:04 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6439595wmb.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Feb 2023 08:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4li/9i3u9UyzclsczzklQ2mXGRj8GCSwNuG6wd4jb8=;
        b=FemXfcjSEPTjMXFHEwf0w3C8Sp/4HZdoj3bk3luyYFWbMxGbCQSBPcZadlCJZ3HpwA
         3TdETrMfiOrm8y85osfr7ZWNZmKgsCS5yQUdsbZDnM72DSKY/KSTlkCY7jfcir5sqA+A
         6cFZPm1WEFB42skI4mmJdgc7+L7f80oBSnzPVFEU0OCyEEImHqjE7ncqzpIHboX49gtg
         4aaGUwjv6OaoniN6pMYLe4D4OAEp/IeSTexs85FfkwAIHcXu2yhjx1CXmmBLzPoOKfkq
         dC7HZmCUp5LfaGrZ6Ow0M5zWXBUHZSSkcma116hXQj6NNBItWC3ASP4sEOhKS0dQT1oe
         l3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4li/9i3u9UyzclsczzklQ2mXGRj8GCSwNuG6wd4jb8=;
        b=GCMM3ASOcGnLbwHvupQRXiCz/IQbUqYYYsMnxtCCZwbkrHFJbuAvDLzoTsSYP26TRG
         jRv+zc+QCKHXEj01WJ4CiD4sx0zXHL+wVdGA/YLW+F6nBFnOyI1vYO12B3joCti9zYAa
         PcKzJMHIKQDWaI2bnSM1DvDKFmtpTy48g4Q9dYXwt7plVbjg8WiCJjBE5fCRd8W22VN3
         kdYGvuwRjQUzb6NPofYqjPNN7vdig/qoHwgXchv2z98MJ8ne3y/1sHTTlDx7gI7WwLKX
         y8lDObh5kqYnFSfJqtfrsDFuLTI1FffxssMnEnkPgsV3KVGm3CrMZ38lGEcvXNLVPY5O
         14fA==
X-Gm-Message-State: AO0yUKX0jh0iVnvJBmqNxtk61+wnMao7k5hbMUrjYZVkOGwvPyBwWpRI
        4izZWEd2p1ZqyXrfjW1z7o/S3Q==
X-Google-Smtp-Source: AK7set/tt1XH/V0f9ArX9C9Da5CC4MinClm94GGUoWZMvguZDBclGzYIm4l1ViWO++NCnWptamZqcA==
X-Received: by 2002:a05:600c:3b1e:b0:3db:1200:996e with SMTP id m30-20020a05600c3b1e00b003db1200996emr10513354wms.16.1675443062712;
        Fri, 03 Feb 2023 08:51:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c00c100b003a3442f1229sm8174654wmm.29.2023.02.03.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:51:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: sm8450-lpass-lpi: correct swr_rx_data group
Date:   Fri,  3 Feb 2023 17:50:54 +0100
Message-Id: <20230203165054.390762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to hardware programming guide, the swr_rx_data pin group has
only two pins (GPIO5 and GPIO6).  This is also visible in "struct
sm8450_groups" in the driver - GPIO15 does not have swr_rx_data
function.

Fixes: ec1652fc4d56 ("pinctrl: qcom: Add sm8450 lpass lpi pinctrl driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index c3c8c34148f1..e22d03ce292e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -105,7 +105,7 @@ static const struct pinctrl_pin_desc sm8450_lpi_pins[] = {
 static const char * const swr_tx_clk_groups[] = { "gpio0" };
 static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
 static const char * const swr_rx_clk_groups[] = { "gpio3" };
-static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5", "gpio15" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
 static const char * const dmic1_clk_groups[] = { "gpio6" };
 static const char * const dmic1_data_groups[] = { "gpio7" };
 static const char * const dmic2_clk_groups[] = { "gpio8" };
-- 
2.34.1

