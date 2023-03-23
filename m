Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33936C6EDD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 18:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjCWRbX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 13:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjCWRbV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 13:31:21 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4656D9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:10 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id le6so22962677plb.12
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km2gqXc7azHXISk3TRRkbz6777YLDRrwj5fuSfpq1q8=;
        b=KCgwX9Jxa6ZuTKmTith9SO5UOsRsmngKseZno4cqXEm7+jy1lVMNhTL1iOBxxM5TxK
         oYE8Dll9PNG+8RA0LbuHxpwQIZxHdl8kOBdP4qkOWRFfmZlXmgW7smhrcv73a8Vu18z4
         0zVIqv9teDevEYUSrhbLRlUA2va7Vj4PC4tN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km2gqXc7azHXISk3TRRkbz6777YLDRrwj5fuSfpq1q8=;
        b=qtgoduULLxDENR6HKdWYFR818RHiVuB5bNVtQp7Gqc9OGxQ/B4O5WIFrh9bgfzr9FY
         3NvoYneI90wuoR/r8MEcIqBVnt6PBlDkPdaiumpQk6gEJwkHRgKDyzaGyW+Vt1O5rgus
         xFj/vWWoUHRzn+nCtXFDUcF3+e8BRi/ryJrPuaEnsYZ1RIw4Uv5JPbzRTtQamoNzPPsO
         gTR3LQof+5dzaNVrh2++xeWZkh5WO+AY6cvEpmUYWBEPS2/Xvy0WQ/wh1ejz9c1z622H
         jtQxK2aQ1hb/OIJhNDEtL6BePyx9AvM68Iz6xfcpcuDL0FGU/3iag5asFzpx0SSHHPPp
         qMXg==
X-Gm-Message-State: AO0yUKWe2xEvcWc22cQxDhUcX6Nk27ob5Gdaupm8viZb9mEvUJhwnnYK
        fAg1s7tlaFfJ+EiS/OKaSbUbGw==
X-Google-Smtp-Source: AK7set/eq0TFdASOKnSDm1Sm/iWmOncE+NdY4v8Uy8PcDjyvmJd7KNfv2/GAbFmZOvVhygT3gxRmiQ==
X-Received: by 2002:a05:6a20:8b9c:b0:da:d9e7:9a5d with SMTP id m28-20020a056a208b9c00b000dad9e79a5dmr400673pzh.4.1679592669751;
        Thu, 23 Mar 2023 10:31:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:09 -0700 (PDT)
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
        Rajendra Nayak <rnayak@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] arm64: dts: sc7180: Rename qspi data12 as data23
Date:   Thu, 23 Mar 2023 10:30:05 -0700
Message-Id: <20230323102605.1.Ifc1b5be04653f4ab119698a5944bfecded2080d6@changeid>
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

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ebfa21e9ed8a..fe62ce516c4e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1540,7 +1540,7 @@ qspi_data01: qspi-data01-state {
 				function = "qspi_data";
 			};
 
-			qspi_data12: qspi-data12-state {
+			qspi_data23: qspi-data23-state {
 				pins = "gpio66", "gpio67";
 				function = "qspi_data";
 			};
-- 
2.40.0.348.gf938b09366-goog

