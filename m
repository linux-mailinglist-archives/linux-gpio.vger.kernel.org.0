Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801353E54AA
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 09:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhHJH43 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 03:56:29 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50488 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237712AbhHJH4E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 03:56:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210810075540euoutp01811aaca16ae1b410d2f1bcf37513afcd~Z4tP9ReDx1115711157euoutp01D
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 07:55:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210810075540euoutp01811aaca16ae1b410d2f1bcf37513afcd~Z4tP9ReDx1115711157euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628582140;
        bh=VeRFKSxzvKpp1y//P/JPPiQIsMJu74pFw5ZDgXW9bX0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=btjfF1BgUsFiyyXHBLyOionZUAUTvabtlxSdaV+8EINtdjk9HTrLg0ON0JXeglFWk
         fLbL6KCAt5fkQutpMNU5AzCOs0s1bnI8ZmdBzfTEong/TNKyNgYXMdpxKZoqkNv9YA
         XH/lp/BrY6NNv/XjdN74q5Wl+sE+R1HgzowXR6WQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210810075539eucas1p266514336f5ec6979029c4a641c527ff1~Z4tPU3EfV2486224862eucas1p2E;
        Tue, 10 Aug 2021 07:55:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1D.10.56448.BF032116; Tue, 10
        Aug 2021 08:55:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210810075539eucas1p2e444e70ef5d7acbd4af9ad0479e11a09~Z4tOsoygI2987429874eucas1p24;
        Tue, 10 Aug 2021 07:55:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210810075539eusmtrp2fbf7493e9a3b0b0207fd97bc52baabfe~Z4tOradcE2391623916eusmtrp2N;
        Tue, 10 Aug 2021 07:55:39 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-de-611230fb30eb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.64.31287.AF032116; Tue, 10
        Aug 2021 08:55:38 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210810075537eusmtip12fdb1e043caa6df4382b8e946896443d~Z4tNQWFjt3253232532eusmtip1g;
        Tue, 10 Aug 2021 07:55:37 +0000 (GMT)
Subject: Re: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <bb69e79d-55a8-2090-e51c-fdfea755cf99@samsung.com>
Date:   Tue, 10 Aug 2021 09:55:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=-uUcoLCjjBAC2K5NLswnXGXW1qrsTJrb_uZDgOQ5Ehw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjHeU/bc06LhUPpxmtVnJ0mc4sgkbCXyAhksh0TP2zTObtkuE7O
        Chm3teJlY7GkKwHHzcsCFkiJInYNowNaWIt0QtAGYVayithxmQPDYKlA2kVcuYz2YMa3//M8
        v/9zSR6SI6rAJWRW7klGmSvPluICbsed5849/r0i+d5vn+xE84arAK1cHiHQQ980D+n77vGQ
        5poJR0/rt6JB/x7U6lnE0OWlGxhqmxzmoYWycR5q1y8B9JutDkc1TjuGBq+VE8ha189DQ3fT
        0KKjgoO03X0E+n7RjaOV4VYumq5Yw+6OeQnkGizBkNG2BFI203MjWoLWqctx2qobI+g2YylO
        jw7fxOlf6psJur3xHD1zwY/TFWYjoL1t0e8JPhYkZTDZWacYZWzyp4LMGZeTl28KP6PtiVCD
        +k3nAZ+EVDxsMXbj54GAFFEGAOvvD2Fs4AOw/3EXhw28AF5ZXuW+sDS3ewi2cANAnWV83bIA
        YMuzWSxARVIH4ZhNywtoMZUFn/bMcwMQh9KR8Ja5JdgKp+Jg+e0KENBCKhlW3SoNGrjULtg6
        /zDY6CXqBBwdmMNZJgL2X5kKevnU+7D6L12Q4VBR0D2lX9fbYaenLrg3pFb4sLKkAWf3PgDv
        P+gkWB0JZx3mdb0Vrlr1GGvQAFjW9TvBBlUATjgaAEvth6P3/l3rRK6N2A1Ntlg2nQp13kFu
        IA2pMDjiiWCXCIMXO6o5bFoIS4pFLL0T+o3VGKsl8LupVW4VkOo2nKbbcI5uwzm6/+c2AK4R
        RDEFqhwFo9qXy5yOUclzVAW5ipgTeTltYO1lB1Yc//wMDLMLMb0AI0EvgCRHKhZao0VykTBD
        fvYrRpl3XFmQzah6wRaSK40S2izNx0WUQn6S+YJh8hnliypG8iVqjDS9Fh8a63ncaAkrC0uS
        GW6T2tLtz7dNtlea7OciMtJlMiLUH77vj/TEQ0eKpJtkd7rfkmHEG8uRAxrx3xkG669pVw8X
        N+2YqA5xvSk58CH+6CAq/vqnhHKZzSPuTpc0/hmameT+pMlyNmoy/xXzg2PhffOhS2LFzRr4
        6sWYtGdvH7o+kVh7+kt1zWbncJH9xxC0I1rT61E1PkrY8nmSmHzZjX22XHiMEM/5Urb9UGSb
        MqvFH9hT9c5Z95mWWu9R2pFjF0iPSvuS/YUmn8UbUli5v2t3gqZJIfFdmOF/lJoYP9TpNPa8
        e2lX85N3xqexlG+kcZkdtdfzTmldlnHXpJSrypTHvc5RquT/AQsHbmohBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xu7q/DIQSDRr/m1l8WLGI0eLflBvs
        Fte/PGe1mH/kHKtF8+L1bBbv5spYnPmta7Hx7Q8miyl/ljNZbHp8jdXiY889VovN8/8wWlze
        NYfNYsb5fUwWZxb3slvsnHOS1eLiKVeLH8f7mC1a9x5ht5j64xabxb9rG1ksnvcBlZ26+5nd
        4sqZDiaLVbv+MDpIery/0cruMauhl81j56y77B6bVnWyedy5tofNY//cNewem5fUe7yc+JvN
        o2/LKkaPz5vkArii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMy
        y1KL9O0S9DJeXjnPWrCev6L1oGAD41yeLkZODgkBE4k1m9+ydzFycQgJLGWU2Nl4nbGLkQMo
        ISUxv0UJokZY4s+1LjYQW0jgPaNE0zc5EFtYwFPi7q5WVhBbRCBTYvL9FrA5zAILOCSWnN7N
        CDH0OJPEsb5GRpAqNgFDid6jfWA2r4CdxIQDnWDdLAKqEhs/XGcCsUUFkiX6vkyAqhGUODnz
        CQuIzSkQKDH9xSywGmYBdYk/8y4xQ9jiEreezIeKy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsC
        RpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgQll27Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHe
        nXJCiUK8KYmVValF+fFFpTmpxYcYTYH+mcgsJZqcD0xpeSXxhmYGpoYmZpYGppZmxkrivFvn
        rokXEkhPLEnNTk0tSC2C6WPi4JRqYFr7zsH3y932v6077OK7Arb73Z1xa1//l7b40He6TLaL
        wlfkzlD8tsLkOCsDj4ZWydrT6wqjpGu33I1la234uUDxyXH/fwffKjxOzk95wnRrf6n0mWDL
        649sXf/f/7nnzA71W34XkpWD3DsTn24UZdeZXMdrqrhvqvrrbxV+Bl/7w+oad8ipLeKqt33+
        40jM094VUay2KmpG8U1LE/MS524+qrvunuPUjN7YbZe7V4U2FjDYz+y8oPs/Zmp6iOgFP5Pv
        E/0vvFR3+Pnu/8c3Dyc2cB/Mep0uV/WyY+etnFiBmgeWLPOFbX8tXi45SadHR9pmA/tmKznx
        W/VzlVzvV301KZ1Ursp5+97WZX9dVJRYijMSDbWYi4oTAQ1zxqexAwAA
X-CMS-MailID: 20210810075539eucas1p2e444e70ef5d7acbd4af9ad0479e11a09
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210809194915eucas1p19999295aef3127f95ffe4c75a8acc63f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210809194915eucas1p19999295aef3127f95ffe4c75a8acc63f
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
        <20210806152146.16107-8-semen.protsenko@linaro.org>
        <3add6f87-7293-e1ae-8f9e-c69e9de18cf5@canonical.com>
        <CGME20210809194915eucas1p19999295aef3127f95ffe4c75a8acc63f@eucas1p1.samsung.com>
        <CAPLW+4=-uUcoLCjjBAC2K5NLswnXGXW1qrsTJrb_uZDgOQ5Ehw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09.08.2021 21:48, Sam Protsenko wrote:
>>> +/* Will be extracted to bindings header once proper clk driver is implemented */
>>> +#define OSCCLK               1
>>> +#define DOUT_UART    2
>>> +#define CLK_NR_CLKS  3
>>> +
>>> +/* Fixed rate clocks generated outside the SoC */
>>> +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
>>> +     FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
>>> +};
>>> +
>>> +/*
>>> + * Model the UART clock as a fixed-rate clock for now, to make serial driver
>>> + * work. This clock is already configured in the bootloader.
>>> + */
>>> +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
>>> +     FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
>>> +};
>>> +
>>> +static const struct of_device_id ext_clk_match[] __initconst = {
>>> +     { .compatible = "samsung,exynos850-oscclk" },
>>
>> One more thing - I am not sure anymore if this is correct. AFAIR, we
>> wanted to drop compatibles for external clocks.
>>
> I'll remove oscclk from the clock driver and device tree. It's not
> needed right now anyway, as that driver is just a stub.
> 
> But I'd still like to know the proper way to define external clocks. I
> can see that in exynos7.dtsi and exynos5433.dtsi there is just regular
> fixed clock defined for "oscclk" (or "fin_pll"), and then that clock
> is referenced in corresponding clock driver by its
> 'clock-output-names' property. I guess that approach is the
> recommended one?

Yes, we should use generic "fixed-clock" in DT to model the external
root clock. Registering the external clock from within the CMU driver
is a legacy method that predates generic "fixed-clock" and should be
avoided.  

That said I think this temporary stub driver is not needed at all, 
you could well define a fixed clock in DT and reference it in the UART 
node, as Krzysztof suggested.

--
Regards, 
Sylwester
