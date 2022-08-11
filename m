Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64F258F7D9
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Aug 2022 08:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbiHKGpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Aug 2022 02:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbiHKGpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2022 02:45:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1DF167C3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2022 23:45:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z6so16862431lfu.9
        for <linux-gpio@vger.kernel.org>; Wed, 10 Aug 2022 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cmNxqUYbbLfZmfbn6Tid3MyIwHPmuvZvxKQRIASpPb0=;
        b=dDnnH39FkUvUgy0l6nKARiVgk7yt7GxvCQ6gp2l7ZNV/h5N3T1OrSku0vdzSSS0LhS
         qV8u9NkJZ1hS5eZF9Gu3txLeik9IAFaBrUepEQMsEr/i+eXBHjHwkFrWZWECFy2TkDKU
         mvkbAR8Z8GmphEE8R6BnH50FPNGYDbkTRWIQozJZ9mj4Fbajnh7Z+CJL5S91w9YFxvm7
         Xtes6KDd+K/P3I0oBYdhns0EfBVbrp6x0piw/Eq97I6mAEHAljGtFbNPy7crmxOs3jJS
         jydkGpAZH2IOT3fu7apq/6OAjD26mnlfwOJbzzYtnRRiIoe/QzzdhV45+iYeUk8rfzgG
         qNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cmNxqUYbbLfZmfbn6Tid3MyIwHPmuvZvxKQRIASpPb0=;
        b=NTKHk6OTtSbRtSdiV2Lw/XHINT18SquyQfJnn1nYAOqPPZh8itjzdM+Hc9Kf3OEo0p
         r8+xi2hBcpqUukHwiVg48+vkJOfuq82pYVUkLpY6E/oCUcWJvBjmc7yDnjWfpV7p3Jdc
         2lnA3rMYDLLo63XCYwPGgKst0vDkSdqYRu7YdfEEwjeKFDUONMfRkIgHss5u28jP3K0+
         P8llVYpMI+0+4lB+sa2awjoDtueqtYP9s77FoqKzLjLhLRmQ9cE/J0jHnsnpN7eJN5oq
         GF8a7jvAAc7K1F4ua2nIG3r8qGiy5CCqVdi1mwQ/YubbL7d4e4cErIsc42LvBWyZiU6f
         Usuw==
X-Gm-Message-State: ACgBeo33b9sZl3VNqYQ9bcEi6HNglsvb2eBKz8EsbqzQSknux146zfV0
        vIB6hUzaeRRQia+yRJdEuQXPMg==
X-Google-Smtp-Source: AA6agR7Re+Czo+MNniiu+JD9ZUTBya6sa260iSUdEFmdkGrWeY1rL7zbQ/JbU2jcq9T5znrXaW/AqQ==
X-Received: by 2002:a19:ca43:0:b0:48b:288a:632f with SMTP id h3-20020a19ca43000000b0048b288a632fmr11465484lfj.155.1660200346091;
        Wed, 10 Aug 2022 23:45:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id i63-20020a2e2242000000b0025e2c6b15e6sm688796lji.72.2022.08.10.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 23:45:45 -0700 (PDT)
Message-ID: <2bc9f4e3-51af-b58e-dc85-5623df799250@linaro.org>
Date:   Thu, 11 Aug 2022 09:45:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dt-bindings: mfd: aspeed,ast2x00-scu: Convert to DT
 schema format
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220810161635.73936-1-robh@kernel.org>
 <20220810161635.73936-3-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810161635.73936-3-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/08/2022 19:16, Rob Herring wrote:
> Convert the aspeed,ast2[456]00-scu binding to DT schema format.
> 
> The original binding was missing '#address-cells', '#size-cells',
> 'ranges', and child nodes, so add them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
