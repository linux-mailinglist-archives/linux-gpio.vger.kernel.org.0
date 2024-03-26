Return-Path: <linux-gpio+bounces-4627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72D88BAF3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 08:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9BF8B224E7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 07:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB7D12DD8E;
	Tue, 26 Mar 2024 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLhj1z8j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F042F12AADB
	for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711436822; cv=none; b=geqWbJE+BVlGXNrw2xlQonSHy1lRDUDp3QNghXNhUhdNXt7C348eeE5EHXfsT8IXlQK3R0LQ78FODhmW00n1AYK4DXJIUztiHHKV9KTX88u8GS3GQbAqaDkWG6tzrMvlBsWNhUcUrblKEII07S3+u7CBAMR3lPJZ4TgWtdjm3Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711436822; c=relaxed/simple;
	bh=27X33dSuZYlzCFlpJcdQuEBE7+HKobZJg0Zd8JOFoTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+yhwwMeSYszpdaw3wTg2+vLH/ReozmYnkDPGh7SVHk99/T74hd73ImBHfIb8+r6lREX6Gz9TeVDASIDs58KS4MscXWG7XFS/u8fx5L3rg8RbGeWE9Vkjbz2EFdHC+CYjQYWf3KjTsW1Hpemm+BRTaN/5UK7TqUiyytxXvzisZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLhj1z8j; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a472f8c6a55so464461566b.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711436819; x=1712041619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RhQ5nPQg0bSfGFNfhMd6MbdMjz2VI3hGVI8vbwgCExw=;
        b=yLhj1z8jY7tH4/Lo8qm3v3NFDKF1Kawi9DiOwEm3Ujv1R0xxjA1+U4P1l2hov+Llkp
         uQWACa6/D7fibgY8CcWlt6s//YVyl9rWVWfVsKoUjG1XOSlnAz+FMIW6KzquIv1uyF63
         xR+uwpmT263xCXLexZhqV3pPmWyWc1QTpLc3w4KxqPrSxs1xaJIfOVLYcjSokmgKk95f
         aPZe5tD+XnMzs0QHPCgY8OE+npTS22BfY4G6bXfaO+PaO8kfp8KML3+MvvdmjihohAA1
         LcnPLum2Rux/cjFao471r5E9xlfVlzsMp4WvgoJhna6NIosW+sZMkVavycsOPXK1uEbQ
         2uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711436819; x=1712041619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhQ5nPQg0bSfGFNfhMd6MbdMjz2VI3hGVI8vbwgCExw=;
        b=AqGkna+53J8nXh7aM0+CwQ5IWE7WwVdcblfUJ3wfWcqzOe8YfSei6kz/xCXR5NcGnp
         T8qJTY9KJBNGHGOMR5yfITD9r6xJOvm8Uw9YaPmaun1NalJjQRQ0qCp855B2ZRgb//QM
         s8d6m0PWr8iWqJx/JFR4rt34U/x3KtVb9tmYXnAnTQGWbFWMYaw1MFr3qUxYuQ2WLnd6
         NLBGHXNlorl5SUs9rfoNY0E01mbXkqU5Xg6sDNWJZrkZBO31pVAsjYjSdAR80kri7z4y
         E4kFKY1SZQH5nFiuSlWBZFk7MF35ZuYsgupxHj9IM8KZqKTpEZlD/EvIdskexzgE57Ar
         IJKw==
X-Forwarded-Encrypted: i=1; AJvYcCVc0VmaxxGE36PLTYcCfWjwhnOuru5TA+1CCeFyDBx05SuLR4A0dTV3t7w1yrCJ7GBoJE/GDII7lnGUc+bIVTSYWv5cJygrBtR3uQ==
X-Gm-Message-State: AOJu0YyTA+sb16Ir0yK4r1Za+Dzk5Ob7m/+V8Qz8O7nrs1dcYpH6gGVm
	9WBOiB8B3hr++1JMSuBh77rjQw5kxsw5xT5BKzzgbJU5GDlx6n6da/5o9SmXXkwlfQ7+kcAC/ZD
	+
X-Google-Smtp-Source: AGHT+IH43eLoliAUg7nNanxrDDBab9vSnMN7ndLoU58s2kaE+OQH+PjWqQ2/GkyK9MPMytMlpBUhlA==
X-Received: by 2002:a17:907:7841:b0:a47:30b2:3af6 with SMTP id lb1-20020a170907784100b00a4730b23af6mr5936685ejc.51.1711436819318;
        Tue, 26 Mar 2024 00:06:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906170400b00a473abcb9fdsm3915571eje.90.2024.03.26.00.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:06:58 -0700 (PDT)
Message-ID: <6cc81b1a-12e6-4d81-b6c4-6297c213d5c9@linaro.org>
Date: Tue, 26 Mar 2024 08:06:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
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
In-Reply-To: <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2024 01:49, Laurent Pinchart wrote:
> The raspberrypi,bcm2835-firmware devices requires a dma-ranges property,
> and, as a result, also needs to specify #address-cells and #size-cells.
> Those properties have been added to thebcm2835-rpi.dtsi in commits
> be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
> bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
> limitations"), but the DT bindings haven't been updated, resulting in
> validation errors:
> 
> arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges', 'gpio' do not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
> 
> Fix this by adding the properties to the bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Children do not perform any IO on their own, because everything is
handled by parent. It is really odd to see dma-ranges without ranges.
Referenced commits might be also wrong.

Best regards,
Krzysztof


