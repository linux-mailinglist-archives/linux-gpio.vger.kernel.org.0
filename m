Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9656699A7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 15:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbjAMOOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 09:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241591AbjAMONL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 09:13:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D6D8B53C
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 06:09:17 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so33269757lfv.10
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 06:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfrzdcPiy0Hdw6/iAuT57+/JJ2SqLT2P5GR8aVHlsBE=;
        b=F2cwr/7t0vbK+L6PYtAxhaLvwsLRI0ZhLXwirF0roTu2m3XHYo7sWFuS3843dXxrTO
         MeFmV91b8shFyG5WPe+lj5TMjpJhUgudf5S98IiAdu/2TYtdAtecY2d/IXfWv2p3V93p
         /5itVkT9JUEPJQkx8yDUxajV5tzHZaHqTqV0b7C/4QZXj8xot1zV9N4OK+vQE13EcltN
         q2lo5KO+SUWayyM1X/vMdGPU+n17nBOC/yjcYUAiaWZ3IRYqrkuGGX68O+PMRJe5qhnV
         9aiRXZMD5OvIWJfhPG1zpHlC8pelB93ZWH3QnOT2UpbSXh+EV+WfmUNiKae2V3O1ET9w
         nPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfrzdcPiy0Hdw6/iAuT57+/JJ2SqLT2P5GR8aVHlsBE=;
        b=fpOkJFiTAkNv+gY88waK1tPcvvNxXRd411YSXXMs5Ui/xEdgyrltVp7P00SToN5Kga
         XCace7MPFKY2P3keOmAaXIZwFmF7X4a4fyyMzv6CFVf61n+sz0mi/S1GWEwfyJ4++ijt
         i8nk/N3WjMUOiVcjbBqLgRGJrYG4k9wixuaNG89JMHscdmW8x4bzCBqPf6oSxVLWAEB2
         IYq2m61NFcqrhh5Oq5ocag4D1HQG8XXsxIQf1Bxmqu0zEE39QVgvYpJJOEP1/I9bUYDh
         IzjtY7f9L+cBz1me2qeY7d+Z/W4zfetSbaZvT7qTJNvrRdvd1hfTaQJ3KFXtYNAPF14c
         CvdA==
X-Gm-Message-State: AFqh2koVtENvXjmIB7MJRzA7XQ+8s1ESc+W3Kw+F2t/AgyfnU7tR32yh
        U4xyc/JslOKz6z6d8ghSHYa1Mg==
X-Google-Smtp-Source: AMrXdXvunA8ofEpb3NUFW69utzpsdsMGWpLOu9/MW73tfbAgLPZG81qCR96G0UeK0ij1v0xBFC8p5A==
X-Received: by 2002:a05:6512:1049:b0:4b6:edce:a192 with SMTP id c9-20020a056512104900b004b6edcea192mr26400332lfb.4.1673618955757;
        Fri, 13 Jan 2023 06:09:15 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id d23-20020a056512369700b004cc86bc8f22sm2389754lfs.90.2023.01.13.06.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:09:12 -0800 (PST)
Message-ID: <9bdf757d-1fa0-106f-eb77-7f2a8593213f@linaro.org>
Date:   Fri, 13 Jan 2023 15:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/7] clk: qcom: Add Global Clock Controller driver for
 IPQ9574
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-3-quic_devipriy@quicinc.com>
 <de346d71-1fe7-e357-d220-d4468e4bb933@linaro.org>
 <afd2e5c8-fa5a-ac1f-4ede-4ab1f91c0d0d@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <afd2e5c8-fa5a-ac1f-4ede-4ab1f91c0d0d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13.01.2023 14:21, Devi Priya wrote:
> 
> 
> On 1/10/2023 6:07 PM, Konrad Dybcio wrote:
>>
>>
>> On 10.01.2023 13:13, devi priya wrote:
>>> Add Global Clock Controller (GCC) driver for ipq9574 based devices
>>>
>>> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
>>> ---
[...]

>>> +static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
>>> +    .halt_reg = 0x07024,
>>> +    .clkr = {
>>> +        .enable_reg = 0x07024,
>>> +        .enable_mask = BIT(0),
>>> +        .hw.init = &(struct clk_init_data) {
>>> +            .name = "gcc_blsp1_qup6_i2c_apps_clk",
>>> +            .parent_hws = (const struct clk_hw *[]) {
>>> +                    &blsp1_qup6_i2c_apps_clk_src.clkr.hw },
>>> +            .num_parents = 1,
>>> +            .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>> Sounds very much like a hack..
> Got it, will remove the clock entry as it is not being used in linux
I'm not sure removing it is the best option, somebody might have a
funky board where they use this particular QUP for I2C for whatever
reason and then the clock would have to be re-added..

Thanks for addressing all of the review comments so thoroughly!

Konrad
