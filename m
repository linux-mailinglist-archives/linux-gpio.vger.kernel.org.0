Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 395AC601899
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbiJQUIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiJQUI3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:08:29 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B717A752
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:27 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 8so7410640qka.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTL1BxGy/77oLNw9LZXWJYXPJmMsx/7BTV4adt1LD5w=;
        b=rQpkC4rj+x4gqRTE4kHHqQIoZUdHrhNriA9B0Abp6Ve7eazGJH0q9k1uD+rj4bLKB0
         a9vkC8Dh0VajpDDAABmRE/rck4eb2AoL6aTI7OQzs8+/+cuqgpk5azmCzuI7Q0N3jSR8
         +WmzhAbL0sbHcAh3ozYptRfO5t4eCQFY2HCwnBQ8TFtTG2QkRZaGKYnSLGZLuabj1rCi
         Xj+BDwdmISzva2uxZhtBg4USq4HKmMYOzQ85H2B1myLLt5zJxMr72byZDZKIcfWKQ64v
         zxXhnEfUcaM7EG5UG4NG8T4DDDvtIVsRW8UTPg5fB7FYN0DEEXi77oOYWehFe+eSipSU
         C+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTL1BxGy/77oLNw9LZXWJYXPJmMsx/7BTV4adt1LD5w=;
        b=IelqrfUtjfaqVYYR6gkbdWeLqt/NCRgYOMf4yIdD0Uvtzgta7FxPsV7mtumYDAGk8O
         uKF3rIafLbAjykOaMhLU8xTIAGn48TOh7EIsZRO+5LUeRuO6z/AtXvQTLqUOF6eW8Bi4
         +GsI6ji5nKQlttY/B76pESXMrdmgXSdSqjuLealrghOxTohCpIoDN9wq/KPoTZSm9ArI
         oHOdV7V9ACBuo2YKLtOSPdHCrp+puEgB92qQVL/FZMAG8BkEncbEH2kbQm6eabpgVk7F
         9xjAEtDsP0rNhaM7HX3Nvp969Buf2tZZ6GeVOdNjyz+g+U+T/aNlLGm9Odt8AL7S0itR
         XQww==
X-Gm-Message-State: ACrzQf1a62gDr3BfR7HdVYZD9f548V1ZRkx+dBUF+k3LWUcwp5kmtmGd
        1mHaumK8k3GGMoXK7wa3AQbbpQ==
X-Google-Smtp-Source: AMsMyM41jgFIN69m1J6gxCPiUuEylfoCY/ez8jx80ciT8wHKHlrPJEh04HBqGq5w42fcKUYvgZunig==
X-Received: by 2002:a05:620a:2844:b0:6b8:5f52:a6b5 with SMTP id h4-20020a05620a284400b006b85f52a6b5mr9032665qkp.351.1666037307168;
        Mon, 17 Oct 2022 13:08:27 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 09/12] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: fix matching pin config
Date:   Mon, 17 Oct 2022 16:07:44 -0400
Message-Id: <166603728600.4991.3758596435793766061.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-10-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org> <20220927153429.55365-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 27 Sep 2022 17:34:26 +0200, Krzysztof Kozlowski wrote:
> The LPASS pin controller follows generic pin-controller bindings, so
> just like TLMM, should have subnodes with '-state' and '-pins'.
> 
>   qcom/qrb5165-rb5.dtb: pinctrl@33c0000: wsa-swr-active-pins: 'pins' is a required property
> 
> 

Applied, thanks!

[09/12] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/351123e62b793e92f6348dd27a03cc035c5a3b6d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
