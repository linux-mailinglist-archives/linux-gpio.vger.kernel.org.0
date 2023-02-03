Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E857868975F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 11:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjBCK4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 05:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbjBCK4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 05:56:12 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C626991CE
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 02:56:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id qw12so14290363ejc.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Feb 2023 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdYRjOM1n9bt8CN7mBjbmqA+shKAXX8Ovt8jaNWTShU=;
        b=TTe8dPHkBNkUesxIWp8id6+kZt6bBhVLN1AbM9Q2yUCXy0U0dQnhiMNlSNMCzYlgVh
         ZJW5B+IG4lEzWL1mLjJWKnN8UQFbKZMQPETLWbYmHSN0LcAy/We92w1jDFhdutqAY0XS
         5AuBsWSWyyfvrOr6kJ315r7Lcv3OK9WY0u+NshplJxk9jO3CUwvRdr9gDuhaUcAJEel2
         Rxk6vJlam0U+WN0pRVaHVSDFYHhIJTyfbexAko7p3nLyc6AiCCJc/MLchscD7GbZqEre
         lCD6Dl3muFeI/L+0vtEjM8LVGU+9/lNYdSaHB03zKVEfGZTlRD99lLBWIaMdfvO+Xuu/
         W3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdYRjOM1n9bt8CN7mBjbmqA+shKAXX8Ovt8jaNWTShU=;
        b=IyoqwQHDy2zF/L6HG3WmpkFuop5Aw3QgSH72tqgFwcJ7m0XKhCCK6dRDJRGJlNK2i9
         ItTmIIfM4RlQq4ON5E6XmbHqfttjYzYKRKjB0c3w6i0mjUi5OM1qoA4ChJvFWrKHc6n2
         j2K9G2W1b1XYMQyOoKlWp07c1698949JgPT++gyu85L5WJ02iyD87ock6cJRs63eY1+j
         zTrXM0C/AyTpvYVV7oWkWSexu7DFUbG3RThGc/sQ2MvkRL9nA1JN8iAqd99Yy2k9D4AO
         6x7uf2UoEIoAAJQ7ey6kuGMBQJAqWzoStBviAbA+l+Dz0VMw2uPsGfoYRyO8T6BPNfz8
         +s1g==
X-Gm-Message-State: AO0yUKXZq68K4UEqj2nmWACGZ7D0AD/Y3DZ52wvctCuw4i8rhAb1upxw
        gA6eU2Nh1VB50+O2HBsMwYdL2w==
X-Google-Smtp-Source: AK7set+MxWM0+nZqvviW/bwAcAGYQkQyWGDadUbnUIpVzeXcg1uw20STr4HiMhMPlosIWq5Jv3GQrA==
X-Received: by 2002:a17:906:9610:b0:878:5e84:e1d6 with SMTP id s16-20020a170906961000b008785e84e1d6mr11002336ejx.75.1675421761914;
        Fri, 03 Feb 2023 02:56:01 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id p2-20020a170906498200b00878803d4049sm1219445eju.93.2023.02.03.02.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:56:01 -0800 (PST)
Message-ID: <e34f36b0-35a8-0b77-e6ab-49851213108e@linaro.org>
Date:   Fri, 3 Feb 2023 11:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V6 2/7] clk: qcom: Add Global Clock Controller driver for
 IPQ9574
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230202150619.22425-1-quic_devipriy@quicinc.com>
 <20230202150619.22425-3-quic_devipriy@quicinc.com>
 <1d144aa4-6f0f-b10f-1d32-4acf4e06ae85@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1d144aa4-6f0f-b10f-1d32-4acf4e06ae85@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3.02.2023 06:47, Kathiravan T wrote:
> 
> On 2/2/2023 8:36 PM, Devi Priya wrote:
>> Add Global Clock Controller (GCC) driver for ipq9574 based devices
>>
>> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
>> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---

[...]

>> +static int gcc_ipq9574_probe(struct platform_device *pdev)
>> +{
>> +    struct regmap *regmap;
>> +    struct qcom_cc_desc ipq9574_desc = gcc_ipq9574_desc;
>> +
>> +    regmap = qcom_cc_map(pdev, &ipq9574_desc);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    return qcom_cc_really_probe(pdev, &ipq9574_desc, regmap);
> 
> 
> can we use qcom_cc_probe as suggested here https://lore.kernel.org/linux-arm-msm/84f68577f5629e6ef6d6b14357a79f84.sboyd@kernel.org/ ?
Yes we can.

When you're answering a long long long long email, please cut off
parts that you aren't replying to, I had to scroll and scroll and
scroll and scroll to get to this sentence and I'm not even sure if
you said something inbetween that I missed..

Konrad
> 
> 
>> +}
>> +
>> +static struct platform_driver gcc_ipq9574_driver = {
>> +    .probe = gcc_ipq9574_probe,
>> +    .driver = {
>> +        .name   = "qcom,gcc-ipq9574",
>> +        .of_match_table = gcc_ipq9574_match_table,
>> +    },
>> +};
>> +
>> +static int __init gcc_ipq9574_init(void)
>> +{
>> +    return platform_driver_register(&gcc_ipq9574_driver);
>> +}
>> +core_initcall(gcc_ipq9574_init);
>> +
>> +static void __exit gcc_ipq9574_exit(void)
>> +{
>> +    platform_driver_unregister(&gcc_ipq9574_driver);
>> +}
>> +module_exit(gcc_ipq9574_exit);
>> +
>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. GCC IPQ9574 Driver");
>> +MODULE_LICENSE("GPL");
