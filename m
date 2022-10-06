Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6132B5F6B7B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 18:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiJFQVh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 12:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiJFQVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 12:21:35 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5868A4B83
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 09:21:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u10so3500937wrq.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=8hn6BGyHUmeb4KAEVPwfOsR7X9Gui7csgFKX8kSAEHQ=;
        b=CnGYBTJGNtnXD0mf7cUrLgozd29i7Y0+6T8yVG74ZCPdNVVkMlJln3q91ZRsu6bH9x
         WtzEpkuMdwY2BtidyKMU8HgvIqdekXr9CP8ojL/37mwJG/pFwzzquY0lp4myhSRpv/X/
         BmdHku6EdnSPCUJ36a0YbFzeFzFFM4kaeH534BlCHPGwR6pVX8wKd+TfD7T1Q89pQ5Lg
         8b952B1M+Rdqg4OsUkgJUNjbzZ6n0D3Ya3nlPKgYosAN0gGxIy+R90xtUb24/bFkbz9W
         S0az+GGja2Ptp+QVHIGITR7fwJq1b6OlJ2n5ITQEirS1rZHb9EUDeto4+tHJb6inWDa8
         7aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=8hn6BGyHUmeb4KAEVPwfOsR7X9Gui7csgFKX8kSAEHQ=;
        b=2uUY8heeENQBjKbsKRYbWTl8BbGV2uNMCScaxGg1UUhcoTp+iU0asLE2UGNJqGU8DF
         W0lL1Oc31H2pbSIKrIDCYFzD+A4fLRRx5gVRP36vwFpEhLhNaA4hTvhyBxLdPEfLZQIC
         GbuWF54yHn5ueDhuiAUaV58hJmy+h0RFxDFGUt5YfHdaLd46iwjN0XenMLMD9reGt/mh
         KyEX02QjLv6iLaec9TirwHkxIzSIvYXNfZ5KzyMx/5E31pWmJwzmtXSX7roVL3AtDO/b
         jUSvngbL5NPHYiEkdfp8nxFnGeeLWotKo2gd7kA3RszGEmUBRYhgS+M5lMhqkSd8IfTd
         nrvA==
X-Gm-Message-State: ACrzQf2CuhcjyG80wLukvEDKP+NV0oRCu3c/+vUgTh0trsepCClAVgHZ
        05laPmsEO9RF+pNNkLKH0CWTNg==
X-Google-Smtp-Source: AMsMyM5J0JfJI+5HBoymkusb8RQsgdMulCc/sufzcEBOh2ubeBcesSEQ7gFaMIY9bcOTblmnwLNGQQ==
X-Received: by 2002:a5d:47aa:0:b0:22e:3ed6:77a8 with SMTP id 10-20020a5d47aa000000b0022e3ed677a8mr518638wrb.648.1665073290203;
        Thu, 06 Oct 2022 09:21:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e032:72ae:542:774? ([2a01:e0a:982:cbb0:e032:72ae:542:774])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d4fc1000000b0022e66749437sm3339362wrw.93.2022.10.06.09.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 09:21:29 -0700 (PDT)
Message-ID: <85c9c9ee-37c3-733c-2c67-ac22734844f8@linaro.org>
Date:   Thu, 6 Oct 2022 18:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: convert
 qcom,mdm9615-pinctrl.txt to dt-schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-gpio@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v1-1-0cbc006e2a30@linaro.org>
 <166505882828.1602503.18185089088624527425.robh@kernel.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <166505882828.1602503.18185089088624527425.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/10/2022 14:27, Rob Herring wrote:
> On Thu, 06 Oct 2022 09:57:58 +0000, Neil Armstrong wrote:
>> Convert the MDM9515 pinctrl bindings to dt-schema.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/pinctrl/qcom,mdm9615-pinctrl.txt      | 161 ---------------------
>>   .../bindings/pinctrl/qcom,mdm9615-pinctrl.yaml     | 101 +++++++++++++
>>   2 files changed, 101 insertions(+), 161 deletions(-)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/
> 
> 
> pinctrl@800000: 'gpioext1_pins', 'gsbi3_pins', 'gsbi4_pins', 'gsbi5_i2c_pins', 'gsbi5_uart_pins', 'reset_out_pins', 'sdc_cd_pins' do not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dtb
> 

Yes it's fixed in the next patch, should I move the fix before the bindings conversion ?

Neil
