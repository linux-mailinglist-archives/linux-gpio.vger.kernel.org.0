Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA01689035
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 08:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjBCHLc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 02:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjBCHLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 02:11:31 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE8E222CA
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 23:11:30 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so3778020wrv.7
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 23:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMpIUIgr72vj2KES61ZyPekdCitWfbzab3EmSUELRzs=;
        b=M+T7ihDmZWPoR1fZf9kKLTa3I5EStvTTz8K3LOVdpY+E1Q/3lQR9exUPcduCHkNlaQ
         Nb3b3qYCNUOLfjGLX4XMh8ZH6PU9Pb2nhoSErgTYbCuNy4SFZMDjGxCl4SiLC1h5xynh
         iY9YfdOGRTeFQTv12ZZNECggqif1T0puu18mXbpiuqUcI9SJagu1E+KISyTxUvT3z1Oz
         xS4BYhaR/wM2o7PR2xNOi8Ujz89pnceoS8ivYbLGuLq2rQj4cRuiPCHRVIEWka2t+zvO
         +KCLs0B4u71jQ8I6wiUoZ6S8Qxt2pfQ5aFL0zDKt6UBWFVCamHAp3bd9xEUIob0wrk6Y
         6XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMpIUIgr72vj2KES61ZyPekdCitWfbzab3EmSUELRzs=;
        b=PT2yKq/88P2ALscuwIqD5BhXx4UdpHfbZCR6N1z2DlW9Gro7x1cLeQyeQjjkt+eYZ0
         hXlheTm+Wu6Ke9d9LTk4+raVRWdkVE4GF/rijc6cLRzZK8C+TDS2XfspDCFB+hUnseM8
         3wd2eI+fBOvjhiScPhqmusKf518sE/CJrRlelkm4NtspOasCp5YNASmQFK3IOaaKTT0L
         tydsAmZbPHQqzOL8ZytLcqeCy0LwPVbW5/+4ZF7nDzEWLE3OIUY5dUP3lZ8RiH1ACLpv
         2QxVxDu/IC2/LPU8MFYYoL6u6vI3WtLXGPCOfpdR2KHFD3Az3gBa3IaRl6i/JHkhRNjj
         AmMA==
X-Gm-Message-State: AO0yUKWi0A8oXngpJ7ZgGZksHwbitYkm0EWBtdV/Q2Bwx4GqLeETc+7A
        BMhHy9T9+uaAwSSBrFwwcXGAcw==
X-Google-Smtp-Source: AK7set8wSgQiywPGrL5fVkji5XDmWBCGOwWzrueNmHsy/nA6CO+I1vjesYJdPBkcS2iWqRjRngCzYg==
X-Received: by 2002:a5d:680d:0:b0:2bf:ac3f:a9da with SMTP id w13-20020a5d680d000000b002bfac3fa9damr7829808wru.7.1675408288885;
        Thu, 02 Feb 2023 23:11:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a5d4dc9000000b002bfb37497a8sm1249205wru.31.2023.02.02.23.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:11:28 -0800 (PST)
Message-ID: <e2728f7c-4d6a-5920-35e8-ea24b907128d@linaro.org>
Date:   Fri, 3 Feb 2023 08:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 00/10] pinctrl/ARM/arm64: qcom: correct TLMM
 gpio-ranges and GPIO pin names
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
 <CACRpkdb_OHXfAGMYwFv3gzRWyDJw6=eNuJedteMxiEvPtQxvWw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdb_OHXfAGMYwFv3gzRWyDJw6=eNuJedteMxiEvPtQxvWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/02/2023 23:28, Linus Walleij wrote:
> On Thu, Feb 2, 2023 at 11:45 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Changes since v1:
>> 1. Match the driver's ngpios (so usually include the ufs-reset where
>>    applicable). Several patches were dropped, other rewritten.
>> 2. Add tags
> 
> Needless to say I'm a big fan of the series:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Will you send me a pull request for the pinctrl things as soon as
> you feel confident it is finished, and I'll queue it up for v6.3?

Sure!

Best regards,
Krzysztof

