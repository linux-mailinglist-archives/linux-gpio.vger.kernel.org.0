Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1C6EDBB7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 10:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfKDJfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 04:35:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45270 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbfKDJfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 04:35:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id q13so16171816wrs.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/q/Jy46HAl5qDXGb5pMNUar0Ktcd+mxfRNJZDPc+0iA=;
        b=cbz46ZF4/8Y+P96GJfJgqFSAzXtlzcvpN6rYWoHc+Bc8gxO/OHCXy9vBcfZbht65VU
         cfjEYKbmRFxx8c4gfyYUwt5aF45wDHFz4Me5jgojTPUDHsJar6DdJRq1Tb5wvK89nWCx
         mJw8dvIDh0chO6vIDUmC2KucxY+vz8LaxmwiPaqqK+yw6RXFVnJzYYQAov7GqelcbGm0
         snLp2xSC+qkU8IQ4Jc3t1h87nvBIDMCQCt4RxtWiPdRSa8ibUa4AzoFq0ddXg47PRpL/
         mkHd/qFeSuq4B1l1WrRgn9gfigdbvZmzt0P5bdt2KC2q1mQ9O+nQekY19UFuTT0firaM
         U+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/q/Jy46HAl5qDXGb5pMNUar0Ktcd+mxfRNJZDPc+0iA=;
        b=rOJ5Y/2UJ9HiqOLRbH3/ugiLrwltDLctpTHqENiihZI68Bv6saNRlsIBWMWz32mpuA
         Dpw7o00qsnOBJ24abg4BtvwGYyBcDwn5Ph1MXZpJn3HMhq/WBS5Av8jXKr4dhh5gz4Sy
         jpjCiwfX+OTwgAFjLU/Kkx6m8R/mpmHdNF3H9n49PWaDVLPdx+wDLXuZ4nNP021SpGNT
         K1DRtVwlGs/f4PIHN6ypYv1Kf2Gm7QWvWLv2gl7RoX171b0ciluuX9vMbErvQ7lXN8Ua
         2fufWQs+rlf2onl8oBcgmorWyuGQN1VAHK57QU/1MPwuyARtZRF2hK0z7JYv/XLZwbzR
         nwsg==
X-Gm-Message-State: APjAAAXsypvuvobBZDLywbUWtBXc62K8+5cfsp9e7DWZ0EfmEuq01/xL
        6v6GzgH29qz0FPAeWuLBwBj3T1OC20E=
X-Google-Smtp-Source: APXvYqxElW8oVQU4a1AD6VV1NNkiEHVf6/MACgp9Py33Zz2M9a29Io3XDGtIDAPS4xVT66PYeZxpHQ==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr21444957wri.130.1572860135741;
        Mon, 04 Nov 2019 01:35:35 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id b8sm9771016wrt.39.2019.11.04.01.35.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 01:35:34 -0800 (PST)
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, vinod.koul@linaro.org,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
Date:   Mon, 4 Nov 2019 09:35:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for reviewing this!

On 03/11/2019 23:19, Linus Walleij wrote:
> On Tue, Oct 29, 2019 at 12:29 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
>> gpio controller to control 5 gpios on the chip. This patch adds
>> required device tree bindings for it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++
> 
> The bindings look OK, but remind me if I have asked before (sorry then)
> does these GPIOs expose some pin control properties and that is why
> the driver is placed under pin control rather than the GPIO namespace?
> 
I don't remember you asking about this before :-),

This controller just has Output enable bits, No pin control properties.

As you suggested I can move this to drivers/gpio in next version.

Thanks,
srini
