Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DEA623DAB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 09:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbiKJIlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 03:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiKJIlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 03:41:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3593526AEA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:41:09 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id c1so1852433lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 00:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQlbJtxtTtFxWmMUXhk5MOTPiDSsGPZ1alWy8ZgsoR8=;
        b=BwE7Oa0pEMPNBS7CTqesEg8uaUuaGxC3Jljplii9sHqvrB3pG6qa6bzn1kUPUF0+ut
         VUKr599ZX4G95/qsw8EQmET8SKFNL60AvftLCT75cmkwF82dwSuiUS99wM9pCRlDDC8/
         Bs/kD3JZ2vD80Br7uInlNuH7b+hX0EvjEchEc+P0R1mQVe5fBJZxZpwC3m73gYmHLNYJ
         ssD7Dt9LQYcVZ8h9wsKrmsUy8uFBqoWbvrcilmdZFnRYUGBg7sCF7H5EyzpxHba9KQXG
         AB3vjj9xlCIw4ytZ4NGE7izQ+qSVnJDW8YvMjD2OI0RQg2imWlgW6FzraRxepvWVd+9j
         qmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQlbJtxtTtFxWmMUXhk5MOTPiDSsGPZ1alWy8ZgsoR8=;
        b=4PSLwZCQgVVjuTjQytSDosBbVBh+VKt0DsWxTW8DiMGznSWg9BLHOVVIux6XhkKH5F
         +Tmkj6yoRgd/gmA0JvXFa6IoAQD0mz8fvv2CqXP2cg2lP688mATVIUyEv3RYYwBuGAnv
         aZIs6mxnZIFDa7lNZXW6bvw5KpLEpCCkMrPXCT3QAC730n+lzNzG9EfJNZe5Mp9EBu3X
         klNaSIJpEbzafUHS79toKgTTulQ+d+QnzJLYaFcU6mXZLy6k/5ULk5pjMgei/fJbJFED
         suCCvoDX7SP+ocPCQzuBa+yXz8v4xoDm4ItpBL7aEBzm9d45XiU6XiR1qVVHQz79ocB7
         n7aw==
X-Gm-Message-State: ACrzQf0kurnh410i6FgAGWITwp6bt/Z5g1X6XFxRTWOesVy129lR7jJX
        mmmKtoe1fY6U+IEUeOLgyUMdXg==
X-Google-Smtp-Source: AMsMyM6+MsI5486Mf0FfCWdvOhLPo4ijn1KYKF47ijh8WoiVUsPPjtw4lV4A9Wh+LugZFgcBW8OSnQ==
X-Received: by 2002:ac2:46ef:0:b0:4b1:753b:e677 with SMTP id q15-20020ac246ef000000b004b1753be677mr1053599lfo.407.1668069667566;
        Thu, 10 Nov 2022 00:41:07 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bj11-20020a2eaa8b000000b00277078d4504sm2600397ljb.13.2022.11.10.00.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 00:41:06 -0800 (PST)
Message-ID: <d882761a-7e8c-1c15-b469-c2ee8734a795@linaro.org>
Date:   Thu, 10 Nov 2022 09:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,msm8976: convert to dtschema
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221108140909.51422-1-krzysztof.kozlowski@linaro.org>
 <20221109113334.u2jhlwqgpfubfg5w@SoMainline.org>
 <20221109204810.fyestfmom7nzgqt2@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109204810.fyestfmom7nzgqt2@SoMainline.org>
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

On 09/11/2022 21:48, Marijn Suijten wrote:
> On 2022-11-09 12:33:37, Marijn Suijten wrote:
>> On 2022-11-08 15:09:09, Krzysztof Kozlowski wrote:
>>> Convert Qualcomm MSM8976 pin controller bindings to DT schema.  Keep the
>>> parsing of pin configuration subnodes consistent with other Qualcomm
>>> schemas (children named with '-state' suffix, their children with
>>> '-pins').
>>>
>>> Changes during conversion: update the list of non-mux pins (like sdc1)
>>> to match Linux driver.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Thanks for sending this right as we are upstreaming MSM8976!  With one
>> question and one nit below:
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> I retract my review on this patch, see below.
> 
>>> [..]
>>> +        items:
>>> +          oneOf:
>>> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|14[0-4])$"
>>> +            - enum: [ qdsd_clk, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
>>> +                      qdsd_data3 sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk,
> 
> Missing a comma between 'qdsd_data3' and 'sdc1_clk', making the bindings
> checker treat this as a single string 'qdsd_data3 sdc1_clk'.

Good point, thanks!


Best regards,
Krzysztof

