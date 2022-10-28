Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFA1611B4B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 21:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiJ1T6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 15:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiJ1T6i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 15:58:38 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4710241B34
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 12:58:36 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id mi9so4762703qvb.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYs6O8sCAd1Yea/9WK36sBxcxzTYhp16dbjeEkQIpvU=;
        b=GMwYTCyNhhvxL7M/8H28CG0ZJZqJATITghpAohr48TgXSrx3Cu1I7QCnzflAzm6xMO
         FZH8VttvKhVCKQSnR9yKqX2drTx3SWnxC74QoeqtF8GS8MKmBB9eosThRRDNFM3uHVo/
         b/QFfRWO43LecZMRbb76uakkaqUIzlaWRDz6q9UmY7Rd9yG5PtMJKdBJqUX31m0rY6OY
         1HyDjAKhzCOjv45RROuNzYFACs4dNxVyGdqjZWnNrmiBu7opy4x67c1tVcg4lI44nM3E
         q+9BUiY5/7PIGSeomrwHNJaF13Cq7uD/sgxXQPmx9B2hSM2X1UzsM+DTjEx+12hrUHYT
         g2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYs6O8sCAd1Yea/9WK36sBxcxzTYhp16dbjeEkQIpvU=;
        b=l1L+SWRZrxSrxPu9FHzZECms0+OsFld+U9RN19reKSjCyIY8x6f/hxTqIyE3VOPUYS
         pu5O1mr+nugmsDULJdo77LmwfD+aaGniV8OdK8Y38NiE2ijlB27Ny8d/WnuDIbdL9ca8
         XkS/5vXawSIswBCK8hOnwBpK93Rm9JELSxKPvMcJZxubdc3hI7ZBKEJw+gYmpmgZmZPG
         cfAPRSJYX4SW2C7EgsUM7nG+Z0RFIOvhz7mPIlxGMWBlpJe//i0ILleOfv3S1SFNPPzC
         i+VgU+NevPdsxcVNnWXNrvnDz0ho5U5kSqGHlL0N14nZ1JdBwu1SuKfng8Xs9Wrl6kzr
         LHyg==
X-Gm-Message-State: ACrzQf2JtkRQAA/lrOM7M/e7ziohw1kUhw+EoVod5SK5tZscacuJy6Is
        0JMG+4YF1MyVORXifKL1fUylkQ==
X-Google-Smtp-Source: AMsMyM7kbGKg2LoTa5P3PUDyV55VGglhVevH4tQbikcvGoq7PA2E2HJpNHqhq5Jo/rwv6oEktoHLVA==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr985433qvb.5.1666987115862;
        Fri, 28 Oct 2022 12:58:35 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a0bcd00b006cf38fd659asm3594556qki.103.2022.10.28.12.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:58:35 -0700 (PDT)
Message-ID: <f5bf36e2-5be2-cec9-510d-bc99bb9b6bda@linaro.org>
Date:   Fri, 28 Oct 2022 15:58:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 08/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-9-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/10/2022 11:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Change "subnodes" to "subnode" in subnode description for better grammatical
> accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
> and remove literal style indicators from descriptions that don't need their new
> lines preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---

I propose to squash it with the one changing description here.

Best regards,
Krzysztof

