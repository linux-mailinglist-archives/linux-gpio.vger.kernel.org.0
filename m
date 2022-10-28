Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56A0610FDC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 13:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJ1Ljy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 07:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJ1Ljx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 07:39:53 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D616F5208D
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 04:39:51 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id i10so3045898qkl.12
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5v1tKJSddyKGhjYivr+OzULCBQzysCsAefOBPQNIX8=;
        b=Dv9ap2PhBbYR9KjHexHomQ8eD83+DrEcXVXfW2l2PXZbPsMznbFUXJkRVTqCMLDgxy
         9C/M4mUUhQ9NzNyOp81BaardyYDuS5ZOJR3bVlQLeZoiZ3OMLFX2jzbr8AO/XnFBYAip
         sacPbc3qv5LfP0C6OmvRYw7Nkkc3W4lz8FREFlamIwhupcn9eis1ExPW8Uch7/HiVDoG
         0gJDPCzqIDOLSFD+LJnpVcgZrAdwZW6I1dlNU+KHStXoVfmc47MoepXZW8tVq5IyIOJA
         1xt+AXlX+lWK9NPXnwS6hbhaxZbW623bjLlkRTF2ET/VgQY0bLOSVjCcd3G3j9qGjdYt
         VroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5v1tKJSddyKGhjYivr+OzULCBQzysCsAefOBPQNIX8=;
        b=B1TzDfDzDBwW9Mtmc46cEf6pcuCndk9OBkejBoJnnq/CdsHuMamBgMJ1ZsINF8zhWD
         XtomFvd9LSJj+r2LhP9b8zeqvN5F5TeW2f2RDoL+TD8ERcfoFrRxVz63JXJtABdp4UDD
         otrHN0avMI/kU4vx17PuE2NBiKQzRFumkHdKNRS317ZsHGqmmybURy3G6ffeLZTQPB+0
         0WqkLNJNf8Vg0PsrpG2X/EDblpsrdKyQJJul1lMfkGhsDvXCqkabe950GChDUMGHET5P
         W6Hnf4DQ98MSzvoMDdJbyaiwnrLjNH0lxx324r9haGJpl90YErS013VEKmO8oPuI7lTs
         +kFg==
X-Gm-Message-State: ACrzQf1MzNa0eYqGJdXmvfpHJ/Q00HVDLrcAxCV53oe9Bx4R5OfZqaXM
        tOLJR4E6ttzUJogUxyKQAz5vLw==
X-Google-Smtp-Source: AMsMyM63uZYcee2OTH41pbHq2Hm59Cytlr132Z71CDFl7aRdaLWePUSDBtloqb603Lng+qAp4hHpUQ==
X-Received: by 2002:a05:620a:1999:b0:6fa:9f:458e with SMTP id bm25-20020a05620a199900b006fa009f458emr4217875qkb.252.1666957190982;
        Fri, 28 Oct 2022 04:39:50 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id n16-20020ac85a10000000b0039cc82a319asm2246325qta.76.2022.10.28.04.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:39:50 -0700 (PDT)
Message-ID: <0d38990a-1f05-271a-9800-1deaeac9eb0e@linaro.org>
Date:   Fri, 28 Oct 2022 07:39:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: add loongson2 pinctrl
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>
References: <20221028085625.24217-1-zhuyinbo@loongson.cn>
 <20221028085625.24217-2-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028085625.24217-2-zhuyinbo@loongson.cn>
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

On 28/10/2022 04:56, Yinbo Zhu wrote:
> Add the Loongson-2 pinctrl binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v4:
> 		1. Replace Loongson2 with Loongson-2.

Where is the rest of the changelog? v2? v3?

You ignored also my comments, so no - you need to implement them.

Best regards,
Krzysztof

