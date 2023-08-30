Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E65C78DD2E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Aug 2023 20:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243015AbjH3SsQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 14:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242924AbjH3J6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 05:58:53 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C9A1BB
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso577864266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389527; x=1693994327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8zevXRSNaiKUo9Os5nQfhkBpmvVMqAujkMCK+CVjDY=;
        b=tZVG3LNBI9JP9Yakvkjv3Z78A6Q2LhTmRA5MbC76asj6/p745rYWXFcmDNWpENgxFK
         2YhvVC58Nj5qrM0zsDzGSvulNJD9niv2/hgiaK274rZawvZ96PqfiyH5KhNke3jzXV0E
         lIswS9hJNYtSfj11Z3jk3wqoFN9T4pU4CJ9px6ixcqpzXwmGnWDnyjk/N06UqSzU+/YM
         8lJJ5xk6RjzMc5by5tGSPzBBbiLtl2Y+dwKlGPSkegWhElUkKHY69VVD9cGS8gXsOill
         oi8uqqWh6z6+AEMIc6KXlpDsZLpEX1zRx18zzImvIpbrKbO4KtN0FDh4bTzr7PNUVUHj
         CsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389527; x=1693994327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8zevXRSNaiKUo9Os5nQfhkBpmvVMqAujkMCK+CVjDY=;
        b=O+P2vy5l5etxdzTxiS8r6shzZougUdS02iFQz71fr3lPcAaz6JnrBANMl5ogFgVEFa
         YqzdwI9pvKN+joGaHnH0xBHzyuDxCfGq8Eet9/j4hjG91iQlkm/Ii2y4qkk2c8na9k1X
         EPVIbpSWwAlQDLnxNYS5PnskTlLHuYLeki3TJSglmKn0OsTzDMjuHixS2Kqu4ww6xjoa
         h2ADQsMdw60egeuF06gbcqxyNAPGd8IhK608M0fxTyI/F8/Vye1JjAOt6sqh8fdBiIlW
         89I8jQdpgap0th3YGDbXDxE/T1st8HsA7gw6FTNePpfiGyNgFtKeePIufNA5gutQue0/
         zpiA==
X-Gm-Message-State: AOJu0YzG/5RKdsY7e0okWnPzKCVxAUr0bEqD4J6plL3epM6E71eCEpDg
        U+JC8k58nnkJegm5SqC5PiakdQ==
X-Google-Smtp-Source: AGHT+IGIItY/qwJX9U0CjB5BG63tTG4RhBnPNl0Zyu8WX4cT11uTgHliy+JPSD26Sm2+/I7M8qxJdQ==
X-Received: by 2002:a17:907:a07c:b0:9a5:846d:d829 with SMTP id ia28-20020a170907a07c00b009a5846dd829mr1285814ejc.18.1693389527101;
        Wed, 30 Aug 2023 02:58:47 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:46 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:28 +0200
Subject: [PATCH 03/11] arm64: dts: qcom: sc7280: Move qfprom clock to
 chrome-common
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-3-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
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

On non-ChromeOS boards the clock cannot be touched, so move it in the
chrome-common dtsi which is the only place where it's needed.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 8eb30aa226a2..6cfcec1eabd9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -59,6 +59,11 @@ &pmk8350_pon {
 	status = "disabled";
 };
 
+&qfprom {
+	clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+	clock-names = "core";
+};
+
 /*
  * Chrome designs always boot from SPI flash hooked up to the qspi.
  *
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 98a8d627a348..5c78038369fd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -897,8 +897,6 @@ qfprom: efuse@784000 {
 			      <0 0x00780000 0 0xa20>,
 			      <0 0x00782000 0 0x120>,
 			      <0 0x00786000 0 0x1fff>;
-			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
-			clock-names = "core";
 			power-domains = <&rpmhpd SC7280_MX>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.42.0

