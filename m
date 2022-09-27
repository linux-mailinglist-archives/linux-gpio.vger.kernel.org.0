Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF155EC198
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 13:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbiI0LiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 07:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiI0LiW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 07:38:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F57D149790
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 04:38:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a3so15237771lfk.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cnbtuJqShkVt4h95QD+zLCK0/9qnRVCyBaJyOk7itxQ=;
        b=BoAMliHmsbF4Ku7NnbL7OW3mQQYB8xD7LrE7WarQXJAOVAI9/5re2/JhelWnR2MNul
         5KLK3YkxOxzgtbwOVB02VLBhhDjjvX535XM8AfC5DnSPUsw7RURMy8bjzfxiTX55pfsX
         +ZM/1ftZR5YegIX9wQSsva4BGegIDY7plf0J0OdgDMOPMFcOiP/fNuDaFjmLMCQBxZfp
         uu1OMmydUn/8jxuE/wI7EG1RFl83JuxzdpL/AFgNX1MktXDhiT77sZ2OZC+tm9gsjXIO
         yFobNsPFm30QK0tTDySDdQKY7mDMTDwGh2OsyoLXhbZ7Yih89841L2T6y8PCl3hm+9WX
         oS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cnbtuJqShkVt4h95QD+zLCK0/9qnRVCyBaJyOk7itxQ=;
        b=PVNNTMqSjYcApHzfOTw6VGf24lnOyKb4dhAHlaU7wRnj3fKnS51A15DIpoA/nTHAnL
         13MC/LKxcujrWgFZSQymKrgkwfN1jn/tydOaCy8fSl0R5dgM8htItTzonfQDo0bGIvOw
         8kYbHq4LSeIlkph/mBNjAOTlDw7eP/kPrEG/7agbUyb8pngWkz5B04SrPEFiqfFUEWaw
         IE1mEBrXaTtBggauDRduHuJYzZrXqOhbCvMWOMJx0PUWQuns6ctPBtWrRqLf8WwsPzkS
         puYQXPrxc0pXmnOAVXKTaEHqZFFQ/4Pf3ZB8lT0IckcSRIY6fPBMuozIaVS3D5UZ9qzG
         om1g==
X-Gm-Message-State: ACrzQf3uoSmMVAyl94q1FVWiszY14eDuHmYwbKMw+01krQcrH1YfDN5q
        J5XSezTGqkwcfcf9Uk2UgcShLg==
X-Google-Smtp-Source: AMsMyM7Yt1EsHtR3BT1w9tuWa1xA6Dn+i3G8IKdV5ZWjYKrBkxnA28FFVwKIJuHCq/kO9ypNZxHINA==
X-Received: by 2002:ac2:4c8d:0:b0:4a0:559c:d40e with SMTP id d13-20020ac24c8d000000b004a0559cd40emr8181899lfl.508.1664278693650;
        Tue, 27 Sep 2022 04:38:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g24-20020a2ea4b8000000b0025ebaef9570sm141559ljm.40.2022.09.27.04.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 04:38:12 -0700 (PDT)
Message-ID: <c3ff6ace-3e58-0b0d-920e-e53a451206a2@linaro.org>
Date:   Tue, 27 Sep 2022 13:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 25/32] dt-bindings: pinctrl: qcom,qcm2290: do not require
 function on non-GPIOs
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
 <20220924080459.13084-26-krzysztof.kozlowski@linaro.org>
 <20220926231505.GA3149014-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926231505.GA3149014-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/09/2022 01:15, Rob Herring wrote:
>>      properties:
>>        pins:
>> @@ -116,6 +115,16 @@ patternProperties:
>>      required:
>>        - pins
>>  
>> +    allOf:
>> +      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
> 
> You can drop the quotes here.
> 

Ack.

Best regards,
Krzysztof

