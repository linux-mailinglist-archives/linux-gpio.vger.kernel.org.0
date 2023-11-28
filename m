Return-Path: <linux-gpio+bounces-569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4407FB8F4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 12:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F4521C21029
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 11:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57A64E632;
	Tue, 28 Nov 2023 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWAZ49oS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88EF170B;
	Tue, 28 Nov 2023 03:05:56 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cfc9c4acb6so17526765ad.0;
        Tue, 28 Nov 2023 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701169556; x=1701774356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVQJTW3dRnO94/q6bydtO2smz1lwsYnDTFZVBpKFuJw=;
        b=bWAZ49oSNZVh2NJUpKCzKLQQHh8JfX/fzG2gVKgpIrXmTwL0qO46QoYWvhr+GtvkeS
         VnmH0I7o8ce85HaxxquEYzjDDNIq0imS8sIzOh1gtD0Lm4Jm/7R+c0lKKbTnU5lSbRJ4
         FRyu3lhwZyi4B5otwQ+m1BQmqMhtekGN4JWO5ErO7Zx1Hy68Z6trCIxRu1iyooablC6N
         UcZ8oX7Y3bpPFlT3o9VGEZUBbbHMB8bBXXZ97EoZ5O9ECLMGvNsAIsoVLAtwqlY6Rhi6
         RNlrjyE12Fe6QB6AwMrSYz9pzgbi1A0I6/tM+Fw45X00U7bP6jH10T+dOYyKWCZ0/qza
         /aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169556; x=1701774356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVQJTW3dRnO94/q6bydtO2smz1lwsYnDTFZVBpKFuJw=;
        b=Ww/bhIHXw9OvORaxNiV8Q0Ng9P0/va8ZPexn1MibJ1cYXBZkugarFDALturBPjR7pU
         4pbYmjMHqMiIVWCyYmkjM20qo0YyB9tXT2boiKj0fjSMvMUUvX42EQvfUCCG0IU87cNw
         h5wBENtmRjfG3N9l2t+7xk1QRS7glhU9MSO8oH4mGsWur/3lY0BUQb0ReVrX4PWACQgo
         yrRPjgCkr90mov10uQPZhlwMljPQiMylOI2toc/narAGZ11JYcUGAFx5sgdwG/scv9+w
         mT1+Gq97ZGbJo42XschrAQse0rxM4fFY8yewU2iXcAQVadHoMFHzej9MgpsET2VZ1k9h
         zqbA==
X-Gm-Message-State: AOJu0Yx2vYOfBmICqeNcIM9jVUyiqeWimadaDJrE5ED/CdArx2zrOeJc
	FglZSkVihc1HDy3aBNG8bo4=
X-Google-Smtp-Source: AGHT+IGIjiwpVvOzNfdCPfOsVOawkeFQmxmGuwUbYOa8TOGytx5tUoD52urVlTZsIQg5NeWI2P/x7Q==
X-Received: by 2002:a17:902:c411:b0:1cf:a0b1:ec06 with SMTP id k17-20020a170902c41100b001cfa0b1ec06mr17490761plk.55.1701169555992;
        Tue, 28 Nov 2023 03:05:55 -0800 (PST)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001b7fd27144dsm8102471plg.40.2023.11.28.03.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 03:05:55 -0800 (PST)
Message-ID: <9677c0e5-4da9-4755-84ee-7d0f56335da9@gmail.com>
Date: Tue, 28 Nov 2023 19:05:52 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: nuvoton: Add pinctrl support for
 ma35d1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20231128061118.575847-1-ychuang570808@gmail.com>
 <20231128061118.575847-4-ychuang570808@gmail.com>
 <18276c95-26e8-4b07-8351-7555d7595f7c@linaro.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <18276c95-26e8-4b07-8351-7555d7595f7c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Krzysztof,



On 2023/11/28 下午 07:03, Krzysztof Kozlowski wrote:
> On 28/11/2023 07:11, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
> ...
>
>>   
>>   		sys: system-management@40460000 {
>> -			compatible = "nuvoton,ma35d1-reset";
>> +			compatible = "nuvoton,ma35d1-reset", "syscon";
>>   			reg = <0x0 0x40460000 0x0 0x200>;
>>   			#reset-cells = <1>;
>>   		};
>> @@ -95,6 +96,162 @@ clk: clock-controller@40460200 {
>>   			clocks = <&clk_hxt>;
>>   		};
>>   
>> +		pinctrl: pinctrl@40040000 {
>> +			compatible = "nuvoton,ma35d1-pinctrl";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			nuvoton,sys = <&sys>;
>> +			ranges = <0x0 0x0 0x40040000 0xc00>;
>> +
>> +			gpioa: gpio@40040000 {
>> +				reg = <0x0 0x40>;
> Your unit address does not match reg.
>
> You must test your DTS with `dtbs_check W=1`.
>
>
>> +				interrupts = <GIC_SPI  14 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clk GPA_GATE>;
>> +				gpio-controller;
>> +				#gpio-cells = <2>;
>
> Best regards,
> Krzysztof
>

Sure, I will fix it. thank you.


Best Regards,
Jacky Huang

