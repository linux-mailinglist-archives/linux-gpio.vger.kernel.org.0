Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885AE6C6EE5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 18:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjCWRb0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 13:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjCWRbV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 13:31:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2A63C0C
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:12 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id u20so13272481pfk.12
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHcHlbRFQY1a3JxFlrTE/SnrAnzBxSKk8fubRmial5c=;
        b=fa1AbAuC4lMywoWwSoxWcDq285CBpRd8wXgmJnExNcYHfkUP1ByNGsnGs2A+nRC58g
         IhBPVm84vP7b9SjRBDVPetgiMJK3hzuEBeEk/aTsLjmFl1GMxcmBJTPfNls0eXD6mO38
         Ot9J34CJK0XUpgnnWoc0fCWj8B4ePd39cTIuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHcHlbRFQY1a3JxFlrTE/SnrAnzBxSKk8fubRmial5c=;
        b=2RraI8qfOIAg4RnptsJvAaqsZz+h5iOWYgTgI7lNu3Ku9cYfRI75du2IBCBvnf6OEA
         i3OIAs8B2akbOyFIiVkP3tLoRas8GyJr/bOidjvKCTBt6qDkZRiJAvWZrVqAw5flO24U
         Gt0/P3fSJfMSSqGXdAhVa/FMB7U4gU0CW+Qpupimn3lVaSO8ZcBkZdVI9wt/hGxscz/G
         B2IJkQmUfFU97mZfRrt+0O0aCxLT3ReRuRi/hEzL9zozSeOlI+/pTn3oMyurnq1B1+o7
         UyTX1h0R7LAQFWf4jleTCA7HPFv3vCBnCHHQTKwcxuoR0PIIKAwjKaTV2Hp30APuIxHz
         uPPA==
X-Gm-Message-State: AAQBX9c5LBgGqiH1tUSBgXnsexWKQmtazdn40Uqal3saCj2WmEMpn7TK
        QUcqsBm4nmYaAEqTvJQxDrN8BQ==
X-Google-Smtp-Source: AKy350YRQbAsTlxP8jPotY6cwhOcbMsZEQmWDnFz9TlVTur3weEs/Ki80n/8ugba1vq19+wsolyKlQ==
X-Received: by 2002:aa7:94ba:0:b0:627:f756:b206 with SMTP id a26-20020aa794ba000000b00627f756b206mr260563pfl.1.1679592671782;
        Thu, 23 Mar 2023 10:31:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:11 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] arm64: dts: sc7280: Rename qspi data12 as data23
Date:   Thu, 23 Mar 2023 10:30:06 -0700
Message-Id: <20230323102605.2.I4043491bb24b1e92267c5033d76cdb0fe60934da@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230323173019.3706069-1-dianders@chromium.org>
References: <20230323173019.3706069-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are 4 qspi data pins: data0, data1, data2, and data3. Currently
we have a shared pin state for data0 and data1 (2 lane config) and a
pin state for data2 and data3 (you'd enable both this and the 2 lane
state for 4 lanes). The second state is obviously misnamed. Fix it.

Fixes: 7720ea001b52 ("arm64: dts: qcom: sc7280: Add QSPI node")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index bdcb74925313..71e2e51c7c7f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4342,7 +4342,7 @@ qspi_data01: qspi-data01-state {
 				function = "qspi_data";
 			};
 
-			qspi_data12: qspi-data12-state {
+			qspi_data23: qspi-data23-state {
 				pins = "gpio16", "gpio17";
 				function = "qspi_data";
 			};
-- 
2.40.0.348.gf938b09366-goog

