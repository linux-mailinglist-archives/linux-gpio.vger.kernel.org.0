Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B725FBAFD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 21:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbiJKTEu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 15:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJKTEp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 15:04:45 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2F4101E
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 12:04:40 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id t25so2051634qkm.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE8hzsbFiS2HpDnMdFbB33qJkgqzciTCpdBEF4m3sf8=;
        b=axgcvptjFMOqgyJ2pu4sacBWLXitKO/idWP7efM5tinvkUnphIU/XUEKYyHNk8nZa1
         TwT6XOQwR4i0oFJqE7J830LAbvYi+s3jKh94Spe9OS2fBaLUxhIIikdoQaz4bq5dFdZ9
         x3ZLuJX7W4ZwQHVvL+kiPDGYSxvlVDmbXOmDPtkA7HoADfUaA0BnHTqpLBU6SX0khkE8
         nd+e6JgnajRgjLeGeb2zOUlUV19FHq2Z1E4rsCa8ZNgG42znto4MiaikaNtW/RmZPqpk
         HGt2/Oup3NnJuf5WENF2e6Ct+eY4/mzKF1RA4fyBFImqN5/xUMPq0LCSzeMJep0r+jDO
         xwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE8hzsbFiS2HpDnMdFbB33qJkgqzciTCpdBEF4m3sf8=;
        b=7vtwogzkat4RWFcrleLLyJosrLYJj8yiwUlyVIZTmiUsOXDDNZrYm5RWCWlBSjUV5h
         D6237+X0Tzpx2FW57UaFiNAUazTo2DD9buPJHqBlSXhIm5GrrFeYP7krTVUiqLX3QKSF
         HvuJQU5chjXiyTjicIPyqQQOd6umVOFvCWrehvniMgPET7bbuyuAGDkwRKcnGaCa6lPR
         iCryr33twiEfWaMByGzadbEViWs0V9qJJ5Ddjvcc0wfXgkoprJOO//o814VLuhaTwyaf
         B90eS1JDOD82t/VLXmsemjA7WNGVVtWWS9HnJHJF19tm3IsQ24zcTIAykXX2Hxx4+e5x
         xXpA==
X-Gm-Message-State: ACrzQf3xBGO05sx+c/wVPK6e4cuZypp4oddAtIFJ065SYiye1YyV99xv
        kvqXxK/YxFq/WD5XEOsILwRuGw==
X-Google-Smtp-Source: AMsMyM4Z7vMjlNx9jTXMTsN4gN03gCG9IZkoyh5X129mF2Is1TZnRByfl/shy2INDW4wkiSz8BWRxg==
X-Received: by 2002:a05:620a:4304:b0:6d4:56aa:430e with SMTP id u4-20020a05620a430400b006d456aa430emr18000023qko.483.1665515078656;
        Tue, 11 Oct 2022 12:04:38 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14527185qkn.37.2022.10.11.12.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 12:04:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sdm630: correct I2C8 pin functions
Date:   Tue, 11 Oct 2022 15:02:29 -0400
Message-Id: <20221011190231.76784-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011190231.76784-1-krzysztof.kozlowski@linaro.org>
References: <20221011190231.76784-1-krzysztof.kozlowski@linaro.org>
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

The I2C8 pins are split into i2c8_a (GPIO30 and GPIO31) and i2c8_b
(GPIO44 and GPIO52).  Correct the name of function for I2C8 pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v1:
1. Add tags.
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index bc7c341e793c..796c19b9b2eb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -885,14 +885,14 @@ i2c7_sleep: i2c7-sleep {
 
 			i2c8_default: i2c8-default {
 				pins = "gpio30", "gpio31";
-				function = "blsp_i2c8";
+				function = "blsp_i2c8_a";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c8_sleep: i2c8-sleep {
 				pins = "gpio30", "gpio31";
-				function = "blsp_i2c8";
+				function = "blsp_i2c8_a";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
-- 
2.34.1

