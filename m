Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DFC7BC857
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Oct 2023 16:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbjJGOeZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Oct 2023 10:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbjJGOeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2023 10:34:24 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8652BA
        for <linux-gpio@vger.kernel.org>; Sat,  7 Oct 2023 07:34:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405524e6768so30027325e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2023 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696689260; x=1697294060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=94eEVt3eVoDmwE+DGvSN0/z74qQyYZ21QAkDJv+Ws28=;
        b=uFD7+6Z+KZV+50uhhUvsBPI6ae2eKYFtfrptUvTiGeJvv44s7Wb2gg2FAq9J4BdtuD
         7mFZ/1neaOa9g0VKOuCxXSlOVKSNZp7+9tOUqz1TsPnZaa8T1kP0EbHGDbQNrBcnBq88
         Y0tPxahVLyf+7vs1G56MDw4Z1itt8N4gLByuN5IDjxZW3is3+bub0u+29aXxNlEoZqd4
         soSW2jpiGpSxMmhtm9z15gN2ZLuqfa8mnzzSv+lNu9/viquf9kXfKKrXdEWxDRCOvwh+
         K/UebwR3dUYMOb/+QoyNm8AlJC67d8OIcdXiQe3zxxhUpOJHe5f0+VfTC7Do31veMjqR
         CdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696689260; x=1697294060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94eEVt3eVoDmwE+DGvSN0/z74qQyYZ21QAkDJv+Ws28=;
        b=kC4ztlw6Lp9cK9Eem6vbqZidz7odh0EkOjD6KSPtCVR+T0rxQTymZ2GIil5kqqXQk/
         td6eYS29KZu8M9JNKpWIcj5NHOhR74kD/IJqjH5c+UOSCd500yJZ4C5GJwYTG7RAq5tV
         iIU8/axhlUJrQrLsLew0intvkHJJXIck246r9HxB/+9mZwiZsSR6Vtx6etJnNDI1PxZh
         Y6R3cd89gi9Hl0sg2LPQHJAqVonM7jZubY7/KRQ9Z5ZcxU6Ftt1fJGcN0+l3rgBL03bq
         dbrBThcDDpz3BgePKrgrM+GqgwKKsTKM6Axh87GWR4SanpKBe54OU8LOer7TBqOS1f3t
         q8fw==
X-Gm-Message-State: AOJu0YwlVGquEFU5kIyR0kVwChms40QnRFnbeBzFw5xktTuz0gU/07EJ
        dCjdilfprTQAdD4hwFo890PI5Q==
X-Google-Smtp-Source: AGHT+IGVX5SR4JeejKaTLpcg0bv3C9LXR9eUhIRivYb51KXifgCHFqoiZab4mWlNwtjMPLVWQZhUIg==
X-Received: by 2002:a5d:4b11:0:b0:31f:ecb2:1bed with SMTP id v17-20020a5d4b11000000b0031fecb21bedmr10644289wrq.15.1696689260133;
        Sat, 07 Oct 2023 07:34:20 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d4cc4000000b003247d3e5d99sm4383849wrt.55.2023.10.07.07.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 07:34:19 -0700 (PDT)
Message-ID: <c4ea7ce3-5132-484c-870b-a62d30e2ee7a@linaro.org>
Date:   Sat, 7 Oct 2023 16:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
To:     William McVicker <willmcvicker@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com> <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
 <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
 <ZR9EnFw3vB92vlYM@google.com>
 <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
 <e8b23683-36ac-4547-9386-935a1b211d7d@app.fastmail.com>
 <ZSA27y5CVs4yQC4a@google.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <ZSA27y5CVs4yQC4a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/10/2023 18:33, William McVicker wrote:
> On 10/06/2023, Arnd Bergmann wrote:
>> On Fri, Oct 6, 2023, at 08:06, Krzysztof Kozlowski wrote:
>>> On 06/10/2023 01:19, William McVicker wrote:
>>>> On 10/05/2023, Krzysztof Kozlowski wrote:
>>>>> On 05/10/2023 21:23, Greg KH wrote:
>>>>
>>>> Being able to include SERIAL_SAMSUNG and SERIAL_MSM without all the vendor> specific drivers that ARCH_EXYNOS and ARCH_QCOM select is very
>>> valuable for
>>>> debugging early boot issues.
>>>
>>> Really? How related? The drivers are independent. You describe some
>>> out-of-tree development process which we never needed for upstream work.
>>> And we did here quite a lot of upstream, specially if you look at ARCH_QCOM.
>>
>> Right: in general, all drivers are independent of the platform
>> besides the typical 'depends on ARCH_FOO || COMPILE_TEST' dependency,
>> but I think it's worth mentioning the known exceptions, so Greg and
>> Will can take that fight to the respective places rather than
>> discussing it in the platform submission:
>>
>> - Some subsystems are considered 'special' and the maintainers
>>   prefer the drivers to be automatically selected based on the
>>   ARCH_* settings instead of having user-visible options. This is
>>   traditionally true for large chunks of drivers/irqchip,
>>   drivers/clocksource and drivers/pinctrl, though it has gotten
>>   better over time on all of them.
>>
>> - Some older 32-bit platforms are still not as modular as we'd
>>   like them to be, especially the StrongARM (ARMv4) platforms that
>>   require a custom kernel build, and some of ARMv4T and ARMv5
>>   boards that are still missing DT support. These tend to require
>>   drivers they directly link to from board code, so disabling
>>   the drivers would cause a link failure until this gets
>>   cleaned up.
>>
>> - A couple of drivers are force-enabled based on the ARCH_*
>>   options because booting without these drivers would risk
>>   permanent damage to hardware, e.g. in overtemp or overcurrent
>>   scenarios.
>>
>> - ACPI based platforms require the PCI host bridge driver to
>>   be built-in rather than a loadable module because ACPI
>>   needs to probe PCI devices during early boot.
>>
>> - Some subsystems (notably drivers/gpu/, but others as well)
>>   have an excessive number of 'select' statements, so you
>>   end up surprise-enabling a number of additional drivers
>>   and subsystems by enabling certain less important platform
>>   specific drivers.
>>
>>       Arnd
> 
> So if the argument is that the existing upstream Exynos platforms are required
> to have these drivers built-in to the kernel to boot:
>     COMMON_CLK_SAMSUNG
>     CLKSRC_EXYNOS_MCT
>     EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>     EXYNOS_PMU
>     PINCTRL
>     PINCTRL_EXYNOS
>     PM_GENERIC_DOMAINS if PM
>     SOC_SAMSUNG
> 
> ...then that is understandable and we can work to fix that.
> 
> My last question then is -- why do we need a new ARCH_GOOGLE_TENSOR config in
> the platform Kconfig? For example, I don't really like this:
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 76a494e95027..4c8f173c4dec 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
>         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
>         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
>         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> 
> What happens when we have GOOGLE_GS101_COMMON_CLK, GOOGLE_GS201_COMMON_CLK, and
> so on? 

Nothing happens... or happens anything you wish. Did you read the
motivation why this was created like this?


> How are we going to pick the right driver when e have a generic
> ARCH_GOOGLE_TENSOR config?

You do not have to pick. You select ARCH_GOOGLE_TENSOR and proper pick
is done by you. Nothing to do more.

> Ideally, we should have one Exynos clock driver that
> can detect what hardware is running (using the DT) to determine what it needs

It's already like this. We're done.

> to do. If you really want to compile out the other vendor's clock drivers using
> some configs, then we should do that with SOC_GS101, SOC_GS201, SOC_TESLA_FSD

Whether you call it SOC or ARCH it is the same. We organized it as ARCH.

> configs (not ideal though). With that approach, we could drop the platform
> ARCH_GOOGLE_TENSOR config and create an SOC_GS101 config that can be used for
> things like the COMMON_CLK_SAMSUNG driver (for now) and building the GS101 dtb.

There is no need for this. ARCH does exactly the same.

Best regards,
Krzysztof

