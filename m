Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4606172E70E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 17:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242664AbjFMPXj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 11:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240291AbjFMPXi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 11:23:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010581BE6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 08:23:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f62d93f38aso7132474e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686669792; x=1689261792;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZObq3QdQreREeU4NfsEue/+eYyb1HX3Nq35VP0wnSHk=;
        b=O5I1KTQM9ahis2CVWCWapMP4B1w+V782LooA28aPXu+f8RIsABsAEG6HoMaXraby7g
         HdDN1qziUtNinucVrcJwTyTcagUZEjEtlexo+8OnfziVbDulrBUnbj57VWTQ4d+L5ock
         oQWQTGvpQ45Mo6I0heqUBJee7CgGQKuWJcd21ToX04OGSr3pIsy5fFoJsrGIL4GlVH6B
         jDKNaixXYaNX/BSg+6fNh0NUDzkhC5NRZ7mbGe+fZxJPb5JkvWT/wArUzro3LFWPjgeu
         RRUrLjCF6+45XGPMzKXCQ0Who0jYHmOH0H5ZC6BRaoe0ZG4Spgrr53phfK1cSjPWEzAQ
         JhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686669792; x=1689261792;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZObq3QdQreREeU4NfsEue/+eYyb1HX3Nq35VP0wnSHk=;
        b=QfVvwer1vmUO6hPx7dpu4MtiHeU6VUjf/X4Uj/iwZ5nH9eUObQMqbk8THmSV09Zj+n
         RWqWyordpXzT/pE0Ig6i0h5Ck4zDEYz4VPywTwrhAWLicCKy5/0B3Qsn8kOoYltB0+05
         BIrPTe0cAlgEICZDA2+Uzh5IbLgljVoFByLvSWXsOqmUHofpOa6CxXIlWR/TDWw7Kxq+
         ojHT3rJoKTs6m7XFB/Jl1UWwY0rGeWsogEOSLO4yY3qt717TFfyIprZnRa7XVFWhO8XZ
         Bj0QKWxiGnaj06J4CahGOLXfjsuF+YBO41c53ReERe5uAUS5YimBhN+UUIgCjLJCz0Dw
         aXHg==
X-Gm-Message-State: AC+VfDyKRSz/P48QmNctdGfRGD4OagjqSr5nYQMJWgEF09/fe/9UFAtB
        xU9JaYjXC/d7k/d3mH6RJBb5iA==
X-Google-Smtp-Source: ACHHUZ5MGoSPdfOcevVLsn6Xp9mNELJ81EH8SncxQ2LkVo3Gx9bg3gEgGWSOLoOA3+r4muPayrH13w==
X-Received: by 2002:a19:6601:0:b0:4f6:5bf2:63bc with SMTP id a1-20020a196601000000b004f65bf263bcmr5593106lfc.3.1686669792155;
        Tue, 13 Jun 2023 08:23:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 7-20020ac24847000000b004f60be0c685sm1809673lfy.123.2023.06.13.08.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 08:23:11 -0700 (PDT)
Message-ID: <1631b3cd-dc24-0024-5291-fa9bdacc82bc@linaro.org>
Date:   Tue, 13 Jun 2023 17:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 2/8] clk: qcom: Add Global Clock controller (GCC)
 driver for IPQ5018
Content-Language: en-US
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230510134121.1232286-1-quic_srichara@quicinc.com>
 <20230510134121.1232286-3-quic_srichara@quicinc.com>
 <21a5642c-e6e5-9323-7db1-383a18616ac0@linaro.org>
 <410b0991-30b6-c87d-9b25-5f51f6c08671@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <410b0991-30b6-c87d-9b25-5f51f6c08671@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13.06.2023 15:16, Sricharan Ramabadhran wrote:
> Hi Konrad,
> 
> On 5/27/2023 12:47 AM, Konrad Dybcio wrote:
>>
>>
>> On 10.05.2023 15:41, Sricharan Ramabadhran wrote:
>>> Add support for the global clock controller found on IPQ5018
>>> based devices.
>>>
>>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>> Co-developed-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>> ---
>>>   [v4] Fixed to use ARRAY_SIZE() wherever parent_data was used
>>>        Changed GPL v2 to GPL as per comments
>>>
>>>   drivers/clk/qcom/Kconfig       |   10 +-
>>>   drivers/clk/qcom/Makefile      |    1 +
>>>   drivers/clk/qcom/gcc-ipq5018.c | 3731 ++++++++++++++++++++++++++++++++
>>>   3 files changed, 3740 insertions(+), 2 deletions(-)
>>>   create mode 100644 drivers/clk/qcom/gcc-ipq5018.c
>>>
>> [...]
>>
>>> +struct clk_rcg2 lpass_axim_clk_src = {
>>> +    .cmd_rcgr = 0x2E028,
>> Please use lowercase hex for non-macro-defines, all throughout the file.
>>
> 
>  ok. Will fix this in V10.
> 
>> [...]
>>
>>> +static struct clk_rcg2 system_noc_bfdcd_clk_src = {
>> Drop clocks that are managed in RPM, they will conflict.
>>
> 
>   IPQ5018 does not have RPM.
Oh that's new. I suppose you'll be interested in clk-interconnect for
voting on bus resources then.

Konrad
> 
> Regards,
>  Sricharan
