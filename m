Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670EA68B74A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Feb 2023 09:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBFI1I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Feb 2023 03:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjBFI1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2023 03:27:07 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DB31631E
        for <linux-gpio@vger.kernel.org>; Mon,  6 Feb 2023 00:27:06 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o18so9571932wrj.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2023 00:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmhZ/cYGiK2NsFEJrNtRjrWEbvnT/SsUaI/b0pdgW8Q=;
        b=YYawh8K13sKDMpfR15eXt7GbxkLub92FItJh5ABEyqDFbvdxbvO4FpTZhRqzGTAYlV
         kuRn1ynIJMD53EHsn5td+rov5O4u1YRci+pP0iYyGkusnnNJJTA5uY0PKTG0CZnCtBm4
         C2gse/5SPCidue/ehAbngXRep6z3FrT/KHscjNOuQtFz8fRXh7Vo+vhEg0zLkvsDQH3n
         yaNNcdWpbScd8IoXmiqGTrEAkYC5tCvrxcV6IcmbyDPK6Vjogf07glEn1G7v1qVyqzI4
         WJ6mcl8ABuAkAzOJz+VZvTNYnx86IR3c+o+YOymJ3Yv+RL2+j2Zhe+4aBaqTkluf1XHg
         RaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmhZ/cYGiK2NsFEJrNtRjrWEbvnT/SsUaI/b0pdgW8Q=;
        b=4rbDWYrZJkNTogIUXxOz07qdXtJcDvjMrnnAJNU6LVgIjV/KY0YmP4lM9MWh5GuGjX
         Xdj4pRuui+7Hh1S+7LO3B09vlRRDDo6C1/g3Xm97mL2ksB9x8GAEMjDjHtx9/WNapi9h
         nEltV8bALMUYvwZSN4ZfFg61kXL554dHQZqjCoi9bNr0KYg6xBGg4NX+kGMM/fhQIxJl
         LBhuqb2Em2UdlxPNFRP8pQYnl3T4GbxxZ3GKh6n2gfKpQ4WG0BzpPFkXwcdyWX4TMu+/
         Vh98Ap76ciM3p4Wu3QK2SZVz+iE23ct21DwFa3P/8ptH7RJy5YUsGC6oF8kCw37Avo74
         XmPw==
X-Gm-Message-State: AO0yUKWzHdcOWl8B1aKMVYDnrm5yTuY+3sNj8lj4PC8oBjEVgb41c6LI
        mrFg9FcEFC5BvVlkQAh4RZ2oYw==
X-Google-Smtp-Source: AK7set/8W1aN1TDu/xRGsUyUU3hUWmAplZgbq0G+hxTv+5AFTuvi+l/7/dpCpqIPNl6FmBygYkSlZw==
X-Received: by 2002:a5d:4e4f:0:b0:2c3:ea65:cc7d with SMTP id r15-20020a5d4e4f000000b002c3ea65cc7dmr2708362wrt.55.1675672024802;
        Mon, 06 Feb 2023 00:27:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d17-20020adff851000000b002c3dd82a0e9sm5612966wrq.91.2023.02.06.00.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 00:27:04 -0800 (PST)
Message-ID: <42b995b6-3437-518c-7c9d-fa0dcdf419ac@linaro.org>
Date:   Mon, 6 Feb 2023 09:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
 <20230206071217.29313-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206071217.29313-5-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/02/2023 08:12, Kathiravan T wrote:
> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
> Changes in V3:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

