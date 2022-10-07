Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFE65F7471
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 08:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiJGG7i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 02:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJGG7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 02:59:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A0CFDB5A
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 23:59:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s20so5939855lfi.11
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VW3+3oss6LB7BSPpMVbQ+o0wN4V6S0JUswgw6rXnncU=;
        b=y5WDIRdgh4FHvyzVk6cJyj3DMEBu8HeWt6R4yjMVOeSxAZeWMSDLQvyS2k6g4jVcz5
         OBBgNWCEhIQTUgtef2TD8WhJRDi2WK6oekasCNu+RQ4dD9jBHsuH38vZOHGVe/GCT197
         uF8geGQa7+XUfzyV5P8pGb4PUXt4oXLYymJ1+A9ZIK3NGMFff6dnhcpqoJb685it+7sn
         RMKTkr+2ng62iavwX+a3K1ccS+VdKjUe2PgZ6j7FXnE6KvyPVQS/3JeHM3HTZhXUk85h
         +jmvKEP6vT31euC5pjjJyUlWWvAftxwLcal4yCJN/5rlC763QLp4T0qA/QHRv9bDOZwJ
         5o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VW3+3oss6LB7BSPpMVbQ+o0wN4V6S0JUswgw6rXnncU=;
        b=K16FYrqHC8QEcibbvLZXWnw2A7MhbWESjc+Gc/uG3J1UhZN+2BuDX0QQc29ENO9l6l
         5Ki/VqKgnDWDjkyQlmvy9x91qB+ZoExg7pIbCzioykH6I49ihv21hiPTH0QKLUAVI47E
         SAOWu+iNzyUm2pkNyXWOoVLUAnDaiAPgkFipKE+GDvIt6t88EmoT6MslL+0S7hEtH/zs
         ga+GUSa3wsvcwJR54CZYRUxnebdNiOXiaWYrGmqkA1oqKyiEx1fLGgZyTh9MjtrjIaN4
         gYzb22yhUG/zw0GCS4uwuplujzaje6BlUTfUrxkEJ5pJ4+5MFBACdJaVALcKU5uoGPSj
         ufLg==
X-Gm-Message-State: ACrzQf3Mk23oCyT1g+Yfw2RpK/qwtfF4WvjZ8QEqTjguOKx1Aie6+oQj
        uiOMnvf24S3KVwYUzxN0c748vQ==
X-Google-Smtp-Source: AMsMyM7zFfC/u5V00RksOcmN4PrHawK1b1BsN+nXUsr9jhVs1GAmiTNwWp+Ud4iYkQSolvGVKtAmUg==
X-Received: by 2002:ac2:4a73:0:b0:4a2:4f2c:199d with SMTP id q19-20020ac24a73000000b004a24f2c199dmr1240104lfp.443.1665125971044;
        Thu, 06 Oct 2022 23:59:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c19-20020ac25f73000000b00499fe9ce5f2sm174403lfc.175.2022.10.06.23.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 23:59:30 -0700 (PDT)
Message-ID: <f14ae849-cb1d-d039-00d8-6ae230e8dc13@linaro.org>
Date:   Fri, 7 Oct 2022 08:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8150: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221006144518.256956-1-krzysztof.kozlowski@linaro.org>
 <20221007025735.5iceh26gd3agawx2@builder.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221007025735.5iceh26gd3agawx2@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/10/2022 04:57, Bjorn Andersson wrote:
> On Thu, Oct 06, 2022 at 04:45:17PM +0200, Krzysztof Kozlowski wrote:
>> DT schema expects TLMM pin configuration nodes to be named with
>> '-state' suffix and their optional children with '-pins' suffix.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

This one is a DTS, so it is supposed to go via your tree. :)

Best regards,
Krzysztof

