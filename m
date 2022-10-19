Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765BB6049CD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiJSOxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 10:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiJSOwz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 10:52:55 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944BF31F93
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:41 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id f8so10819430qkg.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1Rxcqt5s568yziVlU0XRQaT8u/I+oQQxrkNurWL41M=;
        b=Dwo+B1hGa4ZK2akbMphNNjAy9mGBOXDyvAZaw7+4RPgqmTIyEoAWVu9SWZ5g4kvPir
         SvuWv9RIWISjZt7WmMHhp0/DQUj3BCjrMDzaH7oA4NKdRuBOBX/LRX/49JXw+PK9X10I
         vBH77GjJuN/Goqlr4VXsvGxsyKNsuqAAO2ntM2tkTW+NYLiV1k3yug8i9992nk3CsC3o
         c/QAeFuk8wB9w61miM3LbCR9q9qS40HP4kxC0wRA4/54cKbnQSsLnVJHecv2QbHRBC11
         +PJeJOEW5hgWu9KnUX3H6n1jDCXOIbBLyy8XgO2VNCoRbfxraiaLhHPYID3NuPiiZAXb
         UBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1Rxcqt5s568yziVlU0XRQaT8u/I+oQQxrkNurWL41M=;
        b=gmuFYO/GbCtakclyo2WexBHmmPnfw1A51JR+tm8w6MhxiqFOZVURPFGv0IK5j6E/lX
         45ca8JpJ+tuhjTO0o+ocAUnO59M7MRAWHFKp/KbPJb5Gnk8jlhHt7fdPYX54G30NHSAR
         93h6OCqxJpta+/C+PREqVzSbV+Fz52xfD9p3BvuBCMvmOvp9jA15su2aG3nQ2fB+KFch
         F/7Z8U7+ZPW3WjB2WngwyNxcY7wbsTxjVw5p0t3TgZmGQNBbFPObNMVc8OgXu61QeTsB
         3BCy0fFrwI6b1OPRLf3gxg8BMVH8aDOBa+XknMyl+pf4ujkJrMISM2zagj1+w+Q5SJzg
         vJfg==
X-Gm-Message-State: ACrzQf3YdAoH2QmNw77yvgxjZNGns9AMvjY0KWo7bC/xm6X2ywDf4qLV
        +hLfZMFS724MQXlB900z28bWZQ==
X-Google-Smtp-Source: AMsMyM6nu23tPUohQfvfP4zOoR0Cof1uhO2GBx8FxTy+573PshzSHcwH8R6il8IRB87RmbwUOTnFig==
X-Received: by 2002:a05:620a:19a2:b0:6ee:b516:d5e with SMTP id bm34-20020a05620a19a200b006eeb5160d5emr5793507qkb.394.1666190679890;
        Wed, 19 Oct 2022 07:44:39 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm5211917qko.16.2022.10.19.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:44:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,sm8150: convert to dtschema
Date:   Wed, 19 Oct 2022 10:44:31 -0400
Message-Id: <166619067067.168589.1250164140790540799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018160128.51851-1-krzysztof.kozlowski@linaro.org>
References: <20221018160128.51851-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 18 Oct 2022 12:01:28 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm SM8150 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom,sm8150: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/49b02b604fa6c4f27fd8c31261aa21ff957a8a5f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
