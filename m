Return-Path: <linux-gpio+bounces-3540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537185D139
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 08:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C041B208A4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 07:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFB43A8F1;
	Wed, 21 Feb 2024 07:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxQIfVvV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AEF3A8F5
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500152; cv=none; b=YudyUSHW3z+WFTlZ+0G9Q5Hy+f42Bo80h4bhUlaXFutB4ehk7KQCT7cDc42g5FPwf5ZhfhZnxWxrZv4EbS0ELSqN8pGLI4Ub/7R6+ejiRl451Re7It8vFZnBsxTw35NTUMvJk6XIgALcHhfERLLqwQ3O91LGkVD8lFuqSETqw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500152; c=relaxed/simple;
	bh=3O93qNF8+2CiBS7WBQM5atUdR59LfRODT8g8M2xzGyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tULoCZeY/TtMgM27xrL76YzTeRMJNRDpfwpYzb+CcUNT+9rrItETHF8kPQ6y90d/gFIgyrZA7kC26s3anV8D5/pQL5Bz4v73Mfv52Mj3baOTD+7sK5nLj3KW4ChFMvb7tu80RrN+xp/j8zuF2OH/+TtwA8U26Q5gun+THKxL9+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZxQIfVvV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso1093163766b.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 23:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708500149; x=1709104949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVg75WMB4bU671zyMkx6SIAuy0Vhy4K8MAIbZArXsgY=;
        b=ZxQIfVvVyw8JWoukoX6MrdFUEcPZtquiYF5k/svGFxrd9hjtDnMWJgt/irzuA6pGb2
         Gi9fHhX8fiHA66KPeGxuYs6UDrhbxX6d3e3EwPQXwJ+eglQfaUBYL7BXLts4Czpl0SBA
         7wEQ0ngKT2r7YdeSVPLdfTDF1H6EtMZvk+4aR/30p5ZvSEVLfH9zxYe1biHA8TnPRZpq
         2RljoiK36D/jD58IYPtI/AtgX7vD7HccFuRNc/9B3iGV8NfVgrEg/DcJSqkazKBOUQKG
         eXzK/F7wQyZdc+jZCiGmRKg4J1plrTg4tSnd++25E346xcJIdksMHw+puh2KAD6ixfKt
         J4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500149; x=1709104949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVg75WMB4bU671zyMkx6SIAuy0Vhy4K8MAIbZArXsgY=;
        b=Z9/Kt/iRO5q9Pi3umQr666qgPT40t1buSEOZ3OCoz7JSeBichzIZebhckg//6JgJdi
         Tpxx/WWbPcW3UQna//2LCOqpyEu4W9wZbFZpR4b3WtkRdRBN7THEyccxMZDgL5BixZ6k
         AAjTKjcP1SX1ZexQkRLcTq4mzV8lx/rCbVKCYAYRcSm3sMzyl6NRnX7wDglcs1oMV2KO
         jEfG/LPI4De/h76ySV7XmcHiYfQrAykAX6zixmasBTJB1cRK71+FqWNCwXu/aECjaqUN
         +nNcxbiN1OUB282oNHcbkFKOvZPY2d1R9TpTnXIq6blTOhoo/gyVExF1U2I/A8EacYR+
         Gpyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOWS3vNo/OpSut6yASHcMPb2PDD4AZxleX1OmPdhHfOO2zWI9CSNNchyVnlbi5+DbTPqqxgmO+2sUZ2LYSQdklxDV4U+te9Qdcmw==
X-Gm-Message-State: AOJu0YwkCbE8dNCL/8HnSTH1Iy+k9OwxFi6whvBrmeykbZSS2qRhv/jR
	yqiqUliNX+dVDde2vj8TFb7EEUj9kYzU+RFLONQNhIs40zNU+2YTOZT+maMH//o=
X-Google-Smtp-Source: AGHT+IEhrm7zSIQAtFP3vEsCmaETfQ8+5ZHFLPQeAqhXPG4TNFG81uz7crO/8Ne80B9gVzy90y2DwQ==
X-Received: by 2002:a17:907:1b29:b0:a3e:78fb:6856 with SMTP id mp41-20020a1709071b2900b00a3e78fb6856mr8705964ejc.5.1708500148923;
        Tue, 20 Feb 2024 23:22:28 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vi8-20020a170907d40800b00a3d61775382sm4653366ejc.0.2024.02.20.23.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 23:22:28 -0800 (PST)
Message-ID: <9393d46b-6bb1-4aef-84ac-b22abeac7656@linaro.org>
Date: Wed, 21 Feb 2024 08:22:27 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: gpio: Convert Aspeed binding to YAML schema
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, linus.walleij@linaro.org,
 brgl@bgdev.pl
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, joel@jms.id.au, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240220052918.742793-1-andrew@codeconstruct.com.au>
 <0d1dd262-b6dd-4d71-9239-8b0aec8cceff@linaro.org>
 <18dfd5f2eff5049fa5e3a098490dc601cf146f96.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <18dfd5f2eff5049fa5e3a098490dc601cf146f96.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2024 03:41, Andrew Jeffery wrote:
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - aspeed,ast2400-gpio
>>>>> +      - aspeed,ast2500-gpio
>>>>> +      - aspeed,ast2600-gpio
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +    description: The clock to use for debounce timings
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupt-controller: true
>>>>> +
>>>>> +  "#interrupt-cells":
>>>>> +    const: 2
>>>>> +
>>>
>>> ngpios with some constraints
> 
> Is this just with regard to the constraints I have under allOf above?

You miss ngpios.



Best regards,
Krzysztof


