Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964F7F135A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 11:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfKFKIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 05:08:06 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:37038 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbfKFKIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 05:08:06 -0500
Received: by mail-wr1-f53.google.com with SMTP id t1so19061227wrv.4
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RfazqxK++NUeQGibGNsb/xwtl2AjqHTLxKqC49MTjR4=;
        b=vO6giWxhl3D8Ew4bBQphqLy0x5vLotCBC10MctFCYaF30IL9VTV0hCx5csqFpfbOac
         OZ+Fne3LnI3q7YyZNNK7WVZHqdOHesj+x30hKRu+5ukVHog2AS/HmQx7UX4immTCHhGU
         HyUxdJTeevWpRa2LDfBK4du66HGutnLI35hwOza2cemUrgrV0paJ8JOBRoVL3G/iHWZw
         juCb2ZkL8PUFtj23OtQoX9s5Bm+pawpiO3+qDAf7JwrV/UoSqRv6+/pzdRko3aLKx28K
         EjmAbxeqoeGpQV9Ls40nkMIV8mcfuP7a2kuAIdaXoGPpajOc8YLylilehZiPOPu/1IVw
         eINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RfazqxK++NUeQGibGNsb/xwtl2AjqHTLxKqC49MTjR4=;
        b=JlrwbkCbNb5ssQe9NKlXhHTyHwIECAJhdFQN87hL9h/+OhrfAkLJ33vhk2N4CQCFhm
         9JeLovsMPWzyI7DL5nMSnNP9h2DJ6u9TUw1J6ZNLRdhq0qNBbYoo+m7XxO8eBbr0HZW3
         Kx5wtyW8gY7vhQv+kMiE1QWWBen4bea0SH5j0v4EguAMP+GvTeRJ9HF+qf0yMY6hKevJ
         uodcuBUMUVT+s/pSUv4QWAOcFQMLa+xp0CyraZsEJQoXAeXNk4kD91qvSMg9pLckJiy6
         0Avu1VSOFtRkYC4Hqipjc5TsyBb86ulMDXUklaOQ1HLrUv79vB6vEck1sSDDOjVNnWib
         HrOQ==
X-Gm-Message-State: APjAAAXGOZ5U2v9HB/hAxG+ygryb/Cu4pPjmcftQpUqS90xSw35coaI2
        LcqdMrE2OOJo4LBjjtRDe1SmD1WRfeQ=
X-Google-Smtp-Source: APXvYqxLATsv0dpIOklFV3PCz8dC70Zj2vsSWYi/3P2nLGCV6B+BbAH7mLeIYbgJgVf1KaSE2F/j2A==
X-Received: by 2002:adf:b608:: with SMTP id f8mr1716914wre.99.1573034884360;
        Wed, 06 Nov 2019 02:08:04 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id j3sm15897267wrs.70.2019.11.06.02.08.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 02:08:03 -0800 (PST)
Subject: Re: [PATCH v3 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Rob Herring <robh@kernel.org>
Cc:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
 <20191105193100.GB4709@bogus>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <315fd1f8-b6b5-5df7-604d-4ca92b31772c@linaro.org>
Date:   Wed, 6 Nov 2019 10:08:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105193100.GB4709@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 19:31, Rob Herring wrote:
>> +  vdd-micbias-supply:
>> +    description: A reference to the micbias supply
>> +
>> +  qcom,micbias1-microvolts:
> The standard unit is 'microvolt', not 'microvolts'.
> 
I started with microvolt but dt_bindings_check reported errors.

looking at 
https://github.com/devicetree-org/dt-schema/blob/master/meta-schemas/vendor-props.yaml#L19 
  suggested microvolts should be used on vendor properties.

Is this a typo in dt-schema ?

thanks,
--srini
