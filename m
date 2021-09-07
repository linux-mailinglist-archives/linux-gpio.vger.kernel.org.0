Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1843C4024C0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240530AbhIGHxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:53:41 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53180
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240242AbhIGHxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 03:53:40 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2928740199
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631001154;
        bh=6hoir0QrvzeNUzQCfwlUC1LyxisQ8e3e8Z8lne4EEGs=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=FWEtem86IVzUvP2YrmPEHJNh/V9ualuZT+j+hqnXnmsOqpaBhHxcz08t8B7NMu0Fh
         k+hqfOiv+vD7gV8OZUjko06Jl8jm2Oc2x75aq9Xl74GDZ9VKIg7e5l7ov85TpnsDLZ
         vDYGAtkhEo+f9crPCLagWJtUpcunXGwgPhBqdtNT1KmlAxIUGdz1uVzCFbmv6ByT11
         xmRv0v2Hw4GuL8PumrJBoL1onega2ldBhXgHhUbHB3yVEkkB2xIwqrkIFNgnfobswy
         yXS9M3GTuq6fHTUu8HPPIeUHKH/99szI6i/3Cr7wCUETj3PNm8angJLiDqUy3/etCT
         PfSpO66GTL7Jg==
Received: by mail-wr1-f70.google.com with SMTP id u2-20020adfdd42000000b001579f5d6779so1832036wrm.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 00:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6hoir0QrvzeNUzQCfwlUC1LyxisQ8e3e8Z8lne4EEGs=;
        b=D24Ux+2avc/cERzAcmZ/d3CKzNocoNCSosxak12bjWdr918FaPfwuEhUfYkXAZdTgo
         /N1J62+RMQp00BOalLv8Ee7vhYOZDQTKOhytbN4Y7O6+I/BUGmeuL3B7gPK2U43UvaFW
         z2PRYXdhjBHnS+qzaH8nDwzrDyh1TmcV87p8x+sfcFZDcd58nP970QtGjOotbnuYIv5e
         nMIRPjWdzPv6TyEq2/vw7LSK3Nix3gpbhdPqxQGStx+zZiRaN+T9HMGUCvBnutEdK7h8
         58yLCs8EpSzyN2Zp1Kgup8e0DljWp3M4sq3NCTvLUROGt+P2EUQNx+aultqj3QFxDtcj
         h9tA==
X-Gm-Message-State: AOAM530udKi8KwaVbwY9anEYS+eDhzf7DZNeQ8tcPSI8dicPyQvZQ8YQ
        YaRpPGz+BRIXd0C8XclJnHVF3cB18yFHbDjLYVU2P6sgkyoT+5h174XQMGZ/RVHclKtK3nm2IX1
        RPoqQhdWlUdGc2GOi99Twe/GuuqKw1+p+Lb/Iv58=
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr2518044wms.162.1631001143086;
        Tue, 07 Sep 2021 00:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalMdA7sfLPAn9UvoPi+zO9Qi/NDlD8yJUM6rPa5gBN6QUCzPnSz15tH/qJZ8I+YWe/XOQ1w==
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr2518022wms.162.1631001142926;
        Tue, 07 Sep 2021 00:52:22 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.15])
        by smtp.gmail.com with ESMTPSA id d29sm9645189wrc.6.2021.09.07.00.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 00:52:22 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] dt-bindings: serial: samsung: Add Exynos850 doc
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Gall <tom.gall@linaro.org>, Marc Zyngier <maz@kernel.org>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Stephen Boyd <sboyd@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-4-semen.protsenko@linaro.org>
 <YRwodjUxlZmvrvSC@robh.at.kernel.org>
 <CAPLW+4kvty3PQmSki8eM+WSgcA+zFfyD+--e6KBpird0-gOhMw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20525267-0ea2-cac6-b42b-f651dce3ced5@canonical.com>
Date:   Tue, 7 Sep 2021 09:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kvty3PQmSki8eM+WSgcA+zFfyD+--e6KBpird0-gOhMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2021 18:27, Sam Protsenko wrote:
> On Wed, 18 Aug 2021 at 00:22, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, 11 Aug 2021 14:48:23 +0300, Sam Protsenko wrote:
>>> Add compatible string for Exynos850 SoC.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>> Changes in v3:
>>>   - None
>>>
>>> Changes in v2:
>>>   - None
>>>
>>>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Hi guys,
> 
> Can we please merge this one? I can see that corresponding driver
> changes were pulled in already into malinline, but this one seems to
> be missed.

It's a merge window, so this has to wait.

Originally, it should go via Greg's tree along with the drivers. I guess
Rob will skip it now because it has his review/ack. :) If it is still
pending after the merge window, ping me. With Rob's tag I can pick it up
via Samsung SoC.

Best regards,
Krzysztof
