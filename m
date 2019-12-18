Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13F8124E7B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 17:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfLRQ44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 11:56:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40598 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfLRQ44 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 11:56:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so2688520wmi.5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 08:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8jj912AzfGGR36Zyy9ypT1L40eB7VdydRDFRM+xeTvg=;
        b=NG5VFsWc8OpSQic9A+qnuy4tuyQZdBU9/nTqultIIQayP3uOueYT5vGA+8b6M1HV8h
         bxdKnjCmG+UfDHsM8noS2NBaSKlX8UL7eihej0mx97HbhLYXYKoJW254BhYko9SuLy33
         ljPy0UWL3KfqEm08I9Fd7J/fBnELrh2eBp/0uGIliwDzc/kmvW16bQSO86KgMZ77Oxc4
         7sqGqHZiqgXXKs8pBrz7C2h7PxHHGL67p3nWtaJN/ECZaGsgw7EBw5njpjDVuZ8FPbSS
         Rjj4RUZmI4aVN6NQis8G2s13S6sI8seJ9kRgafhXcBCCtsf7SDB1RN6ad4GwWfiVkZSS
         eEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8jj912AzfGGR36Zyy9ypT1L40eB7VdydRDFRM+xeTvg=;
        b=BcsOHwCQOJJm8vxVWo+EmvIC0lGR9jzh1RFSfIKRVLjBQz0U1o0ZSOuPtxSaggiD3c
         Gju4HjYOPZhNbowQy1bbSJ/z9Oy7WQHRLDGzHJGpesfMTzk5NvrWkRXVoa4mov6F4/6G
         qSw9OK3dFm3tYkP8ObOZIUf2bsgzsz22fSf9LfplfZKFAbKaFPsl0397QBrgiHUFLgEQ
         ArmWi3wpbcqITnIBnyY8iZUJn9gHjTO82D7WA+pIjOnJ/F2QdnN/sAG/EUMKfwsYxkSh
         LSjKiEqHSfKtXJXD8TwKrgXoYpULOJ2WJk1zAFMDhvIcNJk7fX8aPuA4qbfwODUlS81Q
         ZVhQ==
X-Gm-Message-State: APjAAAXLWLlB3w3ISVzo05WDO5YmHBzQ8U53Y/kYXC25lhkI6+K7X6aa
        qHm+bTX8aTcmlzq0kNi1N5vgk/2hR2E=
X-Google-Smtp-Source: APXvYqznvg70lQUmBT0CE2ypcnW1H3HGNTT/+ZStxK+nd5g6Jq0zy6bdSurZTVj87HNT3pvZgPeZVQ==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr4472324wme.90.1576688214360;
        Wed, 18 Dec 2019 08:56:54 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id n14sm2981137wmi.26.2019.12.18.08.56.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 08:56:53 -0800 (PST)
Subject: Re: [PATCH v5 03/11] ASoC: wcd934x: add support to wcd9340/wcd9341
 codec
To:     Mark Brown <broonie@kernel.org>
Cc:     robh@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
 <20191217121642.28534-4-srinivas.kandagatla@linaro.org>
 <20191218114624.GB3219@sirena.org.uk>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <80a291dd-9063-ca34-08ac-5ed194e05e79@linaro.org>
Date:   Wed, 18 Dec 2019 16:56:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191218114624.GB3219@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 18/12/2019 11:46, Mark Brown wrote:
> On Tue, Dec 17, 2019 at 12:16:34PM +0000, Srinivas Kandagatla wrote:
> 
>> +config SND_SOC_WCD934X
>> +	tristate "WCD9340/WCD9341 Codec"
>> +	depends on SLIMBUS
>> +	select REGMAP_SLIMBUS
>> +	select REGMAP_IRQ
>> +	help
> 
> Why does this not depend on the MFD change?
My bad, I missed this, Will fix this in next spin.

thanks,
srini
> 
