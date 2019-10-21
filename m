Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66752DEBC7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJUMOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 08:14:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33116 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbfJUMOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 08:14:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so4947978wro.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7jxHvlIH/GHF2NGpOLWHwkTRpolnPbX/bJ9AbQhHZ50=;
        b=p59UqSQ7ok5T84ox4VFBup57p/nWydONjxf/yNkt7WFcO4wBEmH+YWZ+pQ6Xd9sjdE
         gSUIbcE9ffJQyI/0jl2S6ISp+GqiCmZ4CwtinHAkZf3ssil2Cwd6xHNN922f8P6xmbJM
         1A7w4V4M4aiTNuhFnQdbTE7z3a0w/dAevMvbtl1SHXmxhWzi6KF9O2CXkLIuoQfkfoVZ
         3UyWrMyNdhTb3JGhDiNqUStJdxz5TF+KqxiY1i2V32UCm4MEszjBdPKhce7iMZSsKThJ
         n3wht5xCgM8UzqK/jPTh998UCkiYDCDp3nlKnmBkv+6TTkmV/t5UKE5TBBS9ixIRcHNr
         xDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7jxHvlIH/GHF2NGpOLWHwkTRpolnPbX/bJ9AbQhHZ50=;
        b=e2yu6xvUM7tpsyRTFdXuJcc8Prl46xd9LDjmkUOTH0FnoxZmRBQZz5kAT1lwAQjz0S
         z04TRz4bdOvDt+UDj2bfJzpI/aVnMQjmRKRzS195jXbv2QI2cwr1veWgXz61vktKGARO
         /eh7RNgfpkV3O45fP4h4r7GV6Y4FXaHuq2s1Zt1tlvMO+JgUp1hIjla636eDTX91vNN4
         FyHNvbpQcCqY0ShGIiMZuMrifFBX/RzJ2MSPOQATHgtksYRdhHDwY7oBzW51KH/TdOPH
         qVKnAmIUhUJVBs6CtCVMqMTVWUA+mJRsEUp3lTrWobmG6rhD15O+t3zZdOEbVmhbOc7e
         /gVQ==
X-Gm-Message-State: APjAAAUut4KFCZtZkmKDyq00rA5LXvgUjW9/rSWbRGW72DWOy36udwEo
        8+nkzZM6k9StX4a0MTPqHCH3ZpDoHV4=
X-Google-Smtp-Source: APXvYqwTt8mxKUqo1qn5DUbfyQDPqC2LuHol4HuaS/wKQN/yN5gkLQelG0gG10cVmYyY/ZB7AYYyLw==
X-Received: by 2002:adf:ea86:: with SMTP id s6mr18677166wrm.397.1571660051249;
        Mon, 21 Oct 2019 05:14:11 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id l18sm18941821wrn.48.2019.10.21.05.14.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 05:14:10 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
 <20191021114520.GD4365@dell>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <38dde3d9-8d7e-7dc0-7cba-137b43cea9d1@linaro.org>
Date:   Mon, 21 Oct 2019 13:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191021114520.GD4365@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 21/10/2019 12:45, Lee Jones wrote:
> On Mon, 21 Oct 2019, Srinivas Kandagatla wrote:
> 
>> Thanks Lee for taking time to review.
>>
>> I agree with most of the style related comments, will fix them in next
>> version. For others I have replied it inline.
> 
> [...]
> 
>>>> +static int wcd934x_slim_status(struct slim_device *sdev,
>>>> +			       enum slim_device_status status)
>>>> +{
>>>> +	struct device *dev = &sdev->dev;
>>>> +	struct wcd934x_data *wcd;
>>>> +	int ret;
>>>
>>> This is semantically odd!  Why are you doing most of the
>>> initialisation and bring-up in 'status' and not 'probe'.  Seems
>>> broken to me.
>>
>> SLIMBus device will not be in a state to communicate before enumeration (at
>> probe), so all the device initialization is done in status callback where it
>> is ready for communication.
> 
> Why do we need the device to be up *before* calling probe?
> 

To Initialize the device.
And SLIMbus device registers access can not be done before enumeration.


>> This is same with SoundWire Bus as well!
> 
> [...]
> 
>>>> +	struct device *dev;
>>>> +	struct clk *extclk;
>>>> +	struct regmap *regmap;
>>>> +	struct slim_device *sdev;
>>>
>>> You don't need 'sdev' and 'dev'.
>>
>> slim_device instance (sdev) is required by audio codec driver to allocate
>> stream runtime.
> 
> You can extrapolate one from the other.
That is possible to do! I can give that a try and see in next version!

> 
