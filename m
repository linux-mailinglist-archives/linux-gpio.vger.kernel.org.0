Return-Path: <linux-gpio+bounces-8728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52B950234
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 12:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12378289F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 10:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CAE1898FF;
	Tue, 13 Aug 2024 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+oBGW0g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951E185606
	for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544085; cv=none; b=MM/nMW8Ujtp/iMm33Ntzi8GJ3IzqTTqcnKGZIjLcf1khdPjF8wi5avFrAR4xtB0KYT3u5ZbuUZvwxWCaCcrt9fQSqyIvcHfD1rk/PNkTCXJ9nDczvKHHAXCBMY9tJeY8fqZLcUSqj7uzfJ8EJ+gt/luQbaRYmvcv5rGAguLkKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544085; c=relaxed/simple;
	bh=wREu/D36uLjySPM4un3nginac5EwGOWHtqt0/8k99ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3lt15TUu+VFP4fYxYR+yUam2pnbKoQclg+WdB5/nIuGlj7aUO7Q7RPEhC0c2+VV4JUBhlGPF0IpFl86pSCLbMkCyRANK5BCoX+eKAk75I5U2Q9oPbPC125xbUEABJVbkJXB9C/cLB87q7tBlStLOttBqbP0rK4xI4zLIfqgmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+oBGW0g; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f024f468bso6194691e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Aug 2024 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544082; x=1724148882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YIi2kTAkl5KHYMgtv3D2yljZbS3C9SwJHPYHBgYsUzg=;
        b=o+oBGW0gK/zxH3HsdRjM5wxG1hidAEGTDRXi6kYZ6txDHqk68dzh9OgP5REbXOrKIm
         YfhI+29Smh8CwK/dTlDAiWy3KfiuCCa8sh45GK3fY/0iZHbp+Ut+YZJC/qV/FulyLFcf
         NxBkL0cFjaTXa5XrHR5vRuknlE9pQN0PlT2yGMVu2iKnUPmRdT0Whu87W8rF4JyLqg9r
         7N6d6Ok1rkHhORg5IfcumOkCoeLP1tWFuLt+7Jtk+L1W1EPjtw/sFhN0sAZWZl01FbP4
         7BR3ILnb1TEy5dFErDLA0rV1H6KEHW0o0yJ+PW+ZYwFdkKEkeBOhq+hgOQxOp3Ummiki
         MB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544082; x=1724148882;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIi2kTAkl5KHYMgtv3D2yljZbS3C9SwJHPYHBgYsUzg=;
        b=la1743CWC6f3HjrBAKIoVnOCNZJuTNQ3zXwJHyaZBdf8TIJhQyQrrkaPIooiNs9T/p
         Zs1qXfs/zVlfqosa76wbdX4chT10R1cNPr9/+C7wG08E+3euD3k8bt24ZvSnFv2Kdd9j
         h3wO488YNnB3kNX4tTvE0g+pexWsxOtlNJjN0MRpJJFyCBlaEhWoIXI5GoAHaw0v91TR
         p0rDrcRINHnwiSUbeKDDIlGDZwt+5si+W4jATvZt36WmQV9cDGHQV6s8MO+4bTnQ1HXX
         l3wPgukYL+oY4s/xSn9d+8Tt2RuGm2C+s0Edo5Ey0Blw9Cww3K241dGHzQPVBczzppjt
         9XQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm4lEXqc3tX6FC3x+73c3NGt5xTxTnYu5bYdkGx905pUWurelMKR+HrYBqexeBp9s5OahRRy7wjQ7MGGvsSLBUEixZC5SUHqOWaA==
X-Gm-Message-State: AOJu0YxxbXujBEj463gBPHK1+dC8pIQqOhe8arS2WK2Qv7Q3LJrzvv0K
	8AAigO27OVQ2qYasNAvLOsznrkLl2RcK+nHrnFsqpjsPJF7txMfWa9M4u9B3RdQ=
X-Google-Smtp-Source: AGHT+IG9hPIybOJGXD89f4JWm29+GhMD/0H+GQVsuiviN+NPV7jroNI/1UztFFEm0Y1nJSs9TaJPEQ==
X-Received: by 2002:a05:6512:1293:b0:52e:f9f1:c13a with SMTP id 2adb3069b0e04-5321364a388mr2345928e87.12.1723544082162;
        Tue, 13 Aug 2024 03:14:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36be8csm9821144f8f.4.2024.08.13.03.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 03:14:41 -0700 (PDT)
Message-ID: <a93b8d25-1bec-4a6f-9cb2-e8c59b923180@linaro.org>
Date: Tue, 13 Aug 2024 12:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Xilinx
 Versal platform
To: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Simek, Michal" <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>,
 "Kundanala, Praveen Teja" <praveen.teja.kundanala@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <20240801120029.1807180-2-sai.krishna.potthuri@amd.com>
 <27da3261-8c1e-4c4d-a548-acdfee1909f2@linaro.org>
 <BY5PR12MB42586B02EB54BA76704F1062DBB92@BY5PR12MB4258.namprd12.prod.outlook.com>
 <0bded05c-0fe6-4f35-b527-662b3356fb56@linaro.org>
 <BY5PR12MB4258AE889108439ECAA4B1C2DB862@BY5PR12MB4258.namprd12.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <BY5PR12MB4258AE889108439ECAA4B1C2DB862@BY5PR12MB4258.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2024 07:40, Potthuri, Sai Krishna wrote:
>> sd1_wp_0_grp, sd1_wp_1_grp,
>>> +                         ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp,
>> qspi0_fbclk_0_grp, qspi0_ss_0_grp,
>>> +                         test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
>>> +            maxItems: 78
>>
>> You miss minItems... I have doubts this was really tested.
> groups/pins are mentioned as required property.
> Do we still need to define minItems?

These are two unrelated concepts. How many items can be listed at once
in each property?

> 
> ....
> 
>>> +
>>> +      drive-strength:
>>
>> drive-strength-microamp
> In this case, values are in mA.

Ah, no, if it is mA, then existing property is correct.

> Do we still need to use drive-strength-microamp?



Best regards,
Krzysztof


