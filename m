Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D22155EF44
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 22:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiF1UV7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 16:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiF1UVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 16:21:35 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA21E3D1C2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 13:19:27 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q11so18702039oih.10
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkRz8Rnq3yhFECRhS1nf164or0yJxGWqdc2tgovxLIo=;
        b=NMuo+KsBpKzJ1Gt+q98zjHdXDZo/7DkTK8MRe2kl4U5qQp/E6w/A9RBJcUvh8IiPFh
         k2GyxaMtZAcMAnrLfQi6GkAjBbC4lYqoghcXQR7SQN879xYwGVQinDcakHvlNtKYEi4R
         cs0LvWUwkyUGTCT+Ufcm09f8aki3YGuJ8nlOu8A8FDZ7cznyokJmxDXExTJszfuhOM0Y
         UVI+VaQEuQaTm9aTMozQx9KzAVpHai+gn1JNpm//UwOgV1XvHQ245l+JrL+6hEmQ7ZQj
         BWQJkFrAYqo4i88Ybo+LTxsS0a/Ac51phRnL1srUu4Y1RbPjaH2qEBiYGk2J8CGrv5V6
         aPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkRz8Rnq3yhFECRhS1nf164or0yJxGWqdc2tgovxLIo=;
        b=sDET9jTUB9X57uamMFfJIYYutYzqhMhVvnd6xZtFDkGvQLPpSrKGLrYd0fCTOiSbvJ
         OXy4mQxBj7ZcWXGZC4Z9b98ZXZKaF9rEU1r+Jrf456egJ3JCRENxn44iKdFm1SLIoN6l
         ea8a87zx+ihGyyurvV5Qjz7oO5nXqqVQTbrVv7+9mD0BOndLUtBus9Itpoi2QLDkkf7g
         EaPphLHklsECd0+Q5HxEKsdY36ttrxsLDUONROGQNE+pgFB6aJFRIFDlWlt1kN8e6SSE
         pfafV5TALLLdlIJqWzhI8GMH+tUlq10c9vgEQY84kX/q0DMmyvHlPmXF5/C9gkwBA7xb
         cp/g==
X-Gm-Message-State: AJIora/5EWMimSJ7ppXcSC1fNqw/qm2roF8vLLtjajyAjCsPrnl6zMzW
        FTG3GT56D5G950JIaTVhhmZyZw==
X-Google-Smtp-Source: AGRyM1tIqhQQEM35OEHLzbmihKSybrUsVDPpBsHMeMSmgplZOks9t8lkFqkygzR0VXA2YzCnAXeb4g==
X-Received: by 2002:aca:786:0:b0:32e:3005:813a with SMTP id 128-20020aca0786000000b0032e3005813amr967896oih.135.1656447567277;
        Tue, 28 Jun 2022 13:19:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH 00/11] dt-bindings/pinctrl/arm: qcom: minor cleanups of QCOM PMIC pinctrl
Date:   Tue, 28 Jun 2022 15:18:59 -0500
Message-Id: <165644753307.10525.18010896416130543827.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 7 May 2022 21:49:02 +0200, Krzysztof Kozlowski wrote:
> The patches are independent, so they can be picked up as is.
> 
> Not really tested on hardware (except SDM845).
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[09/11] ARM: dts: qcom: align PMIC GPIO pin configuration with DT schema
        commit: 4fcdaf4b0320f93d0ccb4d36b795ed258fb07b27
[10/11] ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
        commit: dc590cdc31f636ea15658f1206c3e380a53fb78e
[11/11] ARM: dts: qcom: pmx65: add fallback compatible to PMIC GPIO
        commit: 255889f4baf51e887c83333d82ac8470a11246e4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
