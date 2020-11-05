Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAE42A81BB
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 16:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbgKEPBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 10:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730938AbgKEPBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 10:01:36 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB582C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 07:01:35 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id l28so2715647lfp.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 07:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YP+Nqdju6fuzW2lAa4XJEwbHZrtw8MqpA9/si/syIKo=;
        b=gvhtIHwkfe7sbRRwg1h7msdXsdwAL2E+ntob3AsleBHPIFhIM3CASxGd7CTYJoyY5X
         XaX3F6vjsVXfN2UDTd3yWuszMS1sAL85YhC8Hb08Tq8TuIkhAvUWh8I0CLZzmJI84Mml
         CV7/szyDsYC5vR42OPE9hTl5AyWZ1wgAVm3OVsOQ9RBkYMLeAo8kUvzUreiUrndUMGZU
         6X/rRpyiubqcgDV45w/ufi2Cs05agWE6xZx9CqadzZkTEE8f8CfZ4ALKyuJktjZGR1b2
         wSqOQIlVzxzaasp2f5AA3FigQzXlnNnhD9aom3RNfVhGW3rlwXP7fzAknReaByHLBdV1
         St0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YP+Nqdju6fuzW2lAa4XJEwbHZrtw8MqpA9/si/syIKo=;
        b=cOidvVLCVB5Ue+1cLmj8ZNf32Cq+T7RkipV4WG0SbmKN5jinGpXTrAYfYsxqD6ynD/
         P1DB0wniORJa3Ssydpd0+ySyTDhAk5xHlQ97ZpptEuMEVmcwaAYm/aAbDPHOan3Jr+TH
         efXxexFxRi4q4M0p3KMCOxnqt6u4hKwKmPvmuwywfAYiAlLab5Hc7JP63MTzXBdajhTi
         UdxRDcMVT8s+WXttKGosG14DCTNV+HYg2sz4KknGuA4CuMnSpwkR6FviR6IymIp1tZYj
         WreSc/tw7rYz4HUT0/S5mfdedIiMKJA4Iq+DMR170V/S/rzJvCs++7M2CYaMvH47tHQc
         0IYQ==
X-Gm-Message-State: AOAM5317Vpf6FYDOVeYV4064q5BpTYX1JvEyxhLBSLFMLAZkiIC/Whci
        CCXMvKarFOCsAf9Fdd3ef+3DTg==
X-Google-Smtp-Source: ABdhPJyQeXV+mWcOx1RggApLTJwIjVqb/wGB+yV+A1sOHKP6bkiHkcA1QyL7qTXqpCkXhuP1A6XVcw==
X-Received: by 2002:a05:6512:3222:: with SMTP id f2mr1117348lfe.268.1604588493165;
        Thu, 05 Nov 2020 07:01:33 -0800 (PST)
Received: from [192.168.1.211] ([94.25.228.67])
        by smtp.gmail.com with ESMTPSA id f9sm204058lfa.187.2020.11.05.07.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 07:01:32 -0800 (PST)
Subject: Re: [PATCH] pinctrl: qcom: sm8250: Specify PDC map
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201028043642.1141723-1-bjorn.andersson@linaro.org>
 <CACRpkdaBbdC5_6y=w5eL-jJ_Mk+toKWy8kj9t-UWx02wNfjo+g@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d1c2a25e-3cb1-5d67-d038-be80094c64be@linaro.org>
Date:   Thu, 5 Nov 2020 18:01:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaBbdC5_6y=w5eL-jJ_Mk+toKWy8kj9t-UWx02wNfjo+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/11/2020 16:59, Linus Walleij wrote:
> On Wed, Oct 28, 2020 at 5:36 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
>> Specify the PDC mapping for SM8250, so that gpio interrupts are
>> propertly mapped to the wakeup IRQs of the PDC.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Patch applied for next (v5.11).
> 
> If this is urgent and needs to go into fixes, just provide me
> a Fixes: tag and I will move it to the fixes branch.

Yes, please:

Fixes: 4e3ec9e407ad ("pinctrl: qcom: Add sm8250 pinctrl driver.")

-- 
With best wishes
Dmitry
