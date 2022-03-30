Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0054EC823
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 17:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348132AbiC3PYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 11:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348142AbiC3PYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 11:24:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90341193169
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 08:23:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id c7so3218553wrd.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=035VL1akDfA3rp4LH54Rc3G/U1HwVipvz0ZmdfyEOow=;
        b=HBNyPvECMaVw9sz7r7CfQ74AMIJrMRaExUtKfCpbiilPaQEkJtTikda78N1pZ4v9dd
         aCkPzzdpTnoqajJbTrX4nRyNznVVCQDFWx7A+F/oP399D1YgVe4Gn3+h4tYxGnt3NfyY
         MZbTAXyQT1I/jIWeXKdOvDqJiB9VW32bZGkm+gNe+Q/ubBEajExPVbFfV3JJuou0c+vw
         sYEGd/wBuN/RMkssawgqG9WbQ8yiw3oTt/r0JBFdyNSd/XQJPU4QiIHS/N4aI7wdW/3i
         Bf1gmZBSNBQGJyoHZIoy/RWTWrByfrgDPXQuEEZqtzRn7rd8oXXiAg0Zj+tPeWOUc1Sa
         Bj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=035VL1akDfA3rp4LH54Rc3G/U1HwVipvz0ZmdfyEOow=;
        b=IZ2GMzOuVS5+zXVtTjvusoJvk8e0XXeMJFe49X50NqO1i7fVZVFthlAydrn10ZC9En
         B4buPUyzG4xCs6YH6y5/wJOI9KsVk5C4Dbl9Azu4Nau+gcCxfe9r2x0SJF+BqBBgT45s
         mfkOpIQwBFGkegTKaY/Mp8WTB2PVZta12FXn2iyZZxCZvSVKLlMI8smZ49UVfJ+R+9Q1
         KO7yp7NLLarC8JAyhYn0eaXKboi9aPZwHEFZSKKQNxrHhhrkmlKanPfnpopBd8+FzRsh
         bhIYcsJrMhKnfstdyneuEjncdzY8mQaQmQK2kyz96G6uP+/gPlfSwrwd28RiDq1iQ9ce
         S/xg==
X-Gm-Message-State: AOAM530HvibD29GwRhQIvfOGW3G3736cFDxnCyOOiQmcblP1RPvDUh4z
        8/nkE33/4O6Z0LRdwFwas8C3Hw==
X-Google-Smtp-Source: ABdhPJwPO+9KqDC9OD9SVYuzhQrpd9w9wVAdCuyfdEX+Fx0MX21LDBTOjmjsuSvR25YetXYFuLlO1A==
X-Received: by 2002:adf:d1cf:0:b0:204:12b6:9f5 with SMTP id b15-20020adfd1cf000000b0020412b609f5mr96496wrd.249.1648653778974;
        Wed, 30 Mar 2022 08:22:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8? ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c410700b0038c72ef3f15sm4801683wmi.38.2022.03.30.08.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 08:22:58 -0700 (PDT)
Message-ID: <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
Date:   Wed, 30 Mar 2022 17:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        openbmc@lists.ozlabs.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
 <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
 <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/03/2022 11:18, Andy Shevchenko wrote:
> On Wed, Mar 30, 2022 at 11:09:11AM +0200, Neil Armstrong wrote:
>> On 30/03/2022 10:54, Geert Uytterhoeven wrote:
>>> On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
>>>>> On 29/03/2022 17:29, Andy Shevchenko wrote:
> 
> ...
> 
>>>>> What error do you hit ?
>>>>
>>>> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
>>>> 9 | #define REG_OUT "a"
>>>>     |                 ^~~
>>>
>>> Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
>>> renamed instead, as this is a generic header file that can be included
>>> anywhere, while the REG_{OUT,IN} definitions are only used locally,
>>> in the header file?
>>
>> Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
>> used in the headers inline functions:
>> ==============><==================================
>> diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
>> index ba88edd0d58b..139a4b0a2a14 100644
>> --- a/arch/x86/include/asm/arch_hweight.h
>> +++ b/arch/x86/include/asm/arch_hweight.h
>> @@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
>>   }
>>   #endif /* CONFIG_X86_32 */
>>
>> +#undef REG_IN
>> +#undef REG_OUT
>> +
>>   #endif
>> ==============><==================================
> 
> Can you submit a formal patch, please?

I'll submit it separately

> 
> 
> And I think it would be good to have my patch as well, so we do not depend on
> the fate of the other one.
> 

Yes sure

Thanks,
Neil
