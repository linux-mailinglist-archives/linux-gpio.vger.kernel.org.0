Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E406DB3C3
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 20:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjDGS5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 14:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjDGS50 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 14:57:26 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50468CC08
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 11:55:30 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-942e6555947so191634866b.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2023 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680893685;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLEH83XXNRMPl5kMrw8aVzDT+hZSN/PNY73/GnyOeqk=;
        b=l5UoTNbSMqfbxeoW5NCP1+/VxMGqXTkAdt2vjrsqh4rkeToBxe3+SrY7ytA2JmNtM1
         TdmnZo+D9nX3rJbW6le3Kh6VZzaV44XXM6OZvDodwVCkBjLL2EBRH7COYnAFZSMzoqfI
         WHNCDZ8nd0v+UyUM1AmbVajXLGe5sYZfZDhEPcPIidM/8YotehEXXSgMKjrx5DiFBqnR
         EKVv1s9ZsMCf/axoQJWg0KqGZ33Upb1Q7DYcG4h5xgjt6r0YXSgig3lF3bo0sSz9Zv3/
         +2uayjvFYgIaTDloitgfiFiJdDgQvyqdyfXH6j+GkGc/Wo1auEKXl0eesjvVmYi0NR8P
         fxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680893685;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLEH83XXNRMPl5kMrw8aVzDT+hZSN/PNY73/GnyOeqk=;
        b=TgWDytvwqrsCqZDrBtnyHJyWu7+tOa278XiEsLDwmZ8K3QWv+3a6vwPORZwx6tadfj
         OG4V5krIM2pY4Wn3SP8jm+BmeUpDLk5eSUy+4OL6FhDarOSQlml+dQrpqNnGjIyzU4dp
         zl6FKOFlIo9VL4IMehbMUjrWDUmEAiBgMbtFPeqBwJzBFxXyfSUsGOdoTUgsOeP3jpdS
         KG10NFqyEKGehCnL6OTGut+a6h9iF0z6k11H06z7hg9viCBa5WbtgYBhIhmAjAlfamB1
         HSYb2htNnOTejsNrER3PG0R47Ceo+maL6awSwVvbB2cQvNOGvmGfR3I8r2wU/pRSClir
         NzyQ==
X-Gm-Message-State: AAQBX9dlMatGB0oCVZFn9AHS/177wL5Ijw18okqdlrjyBcd8CcTEBHrY
        lfy4XsBejxREjcyQNJGj/52YNA==
X-Google-Smtp-Source: AKy350bsb4EgRFg0VD/zTZuBYGAN7lsWhNaq1Fyx/DPmgf4Gv1kAyCr+yH/ok5KczBoN6ECeU939ZQ==
X-Received: by 2002:aa7:d654:0:b0:501:cf67:97f3 with SMTP id v20-20020aa7d654000000b00501cf6797f3mr3320971edr.25.1680893685131;
        Fri, 07 Apr 2023 11:54:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id b15-20020a50cccf000000b004c10b4f9ebesm2181248edj.15.2023.04.07.11.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 11:54:44 -0700 (PDT)
Message-ID: <574d3aa5-21f4-014a-8cc7-7549df59ff3c@linaro.org>
Date:   Fri, 7 Apr 2023 20:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/40] dt-bindings: pinctrl: qcom,ipq5332-tlmm: simplify
 with unevaluatedProperties
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230407184546.161168-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407184546.161168-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/04/2023 20:45, Krzysztof Kozlowski wrote:
> All Qualcomm SoC Top Level Mode Multiplexer pin controllers have similar
> capabilities regarding pin properties, thus we can just accept entire
> set provided by qcom,tlmm-common.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Linus,

If you prefer I can send all these to you in a pull after getting some acks.


Rob,

Feel free to ack once for all of them.

Best regards,
Krzysztof

