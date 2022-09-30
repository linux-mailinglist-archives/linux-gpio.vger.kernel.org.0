Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98045F127F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 21:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbiI3TaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 15:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiI3TaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 15:30:07 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A81F2CDE5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 12:30:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o7so1066535lfk.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gFj0tarFqSx3s6Y+E4chkx9Vjwt5TrnQF9RepFZJY9I=;
        b=C6AyQ7gTgwXMb7vpMFSLxDoQ7dT0yGihDiJvdVkQMrHomBADCH2f09c5uPF8N4PheM
         Cd/mrYpt+PiJhOdXT52t0mHgNxGKGaYsVR3QhkI+6ZFQqc5pl/9m7KaaN9khZQAqgVA3
         D4vBWou6ZPlPONNzzJwm5Zy58qteiv63vSae8uXy/TuoJv9xxNOjJKZmgCjz3XzCpHEe
         VmcbYQOY5NncF+p0eBhLdZWBY5ILK4S2F3pyfDcSOZ8uaYiT1AUwFmB8FfvuIy/Eu9P6
         u+2YLeb7kv2gvmV/h5rIXaFJBGVcTjnSNjX+cTjI7ifKMp14u5xkYfc0nYSr1s2em3uR
         UYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gFj0tarFqSx3s6Y+E4chkx9Vjwt5TrnQF9RepFZJY9I=;
        b=kNUEmpauhs2UPmHqe052E0ETwAMeTZylbyty2LOtU6iwv6xiH+oMGeoNjzvkro+jZ8
         L9sr+OUgvKlRnmSw1KsiIkd/+lX8c5QH/Qt9eLkFIURoC67HunZig41PpKhKpFFBaZs1
         NdYXxg2LuZ6zJGKEl6Ma6bABzK0LKUKxAUHATygHZ58mhevB1nqZ5yV4cgPuJA7/HPBV
         FhsPUhkdyVgaw2+8T0Q+//nVywdljjhFIkMD7bV84395acY+sdOM3VkKV88yNEpxu9JI
         TJOvtWniqns98rtIYV6VI3D4/co8ruKh6qI2jpcyF6T7YJBTTi0sBDUjHhOWo/UZ5bse
         WlcQ==
X-Gm-Message-State: ACrzQf323cMl5P9sUB1zcaC1gdFxdSuKVXRTmbW8tNU7VSZ5/CedyhFd
        EWApbmjs88CiL0HXlaJXCWJWuQ==
X-Google-Smtp-Source: AMsMyM40oDSiQFSaLiDzVJGfhZ8/rhd48b/8s+uF5OGlxfeQTff+YPFcivGWEa/QT/fvxAnHXJQ57A==
X-Received: by 2002:a05:6512:ac1:b0:491:571c:3ef7 with SMTP id n1-20020a0565120ac100b00491571c3ef7mr3714287lfu.176.1664566199347;
        Fri, 30 Sep 2022 12:29:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:29:58 -0700 (PDT)
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
Subject: [PATCH v2 02/16] arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
Date:   Fri, 30 Sep 2022 21:29:40 +0200
Message-Id: <20220930192954.242546-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The property to disable bias is "bias-disable".

Fixes: e76c7e1f15fe ("arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 72162852fae7..601a21c381f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -613,7 +613,7 @@ ts_int_default: ts-int-default-state {
 		pins = "gpio39";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disabled;
+		bias-disable;
 		input-enable;
 	};
 
-- 
2.34.1

