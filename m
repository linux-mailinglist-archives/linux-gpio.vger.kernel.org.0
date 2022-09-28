Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1255EDBDB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 13:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbiI1LfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 07:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbiI1Le7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 07:34:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92ED2DF9
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 04:34:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p5so13979684ljc.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Wmm3PYhtV0Temk3PjlmvDvpIDKPL+kZO9REeZH8pHw4=;
        b=Gsu1DUijGnPZVlYbr6KWm+6Uw30vBX+0hVgAjJnWWGavd7khovuC4RcxMH8VPiX/Je
         N925R4PheU/8K3iCIqScp6tKck0PCYkD7WCuL03ctPXaOLcsMqmdeOsZWj7cg65NW+6i
         Ptx3mFDtKGyGz2wg72e5oqnaTcsELsLULvqlJVhNjumZAlYxC0UL8sNH/8sMkxHZhM6Y
         F2BkjLzuEURnrg2/RxVT73NItprpRlChZCbCZCWGGTcqd2bSWH3OH8dKe0x04HTtiG7m
         Dp7PijiLGcWz5hUaGLZZpBp8vpdXTYgBVooF7vEFn6I0UaoBIz+F3ImY2rqnlsxBUEsj
         bnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Wmm3PYhtV0Temk3PjlmvDvpIDKPL+kZO9REeZH8pHw4=;
        b=rUED7Ib1Dt471Mo6E3sO/Yxqog9kRkGN3VqPuIhC3VvtN2TIdUd7FWl53X2BM2z8EH
         P0+eqy3RxSsevW91TQEYyIPZYKJs/9oWYs1aW86Sbj70SE3eWfzDTK1bWGR/ArY/I+2W
         SI2RVqszyxoBkpct9EwriexzfuiHV9u8YhnmmGLCrE+YAm8Jv+16XUOhgdEHrG6Q6YH3
         Cj21FKMzAoJ5HprPyblu4iuSopUzTaSzRr3hTxmdOFelom5BLX75x4rCRB2TGjQvfARH
         d2W9nynb9Ea5NRF+Vtjgi2k6zc36hdaG1HfElsPexRteW50jopYxtkMfIKK48IX3ktj6
         Ao8Q==
X-Gm-Message-State: ACrzQf2kZao9uQ8oM+wi7M/GT1zIx+k3KGQv2H5aUzwsEvILMoyC28bp
        snADGcX3kXVgqqsiEVeUO0/10EPgpfl4Jw==
X-Google-Smtp-Source: AMsMyM6ycqbJpMFxuM7dxgdDn+8BfCPIoIjFMyEhhvkOovnGu5dOcNqfvtr+nrdOzDXwnwAsrwOuLQ==
X-Received: by 2002:a2e:575c:0:b0:26a:9f39:b3f7 with SMTP id r28-20020a2e575c000000b0026a9f39b3f7mr11716111ljd.315.1664364895052;
        Wed, 28 Sep 2022 04:34:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 2-20020ac24842000000b00492f5ad0ae7sm456910lfy.43.2022.09.28.04.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:34:54 -0700 (PDT)
Message-ID: <b5b2fb58-e7a4-4ec9-2908-a6d334a79982@linaro.org>
Date:   Wed, 28 Sep 2022 13:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/3] dt-bindings: gpio: Add compatible string for Unisoc
 UMS512
Content-Language: en-US
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20220928092937.27120-1-zhang.lyra@gmail.com>
 <20220928092937.27120-3-zhang.lyra@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928092937.27120-3-zhang.lyra@gmail.com>
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

On 28/09/2022 11:29, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> UMS512 use the same GPIO and EIC controller with SC9860, so this
> patch adds compatible string for UMS512 directly.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

With commit msg fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

