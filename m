Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C7361E159
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Nov 2022 10:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiKFJjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Nov 2022 04:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiKFJjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2022 04:39:13 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6916BC03
        for <linux-gpio@vger.kernel.org>; Sun,  6 Nov 2022 01:39:11 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id k19so12132817lji.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2022 01:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cq1fQFuSXwN8I/qGFtLF6/L6wjrZ39hEli2/d689Kbk=;
        b=o+dgYXBafU/ZQ9dL93R8IJmp1uv+pDOKt9WaWHKZBJmyg+1WAuoxBx4ZfVufe4t97T
         Cjm6U3ekwulqy1TME8K3kJ3mbuk1Ojmg94UkpymO81ZlJywI/BcdhZv1wdGruvLtGY+G
         Eh9NQUlPkQikIsTram8LDtTeuB5TX2SkSaxZ5UhTrr0mEpHOU4utuUZfTY9EYsO+BGkp
         pQ6nmHopUv8IB/jVQwa3Gu3JF0YfqGpvEE5J+2C2BK3Gm97kOfXSFxvD1639gk6T6FkP
         +l3Nxxd95x4m6CEz9bJeIsnh1shsukHdP6uewDyQaLl5dC5UFFvtw5/JwUJFfF5oFnay
         W91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cq1fQFuSXwN8I/qGFtLF6/L6wjrZ39hEli2/d689Kbk=;
        b=myYixjza3neKUo+CmtIhwB4QPmpiFV1cX4YP7Y+ErHhvVJD1G8nvwj4AABdzgiwgDN
         fKVYC9vHynx18P8WN1frpA7awRzygwop5ORpwte8uRhSmhEqRZ5kQl4iYsBDkgBq5g/l
         BX21YnXThnhHl/elThof67qU76pfif1qoyrFHm2/nd/hI1+P2zkckTckiR/K75Ac3gf6
         80VONKtk+yOETSn4FQiEsNRjp0KarNka+dj76cojbYCCOxu2COZvQgOs4j6T+ADwaMXL
         PnZ5ykJRqkmXy5qYzNSRjYqnrrOVUGBay0Hj2QUobEwYLMt0NkTahNSv5B0a7FK0huip
         LjLA==
X-Gm-Message-State: ACrzQf1U6Sfp5doLsH0gCF+Ta3tNSmBaCRGJdRtV1ULCQsI17a41pdUV
        UDV6EYFAJluVwNN+6paSW6faoRlR8xTOkg==
X-Google-Smtp-Source: AMsMyM5nLoppsmo6K3rS6K3VcxNVbW6KU2omoKQbkqEkvZ/mAFNo+iRlqeOsOr/vKkHHaHIf9OQuVQ==
X-Received: by 2002:a05:651c:b29:b0:277:43c4:a864 with SMTP id b41-20020a05651c0b2900b0027743c4a864mr3893482ljr.463.1667727550117;
        Sun, 06 Nov 2022 01:39:10 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id v28-20020ac2593c000000b00499d70c0310sm626240lfi.3.2022.11.06.01.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:39:09 -0800 (PST)
Message-ID: <7411fe54-892a-1a12-d323-cf4c508d0a9e@linaro.org>
Date:   Sun, 6 Nov 2022 10:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/8] dt-bindings: mfd: syscon: Add nuvoton,wpcm450-shm
Content-Language: en-US
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
 <20221105185911.1547847-5-j.neuschaefer@gmx.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221105185911.1547847-5-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/11/2022 19:59, Jonathan Neuschäfer wrote:
> The Shared Memory interface (SHM) is a piece of hardware in Nuvoton BMCs
> that allows a host processor (connected via LPC) to access flash and RAM
> that belong to the BMC. The SHM includes a register block accessible from
> the BMC side.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

