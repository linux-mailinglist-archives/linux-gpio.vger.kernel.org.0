Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77007E04F9
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 15:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjKCOt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 10:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjKCOt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 10:49:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5352D48
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 07:49:18 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso15609675e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699022957; x=1699627757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsiFMQZnMogqGZ6BsTPfYpki0batYf4Kn29ZJCZZMh0=;
        b=xumENezMNdjLIxZkCZTGT9RVD8fvPUGlLRfgrY9+egiqyQif95FKZSvd8SKHweRm6I
         ghemtXji/jtKCFExlNl1pOeI3P7Z5Rq1/iI7e8tKhQkQBCIfI/uZh45cnU24ENXwcqfK
         No8pGn+V/KKuhgy+uKI0QBjDnQMQCCDhCLfb/h5vtISOTBOYwIeUnkyhy41pCOWqau/H
         dl02CHxGOofkCF8+32Ehdk3zlmS6G31ayG1k0OMcdwD1+z2vXc/Dp45dzu4YUBFe87zK
         susQwiXAWdCpMF3pAZSJh74JHdJ1X6opgr9rJSSFY1yFbEbSrxonNoWIXytjKC8fPlqC
         DsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699022957; x=1699627757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsiFMQZnMogqGZ6BsTPfYpki0batYf4Kn29ZJCZZMh0=;
        b=Rgt+WBO7WX4eO91W5D6pgFC+PDRP6yP3JkU0+Nchei8zaqmJ44mJdMnAcNj4rJIfVl
         LnxdnJ2nylokTa0IJyF0b9tV+ALuhbQUQ7PyK67sOsItUlTWQs/YKAaN7HMkMq/z92mR
         12+ZLMJ+f8raPNkFkWUfi7/dxRBXd7fDdTfutIV5Pe384/XC7lT0/h+HO5IkY4PznPEF
         Bin6B3gNXmLXHMc+WsX54Bk4PaObM9sXu+JS0TXGqGn7ZZF3RZO3AONIqSvJe6CCUvhY
         W19ksCqRZl+PzGKTMSWBhxNn+SjBPH0+YcrQpCS9BXxWbFhboJHFqGvrFdTWXl+LcBaF
         5jsw==
X-Gm-Message-State: AOJu0Yw/4c6a/tlQf9Y0FYmYqOHUg9G2EVTuAMUHPLKUOOoNz47K+1iT
        VAhyqp7pAmPE3x4NF+wXgO05bQ==
X-Google-Smtp-Source: AGHT+IHqzk3cyeobCOlN3LmUICcBNg46vzAneGHzUg9B7OHbK0YAR+uUqVoVPPGAJnp67+aVkR89lw==
X-Received: by 2002:a05:600c:46cd:b0:405:4776:735a with SMTP id q13-20020a05600c46cd00b004054776735amr19101927wmo.2.1699022957102;
        Fri, 03 Nov 2023 07:49:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id i18-20020adffdd2000000b003253523d767sm2021867wrs.109.2023.11.03.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:49:16 -0700 (PDT)
Message-ID: <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
Date:   Fri, 3 Nov 2023 15:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
To:     Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
        Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/11/2023 14:56, Maksym Holovach wrote:
> Hi Peter,
> 
> On 11/3/23 15:11, Peter Griffin wrote:
>> Hi Maksym,
>>
>> Thanks for your feedback.
>>
>> On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
>> <maksym.holovach.an.2022@lpnu.ua> wrote:
>>> Hi, all
>>>
>>> I wanted to inquire about how do you all feel about calling this SoC by
>>> the Google "gs101" name.
>> Interesting question, I think calling it gs101 is the correct approach see
>> below for my rationale.
>>
>>> I believe the proper name for it should be the actual Samsung name,
>>> written in the silicon and reported in the Chip ID hardware: Exynos9845.
>>> This also touches the Tensor G2 (Exynos9855), Tensor G3 (Exynos9865),
>>> and possibly the "Tesla" SoCs.
>>>
>>> I do not think the Linux kernel should be a marketing material: it
>>> should reflect reality. The chip is almost 100% composed of Samsung
>>> Exynos IP blocks and should be called that way.
>> As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
>> Exynos designs and support upstream uses the axis,artpec8* or tesla,fsd*
>> compatibles.
>>
>> So using google,gs101 is consistent with the existing upstream naming
>> scheme, for customized ASICs that were based off a Exynos design. But
>> it also reflects the reality that this SoC is not a Exynos9845 as there is
>> also a lot of Google owned and other third party IP integrated that is not
>> found in Exynos9845.
> 
> A quick question: Do you imply Exynos9845 exists outside of the context 
> of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
> 
> Also, what kind of Google IP are you talking about? I believe only the 
> neural accelerator should be custom-ish.
> 
> Additionally, I believe it having or not having Google IP is irrelevant: 
> for example, the new Raspberry Pi 5 Broadcom SoC has a lot of 
> Raspberry's own IP, but it's still called Broadcom as it's the real 
> manufacturer and designer of the chip.

That's a good argument. Indeed BCM2712 contains "New Raspberry
Pi-developed ISP".
https://www.raspberrypi.com/documentation/computers/processors.html

There aren't many patches but GPU is still called brcm,2712.

For Tesla FSD, there was discussion and output was not very consisting.
First, the name itself was used for everything - SoC architecture, one
given SoC and eventually the board.
https://lore.kernel.org/all/5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com/

Eventually the last part - board - was renamed to "Evaluation board",
but I don't know how true or real it is.

See also:
"I would argue that if this SoC shares the pinctrl, clock, spi, adc,
and timer implementation
with Exynos, we should consider it part of the Exynos family,"
https://lore.kernel.org/all/CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com/

However it was also claimed:

"AFA architecture is concerns both Exynos and FSD has completely
different architecture (at least at HW level)."
https://lore.kernel.org/all/07ce01d8091e$9a6fd9c0$cf4f8d40$@samsung.com/

>> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
>> IMO the SoC compatible string should be uniquely identifying the actual
>> SoC, not a close relative.
>>
>> Regarding product_id you are correct this reads 0x09845000 but even
>> within Samsung Exynos family there are examples where the register
>> value does not match the SoC compatible. For example Exynos850 SoC
>> has a product ID value of "E3830". Where the Linux compatible is
>> matching the Samsung marketing name, not the internal/outdated name.
> 
> I did not know Exynos 850 is also not going under it's real name. 
> Ultimately, I believe all of those SoCs should go under their technical 
> name in the exynos/ directory.

The initial technical name does not exist outside of vendor sources and
part name. E.g. Winlink E850 board hardware manual calls it:
"Samsung Exynos 850, S5E3830"
and everywhere else Exynos 850 SoC is used.

If you start calling it Exynos 3830, only me and Sam (who mainlined it)
would know what is it. Everyone else, all users of kernel, would be
confused.

Therefore using well known final product name is for Exynos850 reasonable.

> 
> Another concern is that Google could in the future license other SoC: be 
> it Qualcomm, Nvidia or anything. If we put completely different hw under 
> google/ directory, does it really make sense? In that case, who'll 
> maintain the google/ directory? Exynos people? Qualcomm people if they 
> license it? Some other people?

That's indeed a problem. Future Tesla SoC might have just few pieces
similar to FSD. There would be no common SoC part, except the actual
Tesla IP.

Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
different than GS101 and the only common part would be the TPU (Tensor).

So now let's decide what is the common denominator:
1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.

> 
> Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma" 
> in decompiled kernel modules as far as I see.
> 
> Finally, Tesla people already tried to submit drivers called by Tesla 
> name, but which basically copied the functionality of the Exynos 
> drivers. We would want to avoid that, ideally.
> 
> My opinion is that all the Tesla and Google SoCs should be in the 
> exynos/ directory, not only because they are basically Samsung Exynos, 
> but also because they don't really need a separate directory: neither 
> Google nor Tesla didn't neither manufacture or design those SoCs from 
> scratch. The only reason I can think of for them to have it in a 
> separate directory is maybe because Google and Tesla actually paid 
> Samsung money for the right to call Exynos "Google designed" SoCs, but I 
> believe the kernel should be left out of that.

For some reason, although I know which, Cc-list is here trimmed and
misses Alim...

So standard reply follow (it makes me really, really grumpy, because it
means you develop on some crazy old kernel or do not use tools which
automate the process):

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Best regards,
Krzysztof

