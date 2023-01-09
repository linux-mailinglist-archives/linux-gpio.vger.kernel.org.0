Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07B16629B1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 16:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjAIPSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 10:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237066AbjAIPRs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 10:17:48 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6851403C
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 07:17:03 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l26so6512718wme.5
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+PqgORacgkMDX01Q5NGqFzrod0OlQV05LXx05OG7/R8=;
        b=sb5IJ/abZfkZqQuTH1bGGSF8GF1xPt1b4eT+3XTA1i+HoCZBJ1yYEVs98SWKk6ytM0
         B6QEjLlmppj6MY2WeAoSmA1N289RS3BJ62L2PfXf6khhLfFC5+DxvFEp0DHZxjMA5D2E
         XT+DmUzPDr9k+ISyMAIldOCybXDT3nLkx476KWq4tByFbSeG3qc9nOzs4ZyTANLj+kgh
         hqLnDy855NR6z/mfxnZ4tw7gxX2BpmUbVbge+ulCzlyvFpKyVJzkQWf4BHtwzDhIbiEE
         FfWHDsz1i1IxT5Ri11jguy7E70C0a6HKtBfwrCoYQIeayOC2mMVeti0Dl4yjWB0gDAML
         crBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PqgORacgkMDX01Q5NGqFzrod0OlQV05LXx05OG7/R8=;
        b=CX2fLX+L0WLmdb3PGsUJB7vNlok8bRCQ4njOS1qUbhwwJHClufHz6Rwngy232CSvEB
         3xOC/8MrVHzgRuw5woylkJ4fMcTystmcODlnQwMuZA1wUJR8qnSCPu9CrEbqLDoiN7l0
         GgrztmhT0wCW0leUQwbWE+Z69KEN1UAd5nld4tsQyZyUJV606FyulTQk85Rz/jmo332D
         48m/lgVYGurnenDvd/c4K/vY91S8RyzHcva2FWyrcVu1ypmQTjLOutHMiK7/DXhfBkkG
         iZOZtken2uw2iXijHs7szxDO3pa6+GCJHB+L8efaYW9hhUoymfDSvYaXRG5zsyAns5KB
         sxXw==
X-Gm-Message-State: AFqh2kqDXFcK0IweZH4r1P4qaABAthUhkztOF+okSVK7bfPXbSerhdJ6
        l35Cj5zB4U5Ez0zmPi8P7jHU+3onrpwJhOji
X-Google-Smtp-Source: AMrXdXutZdV1Q+q4tKTuHkHXJoGdv5KeBWCpgkPiZr1wIwhHSlQ2cfgYT6VUJUZRhXCbmDEpmm9I2Q==
X-Received: by 2002:a05:600c:3d0e:b0:3d1:ee97:980 with SMTP id bh14-20020a05600c3d0e00b003d1ee970980mr57192263wmb.7.1673277422112;
        Mon, 09 Jan 2023 07:17:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a010:fe57:993c:4842? ([2a01:e0a:982:cbb0:a010:fe57:993c:4842])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b003cf5ec79bf9sm12796176wmo.40.2023.01.09.07.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 07:17:01 -0800 (PST)
Message-ID: <129c1b6d-288f-d463-8c08-7c7f7e832cf0@linaro.org>
Date:   Mon, 9 Jan 2023 16:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/3] qcom: add support for SPMI PMICs found on SM8550
 platforms
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
 <CACRpkdby3KTakQXnmkSYsu3HreSYx9zhP0nWKQU3KOtmunA3Ew@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdby3KTakQXnmkSYsu3HreSYx9zhP0nWKQU3KOtmunA3Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09/01/2023 15:18, Linus Walleij wrote:
> On Fri, Nov 18, 2022 at 9:24 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> 
>>        dt-bindings: pinctrl: qcom,pmic-gpio: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550 & pmr735d
>>        pinctrl: qcom: spmi-gpio: add support for pm8550 & pmr735d gpio control
> 
> These two patches applied to the pinctrl tree!

Thanks !

> 
> Yours,
> Linus Walleij

