Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3B42C691C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 17:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731209AbgK0QH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 11:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730985AbgK0QH0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 11:07:26 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24AFC0613D1;
        Fri, 27 Nov 2020 08:07:24 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so6093173wrg.7;
        Fri, 27 Nov 2020 08:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VtmKlc5l/pNObTu4OTm+GaZxDRv60yZmGnsF1o+ezX8=;
        b=QV/bPxNQUyGThdVnks5FOF5dzJv1fUblWtU8smU0v+wvenV+D6DXnj62sXGiVR+dcc
         D/bCLm3Ihx5alkaavz8ZfaVfqGdDwtsjTPMvvjp6uyndmOw08LKJIUFzObbwlypEEHCa
         Q0pUxyv9mGpPGUI+LLOKrp7SpMDHACHqhFM4BgcXnJRKiE0bXjnkMrv/eeYrCQ7Wf68k
         9jKoTSm8CcUOysgHPn//NDrjAyb3Af08LgIBkNKmyGrsLfOQugKDOE16Hh2G6bTWOHoB
         9xLTWBXfpvRSk3dQ7shQIX7HrHyoTyxpN0QUxZOc4ftl6L0eCrR1rzELUxhMZWMo5q2S
         JxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VtmKlc5l/pNObTu4OTm+GaZxDRv60yZmGnsF1o+ezX8=;
        b=CIXGf7/ogSjjc1t4rxD2HRmG5QxOJCWY8aXIwzB7ezGcpoxvI1kPD8XX/ftNy6OhUL
         7DP7NBdeWGKPF01crjD4RUgMREEmERUBr9k/Oi8oY2MkOHg6YZIQHrv3nFNLEL2n3ZQS
         uBZa9XYl5Pok5Gwy2vA8Snx8n4izVliYZB6B9JSG1nZhg/B2myN0h5EarMoU7lfxChiN
         Hgh/vyNXYdN8/AZGBXW3JHnzPP5fdXvH9Fb6WBORFgX8YEPhX76HLRrJYH2JLweY+Pwp
         L5f+csB1bsxPKO+0crPem51Z9px2IAFigqLAfOAuq32Vua0+N5NImHEr1oGz9CrVlzpS
         FkXA==
X-Gm-Message-State: AOAM530uCfvVhTKXzn9qe4+tKvzhVln9MLrpWtsfQQ7rrXctIil6KE10
        a9MoUK3ZTIsaBUTjttkae83vBcUt+oaIIA==
X-Google-Smtp-Source: ABdhPJxmWVMnpP6RPhy8WzzK/a37799ZB7hvkB+DXcskQvASOZl8TlksZVEFOkbaTlU1kY5P+CsaXw==
X-Received: by 2002:adf:f888:: with SMTP id u8mr11266010wrp.381.1606493243410;
        Fri, 27 Nov 2020 08:07:23 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id c6sm17825734wrh.74.2020.11.27.08.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 08:07:22 -0800 (PST)
Subject: Re: [RFC 1/3] dts64: mt7622: enable all pwm for bananapi r64
To:     Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20201016204019.2606-1-linux@fw-web.de>
 <20201016204019.2606-2-linux@fw-web.de>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4568d457-50d6-924f-c2ad-d6e508a543e4@gmail.com>
Date:   Fri, 27 Nov 2020 17:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201016204019.2606-2-linux@fw-web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 16/10/2020 22:40, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> mt7622 only supports 6 pwm-channels so drop pwm7
> 
> third pwm (pwm2) is inverted and connected to fan-socket
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Patch 1 and 2 now pushed to v5.10-next/dts64

Thanks!

> ---
>   .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts     | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index 1cc4dcb0008c..ad5b1592182d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -414,10 +414,15 @@ mux {
>   		};
>   	};
>   
> -	pwm7_pins: pwm1-2-pins {
> +	pwm_pins: pwm-pins {
>   		mux {
>   			function = "pwm";
> -			groups = "pwm_ch7_2";
> +			groups = "pwm_ch1_0", /* mt7622_pwm_ch1_0_pins[] = { 51, }; */
> +				 "pwm_ch2_0", /* mt7622_pwm_ch2_0_pins[] = { 52, }; */
> +				 "pwm_ch3_2", /* mt7622_pwm_ch3_2_pins[] = { 97, }; */
> +				 "pwm_ch4_1", /* mt7622_pwm_ch4_1_pins[] = { 67, }; */
> +				 "pwm_ch5_0", /* mt7622_pwm_ch5_0_pins[] = { 68, }; */
> +				 "pwm_ch6_0"; /* mt7622_pwm_ch6_0_pins[] = { 69, }; */
>   		};
>   	};
>   
> @@ -537,7 +542,7 @@ mux {
>   
>   &pwm {
>   	pinctrl-names = "default";
> -	pinctrl-0 = <&pwm7_pins>;
> +	pinctrl-0 = <&pwm_pins>;
>   	status = "okay";
>   };
>   
> 
