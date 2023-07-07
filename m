Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027C574AB2C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jul 2023 08:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbjGGGfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jul 2023 02:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjGGGe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2023 02:34:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34B01FFB
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jul 2023 23:34:30 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-993d1f899d7so23236266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jul 2023 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688711669; x=1691303669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lo9Ybkp8C7hyjxxxAW7ckg0KRs9g3goLaPeETqx3qFc=;
        b=roioZ0eYvwTT7tPzv5TyxFc/Ekjoo/kOdQ8i6mdJzkYNlB7+eY0d2uGCC/Hse9ujFg
         5PMz/RRUmb2OORgU9ftSLxbqkbQbX8WHM0IdjreZyMNIz4u+g06CdggLv4FZvhVf9UDz
         7Zsy19b8HgsiW/qYZ1aoa9xeRnBGMDYGT+E+t8NzzW3fYB4GhPEeSz10rRCakKZtPwqQ
         eRsCfqvgQmK00hC+hAXc1HmwnxuNs61Epuegn9DMTBSeArGqbF4UcL4N+jOhb0A0j73c
         3K9xcAriOUVxYdhpPCZyR/giaoafNyCWEN8q/Gvgcyz8c1xq7lA4hV+RzDIPb2dCZv2f
         13sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688711669; x=1691303669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lo9Ybkp8C7hyjxxxAW7ckg0KRs9g3goLaPeETqx3qFc=;
        b=VFESHfiryJmtvt6bCU5b2YwZOTUgzO22TGs3kMwziPBZdJC/2eNr+5ZuMwIhJQPG6j
         gYxnfUH8i3UsqJr3lL/RxK25A7SqWWLrSf9+8r6trtNei/l8qGrGyEb53fb5Z5GdhT9Y
         hhrjB2RdvrbwfFPTqO7n9iwi+jViRbm5r++3LJ56VieEg834tzMWjJBhpBwThQg3Euhp
         i/mcGbePtOdoBKG1t1J/KlArlCVUzBl5J4MEBmkOT2VJe+A7hGILPuPvWjEtsEjOu4qZ
         OabiZFh+IEGIsqGwQz3Xjwf3i6ZVhpNd+GVM+X4AtMTyFmkM5H/FLvZcpZyuxa2jV6jx
         zL6g==
X-Gm-Message-State: ABy/qLaZA6LNWj9g7jhgMG0H/PFXGSu6D4VA0bU2pXSoIJ5jm2u9EG7f
        zaOeZRaWpsVISWT89i5t/o/4vg==
X-Google-Smtp-Source: APBJJlF2VOmcYgfChy7bMAqvwhS2dCJYj3prVbUZDw9t+pJQ45oDeOR9Pccv8izstFNC8DH9mX8oJg==
X-Received: by 2002:a17:906:7a08:b0:974:1ef1:81ad with SMTP id d8-20020a1709067a0800b009741ef181admr3494616ejo.4.1688711669248;
        Thu, 06 Jul 2023 23:34:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y23-20020a170906471700b00993928e4d1bsm1721167ejq.24.2023.07.06.23.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 23:34:28 -0700 (PDT)
Message-ID: <e9b0b9ea-4871-5fec-b859-aebc1a0e6372@linaro.org>
Date:   Fri, 7 Jul 2023 08:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7550ba
 support
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <1688707209-30151-1-git-send-email-quic_rohiagar@quicinc.com>
 <1688707209-30151-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688707209-30151-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/07/2023 07:20, Rohit Agarwal wrote:
> Add support for the pm7550ba GPIO support to the Qualcomm PMIC GPIO
> binding.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

