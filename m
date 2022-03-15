Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0C24D98D1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 11:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347132AbiCOKe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 06:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347129AbiCOKeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 06:34:24 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6566267
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:33:10 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1FBEB3F366
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647340389;
        bh=DJwlGy49fIVp8yCxZTiqXGTs2dFP1ksI/sEeMoJLTLA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jPogXIooAUZXSziPH7j54UeuaF7pOTsp+/203pb6YEGXJMUaG3z/LgVK2Z1V3T4hp
         R64udueSbOEoIvCLT4eVyGywdqhktlRKd/kawzDIejiud0LDw6SLllZRcZ/OBXydnC
         xW6KH+NOTNCb6j0ApXr24gN1g4dyuTqzlwD+39IwW0WSjR8iUps/NPLNtrEzHV58b0
         ilgvLxrV3sQCuayTc9j6XxYHLs5sWtM65xlJbjrrsmRdKwQZUAcL5BQwArri0rCG54
         4iJKsEVkAanzHh/n0ngUtwOhflGYuTC2YoWCQFjHPC65ZmeNB3thkYKfoyY1Nc2dE1
         c2og0/LBZ0ZFA==
Received: by mail-ej1-f70.google.com with SMTP id og24-20020a1709071dd800b006dab87bec4fso9457193ejc.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 03:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DJwlGy49fIVp8yCxZTiqXGTs2dFP1ksI/sEeMoJLTLA=;
        b=VAqBXUsSl9tZGMNR29jLK73ZvrqTS7+Zga25MkC5nPYtWvbW96Pga9h4oj69hcaG6X
         ak2+oIyk2oEKWGicdWjJiZSC4vKmXmsgblC5GaVSOt+sDUciHZriRKd1Jf1eWNhLo0NJ
         6xmJeHzrrSaIY8WUglPwGxyJ1mrstu5GHqPm0RFuRWWHR0alOngGsOTjyJq0u1BfJnnj
         lkoXDstvgVNJAhqURz04LWr1PmRvYM4PvwvrIkwG+yYhEf1r5kZBmApMwu2WCVhl48Ao
         VMmCJ7sxfwGRtbbI0X+QbqWMLABDoVH6Sle4wCInNth2z7vmcSiCn/KMYlHP9dPxpKmL
         E2vQ==
X-Gm-Message-State: AOAM532aTWqnF+38wmrNY1bcU/nUqmkCJmEdLk91OFVEUTeG9XwvG+M8
        T+UJxK13wQR3TV/JkL7/c9M4m27dNZhm6BxUVXTzpdr1FJeUkz38O1e7QpnZJy3yfjk9/+DMbG+
        Bx0v0mFKmgHMlHnY3WfKJcdZxG1Qg+BflYTIU82w=
X-Received: by 2002:aa7:d341:0:b0:418:cca7:e57b with SMTP id m1-20020aa7d341000000b00418cca7e57bmr1198686edr.263.1647340388866;
        Tue, 15 Mar 2022 03:33:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUSrSl3Iv+b+0nRTtbeD5udi+j59+1SgSRW5MoGRXAoku3q7KV/E2w6ndWDA4K1GYpWc2gpw==
X-Received: by 2002:aa7:d341:0:b0:418:cca7:e57b with SMTP id m1-20020aa7d341000000b00418cca7e57bmr1198668edr.263.1647340388641;
        Tue, 15 Mar 2022 03:33:08 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id z8-20020a170906270800b006bbd3efa6b8sm7933855ejc.80.2022.03.15.03.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 03:33:08 -0700 (PDT)
Message-ID: <49d116ad-c853-8c15-83fb-ec4e418323ef@canonical.com>
Date:   Tue, 15 Mar 2022 11:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] pinctrl: qcom-pmic-gpio: Add support for pm8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/03/2022 10:11, Dmitry Baryshkov wrote:
> PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes since v1:
>  - Added dt-bindings entry to the pinctrl/qcom,pmic-gpio.yaml

This should be a separate patch.


Best regards,
Krzysztof
