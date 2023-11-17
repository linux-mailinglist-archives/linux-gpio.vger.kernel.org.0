Return-Path: <linux-gpio+bounces-224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A897EF153
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 12:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E071C20AA4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Nov 2023 11:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0651947E;
	Fri, 17 Nov 2023 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0uNR290"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37081A1
	for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2023 03:01:01 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso1315542f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2023 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700218860; x=1700823660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBWkWs6StiOKfZQ+gAI/eCLlmHQRf4tCCrVpnJkf8qc=;
        b=W0uNR290x1Ntnui7K7UmUFehZfs9YCbOHy08yjZeg6e3Rkh3piwN3o19Lzno8LaPMt
         /YVCXnFxGPfdBrIrk6a2RuJuGVy7QXePRcNj2RnkGE/l7LI/2D+RA36WKNi2sVWV3THQ
         fdSePkMBuPOztyQIZGUJQGotOVxSgBvdn1xpmEvuXeHY88f6UncLbUDmXoe+GMXHfpIJ
         MtTwX07n2C50WriWjJ1J+RuZOiyfH2+9O8c6F8DfePU4Ddk/DaAyr8SPVb4yBGYctrJA
         kpScAChJo7x/ee3mvCrikUkJgz1HCRf3b0Yissmy0Q+RIKo++j33LRWava+3pkyPsnBV
         2owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700218860; x=1700823660;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBWkWs6StiOKfZQ+gAI/eCLlmHQRf4tCCrVpnJkf8qc=;
        b=g5eNICRVx0yNLmM9UpXlkB4cQJKr90gah8Yyx8RE1iKDa05jChMYknT0JDHPCH1BlI
         rDatE8vBuqXOSBMd19/GtqYczSleORa3nT5tG4Yzn6u/zjvAROLeiZM8xBWjf5cWec7c
         ABTqtnQGJrMe/CRFTN4zBygzugZoTSTz86ARQMFdQkf3SCBvnGZQl6alRN7YCHNfMW28
         u2KrPMkbiRj2Qx/fb+wy12e/wdh74nu+jWoxb1qf3crwc1lL+A5uvlk5NT6YztFPae3I
         6/03wapX1BnuFRxx+OjKUhuAgx/jBJcTXMb/WqJ7QKmhCKuWq6IqckrZB54fVByNjR5N
         iAPQ==
X-Gm-Message-State: AOJu0YxzZFiOTSaDY2rQeKowWbV0VqlrJ6qniEW6ONOJD6bgYTtJykLu
	chX/6X0xuT31Q/5qCuhDDyBoQQ==
X-Google-Smtp-Source: AGHT+IGd8YPlZqn1eCwDFIOssIZfG00UFoHhXUsgBkImO7mtVQMHzM/KiiylOUJ/af6wFmBcGBqOhw==
X-Received: by 2002:a5d:6e01:0:b0:32f:d88b:2245 with SMTP id h1-20020a5d6e01000000b0032fd88b2245mr13415500wrz.19.1700218859958;
        Fri, 17 Nov 2023 03:00:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b00331697bbcf5sm1770892wrt.94.2023.11.17.03.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 03:00:57 -0800 (PST)
Message-ID: <d565624f-0cb2-4c42-bcfc-eebef3b7b26c@linaro.org>
Date: Fri, 17 Nov 2023 12:00:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Introduce ExynosAutov920 SoC and SADK board
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jaewon Kim <jaewon02.kim@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <CGME20231115095852epcas2p21e067efe75275c6abd2aebf04c5c6166@epcas2p2.samsung.com>
 <20231115095609.39883-1-jaewon02.kim@samsung.com>
 <170005362858.21132.4200897251821879805.b4-ty@linaro.org>
 <6e69df6c-10fa-404a-ac02-4880723b8c50@linaro.org>
 <55a0f27c-ea46-40ae-b1e5-e650802b89a8@linaro.org>
 <d6f3d451-6a53-46b6-2263-cc071a9dc44c@samsung.com>
 <d8fbd100-2351-4dbe-ae7f-d98a84432589@linaro.org>
 <af102ef7-aa34-1b9d-c39c-228729fef015@samsung.com>
 <2febc62c-c763-42ae-b649-2ca284543cc0@linaro.org>
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
In-Reply-To: <2febc62c-c763-42ae-b649-2ca284543cc0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2023 11:57, Krzysztof Kozlowski wrote:
>>>>>> And dropped. You did not test it. Please read Samsung SoC maintainer
>>>>>> profile:
>>>>>> https://www.kernel.org/doc/html/latest/process/maintainers.html#arm-samsung-s3c-s5p-and-exynos-arm-architectures
>>>>>>
>>>>>> I also made announcements on the lists and on social.kernel.org. I don't
>>>>>> know where to announce it more...
>>>>>>
>>>>> To clarify, I dropped only DTS and kept bindings. Let me know if
>>>>> bindings are problematic here...
>>>>>
>>>>> I also repeated the announcement:
>>>>> https://social.kernel.org/notice/AbqJkj9gOZJ3sG8eCu
>>>>> Please share internally within Samsung, so there will be no surprises.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>>
>>>> I already checked and there were no warnings or errors as shown below.
>>>>
>>>> Did I miss something??
>>> It's not what is written in maintainer profile. Where do you see the
>>> result of dtc W=1?
>>>
>>
>> Sorry, Krzysztof I miss W=1.
>>
>> I haven`t been active in mainline for a long time, so I`m missing out on 
>> a lot of things.
> 
> If you (plural you, Samsung) ever gave me an email address where I can
> send notifications I would gladly forward them to you.
> 
> Over the time I sent few of them, like the one about deprecation of
> platforms or changing some rules, feedback for common solution for
> minidump (to remind: Samsung decided to skip it so we go with Qualcomm
> idea and you will not be able to come with your own later) etc. I was
> even contacting some addresses in Samsung LSI, but there was never a
> response, except the one about minidump.
> 
> There was like never a chance to really get to Samsung, so sorry, now it
> is Samsung's fault it does not follow announcements.

Heh, my post on social.kernel.org is pinned (pinned!) for four months!
Four months is still not enough...

Best regards,
Krzysztof


