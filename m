Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B537E0412
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 14:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjKCN42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 09:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjKCN4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 09:56:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F85FD43
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 06:56:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507ad511315so2967389e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lpnu-ua.20230601.gappssmtp.com; s=20230601; t=1699019777; x=1699624577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OvSla+pQAa35HO20KfgCi3+tdVFMt27FXkqNTTyCsmE=;
        b=gfQg3rj/SitDPe0gF7vVuMT0Wx/n+NGTkBhTc5CY9h/r3SVz+GxgNgtYkKbrySuzT9
         t5sHXgz9EwGZ43pP3Uhu1F2qCK7qoCgyb0Aij/Rf7AhBPszQbcb7l5uzAfI07sk6WA8a
         f0VZX0WLYhJPwMyDdoh+G+nrqyQBYFHBPnAHHCU/lOG7cPWqyCzg2hPP+jqaDm1OLRCQ
         TmoNbbwH/8ixHpPgJo/OtHji5Dqzd4oIxNUwHsJbsknPnSiBwJYpdJHuWB+7PCTD77Gy
         qbvjjrDPXAvN8bMj2Vr3KNRrSiT9gqWClRjQdRKmjTl0+MY7uar68oEWYB0E4sZ21DKh
         86RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019777; x=1699624577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvSla+pQAa35HO20KfgCi3+tdVFMt27FXkqNTTyCsmE=;
        b=V393ppMxNojeBJdPNkU7xruZU4WkOZwse0tXZkS9lDtr3b47mhyaazz5A73zc/Sijg
         RnPXEoy4CzQFb46QdbBDfGzNyy3GFdT3Db8I0aBigrgPCTKP2G+kCRSGhokEkPPOLGFs
         L8k+Zo9qAS4h05YQkWvK5GCS2pisq+9TMF/xJ1sfFjR8dUNWM1wN4ooW2IyLWURuU8eM
         zekKzTR23H+yPoCne7FOjorvG5OOfCaS5GTkVckz1qAukgCr4Mr/Xg0PI3kUrGxSw79o
         BZhjnmKzUd4ZUEAp1G2ACP71p1n1cDBA+0EH0+dks8KpNlHRgE1tgGkHXnzPLwNIPaWz
         8OpA==
X-Gm-Message-State: AOJu0YzcJkl+HtoMprViuRid0QcSmMba3S+7W4o/58+VT7hd3i1U0miL
        17onZqo2DGLpU4xUN/OsjhCmIA==
X-Google-Smtp-Source: AGHT+IGTMM3f+Kot7bRs0sqvIQifr5/Epix+gjRp4Zzqkcwb2Ezbe0Y180HOL7xZN/rHY+vNJvbW1g==
X-Received: by 2002:a19:f70c:0:b0:503:3278:3221 with SMTP id z12-20020a19f70c000000b0050332783221mr15089544lfe.69.1699019776704;
        Fri, 03 Nov 2023 06:56:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.54.67.136])
        by smtp.gmail.com with ESMTPSA id bx25-20020a0564020b5900b0053ed70ebd7csm984031edb.31.2023.11.03.06.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:56:16 -0700 (PDT)
Message-ID: <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
Date:   Fri, 3 Nov 2023 15:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Peter Griffin <peter.griffin@linaro.org>
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
        kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
Content-Language: en-US
From:   Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>
In-Reply-To: <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Peter,

On 11/3/23 15:11, Peter Griffin wrote:
> Hi Maksym,
>
> Thanks for your feedback.
>
> On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> <maksym.holovach.an.2022@lpnu.ua> wrote:
>> Hi, all
>>
>> I wanted to inquire about how do you all feel about calling this SoC by
>> the Google "gs101" name.
> Interesting question, I think calling it gs101 is the correct approach see
> below for my rationale.
>
>> I believe the proper name for it should be the actual Samsung name,
>> written in the silicon and reported in the Chip ID hardware: Exynos9845.
>> This also touches the Tensor G2 (Exynos9855), Tensor G3 (Exynos9865),
>> and possibly the "Tesla" SoCs.
>>
>> I do not think the Linux kernel should be a marketing material: it
>> should reflect reality. The chip is almost 100% composed of Samsung
>> Exynos IP blocks and should be called that way.
> As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> Exynos designs and support upstream uses the axis,artpec8* or tesla,fsd*
> compatibles.
>
> So using google,gs101 is consistent with the existing upstream naming
> scheme, for customized ASICs that were based off a Exynos design. But
> it also reflects the reality that this SoC is not a Exynos9845 as there is
> also a lot of Google owned and other third party IP integrated that is not
> found in Exynos9845.

A quick question: Do you imply Exynos9845 exists outside of the context 
of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.

Also, what kind of Google IP are you talking about? I believe only the 
neural accelerator should be custom-ish.

Additionally, I believe it having or not having Google IP is irrelevant: 
for example, the new Raspberry Pi 5 Broadcom SoC has a lot of 
Raspberry's own IP, but it's still called Broadcom as it's the real 
manufacturer and designer of the chip.

>
> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
> IMO the SoC compatible string should be uniquely identifying the actual
> SoC, not a close relative.
>
> Regarding product_id you are correct this reads 0x09845000 but even
> within Samsung Exynos family there are examples where the register
> value does not match the SoC compatible. For example Exynos850 SoC
> has a product ID value of "E3830". Where the Linux compatible is
> matching the Samsung marketing name, not the internal/outdated name.

I did not know Exynos 850 is also not going under it's real name. 
Ultimately, I believe all of those SoCs should go under their technical 
name in the exynos/ directory.

Another concern is that Google could in the future license other SoC: be 
it Qualcomm, Nvidia or anything. If we put completely different hw under 
google/ directory, does it really make sense? In that case, who'll 
maintain the google/ directory? Exynos people? Qualcomm people if they 
license it? Some other people?

Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma" 
in decompiled kernel modules as far as I see.

Finally, Tesla people already tried to submit drivers called by Tesla 
name, but which basically copied the functionality of the Exynos 
drivers. We would want to avoid that, ideally.

My opinion is that all the Tesla and Google SoCs should be in the 
exynos/ directory, not only because they are basically Samsung Exynos, 
but also because they don't really need a separate directory: neither 
Google nor Tesla didn't neither manufacture or design those SoCs from 
scratch. The only reason I can think of for them to have it in a 
separate directory is maybe because Google and Tesla actually paid 
Samsung money for the right to call Exynos "Google designed" SoCs, but I 
believe the kernel should be left out of that.

>
> regards,
>
> Peter.
>
>
>
>> Yours,
>>
>> - Markuss
>>
>> On 10/11/23 01:49, Peter Griffin wrote:
>>> Hi folks,
>>>
>>> Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
>>> the review feedback received so far.
>>>
>>> This series adds initial SoC support for the GS101 SoC and also initial board
>>> support for Pixel 6 phone (Oriole).
>>>
>>> The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
>>> (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
>>> As you can see from the patches the SoC is based on a Samsung Exynos SoC,
>>> and therefore lots of the low level Exynos drivers can be re-used.
>>>
>>> The support added in this series consists of:
>>> * cpus
>>> * pinctrl
>>> * some CCF implementation
>>> * watchdog
>>> * uart
>>> * gpio
>>>
>>> This is enough to boot through to a busybox initramfs and shell using an
>>> upstream kernel though :) More platform support will be added over the
>>> following weeks and months.
>>>
>>> Note 1: I've removed the dtbo overlay from v2 submission and will re-submit once
>>> I have appropriate documentation for it.
>>>
>>> Note 2: I've left the bootargs in dts with earlycon for now, for two reasons.
>>> 1) The bootloader hangs if bootargs isn't present in the dtb as it tries to
>>> re-write this with additional bootargs.
>>> 2) there is a issue whereby the full serial console doesn't come up properly
>>> if earlycon isn't also specified. This issue needs further investigation.
>>>
>>> Note 3: In `dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible`
>>> I tried to narrow the interrupts check to google,gs101-pinctrl but I still see
>>> a warning:
>>> gs101-oriole.dtb: pinctrl@174d0000: interrupts: [[0, 0, 4],[..] is too long
>>>
>>> If anyone can educate me on what I've done wrong here it would be most
>>> appreciated!
>>>
>>> kind regards,
>>>
>>> Peter.
>>>
>>> Changes since v1:
>>>    - Remove irq/gs101.h and replace macros with irq numbers globally
>>>    - exynos-pmu - keep alphabetical order
>>>    - add cmu_apm to clock bindings documentation
>>>    - sysreg bindings - remove superfluous `google,gs101-sysreg`
>>>    - watchdog bindings - Alphanumerical order, update gs201 comment
>>>    - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google SoC
>>>    - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
>>>    - samsung,pinctrl- add google,gs101-wakeup-eint compatible
>>>    - clk-pll: fixup typos
>>>    - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,gate)
>>>    - clk-gs101: fix alphabetical order
>>>    - clk-gs101: cmu_apm: fixup typo and missing empty entry
>>>    - clk-gs101: cmu_misc: remove clocks that were being registerred twice
>>>    - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON bitfield
>>>    - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins as well
>>>    - pinctrl: gs101: rename bank_type_6/7 structs to be more specific, split from filter
>>>    - watchdog: s3c2410_wdt: remove dev_info prints
>>>    - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node name, blank lines
>>>      add SoC node, split dts and dtsi into separate patches, remove 'DVT' suffix
>>>    - gs101-oriole.dtso: Remove overlay until board_id is documented properly
>>>    - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
>>>    - gpio-keys: update linux,code to use input-event-code macros
>>>    - add dedicated gs101-uart compatible
>>>
>>> Peter Griffin (20):
>>>     dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
>>>     dt-bindings: clock: Add Google gs101 clock management unit bindings
>>>     dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG
>>>       compatibles to GS101
>>>     dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
>>>     dt-bindings: arm: google: Add bindings for Google ARM platforms
>>>     dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
>>>     dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
>>>     dt-bindings: serial: samsung: Add google-gs101-uart compatible
>>>     clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
>>>     clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
>>>     clk: samsung: clk-gs101: add CMU_APM support
>>>     clk: samsung: clk-gs101: Add support for CMU_MISC clock unit
>>>     pinctrl: samsung: Add filter selection support for alive banks
>>>     pinctrl: samsung: Add gs101 SoC pinctrl configuration
>>>     watchdog: s3c2410_wdt: Add support for Google tensor SoCs
>>>     tty: serial: samsung: Add gs101 compatible and SoC data
>>>     arm64: dts: google: Add initial Google gs101 SoC support
>>>     arm64: dts: google: Add initial Oriole/pixel 6 board support
>>>     arm64: defconfig: Enable Google Tensor SoC
>>>     MAINTAINERS: add entry for Google Tensor SoC
>>>
>>>    .../devicetree/bindings/arm/google.yaml       |   46 +
>>>    .../bindings/clock/google,gs101-clock.yaml    |  125 +
>>>    .../samsung,pinctrl-wakeup-interrupt.yaml     |    2 +
>>>    .../bindings/pinctrl/samsung,pinctrl.yaml     |   19 +
>>>    .../bindings/serial/samsung_uart.yaml         |    2 +
>>>    .../bindings/soc/samsung/exynos-pmu.yaml      |    2 +
>>>    .../soc/samsung/samsung,exynos-sysreg.yaml    |    6 +
>>>    .../bindings/watchdog/samsung-wdt.yaml        |   10 +-
>>>    MAINTAINERS                                   |   10 +
>>>    arch/arm64/Kconfig.platforms                  |    6 +
>>>    arch/arm64/boot/dts/Makefile                  |    1 +
>>>    arch/arm64/boot/dts/google/Makefile           |    4 +
>>>    arch/arm64/boot/dts/google/gs101-oriole.dts   |   79 +
>>>    arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1275 ++++++++++
>>>    arch/arm64/boot/dts/google/gs101-pinctrl.h    |   32 +
>>>    arch/arm64/boot/dts/google/gs101.dtsi         |  503 ++++
>>>    arch/arm64/configs/defconfig                  |    1 +
>>>    drivers/clk/samsung/Kconfig                   |    9 +
>>>    drivers/clk/samsung/Makefile                  |    2 +
>>>    drivers/clk/samsung/clk-gs101.c               | 2164 +++++++++++++++++
>>>    drivers/clk/samsung/clk-pll.c                 |    9 +-
>>>    drivers/clk/samsung/clk-pll.h                 |    3 +
>>>    .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  163 ++
>>>    drivers/pinctrl/samsung/pinctrl-exynos.c      |   84 +-
>>>    drivers/pinctrl/samsung/pinctrl-exynos.h      |   41 +
>>>    drivers/pinctrl/samsung/pinctrl-samsung.c     |    4 +
>>>    drivers/pinctrl/samsung/pinctrl-samsung.h     |   24 +
>>>    drivers/tty/serial/samsung_tty.c              |   12 +
>>>    drivers/watchdog/s3c2410_wdt.c                |  104 +-
>>>    include/dt-bindings/clock/google,gs101.h      |  232 ++
>>>    30 files changed, 4961 insertions(+), 13 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
>>>    create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>>    create mode 100644 arch/arm64/boot/dts/google/Makefile
>>>    create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>>>    create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>>>    create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>>>    create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
>>>    create mode 100644 drivers/clk/samsung/clk-gs101.c
>>>    create mode 100644 include/dt-bindings/clock/google,gs101.h
>>>
- Maksym

