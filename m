Return-Path: <linux-gpio+bounces-11231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37E99B1FF
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 10:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC261C21313
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 08:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DCB1448F2;
	Sat, 12 Oct 2024 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErbrKG65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D534C137742;
	Sat, 12 Oct 2024 08:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728720590; cv=none; b=Fr1QJkTvfSTcPOnbedKrI+UrdILjBtRcA7RvsMTIsCHOD2V4TZ13MwVzYMxXySeuxePUQ2zHtoNbzkmyWgpHAjbbP6qRfDTRuQ4k8yVKF+cnVLK4nAHw1zMbEd++wSNJEX3cNrzRtQbm6QV7xnBk/LNA+fqT1F0ZX46wHWuIUy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728720590; c=relaxed/simple;
	bh=atlYT20eAYnrOZCXwA/5ugj05VCYMtuJkD5KY6xNtiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwkfH1d4QYDc6ordY2pc78Un2cU6hYlVgAoji+Oenwa6d1OV5vLcJhfUZsE3VBb1hKc7GkOp0xBHr6GyvfAfHdIuauC71OU0yc9BsbzS4ejTSvZGrh1oGPBe3vdAbHkF/rGvVgMo6Zwrphnp2q5dnaijh0vyPY3cGkLLNh6Orp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErbrKG65; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9362c26d8so4419954a12.1;
        Sat, 12 Oct 2024 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728720587; x=1729325387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y47osbZEpig2j8Dhtrtaq13j7HQ7OuMMaZaPMSflYZQ=;
        b=ErbrKG65wGz2ZUMwaHjKbTeuThy2ec+p7RGNquzu/xlv6PpqjJxQ2p/dtntZIshuTm
         NDC5u6JwU4zy+0CzEbIfneHB/6NtTXCl/wxDanRcmVS7gRVnLU4Mz54LingHroPCdH79
         gTqcJkLHc38rd31M3JIJQqWY6hNtOnG9AvhmMvUM4dKjl8VYKKOHXdIz7R7seW35pN8E
         jYfN8JVe96oipby6K1uTnHi+sH3cjDH+q3HOP/BW18AuMwFSy/ULAuBq1VLCxY7p3esE
         7kuG6jj6YUcKnKwoHnTbZBT3sZogLZOW8i0s+uSJCAxjbBNCxar4v8zbkGHGkToZ3E55
         Tgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728720587; x=1729325387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y47osbZEpig2j8Dhtrtaq13j7HQ7OuMMaZaPMSflYZQ=;
        b=JCLVTDjM/lg1oyFPwBdFihjiGPdTH1/gux1+x+h1sec4Ao/ySFQWSBv3yrGSRZ3YFJ
         ZuvDAx88qkeMogkSQx3tZdyigZOLUMdo4K6JAJd32O3xqIjxL7YG7maLdRmlOalWfK/X
         tk7K9pHOLH6xN1TIpz7xuuM1nIIEDfepe0rxfqkzzp9RafaCa+CCV9FLjQO3njsfmRHR
         G/ndx9zsGu898/Y+m9POmzHEUzmV704C6BIPun4Ju5aR/xnpHvPqlic3mnclQ6z1zNEP
         wxEbw7ZTLbHhT5g0FaEuhe5UEQbD0kRX6YatQObMRn7mub+wSSSbvOrvwI3zVFUaeGiX
         kLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVIirbDM/RwK0fHdRwg3AnhGo9ZDRePPAxaU3gKMMjNLCvII2+FFb1OWLnjElhoOy/Cc6PLh5UXFdn02+Mz@vger.kernel.org, AJvYcCXBg4m1troLWQ6T/6MvZFiYDHLy24n667dI1WVmMfq18Z0hreryWRxAdRbcXv08pLzMl8S3mTzYsyAw@vger.kernel.org, AJvYcCXxvjW0fRjRvgpIly0Z0VhOWUtuEMkj8LuudwaGmAd+AcF2Rtxg41cMVLroYoucN6Aq/jQdBdrsnY4Xgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsf6QcLY06zvusVy/mnR05Exdhl57Oj+6fYQuhZIW0TflFrxk3
	JmyuJ5P6H3JfarW6U3b1Nm0MdTFOz5MkPR0n1jSiErcd0sNY5qob
X-Google-Smtp-Source: AGHT+IHwDQt+BavVrp0xAiwiPItwadb7l4mpS1tMpCHTp3qUc1XcuRjeOZD/fRmRhAPcaznsqWGOHw==
X-Received: by 2002:a17:907:3f07:b0:a99:5587:2a1f with SMTP id a640c23a62f3a-a99a11087b9mr980459766b.15.1728720586881;
        Sat, 12 Oct 2024 01:09:46 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99ef5f3128sm35734166b.42.2024.10.12.01.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 01:09:46 -0700 (PDT)
Message-ID: <e410cdb6-84a7-482b-9234-3f61077b8151@gmail.com>
Date: Sat, 12 Oct 2024 11:09:47 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
 <20241011165640.GA2475122-robh@kernel.org>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241011165640.GA2475122-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/10/2024 7:56 pm, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
>> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
>> has a description of the pinmux property, as well as some additional
>> descriptions for some pin configuration properties. Pull those changes
>> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
>> preparation to combine the MT6795 document into it.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> index 3bbc00df5548d..352a88d7b135e 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> @@ -111,12 +111,12 @@ allOf:
>>           - "#interrupt-cells"
>>   
>>   patternProperties:
>> -  '-[0-9]*$':
>> +  '-pins$':
> 
> Worst case, this could be an ABI break. Best case, it's churn for
> mt6779. Is it worth unifying?

It's better than keeping different patterns, isn't it? We wouldn't have 
ended up here if they were made as one in the beginning as it was ought 
to be considering how similar the hardware is. It's easier to change now 
since nothing is using it yet.


