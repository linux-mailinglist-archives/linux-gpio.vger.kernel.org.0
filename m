Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305106C6F17
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 18:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjCWRcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 13:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbjCWRbu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 13:31:50 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461993646A
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:32 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id a16so17776121pjs.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc1zQxQOlxvSPv0A2NTnsyCSg5q98+XxyGONS3dAKvA=;
        b=clWzYxFdbsjAMyeObdN7chgEUWdefpw8mMcFLIi5kA9IjVTr+S1coqTXXi0/7EQrwB
         kcu6xEE7wEMWUpgG3Dfkhz1MOlShemHzO13U4P4/GERa5IP3Dnr7OAFJmIqSaBdTd8VV
         5Uor4aiKQsUtBQvZ/NclDLfD3Rx/Ip4/Gbj38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dc1zQxQOlxvSPv0A2NTnsyCSg5q98+XxyGONS3dAKvA=;
        b=WVzhDv1evDWnkN0fvY/pOox4pSokwb1ZPD4fRj/HQVwgaTzYq7XB8iaxqVwr4PmtNm
         IY9NJiRTwn/kLGUeOHUzjxUXgyuN7rRyAkMzKzNnlc4JuTCoX0g3HQtZW76XhJy+LZuM
         v2gVwRQZuEhvt7nWzp6Xq/0J4Hs5IDgfa+1oxR5YAZ8uYZ7zjiJqBwfjDvF7vvQTUGtT
         GTRkFAZnAwhrvUvx+MceanoIIhIcRaLDMUpclShLDTJEVY/JmKcWXDkKhxKc+F8L91YX
         OCK5euvWKUA8xKjB/L5Z/INSZPBFRCAEUKyCXecsckxR4oi1lfx3YPPnRWvE8Lp+fZuR
         cZcg==
X-Gm-Message-State: AO0yUKXKwYtQMxdNkGQqUOecTOOWQOhZUEzPcgdIrEtg8DriSYGEtf5b
        UVARLOcprgxNlAa9j9lIHbDdTA==
X-Google-Smtp-Source: AK7set8VWWD0uSxldfkCPMuvTPMAIF2F+8xHhK+xQgBVhEpb3rBHAYLNPfuyYRJXFm0dT4rVZLHsbQ==
X-Received: by 2002:a05:6a20:c109:b0:d8:997f:b21c with SMTP id bh9-20020a056a20c10900b000d8997fb21cmr309546pzb.27.1679592691735;
        Thu, 23 Mar 2023 10:31:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:31 -0700 (PDT)
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
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] arm64: dts: qcom: sc7280: Remove superfluous "input-enable"s from idp-ec-h1
Date:   Thu, 23 Mar 2023 10:30:14 -0700
Message-Id: <20230323102605.10.I1343c20f4aaac8e2c1918b756f7ed66f6ceace9c@changeid>
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

As talked about in the patch ("dt-bindings: pinctrl: qcom: tlmm should
use output-disable, not input-enable"), using "input-enable" in
pinctrl states for Qualcomm TLMM pinctrl devices was either
superfluous or there to disable a pin's output.

Looking at the sc7280-idp-ec-h1.dtsi file:
* ap_ec_int_l, h1_ap_int_odl: Superfluous. The pins will be configured
  as inputs automatically by the Linux GPIO subsystem (presumably the
  reference for other OSes using these device trees).

That means that in none of the cases for sc7280-idp-ec-h1.dtsi did we
need to change "input-enable" to "output-disable" and we can just
remove these superfluous properties.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
index 3cfeb118d379..ebae545c587c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
@@ -82,14 +82,12 @@ &tlmm {
 	ap_ec_int_l: ap-ec-int-l-state {
 		pins = "gpio18";
 		function = "gpio";
-		input-enable;
 		bias-pull-up;
 	};
 
 	h1_ap_int_odl: h1-ap-int-odl-state {
 		pins = "gpio104";
 		function = "gpio";
-		input-enable;
 		bias-pull-up;
 	};
 
-- 
2.40.0.348.gf938b09366-goog

