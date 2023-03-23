Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356B96C6EE7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 18:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbjCWRb1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 13:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjCWRbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 13:31:22 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D772798D
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id d13so22158011pjh.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679592673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/zeFLtT5svFzGSOkobW0E5oP7EbYRFgi9o291n1fds=;
        b=boK1pbwfD/kYb4hq6aRa2l1YdEoUbvsvhKq6ynUQNzmwi7Jv/PhGDBu5Bx1f6HvNmn
         +khbFlnkQMzS1vnj/PR7JEto7gmj8WiTli3UEBDkSnzmGBO4IjkpU4y2asHr8V/a7iDS
         94iajP4/4tBFsAcYJKwUUfFsYUkBQkDxkA1Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679592673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/zeFLtT5svFzGSOkobW0E5oP7EbYRFgi9o291n1fds=;
        b=HnNbGs+Ox1csCOuWy/LMHDzgWc+bycg1L4tAuIuTJkeLWYmNfF0Eqho1qYMFpcQGHB
         WpK5mVMYenxt+QK6lRQv7slrVoacmfRseAbQrJ3Q5S3oHK720hQEOMu0bpqYwM0nX1gV
         NSHR0iPAk7p+7r90u3Q8mYVsg6qCKRhXuG7bxPHOvioSO3XRfJU3rKw18D4O1IF9WFg9
         Y/AUk5gpmg9EpQnWfk74PyP5UOeWvAXKStSIUXQbeV1UTE1Fkyi0+kr/2z3B0dNAwQ60
         ylcFxAkjIv30MxmntH+seoQISYHPaAlQkq6S0j70UVJ3EOQPSHV+HQT2ydX2lyrL8pki
         EncQ==
X-Gm-Message-State: AO0yUKWf2fJY9hp8OfB/qm6mmYwM8MX8/uR4Xq29xK7zsTjUVlu65+Wk
        3zKV57GstunIuQvrPQdnRDwhBw==
X-Google-Smtp-Source: AK7set8xZYhtJRYs2MfbgIfoHpLj82VbbGDiATnaAmjPI0WzHRRjr0Glpcmwp9jUtedg4qA792B6KQ==
X-Received: by 2002:a05:6a20:4d92:b0:da:aaec:9455 with SMTP id gj18-20020a056a204d9200b000daaaec9455mr304246pzb.43.1679592673682;
        Thu, 23 Mar 2023 10:31:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id x13-20020a62fb0d000000b0061a6f4c1b2bsm12613546pfm.171.2023.03.23.10.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:31:13 -0700 (PDT)
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
Subject: [PATCH 03/14] arm64: dts: sdm845: Rename qspi data12 as data23
Date:   Thu, 23 Mar 2023 10:30:07 -0700
Message-Id: <20230323102605.3.I88528d037b7fda4e53a40f661be5ac61628691cd@changeid>
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

Fixes: e1ce853932b7 ("arm64: dts: qcom: sdm845: Add qspi (quad SPI) node")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 479859bd8ab3..aafc7cc7edd8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2763,7 +2763,7 @@ qspi_data01: qspi-data01-state {
 				function = "qspi_data";
 			};
 
-			qspi_data12: qspi-data12-state {
+			qspi_data23: qspi-data23-state {
 				pins = "gpio93", "gpio94";
 				function = "qspi_data";
 			};
-- 
2.40.0.348.gf938b09366-goog

