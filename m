Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B8B4650ED
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 16:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhLAPKr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 10:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhLAPKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 10:10:46 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C54C061748
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 07:07:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 137so20682878wma.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 07:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qTmietPPTH/OEWz3+GN173yo9RKau03sCp5APng7zRc=;
        b=jzA4kko/2OjjeaobiNKn612JAkABJ27wZLaAMOy6eKCrhon866eDrxxG5nmZ/pRRq2
         NE4zTNZUiSvjcGJnqr9jMhKnIZbPDhYN1GaWw4oZ94U+BAFGZl7jgNf5GNCtyAa/IsNQ
         EqGL+Nfy7ZbYzWlFeKH4LkKnkcjq+YOO8ToWS+Fq9ampksyPKnVye2nICbuZSLTaZWRb
         RyXjpO1L/uC+Wvu0ROkT4uIRvFJUNQ00AR87Gaz4pSTiSg8x+3KFgIIWbfNOYYbVRh0j
         sKLAyrhMOKy3vcG8EgSt2jZmHeqQobEtCv7bY6R0wX+GFvwlckNBPNTZMgFneXXxFPJa
         Z3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qTmietPPTH/OEWz3+GN173yo9RKau03sCp5APng7zRc=;
        b=fEy2RmdrbA67bMkZQZvjz4v5FNoG3DT6lMvJrFi1Kqf0XpuQt3+h2Ln6yws8ipfCuu
         MCAShtn4wD6bfuf+KQTa/7FDf70Z6Fo7kWxjYofDbS7X0wIqGpL9o90DrqYUF3pDYwUT
         DmFm+r+x1As9Y0xE3KY9qXwAabUtleU7WhLHygmK7KE3qW3+nHqzQ+P1A+8vJ9kDKVFN
         sMzB5fSsBPGLrt2zUTJ9N1tMlfISNBPo/DTkGtBOQgddPrqnm6sO0RWVW4gNkq69f91l
         So7NYSoaQSHWmBjBklGMcfi7yJMfrBJrl9mg3Ko3unGfGSVatq1CqSm+bROWpH1Nr+VR
         tBCA==
X-Gm-Message-State: AOAM530k6vrvJtYV5Dl3tA/ydlZKgsVCvC3g2cKFiz78HGVr8YDyYnGH
        xBJ8Cd9Si4bYnt/zh54G8AOl5w==
X-Google-Smtp-Source: ABdhPJw7rj6qis9EWXaZFE/0EATQh6xhhQa51TzS6S/onkXNA+4TsiXKIUSFBX+s/THVcjWw3y8IVA==
X-Received: by 2002:a05:600c:501f:: with SMTP id n31mr7688078wmr.101.1638371244569;
        Wed, 01 Dec 2021 07:07:24 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id n15sm1360511wmq.38.2021.12.01.07.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 07:07:23 -0800 (PST)
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Move chip specific functions to
 right files
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
 <1638179932-3353-4-git-send-email-srivasam@codeaurora.org>
 <bb08af7e-3b90-2d64-3bb1-f82cc6686184@linaro.org>
 <342898d1-59ef-9104-658d-d992c0126361@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a9e561cc-67f7-450b-fc08-61ece48e9070@linaro.org>
Date:   Wed, 1 Dec 2021 15:07:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <342898d1-59ef-9104-658d-d992c0126361@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 01/12/2021 14:33, Srinivasa Rao Mandadapu wrote:
>>
>>
>>> +enum lpass_lpi_functions {
>>> +    LPI_MUX_dmic1_clk,
>>> +    LPI_MUX_dmic1_data,
>>> +    LPI_MUX_dmic2_clk,
>>> +    LPI_MUX_dmic2_data,
>>> +    LPI_MUX_dmic3_clk,
>>> +    LPI_MUX_dmic3_data,
>>> +    LPI_MUX_i2s1_clk,
>>> +    LPI_MUX_i2s1_data,
>>> +    LPI_MUX_i2s1_ws,
>>> +    LPI_MUX_i2s2_clk,
>>> +    LPI_MUX_i2s2_data,
>>> +    LPI_MUX_i2s2_ws,
>>> +    LPI_MUX_qua_mi2s_data,
>>> +    LPI_MUX_qua_mi2s_sclk,
>>> +    LPI_MUX_qua_mi2s_ws,
>>> +    LPI_MUX_swr_rx_clk,
>>> +    LPI_MUX_swr_rx_data,
>>> +    LPI_MUX_swr_tx_clk,
>>> +    LPI_MUX_swr_tx_data,
>>> +    LPI_MUX_wsa_swr_clk,
>>> +    LPI_MUX_wsa_swr_data,
>>> +    LPI_MUX_gpio,
>>> +    LPI_MUX__,
>>> +};
>>> +
>>> +static const unsigned int gpio0_pins[] = { 0 };
>>> +static const unsigned int gpio1_pins[] = { 1 };
>>> +static const unsigned int gpio2_pins[] = { 2 };
>>> +static const unsigned int gpio3_pins[] = { 3 };
>>> +static const unsigned int gpio4_pins[] = { 4 };
>>> +static const unsigned int gpio5_pins[] = { 5 };
>>> +static const unsigned int gpio6_pins[] = { 6 };
>>> +static const unsigned int gpio7_pins[] = { 7 };
>>> +static const unsigned int gpio8_pins[] = { 8 };
>>> +static const unsigned int gpio9_pins[] = { 9 };
>>> +static const unsigned int gpio10_pins[] = { 10 };
>>> +static const unsigned int gpio11_pins[] = { 11 };
>>> +static const unsigned int gpio12_pins[] = { 12 };
>>> +static const unsigned int gpio13_pins[] = { 13 };
>> >>>
>> to here are specific to sm8250, so it should not be in header file to 
>> start with.
> 
> As these are common to all lpass variants.. I feel it's better to keep 
> in Header file.

You realize that every include of this file will add these static 
variables to file, in this case to pinctrl-lpass-lpi.c, 
pinctrl-sm8250-lpass-lpi.c and pinctrl-sc7280-lpass-lpi.c
so in first file(pinctrl-lpass-lpi.c) you never use those variables in 
second file (pinctrl-sm8250-lpass-lpi.c)you only use up to gpio13 and in 
third file pinctrl-sc7280-lpass-lpi.c you could use them.

so its really bad idea to add static variables in header files.

--srini

> 
> And if new pins comes in later variants, we can add them incrementally, 
> and they will not impact existing pin numbers.
> 
> I think in upcoming variants number of pins will not decrease.
> 
