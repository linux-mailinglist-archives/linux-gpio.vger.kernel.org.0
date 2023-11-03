Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5317E0C31
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Nov 2023 00:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjKCXXj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 19:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjKCXXj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 19:23:39 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E6CD48
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 16:23:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso402346666b.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lpnu-ua.20230601.gappssmtp.com; s=20230601; t=1699053812; x=1699658612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jks6FbhmSs4hzvNZcgvuDZWpF6B0QuBWFBpuktgtGik=;
        b=FxnHrV7+yQzlYDc5EoqivV0yrEdlJOCj9QCqNMlLa9OH3AO4O1biZkiYNfC4l8pa0w
         LPEmgXTJosUGBiV3P0IxuunrefBox92gHI57Z4UZPrkExF1/c8Egfm2tLjwALFO73rlz
         2y+D9iaEBicM6mA4lLR1j9ic2dQB7zNEPYWy97hgewkONTI3Ju5subF6x0APw7LbUW3v
         NOxTgTRLiKFkSv3gZXd2JQm/+IGNyUQEcOInSCMsOq1EdJBJfRSLfDetSUFtg2GNLZar
         e/wes7cEPUAINdRR96ZL2Is81oz8uQCUpVnRjikom0YzWFQ/zs7OOH4QSHahtvVDHP0E
         wMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699053812; x=1699658612;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jks6FbhmSs4hzvNZcgvuDZWpF6B0QuBWFBpuktgtGik=;
        b=B/VglWL69NR8MExE82majIdPG0hZEOjRHqSBx31vAJLwqKXx+gfyO+c2dYGNrvIo12
         R/YuYVLUY8UpWtuef+nTGS/VecNABUcd0kqNs85dv6NIZ+YoisnqX6peWoGLvc/hHw9v
         TvxeNauevAtU7od02hUQyi/h8wXAjCIsVP8oU8zp+YjsXU7TGNGJVE5eLiNXQf5c+ZfC
         klsXL4ZHS2FO1Q9duijR2Bo4GeZxyf8nNKgE1IiZMXqe8MRrYW0yHsAHC2xV6Bvc5rPW
         NwhxWmYyeLMvE+gLRyP9ZQDeAyxqpiTmAC9OVrH9FEygopH9lyasQHIrOWM3nLm2932Q
         vKHA==
X-Gm-Message-State: AOJu0Yw1G0LtE+OVQ5gmhEMUb5og1oxPsXft9AZ3ZVy0YD6/CqtkOqSb
        SSGmwSsixef1yX3i9H1N8wqleg==
X-Google-Smtp-Source: AGHT+IGNyUpRdFW5cP+irHLFj7Flx7W1VqIMHELqVFyYiE8rlElERYr9I8TZ4ofT/8OLAKyFUnbBhQ==
X-Received: by 2002:a17:907:3f20:b0:9ae:41db:c27f with SMTP id hq32-20020a1709073f2000b009ae41dbc27fmr8233065ejc.10.1699053811874;
        Fri, 03 Nov 2023 16:23:31 -0700 (PDT)
Received: from [192.168.1.3] ([37.54.67.136])
        by smtp.gmail.com with ESMTPSA id fx2-20020a170906b74200b0099bd7b26639sm1385819ejb.6.2023.11.03.16.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 16:23:31 -0700 (PDT)
Message-ID: <1b30846e-934a-4ab7-bdaf-c4dba933bc9d@lpnu.ua>
Date:   Sat, 4 Nov 2023 01:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Content-Language: en-US
From:   Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
To:     William McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <ZUUvp3kqM7NPlyZ_@google.com> <ccb94ff1-d4df-4c18-9c21-a887ad701479@lpnu.ua>
In-Reply-To: <ccb94ff1-d4df-4c18-9c21-a887ad701479@lpnu.ua>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I believe I misunderstood your point, and now that I'm reading it again 
I believe grouping device trees based on device manufacturer is 
definitely an interesting idea and it would definitely make sense for 
e.g. x86, where there's basically two big SoC vendors and all the DTBs 
for the motherboards in just those two folders would result in 
cluttering issues, however it is not currently done in arm64/boot/dts, 
where the subfolders are per-platform (exynos, qcom, mtk, tegra, ...) - 
with an exception of Tesla, which perhaps should be also corrected (also 
CONFIG_ARCH makes it clear what those directory names are actually meant 
to represent).

If you think the current approach should be changed, it should be 
changed for all device-trees, and the CONFIG_ARCH_* should be also 
renamed, but also we'd need to convince everyone that this approach is 
superior to others...

Maybe the solution to this is to have arch/arm64/boot/dts/exynos/google 
with Google's boards, and to have the SoC .dtsi files in 
arch/arm64/boot/dts/exynos, but I'm not sure.

Additionally, I believe using .dtbo files like that (per board variant) 
is not really expected, instead each board should have its own .dtb 
file, compiled from a board .dts file which includes the SoC .dtsi file 
but this is not up to me to judge...

On 11/4/23 01:05, Maksym Holovach wrote:
> Hi William,
>
> On 11/3/23 19:36, William McVicker wrote:
>> Hi Maksym, Krzysztof, Peter,
>>
>> On 11/03/2023, Krzysztof Kozlowski wrote:
>>> On 03/11/2023 14:56, Maksym Holovach wrote:
>>>> Hi Peter,
>>>>
>>>> On 11/3/23 15:11, Peter Griffin wrote:
>>>>> Hi Maksym,
>>>>>
>>>>> Thanks for your feedback.
>>>>>
>>>>> On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
>>>>> <maksym.holovach.an.2022@lpnu.ua> wrote:
>>>>>> Hi, all
>>>>>>
>>>>>> I wanted to inquire about how do you all feel about calling this 
>>>>>> SoC by
>>>>>> the Google "gs101" name.
>>>>> Interesting question, I think calling it gs101 is the correct 
>>>>> approach see
>>>>> below for my rationale.
>>>>>
>>>>>> I believe the proper name for it should be the actual Samsung name,
>>>>>> written in the silicon and reported in the Chip ID hardware: 
>>>>>> Exynos9845.
>>>>>> This also touches the Tensor G2 (Exynos9855), Tensor G3 
>>>>>> (Exynos9865),
>>>>>> and possibly the "Tesla" SoCs.
>>>>>>
>>>>>> I do not think the Linux kernel should be a marketing material: it
>>>>>> should reflect reality. The chip is almost 100% composed of Samsung
>>>>>> Exynos IP blocks and should be called that way.
>>>>> As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
>>>>> Exynos designs and support upstream uses the axis,artpec8* or 
>>>>> tesla,fsd*
>>>>> compatibles.
>>>>>
>>>>> So using google,gs101 is consistent with the existing upstream naming
>>>>> scheme, for customized ASICs that were based off a Exynos design. But
>>>>> it also reflects the reality that this SoC is not a Exynos9845 as 
>>>>> there is
>>>>> also a lot of Google owned and other third party IP integrated 
>>>>> that is not
>>>>> found in Exynos9845.
>>>> A quick question: Do you imply Exynos9845 exists outside of the 
>>>> context
>>>> of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
>> Yes, the gs101 SoC is *not* equivalent to the Exynos9845. Similar to 
>> how Tesla
>> FSD licenses Exynos IP blocks, gs101 does not only comprise of Exynos IP
>> blocks. The final design is unique to Google and comprises of several 
>> different
>> vendor IP blocks (not only Exynos).
>>
>>>> Also, what kind of Google IP are you talking about? I believe only the
>>>> neural accelerator should be custom-ish.
>>>>
>>>> Additionally, I believe it having or not having Google IP is 
>>>> irrelevant:
>>>> for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
>>>> Raspberry's own IP, but it's still called Broadcom as it's the real
>>>> manufacturer and designer of the chip.
>>> That's a good argument. Indeed BCM2712 contains "New Raspberry
>>> Pi-developed ISP".
>>> https://www.raspberrypi.com/documentation/computers/processors.html
>>>
>>> There aren't many patches but GPU is still called brcm,2712.
>>>
>>> For Tesla FSD, there was discussion and output was not very consisting.
>>> First, the name itself was used for everything - SoC architecture, one
>>> given SoC and eventually the board.
>>> https://lore.kernel.org/all/5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com/ 
>>>
>>>
>>> Eventually the last part - board - was renamed to "Evaluation board",
>>> but I don't know how true or real it is.
>>>
>>> See also:
>>> "I would argue that if this SoC shares the pinctrl, clock, spi, adc,
>>> and timer implementation
>>> with Exynos, we should consider it part of the Exynos family,"
>>> https://lore.kernel.org/all/CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com/ 
>>>
>>>
>>> However it was also claimed:
>>>
>>> "AFA architecture is concerns both Exynos and FSD has completely
>>> different architecture (at least at HW level)."
>>> https://lore.kernel.org/all/07ce01d8091e$9a6fd9c0$cf4f8d40$@samsung.com/ 
>>>
>>>
>>>>> I guess the same is also true for `axis,artpec8` and `tesla,fsd` 
>>>>> SoCs.
>>>>> IMO the SoC compatible string should be uniquely identifying the 
>>>>> actual
>>>>> SoC, not a close relative.
>>>>>
>>>>> Regarding product_id you are correct this reads 0x09845000 but even
>>>>> within Samsung Exynos family there are examples where the register
>>>>> value does not match the SoC compatible. For example Exynos850 SoC
>>>>> has a product ID value of "E3830". Where the Linux compatible is
>>>>> matching the Samsung marketing name, not the internal/outdated name.
>>>> I did not know Exynos 850 is also not going under it's real name.
>>>> Ultimately, I believe all of those SoCs should go under their 
>>>> technical
>>>> name in the exynos/ directory.
>>> The initial technical name does not exist outside of vendor sources and
>>> part name. E.g. Winlink E850 board hardware manual calls it:
>>> "Samsung Exynos 850, S5E3830"
>>> and everywhere else Exynos 850 SoC is used.
>>>
>>> If you start calling it Exynos 3830, only me and Sam (who mainlined it)
>>> would know what is it. Everyone else, all users of kernel, would be
>>> confused.
>>>
>>> Therefore using well known final product name is for Exynos850 
>>> reasonable.
>> I agree with this. By using the final (well known) product SoC name 
>> -- gs101 --
>> other developers will be able to easily identify the particular SoC.
>>
>>>> Another concern is that Google could in the future license other 
>>>> SoC: be
>>>> it Qualcomm, Nvidia or anything. If we put completely different hw 
>>>> under
>>>> google/ directory, does it really make sense? In that case, who'll
>>>> maintain the google/ directory? Exynos people? Qualcomm people if they
>>>> license it? Some other people?
>> I don't understand why the architecture of the SoC would dictate 
>> which folder
>> to put the device tree files under. It makes more sense to group 
>> board DT files
>> together based on who distributes them. Having all the Pixel DT board 
>> files
>> together allows Google to create a single device tree binary per SoC 
>> coupled
>> with the set of device tree overlays per board variant (this is the 
>> dtbo.img)
>> to ship to all their devices. If you look at all the in-market Pixel 
>> devices
>> with Tensor SoCs, you will find that you could create one dtb 
>> (concatenate
>> gs101.dtb, gs201.dtb, and zuma.dtb) and one dtbo image for 10 devices 
>> which
>> significantly simplifies the maintenance, testing, and software 
>> distribution
>> for all 10 of those products.
>
> How is that relevant?
>
> I believe it is none of the kernel concerns, it's up to the user to do 
> whatever with the built .dtb files.
>
> Also I do not see an issue in having a file list of all the .dtbo 
> files you might want.
>>
>>> That's indeed a problem. Future Tesla SoC might have just few pieces
>>> similar to FSD. There would be no common SoC part, except the actual
>>> Tesla IP.
>>>
>>> Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
>>> different than GS101 and the only common part would be the TPU 
>>> (Tensor).
>>>
>>> So now let's decide what is the common denominator:
>>> 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
>>> and many IP blocks, which constitute 95% of Devicetree bindings and 
>>> drivers,
>>> 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
>> As mentioned above, I think this should be based on how the DTBs and 
>> DTBOs are
>> used and distributed. What is the benefit of adding the gs101 board 
>> files under
>> the exynos folder?
>
> One clear benefit would be the ease of maintaining all the SoC files 
> at once. It's not that it is a benefit of having it in the Exynos 
> folder, it's more like that there's no benefit in having a separate 
> folder, and that also comes with some additional issues.
>
> As I said earlier, it's pretty similar to the Raspberry Pi 5 example: 
> It contains Raspberry's in-house IP, but it's still called properly 
> Broadcom. The only difference is that Raspberry does not want its name 
> on the chip, but Google does, despite it being just as custom as the 
> Raspberry SoC is. The company's policy should not be a factor for this 
> decision, in my opinion.
>
> However as you've added, gs101 is the same thing as Exynos9845, so I 
> believe there's no question that the Exynos name should be specified 
> somewhere too, because this is what's literally wired in hardware, and 
> not just a "well-known name that is used by Google in the Pixel 
> factory kernel".
>
> I agree though that just specifying the internal E9845 name could 
> mislead some people, but GS101 is a similarly obscure name, and not 
> even the real name of the hardware.
>
>>
>> Thanks,
>> Will
>>
>>>> Then, I don't think Tensor G3 has a proper "GS" name, it goes by 
>>>> "Zuma"
>>>> in decompiled kernel modules as far as I see.
>>>>
>>>> Finally, Tesla people already tried to submit drivers called by Tesla
>>>> name, but which basically copied the functionality of the Exynos
>>>> drivers. We would want to avoid that, ideally.
>>>>
>>>> My opinion is that all the Tesla and Google SoCs should be in the
>>>> exynos/ directory, not only because they are basically Samsung Exynos,
>>>> but also because they don't really need a separate directory: neither
>>>> Google nor Tesla didn't neither manufacture or design those SoCs from
>>>> scratch. The only reason I can think of for them to have it in a
>>>> separate directory is maybe because Google and Tesla actually paid
>>>> Samsung money for the right to call Exynos "Google designed" SoCs, 
>>>> but I
>>>> believe the kernel should be left out of that.
>>> For some reason, although I know which, Cc-list is here trimmed and
>>> misses Alim...
>>>
>>> So standard reply follow (it makes me really, really grumpy, because it
>>> means you develop on some crazy old kernel or do not use tools which
>>> automate the process):
>>>
>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>> and lists to CC (and consider --no-git-fallback argument). It might
>>> happen, that command when run on an older kernel, gives you outdated
>>> entries. Therefore please be sure you base your patches on recent Linux
>>> kernel.
>>>
>>> Best regards,
>>> Krzysztof
>>>
> Yours,
>
> Maksym
>
Yours,

Maksym

