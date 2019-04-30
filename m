Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D819DFCBA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 17:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfD3PYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 11:24:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39530 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfD3PYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Apr 2019 11:24:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id n25so4286486wmk.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2019 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sfPiJtc0QJCi1p8F+pLfyW3kyCVBd6/w24lBML4INFs=;
        b=Zq29Lce4FbgANq8O/VR3G2DR2T0McxOvjAYNyFuGiseM6g0bFwbbKyg6YAdPZGaXB9
         qR42Am+otNkuxkoxLnvL3C11uwc87q2JORpiNTArbGaOX9lQsC0H619piV+BTkIJiBqk
         bv14v1HIcvXqUneiIi1i3MHBgnHpgH4Bn0gIhYWoe/SfR+wDasBlzzQmKA2elwrOAlYK
         yRqwj0wM5DdV4t42oN9NHi82sgsbC9HPX8bX7Zc05QL3xz6ypUgyaKckplMe5Mgje5RG
         KrlINFZ7i9Bhg9WVZ7ANpr5QqK1b4QC5i7Y7f627OU2rwVdTFFihabLo3nOatYM6Hw9a
         pP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sfPiJtc0QJCi1p8F+pLfyW3kyCVBd6/w24lBML4INFs=;
        b=M8bo6DOb/aK5LNS+GmFTWdDO5VDCWA9Bvlif6b5GnUmcnpgnLn6IDI1n5jVavhE9y3
         oCs4crmXBJBmjHYZWIXqPV2YHur2jQwZmjI8Z7/Sk1ZeaWsH3W0CWeOub5Crli33pru/
         46yfB0+A6ysEjG7GJ0AAqpy1+u3raf2I37wLmldvyLjsHSePpaC3eCn5ck4JsDBRz50n
         1uACROrs1ZgEpwLD9jMUJzrJYIf8wB+VN+vnqGzReeHRbzsMN33hRDMOoJC6M5uPu74H
         CM3+RupwYcOL42inL+/4hORIWuS6EvwzLXjy/qCt7I3ujTJBa9Tx3e9LWyMmWJ1hBdMs
         +r/w==
X-Gm-Message-State: APjAAAUpPXKXFzaKT12P9VQ4Kl2XoA5kLEf1T/WDRt1jlu/xd/4v1JuE
        SfRyrWVk5FiKdJw//cv8tEKmbQ==
X-Google-Smtp-Source: APXvYqwZu73MRdHtNl6L5wzqWxZQM0gSV2O1ZuD0lDRbcOfSjsiOhySkIltHDNpgSln+Rq/Ek1lkSg==
X-Received: by 2002:a1c:a843:: with SMTP id r64mr1118747wme.45.1556637858428;
        Tue, 30 Apr 2019 08:24:18 -0700 (PDT)
Received: from [10.1.4.98] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s132sm3986240wms.10.2019.04.30.08.24.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 08:24:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
To:     Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        khilman@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-2-glaroque@baylibre.com> <20190430151243.GA6879@bogus>
From:   guillaume La Roque <glaroque@baylibre.com>
Message-ID: <7d1743ca-f45a-133f-6130-c77059d27de2@baylibre.com>
Date:   Tue, 30 Apr 2019 17:24:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430151243.GA6879@bogus>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,


On 4/30/19 5:12 PM, Rob Herring wrote:
> On Thu, Apr 18, 2019 at 02:47:55PM +0200, Guillaume La Roque wrote:
>> This property allow drive-strength parameter in uA instead of mA.
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> index cef2b5855d60..fc7018459aa2 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> @@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
>>  drive-open-drain	- drive with open drain
>>  drive-open-source	- drive with open source
>>  drive-strength		- sink or source at most X mA
>> +drive-strength-uA	- sink or source at most X uA
>>  input-enable		- enable input on pin (no effect on output, such as
>>  			  enabling an input buffer)
>>  input-disable		- disable input on pin (no effect on output, such as
>> @@ -326,6 +327,8 @@ arguments are described below.
>>  
>>  - drive-strength takes as argument the target strength in mA.
>>  
>> +- drive-strength-uA takes as argument the target strength in uA.
>> +
> We have standard unit suffixes defined in bindings/property-units.txt. 
> Use them please.


thanks for your feedback and sorry i don't see this doc.

According to it i will update patch series with drive-strength-microamp


> Rob
Guillaume
