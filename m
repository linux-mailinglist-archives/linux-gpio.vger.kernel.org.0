Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F885EC180
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 13:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbiI0Leu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 07:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbiI0Les (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 07:34:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4228158515
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 04:34:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a3so15224850lfk.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3MfChP6/8iEzK8T0JnULh4yZmSkySd9MxkyDxH83NPQ=;
        b=BvyxpoRSuU/O5vaE3mB3wCfIHe5cNksauflDPAW2L3ejUWZRGNfENIeHbNfCjwTAH2
         wlSQpVTqfopHEdJGQNnTNc6kowj+AxmQL04J7Uhfs3KLVcLnIgxxOCo6J/FWOz1hbAkb
         iVC1OX70qX8xjX1NeoDUAX2Gnydbg3VejsRCRx9qC81ZdepBMPozxHSQCNCAb3ZshgAQ
         U2YE3TEeifLQ8BHB0jMRl3Z+eoupyn+jB3rdT4yQVAaV/YioAB6evXovHCgqYVAtg6x3
         OL/sab3+D1KOfgrAEAhfgWHum1qkk+f7q0PMEx4HEk8Kd38O8nm7CDHajv3B33rXEOOE
         Gm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3MfChP6/8iEzK8T0JnULh4yZmSkySd9MxkyDxH83NPQ=;
        b=IfMVfDw0mvQJiABzW7AIlP8sUuTg44RXKKmXXY1dnc3o7nWqY+83RJTEBrV/M+U5yA
         SAZ2cEg4nygHycqzPASdMmOjdd1Q8EeAfV+tj37RQpNYtUiqVhSZc8rZGu5a875BbRYm
         WQ5paM20H10S8rFgPVIA5M/YLXwaavYmdhlZ72wzsN15mlCI5Tgq/Q09pfiziWtRUQvy
         en2nokW15OT76Er7EdBUIpzlaU5pjMeLAKeP1qfAYoeMF3beyliIo2uVz4KPhDQqloG+
         Orw6dqPZ7qNUNUFb0lIVqBOH4M2IQkWkkMj4JOWtjaSmR3ri1mr8CM7+GeZfxksZp2UM
         PXbw==
X-Gm-Message-State: ACrzQf0Ul+f+aNuD31RZbT4ersoTqDr6URP+51tEARgN2U+COsKyUEkZ
        SIugztGYGtTmk5dbMCblmLBAKQ==
X-Google-Smtp-Source: AMsMyM461lTDlOqI2S790XgAjwElyYSz1rqAvbpweu5NTI7zT49mx5xxnbrm3DEWp70uRuFf4GnwXg==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr11044689lfs.472.1664278484579;
        Tue, 27 Sep 2022 04:34:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f13-20020a2e9e8d000000b0026c0d7a9f5bsm135925ljk.96.2022.09.27.04.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 04:34:43 -0700 (PDT)
Message-ID: <8b55caf1-715e-e5f0-6a2a-41e605d2e1e6@linaro.org>
Date:   Tue, 27 Sep 2022 13:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 01/12] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix
 gpio pattern
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
 <20220922195651.345369-2-krzysztof.kozlowski@linaro.org>
 <20220926203340.GA2752484-robh@kernel.org>
 <CAL_JsqL+XeqHO-C1GXY6pHQrsXSm=YkSdTpkjV9bHZGpFU=eJw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqL+XeqHO-C1GXY6pHQrsXSm=YkSdTpkjV9bHZGpFU=eJw@mail.gmail.com>
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

On 26/09/2022 22:40, Rob Herring wrote:
> On Mon, Sep 26, 2022 at 3:33 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, Sep 22, 2022 at 09:56:40PM +0200, Krzysztof Kozlowski wrote:
>>> Fix double ']' in GPIO pattern to properly match "pins" property.
>>> Otherwise schema for pins state is not applied.
>>
>> Huh? The schema is applied, but would fail, right?
>>
>> Perhaps the example should have some child nodes to demonstrate this.
> 
> NM, I see you've done that in subsequent patches. So other than the
> confusing commit msg:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Yes, I'll adjust the commit msg.

Best regards,
Krzysztof

