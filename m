Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E8071FA48
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 08:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbjFBGqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 02:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbjFBGqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 02:46:10 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC051BB
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 23:46:08 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-97454836448so145966966b.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685688367; x=1688280367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sn5GKIPUq7n4vlCzPHxBlLVhBwHsIY9pwft/0PIKGBs=;
        b=uRHXQmKFfg6Ty6YPEOvbVuHCYKuBOonqM93J4SRlD1cgcAk1u+uNI+jfV5y01WPD+r
         8yp0tqQonwy0Of/F4l5ueo7PDlxpGUCHWL0/cvwRF9wLedTFpqa+M1uXDs/VPvCKHsQz
         uqNjb3u0y7i6egKZVxVMPPyfFjXY6Td+g06Owx9alBj+o5Lh8x1WQrd6zAShZ/Fq+tKP
         u6k4idSxXuz9rZvNmguP7cTNwcgnYzn7himsVHIEwZvfUjSgNmWj7oWPkusc4SCli2cw
         i0zMjtJx5laVjN6jCaQTdd/+VC1uBSWtJyoHDYTstRMSxDQEWCMgde7jHF+TyBlZyBcO
         K3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685688367; x=1688280367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sn5GKIPUq7n4vlCzPHxBlLVhBwHsIY9pwft/0PIKGBs=;
        b=e2OgtDOpPrQoKJaw/OM9/4/UpqGkyxC43OjhntNv4iNS5TiVde5E2kLqalVjDryfeZ
         uKNP8eNyrU8cMUT7bgDuQBOSD8Uimp5NyDJp5RtK879z/mWG9wcPDQC/n9ZAqAb8Pgdl
         YuALbsgWC9j85jiMY5oO2+aRO8+QdtoNQ/yFk5XobgRq7NSQl2Y/S0NZYbwrNGi0ht19
         78KIrufnHk71AfLHHbErBIZMIa1Am3nWdrb/Waj6J8L/6P60M5UI6dccoyeZrvc8ufVP
         wPeU6BuraVAPW9+U4h/NU/Qq7mlOqoN6fgHsBsbo8jHklaO3YiUU87GgERDOX61EgEBc
         SRgA==
X-Gm-Message-State: AC+VfDzUX7uhZJpLqwHpB0BgDGPybd62/tGlxgFNEVYYpEcmNn4VCeSW
        oT5GHZDUj3fItv7GztEEMVtElQ==
X-Google-Smtp-Source: ACHHUZ7Q1uVjMhamKfseFwmnkiS2/n+5edox82SflnDS21Cz4GqWA+5aSrTkhy1Md9Sa95VNrecatA==
X-Received: by 2002:a17:907:746:b0:973:d2d1:e7 with SMTP id xc6-20020a170907074600b00973d2d100e7mr7718987ejb.71.1685688366895;
        Thu, 01 Jun 2023 23:46:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bq24-20020a170906d0d800b0097436a54b4bsm393664ejb.0.2023.06.01.23.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 23:46:06 -0700 (PDT)
Message-ID: <b31a1142-b6bd-16ca-ef26-87f91617e3b9@linaro.org>
Date:   Fri, 2 Jun 2023 08:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop k3
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
References: <20230601173831.982429-1-nm@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601173831.982429-1-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/06/2023 19:38, Nishanth Menon wrote:
> For convenience (less code duplication), the pin controller pin
> configuration register values were defined in the bindings header.
> These are not some IDs or other abstraction layer but raw numbers used
> in the registers.
> 
> These constants do not fit the purpose of bindings. They do not
> provide any abstraction, any hardware and driver independent ID. In
> fact, the Linux pinctrl-single driver actually do not use the bindings
> header at all.
> 
> Commit f2de003e1426 ("dt-bindings: pinctrl: k3: Deprecate header with
> register constants") already moved users to the local header, so, drop
> the binding header. See background discussion in [1].
> 

This happened just a release ago, so I would rather expect to have it
deprecated for some time, so out of tree DTBs won't be broken. But any
platform ABI is up to platform maintainer so:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

