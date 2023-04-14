Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA736E2B49
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 22:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDNUrv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 16:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjDNUrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 16:47:46 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AAF35AA
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 13:47:44 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-947abd74b10so695080966b.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681505262; x=1684097262;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5f3N0RAtgUVBIB/xIm7w7WNTQBqMz0AMr1YWNHsHjg=;
        b=X7duMdF7yBT9zLGwesGIN4G3wnxp3Cjfh3udvsg4agx3zVaZ/60sVw/xE7aSLDTGhJ
         zIjF3dd5jmSjhNdUX/OuNDeR2QQNKuNa7hYPHXF+TO4ZuLaKUXtGxHGa03DKlHrMgFeu
         xfjSbV19IpjVaxXaFVOgcoi9ORTuRfC4KpnrmEDPFuoispB5my4N9JAPmdvul7vQ7HXf
         Yum4/lMy5nouQOYVVzN07viXOybs3vZoC4POy8XN2UmICUQ3Y6zvtFLW30B1TIzjFLZl
         RiDCukTz9T+ZsbMuVrfFxih+a2WKElYsyb0CNfJebpbF0EgGQQ1aL3Bh25KUHqarouEr
         k3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681505262; x=1684097262;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5f3N0RAtgUVBIB/xIm7w7WNTQBqMz0AMr1YWNHsHjg=;
        b=PbeGJSP7zt+816DEvdFMOo2/cjPNYvEBj2/SJELs+gSnwudIH+2Y5XZNNl3X0vnuLa
         FOEtKskwJTAUmu5gihWHhPAjeLAsToWxPTvn2nz8BaC/OFU64q4UaljWJPogpKSipHnx
         CWr6o1p102p9YjGE67hBZG2kXHzzBk/IsBBvajtZvLAUIFLCjSdrajeYYCVjqQM5kxpI
         SbMM5C3m/m+vU24L/+/rvSX2hQjQA7mXpVn83c1vlfzyVGhZZQd7ZI+kBcTxxRYRAwjt
         ONNqmeBFbPLDJM+9hAaw7X5gM3JSNE5aOqUU8q/MikhH1eIncNsDcdWiS6VYVNy01jgT
         HJGQ==
X-Gm-Message-State: AAQBX9fEXaqNy/fGfY0Uca4Wv5dldtGlv5Sj6lXX/i2Ng/ajDGZrsdQf
        I/pBpA49sh07oFfX2iCyHrsOwg==
X-Google-Smtp-Source: AKy350YgvMVGXc4UafDc/Bu9EhgyHaWr2UVtxorQb1uoFdRovgAwRThK3H4UFtY7yfcABeD8dWrWig==
X-Received: by 2002:a05:6402:b2e:b0:4fb:f2db:a654 with SMTP id bo14-20020a0564020b2e00b004fbf2dba654mr7044407edb.12.1681505262487;
        Fri, 14 Apr 2023 13:47:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ffae:8aab:ae5a:4688? ([2a02:810d:15c0:828:ffae:8aab:ae5a:4688])
        by smtp.gmail.com with ESMTPSA id bf13-20020a0564021a4d00b005024459f431sm2491923edb.70.2023.04.14.13.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 13:47:41 -0700 (PDT)
Message-ID: <193eb300-3075-c07c-6946-9c56aca7a340@linaro.org>
Date:   Fri, 14 Apr 2023 22:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [V6 0/9] Add Tegra234 HTE support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230414004455.19275-1-dipenp@nvidia.com>
 <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
 <a280fe0f-b8b1-4cb5-b4b6-aa9e9367241e@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a280fe0f-b8b1-4cb5-b4b6-aa9e9367241e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/04/2023 19:14, Dipen Patel wrote:
> On 4/14/23 12:36 AM, Krzysztof Kozlowski wrote:
>> On 14/04/2023 02:44, Dipen Patel wrote:
>>> This patch series mainly adds support for the Tegra234 HTE provider. In
>>> addition, it addresses dt binding comments which prompted code
>>> changes in the existing HTE provider driver without breaking the
>>> Tegra194 provider. The comments raised concern how existing code
>>> retrieves gpio controller node
>>> (the node is used to help namespace conversion between HTE and GPIOLIB).
>>> To help simplify that process, new DT property is suggested which adds
>>> gpio controller node in the HTE provider binding as phandle property. To
>>> conlude this patch series:
>>> - adds Tegra234 HTE provider
>>> - modifies existing provider code to address new dt binding for Tegra234
>>> without breaking it for the Tegra194 chip.
>>>
>>> The V1 patch series:
>>> - Adds tegra Tegra234 HTE(timestamp) provider supports.
>>> - Updates MAINTAINERS file for git tree, mail list fields.
>>> - Updates devicetree and API documentations.
>>> - Enables HTE subsystem, Tegra194 and Tegra234 HTE providers
>>> by default in arm64 defconfig and dts files.
>>
>> All your emails miss PATCH prefix. Use `git format-patch` to generate
>> proper versioned patch. Stripping important part messes up with our
>> filters. We have quite a lot of emails, so proper filtering is important.
> 
> My bad...excitement of sending the patch series got hold of me :) Now I have realized
> it is been happening since the beginning. Since all the previous patches have been
> sent without PATCH prefix, is it ok for this version as it is or do you want me to resend
> with proper prefix?
> 

It's okay for me, no need to resend. I just wanted to bring this to your
attention, so future patchsets can be improved.

Best regards,
Krzysztof

