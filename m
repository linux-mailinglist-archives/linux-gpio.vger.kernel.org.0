Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B64A60B35A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 19:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiJXRFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 13:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiJXRD7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 13:03:59 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE31E7B78B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 08:40:01 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id x13so5243465qvn.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 08:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=A1zile5aaiGOv1/6LYGIIS7rWZdNf/REZ+C9UBtfg9OfpCOGjXnhycbBfjdSe0JOyu
         v5qzJjdxIPLQzNoFIOLcH8aiLZMksx3Tj6Nur9hpg9fEaWvP7WH1gT5ar8GPUQpgA5lJ
         DioVkGo5QA/KPc7eezM0ezSfhiofM6Pb9FiueqjTZj7jQ/qNViyLM0EuJoUXoo8FQbGG
         N7zpmFdBC9U18lnuezv9+We3fEpYv6ZvxzaOMEglGMbyGuOucIIcEoZ1vQEwbdbY0HRA
         4C9EJiEr8dTf62+r9YQ3C5gn+n6uMmjDlqJSHPRWR60LM6ro/3Du7SUX9hoCoCevjEWv
         qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=j2an5l1tV1GgMqgSWRy6tYqoMjrlFJJ7PdgcuHPP5G6HzDWiQkLWH2It3OxH3jfKNJ
         VPvvnFG4qlGwBFdINJGVJGa+NW4FZl8hcjPj0xcySDsdKtjbIIterGw4uLVSJlEh/tQB
         4hVBDdbyKJRsJeW2NUuUlThidbg18B1M+jmwCDp4TSq4GyvrYxAd7OkipXFMKp/y7nFF
         Zl3itw+HC2BVFCgD4aa5pjJRqX5tDCJ8EqoA2nQCXOFl1kvqyjoAxXUq09ilB+FOzrSB
         pcsItU/UGKC+NI2pku1p1mxjd8XqM5MRsV6ISQzPCctpu+2MRzqU8v0xh2+maTf9upkK
         XCKw==
X-Gm-Message-State: ACrzQf04tck9R9hIh0GjDQTUrgC/0eIMbYIc/vx2+XEFTgZsfTcHhgm/
        /bKW2mTWiAPdZ1/XWhsVsX7+3o8W150cSw==
X-Google-Smtp-Source: AMsMyM5X+kIBxudaeRFmJTdkoXGBmNzB+x8RZi8q9kq8BLojbo3cknAZE5oULo3K676hCYZUJgRcwQ==
X-Received: by 2002:a0c:9151:0:b0:4b1:8375:46d3 with SMTP id q75-20020a0c9151000000b004b1837546d3mr28530283qvq.122.1666618142903;
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cn15-20020a05622a248f00b0034305a91aaesm12586522qtb.83.2022.10.24.06.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Message-ID: <a7693e48-f16f-9577-8685-417f21706d1b@linaro.org>
Date:   Mon, 24 Oct 2022 09:29:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] pinctrl: samsung: remove variable pin
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024131527.2156810-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024131527.2156810-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/10/2022 09:15, Colin Ian King wrote:
> Variable pin is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks for the patch. The file is being in process of dropping (patchset
is being reviewed), so I think we can skip all the fixes.

Best regards,
Krzysztof

