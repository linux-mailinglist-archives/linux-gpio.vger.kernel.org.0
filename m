Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B65C51B9CC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 10:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240997AbiEEIS2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 04:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbiEEISZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 04:18:25 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A673F893
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 01:14:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id n10so7247154ejk.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 01:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3z6nvLeGGyPc5qCTPHfhB8pduImZmC8hApcWr/wC4ME=;
        b=Ez6EKS038QDuBSzEPaiuvG0DME44/f/+B5p+cIr2OQN54aWnmJwADBM6CnjWbNO6oO
         oKdGjd1uGzuBJfzuNLdX/Kql8T4qpWWTB0WX7t6XR0M8TvaROApcwB9KSZzytAiN2Ip6
         /QbuvdAb3S1eoEHUPWiUm1/NB8+mjuuL/8FYW834X+RsnAXYTin1Cixx+2gN/5gJSSKm
         87wJ7E8RHkoM+Z7FkUpO5I5giqubTEifieXTcEOJJhhoBzIpMqVgrVsD8GGvPUmI7g2q
         BT7sD++Io48aV/TrJTk7tMcoXpV2rE1MBANj5k5Ein7yrb8/t2hZSggyCGG4B+hPqm9Y
         ctUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3z6nvLeGGyPc5qCTPHfhB8pduImZmC8hApcWr/wC4ME=;
        b=NCKTfNFvQohd0C2rbcWSbPHPN7e/0q8o75qaH+Jpj4rdjpVdkldNE2mVq0WDB1HnqW
         66RRCm4BRerIBRT8f1Bj5xXTQacb1S6Y5PheEdjQxIwtSoyazw8n43Bmgi4iim06P2Nr
         v6foC3FAn2J94qJ8SbP3z+mG2WwzNYUO+jNwNB4DYvxp/l0nJxA/wpVPD+90MDaUL/La
         GXn7fcbeZ+m+CwO0W2unEIruk4m/KpbIrX96M/z/xqsh5E/TOJ2g1UaVAFv6WHPeaqOQ
         zo2W/A/xm8dAiSb/mSfdW1azJkME1kayiL84H94yj06hT8EgiAZ6R29qX5wFItSyJjTX
         VT1Q==
X-Gm-Message-State: AOAM5311ZvigDSqyuMaFJ/36R3yopgAb3ZOW4ujoaqrlT8svgZNLYBDH
        cQHjgjrofYqvZojn9xwm0/sPLw==
X-Google-Smtp-Source: ABdhPJx7GHIOru35sjPTls7HrrQOKJCX2U6B97Yb9PjvYl1AO0ggI+LLZhpfcLpEXN58JtiAngJjzw==
X-Received: by 2002:a17:906:dc8f:b0:6f4:e6df:a48d with SMTP id cs15-20020a170906dc8f00b006f4e6dfa48dmr3489746ejc.206.1651738485458;
        Thu, 05 May 2022 01:14:45 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jy16-20020a170907763000b006f3ef214e53sm448547ejc.185.2022.05.05.01.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:14:45 -0700 (PDT)
Message-ID: <0ba5b88b-527a-9818-f85d-83a716a0d30a@linaro.org>
Date:   Thu, 5 May 2022 10:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: pca95xx: add entry for pca6408
Content-Language: en-US
To:     Justin Chen <justinpopo6@gmail.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, f.fainelli@gmail.com
References: <1651703357-25154-1-git-send-email-justinpopo6@gmail.com>
 <1651703357-25154-3-git-send-email-justinpopo6@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1651703357-25154-3-git-send-email-justinpopo6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/05/2022 00:29, Justin Chen wrote:
> The NXP PCA5608 is the 8-bit version of PCA5616.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
