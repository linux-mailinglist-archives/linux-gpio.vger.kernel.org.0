Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF52E7CE0AA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 17:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjJRPE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 11:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJRPE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 11:04:28 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB40AB
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 08:04:26 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a2536adaf3so93236967b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697641466; x=1698246266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9GYwwthR37OzH1RslWzFkCOD4tUhZyxxnl2voBYq0w=;
        b=M8CqiKxN0LSOkdXcBt+PjanKo4A2+IJnwQYrSYk374awZ7ziK+VM1ykBylSsKBdmiI
         T9mtIlaZwgbHAhIyhDxag6GBy6Q2xYVMv1TiWz+mwZ1FyghPTWsyuDmYJojQ/5PQxlj1
         74PGDsd/kx3c0ihsRC9y8DtcfCbjh72TQkCgUJn3zgSfvMcs59HeFAPexSrOryKcarp5
         yifxu/PKf6DMU4bJcc//ECb8SocKEiOMg5vqm3eqet6jlb+tWAMtn3gU4KxiaP2ba2aD
         bW/+dT6U4Fo3Q5FZ7ZnqOZnEcrzNmc5BAAL4ebJSq0iC8RaVIZyNkr9NxLybMOfb58O6
         Vl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697641466; x=1698246266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9GYwwthR37OzH1RslWzFkCOD4tUhZyxxnl2voBYq0w=;
        b=lUUAFa/0YnYIX03RYGmy/mkJmMiquOXdp//BcPZFq2G+zwpqHOyuRxWT3bQ/ZOryVj
         XJiIGZoh0Fhloct3FJmZmRlP6QrrLDhjAjblSz4eGLj6lcOotGvWrXS6FLoN6FArr2Tu
         TWC7R7w1mPg5Q4b19arny+PnAR1Gjc5XzKZFPz5a4b9RI1vmhDAqGu3fFfbmRVZQV3RR
         WKk84oxU6Kr6517X9A8Dtj6OgJjqK2sjIccdDQlplODtl9DXIpYO9qmSgurIHnUjKFzw
         hc768SVhLxd51uCBIb/o17UqsIFAuEUOFNAZMCLXCmdEbJNAQSLTGz0JluoajPRpELzn
         ZAcg==
X-Gm-Message-State: AOJu0YwEY2bWSWFfJSu5RJxsDW+byMhnEoML59C6pgnmFVcqAKKfudYJ
        GqTOFNZh4nniyhoa0CUroDaii4VUdfT6JfTLjEH5SA==
X-Google-Smtp-Source: AGHT+IG0MYE+W6gKRDhqufCOvzZlId8cAWJbd8HgweD1sVQ532lmNIhX89oHkxtz+UYoi173UzKYxI5bfYwzwiTJeD4=
X-Received: by 2002:a81:8407:0:b0:5a7:a81d:e410 with SMTP id
 u7-20020a818407000000b005a7a81de410mr6147875ywf.18.1697641466108; Wed, 18 Oct
 2023 08:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231018145750.429385-1-krzysztof.kozlowski@linaro.org>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 18 Oct 2023 17:04:15 +0200
Message-ID: <CACMJSev5ftXy0di+knVmsMRUEtYnR8A72yzfrvf83JTyxWehZw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sa8775p-tlmm: add missing wakeup-parent
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 18 Oct 2023 at 16:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add missing wakeup-parent property, already used by DTS to indicate that
> pins are wakeup capable:
>
>   sa8775p-ride.dtb: pinctrl@f000000: 'wakeup-parent' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> index e119a226a4b1..2173c5255638 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> @@ -28,6 +28,7 @@ properties:
>    gpio-controller: true
>    "#gpio-cells": true
>    gpio-ranges: true
> +  wakeup-parent: true
>
>    gpio-reserved-ranges:
>      minItems: 1
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
